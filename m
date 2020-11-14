Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.7870.1605369623235385839
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 08:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h2AJZGig;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id cp9so5961288plb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gfcqZOjg4l9+0FuMpo/JOWDzkbEAUO/1OGNrsxO0MKU=;
        b=h2AJZGigAfRm+De6I81LPUjw8Z+aIZHIKBt/UsP6e2FXdUQMX0efRwe55BNTS32oyg
         3oEks8lQs1k09U9r4BdxxrzWh8njcUoZgMUVTg+6/RHaMTBH/91SRU989ZXZQNeG2Abp
         Q2FosDoF/P/pMPcBdWE/1nWI5ALEdjEniWPlKki45s1iEs8uAwRRTg9pa5Ycl5Bc/Zq2
         MZcl8HvSlQVwxpnsWPXYwNW03RcOBKu2ngF2o5lGt0JS50cgwdl0zRFjW/k4RFqpo0aj
         fCnEOQ5dPY0i2cyybH0Ju6rGbmB2f5cMK1iu1ZKaslYKqhoA0ppWCRtx+1T3O07BBVSb
         2YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gfcqZOjg4l9+0FuMpo/JOWDzkbEAUO/1OGNrsxO0MKU=;
        b=HJM4+OvFil5iei+COsNEM/OnqIs0JxFnrPvuVtkLYod8BU0EdJiX+XPuWTzryvT/d9
         rjaTET2SIvHSAlRgvzH5PK2Y9gddWi66YtOZVuFcRYhvjLzknfxSPK05WJCsEdqHYf3P
         l++DxNzO9song4jmVI7vGVUs1qziHDI7dbHveSdEu5VtfQ9pBhWvGjn5xA6cdcLunSqH
         FPpVf0JxhP5bvaULmGL7vR76h4n0Gxv/DWXd1tqitBWx3TPG2JuFmuDTZhT13ZHINIUO
         +61rn7SYKJlWWe2Abj61j+esOGKS2lbAOgl9O4L34iIwANFrWm+k8nJY2XNMh5QWFjaE
         s+LA==
X-Gm-Message-State: AOAM531ANZT5uCJnXeY+t3EyGnaAhsgI6QCozV6YeeGqWnsL0xbQu0Mk
	nbSoNe+iN/9HjAus6lE7z/8s0hRDM0JH6ze9
X-Google-Smtp-Source: ABdhPJyQx7u5FWrGWCLZ9BhAOQaQKmqWQoEi7SoPk5s+7UtFdkyHflqDoKu2nT+ACxhWMFkp3+xbYg==
X-Received: by 2002:a17:902:aa06:b029:d6:da66:5048 with SMTP id be6-20020a170902aa06b02900d6da665048mr6569060plb.5.1605369622436;
        Sat, 14 Nov 2020 08:00:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id w196sm12647687pfd.177.2020.11.14.08.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 08:00:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/3] packagegroup-meta-multimedia: Add srt
Date: Sat, 14 Nov 2020 08:00:17 -0800
Message-Id: <20201114160019.1885976-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index b4f09cdf54..78c7c06b22 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -101,6 +101,7 @@ RDEPENDS_packagegroup-meta-multimedia-support = "\
     libmediaart \
     gst-instruments \
     libsrtp \
+    srt \
 "
 # devel headers/libraries only packages
 # libsquish
-- 
2.29.2

