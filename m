Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDCCC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 17:43:32 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.641.1646243011254880214
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 09:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=DYDqbLxy;
 spf=pass (domain: cold-front.org, ip: 66.111.4.29,
 mailfrom: jsbronder@cold-front.org)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8368B5C047E
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 12:43:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 02 Mar 2022 12:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; bh=ugFOvXCOVsLQGhG8qGFzaCW8mux9FFx0eL5Qa/F8Upo=; b=DY
	DqbLxyJpLksUZKNT7GKDka6X6FLJFr/eY597ZTmuweminE6NJDBdkr5fN1ow3Mpk
	JntU5LhYlnKvBc7MJ2rwf8lPthm6NXxwgD3kkH5NmW2ETFkwqeg4GNKC3bv7FRKm
	OmWV1unDrX0qfmsh1tXPh652tXuuN011QWVhJ6l00=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=ugFOvXCOVsLQGhG8qGFzaCW8mux9F
	Fx0eL5Qa/F8Upo=; b=eqxlGCcpB2ClAWthysgMqO7wKrhGnruHBBbUKoSJa5M9e
	FZjrJp+3FoZWQ5lCW34AmXS10AHBx228VjQznOU5vjeiw+yd7f9l1W1PXKG5NBmq
	DQ4F7m7e9XTOJvToyTs8Tkpfh/8lq1c3QKXnVh/arQPA8biYe9TzKuy42jQBCx1X
	Rng3YfxRngMJETOuFlifVKsI3tDmaL0i0ohbpSgLOuwMmwYcWdELGZAhXhTKyEG5
	oVFqyJ4PPg5nHPITZAf0c/oB7q2JfUqMyX1Xh35OWg21YvOXz8+T0V5xja75XLwL
	7uT/ZfWZLWOT6WkYviHNf534fiyg4YZiekx8X6Ycw==
X-ME-Sender: <xms:wqwfYmeXOlne-NufIfQ2Bz_5sWKoWBMuo-NPDi-TY0Aupt7bTUkoJw>
    <xme:wqwfYgMd4858OxLoRzDYqRfshsWOHQ69j4q3_go9kEMh2JlaWbhyJm4G4sypl-w5x
    ymWCConhe0QjaWJKg>
X-ME-Received: 
 <xmr:wqwfYnhk6HJOvuTBcB8moYUJ1zaSEJ3I2KlAufVY3UMGowRc8D4tUdIScQypvjE1oRORe2Kk0bGDUDLUJyUjOMwrf4twAH4vbNJnyPaAPE0f>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeettdeghffhtdeivd
    fhkeeiffekleehteetgfeiuefhueffffehveevuefhieegtdenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:wqwfYj8Duqqe6-w8X0FsFLKXhmRuixWYU9sZSj9eOhYszxyY-VP0Ig>
    <xmx:wqwfYivAdax9up9uhmvixKqxwZMSUPujL6o4pRlb-058RzusLfnT-w>
    <xmx:wqwfYqEQVCtcsoHmOrv_S0KfEUWDfYPZQCpa5LMDt25uUFLu6k0Xtw>
    <xmx:wqwfYj7NfjgRLEaOd-eqEhHzxp4rnbWn0F7ZklboD6K0qZlAx9mjng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Wed,
 2 Mar 2022 12:43:30 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-pyscaffold: fix wheel build and
 license
Date: Wed,  2 Mar 2022 12:43:25 -0500
Message-Id: <20220302174325.25744-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 17:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95696

Without python3-setuptools-scm-native, the version on the generated
wheel is 0.0.0, not ${PV} as expected which causes
pip_install_wheel_do_install to fail to find the wheel.

Consulting the LICENSE.txt distributed with the source, the template
files under pyscaffold.templates, which are installed as part of this
recipe, are licensed as BSD-0-Clause

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-pyscaffold_4.1.4.bb             | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
index 7e5599e4aa..fbba75c435 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
@@ -5,18 +5,18 @@ used to create template Projects."
 
 HOMEPAGE = "https://github.com/pyscaffold/pyscaffold"
 SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "PyScaffold"
+LICENSE = "0BSD & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
+DEPENDS += "python3-setuptools-scm-native"
 
 SRC_URI[sha256sum] = "46a2bbdf255ba2efc6c56ae1428249b61d56c4a3e54ef3db0d05fa97792011a5"
 
-BBCLASSEXTEND = "native nativesdk"
+inherit pypi setuptools3
+PYPI_PACKAGE = "PyScaffold"
 
 RDEPENDS:${PN} += " \
 	python3-email \
 	python3-compression \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


