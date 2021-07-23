Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7930.1627045538641567201
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jul 2021 06:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=F7zjtvXm;
 spf=pass (domain: linaro.org, ip: 209.85.128.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f42.google.com with SMTP id j34-20020a05600c1c22b029024e75084404so621626wms.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 06:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3KqK4tk05lH2Y30Pw1wrsiMd7TsfpyBtCBt5wCtn6tk=;
        b=F7zjtvXmDktTxcekjdayvNDJX2iSX1gSy9I0IsZla0Q4t6//pQnjOF3D4cVRQGTbVE
         t4K7bNe9qPrseV5G+UgO/bc77AQJ0wAI71BzkwMMI82WowCYArsA6JXNrjEKosu6WCgn
         SZLDsRvw60AL06E2se3Bq0NDtNsxQ8BE7JlDAUHwcAfJelcRTz8/jmxbCXozBvC269qz
         awY1Chr37jPJKnWQ11RGOIks2ynIkHGlzoYL1JAZHSEe3GmDI6akln9CchFqLjfuosW7
         kGyISOjSlN5XXfm1fNHJc3AHD7cZ1ADMsg9Yz8b0cjsy2U1va0KXEEltXVzB6x1oZyEI
         JmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3KqK4tk05lH2Y30Pw1wrsiMd7TsfpyBtCBt5wCtn6tk=;
        b=EqqMRtHIYVBzA8nuo3G1exl/DYC5oMz5881URNz28gxqqgTAE+l8HoJVpsSvuCECq7
         cBe+PWYDvar5/ljz2oRk1dRXgS1FK/9Sq5QYNqyh8OSUuJS/BF7v9vVMr55/ZhP+Xav0
         M9zl3OOG1e6/Tf2SFJldzi+dkckdQAWRrk1x/cRPCG5Qsz+Csy01zE7RP1RudgFm8Tqu
         cnb7AleGdpHW0iPLjFNjNVhRheXQvyIYSFUA4nsI48FHDUAED97zKShwmwj7yyw6eAmZ
         Pw4d7gIySVqdjRGq8zB3U3q7WDNFwBlEXGA6wTtP1O3kJwQtLzYgpe0ovqk1trMNVmMb
         4lDg==
X-Gm-Message-State: AOAM5308yMrl2DI59icpb5i0ncar6cNoKpKvc3LuOuuAn+XG2JouAbAK
	kSwgxc63kCPXWrlBsLNFCuf5D4wh7zDlvg==
X-Google-Smtp-Source: ABdhPJxlPegnRqaLU+G43uTbPad55e72Imw/cF2UOyQfDEVAnJvcvunylIo2cFclYHUU/niHypJOcg==
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr14297202wmk.40.1627045536575;
        Fri, 23 Jul 2021 06:05:36 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id u16sm39543951wrw.36.2021.07.23.06.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 06:05:36 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] mbw: add new recipe
Date: Fri, 23 Jul 2021 15:05:26 +0200
Message-Id: <20210723130526.32150-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last release/tag is 1.4 but it's from 2014. So use current head
for now.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-benchmark/mbw/mbw_git.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/mbw/mbw_git.bb

diff --git a/meta-oe/recipes-benchmark/mbw/mbw_git.bb b/meta-oe/recipes-benchmark/mbw/mbw_git.bb
new file mode 100644
index 000000000..5ed726d9b
--- /dev/null
+++ b/meta-oe/recipes-benchmark/mbw/mbw_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "MBW determines the copy memory bandwidth available to userspace programs"
+HOMEPAGE = "http://github.com/raas/mbw"
+SECTION = "console/tests"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://mbw.spec;beginline=1;endline=10;md5=bbb77813272134a5c461f71abe945bef"
+
+SRC_URI = "git://github.com/raas/${BPN}.git"
+
+SRCREV = "2a15026ff65160127204881263464b1740a57198"
+
+PV = "1.4+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/mbw ${D}${bindir}
+}
-- 
2.29.2

