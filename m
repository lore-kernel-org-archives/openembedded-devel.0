Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19BFD0C846
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:34:31 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55987.1768300469029965964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uNRDlCjY;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so45820115e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768300465; x=1768905265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gbKcWsgR9n0Bb4nvX90nohJzmPpEQWKmPAOmSzpzhw=;
        b=uNRDlCjYmRmltzeRNugK/DP6512QWBCzzWt3NF7bXht9G081GqjNLOckxlR8V6oqAr
         ROZ8deUFW4hicqS6UoPqctpoQykNNv/qQCKX5NPEDbJWRXc2y8tJRJ8K6HLiZZX68I9/
         IP7lflPrfLkzwM4FGot9pn8/lCoh1nTuG63rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300465; x=1768905265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4gbKcWsgR9n0Bb4nvX90nohJzmPpEQWKmPAOmSzpzhw=;
        b=FSJaZfXqES8nwfbqB1fxsgDqm9LrtiF1UUDAIovvfu8DOc8tE7xdmWpCEj/r0MhD09
         aFqGEIHcIl5+LTa1oDIvuECwNRVzyGNZpnY1bx1ZDEVcuwNTSy6ihRcSp7NZViWIIrFH
         jZP+7AjJwd6n83m1KtqMHEBF3D/R9ObFeXW10j0vMywaBKAPxZo3QsjeVrIuy4+BzrAL
         mZMA9TkFJEeGmnrqaIplN2k89JNbqRVwrU+EWBrJa/3ZQ6pSRS0yjDOAW5iShgkM6883
         4diSxrtzTZyAaxu8VrlR0DGV9FiUSPZQcOhOr2YERyBcYGfImlowQL8IhCD7uHRVWXqJ
         85Cw==
X-Gm-Message-State: AOJu0YzUu953W0UaR5OfcMEnC1C4vw2Jg9o+ZBM/epSm4EmUVYtRNKFk
	rkn8wtpdVPVZBXTUTcNHJ5RBFurOFkMCtDL17bqnVfSekEMItOh/6elxLGWtdj0ub9rZ9rBMTDj
	MBr0S
X-Gm-Gg: AY/fxX4xvdgPI5lfGNSFxycdBmklDIydKarsD4DO6IQ58oR+qsptD8cZ1D+PZcyZdEQ
	WoQOQXqC4nUU2rSMQPZAz+CFm/OWb7cAuO01ySecuuhB2zgieZiSopEx2YoLQkuyPQQMkwcijpu
	hdIKWOkT31dSJdX9s/MpMNjHRnjVpOtu7CP/YBdmGE0aStyqm1O5JcV9W6YaTf6ia5irDPJPKHx
	3OSBI4gFAwQugcgd8AW3UrV/LalPHQQ5eESXMv0rC8Ybb/Hpfj3/x1S3vtJuZGXBOg1mdnMGS4G
	5KaeX6jWwsZK9dPrYukthvRHfvvgesy/NpQixrqE2xyA959xLGodVv9GEy1INQ7F4MvJ0YcUvBJ
	3oR9nzZQKBAeYaOLPH1f5l1o1TRLzSR6qQTZncTxV+AFlHGS4YMX9UahjO90ty6iQ8CPikd/OSy
	Lfco+k8OJL/XgvJ21+cF3xTP7Z
X-Google-Smtp-Source: AGHT+IFEpNfRKJJm5SD0kCTR5RUMEb1yEF0RByslGTO5BP6PH4AqmsczRq7X7BRCm82hEQt2QGCp4w==
X-Received: by 2002:a05:600c:45c7:b0:477:994b:dbb8 with SMTP id 5b1f17b1804b1-47d84b2cf22mr245759835e9.11.1768300465004;
        Tue, 13 Jan 2026 02:34:25 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa84sm43341971f8f.2.2026.01.13.02.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:34:24 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-aenum: Upgrade 3.1.15 -> 3.1.16
Date: Tue, 13 Jan 2026 12:34:18 +0200
Message-ID: <20260113103421.3568307-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113103421.3568307-1-leon.anavi@konsulko.com>
References: <20260113103421.3568307-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123433

Upgrade to release 3.1.16:

- standardized handling of negative numbers in flags
- support dictionary-like key access to NamedTuple
- remove newer setup.py option include_package_data

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aenum_3.1.15.bb => python3-aenum_3.1.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.15.bb => python3-aenum_3.1.16.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.16.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.16.bb
index 3769be0d5d..feeee18e34 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "8cbd76cd18c4f870ff39b24284d3ea028fbe8731a58df3aa581e434c575b9559"
+SRC_URI[sha256sum] = "bfaf9589bdb418ee3a986d85750c7318d9d2839c1b1a1d6fe8fc53ec201cf140"
 
 inherit pypi setuptools3
 
-- 
2.47.3


