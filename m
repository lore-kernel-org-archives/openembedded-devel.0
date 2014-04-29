Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4C39F61116
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 06:40:00 +0000 (UTC)
Received: from localhost.localdomain (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id 7EFC122D15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:40:00 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Apr 2014 08:39:49 +0200
Message-Id: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-browser][PATCH v2 0/4] Introduce EGL/GLES and component build patches for Chromium
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Apr 2014 06:40:03 -0000

This set of patches extends the chromium recipe to allow for EGL&GLESv2 based 2D rendering,
considerably improving performance. This also adds hardware-accelerated WebGL support.

Three new PACKAGECONFIG for chromium are introduced:

* "component-build" : If set, Chromium is built in component mode. Each subsystem of Chromium
  ends up in a separate shared object. The alternative is the regular mode, which links everything
  into one big binary. Component builds are useful for development and testing, and consumes
  significantly less RAM during building. It is essential when building Chromium on a 32-bit OS.

* "use-egl" : Ordinarily, Chromium will try to use GLX and regular (= Desktop) OpenGL for 2D
  acceleration. If that fails, software rendering is used. If use-egl is set, it will use EGL
  instead of GLX and OpenGL ES 2.0 instead of regular OpenGL. This is very useful if the
  target platform provides hardware acceleration for this API. Chromium will then render all 2D
  components as well as WebGL contents with hardware acceleration, Canvas being an exception
  (see below).

* "ignore-lost-context" : Without this flag, HTML Canvas will not be accelerated, even with the
  "use-egl" flag set. The reason for this is a conceptual problem: HTML Canvas expects the
  backing store of the canvas to persist until the web page goes away. But if the backing store
  is a GLES texture, then in theory the associated EGL context could get lost (for example, during
  a power management cycle), and the texture along with it. This violates requirements for canvas.
  So, one has to choose: either remain fully standards compliant, and have no acceleration, or
  have acceleration, and risk losing the Canvas content. Note that context losses do not happen on
  all platforms (they haven't been observed with Vivante GPUs for example, and internals of its
  galcore module do not show anything that could cause a lost context). But since these recipes
  do not depend on a specific platform, this option must be explicitely enabled.

Carlos Rafael Giani (4):
  chromium: Add component-build PACKAGECONFIG option
  chromium: Add variable to contain extra command-line arguments
  chromium: Add use-egl PACKAGECONFIG option
  chromium: Add ignore-lost-context PACKAGECONFIG option

 .../chromium/chromium/component-build.gypi         |  5 ++++
 recipes-browser/chromium/chromium/google-chrome    | 11 +++++---
 .../remove-linux-accel-canvas-from-blacklist.patch | 32 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_35.0.1883.0.bb   | 25 +++++++++++++++--
 4 files changed, 67 insertions(+), 6 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium/component-build.gypi
 create mode 100644 recipes-browser/chromium/chromium/remove-linux-accel-canvas-from-blacklist.patch

-- 
1.8.3.2


