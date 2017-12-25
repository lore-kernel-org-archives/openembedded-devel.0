Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4687857A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 15:58:15 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u25so17967545pfg.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+iQufJBpx7gWjr4KiIZVDMWtnhViVvLJgbxlJxActxQ=;
	b=Gf3IRXZjQSATLw4nm8q71MZkF2EgYE3UgUg45dTcEgXrZrZJSdMkSHBC+KmKGyn0tM
	j4ITb606pcX9j8ZqL/3KB84mD01/LE4DnUJGVj56STLI235amcyNsla1ga0lhIiHvuSU
	0Lqk0UR6OibnDwvbjQvGMw/h4lKIBz+vOLWJk0blHfmgRd/yurG1keOEyetM0vpUbUwq
	Ef/0v69JqHqZPCYtiti16L1MFO96SXUMfuGgaq1ydAuM3lqmiTmExyLKlIWaMjn2eh7T
	kaTOn5K+qFDSi6LAGA0KQ/UK9QudIYhRwa/q4KJndZBccZVXwu/nWLtHOp5/VC01JOKp
	huLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+iQufJBpx7gWjr4KiIZVDMWtnhViVvLJgbxlJxActxQ=;
	b=ukLpY0vYD+jVOiBr7OaA7m86YNhZqj6N3kpEUXPohILu/aEPx1EXa5yRR1GRIdKiqh
	0VEerQpiG/aOfhIWe/YukiF4mkF+1bz5pOLr6Ekpf2TDcTP1vsKwCz25ZvVy++6sntsL
	Nt3w6YSroovwKs3B5xNVi7cYSOclXB8iWRBW/96BCsEW1BqLxJypDedo+QcqpXLQHfVv
	sqn9Lc7aRhp/aRWSV1lxFUAfAIPV7L+G5KD64OGMsjXWXifi5f4AJt9MBBlZArhH5R06
	NFo9ECBnb5u1WJjW+OXte5eG+EfCC3ooOamAR70XFVyPnbufRZnxIyRALU4okdHklwxp
	f5zQ==
X-Gm-Message-State: AKGB3mJp0FWhM0D+l8EmU2H5uYrBWMtWFTZPGgMDioRu93Z/XZezBLYf
	BMzq4r4wTOnBbHnTvO4yQgqibg==
X-Google-Smtp-Source: ACJfBosgme2pEyLVgK7x8uPYEgRQVNZOLef9p3Y8VW/XcRWezxchkxlv+TvfCNfiRkTfdXwsMth4hg==
X-Received: by 10.99.186.70 with SMTP id l6mr20244517pgu.443.1514217496517;
	Mon, 25 Dec 2017 07:58:16 -0800 (PST)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69]) by smtp.gmail.com with ESMTPSA id
	p87sm58755808pfi.95.2017.12.25.07.58.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Dec 2017 07:58:15 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Dec 2017 15:58:09 +0000
Message-Id: <1514217489-56636-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][pyro][PATCH] qtwebengine: Fix GCC 7 buile errors
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
X-List-Received-Date: Mon, 25 Dec 2017 15:58:15 -0000

Update latest version in 53-based branch of chromium to fix build error
in GCC-7.

4210035 [Backport] [url_formatter] Update aspirational_scripts per
        Unicode 9
4934412 Fix build with GCC 7.0
772f05b [Backport] [runtime] Follow-up fix for "Better encapsulation of
        dictionary objects handling in lookup iterator."
        BUG=chromium:626715
675c165 Fix not working pkg-config on some older distros
015d648 Fix Linux kernel lacking
        V4L2_CID_POWER_LINE_FREQUENCY_AUTO
589f21d Allow using quota management API for non-standard URLs
c83a47c Fix build with use_glib=false and use_x11=true
b0bb028 Fix debug builds compilation
cd3417b Override xcode min version to 0721
d67d4bb Remove pending messages DCHECK to stop certain tests from crashing
1fd9f11 Remove linking with libatomic
fa90180 Fix missing dependency on libffi
b5a3338 Fix broken unit test for gn
70ea2bc Fix gn compilation for rhel6.6, rhel7.2
f408e89 Improve .pri output
492b20a Remove gtk2 dependency in tests
42e3484 Allow Service Workers without HTTP headers
7a1be30 Do not require gnome-keyring
11e5c2d Revert "Add mus and catapult project files"
891fb3a Remove various test and telemetry dependencies
ddd6053 Do not use last_commit_position for gn build
e85719e Windows and macOS GN integration
8fda2ae Make more features configurable
93db377 [Backport] Don't schedule wholeSubtreeInvalid sets.
0fa2e06 Fix convert dict tool build
d6c9e61 Add support for creating pri link information
965b67f Enable virtual keyboard on Qt supported platforms
5cf4c44 Fix macOS build when plugins are disabled
662a4a1 Fix false dependency on mus, tracing and mojo_runner
128e6f6 FIXUP: Fix dependencies on ANGLE
b41aa16 Fix building with use_gio=false

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index deb336f..80d6133 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -118,7 +118,7 @@ SRC_URI += " \
 "
 
 SRCREV_qtwebengine = "d740d6a7dbfec387752c7bc8a8b06db0e757c9dc"
-SRCREV_chromium = "15d257fd921f37b32ef643225f21df0ea24c8302"
+SRCREV_chromium = "4210035e25d6832c217aab56d4e15b3183ca4f79"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
-- 
2.7.4


