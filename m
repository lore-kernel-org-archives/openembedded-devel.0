Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8095.1795739741368535325
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zULB7W0d;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so9741309eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739741; x=1796344541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmTJnRu98WnjBiXQlKWIPx/6Jvtn0OjcYzXWRJYQbUY=;
        b=zULB7W0d2vyIVdVn0QCAzn+UjU6ws2dY6y6nxCqELtEWIN+DpV+8I1kSeP7cDiqmik
         Lk46D5ypsezFmeyEwLTmHYWBAwyLnTIpzT8NZIARuyraNFCnFJ3eThaC8l8SBaz2eBMq
         A6PwRJ2mEFkoXL27F/vFiDEmGJNIOXWBHjUKknFTDEvcoAioZVqLs08dGkgPFzYeoYfY
         Iaf4gYcvUT59AGA3F2uXnvC6chSr/+EOa7POc9wg0MLrp6Xfc9cz2d17/+7yKOLlDy4n
         PCObS0vq9EEcyy9vQdICkJdfnkn48YyGiyHoXH+mdeOMfGX+QnOngml2MKtKfsHtnM5E
         2vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739741; x=1796344541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QmTJnRu98WnjBiXQlKWIPx/6Jvtn0OjcYzXWRJYQbUY=;
        b=VqAjIifHzSjDg35JNduK82J9wu9iJlz2r5PGHlUeT13dQ6Ka9TWC3gTiehkOqA0dNy
         6sK04FmRKVAp956wmMDKYLA78esJLxxAp4n+iPT5rJlNy4y8gaQg4F/vKVuNJr9695dB
         BtQjDMBbFGWdyTlim2LM4/xwz+fET7X4b3jGn+9P6ierESYJdqvEmSUYf1R7D6t6pZ7S
         WDte8Kej0+fJtg1+P/yhl+l8wLbH1qxFWdnXLAWoTZiwhexptCqHvrhsRZhViXCBmAfk
         F8DQeVSHipdSek6WkwguvhKP517y0aZQMITXdhxC8VwxBduOikygQlRC8RQRnNdfO/xn
         sZyw==
X-Gm-Message-State: APuU4Z93RuygsPx+H98CzaqLcSi4YNt9mGHwGYdnd60oAPAXjg4VBnAG
	Qm4O99OcB7PJVs72p2ubyIvnRZiNM3oPdvxDodI8yNIg/rCbg7QIL2FYst6cttB7
X-Gm-Gg: AZFdTZeIGEC7cUl5BJh7QSTdIRCBPF+HDNoKeEV1I6o5U3bMARfAUHmA6OHEtzQXyOy
	mXxL1Llr8RuQ3b0zRHELBqRLRFPg2kpfJ0LmE1wxMURIFNNeKMFp1yoXuTDRlaVJtt2QXkaHTha
	UueS/s7ux5hX7V5aO2E1vnN4Sr5Er2g5adDAR/nBk+ZSWW7v2hnm4yCl+iRfyC363Zh4kJ27dnj
	CFV0V1Z3lDI+bxx+U2pLxR+jkOk9j1x0M0rY83k+GNN1piJaljEjZtH0y7JptxEDJ6a/qY50yxw
	QvPv9/qyj/PzD3bKPp868Rpdf+PIdtuqnY7MJU1Nw9fyQ92CJSr/MwhD3f8dXl0GGInTf9nSJ1z
	nd1n1UguZ/tWBUBfKcOJF3FT0wtVuYosYPXnzg39m0DbEPUfbE+L/AYQawAKL84PGWTp07G696g
	WeLHjZfdXVJvHNNJFmvo7iMocEH97dwId/p0T5aw4fMyxoZNY0wocdzeASawU5sxwl9efMMupqv
	+wRqgNwtFCkQfoGloYpiL1k5gTE0JXROL812zyMdjP4d2tpVCElpg5WqvHmAtB5MMqc9wZISaBE
	u6BqWqqyDHGGjJEKXzjiyoQh9Kqv7lFEZOGlFPcqMNC/hReH6SnW/YWkzHDBKNPxSbq1713VitN
	aMjzwL4iE7jGJAWxW9gbQu2aB9zYXxnhWfOn84rqsqzpWiEJogcHMfdyzfQnz92sTFraLKKz9JA
	E5KAo5XViU50YVq9YU/97Hr43JwUXWZehGUo2KVkQ5R+MW2LO+u6gn1QSevmwbKaJYJ9I3yeHh1
	nqyihyhSUE1b3hBRHrQRHCy1AP387oYf2AqLYr8IPM0inI7OwLYJPsxFU7FgDPYD/xZhEIiRkdz
	o5WG
X-Received: by 2002:a05:693c:8803:20b0:386:9b9c:ef1b with SMTP id 5a478bee46e88-3869b9cf99amr17296192eec.3.1795739740662;
        Thu, 26 Nov 2026 16:35:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 67/69] blktests: Check master for new commits
Date: Thu, 26 Nov 2026 16:34:23 -0800
Message-ID: <20261127003425.2166632-68-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133167
Content-Type: text/plain; charset="utf-8"

Upstream has no release tags, and nobranch=1 left the check no branch
to compare against, so the recipe set UPSTREAM_VERSION_UNKNOWN. SRCREV
is on master, so fetch branch=master and set UPSTREAM_CHECK_COMMITS.

This replaces the upstream check settings from commit 787d1b73e2
("meta-oe: repair broken recipe upstream version-checks").

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/blktests/blktests.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-kernel/blktests/blktests.bb b/meta-oe/recipes-kernel/blktests/blktests.bb
index 4417a5dbb0..5922036952 100644
--- a/meta-oe/recipes-kernel/blktests/blktests.bb
+++ b/meta-oe/recipes-kernel/blktests/blktests.bb
@@ -7,13 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-3.0;md5=d32239bcb673463ab874e80d47fae504
 
 SRCREV = "9aa2023312bfcdd6b31c24b6e4a4a5c2d4f870d2"
 SRC_URI = " \
-	git://github.com/osandov/blktests.git;nobranch=1;protocol=https \
+	git://github.com/osandov/blktests.git;branch=master;protocol=https \
 	"
 
-# Upstream repo carries no tags at all (releases are plain master commits) and
-# UPSTREAM_CHECK_COMMITS cannot work here because SRC_URI uses nobranch=1, so
-# there is no ref for latest_revision to resolve.
-UPSTREAM_VERSION_UNKNOWN = "1"
+# Upstream has no release tags, so check master for new commits
+UPSTREAM_CHECK_COMMITS = "1"
 
 
 inherit autotools-brokensep
