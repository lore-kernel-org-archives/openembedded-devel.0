Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id DB05974E1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 13:48:07 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id o185-v6so21697985iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=x2HB87eeBC4E29OLfx8v1MEiwes6T+B8fhZMaYkU0nM=;
	b=RcqY61NHOigvAYdMMp+q7VzfIvBX0rT1Zc0EfNT4xCd/xTIhJtRSN4t+P9opk4z3FS
	gzzvSY6lcCk7XMmnzRrjbdVg1HlFBWsvyQ4+OOBZl/wSyyeUAEgt/6DcTBEodAk8p4pw
	2InxilYiAwDoIBazRcSliNCnZyCkSiz0TGOpD02v7/l2eR8BvH0fvsPNN0YralbPwx0s
	GsX3aTJHnFO31GbETtUYYfX9orRS1n4BwUah8IvEwzkV7mKmrwwLf4La9cgi/2clIXd8
	E2j2oS3wLLmHJAH5OnQBa7VK7OGQjWIVpGzpp+Dgc1VcDCNHanWdDrNbjqpEis3/W5Dr
	Smlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x2HB87eeBC4E29OLfx8v1MEiwes6T+B8fhZMaYkU0nM=;
	b=FaCOS/Sx1D9uZbk4x6Z3wi5vea2Du8uclp6qF3eCIPFyPRPFBWrkQaLRx5NQ+ym1h+
	IBBrY8eA3HLDzBPP1A64SCad8PdjDcoPxUEWURSY+RXXGvBkCNoqEonDN+q8HBf0h6Vd
	zZjX3YHbxIuLTduSMR+WtyiG13m9bcYKtApYqomQ8ZGJ5j1xJtk9kawVWPe235H2KC6+
	6QHnKCrZok1DDTD1maUjugwsIiErUSpoxUG/CLGGn2Rnwhonjc5rorIGhCfbCC3UYSM2
	p2+LpxV59J8GpBTJh4D8X4d4ZR0kSgqrZu5/XT7fN/kvQOU7me7qI0RKH/se6vFIygHF
	HDgA==
X-Gm-Message-State: APt69E20brME9dhXGXQp+SpAPFQAdTjMX6NTSw0QB0l1gSnwnIo0AruO
	K5ofua5Pv9RGRDAncTz4k3sqfrI=
X-Google-Smtp-Source: ADUXVKKh0WSIRY/0qb1POW/Uj7esKpfL3ckjhcy7YY4UY+ryxUU2jC+yqpxNMFK+MXx1Wj5es6zoew==
X-Received: by 2002:a6b:208a:: with SMTP id
	g132-v6mr2428031iog.216.1527688088548; 
	Wed, 30 May 2018 06:48:08 -0700 (PDT)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	y62-v6sm8376583itg.2.2018.05.30.06.48.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 May 2018 06:48:07 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 08:47:41 -0500
Message-Id: <20180530134741.29397-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: mans.zigher@gmail.com
Subject: [meta-oe][rocko][PATCH v2] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 13:48:08 -0000

The 3.4.x branch was removed upstream but the commit referenced in
SRC_REV is the 3.4.1 release and is still available:
https://github.com/google/protobuf/releases/tag/v3.4.1

Drop branch=3.4.x from SRC_URI and use commit specified in SRC_REV from
the master branch.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---

v2:
 - Correct commit message.

 meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
index fae7c18a1..fe28f475a 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
@@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
 
 PV = "3.4.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
+SRC_URI = "git://github.com/google/protobuf.git"
 
 EXTRA_OECONF += " --with-protoc=echo"
 
-- 
2.11.0


