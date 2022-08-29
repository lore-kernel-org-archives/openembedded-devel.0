Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC3CC0502C
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:57:04 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.67684.1661756214817469019
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R6BUtPSV;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 12so6904671pga.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nf9sW6lDwh4P8elur+0wsHFRNpc2D4pwHjI1kMwoutg=;
        b=R6BUtPSVjs6N9L+6sDdz20F+aPWWcojwF65Bu2p8+fhTC7S4y3dPq88hAfi/sgq5dS
         D66UMuP7dw2My1/v+Tfaqgm4vBtDxYSUiGt9MVsEro5TFSMSZzfP04YNwhMdcmzEXR0O
         l4SefPTOVF3SAp4HaCXXLKLtEZwRSwVwmLPzfyLP8vD7eoBZ2jCdFk73hWh9tQ/nwEh2
         xtCjFuEZcgPscF0zbA3xK05PuaNj4QXbkyz10HFDJDlVU67Bxmc7njBXQttYDNODNvso
         LXL7hXPVwjVabRwMtMPWCUXNvT6AZIQBtXpZOwg85CQwyeKqVvnawfhIYlp3XwXnfZFQ
         u7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nf9sW6lDwh4P8elur+0wsHFRNpc2D4pwHjI1kMwoutg=;
        b=prqEk+WHofWrYs5O85TMogTE8fiPkHqJDHxG6qAoix7US77faNLIuJTcaRUZvHXOhB
         N6Rx2XGpu1zIhZwie+KCYa5x3JZDqBGvhQlB37Vadf4hpt2fl0J8BCKbTcmLosCzHLCu
         SHiUAiEQW+7DKSz0Zw+ObKaD2/nXASZhwoWTnWltJIV4cs7q2J3D114WYhAnIVY7HhSJ
         c90w4XN5JYIKV4yo/wfPLSTcKv3O8tnXImjf0utnvwZbIlvQ5K7PnJACZIHl8P75lHPZ
         cjc97U9+wzf28CC4Fq6GM7t4IykFGKRYL2E9YKEBBWtiwqYEkhbjgarkxbxRJo36uSpU
         x/VQ==
X-Gm-Message-State: ACgBeo2O8BtT1dzLgt223BtP9gQH32kpgOqJEg1VmijfqeuQ7PALHqWU
	HZ/G9yMjMX5g/64QoLf+ZPnFiWTZt55ZpQ==
X-Google-Smtp-Source: 
 AA6agR5sx+g8ev1ii6nSrM6Wp6IA4N4ZEVeVZ0SvJP6b3Ojoxe4eP5YqZ3Vki30mo5Oc1I3XSh742w==
X-Received: by 2002:a05:6a00:2409:b0:534:98c0:e53a with SMTP id
 z9-20020a056a00240900b0053498c0e53amr15399724pfh.11.1661756214927;
        Sun, 28 Aug 2022 23:56:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a170902e74a00b0016d5b7fb02esm505489plf.60.2022.08.28.23.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:56:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] lirc: Fix build on musl
Date: Sun, 28 Aug 2022 23:56:46 -0700
Message-Id: <20220829065649.808556-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829065649.808556-1-raj.khem@gmail.com>
References: <20220829065649.808556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98515

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lirc/0001-mplay-Fix-build-with-musl.patch | 44 +++++++++++++++++++
 .../recipes-connectivity/lirc/lirc_0.10.1.bb  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-mplay-Fix-build-with-musl.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-mplay-Fix-build-with-musl.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-mplay-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..48cf7a355c
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-mplay-Fix-build-with-musl.patch
@@ -0,0 +1,44 @@
+From e9e9027d7a324e1ce5e0cb06d4eb51847262a09d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 28 Aug 2022 12:26:52 -0700
+Subject: [PATCH] mplay: Fix build with musl
+
+pthread_t is an opaque type, therefore typecast it to avoid warnings on
+musl
+
+Fixes
+mplay.c:200:12: error: incompatible integer to pointer conversion initializing 'pthread_t' (aka 'struct __pthread *') with an expression of type 'int' [-Wint-conversion]
+|         .tid                            = -1
+|                                           ^~
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lirc/git/merge-requests/47/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/mplay.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plugins/mplay.c b/plugins/mplay.c
+index d6d9619..5b9eb4b 100644
+--- a/plugins/mplay.c
++++ b/plugins/mplay.c
+@@ -197,7 +197,7 @@ static struct {
+ 	.latest_button			= MPLAY_CODE_ERROR,
+ 	.fd				= -1,
+ 	.pipefd				= { -1,	     -1	  },
+-	.tid				= -1
++	.tid				= (pthread_t)-1
+ };
+ 
+ /**
+@@ -788,7 +788,7 @@ int mplayfamily_deinit(void)
+ 			return 0;
+ 		}
+ 		pthread_join(mplayfamily_local_data.tid, NULL);
+-		mplayfamily_local_data.tid = -1;
++		mplayfamily_local_data.tid = (pthread_t)-1;
+ 	}
+ 	if (mplayfamily_local_data.pipefd[0] != -1) {
+ 		close(mplayfamily_local_data.pipefd[0]);
+-- 
+2.37.2
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
index fe9685924b..467e10b658 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
     file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
     file://fix_build_errors.patch \
+    file://0001-mplay-Fix-build-with-musl.patch \
     file://lircd.service \
     file://lircd.init \
     file://lircexec.init \
-- 
2.37.2


