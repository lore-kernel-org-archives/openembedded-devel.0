Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41238.1795611514735372961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=D9cExlbJ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2627754f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 04:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795611513; x=1796216313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvZ6G3BYOWGZ2qW0mYByqAPr9pHhwf3tn98RNwdJ3Lg=;
        b=D9cExlbJJUSqzyb/qhrKNU9bTtPds32TjCfM7niHJI2s2QsgfOBnHf7j9BQtsgPxhA
         6dmcMlar4kwvec/HnbK9vmqGHM1tTL9OS+fA3NzhiDzpC6KEm9krprvD90t4Qa4hXQcg
         VtOOYf0wsf4f1aEDMYlNx+ZWVVtKwGhG5tgg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611513; x=1796216313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvZ6G3BYOWGZ2qW0mYByqAPr9pHhwf3tn98RNwdJ3Lg=;
        b=CZpGDLBjGb2gKKQi/ly1cb4UYvByNmyJpZHfWnvRoql5yr33EGXu/pSlsVPkWTVDRR
         a6YFvBQKI7UMPtfsuIE1B3o2WKGVE0OIb4rwWgp+YRENJXzqgCpQX0f8E+Q1LHtXJFIo
         JnvRRBEoJ5iST5WnaFUVUaERDslsMqSPJ5MvxCbLShR3uR0QTufMXi1TvvnF3IbeDH3s
         xdo2lEXKRdLBViMMLJFr5UZ0mNic3Azn7TAQb3cWI1KAwqlhqdnXo34MpgTHsok9v0ET
         a5XglUrjUQufOJyyGccmbyj7A5+hLiMeS+sK8qjJa78ezmEEak2E/O6GSyBPlvSH2YEO
         DNYw==
X-Gm-Message-State: APuU4Z/Z2sbPwC/Bq4WOdxa5HjkEaS1hCExyYo/Z3HkN9wCimjZoqc3J
	ZGr5j9W6vEFedTnZKfRdkf08T9uO9/yoGg5kWOPbCQFmi9ZJS2mzQ/ly/MhB+r3UWhvFhK9bqb4
	OXFMp
X-Gm-Gg: AZFdTZfoGShRU+8uloVB7u8T2ryZ0OMxKW3DKy6E2mvhcNGKtnpuk5bqTEOv/QIhAUA
	Co/GNcQj35YsRDhfx1NGHRnbuqAnMxC3GLPJkSWObignTw0Ids76MkaOYAyWpvvITGL3o9dOR9l
	1+riTbahUtPpqyw9wXfJJaG058iGt5dt4Evo+abs/b/6yMC7KuFK31IdSVXd6qLqr2ymcdCe7ev
	MIQ7TgrSM52lAMgu0kD/bUcSifVv58RyqquvoFsRXP+Qrd/6gg3hGve3aQz81w1Uri1ee63TbVu
	Y/PU3oHfoWgZo5YxIN15t7I/A8U8v6GOyFUL1zfXedP35xnFckKH9cuj0Q+gXlHg4kJlsGSF/YG
	JS1k4NWcfc0U+RsjUeEWxxlhpBaFCqjvGSB+nxklbb55sDqHXvvOTGDXSYqqwpAXl6oJJWE1k1y
	fvTEtJZZqfuEX07dxVgeOiXlCbeOtMUUPpEdkfJDu0KlnJUmMoeN8k8pLtJMzXbuuBc3i+Uzrmw
	gILsD1GvACJypY0XLr1skkJZzz7LMXFe6qrpdjAZ+KrD5nBb7DRp3ZIcjyuEeeWas0o4AFKKxhF
	Lj+Y7wwAjKNopIYqkVYs9JdRHw/j9j88xYoDjmF3zDMfad0qUrFoCINqxvpNS/y4pb34UFTJ2ft
	TSkbyyU45r28MnXiNOPEkqdwRfrHMxPdu0cSjeljYjjNHGvrO6OuBTQ==
X-Received: by 2002:a5d:5849:0:b0:4a4:4229:c3a2 with SMTP id ffacd0b85a97d-4abaf7401bbmr38813631f8f.11.1795611513057;
        Wed, 25 Nov 2026 04:58:33 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm32919300f8f.40.2026.11.25.04.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:58:32 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/8] python3-wand: Upgrade 0.7.2 -> 0.7.3
Date: Wed, 25 Nov 2026 14:58:23 +0200
Message-ID: <20261125125824.1799066-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125125824.1799066-1-leon.anavi@konsulko.com>
References: <20261125125824.1799066-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 12:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133080
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.7.3:

- Ensure a WandError exception is raised when attempting to get or
  set an image property without any images loaded.
- [TEST] Removed itertools.product() calls in unit tests.
- [TEST] Rewrote assertions for Image.clear() unit test.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-wand_0.7.2.bb => python3-wand_0.7.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wand_0.7.2.bb => python3-wand_0.7.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb b/meta-python/recipes-devtools/python/python3-wand_0.7.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
rename to meta-python/recipes-devtools/python/python3-wand_0.7.3.bb
index fbebb5147e..260b7b2663 100644
--- a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wand_0.7.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2a2b05e6331064556e971cfa0efca0bf"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "0387fd08848d00cadd1d885fcb19a17dd4250df2029e5338b6b668b7fed64b5b"
+SRC_URI[sha256sum] = "0ecec0f972cb82128a0d2918b9fcc1d1bce04d5b54f590839943df31e55e5274"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.47.3

