Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10345.1795753040090071881
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kDc61Sjm;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so12591295c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753039; x=1796357839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKll5mVS2UrOYIITfgbtOz2X5qzEFOqnOR16DZkTXG4=;
        b=kDc61Sjm6EoSvxTehwqkHl/5q3P/3OG/2skRZZqj5AIZmy5vFh/zUm6XzWJLJKQ5bc
         ijqblYwnRRe4V9TSMMSFtBDaBi9IDyJR/NQHG3OWMFQLeQwsz7v3TrVgcNiZJmyqY0ez
         4baYJc3E5pZ41/8cX83X3LJ+avVaGaID6B9UNIc8JA16S1jl+NxRgR63IrCN/ZUsB47z
         txKCzYHQQFwI5yPAcdfKvAkFLukyOfeMoEMvY09XRoNWUxhZVy/s3kNjDsZdB6WBerKn
         UIW/rT5WpUtl3Evf/aE5gGVk67cbn7gTTztwSdkMZQUPVUNnpiEbQVFHuTaz59Y3Sxy+
         KLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753039; x=1796357839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hKll5mVS2UrOYIITfgbtOz2X5qzEFOqnOR16DZkTXG4=;
        b=sEV5N4ZFb9qZ+8t6EPl1ESC0X/CUHDiLSjgdxhViSsudKX1uP6ZSNsf7xMAv6HuCN+
         d3llZ7UeXfg9NdcTfhjGiYy2sPbr252FK1qL+50b+LPKys0QeEdnbAAGOixAiDuNosI0
         GK0K8Ap1Jx9PJgXTkihxn2fBQL66NoUSFjjNq7ddmkXRrhPa6C6vBZuFcol8OehiapRI
         n+MrcVnlSQPcIR/ciPETRiscUATxhUGuoS3dHFxsRaJc1u3nrb8KvQRJe92g4lDcs1ei
         GC+UW++z0QVeFmld6Y3Ii63sn/xbK7bEESPItF+/QfcLQ4WPUKw5kOY3KZFsefftkCEN
         kIvw==
X-Gm-Message-State: APuU4Z/ePzC8OYDyULX7+jmO1jYkCxwfRVwPs12ZB96N1Sff/k55wwjp
	guwyTxbRJ1KzfV3ogG0IusLSt7tTILiclax+GI1Tqmzr8xOdBDwOD13SnUjPQQZ5
X-Gm-Gg: AZFdTZe9+8Q+g1hMw4S084J4tNNG22Vy6hJRj7PrDd/x8YTnplglGNse5H635+LoBve
	GvOzfzCbMTGqXfLn3JlPPi3wgtvdLNTsF+05OfR956k7euoPtB4bX6srHC52IuSEIdZV3fOi6Kj
	RSl1Du8TKwFRlz4fwVaixQ3aZ4QRnFqEOQ8lroisY91r+M9WE0UpchvyWJGX4geGsqtErFxYLbi
	1PGMWVWSWFmB3k9ZbjLmT+D2rSW57X7EKl1unoXApjjsTtOJBa5MJHpb8Nv2ut3bObbd49qx2ku
	oEmz1N5DjYZJaSfdOreiEvWe1bI5lsEErHWImpHGTILvNQtLYCn9mNd0MZBYPKFNd83G4Tu/FZG
	kjsKi5n673woa60/S5wly2O1ROA+eDGNJoIdPn+0Ng8TFGSw5NHMD8jd2FJjeHln9h99m0Hh901
	ivxQJoYkdGxEguPO5h9/yDN/gPqNDUu1897ooMUpwlQN36EM5ZLdYlGEQUnVAh7FqXrC27SKyCy
	IA6bfTcWmYQAEnenQzymAmCy2nnQZFBj6HeBPotWgiWzEF5zfQjV3+m1bak9SC17WbEFdS8vUa7
	KBT26h6MlVi05BMa7WPmoBMY9cCKNJntrcITxAF3IzaKjBPLtOUYV6M7dM6cjPf4RxuDOttf5+Z
	4ezRBlmPhmwAjueOReYBIJOnfNvDB/ZtdNb4QMO8zGWQNV64O8tyckfXkBAJy4/NmEKpkdyFpRC
	RSKEOqiNgvbOeMB8FLGOczEN70kHI+zlBwWGjS4Ccdt0CNvc3Y5HNfeHE1SQ8QWZPYYCJJyC78n
	PUeucVtbGApioVka4iNVlEj6nIeV0V33f0eQkRO6yRHfahWEmvAXxWujbj8QM1QzIygGE5YCabb
	k4Mb
X-Received: by 2002:a05:701b:4516:10b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b5568e1e20mr22411289c88.31.1795753039437;
        Thu, 26 Nov 2026 20:17:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 01/35] bluez-tools: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:41 -0800
Message-ID: <20261127041715.1776485-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133253
Content-Type: text/plain; charset="utf-8"

Upstream has no release tags, so the tag-based check found nothing.
The recipe tracks master, so check for new commits instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/bluez-tools/bluez-tools_git.bb          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
index ab9cebaf38..c02d4df7d6 100644
--- a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
+++ b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "\
 "
 SRCREV = "f65321736475429316f07ee94ec0deac8e46ec4a"
 
+UPSTREAM_CHECK_COMMITS = "1"
 
 inherit autotools pkgconfig
 
