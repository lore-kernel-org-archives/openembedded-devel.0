Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RrtMG-0004HQ-7k
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 16:41:28 +0100
Received: by eekd41 with SMTP id d41so1199746eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 07:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tLQHKy4tySQHR2AYALopbkEajK32MOLfbEyIFOLE0hE=;
	b=FxSwfNpcpOsDaNBU/KavfcpCQ6Yd1BUYuUl3mAKr1WSPf1YbWh/IDQa2W/fbDtxaf9
	QYXwIbEdLd8LIHbJvAIdaFRIzzHbcJED2TjNQbk7T+zS2FIkWrG9IN4SkkDqXkDF9Vbx
	/1Kfjg/6YAIJi92nsEl1W6FLztuLgw0Ejz9g4=
Received: by 10.14.3.134 with SMTP id 6mr5804899eeh.51.1327937615283;
	Mon, 30 Jan 2012 07:33:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm73849830eei.3.2012.01.30.07.33.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 07:33:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2012 16:33:26 +0100
Message-Id: <1327937606-22150-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <1327932996-3624-1-git-send-email-koen@dominion.thruhere.net>
References: <1327932996-3624-1-git-send-email-koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] udev-180: switch from git checkout to release tarball
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jan 2012 15:41:28 -0000

* problem is with manpage generation, commit
  http://git.kernel.org/?p=linux/hotplug/udev.git;a=commit;h=6528a3938fe8727b99b210cf504a335d07c94c37
  assumes that even without xstltproc we can install pregenerated
  manpages, but they are only in release tarball (e.g. src/udev.7)
  and without them, build system tries to regenerate and fails:

  /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/xsltproc -o src/udev.7 -nonet http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl src/udev.xml
  warning: failed to load external entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
  cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/udev/udev_180.bb |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_180.bb b/meta-oe/recipes-core/udev/udev_180.bb
index 4d3b0ed..4cabcce 100644
--- a/meta-oe/recipes-core/udev/udev_180.bb
+++ b/meta-oe/recipes-core/udev/udev_180.bb
@@ -19,12 +19,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 # kmod: needed for libkmod
 DEPENDS = "gperf-native usbutils acl glib-2.0 util-linux kmod"
 
-# f13289ffdf077f75c8710e977ffe538b66885762 -> 180 tag
-SRCREV = "f13289ffdf077f75c8710e977ffe538b66885762"
-
 # version specific SRC_URI
-SRC_URI = "git://git.kernel.org/pub/scm/linux/hotplug/udev.git;protocol=git \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/${P}.tar.gz \
            file://gtk-doc.make"
+SRC_URI[md5sum] = "7a74429e5b4d5cc3d389945774807e46"
+SRC_URI[sha256sum] = "d8f021cc940da7c1f928e2e651c6aa00c5695f3227f560de4a65584e2f089115"
 
 # generic SRC_URI
 SRC_URI += " \
@@ -32,8 +31,6 @@ SRC_URI += " \
        file://modprobe.rules \
 "
 
-S = "${WORKDIR}/git"
-
 # Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
 
 inherit autotools
-- 
1.7.8.4



