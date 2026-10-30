Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8934.1793358200479226465
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hHgBxaBT;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso674379a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358199; x=1793962999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5EYi3xMB2vpvP2s9JXa578Ujg+ZF8rLa74Yrlbkazc=;
        b=hHgBxaBT0WU3qL70vNUu7lvRFrRTL/1ayWZMpOayFyGeSSn/2VRaY2BobvF2gYmVMn
         qCdY4zzVi6FqNexsAcoAENRDlT0eaWTefSDikgQlVogy+EVpuyIzwg+jj/U4mjLxRhXv
         7TQO9f7xrA3YSkaL01Kw3O/W8wcYfRX1Tt7EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358199; x=1793962999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5EYi3xMB2vpvP2s9JXa578Ujg+ZF8rLa74Yrlbkazc=;
        b=vFPqizub2zhvbdc5Q39Um1fODA9IdjJXFDFy7+ZqLxSaFvKfehWPzac9kQmyr5t0oH
         HqwBuEfN+ocUV0VAQ8+dvysWLho+esj977hKd1dazJu2LV5rMu2XHx+MzyNaSPHyvSdb
         EWJns0idSn53PveJ8++Y5MfvIAzYz5BfHWGbWKMCcYTKgaXeCDNCQq+GtS4zUONnXkx5
         FYSpOQLePR7lfqB5p68ri+96Y6v6wVW5xz43jF7WtfGV44cX/f+Nx/oQLWxYtYRytlrZ
         q7GzzVAwNeyhD8so8mXLlJUZ/cXL6GjyuhuDMZCKKGOlRz5/EAcXhhMIBgvrzW1fLRx9
         OMfg==
X-Gm-Message-State: AFq9FYISdwC0dna8oO10Mz8ulVFGgsJEx//oI5FTSjmrIe3lp+Zj2AIr
	CBI8XNOzo3yHvAiaVc2w74foC8RUYH0P0urrob7AKSicvMkM6FNRzV6SNyRVG8tIpKFus22RUkf
	DII9j
X-Gm-Gg: AYBFou1EP/His2BKkpRqHINujV19mvq9Cma2p6y4t3zgBUTowZk7JEEJGhzX+yotZgI
	2xTFykKkRPk2hFolAqkHsW+OFKCHzRfH4NSIi1XYuG4J+ySX50z63fSVR1pTZC2R3hnfXcMeEpL
	XVXcTN31Do/9BwYQbLmcrn2kl7j6lwuOim/VMPWexLh1uGqwcTTO/A6nzbPmSpo2m93U5OliBjn
	cBB659mqalKDsjfu5jFQAvcAR7LzBOEpwbIX9PiSI6y8wZ+bAZdQByVnw71KLx/QjsruQZyeT4p
	j9M1EMZ7863zU3PfeLQfTLvkaPDrUe0I/hMtu3SoOjyCfllr3MQZcivbqQvWw8eXlW+DuLNHTlc
	Po+eT1WPP+jP/OUgI2Ksu03Fxmu/Hx3IOZr+LbjNzlR0DEBSHi5OCeyhSUjsFnf635EhArwi0Qk
	+zfCar4BHRFGja5yyAhlcVYSaQCHilas8Uk+WajMMAy+bldNsIPoZ27gDABek4ZMaEcn3fHXh4+
	7dNCgUGyebai2QsZJqbWILi4BbODy/Hi+0kdrpiykxK31TimFvN1gZ+pCTvL+FFiltcawVn9fwb
	4A1dYcVws1vfwLoz15zQdN/ey1MgBeg8oA+b6un/i+uvDD6OTJUxk5Z23xXymucAWZt9pRwHHGy
	stl4dxxLB5LUI8EMhd5SvTT6I5Xs/MWA9ws20ewPthpBq8e9aK+NjnHQgkl4L5HEN06RbAvfvfM
	0=
X-Received: by 2002:a05:6402:518f:b0:6b1:ce0f:eb6b with SMTP id 4fb4d7f45d1cf-6b4d4d7c79emr1450282a12.31.1793358198585;
        Fri, 30 Oct 2026 04:03:18 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:18 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/25] python3-faker: Upgrade 40.43.0 -> 40.44.0
Date: Fri, 30 Oct 2026 13:02:49 +0200
Message-ID: <20261030110309.1124614-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131687
Content-Type: text/plain; charset="utf-8"

Upgrade to release 40.44.0:

- Fix: allow repeated digits in pt_BR CPF and RG generators
- Fix: keep en_CA SINs out of the 0 and 8 series
- Fix: use Luhn check digit for no_NO Postgiro (0000) BBANs
- Fix: en_GB VAT ID generation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-faker_40.43.0.bb => python3-faker_40.44.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.43.0.bb => python3-faker_40.44.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.43.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.44.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.43.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.44.0.bb
index 505ac3fcdd..bb4ab9c64f 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.43.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.44.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "02fae4327c03a4a6315e1b428a3878f435bfc276c93435ea349b95c0c9372361"
+SRC_URI[sha256sum] = "97245a3756dcaf35418b89bea9f03ae6881557db0032bf048744c2aaee2a9108"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.3

