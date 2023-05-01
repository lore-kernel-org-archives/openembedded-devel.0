Return-Path: <alexyao1@meraki.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B9CC77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 18:37:00 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.102672.1682966213587749127
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 11:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@meraki.com header.s=google header.b=DH5naRC/;
 spf=pass (domain: meraki.net, ip: 209.85.210.175, mailfrom: alex.yao@meraki.net)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64115eef620so28682666b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.com; s=google; t=1682966213; x=1685558213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAFaWKG2Sg8jGUMknDcoV059vGiKoEf8Dsy6U5UePTQ=;
        b=DH5naRC/KWwFC6XyIIMswj/H2/Gu2BpYKPXYPwF2SXlqZxw81m1vxLyJxRkkK+WaZ6
         C8//bTEz2XUn7/ZINbLE0krn8n2qXghcKGpTIk+ZEzOOsxMLiUnBPhSKTlAubkXSihct
         XDZ6VzuAEnSA/eS2TY+Ctja2+cISXshR9pzNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682966213; x=1685558213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAFaWKG2Sg8jGUMknDcoV059vGiKoEf8Dsy6U5UePTQ=;
        b=JagdE1mpNJF4eNHY7Z+Gi34s0vHYMG/sydiW94N4fAOJ0g1SGHfBgG2P9OmcrnMnE2
         ZW92brGn1mRGbxJmzFFHYsc9W0NjssNSP//7JQ/f+qWzcV4z5iEvGvCqeMYJVjYLQR2K
         mxgY2oqIh+bQ+RHyY+H2oS95vrNGq6HlU+dbsiiVt+CPaLjOqBQmQYgHa+TGTOohL8XB
         TFELchZUGr06jE8FTYaY0QmIg8GMlzKDW4SQuDsg3Gz05F/DSPPzMdI/jm3e7gAgXc0w
         r93gJcUniACYmouCJOJbqaL/15EPFBMe+eM5O3i/wHw8jD4PQC/j98yt2jPlkL5Rizl9
         lFRA==
X-Gm-Message-State: AC+VfDxtTaFgnZZ9uAHlTyPtsZCHRzFqYAjW74LU1ZKFpleFfi8WNtyr
	gQhDOLb2wE4BMMEAUxeGJGx55TBdtMu7fh2012Y=
X-Google-Smtp-Source: ACHHUZ4A5mUeaT2h3T0SWlICSU9oKXCz+N5O7gXv2AcR6dW2duhyLbWHx0hXutvWzqyw+iBT+Su+Uw==
X-Received: by 2002:a17:903:1110:b0:1a6:6bd4:cd8c with SMTP id n16-20020a170903111000b001a66bd4cd8cmr15922618plh.25.1682966212608;
        Mon, 01 May 2023 11:36:52 -0700 (PDT)
Received: from sdg988.meraki.com ([2620:12f:c000:115:d2e0:42ff:fe54:2ce8])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902b68600b001a4edbab9c4sm14997606pls.254.2023.05.01.11.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 11:36:52 -0700 (PDT)
From: alexyao1@meraki.com
To: openembedded-devel@lists.openembedded.org
Cc: Alex Yao <alexyao1@meraki.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell] lcov: Fix Perl Path
Date: Mon,  1 May 2023 11:36:42 -0700
Message-Id: <20230501183642.1679-1-alexyao1@meraki.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 18:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102244

From: Alex Yao <alexyao1@meraki.com>

Fixes an issue where lcov is using the system Perl rather than the yocto
provided Perl. This causes packages to not be found during runtime such
as PerlIO::gzip.

Signed-off-by: Alex Yao <alexyao1@meraki.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index 0cc8b31b3f..5e8fb938cf 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -59,7 +59,7 @@ SRC_URI[md5sum] = "0220d01753469f83921f8f41ae5054c1"
 SRC_URI[sha256sum] = "14995699187440e0ae4da57fe3a64adc0a3c5cf14feab971f8db38fb7d8f071a"

 do_install() {
-    oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir}
+    oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir} LCOV_PERL_PATH="/usr/bin/env perl"
 }

 BBCLASSEXTEND = "native nativesdk"
--
2.40.1


