Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F260CC43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 14:47:35 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.7364.1658414845858903975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 07:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GpLOmwpD;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 f3-20020a17090ac28300b001f22d62bfbcso1601779pjt.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0FVaIIIjSLpWE5L1jBjiNl0keTNrfaUqSrtXNDE0oc=;
        b=GpLOmwpDJuOr6rnb0XTgWEhbP6v+31re9JzhWod4kqU1GOaQZYpyx0Z8aS6XX9yR8f
         IFupDbx9zxwKwZo/R1FIzINLuaS6iIhsdZw4+smLY+I61UZwBmpZZrzN/ZU0cmB5HKP4
         0NssYUQfB+tBPiNZ18Vy88vuUrUsE/ImMKg5n5LPNfD6PqueGkLG5+nUItk4VNuQsz+p
         r7heztPnrIjulA44GraxrAif+12laG6yNnltJ3LN+JjM31ShOhY9ffYMyzZV3Rw4Lt54
         I6AmaxR/+zRjtKPCHgxkKl5QL0oSg3867VGI4O+NhPk0nqnjUP/pmqXTu3KqO3UF538N
         CX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0FVaIIIjSLpWE5L1jBjiNl0keTNrfaUqSrtXNDE0oc=;
        b=yKVXHkyGQ4qh3PZ9RIIUSxDHdjYHgGlYg7EsBY0lq2eoDIM+iGbb9ZFXlpYl2Qc/rH
         lX3ByT6F51q+PL/N+1JbkFAjEzFv224Z7pKTdo8edSXXIKh8A8no4ghrkiMAZzotKkUx
         kM4xq3/Za2A7+kSMZeyZm5LXli+H/X2UiOqWTrH27WcOQpiYIh+moNZnhFHGNbS3VPfu
         FnIgGeqreWyXSXZBlvGStZTdcliZchl770+8Hh4AVIyyaOIXHvpeVuv3Y0hDEsXKDr/O
         aCWfdCS8sf1iF5eUyS8B2Huq+P34UX3/T4mxRqWrrn0ZEP+EXntWbBChHO6VDtnSJjdV
         tF9A==
X-Gm-Message-State: AJIora+yaTgFMPDvyAA9A8FkbVmJ8KqWVD4GOE1hwMCVbcjEJoRFISQJ
	BYjVlfc8brNrhkksdq+V+DZZvAv2zes=
X-Google-Smtp-Source: 
 AGRyM1vsZoHXEBl4pSnsxJ+PJXWCbFNnWAaWI6I1MnZ+fijDzfuRXhO2bljmVGgmK9v5CvTC+eckkw==
X-Received: by 2002:a17:90b:3ec3:b0:1f1:ff45:1d3b with SMTP id
 rm3-20020a17090b3ec300b001f1ff451d3bmr11623564pjb.101.1658414844807;
        Thu, 21 Jul 2022 07:47:24 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 r9-20020aa79889000000b005284d10d8f6sm1867969pfl.215.2022.07.21.07.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 07:47:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Aryaman Gupta <aryaman.gupta@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/2] rsyslog: update 8.2202->8.2206
Date: Thu, 21 Jul 2022 07:45:20 -0700
Message-Id: <20220721144521.3730832-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Jul 2022 14:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97915

From: Aryaman Gupta <aryaman.gupta@windriver.com>

Package changes mainly include performance improvements to
tcpsrv/imtcp, bug fixes and additional/updated tests:
	https://github.com/rsyslog/rsyslog/blob/master/ChangeLog

ptest results for qemux86-64 with kvm and increasing filesystem space to
4GB using IMAGE_ROOTFS_EXTRA_SPACE :

Version | Passed | Failed | Skipped
8.2202 | 456 | 0 | 5
8.2206 | 465 | 0 | 5

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0f048c4c46fd4b377b7aacc236a23249ae05fdaa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../rsyslog/{rsyslog_8.2202.0.bb => rsyslog_8.2206.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2202.0.bb => rsyslog_8.2206.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2202.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2202.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
index ebb8ecf9bd..a39de3acb5 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2202.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[sha256sum] = "e41308a5a171939b3cbc246e9d4bd30be44e801521e04cd95d051fa3867d6738"
+SRC_URI[sha256sum] = "a1377218b26c0767a7a3f67d166d5338af7c24b455d35ec99974e18e6845ba27"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


