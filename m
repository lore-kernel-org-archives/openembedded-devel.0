Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11766.1795762883170423255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZUt2J2Jm;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b5786e099cso6541099c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762882; x=1796367682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTYsWmCBl60PyHcwSXIqnO7t66w1pZvemO3tQdDvzvE=;
        b=ZUt2J2Jms7gfAoiIHfANgqv9Owysd9UpurTyl0C1wCnqrY+RszDCcxqkRt46xZYDCB
         zWd44dTXLOPtNpXNrWZ7SPdlO9bSyovqZC3DwSOE8p3zNEd0iMhnJJkwDT8c1gaiyyls
         A1d1BJ3OAQnVl1oyUE21+NLC7rHTVnDb+0c1cVokhLlF3usKFwTtdT5Okv+OZ06SBzW2
         Y9DCDhQ9Wv1sflyc2gSp/XEPFVue8i1pXoJ157YHliiMgVNbuW3kbIVwvyShKfuVMS80
         00GcY0uvBQPx1KB+sfVPNmt3+3xxGnjI3SBRz/XsoyxdR7YWV7+SNzECmnuNkBSe8dn2
         YtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762882; x=1796367682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTYsWmCBl60PyHcwSXIqnO7t66w1pZvemO3tQdDvzvE=;
        b=ol4t2O9XGfvyJk6LcIWUZU8M5SDJmTtJzV7O4Ui+B/OMHSCCylunmmqx2aVpHd5ND5
         ptaW5S0t+j22hXebKvl1+pyac1bvgHuHupHXCMnf9a3VFo3BcBRju5BMMV/dK0JRhpuE
         GRS52DEi0UROqbbOVp0Ja3D18XmHWb/g/0KiWHgOXRFy5qzpMDzuQVw4jQpy+uSKB4s4
         WzFcFT9uV8UipC+0AEiep9j2gSfcqLew6cTjjmC2wiM6JZspqw/SUhmf4YIUNqWgbk5l
         d6oNVHQk6plQ0Mebqg/WHyR0T+AZFNU37bnQUQ9K24P6/+YxfLSZeOTyCXbcdn31f1OV
         I8Tw==
X-Gm-Message-State: APuU4Z/5Y76ZZF0jsukH724NiAlh93fz6xooCULxYMtxJm3ggloq5GUK
	6vV1H0J8v+366EHWuXlMleGFpUKHngeb++i0+2TNtzAdj/3Xhu+Mun/taGn7v+Hx
X-Gm-Gg: AZFdTZfiuqaJKX9EVPCiKbRjKU6AjiYe45K0kKWO5WN3pdqEMVrpP10vumWfz/1U4Az
	qPI5mFyPyBQ9gVQ00SrmZC/KThxiOjjyr0vNis1dvISys3RdZKHs8ad/GSWSkyLHLzZp+WavceO
	ZTvHWGp90O4vDtQ6SXuF9EqTo5RHMa8VJwE/UXgLPYAYpreZHqbRMj/CFiDY68KUjGAGcQV1XaH
	zNrcg9PmAKiEpYvL8nW1Khyj1INhIqzhgHUpm8Dy2LgYlIZx+g33lwpphBSsAMYrbXTJoPdaGdZ
	UvJSEywgEtpxVOjebx40MiJNYMK1sYznNnMza7gP4C5+lVcPbSWPLYY7D5YNoq+deYdQcnuXdnH
	Hh7UwUwzwGv5lG/HCVW6g/IDUXRY5XHFedeYANhLZ16iKyR4P0xZWJ9fqza7jsE8G/NGzz9+V+S
	y314J49vmHcqGgINeu13OWM/45wPeiE1lq4gkfPCgGJmTiPn8uAb+bVHch07yOrY+f7bvJ6Iie7
	FqxXKhPQHJcdCTOWLocQ2mTbZi9xAgUzXDN9mc6FvV9B3270OpgN1YS0Hi5JqClG6U6Ik0z9HR1
	9uzHNIi13yORATv9BEe3phu4S/WtZvFDmim2HNEcBcFO9Y6UX0/LIEN7gZa60PpOSRW47f3fpv0
	yCUhQEKzLE7FrIYriazYaxAeM4rNONqI7gWui1MFpHplw4uTS6r9Dd2MC2jJ8gXgk9B3VY7NF7L
	YGDiekZkbaSI9CCpbsKG3GOs8gjJivPGsWot59E8wqIjUuHTD1MBGtkhzMTRcUTnXwQGrz/3CcQ
	uc/ItxKc6r/vm8Nmbq6iYLabxHM5Dpky1zgD4WVbLwMg2TsTjgwUX3QRcc941G5+zz7H8GdiE9U
	rUQzaA==
X-Received: by 2002:a05:7022:f8c:b0:1b3:a89c:c456 with SMTP id a92af1059eb24-1b55689eab5mr29330492c88.6.1795762882219;
        Thu, 26 Nov 2026 23:01:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 06/14] streamripper: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:04 -0800
Message-ID: <20261127070112.2273685-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133311
Content-Type: text/plain; charset="utf-8"

The SourceForge mirror URL gave no usable listing, so the check found
nothing. Releases are in per-version directories under "streamripper
(current)" on SourceForge; check those directory names, skipping betas.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/streamripper/streamripper_1.64.6.bb     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
index 480c132473..5e67831b44 100644
--- a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -18,6 +18,9 @@ SRC_URI = "\
 SRC_URI[mdsum] = "a37a1a8b8f9228522196a122a1c2dd32"
 SRC_URI[sha256sum] = "c1d75f2e9c7b38fd4695be66eff4533395248132f3cc61f375196403c4d8de42"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/streamripper/files/streamripper%20%28current%29/"
+UPSTREAM_CHECK_REGEX = "%28current%29/(?P<pver>\d+(\.\d+)+)/"
+
 inherit autotools pkgconfig
 
 CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
