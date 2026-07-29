Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB86C54FCC
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:29:12 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4906.1785302946548362129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 22:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gm+I7dSt;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-382ef647e20so547928a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 22:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785302946; x=1785907746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKoU4xwYZEhGAsm8IRz9OtU8NcHlYNpVoO7FH5IHy4U=;
        b=gm+I7dStn3UeptGDffpJrn/Nux2E8gQJ+Rb+2VrPBLJYo1R2OxsWB5YCfT0jN+ne5T
         OBdw6fhFfb9bC44dAO8Jn1Mrn/NK7m+143QlQtjv1H8xw07Tfbovn8wV7jfNbMaxtO3v
         x4wqF5zynr3N4/TrX/UFrupRdcwR8NuMAvrZb/1DH4WvFsRKfkszgol3iW8ntcg8WGep
         2z42I12THWuneheqaT30zk4EouxEMvqA4cy7OrqFXAIVesAENIpwQKfsgisv1hKriZt5
         RZpmTxQCcZb+AnpYAxJq3KzrQiSsILOBDZBvEX6ciD4QYx0RlEhe8IeRw2JOLeMKbIoj
         V1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785302946; x=1785907746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKoU4xwYZEhGAsm8IRz9OtU8NcHlYNpVoO7FH5IHy4U=;
        b=D3PC30z+dgwhtkaVbp6pSGNsWJcI+pPAWajFlzn3akMJjRZW4U5w3gz5Hea4PXBZBy
         ZCn0yuGrz+9if5mKnwl+T0ChXpyPNI0bsjp1YWcK2Yw7i+Yi9mRZxrx4IgGb5zjts+Yv
         AUxj2RTvXEkUZfOYbHD+teMuuPUuMEdklpUqZzGvmLB/H30pwSXXV7CL9gsLOuUOmjtY
         FaOuOU4NiXciC0kNVO9/FeaRP/J0Lghkl65rrgaA+KeIlLvieHRfr0Cs3MC1iJ45Zg1y
         XfMuvtnBWea8xP9IyFswPBExraB6psK5RxyPKsy89nPaDmSup15ugPzQh06F4uXM4+At
         iy1g==
X-Gm-Message-State: AOJu0YyOSGiPp6d/I29WlrCPGpYGt06NhK0eo+ZFkDGq7gYyJiGefoZi
	NS023AWaqQxeFxzC1yIS3AFduhivNecfsUuvTnkAsbecH791dPy6lMK7O6o0mZp9
X-Gm-Gg: AR+sD12NwC+tRfVxzjaL7FT3BekCI4Kurv2Vu5R9u7MC4tAG0iJ+9ch/1laIShpBcR4
	K0/ZbhFEARdj09kHP1TkucSSRMRfJ71fXX0XOGlPU0SPUTh3Dd2y6zoXBDEayGcbIZxVR75Tdh6
	hwWmZIMew2Lh0XCBLo3sJ+USpch30+ues4ft/aaFI7wpEeMMwzGXWVec+gCHscpaNmIZAufpNxO
	zYgFspa8+FwcMohe7DT3FP0In1ItiJPfDPQKvrveSFvXy8Upa4SSdZZpGS1hblzEXhEqoZQbhTu
	hp4RHJRM5dTtKpB1vxu0Gw/+mLvnEpVmCtvaKPa1Ix8LqfvM+4MW/Ve3Bmv026x1JtOpqQMFVP8
	0F7ppNCZ3i4KWir5PdJeJNdFp2yW1gaP7xgu51MhfGn6Tlf9Cy9Euy8KfN5Mu9EuzcsIwCbzD38
	WDP92B5jMMVhIVDC+oa+aqLW21xFP/bAW3WVa2/+oARERG46WPRF8FSjihu6uaSzey/oQ9Iw/pO
	zwqB7HO1PRNdGob7kIG0ivH/qqd1/5y4NtgGgLKJMH4swGSiOKROlmkVWf6iQSJnU0IFMqpLckM
	o6ww8Nv/mNWUf459CoGbUX5BfQ7BpmKtjKkDmw1dG5Jw6ALB8vDHcX/j3BkaibbmK+R/5z3c8m3
	dlA==
X-Received: by 2002:a17:90b:524a:b0:387:e0db:3d8e with SMTP id 98e67ed59e1d1-38f6a586290mr6131403a91.41.1785302945784;
        Tue, 28 Jul 2026 22:29:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7271f010sm6097316c88.9.2026.07.28.22.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:29:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/5] python3-canopen: Switch to python_setuptools_build_meta
Date: Tue, 28 Jul 2026 22:28:57 -0700
Message-ID: <20260729052901.2147056-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729052901.2147056-1-khem.raj@oss.qualcomm.com>
References: <20260729052901.2147056-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128536

From: Khem Raj <raj.khem@gmail.com>

canopen's pyproject.toml declares setuptools.build_meta as its build backend,
so setuptools3 is the wrong class and do_check_backend warns:

  QA Issue: inherits setuptools3 but has pyproject.toml with
  setuptools.build_meta, use the correct class [pep517-backend]

Unlike setup.py, pyproject-build honours the declared build requirements, so
the setuptools_scm dependency has to be provided explicitly, otherwise
do_compile fails with:

  ERROR Unmet dependencies ...
	setuptools_scm>=8
		wanted: >=8
		found: not installed

setuptools_scm was silently ignored before, so the package used to ship its
metadata as canopen-0.0.0.dist-info. Pin the version to ${PV} so the
directory is now correctly named canopen-2.4.1.dist-info.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-canopen_2.4.1.bb       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-canopen_2.4.1.bb b/meta-python/recipes-devtools/python/python3-canopen_2.4.1.bb
index 80c39f6c2c..b0c6f9f10e 100644
--- a/meta-python/recipes-devtools/python/python3-canopen_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-canopen_2.4.1.bb
@@ -5,7 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97f135a6ee6f800c377b5512122c7a8d"

 SRC_URI[sha256sum] = "20a84bc498b34dadd79cece467d3bbe19591c1c02a8f39331bcc6065c4d8b2eb"

-inherit setuptools3 pypi
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit python_setuptools_build_meta pypi
+
+# The sdist has no git metadata for setuptools_scm to look at.
+export SETUPTOOLS_SCM_PRETEND_VERSION = "${PV}"

 RDEPENDS:${PN} += "\
   python3-can \

