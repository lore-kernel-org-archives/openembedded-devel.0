Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.43723.1589813429324882590
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MuWh+DK3;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id q9so5232181pjm.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fjO2Am7CtpJm64CaxINCGdG2wH8eqxaVrYpWbLWdQ8M=;
        b=MuWh+DK362TipgcLtniG9j83bBaaTPgpKII9XvX766ATxbaSdOvxsgmEiYV/qjJ0p4
         FbBubi3CUv1+ZMtiQBJL672PYTotgTIu2nxCnCfIqgcCUCSHrFaRRyrbuUnW2XEEBVR9
         5FDpj1VSUnHgnxnMA0oPPjKJlyh9QPufSCuIU4N09DL3cp6Dtl8ZrKh+c18wds/fW/im
         mKMr08FE6J77n/4nWlcHd1OIwgA2C/n6sEaC2sJRuERnvubu3RvpA0WrNQ2o7cdb8Zu6
         bJfoU+zBwYENq1BN5Vz+vubg67hsDU211aXmM/wuPAB4UzwYZWD2hFkFj/YHfWrQ7P0K
         QYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fjO2Am7CtpJm64CaxINCGdG2wH8eqxaVrYpWbLWdQ8M=;
        b=KnPGuce0pMUvb0N16OEPKqVqFjyE3KMCtTzEGF1u+Lx+H0mSizxgLXsd+np+BNAH21
         fK57+6AnEJqRANSjq/8TmfUbd1h8bLRbf7b9FfspeW4Z/KlfKec2JeMU6q1niRqW5RYD
         /QgZBOKwnd3yunMfrb3h5XS/2B0X4dn3Q+ftkjgHEbs4O9oo/nU7ZhGQqcyQ30G5DLla
         t+kshSfh5u2SDkdn7ElJNJf3QmClIHvLfPp86hdqons/ZUTcQhUj2BY76LS2Qdi1IIQs
         NcsKjeKe24CMUtxSsXbofIiAQqkyhQPj+PBYbKXXGzQWfmTjpgWDiFcPekhtueukcJYn
         UYTA==
X-Gm-Message-State: AOAM531eqS2cm5Y9+uO/bSq47GiSlN2df+eyYJT4YmcspbGGkTaA8EJ0
	aNIew/HLbprfoZNM0zCXzjSUPLq3
X-Google-Smtp-Source: ABdhPJypZMMaNbHLNlH9zyNwzVz5Ck9uxCpSM8LqbHRzfRVIvq4Rat24di1GHVGYYimXce1/E9Ua3A==
X-Received: by 2002:a17:902:b289:: with SMTP id u9mr9539076plr.138.1589813428510;
        Mon, 18 May 2020 07:50:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 21/57] python3-setuptools-scm: Cosmetic improvement
Date: Mon, 18 May 2020 07:49:26 -0700
Message-Id: <8734abd294e9363ae09fb45c71d6b5ed8548a806.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

Split values of RDEPENDS variables to individual lines in alphabetic
order.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 99e3432c60606af1d37947b3fce002d679cfcb50)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-setuptools-scm_3.3.3.bb            | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
index f8d28b33af..c061ea2e63 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
@@ -8,7 +8,14 @@ SRC_URI[sha256sum] = "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217a
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
 
-RDEPENDS_${PN}_class-target = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json"
-RDEPENDS_${PN}_class-native = "${PYTHON_PN}-setuptools-native"
+RDEPENDS_${PN}_class-target = "\
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-py \
+    ${PYTHON_PN}-setuptools \
+"
+RDEPENDS_${PN}_class-native = "\
+    ${PYTHON_PN}-setuptools-native \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

