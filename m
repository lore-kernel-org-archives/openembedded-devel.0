Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11808.1795762979744406777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Nz0yRVnK;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so4325879a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762979; x=1796367779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvycG1vffeb+aKCvwxDDFHI3i/SY04TxpetRHLhLZGc=;
        b=Nz0yRVnKLReUBS5dW9DAPCtwGKXvABoo9Dd4b8IRCVnoWcOw0wJAujY4p1B3co81c+
         gPy6yyY6zmZaXgruGhiG6N1ZrMMW7vEp3GISRArYTvP9YKLDzqydHsQsHf+IHdvO9EdZ
         XT4HidwckTYKEKuCiYlXd61n65jlxe2z5xocLJgPf+Uw5iFCccmTIJPJzbQzbMYNofu1
         SL9RW4IAwaFlRimDVnu0Ue5pkUV6fcEhM5DHkiLDYT75bazo3SBZW7tgdk8rqCB3kVt6
         6BGPI6677M8r1PrLKM0kve60mlRpUYNw070qdH8uU4Vg3bNsXBxdYsVK2v8Sp1pVwJBQ
         b+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762979; x=1796367779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RvycG1vffeb+aKCvwxDDFHI3i/SY04TxpetRHLhLZGc=;
        b=DSHotOyVwQFu7q8rntJ1I0NTTTT9xfE1IKT2nuQjMa2TuTAvVA54EOq00nnyLZmM+E
         Al0UctNzTKkWTRZnj7aOHqUb2EqoaG0XG5P3H7VXKaGSxHpQhyzvd9ftWIqcma+NeuwI
         ClOR6Yc6CBeODrrRA1v0QPnxk3feq+uQNVkNbIKE3hdCxt2wDhO3BavNLnYHEVY2NCab
         g7rCiEMR6xZfMbTK1DycoDUf/9f+2+U6SpUPwtLEC1zMkf8gu8adFYkijn0tFtEO8iTo
         DyZmmzRUor8lWQXPCC5o3pjjwLdvmA2aoAd2FJS51ftu+iw1hb5QpqL8ehGfnwFK+ioH
         mFsQ==
X-Gm-Message-State: APuU4Z+/MwvDCTE6o//xgJAb/9x3lyOgrF/mwCO7qYjPZtqSPZnKNwuv
	MAAYOkaYZp8pZicqIVwcLTe2RJ+oMvDOf2ERRI9YS9JkUQpR8SJ90XikBn90AegG
X-Gm-Gg: AZFdTZcTZdfAkolCt1gnsOCRu7nD0YPxS3QZ9gcg8puiijb6hEdFbGeaghfRSxNS25m
	lSnmyQerE1hRlOfxEcIv3O7odFWaXdxf4T2E29FuAH5SxPg23fm9K6xdhEu4WZ8cwMpmCJZEsYT
	Hx2b+C+cpF/dQvYl6At3dz5KPD1G52oiiujQ6ZoH/Qi9OK8gIKf0b/y+S68BwIcbri/rggG8i7i
	hIzxEDN4kDHn8zD0psgxZdMQboXrZndaaMwu1kf6RJrZryBllDpXxNbrDRweMguXG40w5JExsKk
	JuJosDszuFzlDp1kgegP5wEzyH7cm6zWhuOENhmfDmem1zIdfkKdDM0hSbExhpRloIcPNeEvd8/
	jmjrFTsqmshJCdAxFDqQUu6EiSvV1YWxitMs1H/uTPI8JshEZKmKl02BxzCCplV0sl2wvwWOECD
	6vnjPkmX2UWDvM3wixfyUUwTlWvFd7LT9UeWHjQuFcWVUJXM9xUaxZPsuKuAs4xfZc43z5kOvZQ
	f3WvERqgymy1yEnNqd3k2Zob5W0rfzWMnJrj3b2GQVmNVw1sLVhgqt5hSAX2ZXXnxrhZIjQR5oa
	SkijkMduKM8XyYNlSf6hRBJPotdsGVXPf8aJvEJE4Juoqnj09Dsufpzjq7wy7V/BETZMLnOybPj
	1411dYCHO1T4OdSYSwUOVKsLbjBF3t2KUgtZxq5iEyXZEHJAKPBuc/WQmyvdRaNypIcQEa2Nthg
	rP3mqMJJXozrH1VQ1CROTcAeIOqqtR9G/rPipWHv9E8MB0Oned3NQAbjzbkq8TIGI7RhLuNuxQn
	RWbkCYRA9UlRG4m2phnqKYONetQzi7se/MfEIt1Ub/tXKExnGsbS4ikfakmMExKKxvt1hI6Eb3E
	Ebv4
X-Received: by 2002:a17:90a:e710:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3b41c96151cmr15242304a91.38.1795762978986;
        Thu, 26 Nov 2026 23:02:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm36464914a91.15.2026.11.26.23.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 3/5] httpfs2: Fix upstream version check
Date: Thu, 26 Nov 2026 23:02:50 -0800
Message-ID: <20261127070252.2364951-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
References: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133352
Content-Type: text/plain; charset="utf-8"

The SourceForge mirror URL gave no usable listing, so the check found
nothing. Check the httpfs2 folder of the project's SourceForge file
listing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
index 2370633551..d940e81b3c 100644
--- a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
+++ b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
@@ -11,6 +11,9 @@ RDEPENDS:${PN} += "fuse"
 SRC_URI += "${SOURCEFORGE_MIRROR}/project/httpfs/httpfs2/httpfs2-${PV}.tar.gz"
 SRC_URI[sha256sum] = "01cb4bb38deb344f540da6f1464dc7edbdeb51213ad810b8c9c282c1e17e0fc1"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/httpfs/files/httpfs2/"
+UPSTREAM_CHECK_REGEX = "httpfs2-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 S = "${UNPACKDIR}/httpfs2-${PV}"
 
 do_compile() {
