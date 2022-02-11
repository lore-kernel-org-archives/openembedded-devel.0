Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A99C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 17:46:32 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.10533.1644601591608872257
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 09:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LCW+f08+;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id qe15so8736336pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 09:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7pk39MZ6PvNMZQAJDlGZZNuGcC/dvbDDYX4MBvlCSo=;
        b=LCW+f08+UtkVMMFcTWZUZbmxQrYMRHmT6E98IbUK+Y2O5zFLUgSz06M99Cm9jF/i9p
         3guBJE1ti1wxXFqdkGbSMKJC7s9WAfUuicmaP9KlZPK8UYJxe/ojhWhW/7eb+JBi6OMv
         FqVAuY785LQtdx8Gc3Ka0QSY20oPjNpWO+o3mWb1qxBm3CwwkjJSSb2eLwNlqYQ/6CBC
         8cwzlaLswCLtteV/t3OiGX/CXNFEqdqFp4NM6cYO2vJNMB3H/uggZnQZ7mO7PplhJkB5
         VnVMJt/UV4T4Xt3Rvw+WFaAweJbtaHes6ps0cFbNldL3YfjjNvOeFvq4tUSphZqYwqST
         x+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7pk39MZ6PvNMZQAJDlGZZNuGcC/dvbDDYX4MBvlCSo=;
        b=VaHnHEbhRJ6wrfqsgB+Fih6fuvNmPEdYKNTOxsxkwEDWyNhZdDTCn5XX5m6eLnBF1v
         Q3M661hdg5OeG90uAA53XKqt/3Kz9eQgTzj1gV7BPhSWgruMNlrVzKpWl/dKGSxZF7pR
         cbMDJSj7TIpXWbu7uzzAg/FTnel7gSUnw/DYIBpQqWgIqnQOD1k07DsHyj2NdkCJF9qx
         F659lXE35rB62rt/p6DA80EdsCZwjpR5CX5IE47JwznjYuC3VF9xdFBCGQrHXEDOGiR/
         tyvKR+1i0o2fFtwm6x/VZrMg20hFF6RksUwGbPReYKCWfyMj9yryWUcV6OzugZb98EX4
         SDoQ==
X-Gm-Message-State: AOAM531Vy4N7DMQdC1kPd2WLm+ZAfSl05WA2gU950JiZva7lXiXS3+fN
	Yb3QboEv8oJ3T9WZ7D8uyR30gUFwX/Vo/w==
X-Google-Smtp-Source: 
 ABdhPJxltMn/hU4xHblwKRIg16N42jvKH7D7OQ7uEW4pXb+X1LgoXduKFrP90FtjrggNGDpGkwXJSw==
X-Received: by 2002:a17:90a:e507:: with SMTP id
 t7mr1506703pjy.131.1644601590779;
        Fri, 11 Feb 2022 09:46:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 f3sm28892557pfe.67.2022.02.11.09.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 09:46:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libjs-jquery-icheck: Use hardcoded SHA for
 srcrev
Date: Fri, 11 Feb 2022 09:46:27 -0800
Message-Id: <20220211174628.2525008-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Feb 2022 17:46:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95299

Using tags is not good since it will fail to fetch with no network
turned on

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
index f14b619a94..31c3534b88 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
@@ -5,11 +5,9 @@ HOMEPAGE = "http://fronteed.com/iCheck"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://icheck.js;start_line=1;end_line=8;md5=404078d7de9f05ed64d364274f790055"
 
-DEPENDS = "virtual/libc"
+SRC_URI = "git://github.com/fronteed/icheck.git;protocol=https;branch=${PV}"
 
-SRC_URI = "git://github.com/fronteed/icheck.git;protocol=https;branch=${PV};tag=${PV}"
-
-FILES:${PN} += "${datadir}/javascript/jquery-icheck"
+SRCREV = "c8c1af84e4b90b4aea31466aad09bf877619e943"
 
 S = "${WORKDIR}/git"
 
@@ -40,3 +38,5 @@ do_install() {
         install -m 0644 ${S}/skins/square/* ${D}${datadir}/javascript/jquery-icheck/skins/square/
 }
 
+FILES:${PN} += "${datadir}/javascript/jquery-icheck"
+
-- 
2.35.1


