Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2r7s-0002BE-GE
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 23:36:28 +0100
Received: by mail-ee0-f48.google.com with SMTP id t10so359311eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 14:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=dOy+Euo8svvKLdhBOc4IDfy+T89UKSRtPpvxSp5EtiQ=;
	b=yEnJ78XTiOdtOIxvjnOUXZjFs9mFFMsbV3SwPmpU4HZhV6qovFG8lvN7fwBWLr2jUR
	xwSZamKUy5X8gGi6ax89MR0LERSDxgKLb5TuEtMRQtJCEvwdB8wSgQNuyjsg9MNrWlEQ
	ynbLD/rI7rSwuh4EGeg4q0mqTXSlOtbVzaat0YKqktvdA8ee7rELMH3DNds1h1K9kx90
	t9pdgZvRbtfDAtGN9JaTNEL/phodixoGd/c1r7vYQQ0FO2TpelFsLGtqI5ylV1mSmfwj
	B1U0+NoGyu56VeJZl36WS1ChL5OG5PK9K7eZeVbbI6ByY8oy9hvprC5GU23Rtw1D2+kW
	JLEg==
X-Received: by 10.14.174.197 with SMTP id x45mr15158437eel.5.1360102838492;
	Tue, 05 Feb 2013 14:20:38 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q5sm33901931eep.11.2013.02.05.14.20.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 14:20:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2013 23:18:39 +0100
Message-Id: <1360102723-27891-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe-meta-systemd 1/5] xinput-calibrator: update to latest git commit
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
X-List-Received-Date: Tue, 05 Feb 2013 22:36:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A new option --no-timeout was introduced. Unfortunately it is not working as
expected and has to be fixed.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...vent-timeout-exit-when-no-timeout-is-used.patch |   82 ++++++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |    7 +-
 2 files changed, 87 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Prevent-timeout-exit-when-no-timeout-is-used.patch

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Prevent-timeout-exit-when-no-timeout-is-used.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Prevent-timeout-exit-when-no-timeout-is-used.patch
new file mode 100644
index 0000000..4cd29a6
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-Prevent-timeout-exit-when-no-timeout-is-used.patch
@@ -0,0 +1,82 @@
+From 5d404f02bfb9c6eabbbe93dea2a8eb7ed4fd07d6 Mon Sep 17 00:00:00 2001
+From: Jeff Lasslett <jeff.lasslett@gmail.com>
+Date: Wed, 9 Jan 2013 14:12:46 +1100
+Subject: [PATCH] Prevent timeout exit when --no-timeout is used
+
+Upstream-Status: Submitted [https://github.com/tias/xinput_calibrator/pull/45]
+
+---
+ src/gui/gtkmm.cpp |   30 ++++++++++++++++--------------
+ src/gui/x11.cpp   |   13 +++++++------
+ 2 files changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/src/gui/gtkmm.cpp b/src/gui/gtkmm.cpp
+index 32bb889..2f52e25 100644
+--- a/src/gui/gtkmm.cpp
++++ b/src/gui/gtkmm.cpp
+@@ -204,21 +204,23 @@ void CalibrationArea::redraw()
+ 
+ bool CalibrationArea::on_timer_signal()
+ {
+-    time_elapsed += time_step;
+-    if (time_elapsed > max_time) {
+-        exit(0);
+-    }
+-
+-    // Update clock
+-    Glib::RefPtr<Gdk::Window> win = get_window();
+-    if (win) {
+-        const Gdk::Rectangle rect(display_width/2 - clock_radius - clock_line_width,
+-                                 display_height/2 - clock_radius - clock_line_width,
+-                                 2 * clock_radius + 1 + 2 * clock_line_width,
+-                                 2 * clock_radius + 1 + 2 * clock_line_width);
+-        win->invalidate_rect(rect, false);
++    if (calibrator->get_use_timeout()) {
++        time_elapsed += time_step;
++        if (time_elapsed > max_time) {
++            exit(0);
++        }
++    
++        // Update clock
++        Glib::RefPtr<Gdk::Window> win = get_window();
++        if (win) {
++            const Gdk::Rectangle rect(display_width/2 - clock_radius - clock_line_width,
++                                     display_height/2 - clock_radius - clock_line_width,
++                                     2 * clock_radius + 1 + 2 * clock_line_width,
++                                     2 * clock_radius + 1 + 2 * clock_line_width);
++            win->invalidate_rect(rect, false);
++        }
+     }
+-
++    
+     return true;
+ }
+ 
+diff --git a/src/gui/x11.cpp b/src/gui/x11.cpp
+index db8a8a5..dfcd9fd 100644
+--- a/src/gui/x11.cpp
++++ b/src/gui/x11.cpp
+@@ -293,13 +293,14 @@ bool GuiCalibratorX11::on_expose_event()
+ 
+ bool GuiCalibratorX11::on_timer_signal()
+ {
+-    time_elapsed += time_step;
+-    if (time_elapsed > max_time) {
+-        exit(0);
+-    }
+-
+     // Update clock
+-    if(calibrator->get_use_timeout()){
++    if(calibrator->get_use_timeout()) {
++
++        time_elapsed += time_step;
++        if (time_elapsed > max_time) {
++            exit(0);
++        }
++
+         XSetForeground(display, gc, pixel[BLACK]);
+         XSetLineAttributes(display, gc, clock_line_width,
+                     LineSolid, CapButt, JoinMiter);
+-- 
+1.7.4.4
+
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 97f9343..b71daeb 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -9,8 +9,11 @@ PR = "r1"
 
 inherit autotools
 
-SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
+SRCREV = "e02de96acbe2fa5a57b0bda6821a053b1b123fd2"
+SRC_URI = " \
+    git://github.com/tias/xinput_calibrator.git;protocol=git \
+    file://0001-Prevent-timeout-exit-when-no-timeout-is-used.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.6.5



