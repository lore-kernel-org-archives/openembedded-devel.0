Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id C568660034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 22:23:48 +0000 (UTC)
Received: by obbec2 with SMTP id ec2so101404304obb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 15:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WAXMtLzxZbu45ad5lLekD08GFkc7JIC39BgGXFzDNP0=;
	b=ctobRzn/bsfr1mAOZ+6IBkRtmvctp8XNHvVT/b5MD41o8ePlBHudOARQJ7VZH+iSt0
	UjRVKI2ONK2PbJsj9Chx6KL2g3JkSraLyyaEV1yMaRO2sKvRAyspl+sBFvVLI/iBIKzt
	fDPFjgpParsseevr4s2h8tYKluB3n7Hv3+jpHdV3LgTSQHG6Z9HRNAZDx40jcQFi8tX7
	STQOVtpyD8GtIp42dmD5AE80i40j5yR3Gkt1KI6v2/R1hT1HGHISprkz2MTtijaMBRH7
	iEyGRkYQvp9qMFttiord8FbONcdeg3efHz7FOyUFR8grPfJTUTbQwyfOxnTBHhq9yImm
	i87Q==
X-Gm-Message-State: ALoCoQlH8cMkqqCAjM45N0FG12aIEflEwJbCmKJwFsVCviJiCSQLwLkdwkXiuXl3XoBUEsxzpvf+
X-Received: by 10.182.91.35 with SMTP id cb3mr17361267obb.87.1427927029330;
	Wed, 01 Apr 2015 15:23:49 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id bp2sm2987596oec.0.2015.04.01.15.23.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Apr 2015 15:23:48 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed,  1 Apr 2015 17:23:25 -0500
Message-Id: <1427927005-7808-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427927005-7808-1-git-send-email-gary.robertson@linaro.org>
References: <CA+chaQdOQKZRW7QH0qHS-ta8+oZDspRVGguF3iMDgOyrPAxg_Q@mail.gmail.com>
	<1427927005-7808-1-git-send-email-gary.robertson@linaro.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] libhugetlbfs: Add i586 to list of compatible host architectures
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2015 22:23:49 -0000

COMPATIBLE_HOST included support for x86_64 but not for
32-bit x86 architectures - added i586 arch name to cover qemux86, etc.

Upstream-Status: Inappropriate - OE recipe change only

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 4ce6a19..6fe5dce 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -24,7 +24,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
+COMPATIBLE_HOST = "(i586|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
-- 
1.9.1


