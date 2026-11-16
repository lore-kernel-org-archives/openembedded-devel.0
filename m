Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22785.1794814536698652955
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Q2fbRHc3;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso9781595e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814535; x=1795419335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dqkGe9B6dDn3WprUrP6URoY96ZxAa0H9Ayu01SUDaRw=;
        b=Q2fbRHc3q3WZYcNxq3kTotY4nD7I5ofYFgXHDVyJzgSqf5Yzu2NMZX3DQckymCMiGr
         R27jQxFcy0yYwa4gHcfp3QmpwmL5TEX1y2sXXakdEs2gJIguampfu+Up5izDwxNuoJpU
         AaWaCzR2z3uSQEBkI74Nf7w5tPr5i/G9g/cSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814535; x=1795419335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqkGe9B6dDn3WprUrP6URoY96ZxAa0H9Ayu01SUDaRw=;
        b=rhrqlPBJDDY2azRFy/j4+73qQPYb/WzfRMzgfWiEwMG+dZ+EMNregK9wnByDmG/XC1
         9QcELWUkVQzEAeuhDDU+kz01weGAWUXNEkLl5knYBTgAwMFBMryVOJdOHCQeyDVyYoVP
         bG2BPfZdroou9IVjqdMGIysuneNtVxXFzD23h2SQZVEnOAOVe6aloORyjFL/17mJw3Su
         NCmR+idya/l1WHWk1ipHHzSjk2nzJ8PzyyWB2Jk2HdGloJBQdZUsMEzmaolSVFk0Yuw+
         HqG3uctHKYoP/4fHkWR7i7/ZS33wms9qCLPnScfeERxxlfUtl5/G4AptN01e+qWR33jC
         vowA==
X-Gm-Message-State: APuU4Z85xUnl3l3LBG2oJcfQKeJu8cgmPviA9gzyb9TbgLrQzzvufiCX
	/OioEE582dEimH3skj0ut9n3ZtjfqQmABv2yii+Tk6GpDF1fitELD2xQOmC82SMRHbHVy1M0xq/
	D46y2
X-Gm-Gg: AYBFou3WEXhQCMg58tjQGMzTc4Duurg/OIZdSDZJbuIM24luVzzK4ATAqCfrwRxDlH2
	hX3/0KI0LmGRYpnKPfdmx4877m3SaE+QH+tB4Qtodg+Wf+OfGp4/S3pXoDyfXoKuBP9TmCVk3xi
	dC6oAQuDYYbWRZkoMvwpOudyeW0WcgUuzAv8axG3adDXYfIk/Z2L+b33EO4NH2kIrKk4XFT8nu0
	UZY2OgrZ5zaQAFDZT6QyyNcSBKTeBogsk2GNQx24TOmoYsr2QKGGr412zLOA1UYFM75Mu1exk6h
	I5uizpy0kVHwys84LBdEpWimhP7XzE80+Oy4cgvqOk0yCc8haCktg0rQ4ChIOXy26eRe4Sqd2Ch
	NFyNCHd7aNkZiKB6Ub5bQsxQYZ2rdjfWqz+SSRsg/QbWt2mAMe68I3COdAVAYAqiB5xJB4TnvZB
	GSx6nLjSy6xBKPC80TBLaXrrzwkBDdsh+EWyw7qUvTgcV9DBOj76NXPkiTVl+5gvhsNDU5Ari7X
	VWR0nvDMesyL7MHPJdlDOJ3fhqfbcaX08im7Qua7zoNNFcNkqdJ0XGZC4BlpcMcM/5uRpmMOCOh
	6vj37i41zA4MKncy20SydqJcwZ41+FI/i1GGTaGNQOTF/Xdbxx6Vucqsv3mgItHcnq1teQPSWr8
	AN4/MkFLo6+avPoU49ox5+FCz2iXHL3YiWoqzO3KDDeiS2+AcLPUIVA==
X-Received: by 2002:a05:600c:3495:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb6848d5bemr96658655e9.26.1794814534590;
        Sun, 15 Nov 2026 23:35:34 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/24] python3-coverage: Upgrade 7.17.2 -> 7.17.3
Date: Mon, 16 Nov 2026 09:35:08 +0200
Message-ID: <20261116073532.880420-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132429
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.17.3:

- Fix: using patch = fork, a child process wasn't measured unless
  patch = subprocess was also used. This is now fixed.
- Fix: the JSON report keys functions and classes by name, but
  names can repeat, for example a property getter and setter. Only
  the last one was kept, so the others were missing from the
  report. Now repeated names get a @<line number> suffix, as in the
  LCOV report.
- Fix: when combining parallel data files, a file that disappears
  after it has been listed (for example, when the process writing
  it is still finishing its write) is now reported with a warning,
  instead of stopping the combine with a DataError. This was a
  regression in 7.17.1.
- Fix: with patch = subprocess on Python 3.13, a measured
  subprocess that was stopped with SIGINT would exit with status 1
  instead of dying from the signal. This was a regression in
  7.17.1, and is now fixed.
- Performance: on Python 3.13 and later, using the C tracer should
  result in test suites running about 8% to 12% faster.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.17.2.bb => python3-coverage_7.17.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.17.2.bb => python3-coverage_7.17.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.17.2.bb b/meta-python/recipes-devtools/python/python3-coverage_7.17.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.17.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.17.3.bb
index 836388afd0..6582369ca5 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.17.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "d05a1bef52f4d7f1b484a1cf46a8929e50963f910e51396373f06cd3b6248f38"
+SRC_URI[sha256sum] = "6695d1bb2a9a2fbd7806d69d78cf30f35eb0f65045da0ec5b5045242fadd6a78"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

