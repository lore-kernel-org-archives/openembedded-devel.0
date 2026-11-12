Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8124.1794465750175813018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ky+ivs+C;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so2706012a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465749; x=1795070549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=goPk5NvJbGzx4gikdyww3YtUZLGYEN6iYzQR73P2Phk=;
        b=ky+ivs+CottIdWdjOQc4e5HIyVNSZWmWiypcJOu7orVfrNXYPg97PSu7ES0UjUgT35
         kq1emOmmZ7lTFUH0dDwQwhUWcCIWow7GEDmfOWaoajrZsPF3TWGrUKF5RorczwBHlny5
         z/LhNWhM4hQ//Yc64bHrMrlD8QXl/eROTENQatn4YAjY/rHwOPRggY1LF/OIbVFr5LAz
         /hUbmDGR76kRNlJr56GeSJzTk+riK4bW9bKWxazZiVrbAQeFMqnpWn+HWWNGsH7UjQ7f
         otxZEEuGFyqL/8qTghKFAyocmHCsOj52K98ticQ3rJPYmzbWBkjuDb/FYdwJGBLBp+0A
         dyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465749; x=1795070549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goPk5NvJbGzx4gikdyww3YtUZLGYEN6iYzQR73P2Phk=;
        b=1wpf9u11a5d0W8JwbIdyNWjIiPFZ3M6FP+kEbgANtnUZYK+z3nffhS5oTP+GIAq2xH
         xxo13yB95OGafRZudODrw8b2+w02iM47BC82QmCVxsrmImgONWZNsC+KEi22smj7lZqV
         dgbZEC/rHyEa+/vvvdftXKFWyL5WOnCUqOda2xJoMkP4vx9zM49DPDF3PtEUjRJh2AkS
         T/sKsjkBIq8GZB0YqVZLgPtKRDmeHkvcWvwH6B9teZWSQxR1PhICk9nz2UXbuPUHXGjL
         aHhD5XfT5sV+XBNIIyjlAeJ+UFML4oav9hAThvGUJqIRNDBIFVG9qXYsnyYqOa63Tpby
         QIGA==
X-Gm-Message-State: APuU4Z8BfCssbxkSfnPLNJ8jjAAr2H8e9Mo3g43j6LXLGOzz7VUXWaRc
	pv5q6tUwZAkgtjZaEYL/l2KLS1LCCd0tNQDHP80fJnfpHVWaCUJJpAOmf9agNw==
X-Gm-Gg: AYBFou2IecwGBiJK8HPc7M23riEJaYioEgcUrGYfbtKEF+59mjM5N4Y6luMdoPYpmig
	M0WlflbN5ElGYnh03NLvRhXcmvNyt6cjU63jbKuv3z0wjBFvk91f55E+RH7cT0NrZ7O9PMCN+DG
	p9LDlRZSEIwoVFvWGmRVeJ+I4TZjFzj3Rt2Z0V7+/DP+MXjqdQUUJSBvuFGrqZi023Cg2tmQhIR
	ekwtEbVLzajZVwNREfZAfT3209IZyNmITYeujTFE7RDWiIc82731iMWoCEsSmDsfI+CS6ovNHSW
	WQq/A3kfXvhwIWjl8ky84G+jHH2Jn8hjB6vmtAOyewBJXyEPVa/YgjrsloAQUoRBifL/ya1PLX7
	A9iL9XXfNATlDByk5fe797A2uTgpCrj2W5+tLwPF+8VmG1jUcTMRKebx8BwArXYvnKf85O/b3sZ
	Vz5hvismWcYoO+j5K5zI77j8+Qsk/8GKXXvuKdRwbJMaqJNP6UyTff2GlQWqpb+tb8SYXbfGaqY
	CzL8SU4uJ2+BdbXbsI2gbzbv8lHLJI28+jQpnLDY3WWzibfFwhV2WEGcgkb8zWzo2hACHKQJRfH
	lObgvf+F1R7L+dIDQ44SRxWr0u5dTtkBo83ktyOW19vm2QykS4Iy94ZAARFJ0lBKYWUXy1FpmDT
	KTOV8DCvaPvxH1ifBW/WT6Annc3MkToHeA2aiS6s9qT+yLThrUnb7IvI9xABJvFFx5smFVfXcZ2
	U7cgK7TcQ4ymKY5DQrbm+t0Pv2X4XjjDEKY24q6RD8N40iRkR6SH40sH3urMwAHGP/o+k3CG/3P
	TI4ExO96j/4UiPVuYhLzaUXdgfwGl2Mb3aaf0oHjMKvgOJchPX8SoH6ZHndbYD8yBiQYCFpGJZq
	X5ZZNJQnOXdQEzn+ucrxs9epdA==
X-Received: by 2002:a17:90b:4c52:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b182df32e8mr4797592a91.1.1794465749390;
        Wed, 11 Nov 2026 22:42:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 01/24] frr: upgrade 10.6.2 -> 10.7.1
Date: Wed, 11 Nov 2026 22:42:01 -0800
Message-ID: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132170
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-protocols/frr/{frr_10.6.2.bb => frr_10.7.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.6.2.bb => frr_10.7.1.bb} (99%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.2.bb b/meta-networking/recipes-protocols/frr/frr_10.7.1.bb
similarity index 99%
rename from meta-networking/recipes-protocols/frr/frr_10.6.2.bb
rename to meta-networking/recipes-protocols/frr/frr_10.7.1.bb
index f4a98e2471..6e238fc7bf 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.6.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.7.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/${@oe
            file://frr.pam \
            file://0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch \
            "
-SRCREV = "c8efb33af96f9f1220d0fdda6ac049f9126edd6f"
+SRCREV = "f8c0b08dcb0c78f9e42b9b86ae70b049e4e617c1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
