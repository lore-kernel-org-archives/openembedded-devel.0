Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662D0C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 06:48:44 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.60038.1679986114288831931
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 23:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fastmail.fm header.s=fm2 header.b=aK92DNlI;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.29, mailfrom: cvubrugier@fastmail.fm)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id D43725C0203;
	Tue, 28 Mar 2023 02:48:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 28 Mar 2023 02:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1679986111; x=
	1680072511; bh=eb6+9iYMfriDnIkoktBtKAWhfikVVWTKnnZjHgjwarc=; b=a
	K92DNlIXuj26YIb8XUAgN/Yd+e+TKd8g8fGidL+WsEkfH9lDVraHwEmCMFBYfRCJ
	SwYS984oG0/ejK/3icuUbZWkXt0eiRR492X/yl5izpTfiKajwIGKHkO3pKoJAQiX
	2vVZWGXac2Y/hJGavPvpR8hF1Qd+xivQSzbQBrAADJEXwbLsTzaImYGTH2eMoyOJ
	Ga9MbCXqqP6QPWWcLDXbQiJokpCkOGKVQ+vyLPgYc0Ixd1JqnPm9/BGENxE0aviE
	BrOn+kZZ62J0hBSnej1CjYM8ImWpMifqyKgHKkhs+zQbGUYMkdeOpotTQCMPrz94
	vWiux0Iz57CfleyhQ0VfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679986111; x=
	1680072511; bh=eb6+9iYMfriDnIkoktBtKAWhfikVVWTKnnZjHgjwarc=; b=u
	xw9jGZfj5VjDUNI8g2hiuf9+wQwbTg/UoPPa/xTTP5nQyksliZxZhw1G0L7X0lH/
	Dj6KC9bTSCApp9hKml3+vT6GsaEzBnJ7LuKaTMd9xaU1nhVK/aH0rWr11YLR45NA
	2iBfeeazXeSFhiA2260iJlSKZR6RacTUGhreUbvAxuLt7bsmkV2B0+yWD/O0cSVB
	u5xfU9z/dRrBP0IBkWloSQ3SC/MJpkvXgFApNw6HebIYvuFeZj2rPgbw//q51iFU
	XBLeJcy0L7cj/kMn3S1RA6QuSIRCs2FC5RmBYXSJl+mKMHvmrn2x2zque21uyY6R
	rK4EeTWXb4Pef5UIcdx8w==
X-ME-Sender: <xms:v40iZMpQU7IBEydv8J_9IYK1vZEtwgS3B2DbfS4x6ZYbX-3NTHq-Dg>
    <xme:v40iZCr-PLa7tpI0wUMpGFnyr0i50BMH1jc9zAAZy0lakx7131C6KPeixGTumvg3u
    3SeVXoxkBtKhre_Sg>
X-ME-Received: <xmr:v40iZBNMahYYQ2H8NQvn-3i7DCr-dTTRHPqqqum_04n5xddTzDWxJvvGYqNf-RGdTX7BperLKhzCtcxVt62-GjTj6LUKBigNitoRzQE9iJ5QnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehfedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpegtvhhu
    sghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeejhffhie
    ekjeegvedtgfeuiefhudevgeetuddtueduheeffeehiefftefgjeeuvdenucffohhmrghi
    nhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:v40iZD7iAuyeCv8bLNtnX7FKuE8Lhibgl5N43husf0UFDIrW5Y_lOQ>
    <xmx:v40iZL7M6aW8mEcXgiboRwn9pGTSWBFKltPtnErGDikcxfbz_fYagg>
    <xmx:v40iZDh9jbYJ0g4kjW5idlYGrJFZtWgW8A57Ap5cxfIjFEseHMdkyQ>
    <xmx:v40iZIi4_9zrWPogEUrPCktXpM0KaiZXnc1Mg_eJGjy2XQlbwBGSpA>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 02:48:31 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-filesystems][PATCH 2/2] exfat-utils: remove recipe
Date: Tue, 28 Mar 2023 08:48:02 +0200
Message-Id: <20230328064802.42713-2-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328064802.42713-1-cvubrugier@fastmail.fm>
References: <20230328064802.42713-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101799

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

exfat-utils is superseded by exfatprogs.

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../exfat-utils/exfat-utils_1.3.0.bb          | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb

diff --git a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb
deleted file mode 100644
index abb8fece3..000000000
--- a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "utilities to create, check, label and dump exFAT filesystem"
-DESCRIPTION = "Utilities to manage extended file allocation table filesystem. \
-This package provides tools to create, check and label the filesystem. It \
-contains \
- - dumpexfat to dump properties of the filesystem \
- - exfatfsck / fsck.exfat to report errors found on a exFAT filesystem \
- - exfatlabel to label a exFAT filesystem \
- - mkexfatfs / mkfs.exfat to create a exFAT filesystem. \
-"
-HOMEPAGE = "https://github.com/relan/exfat"
-SECTION = "universe/otherosfs"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "https://github.com/relan/exfat/releases/download/v${PV}/${BP}.tar.gz"
-
-UPSTREAM_CHECK_URI = "https://github.com/relan/exfat/releases"
-
-DEPENDS = "virtual/libc"
-
-inherit pkgconfig autotools
-
-SRC_URI[md5sum] = "f8928571b152455e828ca0bd42af8b73"
-SRC_URI[sha256sum] = "dfebd07a7b907e2d603d3a9626e6440bd43ec6c4e8c07ccfc57ce9502b724835"
-- 
2.39.2


