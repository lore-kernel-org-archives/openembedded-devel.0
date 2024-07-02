Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB235C30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 18:09:10 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.31837.1719943742381062597
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jul 2024 11:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OvAH7J/i;
 spf=pass (domain: mvista.com, ip: 209.85.219.170, mailfrom: sdoshi@mvista.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso4666490276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719943741; x=1720548541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+4ye4Km6ARtXLa3H9dFO3JSSZEwOXTU6maW2GKQ5F8=;
        b=OvAH7J/iOFsT4WmDaiKAade82jGzsx6WyWUoBNQ2vgCJv1Jl+J6dCJbF75CTNpk1KR
         0Cof+920lpwwewDoVmfmJZXgn9fJvtGjwfQ0jkLx6O9eRd3nDa37KQwDfDgTXQ7Iz82K
         i3+JL3H+oM0pd6X+lyFVDrST/oYdHMOVaniMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719943741; x=1720548541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+4ye4Km6ARtXLa3H9dFO3JSSZEwOXTU6maW2GKQ5F8=;
        b=NVhxriC+5lHSZvb51Nid+vEmsztdZHmSkDUSVw7V1pRFh9I2LStElOod5JTQ8hb1Yt
         T4YIRzOfNrJkv4epFInrYfn2KPZSwKStcjQxZm967dCmPC+aIQzckapoKWNlxp1d1SDu
         FXPq1hV82XUIPyjVebGHo70f3ycw8MP0Bfi2i6O/viqXBOa312xxTVuh0TDP6ZWPQtuu
         LAUCPX1M7ORlY0yFlJ9Z1WapFu4kjOPX5E8ruwiQKmWgrO6rrLmRXGBHKgXt2JlitEvM
         S+8klFr6/zdPrVbAqpr5IN1AEocZFrwtmBkD0e/VD36xr9vVwovQcWpXAOax8bg62na0
         PrwA==
X-Gm-Message-State: AOJu0YywpZJsLD3ufCWb6Cu+ZaNzDoZboGeWHiJYjYo707YPNAeEXYZa
	Lzl/DmCoXHJQoPGyafEuFYTKBkt+ooGqI6kXGP8YVSvxSC7QbtJX9nyGnc6qvJbNWmuxIaVYJpI
	u
X-Google-Smtp-Source: AGHT+IEQFSvWNbo/h+3tBAa1T1b7m8m9JpfMjTFOb40XjseYrZU5CK7yrOO+62kJvP8vvdDeUqJQHQ==
X-Received: by 2002:a25:ab81:0:b0:e03:5d43:d43a with SMTP id 3f1490d57ef6-e036ec45466mr10480592276.42.1719943741296;
        Tue, 02 Jul 2024 11:09:01 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.44.151])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e039f69bd13sm261088276.19.2024.07.02.11.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 11:09:01 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] apache2: Upgrade 2.4.59 -> 2.4.60
Date: Tue,  2 Jul 2024 23:38:49 +0530
Message-Id: <20240702180849.94880-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 18:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111216

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed by upgrade:
CVE-2024-36387 apache2/httpd: DoS by null pointer in websocket over HTTP/2
CVE-2024-38472 apache2/httpd: UNC SSRF on WIndows
CVE-2024-38473 apache2/httpd: Encoding problem in mod_proxy
CVE-2024-38474 apache2/httpd: Substitution encoding issue in mod_rewrite
CVE-2024-38475 apache2/httpd: Improper escaping of output in mod_rewrite
CVE-2024-38476 apache2/httpd: Apache HTTP Server may use exploitable/malicious backend application output to run local handlers via internal redirect
CVE-2024-38477 apache2/httpd: null pointer dereference in mod_proxy
CVE-2024-39573 apache2/httpd: Potential SSRF in mod_rewrite

Other Changes between 2.4.59 -> 2.4.60
======================================
https://github.com/apache/httpd/blob/2.4.60/CHANGES

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../apache2/{apache2_2.4.59.bb => apache2_2.4.60.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.59.bb => apache2_2.4.60.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
index 7740b4e33..2786d0e13 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e321323"
+SRC_URI[sha256sum] = "7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.34.1


