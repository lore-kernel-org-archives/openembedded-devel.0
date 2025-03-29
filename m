Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED80C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 05:22:13 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.5547.1743225732737816529
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 22:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nAc93Q5c;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso3828392a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 22:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743225732; x=1743830532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aHZHzkWxMGR2HLu4nWwpZks2WTAJGRryx3ul8TrC5rk=;
        b=nAc93Q5c7+KjddglZyyElEYz3Gkt/2zBbVYcldICsbMoXMPKDnlIieei/U17voahXi
         ovw/a0g+wzd1wnS2DByMBXcmEoexc/Z7hChbGjVgzXZh+5t+KBeen5I3GZ2ldVQLGLOb
         8J82G7pBdlAMoASMLSX/6qsFhJSEF+MfBLrB9SwsOUlH6O/3t0Y7CXNNJksO6ZeRU3FL
         qZmi4xex8xyWnHiEj+Ug6SNJV6TaB5LCoSZIOCgWJqICGD2ZZtO+Xjf1BmGVIvMQyQ7L
         VZfeZ/EiZhf9kURAncuwVpsJT/Ubykm2SU1KY3e6BYhdn57yZvMdRuSQEdHYcmVfu4aS
         cqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743225732; x=1743830532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHZHzkWxMGR2HLu4nWwpZks2WTAJGRryx3ul8TrC5rk=;
        b=jBNylrfSmPZ2MAmaQTYS4uvTdr67hG11eAdoiODnI4ZTbQyOzlkHQqG6FUe9L0BfCR
         F+1e9nc4XZFW3IYX5ts1Ku0fClaC1NTZXkqJYNhDgviHYUlFb42r8wKQW8cfL6kjcSmi
         sAfGrxxIU+pjEKkqtCot6shiRsLTyQZLVWUCndIsTJwyJL0yhTgsO9xjIR1poy/enZQZ
         T4JwoURGnG28b+tJGP8ddGAAotGo5tjWAcNVU1T1tlcAq2mckjO4ua9fDLLli8kMpZLL
         E5ZukLBcPy2MzZkauXz/K1UMtGEo6crUdzWdm8XllaL63EldMi5IsWqgvglfIuRFwdho
         BIFA==
X-Gm-Message-State: AOJu0YxabdgUvGT31WgPxF4pCdI6MUdPGC2ytNvRHSOndDOvncGu/WbP
	eNME5Rs7YUZ2ZrKktOKHMyxRnrnkWUVHAo1PXHxzrRLkxmzkELyAkkr8tN/g
X-Gm-Gg: ASbGncv1v16HrgCh4XCMjV23w+13PZoVmy+pc9K4nrV/juXvyikV31MK6emqRWFf4II
	QQ4I7dJR0Kh/SqD/lwI1WLYODk4abAk1ktjiS0+srEuRHsJurxhBLNIclWESP8dLCji1PFJ2Yv/
	3pA0R3B0kxzY4g+9KPSTShqWLpf2R0Sc7epnmrbjllRbHwQV0rEUzVVNlzyJXpbk9NhGIJp4RNs
	kzGoDN5jxWpygr/dbSjpFdgcSUZzopmvwRbAqFCNDXixQxJctpc/s9o8H3oVzoqCbv/lKBBj27N
	C2bBCaJhoWQgBiLCT6ZAl/+EfXrekEppDxgLIGefN8MVqBA=
X-Google-Smtp-Source: AGHT+IFJVsYWxWVvEm0zk1j3uR4M2T0WCxsxJaHsliJd8WrJDEem9v4tGZmPuiSuIwwcj5iD7yyDdA==
X-Received: by 2002:a17:90a:d888:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-30531f94b7amr2989261a91.9.1743225731663;
        Fri, 28 Mar 2025 22:22:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305175cf8b4sm2835791a91.49.2025.03.28.22.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 22:22:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] openl2tp: Replace ifconfig with ip command in ptest run script
Date: Fri, 28 Mar 2025 22:22:08 -0700
Message-ID: <20250329052208.4060384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 05:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116367

ifconfig may not exist on all systems since its deprecated, fixes
ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/openl2tp/openl2tp/run-ptest            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
index b8fb08b758..a40b6c4228 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
@@ -34,7 +34,7 @@ ETH_TEST=`ip route get 8.8.8.8 | awk -- '{print $5}'`
 if [ x"$ETH_TEST" = x ]; then
     exit_cus "The network interface cannot be null" 1
 fi
-ifconfig | grep $ETH_TEST > /dev/null || exit_cus "The network interface you provide is invalid" 1
+ip a | grep $ETH_TEST > /dev/null || exit_cus "The network interface you provide is invalid" 1
 
 # check openl2tp related kernel config
 zcat /proc/config.gz | grep CONFIG_L2TP=y > /dev/null || exit_cus "Failed to check CONFIG_L2TP=y, skip the tests." 1
@@ -61,8 +61,7 @@ if [ x"$ETH_TEST" = x ]; then
 fi
 
 sed -i 's/eth2/'\"$ETH_TEST\"'/g' ${OPENL2TP_DIR}/ptest/test_procs.tcl
-test_ip="`ifconfig $ETH_TEST | grep 'inet ' | sed 's/^.*inet addr://g' | \
-    sed 's/ *Mask.*$//g'|sed 's/ *Bcast.*$//g'`"
+test_ip="`ip addr show $ETH_TEST | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d '/' -f1`"
 sed -i 's/192.168.0.1/'"$test_ip"'/g' ${OPENL2TP_DIR}/ptest/tunnel.test
 
 # load module l2tp_ppp

