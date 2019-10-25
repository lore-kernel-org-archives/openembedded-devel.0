Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE0C7FA8E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:32:03 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id w3so1973802pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 10:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IY5gNFLRiTuANVDGOdFKpbUfbvigpGmQgN/6xaXFvTs=;
	b=G9HPqwszHemx328uL4V1E33bIggUiBn9yO1gmTk4Bcnm33KqQjVpQcPAtOJAaAANbP
	6PVnWHNhyBw38P3sVIaEWv3RLi6cdMS1lRZ7kiBahxMsS+6MxLDguV/+I3gorCVaNLuS
	5XDJHj1/7SNFJ2xJCplTmdeE58wcERe6iqtF9repSsVsm0dAoICQatsGKmCabqtIpoou
	r64lqySd1NYhGfRpKf1cqmIF+ELaa7iReX4m0Q02DiWCfpAtzBBwfsYl9ehV6e/54Hie
	zPwBJCzP6rhVMGePU+alZkswS3iF5V3CLZ4njN9m6lg46meMcF3A5K/y06Aep5SIOI8v
	K4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IY5gNFLRiTuANVDGOdFKpbUfbvigpGmQgN/6xaXFvTs=;
	b=Yj7/S1PEElI6JP81wZnECUn8dzfGPSF4yskywT2/xow3nTmgMftSd9UTD6C/vxDTzI
	dg12ZnOCstVBY4sGkMeG2i9JBsp3vEl8B1vc8kfiStBEr5h+pKV3RJSPY2yAgL142Iz/
	MYq4MqscSFMLrWEx9oNN+/Is5NUUeOIC3/9JPwlq6dKznxu6FgCGulI7aNUwzx8qSTCN
	szvrLIhNrQq8KPfzz5zG/M0+6PWVntqqwNqqKZ/+xqBRFuCZKFEIwNT1hIjVamXvVLGZ
	BGU0EqEgK+O1aN7M5BmnTwVwH7B2PQ8NNtmyOH+cugRT6PUfPdphLPbaUg8lJLEgpCR7
	4vYQ==
X-Gm-Message-State: APjAAAVOL4HMKWHpXK7RPS6hElo0HISH9Nn87rNBrVFcJHxsHVbNQXQG
	noYfYNlzHm+X4NHxC6VJynQCCBm3NgMbOw==
X-Google-Smtp-Source: APXvYqwFLoxMqpizIqvO6/szcb2gKUsfMfv3gu3Da+dIq7LyX89gymo3XubFa5jqAq09UyFbnPqqXA==
X-Received: by 2002:a62:68c1:: with SMTP id d184mr5730663pfc.195.1572024723752;
	Fri, 25 Oct 2019 10:32:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a6a5])
	by smtp.gmail.com with ESMTPSA id c1sm3511547pjc.23.2019.10.25.10.32.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 10:32:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 10:31:43 -0700
Message-Id: <20191025173143.1426578-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] libiio: Inherit distutils3-base for packaging python files
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
X-List-Received-Date: Fri, 25 Oct 2019 17:32:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: inherit distutils3-base not distutils-base

 meta-oe/recipes-support/libiio/libiio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 4e57d5b77b..e6e0eaef8b 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-inherit cmake python3native systemd
+inherit cmake python3native systemd distutils3-base
 
 DEPENDS = " \
     flex-native bison-native libaio \
-- 
2.23.0


