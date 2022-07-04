Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FE4C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:59:01 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.73016.1656946732509818077
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AydnajTy;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id c13so12010759eds.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RKlmXwgHA1hw2w7Cd2lGTCwj/yPlwyC04w+r6MJD7Hk=;
        b=AydnajTyYjs0nea9k16Jw3923akIod2ijcCFSA8jHeo2IcZ83wMByoOxHffN+kiwyW
         jStHdNRbvy64CbSWpwD+YiRlg7UEsI5b+dKMVUuwdvhxsKBZlNbPjrQndxc174tgNDG6
         wBtU1rHtOocjwOjVyyj7GAapG5T7DycEo7frpTW3N4JDVw35qIrge9QhxBUzV7SFW9IF
         f6XPonzPhZRGXfvftCLcw2nSM73jdlJECqRkW4oQcVKT0aOFiiF28R3X5zAxQOjpx/l2
         5gZJjH2loMX3LiniQKKztXx7qVaExAxmnF8uVQEkzJrEKKz/2uNJck+VyK4nDhuW39ge
         bygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RKlmXwgHA1hw2w7Cd2lGTCwj/yPlwyC04w+r6MJD7Hk=;
        b=n+FUJ1fq0oP7e/arn21eP0R3hfAAhPlGEbsAA6R3Kuc3vxn9InUCFf4gRTd1N+4BeV
         3oTx2JayASgBBFao7QrEqzrFFXJej1CcQTsLEwZ1YvLdfWmIKRlKtGqS7XrgpbSyMkKV
         vP2M7r0OciF8xD8k4vIj4dltKZZ2kRSx6BkQUdhgLM6Ov7ai5W5A7bJw8GavyhnSHkBq
         AOp6fZ0iFU2dDEiRYveyXgMM5RJX5P5exFx99hj5TnMZcKaKClI6b4CRIJ+uHy6m3oRN
         2wSZglWxr0wU2M4vJmSN9ieJBu9hJs5PkXuWgTqIeFwnAKc9Rtroo7a4WHR7OmCX7iWb
         n1Rg==
X-Gm-Message-State: AJIora8zM7W6RAHJ5+jE36zfjPlK32Z0U+CQcfY45T0qrinHLr0Nx81h
	r9uZglpyK3b4+9iMpQBVuMRgh5F9JDQ=
X-Google-Smtp-Source: 
 AGRyM1u60Hppr9JFbRsxau3PMDnuVGubbhn3qOQoxV2563VQKeCgaQpbLf9RvCltAbMuVlNC2u5HFw==
X-Received: by 2002:a50:eb45:0:b0:437:7686:6048 with SMTP id
 z5-20020a50eb45000000b0043776866048mr40938107edp.264.1656946730661;
        Mon, 04 Jul 2022 07:58:50 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a1709063a0500b00722fadc4279sm14254864eje.124.2022.07.04.07.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 07:58:50 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-networking][master][kirkstone][PATCH] ntp: ignore many CVEs
Date: Mon,  4 Jul 2022 16:58:36 +0200
Message-Id: <20220704145836.87886-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 14:59:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97690

cve-check is not able to correctly identify many of the patched
CVEs because of the non standard version number. All the ignored
CVEs were manually checked with the NVD database and deemed not
applicable to the current version.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../recipes-support/ntp/ntp_4.2.8p15.bb       | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index fe2bd0773..a30f720bb 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -29,7 +29,31 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
 SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
 
 # CVE-2016-9312 is only for windows.
-CVE_CHECK_IGNORE += "CVE-2016-9312"
+# The other CVEs are not correctly identified because cve-check
+# is not able to check the version correctly (it only checks for 4.2.8 omitting p15 that makes the difference)
+CVE_CHECK_IGNORE += "\
+    CVE-2016-9312 \
+    CVE-2015-5146 \
+    CVE-2015-5300 \
+    CVE-2015-7975 \
+    CVE-2015-7976 \
+    CVE-2015-7977 \
+    CVE-2015-7978 \
+    CVE-2015-7979 \
+    CVE-2015-8138 \
+    CVE-2015-8139 \
+    CVE-2015-8140 \
+    CVE-2015-8158 \
+    CVE-2016-1547 \
+    CVE-2016-2516 \
+    CVE-2016-2517 \
+    CVE-2016-2519 \
+    CVE-2016-7429 \
+    CVE-2016-7433 \
+    CVE-2016-9310 \
+    CVE-2016-9311 \
+"
+
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.34.1


