Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECEFC6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 17:28:20 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.2503.1680024491871462084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 10:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fastmail.fm header.s=fm2 header.b=eLBU/Fgl;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.21, mailfrom: cvubrugier@fastmail.fm)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 32FEC3200943;
	Tue, 28 Mar 2023 13:28:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 28 Mar 2023 13:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1680024490; x=
	1680110890; bh=eb6+9iYMfriDnIkoktBtKAWhfikVVWTKnnZjHgjwarc=; b=e
	LBU/FglnQbN31MhxFYjxjWgdMiAiaipFBlKVbo+wxo55vUqFznmhUyzFTX31KhXA
	mUXBvBqt9ONoYUWyyrTnQT+y9ga5OJVJyJnHq7GXgSJhk5Z9v1v85yBKYqzENOzF
	9LjBchIH9E/ZupXeJ6z5T61oNehBepsZXYYdwsUc+2+5vH9+CTUIGVwQW9ZIEC9w
	MuP8xqeDySbNfbaAReOk2Gtw2mdNVnF5whbnUTMCDDCzOKDJ10eFDPKXm7Rsk5Yg
	YQjDprzqO5W5A5buKzlUhP6VR9aqQNlym27EjQWYecYiOzovJzuUxQkbLLJC6Vtg
	735+f0sLWCuM85UxWtr9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680024490; x=
	1680110890; bh=eb6+9iYMfriDnIkoktBtKAWhfikVVWTKnnZjHgjwarc=; b=t
	bw3s2xW4nSRDLSwERhqFoQry92Z7IpDd1Ul8HdYFxqMH+EF1ltdY40fmI5McONEw
	VWq+tCBk2LoKn3orJWxYfuxxrTSzm0qXy+YDvLsB6KmB+ToZy9tmLIg5U4lT/e77
	LzyLTS9qFhhz/NU67YalVQAiez0dqabQ4GJzcDxUA21sDgbqvFb7lWgWJIZf4Ilg
	YUR5/HVOPvCrKBWObnWIDO3CnxKk6wBCCQSYicWnzSO6hQ0ymZWMaZQ+3coymmuO
	8218FutQD7oGibfLerG0y7vcri3vJMUCwxmhAdp/wQAnRat9p620sFMKsitfy/jw
	u6MEzJxbh+opUcxhr19Pw==
X-ME-Sender: <xms:qiMjZFh0ZMzOQiuMMtvUuHzE1uJ4FK8NlXqnnZ9z057br6W1hQm8vw>
    <xme:qiMjZKC1YiAyR7630WR1AtOYjjx0fE5qxSOpLhpolRAiuZWjyiPb1OLoWxNR2KTzJ
    TBj-5N08W8mTIJauw>
X-ME-Received: <xmr:qiMjZFFtFaAQAwDTgOVQ2haT3Zr2C7AcvJuSzc1XTOGpqAZWG-trSo57Ma1f9svcFsWMj35ejUbiqW2gx-3eGla8JTclsQzmwCqsVI1WTegnfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpegtvhhu
    sghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeejhffhie
    ekjeegvedtgfeuiefhudevgeetuddtueduheeffeehiefftefgjeeuvdenucffohhmrghi
    nhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:qiMjZKS95bIZvvC-i35Cg8LeDx8MAL3gmulYQN7npVfaW--laJjOGw>
    <xmx:qiMjZCzbptu3K87C0Aw7PEGRhZwNziohiAiOfxMwcIlrkU-zEjJv6g>
    <xmx:qiMjZA52ayTSElHB8PNzR5clcIKJtxrLC4v2Hno6XVlN-sffw4wpqw>
    <xmx:qiMjZHpZcSCnAPKh9jjA_cIremSyJ0dhx-71Rsbw2QzilTQMxUcr3w>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 13:28:09 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-filesystems][PATCH v2 2/2] exfat-utils: remove recipe
Date: Tue, 28 Mar 2023 19:27:21 +0200
Message-Id: <20230328172721.10639-2-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328172721.10639-1-cvubrugier@fastmail.fm>
References: <20230328172721.10639-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 17:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101809

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


