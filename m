Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 64B936023B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:46:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNlv0fl0z40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582317979;
	bh=Cv7ELb24QbonU4WwUxJX6ZU/KW1fuVoRHhBnxFH0wSU=;
	h=From:To:Subject:Date:From;
	b=syNue2sodOXEaQNbyScRELXK2eSyuHUi66LT8SZb41TIMvG1lLolC3Hfps++wmdP+
	scYgjZfXvbn9kPbMi1Cqvsc7dBw4ITWX0ZNbEUdwa+yCsb6zIPFCUiAu49W+GbsK6/
	Ibq4W6n/quMzj5kBwMn09Jk1Ppbcar2ShkzgjoyxPd42Opl1EiWYNVDZjs+vGgS2rF
	XCMhhQZZsnA7P1Uh2onzubngo00SM92VYJwuTjEzT46zD0Px3MgPLelNGYjwiAEx9+
	340rsP1vwuZkGEZSh5r46zScbXhshN8B2PGCltKNPvNzEeHzvcd9KsHpr9S0k2V2t+
	7HfjWdae00jWMaLQVwHcpC0URPPSaT3xpHsdVUqVORvC1bLCiJLCjzqWp0ZnVByhLN
	tI3PhJrLGqkyLY38zV8aERZMyTRnlKO35pnyMHJwoD9c4vLN72vTt9CSDJjP4i49lB
	CaGm3QzrTktwCmebrNhR9vTlifMWZly0FjSSrOa06zYaYIu0phcVgKF8ehkH1/Kz38
	nWGvkDoAF911ziZx9tyfP0LTfkUP8ekkUROd81CubgLk3lgek+wbH6G46JTpatxRgM
	R5z6lkslFrT/FnL/y/yxLMpro9PK5lOT+JflB+9ZcEM8AtWHSA0diHPohJ9lJosV10
	UNHCujPZulvt53Jfi7K5Tkw0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:46:15 +0200
Message-Id: <20200221204617.13912-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] modemmanager: Upgrade 1.8.2 -> 1.8.4
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
X-List-Received-Date: Fri, 21 Feb 2020 20:46:18 -0000

Bugfix release on the 1.8 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{modemmanager_1.8.2.bb => modemmanager_1.8.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.8.2.bb => modemmanager_1.8.4.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.4.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.4.bb
index f9b302a3d..5895a8b76 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.4.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.t
            file://0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch \
            "
 
-SRC_URI[md5sum] = "a49c9f73e46c7b89e5efedda250d22c0"
-SRC_URI[sha256sum] = "96f2a5f0ed15532b4c4c185b756fdc0326e7c2027cea26a1264f91e098260f80"
+SRC_URI[md5sum] = "460661e12b7cc1da5c0920bdfe9f38de"
+SRC_URI[sha256sum] = "d9d0ef25e256586ce3c9bbe4b27f443721f8c891340e5e9087a21f5d70e637da"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.17.1


