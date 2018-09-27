Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 32C9D79616
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 14:02:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b19-v6so6055578wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oI464zQJkvYiHrRR5uKe81pxTrzbOVqcRjCd0TwaAm8=;
	b=lb2toU0aI46bYMV+rBzofwppEQ/C/hcYbIaEUUE6iwgPBiK2nULIA3r6ulXTLaHJpx
	/8PaZFgiqMsxRAEw0lRnFam+T4xs4LFpxaJ4NwXfUd+0e0ISXVgHHb1YfNCa+OKFvnLO
	n3NQpy49U3ICwsQGvq2BESazNxeU1N2l2wjCxaI0uXk8x43fsDdATg99NAxq7eTBCTlC
	7WQuVwXyAzr2OHgc8lzXHiNGLb8K/6vOChN+t2fXMPLE9nsuti+IycmdSRXxWhqBOFp5
	DRuPRa4O6+yO92MeprvjvzGttyJKnwq1jB4C2HrNhmbLSREDR5o7QSB8ZOAkjWCmmQql
	DE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oI464zQJkvYiHrRR5uKe81pxTrzbOVqcRjCd0TwaAm8=;
	b=UqN8zzyhj+9mtPq1k80nYcqc9iufvk7LpM4lItkjazLJk+k/zMq1Oa+PqTGLWf1ApB
	/t7VCCKpg0Xns28pgwUYNNmgVWrBVLk3cpX0gOFpI9DuMwiCzuAwuClgIl9KsPD6SsM3
	plnOsg5xY0ZalwcHEs3mwUJRz7WV9rT5zWkEzSLZaMV1TgZi/gGiQAyfRmp1ZCuTJRjr
	sRBtiaRJFAkl9IbmD5V50xdDOLirgrcsiWs9YV1taAtWGvJ9pkxrC24dAbDjZR4yyB3L
	6OKcScGsC+VAIrBZ1KJ/HGisGW4ZpG93twxSLzo+AMXl0xwUxELxr45xZBmTQGgzLI4x
	3irQ==
X-Gm-Message-State: ABuFfohk4sK8b63yt6dp6RUg/abvxdWbpP4R6EFePw9ql7IP30wvgXeT
	cRW4mKmOpbhV5hiZPSyqEzRzUgEi
X-Google-Smtp-Source: ACcGV63q1vIZ7MjPq1Jya2pCsEIqJ4jvuXQpAn6pDWReomFxUeSupizjO2yElbWX0gXSzUHy5aiMyA==
X-Received: by 2002:a1c:8c08:: with SMTP id o8-v6mr8460990wmd.60.1538056971632;
	Thu, 27 Sep 2018 07:02:51 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g8-v6sm2840179wmf.10.2018.09.27.07.02.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Sep 2018 07:02:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Sep 2018 14:02:51 +0000
Message-Id: <20180927140251.4556-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] libldb: add pam to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Thu, 27 Sep 2018 14:02:51 -0000

* dependency on samba was added recently in:
  libldb: Add samba to rdeps for pyldb
  so now we need to match samba restriction to prevent:

ERROR: Nothing RPROVIDES 'samba' (but meta-oe/meta-networking/recipes-support/libldb/libldb_1.4.1.bb RDEPENDS on or otherwise requires it)
samba was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
NOTE: Runtime target 'samba' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['samba']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libldb', 'samba']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/libldb/libldb_1.4.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
index 99e62f66bb..3c7e5455e9 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
@@ -35,7 +35,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
 SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
 SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
 
-inherit waf-samba
+inherit waf-samba distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
 
 S = "${WORKDIR}/ldb-${PV}"
 
-- 
2.17.1


