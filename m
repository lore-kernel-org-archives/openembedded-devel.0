Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F59C88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:57 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27787.1789081856453926778
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q4cQcSOX;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so90545a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081856; x=1789686656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idPz84pCpMSmNlxNc1cH6FmUspn+JaYACcTJokSIXf0=;
        b=Q4cQcSOXjr7STlhm8xb/5K6+JIJa7K6HSDb8rOves1M0LIelAQhWMRG+VMxVTPE5No
         B20GWcj9AnaxMdG6vjXIfPzsPzroY9OL52SKdq0VQNZF29wauQlasVQM3jS06K1y96oC
         vgDNJ1aCYdFMoyND0nIhHVIdbBA6JB6NQi13mJi1nmOdmeuy5wc1zRVUnoJotDWPOm/i
         DKnOjMC46sMC/I03a1Ffh5+s4pn34pOaPQAyeSDD7XiqcHpaHhsfd0WJD0uKiEEDcRUO
         wquuI71FDHmL9gHMic9TLvH1vNf3kii3mqcc4Nz5RBhHMt2+fS8gHQ0bjrsYdwGGG01Z
         NUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081856; x=1789686656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idPz84pCpMSmNlxNc1cH6FmUspn+JaYACcTJokSIXf0=;
        b=odKp+cL0V9mOpUC93px8HKOTvEq8dvJP2M0Ua8SEqR4brHs9kNxI9AgkMYGZqWqn23
         uBuADY8Ux/o2cnKF5/JPzE/FxJb8MIsOSujS4YJ9Pv1C7P8EG80M9naggbqbOzOugXia
         Oz46euiVl21EOki9XkMqm1q/QNxI8uW7At1mQUtflSMlUferpITqeypSK0/lvBIUB2IG
         a2Js1teChH+BRFD8qwc3sjNR1j5k/SoCRwMuWeDxsjbtC7Nb4/tzgEQx3BEKKkwwRGbW
         /99dEJkwv64o+BgjE4HJmGd/2agL54S82z6kVeiKKT2StgvVTp/mrJvNDdlLyBazUSMV
         /pWw==
X-Gm-Message-State: AFuF++l/am+A+0DMnHkjCPk52QnUMEA9X5YIP1Ggq6Y7ornwrB6UkKdr
	qQyCp1NAQuz4d/VtrGbdTdvnWkrIwnonRVFcNU6aWasOXBtgGoKb4mfB5H5Y2g==
X-Gm-Gg: AYBFou1+3nca3XG13a7h73irbTZLDe0YDR6YXcMVnkhuEruDU+jWSxP42iJOXZDGJEP
	WqRffVF6OBM9czTyrhZQqqxOaHebzeQZ3ca3DblPbJ3vlMkWZ4FeZ5eunYkVtEAmQgK1NBOjPfG
	Fbt1J9zeqpe5/O4t+TVPAwex9KU3crxI/i0/byjK9iqO0b6ESseAno1pix5QS+lVWO9vdYOrk4e
	1duUqiaR2TuPKplfllXzDFQKhHr9fypooRdXVFSLw7vfiAMADllIjWM/VEFKXDrVtqbAKDW44nL
	fEzYYsN7hTMFPIJFNqfA/60gpgpwOoxaJme/U4rMblqOxkzFF4gK42c9PKK/XrObtzFaK/PgJrw
	iTrsFN4HfducC7iTUCVt0DwMpopIuk/uSyek4CADXVlpKNLVJIs/nZL94D/xc3qWNsOIEZnsJBI
	n2tXH0nnkxTjFoFSKlcdII1onDSbMOy5jE1vT4SkSpeocG6uYx0dOV9Mi7hjVwoqdvJuRt22iLl
	iPUVIycnLJS8vdMddnEBls=
X-Received: by 2002:a17:90b:5108:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39d97f392d3mr1589477a91.8.1789081855775;
        Thu, 10 Sep 2026 16:10:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 26/32] unbound: patch CVE-2026-55708
Date: Fri, 11 Sep 2026 11:09:25 +1200
Message-ID: <20260910230932.173913-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129944

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55708

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-55708.patch      | 51 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55708.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-55708.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55708.patch
new file mode 100644
index 0000000000..402e38c737
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55708.patch
@@ -0,0 +1,51 @@
+From 1138101d9147db0539c27e9c19525223f32de84c Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:17:10 +0200
+Subject: [PATCH] - Fix CVE-2026-55708, Privacy/configuration issue when adding
+ local   data in views through 'unbound-control'. Thanks to Qifan Zhang,  
+ Palo Alto Networks, for the report.
+
+(cherry picked from commit c29ff70f6aa9bb2f02e5f21001832f2b4791bd76)
+
+CVE: CVE-2026-55708
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/c29ff70f6aa9bb2f02e5f21001832f2b4791bd76]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ daemon/remote.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/daemon/remote.c b/daemon/remote.c
+index d8ee7fa7d..8a26dadc7 100644
+--- a/daemon/remote.c
++++ b/daemon/remote.c
+@@ -1634,6 +1634,14 @@ do_view_data_add(RES* ssl, struct worker* worker, char* arg)
+ 			ssl_printf(ssl,"error out of memory\n");
+ 			return;
+ 		}
++		if(!v->isfirst) {
++			/* Global local-zone is not used for this view,
++			 * therefore add defaults to this view-specific
++			 * local-zone. */
++			struct config_file lz_cfg;
++			memset(&lz_cfg, 0, sizeof(lz_cfg));
++			local_zone_enter_defaults(v->local_zones, &lz_cfg);
++		}
+ 	}
+ 	do_data_add(ssl, v->local_zones, arg2);
+ 	lock_rw_unlock(&v->lock);
+@@ -1659,6 +1667,14 @@ do_view_datas_add(struct daemon_remote* rc, RES* ssl, struct worker* worker,
+ 			ssl_printf(ssl,"error out of memory\n");
+ 			return;
+ 		}
++		if(!v->isfirst) {
++			/* Global local-zone is not used for this view,
++			 * therefore add defaults to this view-specific
++			 * local-zone. */
++			struct config_file lz_cfg;
++			memset(&lz_cfg, 0, sizeof(lz_cfg));
++			local_zone_enter_defaults(v->local_zones, &lz_cfg);
++		}
+ 	}
+ 	/* put the view name in the command buf */
+ 	(void)snprintf(buf+strlen(buf), sizeof(buf)-strlen(buf), "%s ", arg);
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 1e3bd6f5c6..a04080c751 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-50252.patch \
            file://CVE-2026-52863.patch \
            file://CVE-2026-54478.patch \
+           file://CVE-2026-55708.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

