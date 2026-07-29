Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAC6C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:29:12 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4929.1785302948588833616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 22:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g/ivBcG3;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca957432c7fso386984a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 22:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785302948; x=1785907748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0+1cQeZVxKXtjv1ju3Hn4Be1D+SdWGo0WCwvr+aukI=;
        b=g/ivBcG3f8JHKgGBXdAMEIO4vld15gQYxuZZG8EOk/xHe63gYWDB14CopZBDGg3iLC
         CF2RRRK82YcqePQFLDuEkV4+QN3JkBmwCEkRCaT0w6ZdFStW8Dcoyw2WtYERszvlzYOM
         8gu4V0P+BSsLYbmT4Y+zJMGoLVXzQ0snJzBXHvuADIThnPfI3keCvEWXL539eCmHmh4s
         Yu6O56yZ6W1I6JCA3FNVlcRx1mjZ5FbA+QdElx/ifBF0G3hyyi907HfPIUNnRgQrbOFa
         2O2K1tnM0z/CyksbW8A+T0QP0Lf9s9m1Wt8q1ZRIW+f3JhnEnYdFa4kRMGMLj0PTLPCp
         2OyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785302948; x=1785907748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C0+1cQeZVxKXtjv1ju3Hn4Be1D+SdWGo0WCwvr+aukI=;
        b=ABPfsRNtcKptr5sLo7svkrMUpiDkfBa4DezGYkG//04qduMJQhnMYDyCkHeNgtJjiD
         DJ+hMvznm44XcM82dlnYSzi3Zlwgq0cQEukGBeFEMPUcxxCfEfmUzNhx0sxrr9iwB6wT
         VxG/o/7Pf6CiXR4Z0KA/NYUI2q6B74uoaJGaN16+UHf6Rq2+w+1n7JtZ4YSDS3aVXbbA
         uOpcZOlgzc4BdtUldFbAsYXo4x1b4R6Hq43nE8nYArk/JjbQ9qisf2is5BeEnbqz7nnv
         ZrR+aZ73hwxtywOPDT2ledeTLZNNBVXzROIAwexYwTteLzpCEP0ULpmlUKrHtoJqVQj5
         d3Ug==
X-Gm-Message-State: AOJu0YwJYCrI0ntCJE+XD6vwOiIKXKg4vPI2Yc9Wcl4gqCEHLfOpcnd3
	Daa2u4GDAGHr5qDRLKsMhOo1OQlMbvnDOpisbuCZtd+cCnGcC7a9Cr9ZBSlGLZB3
X-Gm-Gg: AR+sD10r7EVrQeHYro59Gtx6STtomm5zFMBT7L7SZAaZHeSzThre2k3AgkUn9/wQAM6
	JhH8bOVh53a9lK0w6OcaT9ujmihUihCb0fsZqjTSFRAUj0HiAoG/9kMfvJIyGqWANXMK9CO2K3r
	trA84plQQXrV9ibgmqKTzcfQ/k/z34p35d+4sBviQ5+OJEni4W1azojs0UYhnbIifnD8+8dlSpg
	3bL4wvLF/r7ThUPjY8mEr2dRBne628VtJyEMCy+vNOU59gIr4/roEhJ3qjGQ2vl3wVEHMag2/nh
	fSQPOyWs+wckD/jhMYtaHd2AjbSYIusy7pegJvqn9k6YMFEUTHNrcXrkbGRmgWITpO55JQrAhR6
	AmTyj2s6PnQVSdZ4R+EA+3BQtgdvGIukjdYTJQLT1N8CEdnXZiBVaD8M5lZeDB9byfRcmKf2Ilo
	Cgzw8OBXBzTlQei59EMTpf8/Sbv0NrH1dmdl2MX+N41uUU1T4we7qR513sPpdVVnCCt1HOYS7DM
	EhKPt5clDLrHisw9y1Y2baZUDkD0aj8bwwHIPHLDKZTlZtIoHDseiVVBgIonABdAw+KSEYGUXvo
	upmtyNjCVSjnEBDd4ned4fE3Lk2LTpYUryvqQJEfn7BNgzN73822By6XWuBrQkA6EO/aB+wL4rv
	L7cqZLywjVnDV
X-Received: by 2002:a05:6a21:4cca:b0:3bf:a7d5:df38 with SMTP id adf61e73a8af0-3c8aaf28fe3mr6875083637.9.1785302947759;
        Tue, 28 Jul 2026 22:29:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7271f010sm6097316c88.9.2026.07.28.22.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:29:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 4/5] python3-wxgtk4: Skip the pep517-backend QA check
Date: Tue, 28 Jul 2026 22:28:59 -0700
Message-ID: <20260729052901.2147056-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729052901.2147056-1-khem.raj@oss.qualcomm.com>
References: <20260729052901.2147056-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128538

From: Khem Raj <raj.khem@gmail.com>

wxPython's pyproject.toml declares setuptools.build_meta, so do_check_backend
warns:

  QA Issue: inherits setuptools3 but has pyproject.toml with
  setuptools.build_meta, use the correct class [pep517-backend]

Switching to python_setuptools_build_meta is not possible though. The sdist
ships a build.py in its top level directory which shadows the "build" module
that pyproject-build imports itself, so do_compile dies before it even looks
at the recipe:

  File ".../recipe-sysroot-native/usr/bin/pyproject-build", line 5, in <module>
    from build.__main__ import entrypoint
  ModuleNotFoundError: No module named 'build.__main__'; 'build' is not a package

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python3-wxgtk4/python3-wxgtk4_4.2.5.bb                | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
index a84648266e..9a8952df32 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
@@ -20,6 +20,14 @@ SRC_URI[sha256sum] = "44e836d1bccd99c38790bb034b6ecf70d9060f6734320560f7c4b0d006

 inherit pypi setuptools3 cython pkgconfig features_check

+# wxPython declares setuptools.build_meta in pyproject.toml, but it cannot be
+# built through pyproject-build: the sdist ships a build.py in its top level
+# directory, which shadows the "build" module pyproject-build itself imports:
+#   from build.__main__ import entrypoint
+#   ModuleNotFoundError: No module named 'build.__main__'; 'build' is not a package
+# Keep driving setup.py directly until upstream stops colliding with that name.
+INSANE_SKIP += "pep517-backend"
+
 REQUIRED_DISTRO_FEATURES = "x11"

 export WX_CONFIG = "'${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config --prefix=${STAGING_EXECPREFIXDIR} --baselib=${baselib}'"

