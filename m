Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277FBCA9EBD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:23 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3480.1791763819033667556
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OJ/2C7Oa;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab41538192so976058a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763818; x=1792368618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3d43JjfWEUFleFcwwuibvfJUhSWCwglxb4hHqHvJmc=;
        b=OJ/2C7Oa7MvyHopjnFIfC4ZfRN9ohskcNlE2Y39/a8OIQ3XmHEmpb5/I+zWUqRlKR6
         plx9BKswt/i7HOWYtk7ppNG42jFO6amKS03UFy0k4MavEAtXlC/3oZUD4gPRd+ZGNjr6
         E4o3D4BD7Db+HjuDSvRwjongHj3/wmdSSUhJQpWYHs0AMeDlIS+Cg9YTj5VLaNoGWp63
         KZerQzLKMOPJui7pz1FnEoK5Ntm36/EL1jyddTBMQZa5/yPFd/2zzWqYFHlbgcYUXU4x
         kL/0HiT53FEQU6wF3uRvfpbXSkYSqunyip4X1zmiDF4Q7+R3sKR9qnA4cuD/CzXwOCs0
         O6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763818; x=1792368618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3d43JjfWEUFleFcwwuibvfJUhSWCwglxb4hHqHvJmc=;
        b=jyjpNWZxc3eWhWLNPN5rej7sOi24NAL5mjQUQIBD4c9RDh2AA9uP7kYeWjcY+o0slv
         WkfbMtA1ECEUc1AKS2Ua2GKOPV7b8VTVUQ2aMrT+egM7EBxhnUbdVD2cgs4hu7O683JY
         YP7/+41CAIf0z4jZRpUQi68JdgIKJ2K3UFeE+oD/VN5d/c1yCsec5vXIMi6xUU1nElaD
         Lfxx1nSN3QLyVomKAqK31p5PwRrTHjgETi2XVMTR4MVvQYGtBT3wbAGf3H096zzew68l
         EI6Mr7CYVFOBA18o/2P2dR6sALdED5m+bB47opbako9ogF+zmqlAcc3d0aDrxPcpffNE
         Xn0Q==
X-Gm-Message-State: AFq9FYJ1wXkQyIZMHoRJOGYYn2itfPfVu+TVPg3toxmnHd6ZqiiIU3/J
	6R4wQPpX6YQ2yNCfcVznlIzrL/SowedBxXG6FJ+/JTDr1jSekEfGLJmgLH36xjv0VA8=
X-Gm-Gg: AYBFou0pQREEx6bU00PfAEfEGJl3zipE3n6dGd7qHQzc1PNueB9AIr52RovttwZ4uEC
	BBt4G4evIjFvSgrJ9H+Rw0tdvUxBiEvx8DPbECIQhS8zH2WyMhSqdbRYr9XoBzS27Gm8wLOUzT8
	C1PT++ffIsMAT0s95j0APQaUr3uThxofvUxfdn8aDke5rzIYDT3VjIsNtIZiAAkZDTBxVGzlJqj
	/r+Y3nTi/ihGnhp7bVmDXIein+DPC9FzBl9ex+bEnHgKnHBl8V8AwwauuiSTUSCbJnuGl69Qcrx
	Po/FPXvJ/ClyLLnk1AMu52MMx4Gv0ybiVmAV1sZjNnKv+ad+kilnZeF9VxaQKuLGm05h4qbLzyK
	QOTO+kImXey23VROzV0N0FKSMWr8HaVQ1NbJ47gKaCPYxkeoQSZrzGtzZB1B6AivLr0qwAyFdUG
	5Xj29GtF0WxvZd/uwuOr3SCNCuPjrkAtWeejlBdc9SJVXZ369CTRwdh+q930D312njTAiCPsiXb
	9AVXgKZajEO/D1AxPiWRBHQ9QnpI+4dJnaZyGc=
X-Received: by 2002:a17:90a:a8f:b0:3ab:413:49af with SMTP id 98e67ed59e1d1-3ab3a92850dmr5212680a91.49.1791763818332;
        Sun, 11 Oct 2026 17:10:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 2/28] civetweb: ignore CVE-2026-5789
Date: Mon, 12 Oct 2026 13:09:40 +1300
Message-ID: <20261012001007.2541673-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130727

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-5789

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit db080436aa68c50b0500aadd33a366916b12c782)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index d9ca7ccd53b..df64d4cd355 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
 
 CVE_STATUS[CVE-2025-55763] = "fixed-version: The vulnerability is fixed in the used revision"
 CVE_STATUS[CVE-2025-9648] = "fixed-version: The vulnerability is fixed in the used revision"
+CVE_STATUS[CVE-2026-5789] = "not-applicable-platform: Issue only applies on Windows"
 
 # civetweb supports building with make or cmake (although cmake lacks few features)
 inherit cmake

