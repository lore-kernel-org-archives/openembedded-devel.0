Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41236CEB2D5
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 01:49:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.71577.1727747357627894353
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 18:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kSyYgxQq;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20b0b2528d8so55139335ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 18:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727747357; x=1728352157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=29E0vv2hgB0SmVBGsbJiOhMA4ETgIfjsubFoGfLOPdU=;
        b=kSyYgxQq7yv62AtHYAJv5igFOG4p6lYRHBaA7FNTu9ugp0fu1meXGlShrELW2CQ1th
         h2F8I3D19xvedCTG4FJm2kgqV/TC1OQYRCCUkoV205yH2QrQCFfjpkSG3dNGz8wcUvPT
         5cN66pSBMCNRmamzcT3/uKtiVf/JRQSxN6m3e6kExigqoJS8FMxcpgXhKE+/++v8TV4v
         fhMsCq8cMnBa7mIDmT6FSlGGJPQHMjLSZZmDTgMU7iH4yY0byzfdYLUmVtJcoiNa5rSr
         mNfhVNtxJIogIduaNtvtU4NPHIIgIUItus+b35AIG3BiL9IXiy8RZiYHa1/nq9isD5jI
         nHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727747357; x=1728352157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29E0vv2hgB0SmVBGsbJiOhMA4ETgIfjsubFoGfLOPdU=;
        b=Eevsrg+nyDErJCMVoB0RyY94G3sCFTx9UTrfKDMIMVgwJtXOqFLEBjsOVRQ6lVlfyS
         kZs9+wR6EN5qElK/GEUolmZ5c+Q3aNZelbYAu+WAoEy70gRLvNhaaEhnIlU3D3+C2oVj
         /RrulRrtqIFSMStJ9XF39xzxpJYIFOfZ5KL7sFwBqT8PHdMbzkQwZJSuUA1d5Z3LZmTP
         IvFPV8X+R431BaUJEqBsffQ9cUc6u46Gb7lko9ZQw77qNEQ1FmqVpBZdvJeyg5MPYnBF
         AAKrS6Dlf5E2perZyZbV2v7syap4z61c56DoP7TvSD28ux1lD/nsB4sUVV7VkgjhV0LZ
         21OQ==
X-Gm-Message-State: AOJu0YywzMY2mg9nTbWKIjvYvIgmk422y1k9Gjxoa8F1n5m1mTDFxSB+
	t1MgXVytseO8+MBQYKuRVMsVy0FOlflxJMudFUgu+zaKO4R9oi9ro7DiTA==
X-Google-Smtp-Source: AGHT+IEWv1k/hgCDZtE8/OOiWbHRufirhuAAf4cNFtjprF4lrqFMWHz6LQQ5HjVXDDQXeV3t9couCg==
X-Received: by 2002:a17:903:110f:b0:1fa:9c04:946a with SMTP id d9443c01a7336-20b367d02b3mr230737145ad.1.1727747356781;
        Mon, 30 Sep 2024 18:49:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ae14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e65992sm59981575ad.285.2024.09.30.18.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 18:49:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] openl2tp: Fix ptests
Date: Mon, 30 Sep 2024 18:49:14 -0700
Message-ID: <20241001014914.4186839-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 01:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112616

- Detect active network interface to use, instead of asking user, this needs
  to run in automation
- Find the location of ppp_null.so with find instead of rpm, rpm is a distro choice
  it can be assumed to be always there.
- Add missing runtime deps for ptests
- Kill openl2tpd started by run-ptest script before exiting, otherwise
  ptest runner hangs forever.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/openl2tp/openl2tp/run-ptest          | 7 +++----
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
index 01c9c7b447..b8fb08b758 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
@@ -30,9 +30,7 @@ else
 fi
 
 #read -p "Please input the network interface you use to test(such as eth0, em1 etc):" ETH_TEST
-echo "Please input the network interface you use to test(such as eth0, em1 etc):"
-read ETH_TEST > /dev/null
-
+ETH_TEST=`ip route get 8.8.8.8 | awk -- '{print $5}'`
 if [ x"$ETH_TEST" = x ]; then
     exit_cus "The network interface cannot be null" 1
 fi
@@ -73,7 +71,7 @@ lsmod | grep l2tp_ppp > /dev/null || exit_cus "FAIL: Load module l2tp_ppp" 2
 
 # start openl2tpd
 ps aux | grep openl2tpd | grep -v grep > /dev/null && killall openl2tpd > /dev/null
-ppp_path=`rpm -ql openl2tp | grep ppp_null.so`
+ppp_path=`find / -name ppp_null.so`
 echo "test it here"
 /usr/sbin/openl2tpd -d all -D -f -p ${ppp_path} &  > /dev/null
 
@@ -95,3 +93,4 @@ else
 fi
 
 restore_file
+ps aux | grep openl2tpd | grep -v grep > /dev/null && killall openl2tpd > /dev/null
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index f64c7340d1..f3b74d1e61 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -94,3 +94,4 @@ do_install_ptest () {
 }
 
 RDEPENDS:${PN} = "ppp ppp-l2tp bash"
+RDEPENDS:${PN}-ptest += "rpcbind kernel-module-l2tp-ppp procps-ps tcl"

