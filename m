Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6FEC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:17:34 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.7232.1645622252076646828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=hgh7Q0m6;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=t42HICMeyNl8+03dQ/K1S8FEteX/6uW+pqjJ8swL34E=; b=hgh7Q0m6sCES4BJwCjTGTONbPf
	5meoN5WB5ynZDYIc7STYt4+pA0kquAuGtKBHpRcvfW2kdSAfY/zhhK2NIQjbctuljSB/wLj4mbqH+
	0X+zi2hFzqiGoU7gLALlfwF7uohOnFFO2/87bbdhrBSZ92K6zLQwzsJcK1cXU+Om7V/FPAH+fHelq
	tTZ7tSwEyzPS9O+7tVYLazMyFnoEHOgeCRzNtTBfZ7IAaiVlqz32e2Y73wxSwVN6oEsZt8JizI0O/
	0xQl64u4ws21D7//4YYwwuyDYSChl4/paOOmJrJuQd1fPx1I7116C6I2jfoGWX6qJdaPsis/cM+L4
	srS/vZJQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:51954 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nMrYo-000Bp1-Tr; Wed, 23 Feb 2022 15:17:30 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-ordered-set: Upgrade 4.0.2 -> 4.1.0
Date: Wed, 23 Feb 2022 15:17:17 +0200
Message-Id: <20220223131721.1683054-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 13:17:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95477

Upgrade to release 4.1.0:

- Packaged using flit. Wheels now exist, and setuptools is no
  longer required.
- This package now has a typical package structure, instead of
  being a single module. The code is in ordered_set/__init__.py
  instead of ordered_set.py.
- There is an ordered_set/py.typed so that type checkers know
  about the types.
- Use the type aliases SetLike[T] and OrderedSetInitializer[T] to
  simplify some types.
- Updated the way overloaded type signatures are written to what
  MyPy currently expects.
- Minimum Python version is 3.7.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-ordered-set/run-ptest  | 2 +-
 ...3-ordered-set_4.0.2.bb => python3-ordered-set_4.1.0.bb} | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ordered-set_4.0.2.bb => python3-ordered-set_4.1.0.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest b/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
index f7b9d0907..c27a6c3c5 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest test.py
+pytest test_ordered_set.py
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index 323fe18fd..2740b3355 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -1,10 +1,9 @@
 SUMMARY = "A MutableSet that remembers its order, so that every entry has an index."
 HOMEPAGE = "http://github.com/LuminosoInsight/ordered-set"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=2b36be0d99854aa2ae292a800a7c1d4e"
+LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=3bf5e1ad64c0d99032c3143361fa234e"
 
-SRC_URI[md5sum] = "5d88f3870c32d4868b28c8fe833f7e74"
-SRC_URI[sha256sum] = "ba93b2df055bca202116ec44b9bead3df33ea63a7d5827ff8e16738b97f33a95"
+SRC_URI[sha256sum] = "694a8e44c87657c59292ede72891eb91d34131f6531463aab3009191c77364a8"
 
 inherit pypi setuptools3 ptest
 
@@ -19,5 +18,5 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 do_install_ptest() {
-	cp -f ${S}/test.py ${D}${PTEST_PATH}/
+	cp -f ${S}/test/test_ordered_set.py ${D}${PTEST_PATH}/
 }
-- 
2.30.2


