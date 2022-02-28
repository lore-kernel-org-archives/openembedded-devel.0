Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ACEC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 15:57:28 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.21248.1646063846264229178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=icVu62jY;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26,
 mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 820705C01E0;
	Mon, 28 Feb 2022 10:57:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 28 Feb 2022 10:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=La2iE7++GrTzVLJenbGIPfK5w474/r4A0rM
	WeOVKN3E=; b=icVu62jY2altMDlInVgOBnPBErIIjcE/Mqi9gOvs5k3bO8oJoXv
	XHRFYD4oY9R+3DFOeUockOpUId+Cxy2mtglYj/jNugLVrUNQgAE9MsXQ8xgldkDw
	HH3IY7vkcMcpNeStjMtqk7uvIDGxoS5OynyFbkSd8ET92OeolsBrxBxM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=La2iE7++GrTzVLJenbGIPfK5w474/
	r4A0rMWeOVKN3E=; b=B+Oa00R/7WcZN8egos9FAmrdvrWOuVPW5ov0mXJ2WfKlW
	Sl8Ba4v8nH1sYa5sQn9oey1DhHrS38p7x3uppWEi19ZO+17wsTn2ftRFHLJWdv4C
	IUNS7jCGoLNSUFn9K1zw0n692GG9I4hvez8ycCgZO1ED2KMZoSiL4jpIINjMYEJP
	30Hzu5xg0FeNZq3ZKB3sgPjOpi662QzU9Ucage8IG3cxXtYIy993DvkcbI1BEkEz
	Ecs8RT+l3Po2oL+M7Rtvtz57SmfByElAWnl+WN9SmtaT/WOnowKIaKwAinJQTKhY
	SDsUrcmaqEySKhLIQZu/uLJ7srCKDreTRtx3t7uHQ==
X-ME-Sender: <xms:5fAcYgxZwNPRAxLBpGXgFs0f-WmQtaclFRcvf0FiqqnBsuVj0zyDXw>
    <xme:5fAcYkTO7L_edjHog1nV4I9nRnGQqmyYdT2GoU5LfrD4tslNFFY969Al7DVRdnAW8
    HFgoO0uIpLtWFH3fA>
X-ME-Received: 
 <xmr:5fAcYiVDNY-TZdnPmqEIR4Ncohl_JuvfbtThDrgdgn2Lz_1_s7PBf4Ovla701y9pwCqBNHmow92OhsZpePO5UUGrC-1myWGcRuCWCHG8OYQ8>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeettdeghffhtdeivd
    fhkeeiffekleehteetgfeiuefhueffffehveevuefhieegtdenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:5fAcYuhAABXTS7NOEGtNb_TbGuOGFBxS5FylKreJdTz60O26M49TRw>
    <xmx:5fAcYiDXj21BWIDXCueangO9DeB59qIe4nD7XuwwQVfbOeHTJ3zPnQ>
    <xmx:5fAcYvL063NiEuuQUEEi-uuy2D8exvnpDTb-Khq2lRpIT4nuUDqDfw>
    <xmx:5fAcYtq_N2JNYIraMdAfrmzRzUkm2a0oHDiVC2LoPbqZQz_1HbbeTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 10:57:25 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-crc32c: add 2.2.post0
Date: Mon, 28 Feb 2022 10:57:14 -0500
Message-Id: <20220228155714.7894-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 15:57:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95585

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-python/licenses/CRC32C-ADLER                | 15 +++++++++++++++
 .../python/python3-crc32c_2.2.post0.bb           | 16 ++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-python/licenses/CRC32C-ADLER
 create mode 100644 meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb

diff --git a/meta-python/licenses/CRC32C-ADLER b/meta-python/licenses/CRC32C-ADLER
new file mode 100644
index 0000000000..f1f0e94ee0
--- /dev/null
+++ b/meta-python/licenses/CRC32C-ADLER
@@ -0,0 +1,15 @@
+This software is provided 'as-is', without any express or implied
+warranty.  In no event will the author be held liable for any damages
+arising from the use of this software.
+
+Permission is granted to anyone to use this software for any purpose,
+including commercial applications, and to alter it and redistribute it
+freely, subject to the following restrictions:
+
+1. The origin of this software must not be misrepresented; you must not
+   claim that you wrote the original software. If you use this software
+   in a product, an acknowledgment in the product documentation would be
+   appreciated but is not required.
+2. Altered source versions must be plainly marked as such, and must not be
+   misrepresented as being the original software.
+3. This notice may not be removed or altered from any source distribution.
diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
new file mode 100644
index 0000000000..0d51420939
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A python package implementing the crc32c algorithmin hardware and software"
+HOMEPAGE = "https://github.com/ICRAR/crc32c"
+
+LICENSE = "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0+"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
+    file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
+    file://LICENSE.slice-by-8;md5=6b3bc7709d6b2db6646ec2467310ff6b \
+    file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
+"
+
+SRC_URI[sha256sum] = "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4851377d13ead8b435e"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-core"
-- 
2.35.1


