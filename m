Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.2662.1624825342698675771
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oA0kNiKE;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id y4so12278520pfi.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Adu96gUAhoNnsTf1Th20ZEmwXksK2+UIeEN8GgJlFyA=;
        b=oA0kNiKEOsjmk2U61Px/fRGlBeQaaxLZN114PL6mXVndAAq9CCMTS3hT9mERx/lLNM
         a3f1D1G2MSQs5W4m36eKRTbTf39Ujy5iV0rIGddF7UmOIaNPHoCyaheM7oPgT86/N3bQ
         +8OiK8LZ7hWbFMEJxUvbgZFXZwyWWskOoKo4vDns3ckUQd/9altw1OCkNPY+9HtKEPCx
         DcIW2K46GEoeVqnw13ywhiJ/oEyON0m5KYjRR+9Cv6l5W0Q9AEXKxXUvtPp57nPWb0zE
         0vJdPgGCVJ7qek9p64YTeqdF5NMyeoIp2LziiVB8MXR1I0LUpUeTwspHkwa9RQBkicRI
         wDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Adu96gUAhoNnsTf1Th20ZEmwXksK2+UIeEN8GgJlFyA=;
        b=tV+O2yzn/AxV30btPUKE6GrZUXGUhjoidFW3nIY9Miywqmpi/TXu8IFIrQz8aQ26cH
         KxNmQxxDwd70K9jHPul7tLenSup5oFrVq31pTHotBf7aM7Dxg2NycDtuDF3iTOAthBi/
         PaLbrLovAg++6Is/msM59DpZfPn/NlP99uXHS7UWic87vBudRxrMjYdJbH9hCJtQGPhx
         aFzbvcJlq4EdpKiF9yggN377mgtluA5cOCBDG5Hd6/97FP7RJdn+9Ir3AitiXzMvZSGQ
         dVuZPdpLsle0y/89iveu9XRLoFAHvn08R7D6oaWC7vHmbXuJ7erCE1YpwS0HZ7gPONIP
         26+A==
X-Gm-Message-State: AOAM5304FU9wvAoZxMTFz+4iYb9iblsgDy/d+yXXPHClkv6NghCrZxC/
	sF13eYg5xoArhOF09+9xblFMgdMOfsPQeA==
X-Google-Smtp-Source: ABdhPJw4QzCgWkXu0opzF834f749qn+CenpU5OPF3K5UbYAMfyk2s57TSc5D+Zkt2Jj52hUk1GEFfg==
X-Received: by 2002:a63:e948:: with SMTP id q8mr20285141pgj.52.1624825342102;
        Sun, 27 Jun 2021 13:22:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:21 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 04/20] net-snmp: upgrade 5.9 -> 5.9.1
Date: Sun, 27 Jun 2021 13:21:59 -0700
Message-Id: <63306c460d4220ccc3a45da9636ec248f9394d42.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Refresh the following patch:
net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5411629c443d0d64b6d10f77d0622626e31a789d)
[Bug fix only update - AK]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ....7.2-fix-engineBoots-value-on-SIGHUP.patch | 19 +++++++++++--------
 .../{net-snmp_5.9.bb => net-snmp_5.9.1.bb}    |  2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.bb => net-snmp_5.9.1.bb} (99%)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
index da6d80ef4a..022eb958f3 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
@@ -1,6 +1,6 @@
-From b6a3d6c8af35f1ef27b80b0516742fce89f4eb29 Mon Sep 17 00:00:00 2001
-From: Marian Florea <marian.florea@windriver.com>
-Date: Thu, 20 Jul 2017 16:55:24 +0800
+From 1e3178835217ba89aa355e2b6b88e490f17be16d Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
+Date: Wed, 9 Jun 2021 15:47:30 +0900
 Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
 
 Upstream-Status: Pending
@@ -14,17 +14,17 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/agent/snmpd.c b/agent/snmpd.c
-index ae73eda..66b4560 100644
+index 1af439f..355b510 100644
 --- a/agent/snmpd.c
 +++ b/agent/snmpd.c
-@@ -1207,6 +1207,7 @@ receive(void)
+@@ -1208,6 +1208,7 @@ receive(void)
  	    snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
  		     netsnmp_get_version());
              update_config();
-+            snmp_store(app_name);
++	    snmp_store(app_name);
              send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
- #if HAVE_SIGHOLD
-             sigrelse(SIGHUP);
+ #if HAVE_SIGPROCMASK
+             ret = sigprocmask(SIG_UNBLOCK, &set, NULL);
 diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
 index 29c2a0f..ada961c 100644
 --- a/snmplib/snmpv3.c
@@ -41,3 +41,6 @@ index 29c2a0f..ada961c 100644
          engineBoots = 1;
      }
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
similarity index 99%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index d9040c1647..d03961ab37 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
            "
-SRC_URI[sha256sum] = "04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071"
+SRC_URI[sha256sum] = "eb7fd4a44de6cddbffd9a92a85ad1309e5c1054fb9d5a7dd93079c8953f48c3f"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
-- 
2.17.1

