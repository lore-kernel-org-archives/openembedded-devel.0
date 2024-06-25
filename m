Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8E5C41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:47 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.167248.1719305859206514744
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o7B9fklf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305860; x=1750841860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cGbxGtieFMLMfRF8G7k6SYRv+5VXnQ1fxqSiPxY0Sa4=;
  b=o7B9fklfta9H+tsc4uIcJh36MPxuUJzhQ8G7LrGXwZc3c3Omxd2bGtah
   Td5HeK/ysUjFjoM+T9aAtzkHnr7Ntpe9ghMGsdQcOZ4A32aBAD6OsXqyD
   pxHYHKJ5G6KVyfTW9o0ZPrLLXIJjrPa89nyMaRFvmk3qaslabS6mZaKhG
   asYs/SVARD7qT3a7IKKzIiBSbJK9Db0zRtlB5Ea68lXSHXjYNYTuPPDvS
   eivrsuZ1mc0S9gJWxUaqKQkjFFW0Liqg1xGF2vf267XIN5YaSrTzwp28S
   kp6C5dpBaoRY9VL9N/BEcqvoqqO/F6y1ka/OIFPJDl6e+VgDavggcePD0
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164869313"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164869313"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:37 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3269BC9440
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 78522E99A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C7D52007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DFA871A0002;
	Tue, 25 Jun 2024 16:57:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 56/57] tesseract: upgrade 5.3.4 -> 5.4.1
Date: Tue, 25 Jun 2024 16:56:29 +0800
Message-Id: <1719305790-11484-56-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-0.097400-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrLYdywTHl7nur1gUu9f1F/1YM
	JR3dIrh2FcgftLQNTGw3dSIXXgJIbmmVAlNV7gkXdIWjq6te69oxXH/dlhvLv98pqleQItEFiji
	J0PQAhX5JEnhpRqjMfgpG4pEjrtHgRY1tl9vG/AaVd49c0zgWM8qspZV+lCSLXV1u6a24SnIi83
	oNPpjb7O8CS9vvFOCxxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+A+KgiyLtJrSC5BWXfK+lF6JFjQ
	nJ9F0Di835cqE5FoUWAMuqetGVetnyef22ep6XYxlblqLlYqXLC4QRgfd/Fj/PWy+pZ/Tyon9Xn
	uV8OTDsjvUUxLC7rQJunqUZ3tGcR4xz+RKz71S8HtQ1wafBCXHJLnJqbTvVO+ZzOy1n1ffr+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111068

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Avoid FP overflow in NormEvidenceOf
* Small build fixes and code improvements
* Fix setup of datadir on installations with Conda
* Fix FP exception in Wordrec::angle_change
* Build fixes, code refactoring and other smaller changes.
* Fix grey result of indexed PNG in pdfrenderer.
* Rename frk -> deu_latf (ISO 639-3, ISO 15924).
* Remove broken Dockerfile.
* Fixes for several issues reported by Coverity Scan.
* Remove unsupported OpenCL code and related API functions
* Facilitate vectorization for generic build
* Add PAGE XML renderer / export
* Support training without lstmf files.
* Improve CCUtil::main_setup (fixes issue #4230 related to Coda).
* Allow for text angle/gradient to be retrieved

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/{tesseract_5.3.4.bb => tesseract_5.4.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_5.3.4.bb => tesseract_5.4.1.bb} (91%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.4.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.4.1.bb
similarity index 91%
rename from meta-oe/recipes-graphics/tesseract/tesseract_5.3.4.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.4.1.bb
index b32bf3451..1177e34cd 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.4.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.4.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "8ee020e14cf5be4e3f0e9beb09b6b050a1871854"
+SRCREV = "b5f279ec7582dc57f6464557ed938558791f200d"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


