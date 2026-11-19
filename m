Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1934.1795113456934852880
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UoTCeb08;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so95079b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113456; x=1795718256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2h/7Xw7QWiKqNawLALhqEGQOuq9Yggf5eN9lcwkDIwU=;
        b=UoTCeb08Xn/ePeE+ZbyOy8UhzpqPPy9LxhNmaXyFkB+JimElE9+Gv4pecvMGfBO+Wl
         TjDf10i6ThSwBniQp3zXWMCVpwV9CLicysuGhTAARLtZMi+msiNpijo1YKqE3ItetFq0
         1rJSOTlTEVZMNqw7tg6nXoDgQVh82cMu9KC4I4fwN7+T3COYp4etgN5apeIa4h01s0i4
         hg2zc2X+lqQH06yzoJtDPmsw47oAZspBW6AFJhyGUTXl+8/qjYOqTSacDXC1AGxsO7cN
         4PkxloveIiFLqFDd04VhBgvpJvxZSQBJC7+bpHvgIEKgPEvmKJIyFAxtxgUADNlI4qm0
         QurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113456; x=1795718256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2h/7Xw7QWiKqNawLALhqEGQOuq9Yggf5eN9lcwkDIwU=;
        b=kkGS7bYB6L5e7QW3OoPfM9OsywD0LP8e+hUKpEVgmWawuuJdSThUbD2NqQWLByZ4jp
         jhdRD7qt48Rv4SqTG6ZUdr9EnKAepyje99DJ1WgagTIs2B1VjF0Sh9RJMHnd1asSKC7K
         /U5x6DkNCeIDJKkMgK7GBqHYllv9ZAb4GooRNd8Dfd9paBPZTKERqlF79X3/QX68s745
         vdaE4iyoH2YU0TpnuAVQo0ojP4lPNxPNzCPWFLPjT+8Rlwo/s/ReYF7jZjrvw5UU2+p0
         5VQ6Iz1Ifniv1EIbrA3cRY1ZdjQP37B5EdMsFsXHCozK/MsKP97cPhjaZ3jAUVYYywZk
         n70Q==
X-Gm-Message-State: APuU4Z+fuTb2EbGv9zMt5jhqqmKRvCoV/dZz6j7lWqPvKnnV/rG6Xrv8
	YBjelmUaVW/gVplDa0uyY6NwSVkpUCxubx9+NSKGpmYQiCJXAWwKRSbMnc+DxA==
X-Gm-Gg: AYBFou14oe7cKazr+LXlXoSeUYyW5ourXEipfCXR76hrY92ERY1lsuLSGx7X8SC2Vjt
	veCUyJHiBZI9iZj5I0Md43NeEUC9CQPRc62cMvXOxQ/jJceKaJ+h5Z+WG4z43G/NhBhSZWqOeU6
	YAU3zyqi1xtriPI1WM4ClgnbRq7SLzftV3i60+xlwSHJNIfU58oRlXhjjEGohS2Iunl+lzry98z
	GhuRb2Kfnq8M8UrciRembOQEAQNzflliNREE/dcPrfrj2A5YjsBvPqzeYUalFu6vnEpat2DWZ6R
	mFE09b08TPDGM7cb2d+RA+27TYjOFyRvacX2AsCtZfyFe3w1iFLO01RwKozrGXYqAcqAFdQq+DJ
	fYzbjFvLmkjvIxilClnKUHUS1dG1PXfU7pR2BXUNC6ejm6Z87cN1cDVPIhRNT6lEArZbVT4Xes6
	543DIU42KRkXu0NWSY1geG8vAp0FV30w/o7pai/os8V9/GYEU0Nbt2zTl10/i/6XxFjQeyZ3dwK
	hwQS/5bRIZeKz3+AcgA5OsQiHThrWoAfBlBePzTb1bPHmgKYJT3KcDmzbEuZY6d133emm1lWhxg
	7Nhj92XMu0nMYzb0DQNBnsjGe4naUY5bD0sMA46sVYi/ho4ajMHCXmPX59nsXQ==
X-Received: by 2002:a05:6a00:2d01:b0:89c:d875:603c with SMTP id d2e1a72fcca58-8c87d615131mr502855b3a.53.1795113456336;
        Thu, 19 Nov 2026 10:37:36 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:35 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 40/64] brotli: set CVE_PRODUCT to "google:brotli"
Date: Fri, 20 Nov 2026 07:33:08 +1300
Message-ID: <91b7adcba3d51e4a785e39f3d7dd092977844f82.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132730
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

cve-check class is setting default CVE_PRODUCT to 'brotli' which ignores
the CVEs from NVD Database.

Reference:
CVE-2026-111497
https://nvd.nist.gov/vuln/detail/cve-2026-111497

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/brotli/brotli_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
index dca16cb79b..14d7fe96e5 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
@@ -20,3 +20,5 @@ do_install:append () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "google:brotli"
