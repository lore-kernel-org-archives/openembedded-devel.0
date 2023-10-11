Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F17BCD6E4F
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 09:07:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.12382.1697015227457383928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 02:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EajEjz/c;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-693400e09afso1734946b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697015226; x=1697620026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HyRa2Fn/XSWbx2Ie81GNPDveqtoxSQ8J+YjmfKD6Sw=;
        b=EajEjz/cGqZVWn4FDaWjvfjB3L0Bmuy5Yi0XtBpDYppoIvCXkUVe+6J/+16l84DdfN
         Yck8lYgT2qaOm/t8wums7rjlxDc+JKnOUIY7wS/k6bvnHEfnXUyp/foqznXJOtb9nLiw
         xDhd14gCTb50/pBM+y1u3zra835kj0H5gUISheGqmPydOavhBFkvDOO6B4quZinsA56w
         QIpyqlY5vNThMic8cqyuQoBaItIDe7hdhB4nPsAL8fxWzYch6yGn+IDxmreK3u+FRF2S
         ualZgPzUFKyEmz0cPvEGwvfoDHe91PSuvFld/i/L0zhQF493Ag6OCOCmhp+OAahNH26O
         MDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697015226; x=1697620026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HyRa2Fn/XSWbx2Ie81GNPDveqtoxSQ8J+YjmfKD6Sw=;
        b=C8msW1ifoFvmzZKF4W8FHVaFr3r7eE3ssqESAE3eZAZ3bwNCwqO67pyHIlwkab6Tkh
         bmTw3OpLKguUh7FU1rRzmABr/SXBnHN93RIoOeByfnSD3JpECoPW9U0y+NO/VHOaIdcB
         4YfLbjipkB7ph4W2eCF5c/0RvbDC1T+GXXKQgCqR36lKfPM0KtqvVXDnEPVrzWt0vnTj
         xqLAj4rd9pf0UBoITnX4W3nGTQUeZaU67Ex3FQ/PydFvUhVlEEmSsj0YtZGAT/QyXGWa
         3IgwmuB1vGmrg00nHZiWdFq6ePd9LE8ZGMtTJB/m/qGYsmh4I89yYJ8k7mSBL6xM8ar7
         CJkA==
X-Gm-Message-State: AOJu0YyVYe+AOf7E6BwgFOZs0+D34G/YUDHYFsQic/FymmSbuz9lLEI4
	GMAv8s/amvMENQlkDRa3kzqqTrd9hD/SOz2V
X-Google-Smtp-Source: AGHT+IFnz7aUA8jROZ4RNJF7GNtKIzVD1yOH7BeM8uhF8xcr0fUwULvxbV5EHNQnuhB1okQuwtjEMA==
X-Received: by 2002:a05:6a21:a5a0:b0:15d:a247:d20c with SMTP id gd32-20020a056a21a5a000b0015da247d20cmr27060800pzc.6.1697015226423;
        Wed, 11 Oct 2023 02:07:06 -0700 (PDT)
Received: from L-18010.kpit.com ([49.15.232.214])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709029a9300b001c739768214sm13357876plp.92.2023.10.11.02.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 02:07:06 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	akash hadke <akash.hadke@kpit.com>
Subject: [oe][meta-oe][kirkstone][PATCH] libeigen: Set LICENSE for libeigen-dev
Date: Wed, 11 Oct 2023 14:36:31 +0530
Message-Id: <20231011090631.195716-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 09:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105422

Set 'LICENSE' for 'libeigen-dev' package as
'MPL-2.0 & Apache-2.0 & BSD-3-Clause & LGPL-2.1-only'

'libeigen-dev' package does not contain any 'GPL-3.0-only'
and 'MINPACK' license files hence update the license.

Signed-off-by: akash hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
index 1cae76b42..467c51d98 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vec
 AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
 HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPL-3.0-only & LGPL-2.1-only & MINPACK"
+LICENSE:${PN}-dev = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
                     file://COPYING.BSD;md5=2dd0510ee95e59ca28834b875bc96596 \
                     file://COPYING.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-- 
2.25.1


