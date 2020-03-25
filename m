Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.21253.1585165339554890727
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 12:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=w34PqnUu;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 1F9A960481;
	Wed, 25 Mar 2020 20:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585165338;
	bh=2ueL6Zr5bqLmAN1GUlRtmH8KawovYpVTg2JPnUKiV2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=w34PqnUuC7pE7JpGH6PJ3qvpeY6d1rmPwVoJWoScH7w+YOBxLiMj2vLK1x+5wHomo
	 S6cM7IothdreU1nOvdQIGSQGAd6Nbp/R7OvvsFXlwQ9R9HtKOcjyZCOexHCnyta2+9
	 a94chiP1kqji9KwHF20O7QN/ZZMkWbQ4Q3cWrHP0OtVGUo+0TpiWdQZoWXeG7auuY7
	 vY9e/fMBGjCgLW0ubfIVSffoAtXvHimaN965wdxrbXrRc7Y9khQa7OgkfoRWH9btGD
	 SKdGXA5plfekBhSMcNxWRytkG4tzIGpEe5WXjsPSlYKSqLQ5m8xhXMBsXxquoEftHa
	 OTdRxyc3t0BhQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 3/3] ufs-utils: use UPSTREAM_CHECK_COMMITS
Date: Wed, 25 Mar 2020 20:42:12 +0100
Message-Id: <1585165332-10783-3-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585165332-10783-1-git-send-email-pjtexier@koncepto.io>
References: <1585165332-10783-1-git-send-email-pjtexier@koncepto.io>

Fixes:

INFO: ufs-utils                 1.6             UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb
index 5fdd089..2358365 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=git
            file://0001-Replace-u_intXX_t-with-kernel-typedefs.patch \
 "
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
-- 
2.7.4

