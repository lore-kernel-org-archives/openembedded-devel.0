Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB252CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 23:24:45 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.12900.1759188280471349858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 16:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mbt88iyj;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8d593793af1so208503739f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 16:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759188279; x=1759793079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGeYTFuNuwS84PuYmDAv5iIH78GbGUFBv98mvksW/oQ=;
        b=mbt88iyj/yJB4MWu97SzWz6wvcdeDOJ1ARhkcNMVPWa61e3OAsrtwI/OL1dGv2ZDLi
         t38s5j0LdrDSzFibfByb5JFKg9R8xhyKHUVQZye5l6KoSTcLzDiFQay0bcM3QAm2Sfrs
         kHkP38dPde7R+0L+wQb+TY48bw/dIFTsKBq5oexnZmW/54hlSogEOpjjG0ukBayZV2TB
         mWQcdoIO+ZWRqx4okhcCJ4TdyiMy5rnznVzN1/Rpv+AXmTheToUUX5lr6C+kcXwK+oNN
         vDL7+4nlrEezr6v74sfQUMdYX38JIOQaSh/DlA3pHHZRTfIj1SkdHEk3YQMYg2YMO3ts
         +1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759188279; x=1759793079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGeYTFuNuwS84PuYmDAv5iIH78GbGUFBv98mvksW/oQ=;
        b=EAOx4/HY+1UISl1mYU+clh6DV6wLZf6g6E2NiNJhSt9Q2Hn2e9IGJJWVchq0xwiq4A
         xZbL7O/CzxMqSkySye6w3nTAH3hQcyNi6z7iWFkttBI8iDdZvNY5x2V0YOZ1Dj0mQU1k
         cXKfKFe9qQ1aNbPgg59T2D7ze1/o6gfFTgGk0g7dn3IYxk28NcXj8Qgn8Yz/w9jXmMNe
         lXX7aMHOK75x1wkQLdQcF4sRmbClEz9JqeO5ELO/KCdoWaAQmZe7pnoA8SMog43M7E92
         iMH2iz2F7lUlfZQPsI0DK+bF1RpPoRbrGFzO7TnF9qm0pig/auZKU9sVAJ/fJL3CtBac
         fxkQ==
X-Gm-Message-State: AOJu0YxFt3h6yi7cPgk6XCSrv5b/qKpgJqPEWOxza8AAu4WRcjVYyLoM
	TiXAxqOH+xe4C1NfvPNUGZW5TLtZABqJo8iTmm9ZNq9Hegpx1gMCK/AgdWnpRdLE
X-Gm-Gg: ASbGncu+S4T8giY2889R0hd0dzoYLTBDwiocNjDQG80947UJcAB7BgZvnR3BgnUjNJO
	1YwEIK3OrvfZgRN07HMcT0uPtuvQL66qFjBtU/vPaKLDUNOP8F0rcespyrOhpqwTdQI71bCDuSI
	fUDvaZ74Zz672QzuE2GKTpsF6w6LK4BGmb4AqsDgL4gvo6lAju99fUulo+YPolKAjEBYxMTJH9H
	WVowoLUJx41sNOM8OqvVwduO6tKEeHDYMFMSDeZ+uDpdJKVvCF2dldH63lulplYW4VXNLh+OzFF
	AUFKD/GX8hfgymK30qnDRbXz8zPi0aZDqM95/fF+NTpMvnQhUzNfLq8tmCvZacr7RZnak3dpkw7
	ooWQWN6CFdthhO3wN1TZFQQ9Kft3a99qyDmzTRPi2DJwYCMard9tL44FxDhA5AQ==
X-Google-Smtp-Source: AGHT+IFkNWp4DMavtNnzliqHsohdh5B7jc0Nkw/2JWKp+5VyI3s/cbknBGJyb3s4mHGFqzdYd8Ak0A==
X-Received: by 2002:a05:6602:2754:b0:917:664e:c00b with SMTP id ca18e2360f4ac-930b0de69c8mr293399039f.9.1759188279428;
        Mon, 29 Sep 2025 16:24:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5ade67sm5244088173.60.2025.09.29.16.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 16:24:39 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][walnascar][PATCH 2/2] freeradius: Fix service start error
Date: Tue, 30 Sep 2025 12:24:27 +1300
Message-ID: <20250929232427.950644-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929232427.950644-1-ankur.tyagi85@gmail.com>
References: <20250929232427.950644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 23:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120047

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Following error occurred while starting this service.
 Error: tls: (TLS) Failed reading certificate file "/etc/raddb/certs/server.pem"
 Error: tls: (TLS) error:03000072:digital envelope routines::decode error
 Error: tls: (TLS) error:0A00018F:SSL routines::ee key too small
 Error: rlm_eap_tls: Failed initializing SSL context
 Error: rlm_eap (EAP): Failed to initialise rlm_eap_tls
 Error: /etc/raddb/mods-enabled/eap[14]: Instantiation failed for module "eap"

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 97376e916ef75c5bf823fcedbfdee6f03af15f96)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../files/0018-Fix-Service-start-error.patch  | 33 +++++++++++++++++++
 .../freeradius/freeradius_3.2.7.bb            |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Service-start-error.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Service-start-error.patch b/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Service-start-error.patch
new file mode 100644
index 0000000000..f1ec181bc1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0018-Fix-Service-start-error.patch
@@ -0,0 +1,33 @@
+From e97ffc1f820beff12bb8084e6337168a1cd27540 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Sat, 20 Sep 2025 06:50:17 +0000
+Subject: [PATCH] Fix Service start error
+
+change "fips=no" to "-fips"
+based on discussions with the OpenSSL developers in
+https://github.com/FreeRADIUS/freeradius-server/issues/5631
+
+Upstream-Status: Backport
+https://github.com/FreeRADIUS/freeradius-server/commit/59e262f1134fef8d53d15ae963885a08c9ea8315
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ src/main/tls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/main/tls.c b/src/main/tls.c
+index 2a348eb9bb..02a4c24f70 100644
+--- a/src/main/tls.c
++++ b/src/main/tls.c
+@@ -3644,7 +3644,7 @@ int tls_global_init(TLS_UNUSED bool spawn_flag, TLS_UNUSED bool check)
+ 	CONF_modules_load_file(NULL, NULL, 0);
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000L
+-	EVP_set_default_properties(NULL, "fips=no");
++	EVP_set_default_properties(NULL, "-fips");
+ #endif
+ 
+ 	/*
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
index 5abdd97594..99d7d908bb 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
     file://0015-bootstrap-check-commands-of-openssl-exist.patch \
     file://0016-version.c-don-t-print-build-flags.patch \
     file://0017-Add-acinclude.m4-to-include-required-macros.patch \
+    file://0018-Fix-Service-start-error.patch \
 "
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"

