Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10326.1795752989543453926
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Uiv88FI/;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso10729946c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752989; x=1796357789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=He8CKuXNPHnrvu229ygSXT+8pKTuxfdvxcoGuA3jiVc=;
        b=Uiv88FI/HOvQjoeUy9pIuMkz4c1zw0b0vBXFfR9MicRK1H6t+pym4J2zfUEbNcKf2e
         f18R4vCBlw+aQhezPjyfC7NS/cFVKxx5s+90YtSFjQ/oyzR+bUuwyLEiGK5ONgel5Ymw
         qW7A1Gy/l9icwKQXdnwfBHqXBv7Uqq3RQDk3ZHOXUnrO4cHAKeaOkPBp4pd2kzm1isDM
         9NzDkHbZmL0WKDpuf7t4mDTZWMj32pi1+ECvJEFLZaNa6neWU6PhQ1KFMYKagOnOfWdv
         VqAqQpuI9bmUIGxxnTL3SZErrrseqdLfm8aB79+S8hnQiCqsZ/Om1UjI+ZvAHSZJvkeq
         H1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752989; x=1796357789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=He8CKuXNPHnrvu229ygSXT+8pKTuxfdvxcoGuA3jiVc=;
        b=LN9g5QsB6YMuxqyTsutEn2QJGbyW06lAJZXKtHZ7xz1G2abA9BFEmpn7iB4IFezrBW
         3RncuNJwnwqF6zPQBVWuFPFhZ1qEHFvGJw31VrkUE6poYMGWxY58AWqNumHet2CITKv1
         bH643K4BRtOGtn1jWpxsc7kdg7Dg3r0i/e+WTWpoIr4R+cyHm2q82yJ2FrKCD5s/mZn/
         Yu8MMkROcO+D0PY67fKW8IZ/PHTi0ocnWfsCTCrgf8RYT/AqiLJJJfwH+t7i0Sn3BpNq
         DEneDmEgLgHpM22Pe5+9KLxWCMrrLNnigqFB+pJyuHzGqDGQ4/N5SwNT/mp4PyHZuCqR
         73sw==
X-Gm-Message-State: APuU4Z8W1vMI0dsoFiZ7VgiEQSwj5sBo0+ipZ+4TGBvHP/N0+dlKAiq9
	ksJpUOEvs9c7oan9TQkizsnTM26B1DjEd/bs+0ClQkcqTiBEAuSlOip8Br8jXpTo
X-Gm-Gg: AZFdTZfj6af1GHuLJYDP99XHO3secPQTYLBJeQ52Bi5BEZz9dvEiiDDeL+IF/qtGpwb
	yAyVqKbQrNm8lQIKL4Nk0xQU0ehKPLR8mPEOT1h45RDWHVeS61N7iQkWdx72P8RMDGXzBbPTCC/
	lXtHKsHU07QTB7VreVqs/h4jKF0V2HSllrzwnBpsayI/zCgDYDJy/OWUyZ3aN8PVmcouLhuTvyF
	hE890nxwVo15BnGOV/rgk1wlzcCeBbCVuyWCjDvKB03iFH6a1t8Ftoi/2F1v7YBZGd7UCJKUH1X
	sVy8RGyayFBTzIileJAXna5d6IA8cvObDDFMdKjJN3TlsQxKFQAm5ttzPGJazjcEawUxVZWvhWj
	IaFA/axNk6dMP1OJe4p55xW00SvRHD2Ooam304yAXrMrx/QX/hfJJwAnVNUUXOb4qITKSEMuc7+
	6wH8/TPo1B+yjUYhbuWstbeyKhTAbat7fiYgG1GRr3y+I3qyYmnOwfJRXKQrFm8Y/nJzjlXxnOi
	JgS1sQjUrTKrbKG/4wj5aC6ySLsAh1+fAh8nK251NsA6mbqAyCcGP3bw47O+vmtLE2o0QqGAtHN
	WmQyaJ3iy2bLwSvsLp5bbe6+CaW0Vw/iQ0YyvE9l9A+hShb5Za/p3yvPqngVdlc/NJHWMzxuN7D
	i4z/pq/+sVMYDVOQQp0z7P5gV7BN5FfVnSGqXRGcatJLQrsghvcGuDeTAq+iai6buG6O29np9OV
	1CIIzOanalyJGodKGUOXqfMVXASbYAW8CYiNvTXH5LPposO/MhF6++Z3Q0R51KN5qMAPJHH03tG
	muHRL5/DDAAnVvIXqg929k59CKOwp4a4Wa8+Gh7UniNo9U8zOE3nXxZqGUVdnTlC/+nIrajetJi
	oOSo
X-Received: by 2002:a05:7022:f516:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1b5568b42f2mr22460964c88.13.1795752988826;
        Thu, 26 Nov 2026 20:16:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 09/32] python3-cvxopt: Build with python_setuptools_build_meta
Date: Thu, 26 Nov 2026 20:15:51 -0800
Message-ID: <20261127041614.1775064-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133228
Content-Type: text/plain; charset="utf-8"

cvxopt builds through its pyproject.toml, which takes the version from
setuptools-scm; setuptools3 builds without it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
index 350d687758..bf522f3e7a 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
@@ -12,9 +12,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 CVE_PRODUCT = "cvxopt"
 
 RDEPENDS:${PN} += "lapack suitesparse"
-DEPENDS += "lapack suitesparse"
+DEPENDS += "lapack python3-setuptools-scm-native suitesparse"
 
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
 export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
