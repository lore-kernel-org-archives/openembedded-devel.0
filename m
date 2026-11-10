Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7.1794324457850411101
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RYnTbrfh;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491d1f66968so265509f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324456; x=1794929256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHQbMmw+wR2cGXAGl9Icrd72d+CYhzZUNLRof0gRUqY=;
        b=RYnTbrfhKwWxmAA0hAaxvCuojLkqlyBeZhdacrNQbx/DMnVEvyo0hIQfnaX5Hbjx5u
         EFu5h9ACniy/ZnVSAbOalJgwfbctXwqNcZTB89MT/FMa2GFcla5RXk61/EscPBMvopZh
         zyWbzB142MaW1z7ZxbKhX2NHesz53MetTRqf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324456; x=1794929256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHQbMmw+wR2cGXAGl9Icrd72d+CYhzZUNLRof0gRUqY=;
        b=zragfEeCw6sbv8kROQqapOjo8qCPB4E446hdM3gQNId/fxQZUZnfG5BP2I03/VRU1L
         Ue9gPzWhHPYXuEKuuowR9rF2VcwX2oOvH59mR+iXleHnCcsv4HngoRBuEBy4EFtmh7Nc
         7lHm6mHnV18+wkYAnFKGsytj2EP/y0t8bctXgGBX5aUUXo12Cn0yGXsZaToPwYIjmXa9
         2co6dlpLz26Auyh33NMRWqC18AJFKwSrNzW/WIhcjD7BJPnLN0cjLtgmzOpIYeRoTe3Q
         MS5LqnFp6NI+W5m3y5KZh0zPfAs83jjEEF0zklz7KPMHybuX/DJPhK+2x6YWOMHt5875
         X36w==
X-Gm-Message-State: APuU4Z9107UpslQtG2LBk8qbFM3pCdCnx/ofPbMMfvPvUv4j7FB7n0gF
	1P+9Re9k6rVW6iOvk0b8owFqKpKMUfQvDx278bdZFJTwlT1++evb+hEid+RliXg/mYG82x3sMgJ
	EvQI2
X-Gm-Gg: AYBFou3psIVPodrgtYFMZoP6tWLtsqo/azB1Wv+t9oEaoTOkbqeA8l4Fbt196K3vRzN
	1xVOJ5e2i4qCZQaYeSvPMr/TMG2UNVVyuksLQ0iDzIKS78Hcuy01sVHPDSaqa5+PuP4rBwOQACg
	T3glrEOlmeQ8xtSx242TyXToZN2kO5AorJR5jEfTz1+dY04uP+tC0fJ7jKzvTkL4JSuj/oDkPMD
	RDv2hPhtkXFPM0in3pBnGyiuhjVfNAgqaqw8SvQPtgL5hf2JiM9cuQlmjYPMWBO/+X1/4rEVdQo
	KOpjQAP+/XWxgAlrRP0gU4guT9iNGlEWHKEsPsj42pl5OnwoR1YBQ/3et6dt8C87GZb4tDahOfo
	TGpPzlwlke0+kdzQ0fkopH2UpFpjjWzTC1XtV6wSGdJEXChH4MGyJOY2h7KcbHAxVqfKPpuBonX
	TKd05m4KTIRZ/jdqqi7tJjpa+6z7/foE0N6xCJ1XHIMVv1vOMinmYOvjT4x0dguorPOqvlodOUe
	YMYyIXdXkbM0k//sbcaGrHnJT0lROOgDoNlvUZJjqaYC99JiV/F2xyss2HdqdFHMc9eN3Cex3BH
	RGklAqq5G4sYu3yolI//8mam1XmCp9vWcOuifSSHukma8AcnoqTjLBDuvmGQyv0SNNnRxyWpMrT
	qj6vOSv3lehAC8hZqUPHtSGm0lnyOLb03CGrfKeQMVn/C0FPFC6UiyzcNfU32/y7ymMbS6KLXIz
	c=
X-Received: by 2002:a05:6000:3101:b0:48e:60ed:b012 with SMTP id ffacd0b85a97d-49831154934mr6183838f8f.57.1794324455993;
        Tue, 10 Nov 2026 07:27:35 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:35 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/19] python3-inline-snapshot: Upgrade 0.36.1 -> 0.36.2
Date: Tue, 10 Nov 2026 17:27:15 +0200
Message-ID: <20261110152729.1065911-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132079
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.36.2:

Fixed:

- Reduce memory use in active snapshot modes by eagerly recording
  snapshot changes without retaining completed test frames until
  the final report.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ine-snapshot_0.36.1.bb => python3-inline-snapshot_0.36.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.36.1.bb => python3-inline-snapshot_0.36.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.1.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.1.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.2.bb
index 5d25934fa1..e854384776 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "ff57828c691eaafe03426de25f2c21a1e382905dcbe110934df862297e8c5f8a"
+SRC_URI[sha256sum] = "fb30d99a915a768d1c46ab5b7576b7ee2a8d60eb31063a14ada305c05bb5ffc8"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

