Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8131.1794465757294505280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g/lgn/U3;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so2384281a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465757; x=1795070557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z54KvSHZBt5e9ODOguv2CZ/Q80pFi2EWT/6J2zGP8Yo=;
        b=g/lgn/U3eMD4Ds4JAqgpmwsG57Z2s1Y6CZrV5WwIIoRHhHTKcDRzRrTdnrWRfWxxwp
         cJv62cQ9oPj/B3JrenZOTxJP6UC6I5NODuL6c0ls/t19r2Pgz//IiLrfcpu9suj48nWY
         DZMq8E4Z28ZI9yh1/n4LUL7YkN7sgZ5d7/B6M3Oqtgg/fQzzvtG8OXwklwMED7QLnHuY
         mrh4eXC4My5yz8bcOmKnwO+nmLDTrYRBMExoCHBnndIFvDuJvgB+tuuSDnCOahvfFyBM
         mNc1qEgJBRG/J0+bR4i65gKRrSO2hJ3uwUimWWScMkb30jvacEkERUmRYdLRxk7hyyHT
         tmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465757; x=1795070557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z54KvSHZBt5e9ODOguv2CZ/Q80pFi2EWT/6J2zGP8Yo=;
        b=DLxSNyqD6xKDMFxvIedWKVi58QfE3HmV6WR+b3zlFlg3LH/zko43I9JBFsbfibsCK+
         vMkuVgijkU+H/M7yz4shpIJiRq6ZM54S2IHXb1hte4bDRiCLBv41/VNxSXErGesbasXU
         3lX9t32hoqMA8CFhjxG1yYB0O4XB4u4Do2ir/T3pX84tMxl1dEUWDzdGGL4hKaxJon7A
         0IqYPmjHZvAWhtiohED1Xy/jys/Seb+7I7K92tDSZAZ+sO6Vb+zeI6UcZOSOiUkr7afD
         dSxozeFtg8XqxyVeOLs2Pk7+Ld+UdXe+gmQqCMVx1kHqh+xbEb2CyBI+ai5JhBGxlxXL
         MN8Q==
X-Gm-Message-State: APuU4Z/aw1PKnn1DYIXdIP11rZRTAGX1IXyQtV+rsFO42UtKFOTWj8IU
	vSwGcpc6F+GWxsp5Hthjc46OmBjP6rAXpp/axvMqvyQR1MXTNebux4CjXPqL0mry1mM=
X-Gm-Gg: AYBFou3Fa/03AGctM6XcadzCmbx2xCUXw15KuW4LH1EUULieV97A7LymcUPGY7OUHFH
	guQw4l4p8TxmwdMJkpz0igVIbas31qE66BYEoIIBs1D3UlojkEBgCnBO7ziuCSzBvDU8DZr9dWE
	FNPdDf0GDVk8m3D4ESPALGWrXsmgGn7b7N5Ih2Ar58HThA/SySNHu62SwJjU/Q5oIeNOyRQ+DYC
	Id1CyKpWoU1/ydxF/gjqHTTvMnICQua8oWON5AheaLhMzcIzos09+s+88mHDxSHopJuQm6uWIeB
	xgVhAZIYM/EsmR9BJWPxjeGveFNpOZxIUq7GBAOM8/oaz99QSBvifhBkzZIy+gVjjLKnyrcDil1
	1MSbD8UXo+W3xrOvNquhNBkdPW+C+v4chBA5vPUcDPJFQ3ElLNXiownH8Ow4Lmf+3DjikVOWUBA
	EIGQdpKHmuNL5gKg64TMhbluHIUoGUKDv+fpOalyjlFWT/NLAahoGlDfBXJZ4jZ5K1U2959x4wv
	5NQVa5H7dtvvCLOsGPqR0s1Ry91RahapPnJTbXLIAEbieV6QnhgHjMg3xaX5zGcDEDRdG2YK+Q5
	BF2ya2lW98auT3xvVXs22e8jWPEtfGaO4me+c1irpevzm/4u4dppQsflnJzckl5haF2Qm4prYPY
	P9H4T62LOCZV1N1M0BMeGQn9QMda64laoTFfY5D5YqZmB0kVXQ2Cg65W++d9ZlMMyvqQye2CRqW
	kFokrLzv8i8c8SxQP578HcUuZAzQuLg76SoLas39u2Y1fU6AdOz50VJmf/3OiPfpCzZlSnYF7+L
	2yNWNyVp9VQx9Us7Fx11dO1z23+/Er0qA0mz9ZJI9Y+HOyAjmpsUkwAjCRBX81NPqkvRD25ETMo
	iUNC
X-Received: by 2002:a17:90b:224c:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3b182ffb711mr4489923a91.50.1794465756303;
        Wed, 11 Nov 2026 22:42:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 07/24] rdma-core: upgrade 65.0 -> 66.0
Date: Wed, 11 Nov 2026 22:42:07 -0800
Message-ID: <20261112064225.2410019-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132176
Content-Type: text/plain; charset="utf-8"

COPYING.GPL2 was updated to the current GPL-2.0 text (FSF address
replaced by a URL); the license is unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rdma-core/{rdma-core_65.0.bb => rdma-core_66.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_65.0.bb => rdma-core_66.0.bb} (92%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_66.0.bb
similarity index 92%
rename from meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_66.0.bb
index c43d4790a7..2725d77cb2 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_66.0.bb
@@ -10,12 +10,12 @@ SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=http
            file://0002-mana-Link-with-libatomic-when-64-bit-atomics-need-it.patch \
            file://0003-librdmacm-Allow-librspreload-version-script-entries-.patch \
 "
-SRCREV = "58e40801bfed5a8befc0881594820fa0a0baa4a1"
+SRCREV = "0fa90c60fbc274edb3495f30c1afd02b3f5fd38e"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
 LICENSE = "BSD-2-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.BSD_FB;md5=0ec18bae1a9df92c8d6ae01f94a289ae \
-		   file://COPYING.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+		   file://COPYING.GPL2;md5=570a9b3749dd0463a1778803b12a6dce"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_INSTALL_SYSTEMD_SERVICEDIR=${systemd_system_unitdir} \
