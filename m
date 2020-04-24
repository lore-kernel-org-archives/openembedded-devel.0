Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.2374.1587719768891345589
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 02:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lf7g88H9;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id j2so9872554wrs.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fpqAVQ52CSWivVwQ8m99THSYaJN87KMmyZcoJrxwrVQ=;
        b=Lf7g88H9qq2aOVVLMxlmW5SwSEdXzuGOUzwSYNVDwN/TOjQS2cnaY8uwLQsNfv7cLH
         0sUulTB/AJi2yk7cnCy0wwinp7DQAyhY5i9WnwWvcZXYOI6mk2LZ/fB1spUEU8Nm2qKn
         ZHHZWHJLxJg+LUsKGscgBexh8rSm1P22Jg5TUgv1vL+vXb7K/FUWs1RnSWHu1z+Ny5r7
         Xd82K5/c8RrXnyIax2lB2T/fKggG584EbHiaqb25j302VsbBaQoaHKPA46P0Aw6UGPW2
         FWqbC8jVItCErdXy7Yq7eYQOHT5mx7uTPnb2VrVuTa8ihxbOfny4g6LzcsRBgExOP8XE
         cOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fpqAVQ52CSWivVwQ8m99THSYaJN87KMmyZcoJrxwrVQ=;
        b=EHKDqLwN6Mr9P2yBD3QUYGufFDMdu5niv6ambQKgbQJHU/6gLccaA4dD7Vb+5HwNZf
         X5Y9ABEkwceQZdHCFB4S0i9upPFNJxf0tE9wKoIXlK+ZVuymrRB9aA4JvOoIkiyXawFL
         PFamTfaEnUUVozRbAU1Fcb5NiwUhFEkwahNFOhqITlY7dVVDfWBdXDR4A+22/iFMgXzk
         u3KPDQ8l5guMhU06kA1Agz91dJbOxnsGCIJa4YvNOziotuacIZ5trabCv2hnmdXZ5sLQ
         GCl+NvY8E/COn4gDEbKTvp0cE9CFejLXVbv11eYI/yJPEvaNSfDVXsREUrz+C2JB6fKY
         9WzA==
X-Gm-Message-State: AGi0PuYC8LiX04zx8UMISL+VelZkVLfsk3Jxr0JYQjVDhDBqUTFWwQ8Z
	Qjvtv1a+yod96cU3J/YJWrQTSZpJQwE=
X-Google-Smtp-Source: APiQypLyDtQeso7+sokDX8gkyzDq7zUUHaXcPF1ne94lS9+EgkHSnuiDvgkfD7jvuMZ/N+j9FHEi2w==
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr10754962wro.340.1587719767091;
        Fri, 24 Apr 2020 02:16:07 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b12sm8324448wro.18.2020.04.24.02.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:16:06 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] daemontools: use u-a for /usr/bin/svc and /usr/bin/svok
Date: Fri, 24 Apr 2020 11:16:04 +0200
Message-Id: <20200424091604.3945-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* busybox provides the same, causing busybox postinst to fail when both packages
  are installed in the same image:
  update-alternatives: Error: not linking rootfs/usr/bin/svc to /usr/bin/busybox.nosuid since rootfs/usr/bin/svc exists and is not a link
  update-alternatives: Error: not linking rootfs/usr/bin/svok to /usr/bin/busybox.nosuid since rootfs/usr/bin/svok exists and is not a link

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/daemontools/daemontools_0.76.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index b99116da70..f0c5f7d7de 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -38,3 +38,7 @@ do_install() {
 do_install_append_class-target() {
     install -m755 ${S}/command/* ${D}/${bindir}
 }
+
+inherit update-alternatives
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "svc svok"
-- 
2.25.1

