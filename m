Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 795337FA4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472Qh25NQqzJm
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:06:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572340018;
	bh=LjOAYe0tdKXjr/g92UABrIOG3E4EYY0caEA+7KJBucs=;
	h=From:To:Subject:Date:From;
	b=pYZR0ZVY2rErvh1Xvg7BYpg+Nta9H4juytOoKeracWSra0id6w6s20qOSL3BtNpJR
	ZW1Pe5+mVGhRPPw9VJ7qY+JMc2Zm/NpWcF0l+IU+MZUpvs3cTIEuIuluawIczM4Yn/
	kKDRKN6QnIRCS80W6jOKH5aKeN7ALj10+loIo/gAX+smKjAzYX6IPQQu81mXgndP1a
	PpVbKdnqMoq8jxHpYPWDOnBYztRVzKpDinqyq9cIub5UzhlXbQx/S1+p3yxQB72lsL
	Bn9ZSEEE4VCnUi+YAhX2eZ1sziBQTEmF3fyMAGWabN1kvdex1D43NnWibvJzt5PzL2
	qmBcaYds+NyGYV/JwPRjfl3ayoPcWKYf/q4oX4lxxXMxDP3vUDrpCObuWGvXJiQ2F5
	2Z2cdBLSxPRBwVjnl+lAfD0WJpbHhiFjPPN20w3ReosuBuY4FvS1w5bhgl1qIrrNPT
	bJgHR0h2CutMwmN6qpMIWDbO8uEDSEGBtxsFlkfnrgI1QjVDuhlkzRyp0FbRRWq0Jr
	zwu5H4z63NO6I7iiXHe8EyPGAaRSSfbFm+ZyB/ztTBPF1zZ6Q4R15UFAWNqWdoHseR
	SU4hlEgolUUkSkfXTvpxuBZIEvi3o2W1+VRvAFcJeXQyQvPsMJpTgJ8I6yFTMianI4
	uIPh8fALwA8Rlq3Ez+MpP8CE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 11:06:53 +0200
Message-Id: <20191029090657.30771-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] lldpd: Upgrade 1.0.3 -> 1.0.4
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
X-List-Received-Date: Tue, 29 Oct 2019 09:06:58 -0000

Backported patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...1-priv-include-limits.h-for-PATH_MAX.patch | 27 -------------------
 .../lldpd/{lldpd_1.0.3.bb => lldpd_1.0.4.bb}  |  5 ++--
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/lldpd/files/0001-priv-include-limits.h-for-PATH_MAX.patch
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.3.bb => lldpd_1.0.4.bb} (91%)

diff --git a/meta-networking/recipes-daemons/lldpd/files/0001-priv-include-limits.h-for-PATH_MAX.patch b/meta-networking/recipes-daemons/lldpd/files/0001-priv-include-limits.h-for-PATH_MAX.patch
deleted file mode 100644
index 9ea4a9ffb..000000000
--- a/meta-networking/recipes-daemons/lldpd/files/0001-priv-include-limits.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From c6a283bfcbfefe9c89113e81b0f792c12c4eefb8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?S=C3=B6ren=20Tempel?= <soeren+git@soeren-tempel.net>
-Date: Mon, 25 Mar 2019 18:43:03 +0100
-Subject: [PATCH] priv: include limits.h for PATH_MAX
-
-Upstream-Status: Backport
-
-Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
----
- src/daemon/priv.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/daemon/priv.c b/src/daemon/priv.c
-index f4d6bdf..ba5ae58 100644
---- a/src/daemon/priv.c
-+++ b/src/daemon/priv.c
-@@ -27,6 +27,7 @@
- #include <unistd.h>
- #include <signal.h>
- #include <errno.h>
-+#include <limits.h>
- #include <sys/wait.h>
- #include <sys/stat.h>
- #include <sys/socket.h>
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
similarity index 91%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
index e650b5795..8fdaf848f 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
@@ -9,11 +9,10 @@ SRC_URI = "\
     http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
-    file://0001-priv-include-limits.h-for-PATH_MAX.patch \
     "
 
-SRC_URI[md5sum] = "04844328f053ee343344d892efb8a00c"
-SRC_URI[sha256sum] = "39fced395168015416bfe78b95414facf066f841f349024433aa20ab54e4c360"
+SRC_URI[md5sum] = "33e8d58623f99184e4e709cbbfe45db3"
+SRC_URI[sha256sum] = "5319bc032fabf1008d5d91e280276aa7f1bbfbb70129d8526cd4526d7c22724f"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
 
-- 
2.17.1


