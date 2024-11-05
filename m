Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED395D2C115
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:21 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.19638.1730817432547787062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfF00c9j;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea051d04caso40898137b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817431; x=1731422231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O1zjxkXDtIr6wHO9CLeeTMbOFtLxx37Q21QSIZ+6/M=;
        b=lfF00c9jF1pDnh1DBUAcvYNsHIj+YE0O+BXxxNix3WAKKwGgHBFOni9VTTj5qZquV9
         oSfhENGB1vFvlfgBWAKFhWDooy5KCJ7Ir0lP0Xqs/luDXAWABRKSzvf9k3TWApQgLNPb
         FUrrtqJgdub1wfUpVcXdFvLFaaarFoGBeZBQ9o1UQXsgIUFk9CcanoSwJ7Pk/RENY+5K
         m3+CqO6FG64hSoRcncYfTSZRc6nnJw7s+io3NEQga7Kt+zTjYywD4A8tpMlGtI8XeoNI
         7PTqImNK83Bnk6y8fMk2FfGreXEYQrlIMxAg/DW/wPZ1GmvBdBkbHL7g2mlpjBrPP4tP
         cWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817431; x=1731422231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/O1zjxkXDtIr6wHO9CLeeTMbOFtLxx37Q21QSIZ+6/M=;
        b=QOjQFYveFSernTRB0gtFI+Exh8UsBffSrhizfoDBjY3TXzfVoIHzabcXZzYJiV7SAP
         G+7IS8zsgsmWLRTO5O7D6hsULlCKrzhrwAhsoHRnExL88U9DYBJ0YI1uRBxWBmwfSrmz
         yY5U+4AGQFf47viod/p6Qjo7IRF/R/i+R8PQ0Uq7v5UYIwm4DukSDvDENEi/u59Skmh2
         YrHlPzARkTJJVwAHRuv9dqn5hSdHjmZKPi/RRYexCQtgcoLwwEZqllrLSRnOcRhcJM5w
         pHX40BQyhdSuI5H5tVnJYa3Rtlw9obop/4tCSg6Bt0EkOn7Uy4FTdjcSOHqWWkxak+s/
         ynTQ==
X-Gm-Message-State: AOJu0YyZ3KOFDRGV2PaPmYjvZnypiTgXYgRh2vBv6uJV0CSg1Gyjx+UT
	MQT8we8So2Hvbo3nQS17qy3pI/dfkWlG4kDoPQnHu/AkGdoWhpx5eVIXsQ==
X-Google-Smtp-Source: AGHT+IEkQ6AUBz8OgUlGsSowalnqXwfLyeXS8FNubNHpX9rq4hYLwBxMwwL+cpmi8KuiYCQ8Gyi4qw==
X-Received: by 2002:a0d:cdc4:0:b0:6ea:7c35:e2ab with SMTP id 00721157ae682-6ea7c35e56amr77214457b3.15.1730817431554;
        Tue, 05 Nov 2024 06:37:11 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 69/90] libhugetlbfs: Fix contains reference to TMPDIR [buildpaths] error
Date: Tue,  5 Nov 2024 09:35:34 -0500
Message-ID: <20241105143638.2301245-70-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113486

From: alperak <alperyasinak1@gmail.com>

ERROR: libhugetlbfs-1_2.24-r0 do_package_qa: QA Issue: File /usr/lib/libhugetlbfs/tests/obj64/dummy.ldscript in package libhugetlbfs-tests contains reference to TMPDIR [buildpaths]
ERROR: libhugetlbfs-1_2.24-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1c346f1829e032c2c924b1aed3c5997ca91c7fa4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index aa1c0ddd5e..d82e03e81f 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -71,6 +71,7 @@ do_install() {
     sed -i \
         -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
         -e 's|${RECIPE_SYSROOT}||g' \
+        -e 's|${S}||g' \
         `find ${D}${libdir}/libhugetlbfs/tests -name dummy.ldscript`
 }
 
-- 
2.43.0


