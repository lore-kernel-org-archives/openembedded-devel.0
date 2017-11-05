Return-Path: <pbarker@toganlabs.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A329F78379
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:08:24 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p96so6901474wrb.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sBqSvHjVvf+K57WyeJQkFhG9OuN++NKZw8NlgtsqHeY=;
	b=OkTuFNhTyaB4/LDPGuTK1TmE5d/3o9KnHk5noRVf1WLufjF+OXxCLYk7U6W5qglndw
	0K+KzPdApLwv2/HfGqQOQ/x5q5HDOUhIvuMYtp2NDG1EazJ333Ga+IM+ja7d8xJ2/jZW
	s9eq83F/U8Ddhbur2uGfDD4C5dlZQ0Q5fjv/c/I7TtiIp0mu1Uzxu5q+IotOZonD1VMP
	1pXDRhP1Dg/cb46wlLHZdhRWkLip+jJHsQLF20DACbP3CqUEsrXEByw9qmgfZ5hfUgDk
	59Xao9pLL2Qmq2PbrFBvdPO++2g2CcG1AATDwq3l5M5iUSuqP4TA88maomhPLwLQSX3Y
	wlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sBqSvHjVvf+K57WyeJQkFhG9OuN++NKZw8NlgtsqHeY=;
	b=hkQvxh3Vl3G8/fHWlA6sq0CSr2M/gz4PmWJaqPyoV2QaOF5M3z3V8YqdR9kRJz/Uh4
	ASwuW9zDwIYSRZQM5U5Ibr2ZISnUw9KdVqE/tTpiYEptLOCxnBAK3sf+9hrF0pLE8AfF
	YNB54n3owt8oN8ixNA+11/vHkTXPzk/FKCVg6IqS+E//2ZXFit49cEasdFNXEG4WS1ZP
	Eqx1h/o3/hDv0UdsbktS9c4/kbpfNIKoLemTzRo0Sg1kGzY7LM5Eyh1fV+5K5OTsz8c4
	WF2k78IDjbAhisD9GgE2zIkB2akazydlTzZI/aaAtVvM4Eo8WF0bNmNVC/xxef2DGFt7
	LAWA==
X-Gm-Message-State: AMCzsaX9A+TEx0ZStfUKrpLXRhn5kqvJqE38YiKnkYt/sLm/KVcuucim
	FF/U2ZxsYJckjz2hAEyISqg1BVrV
X-Google-Smtp-Source: ABhQp+S8a8r3M07hik2sogVH9wuvup/QY68oaXT7hQ3GjMazpfTApM4ng0dbnnIY0P1Z/+4MVV/ATQ==
X-Received: by 10.223.160.89 with SMTP id l25mr10343153wrl.56.1509919705179;
	Sun, 05 Nov 2017 14:08:25 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q124sm13845688wmg.18.2017.11.05.14.08.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Nov 2017 14:08:24 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 22:07:31 +0000
Message-Id: <1509919652-31388-8-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
References: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
Subject: [meta-oe][PATCH 7/8] tmux: Update to v2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Nov 2017 22:08:24 -0000

We can also switch to using a release archive.

The license checksum change is due to a change in the author's email address.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta-oe/recipes-extended/tmux/tmux_2.1.bb | 21 ---------------------
 meta-oe/recipes-extended/tmux/tmux_2.6.bb | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 21 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/tmux/tmux_2.1.bb
 create mode 100644 meta-oe/recipes-extended/tmux/tmux_2.6.bb

diff --git a/meta-oe/recipes-extended/tmux/tmux_2.1.bb b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
deleted file mode 100644
index bf21de5..0000000
--- a/meta-oe/recipes-extended/tmux/tmux_2.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Terminal multiplexer"
-HOMEPAGE = "http://tmux.sourceforge.net"
-SECTION = "console/utils"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=8685b4455330a940fab1ff451aa941a0"
-
-DEPENDS = "ncurses libevent"
-
-
-SRC_URI = "git://github.com/tmux/tmux.git;branch=master"
-SRCREV ?= "310f0a960ca64fa3809545badc629c0c166c6cd2"
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[utempter] = "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
-
diff --git a/meta-oe/recipes-extended/tmux/tmux_2.6.bb b/meta-oe/recipes-extended/tmux/tmux_2.6.bb
new file mode 100644
index 0000000..7610766
--- /dev/null
+++ b/meta-oe/recipes-extended/tmux/tmux_2.6.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Terminal multiplexer"
+HOMEPAGE = "http://tmux.sourceforge.net"
+SECTION = "console/utils"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf19144bdaca107"
+
+DEPENDS = "ncurses libevent"
+
+SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
+SRC_URI[md5sum] = "d541ff392249f94c4f3635793556f827"
+SRC_URI[sha256sum] = "b17cd170a94d7b58c0698752e1f4f263ab6dc47425230df7e53a6435cc7cd7e8"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[utempter] = "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
+
+do_configure_prepend() {
+    # The 'compat' directory is needed for output during the build but it's
+    # not automatically created when building outside the source directory.
+    mkdir ${B}/compat
+}
-- 
2.7.4


