Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CF6E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 14:00:48 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.20735.1736258447953942394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 06:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gfBN3seM;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so29413840a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 06:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736258446; x=1736863246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUPesHUUcW2l2tMJUZuAO/PU4AznQi6MwDDBGMKq0yo=;
        b=gfBN3seMpJvTV7XmsNsOfTJPHVSQ3HeCL3Ua15sNDXRrBseQxV9Bbsz8pyTb+Aj/I3
         6OHHlqK5VhFIrxH1QnAW2VexE3s7PGpWssycke0TDR2f7vFPJ49WjcOhqFDeFlkQvcVy
         74+p7nV1kjVLwgrRXR6DGx+y6kUhMvCtGVYE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258446; x=1736863246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUPesHUUcW2l2tMJUZuAO/PU4AznQi6MwDDBGMKq0yo=;
        b=EoYw76o0x9gTEx8JwUtXONvIEYhmcS7ZDJjXaCosdb82QOG8c15KJLV9AySw1DaGOu
         Nrta/Y8aFWGMrUshXlYtVcyDysZSBq0odulSX7xJioJU2wfuqrrxIt2BwR8v44Q1rJ51
         zJKBYJZzXfGcL2KfahKzDOsgvAsa/hs1q6+DcMnqs50otHQsSzfVEl4XBQ2OZzu11TJq
         lNg2yy1Hn1u5V5qupfaOEt/wKm3OG916a87oIQfvYzRKgkYGB+AWnUNMm+rLTZIbNmax
         ZJkGxqtS6F5by8cBu/Jg2Cx+L6QlzmRl9oNs0YIeqwpKJBQ3MXzZ+x6d54mhcThs9EvA
         Ds6w==
X-Gm-Message-State: AOJu0Yxisi+btHo8Iye+QKZMcKWpZwhhCPvq+FVly9opnECf7GXSeAcf
	ZLLUkxSQrVg5EEWvy4v0ps7zgAMfzfR2IrGIAwSBKhnJJgBo+BTY334E/uAAXZL86Cpsn5766R/
	e
X-Gm-Gg: ASbGncsrEq3Eq5SO+j9+hI5tpMXbGi5N15eaM3Qe5nffnBpUCL5qtt5j234KDHf9C+r
	4diLfJaqzMeFQlHosdbm3JKcSy2/lz02DsyeYeTPWW4rGYzggwS3B88iAGIxSwk80bJ8lxzS1P/
	LMzLNmGqHBdUCvTY+fb/NTSJQXuEcm0gkZTLJ+KqRUC527g21mFbGs5nLTb1/+hPU6S0aeCuBBt
	KpfYBDtcxbTpwy+45Sou4CeO73UE7CTtkoJ9+eeb8NlFl+MkPz7vKrNzZASTgx02d3uUd0=
X-Google-Smtp-Source: AGHT+IHHfeQ+ptbojATpNR8FOGYpAaPoiY0jbGzJxO5iJ2I2lHn2CY2ZD3i2rCtu6Rw8pP/uXYRRCA==
X-Received: by 2002:a17:907:7f1e:b0:aae:f6bd:7f5 with SMTP id a640c23a62f3a-ab291861744mr236493566b.16.1736258444123;
        Tue, 07 Jan 2025 06:00:44 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm2403422166b.93.2025.01.07.06.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:00:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-apispec: Upgrade 6.8.0 -> 6.8.1
Date: Tue,  7 Jan 2025 16:00:37 +0200
Message-Id: <20250107140040.3330151-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107140040.3330151-1-leon.anavi@konsulko.com>
References: <20250107140040.3330151-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 14:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114703

Upgrade to release 6.8.1:

- Fix handling of nullable Raw fields for OAS 3.1.0
- Support marshmallow 4

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-apispec_6.8.0.bb => python3-apispec_6.8.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.8.0.bb => python3-apispec_6.8.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.8.0.bb b/meta-python/recipes-devtools/python/python3-apispec_6.8.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-apispec_6.8.0.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.8.1.bb
index 9df393b95b..7619210eb9 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.8.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "861cca82bbc0652ca9acea896921b254944580342fde849f86f6dac1acc6ca96"
+SRC_URI[sha256sum] = "f4916cbb7be156963b18f5929a0e42bd2349135834b680a81b12432bcfaa9a39"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.39.5


