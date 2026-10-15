Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0EBCC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33259.1792043069615014368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Isr+pMlK;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8fe8e343fso19139325ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043069; x=1792647869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=05pmy58e9f+lkcU6wBrTK4VJVqku53rpnZuEpFOE+sU=;
        b=Isr+pMlKC3OMxSpM+1FhEO8lSbMF1II367EBWO6YCr9TRhbtb2UFxxmW9zk8VpPQnB
         VqS7NLz81PB3ATkCXYg2G0r7aKn+LAwxnBoa9WEANM1W+mjYmj02N2rMyX5aPnCik2xC
         DX7wnxzGQ6u69+XjVqamoeCETEibah9RR+Wr+DsZmD8Qvtl5LIXgO48VdwM42l0LLSKO
         7iFDcB4zPCssNH9BK5ocm7cf2MFP+9MVB63a8pk542AUmgk6ZWEyCunwasE/IfekuRQ6
         MmEKzsDmZVzRiTUqrXbasDGtDdCgI8QJ8Ffvzk/8LmoUWGDpW8YYZu+UCquAgs6S6h8q
         YEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043069; x=1792647869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=05pmy58e9f+lkcU6wBrTK4VJVqku53rpnZuEpFOE+sU=;
        b=iJdaL/80M62afB9dyBoxg1GE8/OZm5ngYbHgtAg3LxnpFPyuk5pXsAjdSH8fh/xJ/l
         mVqhdSXF9GXDTFiNbHdDMch/GoCoVafIlqgPHrFMbnAFmtnUsVkiVEbDt1squXEnMqmo
         ZziQsDCeF0uix0Aav3wJrLgFxsgXdt/2mW6XUoS/VH3auOJuowqdDuTciF/fumMLVlat
         lDRp3YrqSQH4t51g76miJ3YDSLXudod7g3aNQzOmcdxtReRKrDFWQhBQivbHh1l1qax2
         QVkpIKzHSGctFzDWCiAerqN/Mp9txWE9IpduggZr9xSCvu5uUPKfA1zyRigDAn4csCZ6
         Z0RA==
X-Gm-Message-State: AFq9FYJDDD8A46J9/2coW2cjAUP9LS7p7GzmI3GzC+wwhuI7fio+57Ww
	XvraX3tH1LMX7g3b9rFoTErafnzJXHTIX1Xabm78TfcCN+QhNe8plBGX3HMghg==
X-Gm-Gg: AYBFou1A3Iy4awFA7Kh0xL+GhJC93w0Bl5lErJZefF5VFe+GrV5eA0OAk7/FHeVLG2d
	LsiGUNKeaN40rvbnL3JtrFJTADP0iQQTdLhJTK6Aa3VmYPXN33D/ZH9bNAFv6kfybh6U/FqB7Jm
	cfbAGAqhSwKl2lFvXAmruMJ0VAsPwtraV55fw7iF6uIQl9PLbAJHosk5CNGwXsArIpskPiHN+FL
	++thJkxSFf/QCa0RQQ7DiqLsiCSopCClwY9BNpPObJAz0t8IVSHFgZyIuPIiM5pXAB7gXAsz++2
	R3teY0/4CK2BoV3jf7tpgkjBJIqdQLqq/0PBOybMXgp3G3c/j+GZj5CTGTL2o+SE+swhviIioB/
	kfqr+gmv+DQ5NQ4bo5NAGkY53hXNvjooLc9OUM2NWBxKR6M2eJmNEBsp6p1112S3qv+YGdYRVBX
	LE9zIEFinjE1y99Jct3UjzzGNAwnKXA6wCatBK9+nls6P0efpKpbjk8D50JMNsKwYsXi35qcf8J
	mUC7pEpA1doK0jet+o90yc=
X-Received: by 2002:a17:902:eccb:b0:2e9:4e83:196c with SMTP id d9443c01a7336-2e94e836539mr24454435ad.60.1792043068921;
        Wed, 14 Oct 2026 22:44:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 46/82] python3-astroid: upgrade 4.3.2 -> 4.3.3
Date: Thu, 15 Oct 2026 18:41:34 +1300
Message-ID: <783752d9f0336233358bfd93512938f6ee5044d9.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130966

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pylint-dev/astroid/releases/tag/v4.3.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 486ef820db2ec71ff8da90f4c9634a200d6a15bf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-astroid_4.3.2.bb => python3-astroid_4.3.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.3.2.bb => python3-astroid_4.3.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb b/meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
index 55f4d01194..c9a209aba0 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "8cdaf5b7f3f4f39557ae05ed8b0852136b43a04ab686db7d39255b206233677a"
+SRC_URI[sha256sum] = "d03854b09d92c08e18d8e7d9185d393961186ed0747136d8fcb2d1c008a504ec"
 
 inherit pypi python_setuptools_build_meta
 

