Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3CF7553A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 17:55:21 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id o18-v6so3138891pll.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5HKm118PJRnWkFGsXf5ooXKOYON/+bap7fnQnWnVOas=;
	b=ZfhHxaOcv3HW15Ujvuq8ZGb73Dwn4ldJFuLfwxA/P9+7rjGMWo18Zyed/+YKZ0HahL
	+OY4/j2ZsSSlayUZSRIndymSJDkkYqmHH2YYDb0DSF9azZdtxEsxRod0YXZlqey9Fz7T
	CCLoSJRyJo6kGpXDyO2NUCxE4Knb6WGKiLOVR7GIkihwBO/RNSPDQaPxR11BL7+DwGFz
	IOQfhdIspKSGK+vApkG1JN6dmzFACsD2xagnmllxFu86l/y+O25Z9rJDQ95AOYmlafLe
	rneb1RROe33o+B/D+DZyGDvwnMz7lWXsHxgHtznrBrQHdHGiCQghDBVBWQIA7wfJyPes
	T2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5HKm118PJRnWkFGsXf5ooXKOYON/+bap7fnQnWnVOas=;
	b=Aj+2Jumsa5JQAvgvLNpBene3+iToFKElCeeofHBn+ZP5TLheQFr9/8y9JXgNvTrIr8
	d7RnadvNgB7pDNK18dUNJaCKhZCLkpgratT/8gk9xe92aOoxepd7GRQq+vsGov3GSfuD
	Wtqu3gO883/7YsqcNnd7fQ2S2PZ2L4SJJ8mJM3/n6I6AK3S6jgZ+L3uQKgnAMJkg+ToB
	z4WzDyTQJNhcEeabT/5At/qHpMN55JmZzoPRl825Zea1qX5aF5AW8Fy3mybMtcKNlbsi
	t2QVsg8m+8n8KoFDepheBmv/B93L/HZHEnMS+6nHxd/ho7SoVsmHlegwm2HnAJf5KWn9
	KoWg==
X-Gm-Message-State: APt69E3Gamqjas29+DPcPKNvE4G//YGRBgIV2gm2kMP0Eir7h+jsvXlP
	gkNDwKLZGzMKdXD2+7raGn5Whg==
X-Google-Smtp-Source: ADUXVKKzzUEueNNXJkkPCQnOM061oIUCFpsDb1Es2he9xuGkGRV0x4g1KdT0Etf7F3lttG6WNoHaPA==
X-Received: by 2002:a17:902:744c:: with SMTP id
	e12-v6mr2237459plt.28.1529690122920; 
	Fri, 22 Jun 2018 10:55:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	n83-v6sm23758992pfi.147.2018.06.22.10.55.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 10:55:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2018 10:55:21 -0700
Message-Id: <20180622175521.21628-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180622175521.21628-1-raj.khem@gmail.com>
References: <20180622175521.21628-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] kpatch: Upgrade to 0.6.1 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 17:55:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kpatch/kpatch_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
index e495e2882c..024cca6553 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
+++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
@@ -2,9 +2,9 @@ require kpatch.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "db6efbb8c7e90d2b761272cf563047119072768f"
+SRCREV = "7f550f01bd308cf058ae782327d29c8916cc5602"
 
-PV = "0.5.0+git${SRCPV}"
+PV = "0.6.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


