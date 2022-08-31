Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58F2ECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 23:56:09 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.6190.1661990160320914883
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Aug 2022 16:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=kUfXxpJQ;
 spf=pass (domain: cold-front.org, ip: 64.147.123.24,
 mailfrom: jsbronder@cold-front.org)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 4CEB2320077A;
	Wed, 31 Aug 2022 19:55:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 31 Aug 2022 19:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; t=1661990156; x=1662076556; bh=+rwZ+OU
	2PnDA2jpZ1eNpryvIeIOks+PuqlLvuII+FIc=; b=kUfXxpJQHt4hZWlSjOCiD0f
	3YNjGxuTGimAKCJ5gmYEbVNt2k0S1gcwyibwNETE4Pi+Eobbr1P5sClm+gTRWTQq
	8fTAFKYy3QK/lCk9EKF2WlgtVtcQ57DkPDAWtiNurL3k8WAnj0c7B28pv4Bp4iT2
	RJTq7ZsP98RKuAWcDOQk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661990156; x=1662076556; bh=+rwZ+OU2PnDA2jpZ1eNpryvIeIOks+PuqlL
	vuII+FIc=; b=dkCfdRI6l2zVtbBnvptkV8oUYgAkKouQEfep8zQ8+1MqVHkdlct
	zV6hTxB90nZO6tfl+lwXiM2A1b506hJlEii8BFeZX0S0q5UUmKdYb0AmHgtxiwYi
	ENPMmpzq62yBavA2NxHqes5uE3JbDqk1ONnC/V2VkBuCfpAeeRR71Da+i8Ws3SUC
	BwG9yG45L7vi6VPzlASiV4JW7tpgPskCs0wW11kARl3ju25f/1UvznprKsJqJpbt
	mOumNwZgN2u0uW9IdKqEOB1Vo5/r/ljuRxNU0jxl1oUeWPUlxcSp3j4qMPPwXUZn
	k1ZQWPQM4WswE4YwI5OzjAVFV+SS85sEq3Q==
X-ME-Sender: <xms:DPUPY_w4QEM8POd_VYv_c5WxuNh49PR436PU61VKOh-ew6MekfLMFA>
    <xme:DPUPY3TH0K2J3MjPQDGcwZnYDlFrlz8TgKBQh1iYTS3Y6JZp0CAipSpo1mQGdkKfA
    t6iQbfgWzGKehio4w>
X-ME-Received: 
 <xmr:DPUPY5V8ZwPU9jur1l2XKwA4QFFw8lR9MMVOF2ODWdNrQiJ1SHQp3Gto2eiP5kzndl9LCj5kQkVAzMAzRWbvhmNMKltk5C-H8BactM4RwA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdekjedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheplfhushhtihhn
    uceurhhonhguvghruceojhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgqe
    enucggtffrrghtthgvrhhnpeffudfgffefuedvuddttdfgfeehgfeikeffudfhgfehieef
    teefgedvieehvdegvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:DPUPY5hVPcEJih1ZmR5LK2fCkhIx8u42TjlOgGsDohBeaj1OsUPtyw>
    <xmx:DPUPYxDGZ1ZZPCs18jYOfOxTexVeexJ2jXupMpuf9bqTOOofbpTVkQ>
    <xmx:DPUPYyJRyP2GJi3mbBgBN6Xc1jWyhM1oyxnq3AOB4J9kLTrNGCoHhQ>
    <xmx:DPUPY-57YOPeffblLAaxtMKkbl5QseqXLsbaSOqOCKSKF4vkWItP7g>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Aug 2022 19:55:56 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] lmdb: only set SONAME on the shared
 library
Date: Wed, 31 Aug 2022 19:55:32 -0400
Message-Id: <20220831235532.7257-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Aug 2022 23:56:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98578

Setting soname in LDFLAGS means that the extra mdb tools also
incorrectly get soname set.  This then triggers package.bbclass to add a
duplicate shlib_provider in /usr/bin for liblmdb.so.0.9.29.  Then any
other recipe depending on liblmdb is going to get a 'Multiple shlib
provider' error.

shlibs2/lmdb.list before:
    liblmdb.so.0.9.29:/usr/bin:0.9.29
    liblmdb.so.0.9.29:/usr/lib:0.9.29

shlibs2/lmdb.list after:
    liblmdb.so.0.9.29:/usr/lib:0.9.29

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-make-set-soname-on-liblmdb.patch     | 22 +++++++++++++++++++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb       |  3 +--
 2 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/0001-make-set-soname-on-liblmdb.patch

diff --git a/meta-oe/recipes-dbs/lmdb/files/0001-make-set-soname-on-liblmdb.patch b/meta-oe/recipes-dbs/lmdb/files/0001-make-set-soname-on-liblmdb.patch
new file mode 100644
index 0000000000..312809d1d2
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/files/0001-make-set-soname-on-liblmdb.patch
@@ -0,0 +1,22 @@
+From b4d418bf3f78748d84e3cfb110833443eef34284 Mon Sep 17 00:00:00 2001
+From: Justin Bronder <jsbronder@cold-front.org>
+Date: Thu, 25 Aug 2022 17:22:20 -0400
+Subject: [PATCH] make: set soname on liblmdb
+
+---
+ libraries/liblmdb/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libraries/liblmdb/Makefile b/libraries/liblmdb/Makefile
+index 1ec74e6..ea08cd6 100644
+--- a/libraries/liblmdb/Makefile
++++ b/libraries/liblmdb/Makefile
+@@ -66,7 +66,7 @@ liblmdb.a:	mdb.o midl.o
+ 
+ liblmdb$(SOEXT):	mdb.lo midl.lo
+ #	$(CC) $(LDFLAGS) -pthread -shared -Wl,-Bsymbolic -o $@ mdb.o midl.o $(SOLIBS)
+-	$(CC) $(LDFLAGS) -pthread -shared -o $@ mdb.lo midl.lo $(SOLIBS)
++	$(CC) $(LDFLAGS) -pthread -shared -Wl,-soname,$@ -o $@ mdb.lo midl.lo $(SOLIBS)
+ 
+ mdb_stat: mdb_stat.o liblmdb.a
+ mdb_copy: mdb_copy.o liblmdb.a
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
index b58a36c446..f23960f40a 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
 SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
            file://run-ptest \
            file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
+           file://0001-make-set-soname-on-liblmdb.patch;patchdir=../.. \
            "
 
 SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
@@ -19,8 +20,6 @@ inherit base ptest
 
 S = "${WORKDIR}/git/libraries/liblmdb"
 
-LDFLAGS += "-Wl,-soname,lib${PN}.so.${PV}"
-
 do_compile() {
     oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}"
 }
-- 
2.37.1


