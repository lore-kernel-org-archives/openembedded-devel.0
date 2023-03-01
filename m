Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51361C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 11:19:37 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.19423.1677669576642272969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 03:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HFnkSSMQ;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: pdoshi@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id v11so10075583plz.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 03:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1677669576;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GUd6JOlc+U+CUb6+2FdcP5J3wXGuNbxkuJXc1OU2vo=;
        b=HFnkSSMQQNZUOf06CfliGTGgwfim1oxJoJxtO+xILnjgCPpjgxKXbOby0VUbyl/emO
         7lvexrevaeCLv9dIPXe6tCWxUrtBXdjypgt/C0C9YSctDBLokwKV8OKIJRuShrH53YzH
         81oIeibGeLjqZWKKClw05gImRMdnJcFw7FB8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677669576;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GUd6JOlc+U+CUb6+2FdcP5J3wXGuNbxkuJXc1OU2vo=;
        b=eN9zLEyVrY7Q5FWCTNPxvVeH10XeZf8D8lRJlCQVgojGqaFyTve4Ra10UwLqHsBqRM
         uXaHkOrwKYUVVA1ZCzrLfPkwc8o89HCU+zYmASuT/b+NPt+XrX9KOvlLOYJKu9DbliH1
         +HQB/T24MpF2DHc0dzyypaSRNR1SSdkqQvo0aUeucmvaj2STDB576TEzcvhkJVTxWMLL
         QfKCQa1ZJz9iwBmumm1+pJEoJI+a1ZNPxF/PgpkZGuaOCJgP0WMczEbiu5ogg7WTbFQi
         sPnByuH5jxrwerAtIpzerHjlwUPoWYrOWS2lQSyk9v57qL7Qmw2MV0etjh6Np21lKxjU
         RH0A==
X-Gm-Message-State: AO0yUKU9HnN3FmHbQSuJHCxWpGKy0dmXkyzV1TPFK9nV+2X8fkDAOUWr
	NNySNLVPlR5/YmF0bw5/WcfDud2RZZ33bJMN
X-Google-Smtp-Source: AK7set9bN+OOMn6GzqMNWgWUymd2MlMmZQ02lg/vbvJt/MT/5x78d/kFCPtrW542XM9XdLTvqI0djA==
X-Received: by 2002:a05:6a20:c502:b0:cc:395f:e1ed with SMTP id gm2-20020a056a20c50200b000cc395fe1edmr6203615pzb.22.1677669575755;
        Wed, 01 Mar 2023 03:19:35 -0800 (PST)
Received: from logan.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id x14-20020a63170e000000b00502e1c50af3sm7191217pgl.45.2023.03.01.03.19.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Mar 2023 03:19:35 -0800 (PST)
From: pdoshi@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [oe] [meta-oe][dunfell][PATCH] open-vm-tools: Security fix for CVE-2022-31676
Date: Wed,  1 Mar 2023 16:49:30 +0530
Message-Id: <1677669570-25587-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 11:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101315

From: Priyal Doshi <pdoshi@mvista.com>

Backport from https://github.com/vmware/open-vm-tools/commit/70a74758bfe0042c27f15ce590fb21a2bc54d745

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 ...eck-authorization-on-incoming-guestOps-re.patch | 39 ++++++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.0.1.bb          |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch
new file mode 100644
index 0000000..1c6657a
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch
@@ -0,0 +1,39 @@
+From d16eda269413bdb04e85c242fa28db264697c45f Mon Sep 17 00:00:00 2001
+From: John Wolfe <jwolfe@vmware.com>
+Date: Sun, 21 Aug 2022 07:56:49 -0700
+Subject: [PATCH] Properly check authorization on incoming guestOps requests.
+
+Fix public pipe request checks.  Only a SessionRequest type should
+be accepted on the public pipe.
+
+Upstream-Status: Backport from https://github.com/vmware/open-vm-tools/commit/70a74758bfe0042c27f15ce590fb21a2bc54d745
+CVE: CVE-2022-31676
+Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
+---
+ open-vm-tools/vgauth/serviceImpl/proto.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/vgauth/serviceImpl/proto.c b/open-vm-tools/vgauth/serviceImpl/proto.c
+index f097fb6..0ebaa7b 100644
+--- a/open-vm-tools/vgauth/serviceImpl/proto.c
++++ b/open-vm-tools/vgauth/serviceImpl/proto.c
+@@ -1,5 +1,5 @@
+ /*********************************************************
+- * Copyright (C) 2011-2016,2019 VMware, Inc. All rights reserved.
++ * Copyright (C) 2011-2016,2019-2022 VMware, Inc. All rights reserved.
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms of the GNU Lesser General Public License as published
+@@ -1202,6 +1202,10 @@ Proto_SecurityCheckRequest(ServiceConnection *conn,
+    VGAuthError err;
+    gboolean isSecure = ServiceNetworkIsConnectionPrivateSuperUser(conn);
+ 
++   if (conn->isPublic && req->reqType != PROTO_REQUEST_SESSION_REQ) {
++       return VGAUTH_E_PERMISSION_DENIED;
++   }
++
+    switch (req->reqType) {
+       /*
+        * This comes over the public connection; alwsys let it through.
+--
+2.7.4
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
index 3cf0aa8..9a1b3f4 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
     file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
     file://0001-utilBacktrace-Ignore-Warray-bounds.patch;patchdir=.. \
     file://0001-hgfsmounter-Makefile.am-support-usrmerge.patch;patchdir=.. \
+    file://0001-Properly-check-authorization-on-incoming-guestOps-re.patch;patchdir=.. \
 "
 
 SRCREV = "d3edfd142a81096f9f58aff17d84219b457f4987"
-- 
2.7.4


