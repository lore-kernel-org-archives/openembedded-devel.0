Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391A8F46C54
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:50:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58201.1775490647301309947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 08:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cNhh/6pN;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso57029105e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 08:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775490646; x=1776095446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zkjCWwt4B3b1NLLGyJ7cMyrHQZRKNvzNfgUl1rrTlR4=;
        b=cNhh/6pNZeixJbKjlxsuF/oYrHC0j5ZvM6JOB6YXI8bm2QbD9Kq0JG79LunwePU+ys
         vwZAukw2A8nlycu3SC1I4TioSqkIW0hh4rA/U5VlrNEHFCy2ny4rBjUgkIJgtes4sgYh
         ZMeOuTnVo4ntgPDkuzK50HEUml0g5gq931ouDSatQK7/RRSxli2YZbweC7NLEFfekUAc
         CncStgkoqhM4glz/bQFPr+RVylKyxXI49TMFUYvdjL5K1+gOTIkWHi/xQCSW+Ao09OZd
         XM+3XOoI1yNCH1GkOdJq7nXU3CALCwOULfQSwFF8QyzzuEv6IQb7Fl47L4eoMOp75txv
         mOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775490646; x=1776095446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkjCWwt4B3b1NLLGyJ7cMyrHQZRKNvzNfgUl1rrTlR4=;
        b=HmBl+vl6ZLeBrjY+YhEOhI2iHEnzaiLoAfLS4LSBxdrm4+LWIZlcTnvV2KnSIlyHm1
         4Q+KD2wPUw9tCwYzHScvd5jzohpNpNh+zxQdFjK+wV/A+JwKvsAv6EDfyrqgt4wiQQcC
         lEgbPM1JkuiLYokg7Adn/jBz+CqSWBUctsZTd7P3MzagqdMm4Xs9AilLINR+33C0PxV2
         ELFktvNxGIgng4lxNxY+IsIavVICeSEkQrEDG3abUeSjl0jGqGKiCQBpSQrIaJGIJuYY
         PPiQD6Wc4c3oZmnLya87c96zhsPXDvN1akeehdufYf6paVCEoCUtNiNfn2DzxbaLDcZn
         gOAA==
X-Gm-Message-State: AOJu0YymT1HcyerxEvsHI1jhcfnjpPOSLEqX+G4/U3mbikHH7tD33KdV
	VEJV3kcSo28qgMJhNF6AYVhlHiu/X3jDYizbcAdVm4g7FfApmfwcBKEobvbYHA==
X-Gm-Gg: AeBDievbfvSra6cFYXIceiQ/dzwPqOhUDHZu6MyZRrzhyEsPEhsDbWb/3YnZeEu2apA
	8NYDxrvmnTJrdFtls9suWQQw4X+csvsJBDDEz2qCKfSWFosHplSvAtSWWLeAbQYNnzS8o79PbJ1
	TfpP76Z35ASKxfbMhRFXas3Kj2GuKOfGG3AnmwLcrSVI3JAmlSrLd4iM9omFWNRr/7O0rF5h5j8
	JpKEB8Tnp3e8dElMdtpdBKdGtXkiNQwEV/CoNE+nLdu/ZgOJ56FgMga6Ltogt7NahpXgxHLwTY2
	NuGjKXpZ/TKmsoS9Gx9QLcsf+iBw1XEvIr3tYqhfB8UTyTCgXm/IKLa5RBfoqUSOR3RIEtQXyfQ
	wXkn1Z2fUMqiwAaGiZvIAtqCJMVVxKQHF3hSsMGApImVQ5qhjIzRDa0++QRdoXj/eh/vEZ5tWHN
	OiziGl9K75rNjZV1f7A8wB
X-Received: by 2002:a05:600c:8710:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-488996b0589mr219334785e9.5.1775490645288;
        Mon, 06 Apr 2026 08:50:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm871341915e9.2.2026.04.06.08.50.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:50:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] tinyproxy: patch CVE-2026-3945
Date: Mon,  6 Apr 2026 17:50:43 +0200
Message-ID: <20260406155044.3662500-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 15:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126051

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3945

Backport the patches which are references by the NVD avisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-3945-1.patch | 29 +++++++++++++++++
 .../tinyproxy/tinyproxy/CVE-2026-3945-2.patch | 31 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  2 ++
 3 files changed, 62 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-1.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-2.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-1.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-1.patch
new file mode 100644
index 0000000000..99c4ea705d
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-1.patch
@@ -0,0 +1,29 @@
+From 245946bb789c8fc0e4758c344f735a5d53827dce Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 12 Mar 2026 14:26:24 +0000
+Subject: [PATCH] reqs: check negative length values when reading chunked data
+
+this could lead to a DoS when a legitimate client reads from an
+attacker-controlled web server.
+
+closes #597
+
+CVE: CVE-2026-3945
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/969852ccdb1d19d7ed302f0e1d324661be641e0a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/reqs.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index a562c68..94ce767 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -613,6 +613,7 @@ static int pull_client_data_chunked (struct conn_s *connptr) {
+                 }
+ 
+                 chunklen = strtol (buffer, (char**)0, 16);
++                if (chunklen < 0) goto ERROR_EXIT;
+ 
+                 if (pull_client_data (connptr, chunklen+2, 0) < 0)
+                         goto ERROR_EXIT;
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-2.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-2.patch
new file mode 100644
index 0000000000..3da30b54eb
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-2.patch
@@ -0,0 +1,31 @@
+From 8f12872b8e50fe22be0a65ead260ebbedde905cd Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Sun, 29 Mar 2026 16:48:54 +0200
+Subject: [PATCH] reqs: prevent potential int overflow when parsing chunked
+ data (#603)
+
+follow-up to 969852ccdb1d19d7ed302f0e1d324661be641e0a
+
+closes #602
+
+CVE: CVE-2026-3945
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/bb7edc4778041b3bc8ad7fca448b67d98039cc7d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/reqs.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 94ce767..7aacfd3 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -613,7 +613,8 @@ static int pull_client_data_chunked (struct conn_s *connptr) {
+                 }
+ 
+                 chunklen = strtol (buffer, (char**)0, 16);
+-                if (chunklen < 0) goto ERROR_EXIT;
++                /* prevent negative or huge values causing overflow */
++                if (chunklen < 0 || chunklen > 0x0fffffff) goto ERROR_EXIT;
+ 
+                 if (pull_client_data (connptr, chunklen+2, 0) < 0)
+                         goto ERROR_EXIT;
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 745c55bc0d..56e3296066 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -7,6 +7,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://tinyproxy.service \
            file://tinyproxy.conf \
            file://run-ptest \
+           file://CVE-2026-3945-1.patch \
+           file://CVE-2026-3945-2.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

