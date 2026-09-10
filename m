Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A61C88E46
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:11:08 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27864.1789081861804094755
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iRLrfN/V;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so326901a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081861; x=1789686661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKDggtB136jimsWQPWbM2Db27CGGQwr4XREPuuHaPw4=;
        b=iRLrfN/VstgH/I8ZOZvoZTrZNADhwrgnRIsI5xivDWzAWwrfv0A9Xsc+Yt/d2i8Ab/
         g5io2OMNT5+gTWeHmAR/SYHj3DkfQP/uCE/LyyGlbE3KpTXvG9khgkoE/X3u/S9OSi3y
         nqswcR1PimvVfz6fr4tJ30dNmJnyBEFGs7K4NPpbq6nCRfW0NCs2FI+CXt8VSgS/Htie
         HTSLXfKzt99fLCBnR8kuokmyvnakm2gPnJ6LBGZJzXcTlA0yblynowepQd/v5j9sWRJK
         czaslc1CS/cKyQJjtIIyL4P+rrh0HydtFedgXrsRVqEZJJmgyV+LmMZDJl5di0hMRaVF
         a2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081861; x=1789686661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKDggtB136jimsWQPWbM2Db27CGGQwr4XREPuuHaPw4=;
        b=C2Ag9MN71YbY0qE0+TzYWRLYn/kMHJq4HR38TdH3AfY/MQ6sAfGMiiYFNp6AtfKKG9
         VoLgZYN1iLVciujKwr9NeL9LdjFXcr6zOMGTJ4bt/6bPs3lKqzuT8g8STWyqygNuD39d
         yNLW0N9dmOsqQzsHeJoPbyawkvSeCEasDC2vjC8R3FIcsf1D9J9e5V23M6vai0Vf+9Pu
         98qcSt3UIAtKH+nN2OY90cc5gWpgc1MgQrKi92J4ywv80JcpPfkJ+T/XiUBiD3ikDjbV
         jueNgvZyVfJj0kuTZYRPJTOFvEaQeVSeRYREnR7Hyd2xn7RYU8JFvzj583RiSyJNwAWQ
         miYw==
X-Gm-Message-State: AFuF++nIAPVP1rdcHuQ97P5bhYH0L0H+1wSHxcap8m9+gFjI1J1Zq4r7
	3+JJ7rIofwNVTUgIGiLi5MqpKlGz6RxFFM8tPVUGEvv26kmJ4PGZUwc27k+EFQ==
X-Gm-Gg: AYBFou18f4gmehlEq7N2QRHOsoB0gGczfI/f3DXc44B69yLQ6VMoAgMFswUkFiYOpXr
	Emgsc9r5vToEYbQNhUoNJ7q6/FQ6Np5XehlROY5JK8TO+SIwwkou7/zvQ8UTd1V6Rnc4W/Y2xUe
	B3Xyr9RYPd0kN3wmh5zzN5ethTclDOvM4C6gxGJ1s+sCSmB3vf6mKofVeepd4VPf0Lj6/woiPfE
	Q1qeL2QbKewJzFYbWRQpxfYi6+qkIoAWmXC2sF+U0x01tS/37Q9BiXadOWrr7GsoExiDiA9CVcb
	asn84wf0G94i1FZw1WksY66N2VOBcQO0Ifc6lt4YoAJ2UrtbbVUBYnVKevBlZtyp5MlSnMkzCRz
	nGESKAIwR6qTYr9euzlkty160sKxRANXSnzss9jOMsgkw8sdkex9b91khxnPwUtYwJAb2KuibeW
	Q0yDO29Qam0Q6HSMPv9l27OhEjPnE/tMV4YnTF7m8g8rNytj9nlSwxVKfy49KaNPbmne6mviG9I
	EYNRBEe8sHNztRCidm134OWjFJ/xUfM1w==
X-Received: by 2002:a17:90b:57d0:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-39d9bbd8781mr1827670a91.2.1789081861079;
        Thu, 10 Sep 2026 16:11:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:11:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 28/32] unbound: patch CVE-2026-55973
Date: Fri, 11 Sep 2026 11:09:27 +1200
Message-ID: <20260910230932.173913-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129946

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55973

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-55973.patch      | 47 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55973.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-55973.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55973.patch
new file mode 100644
index 0000000000..b463663af4
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55973.patch
@@ -0,0 +1,47 @@
+From f7511787affcc7f1716f76dcc924c3880fc1f88a Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:18:16 +0200
+Subject: [PATCH] - Fix CVE-2026-55973, 'dns-error-reporting: yes' leads to
+ stack buffer   overflow. Thanks to Qifan Zhang, Palo Alto Networks, for the
+ report.
+
+(cherry picked from commit 96f875552023c0ccf376ebe050519f12f3371dc9)
+
+CVE: CVE-2026-55973
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/96f875552023c0ccf376ebe050519f12f3371dc9]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/cache/dns.c | 2 ++
+ services/mesh.c      | 4 ++--
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/services/cache/dns.c b/services/cache/dns.c
+index 121870ee3..cb241c6f9 100644
+--- a/services/cache/dns.c
++++ b/services/cache/dns.c
+@@ -259,6 +259,8 @@ find_closest_of_type(struct module_env* env, uint8_t* qname, size_t qnamelen,
+ 
+ 		/* snip off front label */
+ 		lablen = *qname;
++		if(lablen == 0)
++			break;
+ 		qname += lablen + 1;
+ 		qnamelen -= lablen + 1;
+ 	}
+diff --git a/services/mesh.c b/services/mesh.c
+index 191b1d488..432063c0d 100644
+--- a/services/mesh.c
++++ b/services/mesh.c
+@@ -1620,9 +1620,9 @@ static void dns_error_reporting(struct module_qstate* qstate,
+ 	opt = edns_opt_list_find(qstate->edns_opts_back_in,
+ 		LDNS_EDNS_REPORT_CHANNEL);
+ 	if(!opt) return;
+-	agent_domain_len = opt->opt_len;
+ 	agent_domain = opt->opt_data;
+-	if(dname_valid(agent_domain, agent_domain_len) < 3) {
++	agent_domain_len = dname_valid(agent_domain, opt->opt_len);
++	if(agent_domain_len < 3) {
+ 		/* The agent domain needs to be a valid dname that is not the
+ 		 * root; from RFC9567. */
+ 		return;
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 0af51973cd..b867ea9b73 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-54478.patch \
            file://CVE-2026-55708.patch \
            file://CVE-2026-55717.patch \
+           file://CVE-2026-55973.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

