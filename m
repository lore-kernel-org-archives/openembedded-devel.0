Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FAEC43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:23:01 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75161.1782663771810658093
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pGTWUvzB;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30c944aacbaso1930678eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663771; x=1783268571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kg3n2uYsqvBsTfbFfgfdwBM8kYF4AKZ3tzYL5L4MiM=;
        b=pGTWUvzB7ejYUrnPEERrMAJZS9HXxjmlkT/980vYujuBLpsQSp+YvuohUdc/KB3UuQ
         CdDvho1y/ohJ7YDcHmekjkzYsWr5NVRnBn5qnzX8nU2pPZfoppyunE4jNFhXkgDnyvyr
         jr6wIPDO1iPtuKTIKcbQr/TRST8/D279Q6dCvWd/M2NaAqeikw1agZKANMcG6dsFJ2bj
         MEmMJ+RPlV/2+6vZJdzQ6GpxfWwcyvgPtnFOu4zWH3vTJvL4/La/sBf3y8ytwguN5mX8
         F1OK21RvuPFrOLizrX82wsa8DdwWTrW9NUlqgNa827oSnYBBLzfeeSvJFgJynWAtwkjR
         Y+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663771; x=1783268571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4kg3n2uYsqvBsTfbFfgfdwBM8kYF4AKZ3tzYL5L4MiM=;
        b=UMG3yN0fbhyGmjDsTDtLNUrdzuIV4g/RbT1udQ238X2y1T2gCXOCpfITLiTbv8F2xK
         Cs3dA1pLsU1dxa0h0ngR93dMO5SjLkHco6lznKakAH0c5sXP8ybbV4iZJUeuDsLVZLo3
         A76K7oZ2sTTpTsLQbdZLYMcQASVqvzUdCHbzpCzn+gjN6OsrMpEVtuNE5z91e2TJrqqW
         lurXBkPTDiiisNl3thVjmbtQZXw4UZ11Lts9F4JmzDmfOARODf34+l7d1OnbnnfuSycR
         9Dh+Ee4qi3vsSJuqfaI3ct4zLKt1vrxrt23WcLLLZTv5dQI6PzdFTMXaUXwBZlOvVnst
         axLg==
X-Gm-Message-State: AOJu0YxpfSfoMDmc4j5sljUs3HDCFIjKLcVOTIx4QKQeCYmI5N9VeTOO
	iY3pJKxJzZFwmsJaomRrGIkXolnK4Zi1JvWDEAi/20wlKv0FuZxUG4BIDhMCEAblN59auQ==
X-Gm-Gg: AfdE7cmoVb01Zhf/QPa/ZQjZSxK0OlcKKBeFNXV86ZPqFBFsSn+qWXGTz0ous55hB6R
	ry0OnuaFnJ9rLE1ET4EES5U283lsQkQSE6BsNYvDvaRKXOVW0z12/Qk4qIs8+L8cuXQS3VxL7tv
	/SxGk4PeSt95+lQBqPc1m/yMB9JhMH0Wi4wmDNAycbX4emIExAy+biZFq8/b7EXt05sbKahv+ae
	RvftiIs+gXQuB5SnJPP/UyawyEFax/+resLjtGY/FVdyYwMnihNtIWbUHosAfmc+eYnHgj5Dt74
	aJasj7M84iAMlgg94Dmji7S9l4w9o7y2h1YGXQEGTaGRmmGNNWkLjlIZYZYoarCUUSv+MrkOMlq
	fB7OS0XyqkUTOXHtJdZr2m/0pPru9gVr1Vca6+5+02i0nCjhnBNNwdWnEClLOE8H0Po863cQs7+
	zIzXHAmgJWW6Xug10TIXNqHJFKvrdss2pdi10aQlHa3juQ2x8eDyZcbUhbgfDQg/4g759pYV6XZ
	cxGIx+XZ4/3lPgIpZhUawDyiccEVWB3IXxvU1WZPNir+1snH4Fdgy7gL16Jhh0YimE14s1ur6MA
	eQA67MFG9Q69cV9UVexnvgqr4TZPTA==
X-Received: by 2002:a05:693c:3945:b0:304:e566:e000 with SMTP id 5a478bee46e88-30c850a8f7cmr14289297eec.31.1782663771095;
        Sun, 28 Jun 2026 09:22:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 126/128] tokyocabinet: drop $HOME/lib from LD_RUN_PATH to fix buildpaths QA
Date: Sun, 28 Jun 2026 09:22:20 -0700
Message-ID: <20260628162222.4081517-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127936

The Makefile bakes LD_RUN_PATH=...:$(HOME)/lib:/usr/local/lib:... into the
command binaries via LDENV, embedding the build host HOME directory in the
shipped binaries:

  do_package_qa: QA Issue: File /usr/bin/tchmgr ... contains reference to the
  build host HOME directory [buildpaths]

Strip the $(HOME)/lib and /usr/local/lib entries from the generated Makefile
after configure.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index d0ed6013f7..77ac917005 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -25,3 +25,11 @@ SRC_URI[sha256sum] = "a003f47c39a91e22d76bc4fe68b9b3de0f38851b160bbb1ca07a4f6441
 DEPENDS = "bzip2 zlib"
 
 inherit autotools-brokensep
+
+# tokyocabinet bakes LD_RUN_PATH=...:$(HOME)/lib:/usr/local/lib:... into the
+# command binaries via the Makefile LDENV/RUNENV variables, which leaks the
+# build host HOME directory into the shipped binaries (buildpaths QA). Drop
+# those host search paths from the generated Makefile after configure.
+do_configure:append() {
+    sed -i -e 's,\$(HOME)/lib:,,g' -e 's,/usr/local/lib:,,g' ${B}/Makefile
+}

