Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.32196.1608506826879551702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Dec 2020 15:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bM7RFNWr;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id o13so19441277lfr.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Dec 2020 15:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PYotjaNIzvBmmuHW5rFimWITtB5Bssr10fxSpYjJGsA=;
        b=bM7RFNWr8KTL/Cbi0tflE/OwO+TGXd603qa4LX2gzQMpDp685rosiVy5CS83fUbLhO
         /CRj6weBe4a6W+VoxvCnrWtS6vkCZX8yAaG8DWUf6q41rp5vUNECjcq9NAVlacdyv308
         /qaUyFyCCGHS5O7pSQ41jPvi71PTV4x4HLQ74NcZUJJJOdWSnljLBEglPkxBAzt+lnGj
         uqerTMxg2FGEpwoISuQyXfzG9qZNuwGsbSR4N5HVR4Jn6fHwRr9z7Y11NrNkwK32olFd
         zJDbD1iOTxRVdon9eCSovzCxn7/PbmtjwbUwNh+pD9TOjJPZyuxC72ClGk5iZyXi2CmL
         zFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PYotjaNIzvBmmuHW5rFimWITtB5Bssr10fxSpYjJGsA=;
        b=RCJlAHJhc3IqXf3r7q71Hdrepq9WJGMtg/VkL8TuqI6eHPsD2nonGS0ea+wWtul64g
         /kTBGuvHpqPrRwk0irpV8OgtGz1ffN9Pz7Zf45H+9SDowX6zmT21iqdelhUXKx5aI03s
         OndlYCXdEPY3hIZT8Ivsfd/W39z3eE4tvPySoczdCvoLdR1LwVi2Y8WxK+4aaMAmRvK9
         e+9yl3ll6iMp7ykx7MzQqkf0xaMlhnDAFee/fU7RSrawNzBN+Oby66z/6xRrNv2Ia6r8
         Ay6CC8hRiO64wOaN+JTwX5t8duxpEefECz95vUbTFwrpM3AXQ7P6cpcBy4LV+uFsJs43
         r1Hw==
X-Gm-Message-State: AOAM531IvgbHxR+qLiTvN4Pq/N7XUGQ/44mT9M0MiGjfZguXSk/wfo6J
	KXc54oK/F7pZj1RWvY0Acf2+YskK6OchWQ==
X-Google-Smtp-Source: ABdhPJxto4O/94qflF0hVPb7KcpqRLxnA61NB+d1x0tgu0NKyT2arX0hR1K0zMKOPdNQDr/Vluxc4g==
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr5808878ljm.374.1608506824899;
        Sun, 20 Dec 2020 15:27:04 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([188.162.64.15])
        by smtp.gmail.com with ESMTPSA id v28sm1797784lfd.57.2020.12.20.15.27.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 15:27:04 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] android-tools: split adbd to the separate package
Date: Mon, 21 Dec 2020 02:27:01 +0300
Message-Id: <20201220232701.2641845-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220232701.2641845-1-dmitry.baryshkov@linaro.org>
References: <20201220232701.2641845-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usually one would install adbd on a device, where adb and mkbootimg are
of little use. Split adbd to the separate package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../android-tools/android-tools_5.1.1.r37.bb         | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index fea4f7eba11d..ae1463942a1d 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -67,7 +67,8 @@ COMPATIBLE_HOST_powerpc64le = "(null)"
 
 inherit systemd
 
-SYSTEMD_SERVICE_${PN} = "android-tools-adbd.service"
+SYSTEMD_PACKAGES = "${PN}-adbd"
+SYSTEMD_SERVICE_${PN}-adbd = "android-tools-adbd.service"
 
 # Find libbsd headers during native builds
 CC_append_class-native = " -I${STAGING_INCDIR}"
@@ -157,11 +158,16 @@ do_install() {
     fi
 }
 
-PACKAGES =+ "${PN}-fstools"
+PACKAGES =+ "${PN}-fstools ${PN}-adbd"
 
-RDEPENDS_${BPN} = "${BPN}-conf"
+RDEPENDS_${BPN}-adbd = "${BPN}-conf"
 RDEPENDS_${BPN}-fstools = "bash"
 
+FILES_${PN}-adbd = "\
+    ${bindir}/adbd \
+    ${systemd_unitdir}/system/android-tools-adbd.service \
+"
+
 FILES_${PN}-fstools = "\
     ${bindir}/ext2simg \
     ${bindir}/ext4fixup \
-- 
2.29.2

