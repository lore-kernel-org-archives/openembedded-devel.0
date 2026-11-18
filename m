Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15257.1795015860475149709
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xt9X26iH;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so10609285e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 07:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795015859; x=1795620659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYnlIM6X+wYOsAo/DujlfpIF9eoRdYgLD9JCEWrHyRM=;
        b=Xt9X26iHyR6Q8YutmCgAA/cj5HJA/rdI1chdB7z9n6IBSp3sOWCCRjgr5t2sPucDeR
         6cZy6xc9bhurUHF6KZXa96kHDvOh7EA3HNgcwUdziIrauwGu2X8vwfVEDGf94srb0ApX
         9rhM9dIsE07twFi/L3X0mvZa0FjW62L9GtYCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015859; x=1795620659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RYnlIM6X+wYOsAo/DujlfpIF9eoRdYgLD9JCEWrHyRM=;
        b=EmtWCYTjopXYUAHJxqA5o2HZvtwkm+VilFfuA7iBhVXl/y0bL1hHIi9yF9VPKuocro
         F8IDHvBmhJY0fCTRo3XNEqYEvpqRgxf7qwJi3NFmEF/zWpVaZVUR5A+QUcte/W7fWgpB
         Up0VtlZbbBh/GMfbv7+o+2FM12dvpDMg5QDfEMxY9qRkZ4XVqwSwSKMiTH30sBrbW3/f
         0L98yuEigmDSGj8Y8w1yULjtDBsSutXS6SODXJoEKs9XEGCGcjCJlLDmJSAZBqZTVpAq
         NLDHUbl1ejQpmG5biVgNyKBOEKQoFcIsrsv7002mWyOPaz7AHE6xl9PEmxNgFgVp+SbJ
         lpTA==
X-Gm-Message-State: APuU4Z9TCYqGAWZlwxSd/xCIJ/Pf0CU3VJQMJO5orpjVF5veNKKxgXVu
	BOJSlbdOf45lv1YhqdYiYqQ2Iyj/wAO8x4HxA4MUJ5fpkDNp4etJCmx9XRbO/dk5wdSP/U/+Xo/
	gzNMk
X-Gm-Gg: AYBFou2hqAICvwjphbzozzYCPwblfC1dGJ/H+9SMDxZ/mAXBiAGVRcL++HCK/cYyZOS
	WhzkeZeXzUlSogKCdnBOQzpwMfEyqmrN7JQTuMiQRdfYUZc8YDlh9BzkmT1+eW35u+v0WnBVcHq
	jE7lg8zh0gbJaEh678wxXu4RdiLTOnkaTtu5hc6O/bmcggPN7PpxIltikHM4Q/aofjgswlamQOT
	+vHyVjNspxJMHgrF99EvjYTCzPZqYvcGOOKpFDZu6mmpyWGSEe+ghZCYeNsyIPrFWsFs+SlJSkR
	6oU0rGYoRpZp8Fvq+YjlfoLIOF7g3SR8pin7ag8+nTO69KTcdOLc/9B6gmCswWAetgh2x8zrlQo
	vrYrkP/BupAA7gpGFAdbnesx4uhXv5mpjv1WRxFV4B25ziJTHhAIsQJX9lsfcZV9ZJR+X1ukY28
	uomyN2E2J+CeQqzk4vr4hpRC2DtY/FFCQ4OlRzAejB/seJ+bXf+0NfJNwsWy9TBh7nsrB5CKCNF
	wY2Q2cEJQYsix8CRw3HMEvkb8JbwUB0MZTf60RzjL4TYuqSyZa83ONdsMwAI917hpCrScAA0Vij
	K4wTKaklq3scUGfPYC888/bvw+F5nw5a26z1r/QI0rXpu/7Xy9fIFkoO3KiWGd384yVoEl2W9fS
	NFZ5kip0H48t39R3ErhonvDRgudHEpja+lw9saR3xyArJ2QEC3dTzYw==
X-Received: by 2002:a05:600c:8b8b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb7da19d2emr54510345e9.12.1795015858638;
        Wed, 18 Nov 2026 07:30:58 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm150214265e9.14.2026.11.18.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:30:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-cloudpickle: Upgrade 3.1.2 -> 3.1.3
Date: Wed, 18 Nov 2026 17:30:51 +0200
Message-ID: <20261118153053.922769-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118153053.922769-1-leon.anavi@konsulko.com>
References: <20261118153053.922769-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 15:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132659
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.1.3:

- Make pickling of functions depending on globals in notebook more
  deterministic
- Use PEP 621 metadata to fix building with flit-core >= 4
- Account for removed opcode in Python 3.16

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-cloudpickle_3.1.2.bb => python3-cloudpickle_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cloudpickle_3.1.2.bb => python3-cloudpickle_3.1.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.2.bb b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cloudpickle_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cloudpickle_3.1.3.bb
index 9c285bf80c..21a6a87d9f 100644
--- a/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.3.bb
@@ -10,6 +10,6 @@ HOMEPAGE = "https://github.com/cloudpipe/cloudpickle"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b4d59aa5e2cc777722aac17841237931"
 
-SRC_URI[sha256sum] = "7fda9eb655c9c230dab534f1983763de5835249750e85fbcef43aaa30a9a2414"
+SRC_URI[sha256sum] = "cbe9fde14429a5db009ea05ce94e5182cf998c97b96918d50c10f73f9c2f4f33"
 
 inherit pypi python_flit_core
-- 
2.47.3

