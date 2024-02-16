Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94268C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 10:42:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.16007.1708080142046038912
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 02:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cjXs7jVD;
 spf=pass (domain: linaro.org, ip: 209.85.128.46, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-411e71d8a2bso13184045e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 02:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708080140; x=1708684940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZNoU+fOxY7u9ZugXC6JCKx4dgjRZyEJT6v0tie5Ovs=;
        b=cjXs7jVDc43oDQp2k/9OU2GBlBVDcct4smdJLe1J6yvnKWeYaMjEYzqTOGDvUM2bq5
         nUAKJHoy1pxUqZDaE2or6pdw+SdYOdkFFVwfCWwWSpDMYnrNtogOHE6Qb5+TogaFZh/W
         MG9uw6De4JtJyJEJa3abpDKXVJUvYLIsA6itR2UjcsYJIrsGro27JwktFe/qleqHs/Lw
         AAdXk8QOx96X8NhH/E8FgLb2SifRE1+C1mMSZnOI8W8fi33bgMsAN1rDJzmHnlVach4i
         rYiZMD7T5Fv0XZ48fpZuQ+VfPepl13JSxyu68EQklk1M/NeDBWIsqh1Kd5fXKecEpelV
         nd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708080140; x=1708684940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZNoU+fOxY7u9ZugXC6JCKx4dgjRZyEJT6v0tie5Ovs=;
        b=c3QF38+6ypdeqLKm+6qmG930R73p+Bli46ZMPz3Y+YaRtminLqt7gzNOPr7Qz+KDdq
         SPtjImnAW/ASXGN1plD75g0vSSqrFRQP65+/+tE+rSNIW8vOQfLmwqUdZhh4OJpHt0UZ
         gyiVrw70elK+UD3qj9BBI87ppQQtUYXtMblhT0VJt8kG+eckIp2742AafGKyKPJvlS2i
         w01BcN9kzPKEYRCKvFNVb5IMURbDRUuk/MA8+KrXgGnPmRKDXdMsw9JLhW4thExufMCq
         XqCr0puCmcoQsA0GPqJu1AmJoufVNBIOsTqechKtxZZ8zORBRn5JrW37FHRLqYJqaYY4
         +OKg==
X-Gm-Message-State: AOJu0YxoLjqSE+qc0OMMtKorlHbY0XrNj3Xs67A5hdlWoJbFQYRvoDRq
	T8QIKKnHBt2UfD6gLp7gsTxdWKMmQcAQSpedd3utHjPsI95iPUbApmjNjxSK1txHTPbJkrGfLfn
	kHWE=
X-Google-Smtp-Source: AGHT+IFN9wThCmmj3wez/MtHkkt0fCkjEWjNXmvYSf23+voIDkiigr1fvkLrQHn+Qq4EX/US6uT+fg==
X-Received: by 2002:a05:600c:3847:b0:412:2122:d500 with SMTP id s7-20020a05600c384700b004122122d500mr3043833wmr.3.1708080140052;
        Fri, 16 Feb 2024 02:42:20 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id jl22-20020a05600c6a9600b0041069adbd87sm1903682wmb.21.2024.02.16.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 02:42:19 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-python][PATCH] python3-django: upgrade to Django 4.2.10 LTS release
Date: Fri, 16 Feb 2024 11:42:03 +0100
Message-ID: <20240216104203.1529804-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 10:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108762

Django 4.0.x is no longer supported since April 2023.
Upgrade to the latest 4.x LTS release.

Fixes CVEs:
CVE-2024-24680: Potential denial-of-service in intcomma template filter
CVE-2023-43665: Denial-of-service possibility in django.utils.text.Truncator
CVE-2023-41164: Potential denial of service vulnerability in django.utils.encoding.uri_to_iri()
CVE-2023-36053: Potential regular expression denial of service vulnerability in EmailValidator/URLValidator
CVE-2023-31047: Potential bypass of validation when uploading multiple files using one form field

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../{python3-django_4.0.2.bb => python3-django_4.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.0.2.bb => python3-django_4.2.10.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.10.bb
index 7f933d1a37..45de692356 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a"
+SRC_URI[sha256sum] = "b1260ed381b10a11753c73444408e19869f3241fc45c985cd55a30177c789d13"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.43.0


