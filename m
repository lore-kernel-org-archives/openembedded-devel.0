Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D57CDD0C6
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.21783.1729612089566123071
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+56lqNO;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2e508bd28so44591507b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612088; x=1730216888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC03LYAv5Y/Ko1eHx6hMorSJa4AXJF+p3l48bR3xb8Y=;
        b=C+56lqNOuFEph2DXpxdKCCKdJcDKeN6tcZZZcS/vnY3o4m+cVuLWl8Ce6Rc11YPZz0
         THq7WupE46TDd7+1RzTAhEjTDruafmbveS8ykPSyC0Wwb61mFgWZLaOgwP/ANEOLQI9m
         zUvYVc0ZxUMbrpU2L5yr4e77KLks8rL5478DtHg8akh2IQq9fUg6zg1nr7zl6ye1t9p0
         nxt/Qt7uA+bi5ekAqKgW/DgE3JtYDo/8V2P1ceaVXW9dSb6tuPfJKiBApBKetnQvdumk
         OdEADQlU8UVtCycaIB40tJGVgk+d+WBced6eLsGN2nVIepfjWAaDSYB3dLFi212DdqiH
         8R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612088; x=1730216888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rC03LYAv5Y/Ko1eHx6hMorSJa4AXJF+p3l48bR3xb8Y=;
        b=nP7BkfZYhqO7n6pReABjLRSF2PfDl9Gs07NnFixns6CW16E+89u7zxgfE6JdQFucTl
         GL5Br20eRmAAG6u+hy91RszeBzic30Q7y1hoQgfk/stpM6p3VWJfEPWOK2nZ7Irp5Lm8
         LHmlok8+ABpElTlztxYjSYCQDL5sGelvlSrAXi1GqjeDZ/wblGI/NZPPpz/pc0pr+0v4
         Mvoi4glyK1fily2VSJp7tYD9ZCuOVEvnzPIc5jDhiVBQRA2rV6sBcWZxMCA5NxVy7qHV
         uT+9ZHBIB8uBQxdoosR9NtEmqKKbMS/VkAICHL3VMRdMEKCRR4TH0TqKa5kjttI6OLF6
         +mYQ==
X-Gm-Message-State: AOJu0YxRH5/82c4S9pC9pbM5g6HqdXbl0ydibNv34nEFaLH91Dgu8t47
	CJJfk5tvage0oZ/xdNdV/iUZuK5lzPiSF5UG376E2uM3dBNzUC1GD9+iTw==
X-Google-Smtp-Source: AGHT+IEMYhWapICYrbVQY1OQQyFiYaUE+YBBokvPheLOM1QAjGt6ECFs0/zxqp2hq+ALgbFwObb1Aw==
X-Received: by 2002:a05:690c:6002:b0:6e3:31ee:23ab with SMTP id 00721157ae682-6e5bfc896aamr156298907b3.25.1729612087942;
        Tue, 22 Oct 2024 08:48:07 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:07 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 21/46] libimport-into-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:39 -0400
Message-ID: <20241022154729.20331-22-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113112

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
index e88d60d13..690bbe92e 100644
--- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
+++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
@@ -17,7 +17,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=209;endline=223;md5=3cf363f1e405dea6db2c6cd0ef23680c"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Import-Into-${PV}.tar.gz"
-SRC_URI[md5sum] = "70f2f3b08a5b706ee382a8448c346cb1"
 SRC_URI[sha256sum] = "decb259bc2ff015fe3dac85e4a287d4128e9b0506a0b2c5fa7244836a68b1084"
 
 S = "${WORKDIR}/Import-Into-${PV}"
-- 
2.43.0


