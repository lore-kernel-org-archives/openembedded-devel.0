Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.3020.1594437579401773610
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BkUaJLvr;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id mn17so3402944pjb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 20:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QpPdqVXyQ/u05FUbJHpVUMbf2/smNbZu/UfixEZ/WyU=;
        b=BkUaJLvrUoc8rt0kl+HlSMDAJlU9M4AGdPUVqLbmHS/SNUMdmyFDhcpRsJheYVpLzF
         Y91rKRBeRsQdGZ9nkOH0TbunOVh++MxT7ihybCN5B/6NLTCQzwkJTzQuSPmzRGP1bF0x
         Vf6z3gKYj67bDUzTnBR8LvaTywntWQGDa5hzWPyEFEKO/18nRkDF7pCvlhAul6m92CRF
         jbipxC0wrfwf4jNQ5YX1aImX6yTuAvCk+ZfAuMOx9xkct4k7u2c10gv/a4F1z6JPuqwe
         S/b4/y0v//pudCT5G8AcVFOu+D7hCxfq1l6417LaUEisxFrySOq4SUKr2GFPU4Ni7GF0
         aJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QpPdqVXyQ/u05FUbJHpVUMbf2/smNbZu/UfixEZ/WyU=;
        b=A/7ngM+BQDQtSIbNmyxb8NNsamsIfyFYaXUpmKGeph2WnClqPxTYok5V46UnqqM52G
         gseuTfFU8OTqVCFM7YuP14cnuYeYeItdwXipJ7HfJlGLQVcZBmIsYELMtYe17eUhuGqz
         ErvanIlU72N1iV34azaLro8PvWBHbWcnoHeYHr1I/Q5AGwhULXUrOnjw+9qz1NJPl042
         LoBVd8wEVoOYkM8b6U65Rhey9mTIa3w9oHPOVYZFwUq2JYBuzXbcNmRrxxv3wvc87RRj
         88VSUbpmtaDdeQS2dbiMQ8NoxtI33KMg+l7G/NSIP2wUox5rGrMqda7BW+flE84liZMs
         60qQ==
X-Gm-Message-State: AOAM530i7TzLSru7fGWPpFN9JV+AF3RcmyHn0guy9fuVgJVWUmrjQWlr
	YqCTB/Ps5NpKRE30JJiz93dVJJTsJPY=
X-Google-Smtp-Source: ABdhPJy+eT7B6QE4jlfnawk9KF2AY1YY6Ifw+YMu8CfR7Wm1UwLuwLjbBCSOPSgbB4rgiwRNCKB6Ig==
X-Received: by 2002:a17:902:ff10:: with SMTP id f16mr62191552plj.277.1594437578758;
        Fri, 10 Jul 2020 20:19:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:94e8:27ac:fdd9:c160])
        by smtp.gmail.com with ESMTPSA id f3sm6925461pju.54.2020.07.10.20.19.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 20:19:38 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/5] python3-qrcode: add package
Date: Fri, 10 Jul 2020 20:19:32 -0700
Message-Id: <20200711031932.5883-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200711031932.5883-1-akuster808@gmail.com>
References: <20200711031932.5883-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-qrcode_6.1.bb     | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-qrcode_6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb b/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb
new file mode 100644
index 0000000000..df99d403d1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "QR Code image generator"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
+
+PYPI_PACKAGE = "qrcode"
+SRC_URI[sha256sum] = "505253854f607f2abf4d16092c61d4e9d511a3b4392e60bff957a68592b04369"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "python3-six python3-pillow"
-- 
2.17.1

