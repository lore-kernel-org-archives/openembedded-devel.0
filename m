Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43D8C761AF
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 23:51:04 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.118099.1680652255084745890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 16:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fZ5I101X;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680652256;
  x=1712188256;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5cYbIG6ml0KIBd2RXAjN8fJ4AAlrzcbAkpR2LemReTk=;
  b=fZ5I101XCEkJcN7vjBv9LGGydhDfsYhLauD+pqJNMZx8dQlQMfw6m1bQ
   4l/0npouGIt8s5wINOOAJmImwue8ESfIAz2dRGxa8Woo0E80H9wBOBgAF
   OufIlrpnuzlLqDyMJhEexpzkVtRLHay38s7eIWl2FrJLDeLrLYb0WmjaY
   zB5VvsHFq5bwNxSJAmRI9NiGmQOwm6M65TvbKpAfwya7Cra6INcVBgRyh
   zyNFGF7RCQT3mN6+to389qR2PCJXgCSefEHHG/J90+3jCICiMYkfHxXIl
   f9zoaUzhsjheP07XqSWBAtYEtpBLlkPR89F6ARhcIjKPDPR75uSOO2pUi
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 3/5] python3-crc32c: Correct the license information
Date: Wed, 5 Apr 2023 01:50:45 +0200
Message-ID: <20230404235047.601178-3-pkj@axis.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404235047.601178-1-pkj@axis.com>
References: <20230404235047.601178-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 23:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101954

Correct "startline=" to "beginline=" in LIC_FILES_CHKSUM so that the
correct lines from crc32c_adler.c are used.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-python/recipes-devtools/python/python3-crc32c_2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
index 203256895..da756ea07 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
     file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
     file://LICENSE.slice-by-8;md5=6b3bc7709d6b2db6646ec2467310ff6b \
-    file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
+    file://crc32c_adler.c;beginline=9;endline=24;md5=9c8bd2afd2d340fd37c038759cd4eff8 \
 "
 
 SRC_URI[sha256sum] = "17ce6c596ad0d53df52dcd72defb66984aeabd98fbefea7ba848a6b6bdece36a"

