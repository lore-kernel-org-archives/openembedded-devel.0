Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4ABC79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:11:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27795.1789081872439366264
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y1smSbuo;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38759bcd877so326986a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081872; x=1789686672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3J8rAU3qxfoWFSJD1DlA62B9wfvxdowfguTRWCcFKc=;
        b=Y1smSbuo1sLyQViEvHjBto7W8E5/nXx/JUU9hqF30d4dljxnYfajf7zC4ERrYJ2xUb
         wZSFLCEKnufCGrS2EIrRVpIviYCFJikliz1Rm1WG/mAKe14WOIKbmE+EuKKk+9xQY66h
         IQQ/iCI89v8RQrezZXIGgQKDcsK+/DEZhs82YEnlvsY7IOg4cCYBnXPHemRJHYERN4R9
         O/NTsLBxkSZpDowzuRKgVnzYVXW9C7cVUqwqx9+EWSCEpPptpCw4OXzLs1Z2sUKV0gJJ
         mN0IzD9TZWztjfg23WiOai88lhTVrQoHSrZ8i0emJgw2K/JaXT1Wjxn2vrhprNvPBm71
         W2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081872; x=1789686672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3J8rAU3qxfoWFSJD1DlA62B9wfvxdowfguTRWCcFKc=;
        b=i7nLXrspvP+0l1vMAn3zOEG90vRiNy0vyt7PCQJGu1WZAfn+GDrZvDO/wHG+3g10zk
         ze31fx+XW6ZA9mTwjG6/AEKqHf+8A6BiJ8uAxdhBD01TC7IUE9K2IDT05IL14CcJb0OQ
         xQGMkn3udKn78DV/6TaSZNMu3squqRhCAvozXqXFjwGOHuWe+Qi3soxfDEMczDk7k7ja
         yR0A5auSvJLJgmZ7/J8Fw+m18TvpRo8CskFCGUvBUqsjx+zpvw5aG+lesGHXrp2uNax4
         HykKezI60fV+2TXaBr87B75QzwHrY7iz8duLEP0dzoZ1mkbSeXrJYxf9QoWGdKrIinO7
         k2Ww==
X-Gm-Message-State: AFuF++l/z4SWtxcPSkJL7TpdIOHcRj4LC9yjfk9PDxZon6JiYKz7MfR7
	wrazkdT9K9uM2b8ih7iqpRkZ07+zHLtxyeAkbaO8gGvHpJv5uF8tbwywgEaXoA==
X-Gm-Gg: AYBFou1ldJHxT+5vh4KCAhmNWoG06eLk1UtLXFHP2GiZ/wQ/D24ZNNC5GcwBQKjxrGC
	S6GeSvBkKcXXvWwOrhVtoCmJuivd8qVnx5qI9A/4BjNNdxkKrNvwlYe7Nk4pUrJBWXRHnMVrzxN
	68/U28Nx1G/ned81WVFklDaUsSmDbP4m4mnFD+XwGjMTTo7qhFR2Cja56750PxdaMpc7Bk3F8Be
	VGe1Fjs7YZNhUcnZ4oIo7iFvRgU+1Ij7eqAo94IH35465Gti06qVfAiaDEuK4cE2CR5M8eexoyJ
	fNX5AP/fNEhEbo1mi+cUaKs7DVFaDTIpgojIh1yJpY/jAbIQ3t2Dim6/kREZfGW6lZKyyI2gHTE
	eKk/W19nwwW2yT/rQN7TOQk9gO/7vQAzND3uLd75hs4C+RYiJjCksY2efg5/3pizdCHI2eeXnMV
	NvSnoy0Z9OOztrtsAs+F+Dvw08vv2GAa77sVcztAINHWmFcBN+qn0Dz3pa/Z+1beK5nDLO4hPNj
	79XAKydJyplJrl4HUs0h18=
X-Received: by 2002:a17:90b:4b82:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39d9bbd881fmr1802383a91.4.1789081871720;
        Thu, 10 Sep 2026 16:11:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:11:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 32/32] unbound: patch CVE-2026-56444
Date: Fri, 11 Sep 2026 11:09:31 +1200
Message-ID: <20260910230932.173913-32-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129950

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-56444

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-56444.patch      | 51 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-56444.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-56444.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-56444.patch
new file mode 100644
index 0000000000..e851bb4f12
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-56444.patch
@@ -0,0 +1,51 @@
+From 200cd7322d9462025b1d2b9f3e1fe5383735a6c6 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:19:50 +0200
+Subject: [PATCH] - Fix CVE-2026-56444, Degradation of resolution service when 
+  'discard-timeout' and 'serve-expired-client-timeout' are combined in  
+ unusual configuration. Thanks to Qifan Zhang, Palo Alto Networks,   for the
+ report. In addition, thanks to Xin Wang, Jiapeng Li,   and Jiajia Liu,
+ Northwestern Polytechnical University, for also   reporting this issue. In
+ addition, thanks to Haruki Oyama (Waseda   University), for also reporting
+ this issue.
+
+(cherry picked from commit 84d9682dd0876bc0cd118ecce03661f3443b0222)
+
+CVE: CVE-2026-56444
+Upstream-Status:Backport [https://github.com/NLnetLabs/unbound/commit/84d9682dd0876bc0cd118ecce03661f3443b0222]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/mesh.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/services/mesh.c b/services/mesh.c
+index 432063c0d..a6798953e 100644
+--- a/services/mesh.c
++++ b/services/mesh.c
+@@ -2505,9 +2505,10 @@ mesh_serve_expired_callback(void* arg)
+ 		log_dns_msg("Serve expired lookup", &qstate->qinfo, msg->rep);
+ 
+ 	for(r = mstate->reply_list; r; r = r->next) {
+-		struct timeval old;
+-		timeval_subtract(&old, mstate->s.env->now_tv, &r->start_time);
+-		if(mstate->s.env->cfg->discard_timeout != 0 &&
++		if(mesh_is_udp(r)) {
++		    struct timeval old;
++		    timeval_subtract(&old, mstate->s.env->now_tv, &r->start_time);
++		    if(mstate->s.env->cfg->discard_timeout != 0 &&
+ 			((int)old.tv_sec)*1000+((int)old.tv_usec)/1000 >
+ 			mstate->s.env->cfg->discard_timeout) {
+ 			/* Drop the reply, it is too old */
+@@ -2525,8 +2526,11 @@ mesh_serve_expired_callback(void* arg)
+ 				http2_stream_remove_mesh_state(r->h2_stream);
+ 			comm_point_drop_reply(&r->query_reply);
+ 			mstate->reply_list = reply_list;
++			log_assert(mstate->s.env->mesh->num_reply_addrs > 0);
++			mstate->s.env->mesh->num_reply_addrs--;
+ 			mstate->s.env->mesh->num_queries_discard_timeout++;
+ 			continue;
++		    }
+ 		}
+ 
+ 		i++;
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 516ea20654..faf315876c 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-55990.patch \
            file://CVE-2026-55991.patch \
            file://CVE-2026-56416.patch \
+           file://CVE-2026-56444.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

