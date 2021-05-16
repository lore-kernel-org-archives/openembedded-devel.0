Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.1362.1621127616593320619
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 18:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mMGPoUgv;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id t21so1349109plo.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 18:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hn2wMibkvtCvn51/9/O0yhTzQTYVWmrxZxn9kasDYkI=;
        b=mMGPoUgvQxQKZHQDk+tEmfIEvCtDIkE7ksjeeBmyxyZJxWud6viOcD52freE/3JJaK
         MI2zcFTgSmOzgF76UYdRa9jxHxTZzn7UpviBdA1U+IsHLiR5hzgdnyJtynJBVNfC/VCW
         un9ZjcopU9wOcOzYqebA5OY6zxtGVFXqxZJQeBAiZiwfJKMsY5q6Mp58p3r22JAWyIfC
         KjsGmm3LeFGtDs3lJ3fUPRDQpXZ6DyL1AdlS+gXB+NoLezqubGza3yEfjf8TOg8+w4PW
         Jsoizrzg7V94Y9Gvx8gBqrVA/DY3fgj62o0IMVxBPsRJ9zWuzwfaFKhVSb5pBL3MDYyG
         +ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hn2wMibkvtCvn51/9/O0yhTzQTYVWmrxZxn9kasDYkI=;
        b=hg5EYC2nulK8qycLxf6DG9OtuojaIm96UzIf76Us685V3Vp3OxZlwIBGZpkyJU0U8n
         R0cMONvmzKVMe5cykYhkux8gTa5Li/pvm8WT81jRTW/vw4N2huGEs5YwH2byDo0avthr
         XqNOOXx0Jx6OFZDcWU6SFioEq+C7awDs4/B9miGuzm24QD0Py4AbKAG9z2ZE1WRCOTq4
         n+PpdXFtHSR3pLnauTXcfMPt7n/6cKLuSj6aRny0tVZ5Zc19YSuG1WDMGULyn8OZ2BTH
         6gcM3LIyjwIiiVkr/4SS6orie0eMvYelERFJPlqLntKKXJx5dzZE5jhQdUsg4IqJ2FPV
         02sQ==
X-Gm-Message-State: AOAM530DIgGT3tY+l0eG6HphaIAC2dfkS2tMTbxcX0sWfYrMSFMfK29r
	6lFJY70O5nGHaKQnxVzjug2eiC3OXayDug==
X-Google-Smtp-Source: ABdhPJxS0H8dBazXSvzwmxPibYPN7+OipS5NH/hFly7kQlldFIjxj3CMwPPpWBzmzYAyz9pCjt5zRg==
X-Received: by 2002:a17:902:e8c8:b029:ee:f249:e416 with SMTP id v8-20020a170902e8c8b02900eef249e416mr52069310plg.3.1621127615979;
        Sat, 15 May 2021 18:13:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id b6sm7075241pfb.27.2021.05.15.18.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 18:13:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-oe][PATCH] libraw: Move from meta-qt5-extra to meta-oe
Date: Sat, 15 May 2021 18:13:32 -0700
Message-Id: <20210516011332.664389-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.20.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-support/libraw/libraw_0.20.2.bb

diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
new file mode 100644
index 0000000000..0a7c534be2
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "raw image decoder"
+LICENSE = "LGPL-2.1 | CDDL-1.0"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=74c9dffdc42805f9c0de2f97df6031fc"
+
+SRC_URI = "git://github.com/LibRaw/LibRaw.git"
+SRCREV = "0209b6a2caec189e6d1a9b21c10e9e49f46e5a92"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+DEPENDS = "jpeg jasper lcms"
-- 
2.31.1

