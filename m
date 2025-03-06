Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323FEC28B23
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:59:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.10395.1741258773101425100
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aVZEP1W/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bd87f7c2eso2827775e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 02:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741258771; x=1741863571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sieg/y9VV6zVJ7tiVRrewnUrT5qRNOWd2hMAqjPhChA=;
        b=aVZEP1W/ybTBCkl2f3h6Sx9gRPjUILD1H12oezbOWSYXYGdHFweLC3FnApL15keX0g
         J2EAUSn+oKNbPfQbcHAlAM0RdpInabtNPvLBDSyfrioDAQ/MwpTgZCSRl9TkdZ/jMNSX
         UOGB81V65Fn9liCiXj7w2E92p2Nrps+1DzM1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258771; x=1741863571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sieg/y9VV6zVJ7tiVRrewnUrT5qRNOWd2hMAqjPhChA=;
        b=NgHwHnDyPuNtXZMpLiqH9DEJbrzVp788Kwui5FV2cyCMZHR8/ZFNsZTJHQSm+fUldd
         oDNIc3X2nigf0/tTIqXD3XWIfoJLoGCdPTmusmZITtozusjtQelQzUVtSzGhIfMBD6B3
         6hQsA2DRXRsmLgPOi5Jw/tMd30/TUqcHGBpGSEX5nb1ZLrxfFqXQs0C2C2PF7bGCOmHw
         rDLP9OUWM3YyBVafhEv2tFXpKXI1MqFn1vS1QIoeGdEOziqGuzWfmn4Tk/lXCAfCxiMG
         WgWYfVpiPQAXxxzwgnbsjVph8ojrBbzC30UWWo21Q8bvZ9C83tLZj561MFU6Jf70M1Pq
         DTow==
X-Gm-Message-State: AOJu0YxfSux/lCrSfdaiSqk0sC8A/QVtj2MXn9tvkRZP9BNP+VPemRG8
	mhCHIkkCFv9p1xGyWKyakCP2oANMjLeqmzB9sCy4oIRj6QKDDjQXCHgUPuPB9YTO3SZZx8JusPq
	q
X-Gm-Gg: ASbGncuZkM97Tvzcj622lYIFtL7ydFVKNgp5/gt0K3vOW5G5+sYQajjGHt0IO24wK0n
	druQpKF3zcaSvpsOLkYK7Knq8OmISKqRmfSk98YXXccvNnX6XXIUixhSO1Kn38VpTSCj7B07NLZ
	JJYc+Qa5wA+CkdhGmS1xd0hFFK7ovbVw3+JKhwu/1Ql/Qv9DslpdG3bu5yP65RKD3HyRZikBPan
	+Wgtr8UhJLPyUWGRSEsL/geH2P4fijVUZEP6SqTFhAhLhHqHLG7vR35EYugI0ga2FZdFm3GuOtg
	LsySHV1QI19q1jEmVFPTYibg4BSvlR8Ev1rV0C+uY0NW4u5gfuMbb3BqS9M=
X-Google-Smtp-Source: AGHT+IFIGRWU2QrJ4rXTS9oLwaxDVXyw7H1jJ77NzI9q3WgriFuGo145p0cUSaMUbz0vCQznqA/HrA==
X-Received: by 2002:a05:600c:190f:b0:43b:ca8c:fca1 with SMTP id 5b1f17b1804b1-43bd298f166mr69332575e9.16.1741258771027;
        Thu, 06 Mar 2025 02:59:31 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352ed7sm46244835e9.26.2025.03.06.02.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:59:30 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-alembic: Upgrade 1.14.1 -> 1.15.1
Date: Thu,  6 Mar 2025 12:59:27 +0200
Message-Id: <20250306105928.3735026-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306105928.3735026-1-leon.anavi@konsulko.com>
References: <20250306105928.3735026-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 10:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115768

Upgrade to release 1.15.1:

- Fixed an issue in the new PEP 621 pyproject.toml layout that
  prevented Alembic's template files from being included in the
  .whl file in the distribution.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.14.1.bb => python3-alembic_1.15.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.14.1.bb => python3-alembic_1.15.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.14.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.15.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.14.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.15.1.bb
index 1e9279977c..1ce840336b 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.15.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "496e888245a53adf1498fcab31713a469c65836f8de76e01399aa1c3e90dd213"
+SRC_URI[sha256sum] = "e1a1c738577bca1f27e68728c910cd389b9a92152ff91d902da649c192e30c49"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.39.5


