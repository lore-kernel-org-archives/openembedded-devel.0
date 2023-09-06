Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51870EE14BC
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 17:23:03 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web10.4872.1694020981185148131
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 10:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm1 header.b=Yz9mYdtU;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=iUsUeDvD;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.19, mailfrom: cvubrugier@fastmail.fm)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 67B243200907;
	Wed,  6 Sep 2023 13:23:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 06 Sep 2023 13:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1694020979; x=1694107379; bh=i9aSIj1B13
	dKs+pL6GY+o8ix66Ef0AXAAHOxJqSxtNw=; b=Yz9mYdtUWqgyx/wiRxRfZ6HOMn
	afdzx/6C35Kor1FFjDGXI28cvnfiGEV750tvhYtWlZbZtwwsek0IQ2tZi/7GkXrA
	n8D+zx5NCK5XHOkevcnhEIKKV85uMFva6sDYlu5qh2rE+bauBU7BzfpDhcBCGTDB
	oe1j0zmiz6sq8yoROtRs3OsUJ1vtyD9cpdomA63mXjFfMWIoDlby36RBh3FPfpLi
	ls+bwTFjBkIm4wxwaBZj489gwkVecqmIHod5hEO3zcdtM9clbJJpsKw4Ifa87q55
	DnJUkZnkZTJikVocMiqNGI297BjkGc60LRVxwafnyGs5ng22nvHNcYZ3rHyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1694020979; x=1694107379; bh=i9aSIj1B13dKs
	+pL6GY+o8ix66Ef0AXAAHOxJqSxtNw=; b=iUsUeDvDUB55ccFlPjmqQznUl9NFI
	dvbt3IFODBUocr64kbzA3es9gqWvjmscaOS4oMWG+Vg2OwsZztANYAHrut60DrlJ
	SpDyxfjkcqKyoZCwPGhKGs+PRa9uLinwZieYsQ+GVpMTr9XTSoaOT4ho+DTuol2z
	CDLPtCrN9QgjMdViQvgFe0AiPKihUNjJYhSQSgSPkjwgdaQ/4vmIxKZ81Hph0cdx
	nIdKxmIz0s9xf19A+4s7/nrRyhOFtgp4Bxj9KJmVLcSruh2YzsFaKYaTpYD9cUes
	MdYCqE4kAECLCFhtaHjYSwPS+x5keBjG6h4Rhq6kR9qOSE+Vtg0jrHKgg==
X-ME-Sender: <xms:c7X4ZGYDVmWAXenLg3j-JUkIAzXKVgGgVTYtZm7-kLt9mlLdQv3_Cg>
    <xme:c7X4ZJYyq0rawB0NSniqIbaLZAzYXeUXbco1EbOeXE512yYBo7amidxDaS5cElia7
    KS3MrU4ccasy7KoHQ>
X-ME-Received: <xmr:c7X4ZA-m_0dD0Par_YObJogh2-1xnxQ4d4MlbmlMze2uJKRBk4elnmugeZAtdDaMsAWVOaJSlELZ8fPd76UaHqOhD9aSU5YFqUBxXFEz-oMpOakcd5I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehfedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeelgffgleefue
    ffjeevffekveduledtkedutefgkeektdethfejveehkeetheegjeenucffohhmrghinhep
    uggrnhhnhidrtgiipdhfohhsshhivghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghi
    lhdrfhhm
X-ME-Proxy: <xmx:c7X4ZIqawrOGMYeO_ax7SvtOdJNOnLw0x8JEVKj_k9qo6wjx4PGwCQ>
    <xmx:c7X4ZBqNL8C-krL0MZRyPTchwzC5YagvR7_z-o2mJFMUxUpslx82bA>
    <xmx:c7X4ZGQM460Sr1lwHUCJTUle7h_aPlHW_ZTa4HvEorgYk5AmSMtVdg>
    <xmx:c7X4ZATWj4nd3MA2a_uiN06ifAnFheD619TnBUwM29ez7MWv1-VRvA>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Sep 2023 13:22:58 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH] sg3-utils: upgrade 1.47 -> 1.48
Date: Wed,  6 Sep 2023 19:22:45 +0200
Message-Id: <20230906172245.41023-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 17:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104782

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Drop patch 0001-sg_dd.c-Use-off_t-instead-of-uint.patch: it was
merged upstream.

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 ...01-sg_dd.c-Use-off_t-instead-of-uint.patch | 36 -------------------
 .../{sg3-utils_1.47.bb => sg3-utils_1.48.bb}  |  5 ++-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-support/sg3-utils/sg3-utils/0001-sg_dd.c-Use-off_t-instead-of-uint.patch
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.47.bb => sg3-utils_1.48.bb} (73%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils/0001-sg_dd.c-Use-off_t-instead-of-uint.patch b/meta-oe/recipes-support/sg3-utils/sg3-utils/0001-sg_dd.c-Use-off_t-instead-of-uint.patch
deleted file mode 100644
index 317876f197..0000000000
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils/0001-sg_dd.c-Use-off_t-instead-of-uint.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9a8ede03ef61cdf527ce3a80771150a7452e4603 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Mar 2023 22:56:17 -0800
-Subject: [PATCH] sg_dd.c: Use off_t instead of uint
-
-uint is not available on every platform e.g. linux/musl systems. Use
-uint32_t instead to represent 'off' variable, Fixes
-
-sg_dd.c:2402:17: error: use of undeclared identifier 'uint'; did you mean 'int'?
-                uint off;
-                ^~~~
-                int
-1 error generated.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/sg_dd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sg_dd.c b/src/sg_dd.c
-index 9d05c93..35e2423 100644
---- a/src/sg_dd.c
-+++ b/src/sg_dd.c
-@@ -2399,7 +2399,7 @@ main(int argc, char * argv[])
-             res = blocks * blk_sz;
-             if (iflag.zero && iflag.ff && (blk_sz >= 4)) {
-                 uint32_t pos = (uint32_t)skip;
--                uint off;
-+                uint32_t off;
- 
-                 for (k = 0, off = 0; k < blocks; ++k, off += blk_sz, ++pos) {
-                     for (j = 0; j < (blk_sz - 3); j += 4)
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
similarity index 73%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
index 1aa65e6cc4..6c3d813983 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
@@ -8,13 +8,12 @@ SECTION = "console/admin"
 LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f685699d3ac82f108aa880043fa3feb7"
 
-SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
-           file://0001-sg_dd.c-Use-off_t-instead-of-uint.patch"
+SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
 MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-SRC_URI[sha256sum] = "8673c7faca849b6b34764332d2aa91f72db05bff7382bb836d0688795199c3e1"
+SRC_URI[sha256sum] = "d62b6c3cf20390fa7357044390084166d25f1d932a1135c450b69fe5c283d773"
 
 inherit autotools-brokensep
 
-- 
2.40.1


