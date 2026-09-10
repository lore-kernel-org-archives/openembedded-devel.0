Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F106C88E46
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:17 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27840.1789081812644360060
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GW3B9gmW;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964e480f76so402987a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081812; x=1789686612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDVXUsglM1KOn/EeGmIAM3JIq4RbfNX6aIBEEc5tpWk=;
        b=GW3B9gmWstBd+EjTgg7XeWBPEkeYWEGl1Dl93iWHDb0KHkVbiafxhYdJjhhuv7L/jL
         NHyxsfOI7kBJ4qHi2yY9AlhYVR7WxMUyDaSV8xso6Ph/07hMAcFVwtOjfdCmKhc5MqvW
         BubvfA2reEdx2zzsLOw8bFX3tx2/g3y0SYA109TA5KtUieqHubUktjx4aeC6HQfa6Ac3
         cQYYKvhRXS9gMgkgMqCix30Pz+MPF2UG/MwmQHOGM+wze092qLdY/JOtowIMxnp9otg7
         KBHyiOCYQDNOu5BAFQvcZp+IEh9VDPtg/cQ4W5H+isBs1uBu3S0iNSBrf+YhO3Bazztj
         MZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081812; x=1789686612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDVXUsglM1KOn/EeGmIAM3JIq4RbfNX6aIBEEc5tpWk=;
        b=PoCSbc0zuTQit4yz0jgPBOLp/JQQyUl7PeUKMBwc36Q4PTkrwKOaQwb9hq4715B9X8
         PfB5ZJDSnVQuEDGbBjNn7mXquxFk+M+3fySZpiZu1cMPpYRYfRgj+GFSFGyD+dXdAV1R
         yrsPslJZja+tXvhLHz+II1W2aHJ5rfmNplRB9YN/hKjXu5QYEiCc0SJ9bzqEBE1EWvNM
         9L4n6SRp7rHJI5UxlEd6gf/atdYi7FIO61rLWRZL4TNe24/T0m02YN81yS0iX6g0pvO8
         3Eud/120v7CS05dV90S7oaAXAjhJsnUzeDEBUBFiXXFx+bamT64QJ6h0i1x+q+bZBjMM
         5dJQ==
X-Gm-Message-State: AFuF++nOtKX5D7R0mCzfrDa6Fn4UHAeQNN5Bu8zm0WSrzS8ozWp7eQTk
	699Vrg9KgSss9AAn5cbUwV7J3BybG58roYyAo2Z0MhqGR4d9BkBk2BDxmP+Y/w==
X-Gm-Gg: AYBFou0AElT1w2zY9U73Eb9kaBz6i8jdXFSLiSx345gQtIerqXd23exfmwaqi1ASYH8
	Fe0ATNrtztyX0s8U9Z3Cm5yXOoM0H4GzUn+gOf+Kehgb40A1ZIH4UP8eIuLChgUmv15UC2tgRyf
	hLdkm9WW9Wyzvt2OZMi9qV0AC7O8Nx+nDMnKy28I/n6cVhSsEXA812IHVNpgUhKzQRsCVuDAM1q
	RD6TNHAM8+hL0wTg4FaIqTACF1HUbTto+VDeJp7195yTk/qbd0ST7VgcNS1b5QqRSVeiWA+BLs0
	h9luJYKWWV3tn1wYVnb9xj+0ccoIr1aBtzoUGf+vexUg8DyV7ySqm9Te1HtLgK3SQlcD6nXKmae
	5mdiuMY7P2kEmhPbJzp05eyeEin1ulc1w3Y4wFxdehxc3cBnP0RHD18ugAwh0Y/QhfB3JwVgWia
	Z0lMORu3G6iZGPtTCVMfay7HOhudsEsiloiHjGjJw/LAi4NuU2CqIG960/RLkvFK+VuiVr74c2k
	ajJJ73WmptVEJniqzk3ca4=
X-Received: by 2002:a17:90b:1d49:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39d9c1fc96emr1718207a91.18.1789081811936;
        Thu, 10 Sep 2026 16:10:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 10/32] unbound: patch CVE-2026-42960
Date: Fri, 11 Sep 2026 11:09:09 +1200
Message-ID: <20260910230932.173913-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129928

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-42960

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-42960.patch      | 38 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42960.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-42960.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42960.patch
new file mode 100644
index 0000000000..13f99d4803
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42960.patch
@@ -0,0 +1,38 @@
+From 7bd2ccb4a490b95ee9e8297ebbcb8fec91d11859 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:20:45 +0200
+Subject: [PATCH] - Fix CVE-2026-42960, Possible cache poisoning attack while
+ following   delegation. Thanks to TaoFei Guo from Peking University, Yang Luo
+   and JianJun Chen, Tsinghua University, for the report.
+
+(cherry picked from commit 8ae4b4545dccaaabd30b597b0dcb0d9640c8cc39)
+
+CVE: CVE-2026-42960
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/8ae4b4545dccaaabd30b597b0dcb0d9640c8cc39]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ iterator/iter_scrub.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/iterator/iter_scrub.c b/iterator/iter_scrub.c
+index 8507a3fb6..852705db3 100644
+--- a/iterator/iter_scrub.c
++++ b/iterator/iter_scrub.c
+@@ -725,7 +725,13 @@ scrub_normalize(sldns_buffer* pkt, struct msg_parse* msg,
+ 			rrset->rrset_all_next = NULL;
+ 			return 1;
+ 		}
+-		mark_additional_rrset(pkt, msg, rrset);
++		/* Only mark glue as allowed for type NS in the authority
++		 * section. Other RR types do not get glue for them, it
++		 * is allowed from the answer section, but not authority
++		 * so that a message can not have address records cached
++		 * as a side effect to the query. */
++		if(rrset->type==LDNS_RR_TYPE_NS)
++			mark_additional_rrset(pkt, msg, rrset);
+ 		prev = rrset;
+ 		rrset = rrset->rrset_all_next;
+ 	}
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 7ed5769c69..a6f9b14cab 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-41292.patch \
            file://CVE-2026-42534.patch \
            file://CVE-2026-42923.patch \
+           file://CVE-2026-42960.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

