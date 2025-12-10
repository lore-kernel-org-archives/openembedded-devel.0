Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B2DD3C902
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:27:13 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15342.1765373229841747080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rfyn/gGB;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-299d40b0845so108473565ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373229; x=1765978029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJa1WuU8bVTyYa3L3a6N4Egt7Y+pwzuJxG84jkyPQAo=;
        b=Rfyn/gGBS9hqt1Q0NhkZeLB+B/zEPY9LpeKL+VTstJbKu8RR1z1Tlq690GRuer4NYs
         a8gIKe8LY2ZOYDrzwN6/f32wIhThp18vy9HDS8xLsTZ0B8o4Zs126rzEISU19pWmi3Ev
         M0WbvcQXn6ldlRnd5hWSINKCek4FDDdfgdwxeGTd8neCjzJoh2Ahkmn7Yuxepr/kDwDJ
         oKR0qFptw5qvHbqHWekpvSLRF/THM+/AjBtdMf4lYe4mn5LT21E3JT3nQDA40xMO+EXG
         OvIDL1znZE5e8FiTISBleUGRK95/kzfRxXI4G8UsfQDXAMQSSFkMdFqHvCBDFUeLNe4U
         FiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373229; x=1765978029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TJa1WuU8bVTyYa3L3a6N4Egt7Y+pwzuJxG84jkyPQAo=;
        b=nZ/WnKX9nK3sE5ttF76fvHbjA15kyC9/X/KQu4xNqRTXjejHCpHOAOjS2dV2mvTZ9i
         O6NYq+ddIhAkv/JEjphm4JvIpQqRS1wTNYMil1hEsX2GXdJMVF3LqpaH1yq+E3EWIMkf
         QDkfzlVw6XIAwS59E3RbQ4e2KSrvhU/Ue33ZB7535KQ6I1Mujq+IoY4OUnlLym1Wf43v
         Y94iZm8JZNcRmiSYXJB336Nasyiv3HAq3CT+X4F7Wmh89haPGSMq/2T/XtSu+1UOK2mK
         KqrzHRBBwegQBMRxcrJKDryWZulKFizs7HqUo0liz2ISe2AMe5HIS067id7j6x3xJyTy
         85jQ==
X-Gm-Message-State: AOJu0YyipH7wTLV+OmbCGoKBO476+o/xA7CePpccedBaKxK0fBRfV6vB
	MJ06Xb5oc2sW5GxRbvOrCe/Mkl6SiVOo0yv2f9shVHgCvt53F/Xm8S83Mqa7DA==
X-Gm-Gg: AY/fxX44Zj9ejIVpLQ9baBSO+8Em84gf72wXYvbGDkUC4dlxldFgeLvCvGkLNynNWgj
	UrMM/I6Wm2L/uHCVj8+7IWHBZPjHJn/fJfBFjQdHHmkMyl3UmhRaX/KHQPFKl65oNV+yw/bMTju
	xRCkE2Pc7+Mxq/yMQG2zOSzYBKOfEvHlQC4QYFIB69G5hNSNthqRnjyNj1aoxz0hZpVm8X7kCLX
	kLJqRo1L5g2UebCOrHWZnjdL8BT6ZyFt67ocmfST0hOybrlCFxNLHy9lFaqNZrKE+mEV5IxarAY
	B4gNI8smrzy0Zwawlz5VcBrpTF4wMcmTQ6Kmn1jLrBKqheWXR8Ngx05t1VtxuzbwdF36NFuExjr
	6Jqtf8Q3NV87+HVlgFnFxcwXAVkuMCs14mOTb2ukLBW8sqBksk91oIZd+gyxlcyY1OqNI4/GzrN
	G3c5N59ilI0IP47lgWrutXge9JnKLB9KAa/Q==
X-Google-Smtp-Source: AGHT+IEis/NDEmt9Yp2dSweAw2/oH3rowJNOtIBLnlDL+24OA+431Nb3IqVdvtAxqoiUwVBk32kJTQ==
X-Received: by 2002:a17:902:d4c2:b0:295:5da6:600c with SMTP id d9443c01a7336-29ec22e3e99mr26864635ad.2.1765373229013;
        Wed, 10 Dec 2025 05:27:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:27:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 34/43] libnice: upgrade 0.1.22 -> 0.1.23
Date: Wed, 10 Dec 2025 18:56:40 +0530
Message-ID: <20251210132641.323679-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
References: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122538

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Add SPDX-License-Identifier for added clarity

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 58974f72d122b78b7d65557e061677fafa83cc3e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnice/{libnice_0.1.22.bb => libnice_0.1.23.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libnice/{libnice_0.1.22.bb => libnice_0.1.23.bb} (88%)

diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb b/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
similarity index 88%
rename from meta-oe/recipes-support/libnice/libnice_0.1.22.bb
rename to meta-oe/recipes-support/libnice/libnice_0.1.23.bb
index 4b932029ee..bcdcf0ad7f 100644
--- a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
+++ b/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactive Conn
 HOMEPAGE = "http://nice.freedesktop.org/wiki/"
 
 LICENSE = "LGPL-2.1-only & MPL-1.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=963cc62096d5412ee9580043babb8b60 \
                     file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
-"
+                    "
 
 SRC_URI = "http://nice.freedesktop.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "a5f724cf09eae50c41a7517141d89da4a61ec9eaca32da4a0073faed5417ad7e"
+SRC_URI[sha256sum] = "618fc4e8de393b719b1641c1d8eec01826d4d39d15ade92679d221c7f5e4e70d"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/libnice/libnice/-/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

