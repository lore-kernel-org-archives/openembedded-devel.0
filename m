Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.844.1792720921163022166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 19:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lni8RpBV;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35b2c599f43so950999eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 19:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720920; x=1793325720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEnGKFtQxDUZ54cgOiFkM5kWk3j448Ru++DE8LXCFww=;
        b=lni8RpBVFgpo6EeqGry3BqXEDNygTlZnsojPA92ci88BRPWIVu2bPbEQF32gvKQ1R8
         Kk1fsNRZXM6QFAIRrdz0jFgJdzKGVK3ssyL0C0Nd0ekqC4eGKL7j/EkcjUHRWEjEfTvF
         1jYlXPYaCHsUFUG0MEdmJzmBs13wPj/OMG2DEw5qMDzR96lXNtI6TfBY+oXe4/smoYxr
         NpJqDGu/thjOlRDWJg6yp9Ll2vui2Rwo4dVEPXhIQX43tKqyZED1C/Pdj8eJfXbG0ww7
         A/zpSdzzUR6V+PPUkRJqBKhK/qNhCvQrHBJP4cQ7Ea/62URBIpjZ5ZAYeb5G1zxdJlMj
         kxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720920; x=1793325720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aEnGKFtQxDUZ54cgOiFkM5kWk3j448Ru++DE8LXCFww=;
        b=QWsxEuSpOPcADXtjG8mZgW9HP7NQFPohQLFZB92gjGhDxfBBwVqZddweEeiqXxdczB
         TFleLFFjB6MDIQEu65ixT+7JpMP2a4A4/jEaJMsvv3A88xLbcQEU+R/3crt/LMpVWqZU
         db4hMaN442M8evLPaO5yivXF2pAzoNPs6qllx54hvNF8CqoeHB2TwB9YCCaSyEg9kMyr
         9KWpQq4zfpKJyMyA9oCay48SXW+gw47y8Kg1LkYJEwwqbQfnOk6QvmxOQH5dHC2/f82E
         +yF+bHih2RpduFm5aoYzYbCNThKWqwDREfAw5QIokFeVHDiFyr83lgClAttkU3L3RsfM
         NBXw==
X-Gm-Message-State: AFq9FYLzDpyIZfRY6CgoZqnBFm0axVKCGv0neTKPE6FNdq2Uyad2xSo8
	d5QR/VQLxC917hTS3HCxSHvGyAya8aeCO3OwLpYHUcG40f69ABCYCicPKnKlUFASHjs=
X-Gm-Gg: AYBFou2EjcAdVlH8SCeSWaeFYUDLpeA7DGlbx0NhTIBtnCEND5Q4v8xLBYkCYQ57WIT
	9+cGteyICjNXx7y0t1YpYqEje2DJUTI0qlCMNgFAwtQ74pmAziWn/6XZHPyEsfJTZGGNsDY52KZ
	AHqcdn2szHz8PyeMKaW6ITM9eyBhifvW6sCf8k83TF4gBT0TdjTNJOe4Eps+vENWxzI4jhJDZfN
	/fu2OZMlBZFqS8MLlGky4w+MWIcu2+M2ok9+4m1cexvKOat4tcKE3QxN6hFoFmrJoDLXuLtmQGg
	7q/i3WGP8KF3KKbNJrHP9br4zRrjQNfRlrMQmUCsdTgigashAgmGEl6KSBZoNeKjx4mWq53Xbki
	AdVSPEF993iZeskdhjTeA5hlar24IvU6WD67n8HNuRZ00rCcXHyAmIP/fkvmt1qm9k/1WVXQQZO
	wxwNiDPt5Z6Mvn6OQLM8FQEgwwPskLvbrw43dOWOKYbrTPrBKT6gDb9FlrFsE4OXAtISFrFCdNK
	ARia/XogqHaaoz8Bl0j2R8riXgl36swX+0pxwaf/Ue5evEsiw0J4oB71d1Bb7zoWNse2uW2rI2g
	ID7VHLsm85nabP8dE1xDv+2zqLqvB2gxt/ScsGCGPYEibDO9tMU09fHlySK6V1AN382Ta6RH28y
	s3s8sILKB/fos7Kz7wOAuZZ7yJeYj/JoRx06xrbYxi3/kDH4bySKLrpIfhmwsirK1OX23IF2pkl
	mhomc21kA/NkV7nOu6XI48tiv4cEE81wSybgJlCCEOLzuUAEVwXoiy+tObqtxFwPObJK5uM1SGL
	fvMFPN3XiylXbsS6bH6m0xtZ5rJxPk=
X-Received: by 2002:a05:7300:fb15:b0:35d:4185:5395 with SMTP id 5a478bee46e88-369d975b13cmr1111475eec.16.1792720920357;
        Thu, 22 Oct 2026 19:02:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm2079541eec.29.2026.10.22.19.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:01:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/5] python3-pandas: Add missing runtime dependency on python3-zoneinfo
Date: Thu, 22 Oct 2026 19:01:52 -0700
Message-ID: <20261023020154.3881598-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023020154.3881598-1-khem.raj@oss.qualcomm.com>
References: <20261023020154.3881598-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 02:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131320
Content-Type: text/plain; charset="utf-8"

pandas 3 imports zoneinfo, so without it "import pandas" fails with
ModuleNotFoundError, and later imports in the same interpreter fail on
the partially initialized module.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb
index 37b02ffa0d..75581a83a3 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb
@@ -29,6 +29,7 @@ RDEPENDS:${PN} += " \
     python3-dateutil-zoneinfo \
     python3-pytz \
     python3-profile \
+    python3-zoneinfo \
 "

 PYTHONPATH:prepend:class-target = "${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}:"
