Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.891.1587709895261510793
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 23:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm3 header.b=pan5znAe;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 66.111.4.25, mailfrom: alistair@alistair23.me)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B2F655C0A73;
	Fri, 24 Apr 2020 02:31:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 24 Apr 2020 02:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=0pjAJFISka/9rD2r6xwFtn6O+O
	7IqHisVfehDNYGlmw=; b=pan5znAeY1dJdkpR+SdWlzTtwUHmSBZnJqHu7mgIgp
	oaAZnzorl2ndfagPKqLZelZF9zxbq06CLK/kIY9Q98j6ExmxEdRI32mWpbN0y6Sw
	XCPETlzFcTkniJji+ccq1U0taBnDRudo/RPYfOqdLb1gA7xje3PmIiiZY2VjySej
	Z7q0+lN551ezTnu/3lNbsEUGodIt8+of3cLyabJkzc3MdjJgwTb2laU1vdaVDkX9
	780KcxkzH1+v8NWmaIZKrUEtVYJfmI1f7cFs2N1IDfCFxm6npkMkqh7Sg93CLU5a
	sL1JZY63eP4OAQ+70zwj+KGkz2EPwhudX4toOdaB6gVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0pjAJFISka/9rD2r6
	xwFtn6O+O7IqHisVfehDNYGlmw=; b=gpN1GAR5HxWYwVnUL1rHkPwIC63x2jyss
	BXCJHJ4VnqpijPIwVOYAhlqqc56rg+b505Dy+AwAx979z3bQsCNjk7jaT03WTHTd
	b7k/sEc9ikavUBPg4acvy4ADn7niwmKt3FEds6kAru30ZK/H/dLlE0IdxGEaXaWV
	9s9vNiOqIu9EjYqhX5Cal4PVGvkCHKiIAybt00d8pfHmWB7IIhFanTZyVR4H7PDM
	ISy98UEEsf57QkXupUoh4RoV0nSuI4yLLFjenK6WgF+8s8ZX4Y9cWlH7fpOOU00m
	CxpX/OJvLMyuMiF/NNR94/yz3INZ8EEHQuOsEHwQd7TOcvj5Na2Kw==
X-ME-Sender: <xms:xYeiXiBYYMf3pQzBWExEnUOLEo2Qk03BJd4reRA_oocENMrjxKzofQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    fkphepjeefrdelfedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:xYeiXgw71xEoXiqB0xLD_ZUDBoE2M2pXNjV5RHgCdqbd9YqReY6xxg>
    <xmx:xYeiXgnZa5C0sQ1CdZDNCNqXSRBIkFYSTH0Hi3filATnlO8dNqoP3w>
    <xmx:xYeiXlGINFR36OJ-bgXLOpJi8buufpG--GX1j96fcor7bPI_-6p10g>
    <xmx:xYeiXt6MRTD7uMHfppEY6pTEIzSqN9S7JygEKbp5Fd59st6slKvxEg>
Received: from alistair-xps-14z.alistair23.me (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1DB31328005D;
	Fri, 24 Apr 2020 02:31:33 -0400 (EDT)
From: "Alistair" <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] libgit2: Update to v1.0.0
Date: Thu, 23 Apr 2020 23:31:30 -0700
Message-Id: <20200424063130.386675-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb} (64%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
similarity index 64%
rename from meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
rename to meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
index 9b9c19104..fd26a0fe9 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
 LICENSE = "GPL-2.0-with-GCC-exception & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.28"
-SRCREV = "106a5f27586504ea371528191f0ea3aac2ad432b"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
+SRCREV = "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.0

