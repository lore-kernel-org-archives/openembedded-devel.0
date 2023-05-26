Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D02C77B7C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 12:21:54 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web10.6589.1685103713201584136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 05:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fastmail.fm header.s=fm1 header.b=b3mw8gDZ;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.20, mailfrom: cvubrugier@fastmail.fm)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 56D773200583;
	Fri, 26 May 2023 08:21:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 26 May 2023 08:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685103711; x=1685190111; bh=rAFsncx6SY
	fBU54S2qR3EvPG/BhMhmJFO3zt4dcmjL8=; b=b3mw8gDZ1qbzrCX3/MzpX8wbzc
	IVra2gnKN0u+tRm9WeWb35wFfjg57dIqBZGT7h7GCoBJXyvL3Gu0Z8ul/e/+LyXi
	XfsiuD+DNviw5d5PsJYKmPl6/RGJqdWeeowyEcff+ast/QB8fOBWSg0o/z2Vuxg5
	6Tt4YrwJIiYYYXXX5UQwckev6fv/5S6yRhrLuJH/PPTViNuEhq+++4r4/JxgpxHo
	bF6AQpFDWJWIEAfyfRoRUGFayep2kyJk901IVKU2j9uZ/ocNv3ttyZxIuAfH6ijH
	iMAze4UhbBEIOQkfRWffEn6Kg7L3b4ESWn63vJe2vi926BX3TLw+5Jz/zt7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685103711; x=1685190111; bh=rAFsncx6SYfBU
	54S2qR3EvPG/BhMhmJFO3zt4dcmjL8=; b=aOtmnyOsrBgaBNHy07g25gY5JlDe4
	H8pGbkYBKNpxT3NIMzleFtILI5m21jKsH+5NR6IWvTeaOpxE041dAAPW+66OZNny
	ts/VzHvg2/sLLvrxZr/8BS5Napv2e4CzmOJevON3WBJGKw/yxLoD4EI9vQrqTgQn
	4Zshl2+zDkxL2ovkxwTHpfa4roi7HKbfq4AVFtOM8gEIvwKUbX3hem9XjybHyNP7
	vX8VrdmvIe3I3kLqJ7vx9c0Jr35C/7OUSldZ26tPrWB+MqOkZH+4zN7es3TnrB4F
	yoZBdoY+9Pcr+2NgZz9bXUFs3RCJGLUzpNgQpAP/k02lLfqdEfQkuD5eQ==
X-ME-Sender: <xms:X6RwZI6S3OYDrj8397h34QpvRzaEbowiI0F9_TmZr6ticYcjF6D7gw>
    <xme:X6RwZJ4WdP7hZKfXlU1i5uIEQSayxDnzGI7tjFdeBeYh53gwOxD42y3s3gWe4wm4L
    VU3infBrslkrYaGfA>
X-ME-Received: <xmr:X6RwZHftx3iD6iTd80ep_g7wIgKkrDiZnd2E7te4Z_641OYQSrhdu6yCrc4jt3PybxjfBRGAl6EUm3E0ScqEzSccf5kVFo3eYwRrmhCLa5lSQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejledghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptghvuhgsrhhu
    ghhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepieeuledtkeegke
    dvveelgeefhefhffeiveeiledvjedugfeivdetjeffledtleehnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:X6RwZNJxEG32HbZD2lf1EV3yjLx31L9B1rOJPX8N-GBVNESc2apGUQ>
    <xmx:X6RwZMLmHnyknt4qW_FTiKKX6hxNWimnHtPoeRf2GPZItcqcxG95iA>
    <xmx:X6RwZOwoORTtBPS60InLuAh7GX_heDzPqWP_W3RoQu6tWWuJOdzgKA>
    <xmx:X6RwZGyiwiHQzpZziMMlUNVMj1ItqyxoZa6roZEzYlctHxlrslA3LA>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 May 2023 08:21:51 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH] switchtec-user: add new recipe
Date: Fri, 26 May 2023 14:21:34 +0200
Message-Id: <20230526122134.63056-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 12:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102870

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

switchtec-user provides an easy to use CLI and C library for
communicating with Microsemi's Switchtec management interface.

https://github.com/Microsemi/switchtec-user/

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 ...0001-cli-Fix-format-security-warning.patch | 27 +++++++++++++++++++
 .../switchtec-user/switchtec-user_4.1.bb      | 23 ++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/switchtec-user/switchtec-user/0001-cli-Fix-format-security-warning.patch
 create mode 100644 meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb

diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user/0001-cli-Fix-format-security-warning.patch b/meta-oe/recipes-support/switchtec-user/switchtec-user/0001-cli-Fix-format-security-warning.patch
new file mode 100644
index 0000000000..ff2743eb68
--- /dev/null
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user/0001-cli-Fix-format-security-warning.patch
@@ -0,0 +1,27 @@
+From 2d61587f85d1bf57287d12b470afb94c0bf9249d Mon Sep 17 00:00:00 2001
+From: Davide Cavalca <dcavalca@fedoraproject.org>
+Date: Mon, 27 Jun 2022 16:54:35 -0700
+Subject: [PATCH] cli: Fix format security warning
+
+Upstream-Status: Submitted [https://github.com/Microsemi/switchtec-user/pull/316]
+
+---
+ cli/graph.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cli/graph.c b/cli/graph.c
+index 5748914..95609de 100644
+--- a/cli/graph.c
++++ b/cli/graph.c
+@@ -134,7 +134,7 @@ static void draw_status(WINDOW *win, int x_off, int x_cnt, const char *status)
+ 	mvwprintw(win, 0, 0, "     ");
+ 	for (i = 0; i < x_cnt * 2 + x_off; i++)
+ 		mvwaddch(win, 1, i, ' ');
+-	mvwprintw(win, 1, x_off, status);
++	mvwprintw(win, 1, x_off, "%s", status);
+ 	wrefresh(win);
+ }
+ 
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb
new file mode 100644
index 0000000000..6d5c9f1a67
--- /dev/null
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Easy to use CLI and C library for communicating with Microsemi's Switchtec management interface"
+HOMEPAGE = "https://github.com/Microsemi/switchtec-user"
+SECTION = "console/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6b07c89629cff2990d2e8e1f4c2382"
+DEPENDS = "ncurses openssl"
+SRCREV = "762ba441d2c02685f98e5f56e984db033bab279a"
+
+SRC_URI = " \
+        git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master \
+        file://0001-cli-Fix-format-security-warning.patch \
+"
+SRC_URI[sha256sum] = "f98c1fe23e1d7a11fb23e8bcf9b563929fc805ea669191a7fd525ad16519f655"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig
+
+EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LDCONFIG=\"true\""
+
+do_install () {
+        oe_runmake install
+}
-- 
2.39.2


