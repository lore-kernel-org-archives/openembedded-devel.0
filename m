Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F3EC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 22:15:55 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web09.933.1646172953786696273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 14:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=m2vC78XZ;
 spf=pass (domain: cold-front.org, ip: 64.147.123.20,
 mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id E551C3200D25
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 17:15:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 01 Mar 2022 17:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; bh=Jvmu474cFYcLsyLk7WWwrMNxbXK2JJZeoABnQe92gU0=; b=m2
	vC78XZP2LmshGF4Cch9DLx279MUwOKVLuUBJIllyH7zYzbbawg1F3OxekmTGpsqk
	eZEgNxsFBIRsKP5P0T+HIClaxEjJopgzvdR1pui+kuX0dPVxDhv62SSzBcjEsE+W
	u1k1vIhRBCCC+t38PTtcN0tFpdv39WulrmTmNolR8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=Jvmu474cFYcLsyLk7WWwrMNxbXK2J
	JZeoABnQe92gU0=; b=jlvRxTHAMmAaWvPO6rxPhCV7g2sBCFF6neog2MZf8FgQl
	w26LaUAW27Ts4wPp5Elj8IIDTshCICy77yL6i1/ndEeeNfieCbPO0HZHygk6JWZS
	E1iVpUE5DKrc02TJBmx5nXixtlTuWCRLKgzSFAbHAnDRSuEBgNU5F37fPo87xRzi
	ELtKB569hM+Ra+hzNcQ0xDIe8VUf58hmQNnwvlcaE+nTD/4wCnsTyvhA0IgQyBSy
	ANPQ6A7YzPGwACKfHj9DN6oWmGlBlQyv/bM3QF8qvpOcLcM+uCc4QqsHLryxz3xB
	VLnz/B+r52nJKCWK9WR5lyBsby6ahYI4DgaRySiXg==
X-ME-Sender: <xms:GJseYtADSPC_ULU9B78belCr-Z9ZKBzaGCZOeGj1iuqu2_0ZkB2u7A>
    <xme:GJseYribzC3A7vx8fxNPX7PUSNjUvPANVAYVtvOdLyVXcxtLK9rvFAHq3sJm_qESd
    5OzS5MX467K08l2Tg>
X-ME-Received: 
 <xmr:GJseYon1BWn6kpfPr1j6BtkL7_cYGkY59irGpLXEj5egWN-ZgYoiRM6JWA2ZPeqlJwqVY35eDNrMmnP2dxVoLTpOi9_gM3_8pxwWHiUUdn5V>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnheptedtgefhhfdtie
    dvhfekieffkeelheettefgieeuhfeuffffheevveeuhfeigedtnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:GJseYnwNUn8mh9XRnGeWLWDQqyRZpLc2IBDcfR63nacpXAfEIhWTzw>
    <xmx:GJseYiTqoCBqeIhcnasrBBkbPtpaxhV640g-ZLYm0xkiMFZoqVu6pQ>
    <xmx:GJseYqal9gi8Us8X87eVPaV_kmsrPn7NGIB7cD-MKKGpc3A7mLrODQ>
    <xmx:GJseYpONczWSmS-U9o9rXXpo0dCQ2YTBW-JA3hri4AbI4qq8riuLng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Tue,
 1 Mar 2022 17:15:52 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pyscaffold: fix wheel build and license
Date: Tue,  1 Mar 2022 17:15:48 -0500
Message-Id: <20220301221548.30730-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 22:15:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95661

Without python3-setuptools-scm-native, the version on the generated
wheel is 0.0.0, not ${PV} as expected which causes
pip_install_wheel_do_install to fail to find the wheel.

Consulting the LICENSE.txt distributed with the source, the template
files under pyscaffold.templates, which are installed as part of this
recipe, are licensed as BSD-0-Clause

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../recipes-devtools/python/python3-pyscaffold_4.1.4.bb     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
index 7e5599e4aa..f58fc5e9aa 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
@@ -5,8 +5,8 @@ used to create template Projects."
 
 HOMEPAGE = "https://github.com/pyscaffold/pyscaffold"
 SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+LICENSE = "BSD-0-Clause & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 
 inherit pypi setuptools3
 
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "46a2bbdf255ba2efc6c56ae1428249b61d56c4a3e54ef3db0d05fa9779
 
 BBCLASSEXTEND = "native nativesdk"
 
+DEPENDS += "python3-setuptools-scm-native"
+
 RDEPENDS:${PN} += " \
 	python3-email \
 	python3-compression \
-- 
2.35.1


