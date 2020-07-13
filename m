Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.11840.1594608991958218019
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bU8xb7bk;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id ls15so5499015pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yztxeAUpJ+x0bDHO43WmF2RdSbegRHhPaNJ8A4NjLZg=;
        b=bU8xb7bkQaGoE+MSTBFP4aVxwjr07SpnFcbgSuis1gD/0rx4lF7lJGp6y0X8iqKFFT
         eBfeIQyyLufE6W4TS6x0OxRI/S0Ttlzor7oQY+/V7l9W5caT7e5QPSl+mvk3TMCutOPK
         tHgy21H5YFkETYGsMo3dyr4OD2CqFa+WJ+72vTLDfDfdV/8CHPokYmHw15nQgC/ozPAu
         gUkhDD1eI3FWpnLnTvU1IO4moN1NdsNyjYsmQJwwjdeYeiIjkD2ZhAuuRc1DUgsq2sJ/
         hstYGP5gr5G8FCuyow2GMAwVAJbRTdEjHXU+alKRjjeCa9/fPgOOAnNLk0H97ZK4QxgR
         uAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yztxeAUpJ+x0bDHO43WmF2RdSbegRHhPaNJ8A4NjLZg=;
        b=HGCOcVd0JZVvRwYrpVdWo6CZbcNZmPVrB2YrqFgRdN8RmoAlMJlQehj8ieq5uqElqt
         noNBdWpCcjTSz7dEylu7StEskmvqaMdkiRKfuT9KiB5Ar3Iv0CExnHbnoECvf6Dcy0KA
         m7L/EEhQXAdF6+Fz0PQ0t9lv8pAZRsM3HFQScwt2mYWr1TXLA5gAEkt+WHM4iGJ0LErM
         TTs/x6VSlrweNvdGdMkPcFY6bpGdQFVY2dqnF7L2/PAd/2F+UiwgAefAWc68klmMFWXR
         2Kcqho9fvOln4lQ5Xld5Xhco23nT87LxRLVrTmO2rSNL2BYyayIYduF30dsHosOawe1O
         VY9Q==
X-Gm-Message-State: AOAM533lIVki//RwTcSUKnTOY+zZABVTevDW+NTGD7I7Ksr+b01QgITr
	ER+/pMpXJXhR7Kv1skTpA7tmMYLgY70=
X-Google-Smtp-Source: ABdhPJx0H0leZc171hH2MEd/l81GCfl2BaaJGbTIgTf0USFTL2QW0xeEJwRJwJ91cAhmom1RdjGw9A==
X-Received: by 2002:a17:90a:67c7:: with SMTP id g7mr17390818pjm.165.1594608991277;
        Sun, 12 Jul 2020 19:56:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 14/18] upm:Fix build error when enable multilib.
Date: Sun, 12 Jul 2020 19:56:10 -0700
Message-Id: <ead5cb4ed7dab28ba4fd3789b2400b4d0d062ba5.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

ERROR: upm-2.0.0+gitAUTOINC+5cf20df96c-r0 do_package: QA Issue: upm:
Files/directories were installed but not shipped in any package:
  /usr/lib/python3.8/site-packages/upm/pyupm_adc121c021.py
  /usr/lib/python3.8/site-packages/upm/pyupm_hmc5883l.py
  /usr/lib/python3.8/site-packages/upm/_pyupm_mma8x5x.so
  /usr/lib/python3.8/site-packages/upm/_pyupm_m24lr64e.so
  /usr/lib/python3.8/site-packages/upm/pyupm_tca9548a.py
  /usr/lib/python3.8/site-packages/upm/pyupm_mb704x.py
  /usr/lib/python3.8/site-packages/upm/_pyupm_ehr.so
  ......

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit efe14bb04e58dd2028ba7c1521f08e2bd5382130)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 5b3585c141..6a7611f382 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -46,6 +46,10 @@ PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '',
 PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}, -DBUILDSWIGPYTHON=OFF, swig-native ${PYTHON_PN},"
 PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
 
+do_configure_prepend() {
+    sed -i s:\"lib/${_packages_path}:\"${baselib}/${_packages_path}:g ${S}/cmake/modules/OpenCVDetectPython.cmake
+}
+
 FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS_${PYTHON_PN}-${PN} += "${PYTHON_PN}"
 
-- 
2.17.1

