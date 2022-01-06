Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E32C433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 10:45:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.7097.1641465935607090738
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 02:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=6vOxYnzw;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id o3so3888696wrh.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 02:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDx0EmG+GIU/4dMEmefaREf3oz94i7DELT5lIDq3VN0=;
        b=6vOxYnzwYLSfPumc9j0pxaZ4ERCjo0ZMsmyUy8Q8Nwfm/EhDGkBa5J2Vb1OM5Vh6W1
         c8q5YEXRD49j8xuYc7zxAdKHCUbW4IWXfpmJ6CQaKs/VMC1k62A1lsXajPj18igwlNTM
         tiWtC8RYuCenjMC0OvsmFOoIEgeBYmwkcnxfxrw8wNzg6eeQf6eg8eLdFTxGs2iduT+Z
         /eSA/K+wNdfBkguMzDrP4bMWfENQTzMGwoBuxpw+Gr5GcEnTebwhHmg3rhowMbpZap+v
         gznMlLYeQC3MkumUiHu46SFe0p6deIk8vCl8jxYBc2R2/rrykI/tHnwqQyOZRCC2ulnN
         y9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDx0EmG+GIU/4dMEmefaREf3oz94i7DELT5lIDq3VN0=;
        b=FKnzN0/nMjUdwzc3WiQsq0ibycO2JtYVyVz7sfAJ0ArJhdGJpN2kRm2sxuNiiosNmk
         eQhwn6w/2BCacmlgyxNdZFUUOgV2KkN/rljK1xIIZXFuJ6Cw+AAcBq6HnAdQdZ2ECSzo
         Lj26b4MOlR73xPkC4iw1s15KbPQWpRz+FssoNvsh0TLH5iHJcocKl7esjENfeRmCOamu
         WfhKfbcgG7WjNmIEOQYREipvplrc9IQzuJsoVC1wvxpo5pvv3UvUk7zMxhl8VKx2n0iO
         04ijdRTj40PjIHb+rRs9YGkzhEzxoIQ5EfFQoPTcV5iBTOF3eeWHjjKHvccafF19j603
         ki5g==
X-Gm-Message-State: AOAM533X3AcY7oBD0ownw+qZIpUzQ9vQ7syeTTouQuX3eEHSUJyLLpFK
	yMOtHnsXog9ArXcPscXX8rjm7A==
X-Google-Smtp-Source: 
 ABdhPJyOdk2p0EzpJ8JXPYaMoG3QAtyMiPM/jkYhVvWMri8s9VhlN63/tZZSq0hBnzIesaae7LH+pQ==
X-Received: by 2002:adf:fa81:: with SMTP id h1mr27349468wrr.19.1641465934098;
        Thu, 06 Jan 2022 02:45:34 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id
 q8sm1708980wrx.59.2022.01.06.02.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 02:45:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH] cmatrix: new package
Date: Thu,  6 Jan 2022 11:45:32 +0100
Message-Id: <20220106104532.204464-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jan 2022 10:45:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94671

This adds the recipe for cmatrix: a tool for displaying The Matrix like
codes in terminal.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb

diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
new file mode 100644
index 000000000..3edf8ea90
--- /dev/null
+++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Terminal based 'The Matrix' screen implementation"
+AUTHOR = "Abishek V Ashok"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "git://github.com/abishekvashok/cmatrix.git;branch=stable;protocol=https"
+SRCREV = "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+DEPENDS += "ncurses"
+
+FILES:${PN} += "${datadir}/*"
-- 
2.25.1


