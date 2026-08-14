Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3333C5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:00 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24389.1786747612981201188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CUXSQ13Z;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e347638adso1864445a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747612; x=1787352412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7y/WCHyBlH/QOEZgb0rk6GcBZsyeC4qIqjloMUVxMM=;
        b=CUXSQ13ZfgNhPW9/EMeGr2jMUejOoJ219r2y20tFTI4ZuIHUf8czikUZbpwjPMwz7H
         oBRR/Z6619TcoSeuJwNVZj8CBE6nlnuyxcZjgFP1WPzzJLDXnrzhMlfsV0G85cJH9ZDt
         eWJlGSgcUscPTdBwzXRQQka2MKhqizJHQ3fcO73U7Qa7uPwytWPXXhej+GkWeqgmHuIH
         JnHD8icvMBdfk1nM2o/2RhppCLTC8T6jHRMezXgEg5fKWMr7jITKHNT7Ke2YHLzHZF/p
         xBk1yIiYCG8/jo6ax5W9HF4XLooDBXrJCGUj+hvuDf5Ex1zSL8+CtaBzXEy7lJQbaZak
         IzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747612; x=1787352412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7y/WCHyBlH/QOEZgb0rk6GcBZsyeC4qIqjloMUVxMM=;
        b=qOiaOPlSFC7hTwArPY1+83410/F+apSJ23uJCJKjfQ5ZS5lTA6SFNyyGugxb6gr66N
         KhSXfBpKc/WuDGUgl9BMlJaaoZ8BAxA0Q+5G+TnEaeWCr5N2Uu1KlouWGXjkZqib/3+G
         xY8jpuVa1Jyg53XQ/BTg+Nh73s4XQplAyehawHSVsT36OT55uKRtx1IsOuf6+4sjRG2J
         2APqOgihpObjXHPf2YaOSLEq/H6w0siEih5k+5i6gRJ0p/GLTHB1jDC4nNsU47eBSck+
         LtajEYomJeQ15cFvshiXIFSSkpTf2OVs9mYHWK50TlpQanPjEQujoLFJujMiQ9wq+bed
         21SA==
X-Gm-Message-State: AOJu0Yy6gBb8iMn5q5/cPmWLTjyjGnO82ve5QKjNjy+i0c4KYyNsOxs9
	132qRUZWFC1UxjaQtDbO3/2XOaHi+GuttSoBtvPaoEST/5fc2NF6izbgTujx6DWN
X-Gm-Gg: AR+sD12oSw28xJm1+1h36wzhKKlOC9GQPQ7FnGxLKxev8U4vHqSfTrZVJ150xWMu8gr
	fzAhe6Br1WLWKpXXILkzp2nBGUXYC1cYYq5F2emSXQ/kcMQG+PdCBslkteF2gJ/Rt/9DgQJEmq1
	dBAzpPo2FrVzut+EyV8CL6q98j0fSwn8ZkZdaLxem4td6U1EBlxDhLSr7Mo0RNAEyqX4b498KH2
	yvTuMnmSSeRkZUqED7q0QCWumlIJXyQMXVpwaMa7IwqFKQGpl8kDDt5SoF39Uq61HgrxwLs5zTE
	8QGKPeiLNaKssdX9jdnVENoRzAUZGxO9tTCrOaVpOZZ+tOJvS0fI2J6TRlFw+74SjNrA0dhQwfC
	84rqBXeufXmt1S/wb32F8vRfztSe8wGwEKg/zrPemU8C3SCTEFrzglr/MfMSzCu1iOw8XWyAK0y
	uosRaAavA0PoNPNAjniJQKYdPK9RDwOJxc9zdRmwub2LbAkiapChHiCNExAov1Ilb5PvvHSrA9j
	LccV2gPnxsaWLenPMohSBkWQfrTE2zcBCi3x9hssdtRMMCp/yRb/dp8Tu+GDDP9fuvwrpIW+uH8
	RUEV9ysavpnZfZTa2R8Vsvmt2JMWWDYUsQq5CU37PZ16Knhco5wZ/jFkLQ0zzZ0BIAbgQs/MvuN
	4ACVdJv26ZSor1FfNQhmKCNyXFfXf0fLUsUoeB1ZBnFas2Q==
X-Received: by 2002:a17:90b:538c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-3933b8744cdmr10760483a91.11.1786747612329;
        Fri, 14 Aug 2026 15:46:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 063/109] sdbus-c++-libsystemd: upgrade 259.5 -> 259.8
Date: Fri, 14 Aug 2026 15:44:49 -0700
Message-ID: <20260814224539.1523174-63-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129127

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...us-c++-libsystemd_259.5.bb => sdbus-c++-libsystemd_259.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-libsystemd_259.5.bb => sdbus-c++-libsystemd_259.8.bb} (96%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.5.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.8.bb
similarity index 96%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.5.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.8.bb
index bfefcbc4b3..19104bdc36 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.5.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.8.bb
@@ -10,7 +10,7 @@ inherit meson pkgconfig
 
 DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
 
-SRCREV = "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
+SRCREV = "6576434737de042cdd0f6e62f34f04818306c73b"
 SRCBRANCH = "v259-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
            file://static-libsystemd-pkgconfig.patch \

