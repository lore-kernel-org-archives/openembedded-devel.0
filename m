Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.9997.1615050002138791934
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 09:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iwRAtE7H;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id w34so2451908pga.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xBwPbP4ziwtCUEhNR5fB1srMmq7Q0+NkMJ8RCYNVX+E=;
        b=iwRAtE7HWoMIn2/H9EOBaUH0vjTsP2ODbSx8Rhbc9+LAXdBpsxa4kNRpI5uwiKkQwb
         mmkA5ip1O/ATwf7I8gDxaC/NQSqjE62xmw/AnSIRLwjTNjY5pjmrfQV8zCGkQBVMz53t
         QaxmJ1W2Aw0AF3wEa/lSNnJmmc+H/AI7klRqEkLOIVHR9OGgpGogYZufuy9WOGeV9eEc
         1L7/uIDG5Q+AFxSg3AIVA8HPps06eujMICJR2I3Y/uCedMgNX9wOqP5N8+hLzZwFuOIu
         dBa1QRUhyq0WZbYDeMibEhoYFem4VpZzzDOsuccuzPerorwm/ukXUxbg2/bDcl+OLSGS
         Ljiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xBwPbP4ziwtCUEhNR5fB1srMmq7Q0+NkMJ8RCYNVX+E=;
        b=ddllLVKyI840wZ+XBIl8QOFiEf8MHsAfTe2jtYT4jwbDq9X16yWE77TVwqo8SR+5f8
         LyCEHAGcNafWU2x+YI9HVXmKOW+7m6XbRdjloiPMXRpEn7oJojCHVeBw1LeTOVwKL1fJ
         ohFWTMIySjAcOKdtPYwM/vwNEGqOKJzHnOdWozN4xHNJ8FXiBRLxFCq8QN5P3miqczC1
         zSJkI2suk66b5LKBBTRTV4eWaqtYQUdfUS2J9sa3Ed3r4Th+eN/tEy03eEwVVf7emns9
         01l8n1sCY9pY573PjYsAvzwb8HhgpjDroagDI3VKXO14WaugC2QVJf9s6XWdUUHExSAf
         NwBQ==
X-Gm-Message-State: AOAM5320DVCq7yhBfgEEZTlRbvjidohthTj2f4vZT2UG4TgtU7LsEhmt
	BO4Yl+i0XSDLG7PeGlFqIK6hssNUYIXOjA==
X-Google-Smtp-Source: ABdhPJwp9DopzBLjhmDn+u5FpE0PFN+bWXyrDZI/TiFAMZOBtcC/4ckRMpfyL+OfcSpDQwcZMd7JPQ==
X-Received: by 2002:a05:6a00:8d2:b029:1f1:5b57:85ae with SMTP id s18-20020a056a0008d2b02901f15b5785aemr7367830pfu.60.1615050001271;
        Sat, 06 Mar 2021 09:00:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id r4sm5675350pjl.15.2021.03.06.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 09:00:00 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Add libleak to packagegroup-meta-oe-extended
Date: Sat,  6 Mar 2021 08:59:59 -0800
Message-Id: <20210306165959.891299-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 94830e2970..311acd6cb0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -338,6 +338,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
      hiredis \
      hplip \
      hwloc \
+     libleak \
      libuio \
      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
      lprng \
-- 
2.30.1

