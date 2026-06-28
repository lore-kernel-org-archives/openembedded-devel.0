Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDC5C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:38 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75151.1782663756551491004
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XvUrHN5V;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bc871ecdfso3314073eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663756; x=1783268556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pK0FrJQ8X4am/kaoLfofSYlcl2K87CwMP+b6vQzFnOQ=;
        b=XvUrHN5VcrgdctpdK5vqExl2Hhbc0TftU9HLB/G+V/552oTWRonaFHLwzPo1J2k2/q
         yVxozM3AwnTF/uwX3uyrqWXAZxIPapjdJcNkZv5mzhdiPntbKdBOFpTqpcTqKNseEdUO
         HmyBNj/jcSve47E/Jj6MMFNrhyezZX0xf494gS5FakPOy7DJrxPm95K/qOzGEjGG2JOv
         ajkT/t33DUgUa5gL59+Er0BVmQgQ2Z0WoYXBDfBzntoH3d0XQclsbPUeFaZ1xyiZdhv9
         RgenA2pVR5cvntaFXxjrCR4X+M+bjIM73NWwwu9St1x77UK/fHYYzP0jDdnKhiCjqWjC
         AXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663756; x=1783268556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pK0FrJQ8X4am/kaoLfofSYlcl2K87CwMP+b6vQzFnOQ=;
        b=HRdCQVTf2IBmMVKyxzHnT0oajNFssgEspXifeC1/H70Js5bTa9yXmiNmZNbCtp3IYm
         gA1+gTyK6d4Oy4h0BoEqB9U9gewXDCIMl6Cdkiz5YBUJU+NSnG8gqiD+KKIWE/XD/g+C
         pAxK/BSMxmLbdTy1HYr4Y/OLikp2T2drv+yPzm/jxO/o78YLipnY5+TGqm37J+NdORA4
         8LRh5mjJH9vpOt2G0oTsDwug2pF/AeJ43kxXXmW3rlLtFOys8Q+xQCe86xu1rjdRgOw8
         tS3OC2tWwbp+d0i6I80m/j4dSMl20ormfVJPEGer3vaVC0henJxKzr2SCp/IJWRzL4aX
         3/hQ==
X-Gm-Message-State: AOJu0YyqdvQHXnUvHpGiZDLicDPPY/gwok8oqAZ5Frz3SLUJ4Cfl8oqD
	ZCDfWstlTPRB0oyOuxgqp86+7v3p3bH7JvXuILFqeKiJ83xjqO/2za5qCLR5zUu0Dgu84g==
X-Gm-Gg: AfdE7cmMogZJh5HOr9MESntDpCDwSgwN4ULQ4AwWXvyBVl484/nK7f43JSUjzsspE5c
	kEvjuAjt45r0FB8Y8kWMSqVEOLc6Js/ZiK0obbe9SKQhrdhNFQyXHDcbx4LRoDjnqEIpxPRG6M/
	Ep/Z1zEo71NIvmF6paCIAasC7JFNCvV72qUWcKKbXKWs5/LfmHvrgwan9lfDAlA7nG3r26chuEQ
	To3s6lcIJ+Ht8TX9NmzU0HC7JXrgzn9xLAFxWhpR0i6X7eHcGBUg0x+XSb2GfnzOWi7qYE+zRes
	46QIJHfRt7ObKjhgdLavIwBEX3GUT8kUnc9AWDF2vL/DiXisKE9ACFID+xz4Uo867daCJ6Pof+g
	UtzL/OOm7hp5m7zBCxf+kYBjMRKwe5W/+WEwDCh0Ti8nuJu9PNPmEmJefZZbfBd1HP7F5EVvPKO
	PZu4FNKHkvxqDqbAYmVx9Z3xvZVX4qSaX9owijTdpu4A3N2UBCfZD42LDigDi1NmV8ez9S5YteH
	A01Vtzswblku4z6n0B4v7QEzFHpJbFHQr2WA7wmaHmh1x0c+EHwInlLJ13ibNWjk5bHLugKac7q
	c5n4MVqzbVfjdpn76sebcmXHbJxkww==
X-Received: by 2002:a05:7300:a485:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-30c84d5034emr11997645eec.8.1782663755829;
        Sun, 28 Jun 2026 09:22:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 110/128] minifi-cpp: fix fmt branch and retarget gcc-16 patch
Date: Sun, 28 Jun 2026 09:22:04 -0700
Message-ID: <20260628162222.4081517-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127920

fmt renamed its default branch master -> main, so the SRCREV was
unreachable.

Also retarget 0001-Fix-build-with-gcc-16 to
minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h after
the source-tree restructure in 0.99.2.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../minifi-cpp/files/0001-Fix-build-with-gcc-16.patch  | 10 +++++-----
 .../recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch
index f1d83760b2..ca1b67783d 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch
@@ -8,7 +8,7 @@ Fixes:
    38 |   virtual int getRealtimeUsec(uint64_t* usec_out) noexcept = 0;
       |                               ^~~~~~~~
 
-  libminifi/include/core/RepositoryMetricsSource.h:29:5: error: 'uint64_t' does not name a type
+  minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h:29:5: error: 'uint64_t' does not name a type
   |    29 |     uint64_t table_readers_size{};
   |       |     ^~~~~~~~
 
@@ -17,7 +17,7 @@ Upstream-Status: Submitted [https://github.com/apache/nifi-minifi-cpp/pull/2194]
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  extensions/systemd/libwrapper/LibWrapper.h       | 1 +
- libminifi/include/core/RepositoryMetricsSource.h | 1 +
+ minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h | 1 +
  2 files changed, 2 insertions(+)
 
 diff --git a/extensions/systemd/libwrapper/LibWrapper.h b/extensions/systemd/libwrapper/LibWrapper.h
@@ -32,10 +32,10 @@ index d7e7b7c..c8af00e 100644
  
  #include "../Common.h"
  #include "utils/gsl.h"
-diff --git a/libminifi/include/core/RepositoryMetricsSource.h b/libminifi/include/core/RepositoryMetricsSource.h
+diff --git a/minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h b/minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h
 index 6c933b7..f39fccf 100644
---- a/libminifi/include/core/RepositoryMetricsSource.h
-+++ b/libminifi/include/core/RepositoryMetricsSource.h
+--- a/minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h
++++ b/minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h
 @@ -20,6 +20,7 @@
  
  #include <string>
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
index 5e6443598d..1d3992aab3 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            git://github.com/gsl-lite/gsl-lite.git;protocol=https;branch=master;name=gsl-lite;destsuffix=${S}/thirdparty/gsl-lite-src \
            git://github.com/HowardHinnant/date.git;protocol=https;branch=master;name=date;destsuffix=${S}/thirdparty/date-src \
            git://github.com/chriskohlhoff/asio.git;protocol=https;branch=master;name=asio;destsuffix=${S}/thirdparty/asio-src \
-           git://github.com/fmtlib/fmt.git;protocol=https;branch=master;name=fmt;destsuffix=${S}/thirdparty/fmt-src \
+           git://github.com/fmtlib/fmt.git;protocol=https;branch=main;name=fmt;destsuffix=${S}/thirdparty/fmt-src \
            git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v1.15.3;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
            git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;name=jsoncons;destsuffix=${S}/thirdparty/jsoncons-src \
            ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=${S}/thirdparty \

