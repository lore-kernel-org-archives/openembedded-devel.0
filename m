Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455B6C369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:26:47 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.25072.1744252003805241747
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 10 Apr 2025 11:26:41 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.127 with ESMTP; 10 Apr 2025 11:26:41 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] memtester: Upgrade 4.6.0 -> 4.7.1
Date: Thu, 10 Apr 2025 11:26:40 +0900
Message-Id: <20250410022640.313595-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 02:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116749

From: "mark.yang" <mark.yang@lge.com>

Upgrade to release 4.7.1:
  - Change log: https://pyropus.ca./software/memtester/CHANGELOG

    Version 4.7.1
    16 December 2024
    -fix compile error with stricter C23/gcc-15 due to incompatible type declaration.
    Thanks: Rudi Heitbaum.

    Version 4.7.0
    28 November 2024
    -fix alignment issue causing crash when specifying a memory amount to test
    that is more than the minimum 1 page of memory, but less than 2 full pages.
    Thanks: Erwan Szymanski.  Also reported by Chenghan Lee and K R Pallavi.
    -add `-u` option to allow uncached memory semantics on some systems when
    using the -p option.  Thanks: Florian Fainelli.
    -fix manpage highlighting of args.  Thanks: LÃ¡szlÃ³ BÃ¶szÃ¶rmÃ©nyi.
    -add missing option documentation to man page.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../memtester/{memtester_4.6.0.bb => memtester_4.7.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/memtester/{memtester_4.6.0.bb => memtester_4.7.1.bb} (88%)

diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.6.0.bb b/meta-oe/recipes-benchmark/memtester/memtester_4.7.1.bb
similarity index 88%
rename from meta-oe/recipes-benchmark/memtester/memtester_4.6.0.bb
rename to meta-oe/recipes-benchmark/memtester/memtester_4.7.1.bb
index 42cee1108d..fd6713ea9f 100644
--- a/meta-oe/recipes-benchmark/memtester/memtester_4.6.0.bb
+++ b/meta-oe/recipes-benchmark/memtester/memtester_4.7.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "http://pyropus.ca/software/memtester/old-versions/${BP}.tar.gz \
            file://Makefile.patch \
            "
-SRC_URI[sha256sum] = "c9fe4eb7e80c8cef5202f9065c4c0682f5616647c0455e916a5700f98e3dbb2e"
+SRC_URI[sha256sum] = "e427de663f7bd22d1ebee8af12506a852c010bd4fcbca1e0e6b02972d298b5bb"
 
 do_compile () {
     echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc

