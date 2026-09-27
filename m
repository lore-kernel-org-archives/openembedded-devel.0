Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A7BC9833F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:39:40 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29997.1790469576725016878
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sGBmBX67;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc79223bcfbso946273a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469576; x=1791074376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSC/Wm3Ceg6evakLXubYrF/0CywcR5tMVkfoR9KKG0Q=;
        b=sGBmBX67Bdtm4NSulSAXMcUED+8pi/ySV91wMlqvC1iZuFgTATgdBIPiSth1QiLX0L
         bm0Kn9DpLFd3N5vYYb9rAMlLq+lIPpd5r+fy4SjEYiWzeI4qNckqovTdS4o0ahc/FCdf
         X0AOEXJy9PVTxw6hmUTICKZk+mop+InFoiJ16PH+lHGPcWfKFNq2YkdjVgDj6DQnIZbq
         M/8buNF7hD8j+HEFSG02qTbFQYP/h/aoz5xcKRr6mRKdn73R6cb1PgYiYYFpS8RiLqEr
         JfcrwcN5ROG4PisM/h1J/cWGPyO5aXriqC+EIcJMa2lw1VHVbKTUY9iNkNBONJewadMR
         A8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469576; x=1791074376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSC/Wm3Ceg6evakLXubYrF/0CywcR5tMVkfoR9KKG0Q=;
        b=Gk7Gl+GEBgAVPyzEUV/UApjhsgr+RfDHG8CAZXr+GoauPaDTL8Gf1JdmKdIzxp4mGB
         2H1ZjfvLbF3e/UIs8Le3b7FAv1UB4gw/CQsz95F9lagjhqEudD9DNqaaG4fNlpw7UlL8
         j9YUWXebXfILnd/os4RMXsNBwb6UHVwWZS1plK7bTFeGWAXwq/g1bZRtolbawgpJnd03
         zGdmVAhI9Ak3HKC70N+6oPOn8iINTa6+ReeEKCg9luFODpubX/eGd3MxVOzVFOaIF3sz
         MpgGW6/2306fbAyuSyA+6R/P2TpQ6rdk/y/higE5TFJqS/qn5jSEOr8nkKG9WQ6S4ZOv
         S1Eg==
X-Gm-Message-State: AFq9FYINqxW8+phWRYRViWfbfX7hboNEmjlV6d6MqWSZ/+/nBnS2S5P2
	bMJ944HamnWOdLxm0KH4dhAkIo9A3A7kh0++HNDxVrQLgT9JKIpxGHDTurUdKg==
X-Gm-Gg: AYBFou29xvSiuL2F1tt7+uXRUlmtlLK4DDJyqFs/ST126LVscmI20hanl8+zjnIJyWH
	7xHvKB/Euz4LpOcbMjpuM/acxybre0fZQiu3ZOl9+hGoK+xu1QSXq7k6VZJtt4BymiBSzkemevp
	iCrTUQIAYghwSPd1bEP+NQnwRHjyr1Tiv4cVo2K7eU22DAnDoP0DJdetgNx3sGNF+A+JLwEfgxS
	NSodm58SxfORF8oElx3jrXGqtp223Xxfx/ykXBSOw6K8sE1GFJVHWZCxt6J2Gddilw+spf1f87t
	fW5lbhmcvyhrmgb0rl2+Fpas5N0yWc02zjDJksrx8BgP67CZR/plR4NNLL8qdA9JIul5CiU6wpG
	+bbk0HK2LG5OAstx1+Pm7MLmULhCPNQKeuDiES2Paoe4jj1olMfsWLp8eDthV4NM4WBNmp2LU67
	QPSgy+ztJLTmb11r5sAZvAO3XTO9BWrsHR8K/eIj0JgWNV+MohBDmFwm2h2UO0oT62rZnzU8fmM
	m2GGW9iyARHQdl1c88cjFE=
X-Received: by 2002:a17:90b:5292:b0:39e:6c68:c784 with SMTP id 98e67ed59e1d1-3a098e56107mr7932137a91.58.1790469576030;
        Sat, 26 Sep 2026 17:39:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 4/11] unbound: patch CVE-2026-77860
Date: Sun, 27 Sep 2026 13:39:14 +1300
Message-ID: <20260927003921.746786-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130323

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-77860

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-77860.patch      | 31 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-77860.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-77860.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-77860.patch
new file mode 100644
index 0000000000..266166b729
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-77860.patch
@@ -0,0 +1,31 @@
+From 46671c9294ef76e2056a447eca8a561f3f48719e Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 16 Sep 2026 09:29:04 +0200
+Subject: [PATCH] - Fix CVE-2026-77860, 'serve-expired' can bypass Unbound
+ 'wait-limit'.   Thanks to Xuanchao Xie, Lutong Chen, and Kaiping Xue from the
+   University of Science and Technology of China (USTC) for the   report.
+
+(cherry picked from commit bd71e3b8a6dd87682bf454dc3687fc9e70b1bb78)
+
+CVE: CVE-2026-77860
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/bd71e3b8a6dd87682bf454dc3687fc9e70b1bb78]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/mesh.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/services/mesh.c b/services/mesh.c
+index a6798953e..20e4f1a26 100644
+--- a/services/mesh.c
++++ b/services/mesh.c
+@@ -2563,8 +2563,7 @@ mesh_serve_expired_callback(void* arg)
+ 		if(r->query_reply.c->tcp_req_info)
+ 			tcp_req_info_remove_mesh_state(r->query_reply.c->tcp_req_info, mstate);
+ 		/* mesh_send_reply removed mesh state from http2_stream. */
+-		infra_wait_limit_dec(mstate->s.env->infra_cache,
+-			&r->query_reply, mstate->s.env->cfg);
++		/* mesh_send_reply decremented wait_limit. */
+ 		prev = r;
+ 		prev_buffer = r_buffer;
+ 	}
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 1ab81879f2..1d810fba6c 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -46,6 +46,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-80225.patch \
            file://CVE-2026-81642.patch \
            file://CVE-2026-78227.patch \
+           file://CVE-2026-77860.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

