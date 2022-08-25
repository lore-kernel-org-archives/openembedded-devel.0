Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED1CECAAD1
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 22:03:11 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.30166.1661464986198248420
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 15:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cold-front.org
 header.s=mesmtp header.b=SBpUkwzt;
 spf=pass (domain: cold-front.org, ip: 64.147.123.25,
 mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 3330932009F8;
	Thu, 25 Aug 2022 18:03:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 25 Aug 2022 18:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; t=1661464982; x=1661551382; bh=6pDKpc1
	RT44EeTm0SiJiEEuBmql/+QrNVsCOL6iJO5g=; b=SBpUkwztUf6EDe5/xn6lljq
	NKMe3BLyNuvCrMC7VdCe7XN9QC3EpW/9Bd2xb4slhqK2RyTMQ7bDzu9KbmAS84bu
	U3GyyKISgXl1YjlVxQHNrF7STfjEgpX4D/MgpMekDmHVtr/mA4vdf+nFuzdTMzhg
	vLzO7Q1F1cdPD2MqULNY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661464982; x=1661551382; bh=6pDKpc1RT44EeTm0SiJiEEuBmql/+QrNVsC
	OL6iJO5g=; b=Nv8tMWd3p7twxopZ5S7YHntt3/RwJ0a7vysWC/nkH9ZG2U/IbnD
	sXdIUQztCMIO0Z+pRwnIpOuOco8Bb4ngz9d35by2sMds9WiQzlR0hRRUMn28MfW/
	BF5/g8ZarR0t0I9YdAqn7moUp0bkWxXGE4lrbZodqQFZ41vWJ1xjJnKU9/YOx39n
	H1LVRP3Zi4rhWUO/PjlrN2w+rjOEfldf71EwByH0N8/g5fOcb/HFuZf+fkdDHvpi
	iXXUeY/hH+XQCFub8fIqbJNXiLpOqxJjmQSswelur+oPX025WMrlryG3ZxWK3aEA
	mNkHzPHr317EfJVNkfH0m6l3nAWO9Kft1kg==
X-ME-Sender: <xms:lvEHY9uXw20LKeByNWIahFXF-8nw2lp_uXjk46hV7dGZ6-Ay70LvZg>
    <xme:lvEHY2eGkKbyAGYRcKnq7jSTDf5J8J-Ioo9duNlZoQpyUxwTkkhcweJpGqljxEp3a
    6zEgufXTYRFlgcXqw>
X-ME-Received: 
 <xmr:lvEHYwwcnvTnAUXx1sXFjjtBFy0BQq7JbTwzIbQwdu0RZhBbRwEFDJAYIMuXB7frA0aTHQnz9iHnnQgp62nbA83eiREpcfhg0uJXsfKUVg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepffdugffffeeuvd
    dutddtgfefhefgieekffduhffgheeifeetfeegvdeihedvgedvnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:lvEHY0MleLwEAKCm_BKek5i0HmwQ2dptcqBRjenwi6c_NbuNormwcw>
    <xmx:lvEHY9_TqeCK_vBJV01REP8IHHvIQVYkySq00rImRFicQ4O5fDOYjQ>
    <xmx:lvEHY0UsJHFOcPcI1uHzdVHtVRm--0LxGuKKd36c_HZdrrUO8EtenQ>
    <xmx:lvEHY6Eu1mWRR9M7AEk36QEQoYyIk3tURzneIA6Gtw5k9wOb9kZ1QA>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 18:03:02 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-oe][PATCH] lmdb: only set SONAME on the shared library
Date: Thu, 25 Aug 2022 18:02:57 -0400
Message-Id: <20220825220257.2993-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 22:03:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98436

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
index 0590ce008c..a76d388d70 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
 SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
            file://run-ptest \
            file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
+           file://0001-make-set-soname-on-liblmdb.patch;patchdir=../.. \
            "
 
 SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
@@ -19,8 +20,6 @@ inherit ptest
 
 S = "${WORKDIR}/git/libraries/liblmdb"
 
-LDFLAGS += "-Wl,-soname,lib${PN}.so.${PV}"
-
 do_compile() {
     oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}"
 }
-- 
2.37.1


