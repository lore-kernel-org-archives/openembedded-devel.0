Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22FFCCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 13:01:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33856.1792414867523414441
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 06:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DbmYSR6l;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so18532305e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414866; x=1793019666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uQNUaY2uMrIrBdptRpQ7XKWlUZZueO8kRuWZlCQ0UPk=;
        b=DbmYSR6lTxre/EkW3DwxFAizSTnnYeMeNt1Gr1XY7/gpYktFCSfy4VFBMZIp6c1lau
         in1JH1KKPf1aJaGoinipME/1BF79HIK6eGsIUOggCOwYc+doFsN/zmdd/ZChm1ECjg3E
         Ou/km2yMAYEnzbo3/AIxaTK7tZgOYO33RMdkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414866; x=1793019666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQNUaY2uMrIrBdptRpQ7XKWlUZZueO8kRuWZlCQ0UPk=;
        b=xsAtMLZn48ehopXNIeyUOSdtVN11HaUCBrbg+sApLVWMgVQKS0jyM/Q5aqtBaW1PNB
         OX8vZnF5OhHA8O8iColeaNTgnHEiW/zCTn25lDzuc3vxnLTi7goinQFJsa5btSx2OHIc
         FRZ7zS8pF5SQHgqwdlCqDV2N52l9AZFaRa4NfIvI0IQz0VBoUW24K0G4AAB1s+WPlXuu
         Nt3+18DpJasJj3mORodVE8t/F+7sYA9oHW5Tb7CO5Aq1yyaZd2ScwptDvMuAjNlUf62K
         N6p4MoXRhBwDNECFHEByvOJRDFIrebONaKe44/pWozvhzW7RfjQUlMCsK5lYAP889XBX
         6k/Q==
X-Gm-Message-State: AFq9FYLDJwCceJX10LCFkY3qe7L9HBKgN4Jzc/EAQp9T99m0sV9Kbn0o
	pcdwIXzSBtjctNqZLeMsZiRTRDtmnfeKcNrgsN1JI82sEHt6rBpkQo4dhdCtuh4ano8O0CZVw5S
	ecmCJ
X-Gm-Gg: AYBFou1/c33V4qJdJQ05gnrmXHvqszJ4Rouxso9p3MK4GO2xtczA55AFTc/VGNaKXho
	yeZnSA/CqPhBAlm/jGTwR0x2ITgd0Mg2NF58RKs4jxHiUhpN+UjGqNavSXlgTjg8UPW5OzAHn0o
	bPX1MCFg0TEjHe+YzFdXBzZ188piiDFhKWXPzcyleHyA4X9/dmtQ3VGdYqeogJ7zCFBm23XCj/S
	5fWzBK67jRfpN9D/lRECJLLIoAYB36P/P3tA5i7Ffc3Avmh32EkoYec6fBnxXOH1kA/gOO8wQ0s
	iOt5yfd3eKdJrJYrWQrQRsT7W7WMjbn2d4FcfayvKeoex22/Z6784CX1PdDSS0S4aPqSWpt79mf
	I3PphArpZQbydYOrWdGEv2Fqw0pwVDh2qoY7DR+vgJRCZop1i4d1EIS7z5v+uJO3gWWxobD8xY2
	66g2wx61HXZwbjKMcm0kPkhqJ2AgkBnrxmSAc4ScDzFH3QLRrfZEKIZ58cWV0kOlXc7Vew3Qway
	jHsBooD4aLKewKSOpxpbbSDUyyXPHXwDMp9C34BTQIVzzi2d3KvpqejAFSfzMw0CJve3F1gLCsu
	y6/6F/D88r8A2MzRGDTdmGM=
X-Received: by 2002:a05:600c:8486:b0:4a1:e7c2:9f48 with SMTP id 5b1f17b1804b1-4a1e7c2a05bmr57911755e9.10.1792414865057;
        Mon, 19 Oct 2026 06:01:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ebeccda5sm46161625e9.3.2026.10.19.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:01:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-breathe: Upgrade 4.36.0 -> 5.1.0
Date: Mon, 19 Oct 2026 16:01:00 +0300
Message-ID: <20261019130100.3889273-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 13:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131126

Upgrade to release 5.1.0:

- Dropped support for Sphinx 6.2, 7.0 & 7.1 and added python 3.14
- Strip leading spaces when making initializer
- Fix duplicate constexpr qualifiers on constructors
- Handle C++11 extended friend declarations
- Keep template arguments in class template specialization names

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-breathe_4.36.0.bb => python3-breathe_5.1.0.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-breathe/{python3-breathe_4.36.0.bb => python3-breathe_5.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb b/meta-python/recipes-devtools/python3-breathe/python3-breathe_5.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb
rename to meta-python/recipes-devtools/python3-breathe/python3-breathe_5.1.0.bb
index d8dffcf948..102e4f7a9b 100644
--- a/meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb
+++ b/meta-python/recipes-devtools/python3-breathe/python3-breathe_5.1.0.bb
@@ -4,11 +4,12 @@ HOMEPAGE = "https://www.breathe-doc.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9e49eecf36fc015de7c61a0247df75d6"
 
-SRC_URI[sha256sum] = "14860b73118ac140b7a3f55446890c777d1b67149cb024279fe3710dad7f535c"
+SRC_URI[sha256sum] = "ff56af8bfd0b50ebf10c81a07b8a5739787eb015d26b4ba162b6983d6e17c7c3"
 
 inherit pypi python_flit_core ptest ptest-python-pytest
 
 RDEPENDS:${PN} = "python3-sphinx"
 
+RDEPENDS:${PN}-ptest += "doxygen"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.47.3


