Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F318C77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 21:00:11 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.5940.1750712406289079275
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 14:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W/odzW2+;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so48976931fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 14:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750712404; x=1751317204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThLmc/HzP+dgQgX7nm2OrXamfFtgf1QX9D7tqU+mfTw=;
        b=W/odzW2+I5AC2tivtti3jsU8GqwIGFAJPyS82PhOUaU5Efk7J3zPeyGbVUG/edXYhe
         3bMLbpjcuYl+eTkKfb6ma8b2l926zU5vMn0AurU0EyCpw4yc2TutOyneuSiOH2x5LACE
         67oh3gzhNASYP0mxova38T0YwPIHh3DijUP4qIB+MbNVS3A8m6vayENYVoxMlf0sgMQk
         EGHTUwARbR8v4lpIZ8eiUZQv8BDM4F9qm+mSui+5r12O/nkoXFEbb0/e1ec4BGiaftSc
         CkXvTa4GvTAD7olxVkIEtpo7y1ZQ6/Gs4n6f7GJb1d/uj3IdWF1rBAgywMHE+mxzrAuo
         Pd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750712404; x=1751317204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThLmc/HzP+dgQgX7nm2OrXamfFtgf1QX9D7tqU+mfTw=;
        b=e+TNPX0E3p1lC8RLZ9GO/NgVoOzm0GUXNwlahPiiUlRuGsmjEOPjSBFzGsVx3wxCOg
         u8VgWqrOHL/0eHiNmy6HhYMygQZ3Vn5RGrVGzLa1WT+O1WRMMwIg7H/XyA9S6ZOSgjSV
         yHOcqCwx7F9/0Q6pJqHoTJTSQ4/qIPI36huth4Y24HaYCNKIQ+X+fnWK17PjfS4uCtt0
         Z13DR/zusigMm/wpCu5F05HYBBE0J4McdXZ77GHIfIIM/WlbaMUQ5XnGuLSl07+o4lYs
         IQafBqvzkRZW7RK9iidX3xjhNfsD1Gkzow6QWJyLcu5ayxI9y+rwN4AiIMrViYPg1I5x
         N7UQ==
X-Gm-Message-State: AOJu0Yw2tetRFs9DUazO3CkfN9JJRcXCLjHTiMx5S2U+s+DZWqN4m91z
	Zq3jx+w9y8V7kGt3N7KiGDuiUeO7ySlj5eP4fgPWtTFcLFLwIxAne42Hcj9LyA==
X-Gm-Gg: ASbGncvX+BP9dHlzbVvDdYqTvqJ9ovvVcxOgQntUGOtnatDcl3XoO278wnsewchOdvz
	H8XX6oiwsuTbecSI+sJT9XqwvX5jUK0kwyzuG3URwkMmG1u7NbpUjEyN2PeIFrDoD6MHwfqYz4v
	UlRfPZtAkhhgH5MA0FVTXEC31aTB1xSDd5eXPhV1u5lRAfdkBp3JqVj+af8CWYcq8RG1VgFerS/
	u/z/LcFO01hNYmhto+KDTsCvA6Rm/KyhDkY//Bv3QYCV0uq5lApmOfjWSZo3S993j9Nn83B/p5B
	HmnWQF5tO0o4KOJ5V9NSt3+/PY254wjKbxOZvwsDmkysNdoYJDH5yuO3ZvJC10bcudW3eEHOBuO
	gOxo=
X-Google-Smtp-Source: AGHT+IFIP9/3Hx0n5MzOArV00Zh+5v/MOmRyuY8v70kgrdQv4RFSqfoNSbn1aCkg2eJJZ8yXluG4dw==
X-Received: by 2002:a05:6512:b8e:b0:553:37a7:b217 with SMTP id 2adb3069b0e04-553e3bf3e5dmr4633151e87.35.1750712403635;
        Mon, 23 Jun 2025 14:00:03 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc3d3sm1538130e87.233.2025.06.23.14.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:00:02 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-pandas: Fix contains reference to TMPDIR [buildpaths] error
Date: Mon, 23 Jun 2025 23:54:34 +0300
Message-ID: <20250623205434.954680-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 21:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118092

Ensures TMPDIR is removed before packaging.

ERROR: python3-pandas-2.2.3-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-pandas/2.2.3/pandas/_libs/sparse.cpython-313-x86_64-linux-gnu.so.p/pandas/_libs/sparse.pyx.c in package python3-pandas-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
index c7e3ec8fec..b817b0538d 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
@@ -41,4 +41,8 @@ do_compile:append() {
         sed -i 's|${WORKDIR}/pandas-${PV}/|${TARGET_DBGSRC_DIR}/|g'
 }
 
+do_install:prepend() {
+	sed -i -e 's;${S};;g' ${B}/pandas/_libs/sparse.cpython-313-x86_64-linux-gnu.so.p/pandas/_libs/sparse.pyx.c
+}
+
 EXTRA_OEMESON:append:class-target = " -Dnumpy_inc_dir=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include "
-- 
2.43.0


