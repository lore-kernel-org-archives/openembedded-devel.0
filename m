Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1926.1795113437430996861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qbpfn90w;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso51983a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113437; x=1795718237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojo3IHF3hRwt0FE1i7p6Y+V0iCERKJG6020viiCXzck=;
        b=qbpfn90wQSaMA4TeSFrh9gE9eU1yDBJiWljlTFMp7H02HSWx6sDrQy9yDgrSpGUqhN
         Td745Uqg22nTkbCd00XUUsLqjHewbJ5Z9ViqyHtTT+grdRJC7558PXPe21Kuohh3NpeW
         wP1nJVkY1SfXu6yat56jftQdqypy7+FE05+Og3IG0DtR34PbV+09YGT0z6QE9yExXnhl
         VailkdGxYA308z49XwNN4FnEjC3zi5dDroUUvTku9tzwOfCwz0JTOniidaR4Lz0N3F1g
         jlvKEKQfxpLYnkF+c5lJcw6sNLwxub0LGGwsTgrl4gj2pgBPRyU1xZbmzo7xj4Or/u+X
         d7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113437; x=1795718237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ojo3IHF3hRwt0FE1i7p6Y+V0iCERKJG6020viiCXzck=;
        b=ae2wh4YXhgVAeRCKv+q1beW6UXSlpJfqHHKKhaMJVNb17RKdkPcGvV58f10OWPTIqG
         w+vU58KWFmnoX2h+vraWn+A0EseeurgQ/lMQX5zqZU0Hi1F83F5xeEyyKOk6oTxhSCxM
         bLDEuEkOQrtfFP+ShyITnCBH4h/RSBTPYi4XozJQHtrbD167oz4ZaA+cAOy3E3gW5AHK
         rb+qEHzW0Y/+QLKqQIyIeiWWXqzIPG/CRu9cJixEnv/p+cgABUgtRnQ/fEkzRjQ528hm
         1Qh4a1au9LOrMmHY6EVllhan5h2LP7TXXeXVwEj+r4oD+pwLxuf5C9kPna0YujzBk6RK
         MYjA==
X-Gm-Message-State: APuU4Z8BNUccUIQ90+1iKRShXFQpEXOLeTuPBLrjjWF/XcVC2Gl3ntad
	NGHiJw0DEBpCT65Dm1oX30JeJwtlIU9O1FAm3CgHHb90HEf0E8Fa8mdXHlXpmg==
X-Gm-Gg: AYBFou2hmrdg8rArLBIsA8PNhuJyX44z+UYLCBGb7biQc9ObswFA0OMsSaBmupupzKO
	3InHEB/hUbUNaa6rPu2EsJhIPAFEQhnXsj9ZdDCBU8W5RiqT9rVEi9/zAnU+GNbLFMWbbXLVCEJ
	ml7NsLcl3NJBp661fHw3r0wLn49OJzg8je/NinGA6ewOWi4LR6X7HIv/esrEuqaqVqFfwTP5sSJ
	8N799dGisheTj9WQ2ws7Sdbtx+cs+KDfG0TIkNjZdrj5fDMX+6Ennz/ooTeK2Jqyo/EONX4tgl4
	2xCQJTunKFZhvMtzH1epuHuiNJpln8oSX38ZZu0aUr3BpEAJC3ZNbhCuB5vOTTQwRn1uDcwcTGz
	LB/o5USrvyPc2zFjnFom/+GxY+2AEAowNmTxJc2EyRUAT4bNxciwCaNXYUCNQI93HezBeGm+1pk
	l0m9NaYyikFFZvOsYqj1kmd6BKM1fPDnRd7uaelVw+HSMCqeNyco+qrJsa60NysSTjHHpdP4qWY
	fAa0JBJceFFd8yKofRCQgnBCVooQtaLC4extSuyTNb2nLZO9iISosqKieQev7PNXFjJBZxQs/yW
	WktQsvRDzL5HRbQ84JCAcmlcI3VhRUTkxnoTfwdYbMbEoVEIJbBCdABBvlmnHw==
X-Received: by 2002:a05:6a20:e614:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-4014a271f0cmr485013637.9.1795113436727;
        Thu, 19 Nov 2026 10:37:16 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 32/64] uriparser: upgrade 1.0.2 -> 1.0.3
Date: Fri, 20 Nov 2026 07:33:00 +1300
Message-ID: <8a9b3941890ffd83e6de4127f65b34dd6ea4059a.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132722
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/uriparser/uriparser/blob/uriparser-1.0.3/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 431f3b385d4b6891da019b0aa797f4105cbada15)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb} (91%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
similarity index 91%
rename from meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
rename to meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
index 161073103d..1ef8b15553 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168 \
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "963554c32d40fb6cba5644f1ba63e6dd7a182b2948bd71ee448c532f53b07f1e"
+SRC_URI[sha256sum] = "b5014a630e61e085787f760c83675a35ef8e719972b05e8f61ff2f48692b15dc"
 
 inherit cmake github-releases ptest
 
