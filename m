Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55264CD13D3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:07 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13805.1762853880254794890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCthBJ+j;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297e982506fso32432675ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853879; x=1763458679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xikcZ0W3lhGoNuMLRJ4shNTThQZ7Qtqe1BZjwIWtbZc=;
        b=GCthBJ+jlhB6bcIgF3rY/8+Xe42Ag4xpAUFPXadlZqDWBoaQ5dtbByn6FbN3WEPf1/
         /FYIbOHaQ1kZ0yvKlCmuKtV22Vg++Itt/WsQmH/j47KWFPwrnHwjygJxrUlQbpjtZCRP
         m0Yv26HLjVDB7jq0jwIWm+PjJWfmqv+1k1oVRFVAR8fNQhj+lZmYpvSHIH9i9BORSuOk
         bN7T/KORoG59r7q2yoBjE4bdUH3YAXfCULfk52775K8Yh7043HwYAi/qaN5RBrx3gTz0
         IVznqOqG5ba1s7mGls5bn4cnMj5sIHwEODo+oU4Y0mDBr0nRBP4quIvgY95a+yDnossf
         xang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853879; x=1763458679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xikcZ0W3lhGoNuMLRJ4shNTThQZ7Qtqe1BZjwIWtbZc=;
        b=hL/jpz1AgroD37f6FqiU0WJqMx6FDeNVH53FYRVvml4DoOl7gQ5rXOfQLiJbH+h8Kr
         Z9Fl088OZCnoH/eF9IL58UJAilU9wTKLiD5BRizU5YiZEj4TLmeCkUJdgiVXJxRYO6kA
         c6tMXTD49WTGhTVA1okjvyrRyxApcTxYwUoc+kE9dnlQBa7EMEgPqwL4r9/h2S5FypjR
         rZWtddO+YsLlW400KdUzMzZWOb1chvIBhw9r/Cel9fkcS0Uj7s64rzwoRt2sDT3HKMHH
         VvEFlWEZdhkDr5bocf6uaOit+hn27Rh4IbK8pttGAILR1I6lQXPZBbjvMdaCKJ0z971K
         XwGg==
X-Gm-Message-State: AOJu0YxJpcMB5lZxtjaSy/4Pkd0vuSi3xyGpd+tu0o06KVpA9cc4RdXD
	cT0tnUDe3Vdo3rdl4SyRACbzRl+H2ti+ZtsOotOgQvBnTC/vqo5+U2TOLGMB1LW586w=
X-Gm-Gg: ASbGncsh5b4Dy3HYDEI2NVD1bDwJ9YCSShAW/cPMoK+jkgZJVlpE7jT4rz7o/OvMGTk
	OutybPQbtbwKZQFlRifzBiYX/U4ZAGI6b8iOz660eum27kR4tD8jy+yJVe2WYta01y3gsBekvo1
	cWE/IG1DTox34OXbEB8vKwZHRZuW1PYROvZL9yrs4+8Q2JfR7iyC34YG3AmkxBLHLqI2VzovaEn
	DWZXCnjU1L6nz0m8NbumlITQaw4JKy2d3JXduw0B6rFNqBNqG6mnz1AjtnoR56UXk/h0NVaSKI8
	/ABGYy8KOFlcUXaCFj3mIgo87sYInTgpjlmvwkFlHFLb8P4zn3b625YOXKXAk/2bePLBUyBhJ5G
	AQOOUxkJWitrTeznuz780DV6H/VgITjP7fBP54KEhlqz7nQnboE2b78O3xjHQhoLCa0sqNnON1U
	i16fl5DTBc64Wjug==
X-Google-Smtp-Source: AGHT+IGjHr+JAhnnJYYG2npCVHHNeEbwoE6UMSBSAtRltJaJ6QY4SGxJtTJ+aBetE8FAUSFfr/IJ/g==
X-Received: by 2002:a17:903:41ce:b0:28b:4ca5:d522 with SMTP id d9443c01a7336-297e56aec9amr175950565ad.39.1762853879512;
        Tue, 11 Nov 2025 01:37:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:37:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 07/18] squid: download from github
Date: Tue, 11 Nov 2025 22:37:22 +1300
Message-ID: <20251111093733.1393568-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121510

From: Peter Marko <peter.marko@siemens.com>

Devtool could not find latest versions before.

Download page [1] shows message
"Squid sources are released through GitHub. Please refer to the Releases
Page to find all released versions."

Note that also squid security advisories were moved to Github.

[1] https://www.squid-cache.org/Versions/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f088e1e1f93e6bd15358f921624159ab279953ab)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_6.12.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.12.bb b/meta-networking/recipes-daemons/squid/squid_6.12.bb
index 4c00d12900..ba5ca3a698 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.12.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.12.bb
@@ -9,10 +9,9 @@ HOMEPAGE = "http://www.squid-cache.org"
 SECTION = "web"
 LICENSE = "GPL-2.0-or-later"
 
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
-MIN_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+PV_U = "${@d.getVar('PV').replace('.', '_')}"
 
-SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}/${BPN}-${PV}.tar.xz \
            file://Set-up-for-cross-compilation.patch \
            file://Skip-AC_RUN_IFELSE-tests.patch \
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
@@ -29,6 +28,10 @@ SRC_URI[sha256sum] = "f3df3abb2603a513266f24a5d4699a9f0d76b9f554d1848b67f9c51cd3
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=6fbb6a2adc362e206da7b4f42846cdec \
                     "
+
+UPSTREAM_CHECK_URI = "https://github.com/squid-cache/${BPN}/releases/"
+UPSTREAM_CHECK_REGEX = "v?(?P<pver>\d+(\.\d+)+)"
+
 DEPENDS = "libtool"
 
 inherit autotools pkgconfig useradd ptest perlnative systemd

