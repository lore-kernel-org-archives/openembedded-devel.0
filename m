Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C2EC5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.657.1787286934666499041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gvrbEgFM;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacf197759so8651545ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286934; x=1787891734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLWAGSbxQEbIPNVjruG1s0E8eRZC8mp00xioe3B9DrM=;
        b=gvrbEgFMKss7PA7IpkfKDegleFfmkJi38N4NuvBWbxkRkkCosppfXk4Qp/Z24mCPD3
         o/42LDRmcC6P8blHnhJgqLCHxIImV2Ya2lvplO8GrmSCNggXAifau6TaklKi8JOzkAi7
         EBOvF4iFx/8hd9j9AmXhfSnbfKU5mgNvis93ikKxRPNeZzw3j4FqMHRD8uqARJZKtYgp
         VodtxAoBIOi2JZJ8Efdpu35syR4UiY3sOTXDJ3ZhfoFPxdCEffMa1mXrOD4bZDnYsABS
         cDXSrZe8YlaP0GSOGN8S0SGewmp+/edELp8pmhxlzj5Dsl5D5kos5LmOavgdYPVFFjiY
         JxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286934; x=1787891734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLWAGSbxQEbIPNVjruG1s0E8eRZC8mp00xioe3B9DrM=;
        b=c5jWfABIojVwvMzv/68SAdZoNHy5oWBTyYw0Y+UbD8OnnHODhKss6COyBM5lcR+vgG
         NMFd3e3Q8lKU0pEKDvVsRlCZYodlkjKYy5Yz8XGGmnVXfXQVrC3VP/yE5c2HNDw2eKGc
         7FRqc6vF4IgGwGM62rkpxNGBcuwHSXbaLjSGicr6UO3U1zPsZ6dOeOUS3DLfYRsARS90
         q2L52AntQ59FGNAxExm7jp6psy7Rpv1On7KfWvJTdrzmt/n0julX9zSw6qMbLZQKjuuA
         LQ3fQOlJRo9LqkwdvMB3PFmBRQiSNZg73Sob+KxqvhznyyogbkB+vC9aq9tl1V1g5llL
         Zviw==
X-Gm-Message-State: AFuF++nImjOyw7fySZpemBQ7sK4/JsbCtwjnECZ9ONnLUmymMTlMFYtS
	U5dwrS3OqFFVDdT3wyluhtUYFD6CX4/BU5inQMUILta46LMCp3NKnpO64FiHJQ==
X-Gm-Gg: AR+sD117CKgSh42d78StAg4/I5p9TWpAq1Ydzxa9fdNvdz/LWmLssNTZ80XEiq881k8
	NxHhKQij+YgJNi69TGZIWhKwTpI5N+lcr9Eql+iM07fYRIK/CQiZYRXeriGgbbWRxg/huA27MhX
	PiijuNPjDpuc8XetpQDqmAyOrbBIOHrZgGomo/c5BmxiwqOx6rDXnf+XhEeKIuLzt2X1fFrvoiJ
	wY/ctn7kbCQhYJqJxWLVCgXTFECfMF2QV+zxifzwi32Nt/iPVwkSK9zS8LN7U7G8Cu/IXmPkZ4o
	VmRg8y7U8K47mW/g3COy0T+vCq3GQ1d3Z51PnsoFsHIhfSYOBvDAYSMj3jLNts5iYpVOunLYEhz
	bbSB8ZzwCXquC4Z/Ob3AmcPkHSyBPptZHmbnNLwM4g9RKHP4f0bGNhlYz7UmE+Fs243z+llrf/G
	thzoxA49qymT/N2Hi7OlgpbfLVGtK+7ub75mfaboWq6BmTzOvonrwkYndFW1vAofR3uJc/mg1tJ
	QF/rFEQWMyJvwJllgca
X-Received: by 2002:a17:90b:3c84:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-395c3542369mr6947713a91.4.1787286933805;
        Thu, 20 Aug 2026 21:35:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/15] cabextract: add UPSTREAM_CHECK variables
Date: Fri, 21 Aug 2026 16:35:10 +1200
Message-ID: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129396

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version cabextract
...
INFO: Current version: 1.11
INFO: Latest version: 1.11-1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/cabextract/cabextract_1.11.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
index 0f06489ca9..96e29aef2b 100644
--- a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
+++ b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
@@ -13,6 +13,9 @@ SRC_URI = "\
 
 SRC_URI[sha256sum] = "b5546db1155e4c718ff3d4b278573604f30dd64c3c5bfd4657cd089b823a3ac6"
 
+UPSTREAM_CHECK_URI = "https://github.com/kyz/libmspack/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
 DEPENDS = "libmspack"
 
 EXTRA_OECONF = "--with-external-libmspack"

