Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC679FD8FD7
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 16:30:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74184.1772123446385284196
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 08:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iHwgqlnl;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43989bd056bso911601f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 08:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772123445; x=1772728245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlAI9Vuz8Kb5NG59wwC1KUTm0gNHp9/phsmWGDBa+WA=;
        b=iHwgqlnlLklKlPpC8B25au+Vmm8x1v5yVjXv7nho1OlCJ3Z3hMK+PB/WP2QNyiEesk
         3LsIcAxJbXS+svdgtZsVavxRRcRetc3rWxaOX+qz1o74bJP1UucRP+QOSom79SEm6osl
         6Ws6ObLJ6wGvsKYW20yXmdO8ZA96wNgv/EA249Ov25B62+CXK+oXXvJiD+gzA+TGM0yb
         Qc6xUSgzQwnUZlwkCGk9gbTXhc2aEgc/XkrPuJ3hNEdGgJ3w0LGgrq1Xv01CWsRqua7E
         08QWxsLY9kkHUUWPGFR8yKLGkt0Tef33UaUrgn9od5ioFWEdq3E2i7SPaDP3KDjfC493
         YmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772123445; x=1772728245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JlAI9Vuz8Kb5NG59wwC1KUTm0gNHp9/phsmWGDBa+WA=;
        b=ePdQ6MFX4r9LPH78+phpDvS6/7RtkJ5AYeczUDnjj+rTEzU351cJilrJCWCBV7XKEg
         9fvFs13iq2fWqJza0leqL7q8HtX9oh54fZSY44a7UxUhrMrg23OWYc4vSiKub7ocMn+8
         8iP5uvhaN6Eg8nglEVp2FR3S+Y5VYnRj9OSdQ2d11yeUfDwULwk9EwtDiRqsRcN/3D/1
         U+IYsF/jroO8vEY1SvPhPFmZiuVt1NVWl6VkP9LRF+iaz2CTklNtLPHWLIi3vLkLTF+c
         1FSOdz9+vfqwR7XP3k7LStb6ptWi3mgYTk8zRKvtO6j2UfNtSkp3HntLczYzQAMAYrL/
         /v1w==
X-Gm-Message-State: AOJu0YyORFT71c/GjXFpESAM1zFLlNB9IYD+Z0QdnLtLWk8/gFWTd8sM
	XiiVJhyKSSUPYz45zdCJBgwjmpR3GgFL2/6Q2/6z8Pm6jKxW4vKDrHy/dWuCuA==
X-Gm-Gg: ATEYQzxLXqCYVo8bUYwJziDkMpeEfHz4+99zYKzSxDERJ5y0TIQBL/R/yY7WH5elRgu
	/Ee/dXqemVO4dS0f55NX/7VunaNA4t9WMXCwUPb7+1ilds3eZ2BotM1HjmfBX+UyA/zcPU4hLoX
	ma6PLgh/64ejkdiLY1vaA9RrdnI5FY2K/znfgQjackvXpc0WHQNR4aDtYRKmr8Ty+YZJaexxPZ5
	3aneRxL/jIbES68Yia5/CmtQ21cZyV1+tX1qq/qaHQ2QS/NB0uYkiPRPwDInJ9nUEA1f2YkxDnk
	nanCHu0ce8hlZtDU873Qk8FS4aGiD7V5BVOlHAd2imPV7gWWHoFsmpvfu6vt6lbitwYkKURuW8l
	hpjBNfepdokNvgKsKNSw+lYVlMVj1kc8bZbVUKjNUlSVNm0Pq77UDMAgFmFqoCOvHutDbZ+laTZ
	EJkhKgPbJ6gduwIvc2J94sFfckuNFVrWA=
X-Received: by 2002:a5d:4104:0:b0:439:9799:dd4c with SMTP id ffacd0b85a97d-4399799de61mr4822109f8f.1.1772123444562;
        Thu, 26 Feb 2026 08:30:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c76b40esm446164f8f.36.2026.02.26.08.30.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:30:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/2] keepalived: patch CVE-2024-41184
Date: Thu, 26 Feb 2026 17:30:42 +0100
Message-ID: <20260226163042.3765918-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226163042.3765918-1-skandigraun@gmail.com>
References: <20260226163042.3765918-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 16:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124686

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-41184

Backport the patches referenced by upstream in the bug
mentioned by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../keepalived/CVE-2024-41184-1.patch         | 100 ++++++++++++++++++
 .../keepalived/CVE-2024-41184-2.patch         |  88 +++++++++++++++
 .../keepalived/CVE-2024-41184-3.patch         |  94 ++++++++++++++++
 .../keepalived/CVE-2024-41184-4.patch         |  33 ++++++
 .../keepalived/keepalived_2.2.2.bb            |   4 +
 5 files changed, 319 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.patch

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch
new file mode 100644
index 0000000000..d94d16e6c6
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch
@@ -0,0 +1,100 @@
+From b7e7e83e92812707669aa92a41f301366bfbd114 Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Fri, 12 Jul 2024 15:16:47 +0100
+Subject: [PATCH] vrrp: Handle empty ipset names with vrrp_ipsets keyword
+
+We now handle empty ipset names and return a config error.
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+
+CVE: CVE-2024-41184
+Upstream-Status: Backport [https://github.com/acassen/keepalived/commit/e78513fe0ce5d83c226ea2c0bd222f375c2438e7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ keepalived/core/global_parser.c | 37 ++++++++++++++++++++-------------
+ 1 file changed, 22 insertions(+), 15 deletions(-)
+
+diff --git a/keepalived/core/global_parser.c b/keepalived/core/global_parser.c
+index 2b8a80d..e273b74 100644
+--- a/keepalived/core/global_parser.c
++++ b/keepalived/core/global_parser.c
+@@ -1008,6 +1008,22 @@ vrrp_iptables_handler(const vector_t *strvec)
+ 	}
+ }
+ #ifdef _HAVE_LIBIPSET_
++static bool
++check_valid_ipset_name(const vector_t *strvec, unsigned entry, const char *log_name)
++{
++	if (strlen(strvec_slot(strvec, entry)) >= IPSET_MAXNAMELEN - 1) {
++		report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset %s name too long - ignored", log_name);
++		return false;
++	}
++
++	if (strlen(strvec_slot(strvec, entry)) == 0) {
++		report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset %s name empty - ignored", log_name);
++		return false;
++	}
++
++	return true;
++}
++
+ static void
+ vrrp_ipsets_handler(const vector_t *strvec)
+ {
+@@ -1025,17 +1041,14 @@ vrrp_ipsets_handler(const vector_t *strvec)
+ 		return;
+ 	}
+ 
+-	if (strlen(strvec_slot(strvec,1)) >= IPSET_MAXNAMELEN - 1) {
+-		report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset address name too long - ignored");
++	if (!check_valid_ipset_name(strvec, 1, "address"))
+ 		return;
+-	}
++
+ 	global_data->vrrp_ipset_address = STRDUP(strvec_slot(strvec,1));
+ 
+ 	if (vector_size(strvec) >= 3) {
+-		if (strlen(strvec_slot(strvec,2)) >= IPSET_MAXNAMELEN - 1) {
+-			report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset IPv6 address name too long - ignored");
++		if (!check_valid_ipset_name(strvec, 2, "IPv6 address"))
+ 			return;
+-		}
+ 		global_data->vrrp_ipset_address6 = STRDUP(strvec_slot(strvec,2));
+ 	}
+ 	else {
+@@ -1046,10 +1059,8 @@ vrrp_ipsets_handler(const vector_t *strvec)
+ 		global_data->vrrp_ipset_address6 = STRDUP(set_name);
+ 	}
+ 	if (vector_size(strvec) >= 4) {
+-		if (strlen(strvec_slot(strvec,3)) >= IPSET_MAXNAMELEN - 1) {
+-			report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset IPv6 address_iface name too long - ignored");
++		if (!check_valid_ipset_name(strvec, 3, "IPv6 address_iface"))
+ 			return;
+-		}
+ 		global_data->vrrp_ipset_address_iface6 = STRDUP(strvec_slot(strvec,3));
+ 	}
+ 	else {
+@@ -1064,10 +1075,8 @@ vrrp_ipsets_handler(const vector_t *strvec)
+ 	}
+ 
+ 	if (vector_size(strvec) >= 5) {
+-		if (strlen(strvec_slot(strvec,4)) >= IPSET_MAXNAMELEN - 1) {
+-			report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset IGMP name too long - ignored");
++		if (!check_valid_ipset_name(strvec, 4, "IGMP"))
+ 			return;
+-		}
+ 		global_data->vrrp_ipset_igmp = STRDUP(strvec_slot(strvec,4));
+ 	}
+ 	else {
+@@ -1078,10 +1087,8 @@ vrrp_ipsets_handler(const vector_t *strvec)
+ 		global_data->vrrp_ipset_igmp = STRDUP(set_name);
+ 	}
+ 	if (vector_size(strvec) >= 6) {
+-		if (strlen(strvec_slot(strvec,5)) >= IPSET_MAXNAMELEN - 1) {
+-			report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset MLD name too long - ignored");
++		if (!check_valid_ipset_name(strvec, 5, "MLD"))
+ 			return;
+-		}
+ 		global_data->vrrp_ipset_mld = STRDUP(strvec_slot(strvec,5));
+ 	}
+ 	else {
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.patch b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.patch
new file mode 100644
index 0000000000..b86c62c8a6
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.patch
@@ -0,0 +1,88 @@
+From f546b221c6e9672f8d3f86660376dfad07d1aefd Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Fri, 12 Jul 2024 15:18:20 +0100
+Subject: [PATCH] vrrp: handle empty iptables chain names - vrrp_iptables
+ keyword
+
+We now return an error if a chain name is empty.
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+
+CVE: CVE-2024-41184
+Upstream-Status: Backport [https://github.com/acassen/keepalived/commit/281de3aa8a0990fa3cd694a9addc0bf28953da0b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ keepalived/core/global_parser.c | 42 ++++++++++++++++++++-------------
+ 1 file changed, 25 insertions(+), 17 deletions(-)
+
+diff --git a/keepalived/core/global_parser.c b/keepalived/core/global_parser.c
+index e273b74..85c9a64 100644
+--- a/keepalived/core/global_parser.c
++++ b/keepalived/core/global_parser.c
+@@ -981,6 +981,28 @@ vrrp_higher_prio_send_advert_handler(const vector_t *strvec)
+ 		global_data->vrrp_higher_prio_send_advert = true;
+ }
+ #ifdef _WITH_IPTABLES_
++static bool
++check_valid_iptables_ipset_name(const vector_t *strvec, unsigned entry, unsigned max_len, const char *type_name, const char *log_name)
++{
++	if (strlen(strvec_slot(strvec, entry)) >= max_len - 1) {
++		report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : %s %s name too long - ignored", type_name, log_name);
++		return false;
++	}
++
++	if (strlen(strvec_slot(strvec, entry)) == 0) {
++		report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : %s %s name empty - ignored", type_name, log_name);
++		return false;
++	}
++
++	return true;
++}
++
++static bool
++check_valid_iptables_chain_name(const vector_t *strvec, unsigned entry, const char *log_name)
++{
++	return check_valid_iptables_ipset_name(strvec, entry, XT_EXTENSION_MAXNAMELEN, "iptables", log_name);
++}
++
+ static void
+ vrrp_iptables_handler(const vector_t *strvec)
+ {
+@@ -990,16 +1012,12 @@ vrrp_iptables_handler(const vector_t *strvec)
+ 	}
+ 
+ 	if (vector_size(strvec) >= 2) {
+-		if (strlen(strvec_slot(strvec,1)) >= XT_EXTENSION_MAXNAMELEN - 1) {
+-			report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : iptables in chain name too long - ignored");
++		if (!check_valid_iptables_chain_name(strvec, 1, "in chain"))
+ 			return;
+-		}
+ 		global_data->vrrp_iptables_inchain = STRDUP(strvec_slot(strvec,1));
+ 		if (vector_size(strvec) >= 3) {
+-			if (strlen(strvec_slot(strvec,2)) >= XT_EXTENSION_MAXNAMELEN - 1) {
+-				report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : iptables out chain name too long - ignored");
++			if (!check_valid_iptables_chain_name(strvec, 2, "out chain"))
+ 				return;
+-			}
+ 			global_data->vrrp_iptables_outchain = STRDUP(strvec_slot(strvec,2));
+ 		}
+ 	} else {
+@@ -1011,17 +1029,7 @@ vrrp_iptables_handler(const vector_t *strvec)
+ static bool
+ check_valid_ipset_name(const vector_t *strvec, unsigned entry, const char *log_name)
+ {
+-	if (strlen(strvec_slot(strvec, entry)) >= IPSET_MAXNAMELEN - 1) {
+-		report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset %s name too long - ignored", log_name);
+-		return false;
+-	}
+-
+-	if (strlen(strvec_slot(strvec, entry)) == 0) {
+-		report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset %s name empty - ignored", log_name);
+-		return false;
+-	}
+-
+-	return true;
++	return check_valid_iptables_ipset_name(strvec, entry, IPSET_MAXNAMELEN, "ipset", log_name);
+ }
+ 
+ static void
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.patch b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.patch
new file mode 100644
index 0000000000..c620a667c2
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.patch
@@ -0,0 +1,94 @@
+From 2d9e3eb366e71b561481b4f1a804a77e8e364ae1 Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Fri, 12 Jul 2024 15:32:35 +0100
+Subject: [PATCH] vrrp and ipvs: handle empty nftables chain names
+
+We now return an error if a chain name is empty.
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+
+CVE: CVE-2024-41184
+Upstream-Status: Backport [https://github.com/acassen/keepalived/commit/1e5902c4793ac01b810f0faa3b5cf47b41ae95c1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ keepalived/core/global_parser.c | 25 +++++++++++++++----------
+ 1 file changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/keepalived/core/global_parser.c b/keepalived/core/global_parser.c
+index 85c9a64..a6b3f40 100644
+--- a/keepalived/core/global_parser.c
++++ b/keepalived/core/global_parser.c
+@@ -980,9 +980,10 @@ vrrp_higher_prio_send_advert_handler(const vector_t *strvec)
+ 	else
+ 		global_data->vrrp_higher_prio_send_advert = true;
+ }
+-#ifdef _WITH_IPTABLES_
++
++#if defined _WITH_IPTABLES_ || defined _WITH_NFTABLES_
+ static bool
+-check_valid_iptables_ipset_name(const vector_t *strvec, unsigned entry, unsigned max_len, const char *type_name, const char *log_name)
++check_valid_iptables_ipset_nftables_name(const vector_t *strvec, unsigned entry, unsigned max_len, const char *type_name, const char *log_name)
+ {
+ 	if (strlen(strvec_slot(strvec, entry)) >= max_len - 1) {
+ 		report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : %s %s name too long - ignored", type_name, log_name);
+@@ -996,11 +997,13 @@ check_valid_iptables_ipset_name(const vector_t *strvec, unsigned entry, unsigned
+ 
+ 	return true;
+ }
++#endif
+ 
++#ifdef _WITH_IPTABLES_
+ static bool
+ check_valid_iptables_chain_name(const vector_t *strvec, unsigned entry, const char *log_name)
+ {
+-	return check_valid_iptables_ipset_name(strvec, entry, XT_EXTENSION_MAXNAMELEN, "iptables", log_name);
++	return check_valid_iptables_ipset_nftables_name(strvec, entry, XT_EXTENSION_MAXNAMELEN, "iptables", log_name);
+ }
+ 
+ static void
+@@ -1029,7 +1032,7 @@ vrrp_iptables_handler(const vector_t *strvec)
+ static bool
+ check_valid_ipset_name(const vector_t *strvec, unsigned entry, const char *log_name)
+ {
+-	return check_valid_iptables_ipset_name(strvec, entry, IPSET_MAXNAMELEN, "ipset", log_name);
++	return check_valid_iptables_ipset_nftables_name(strvec, entry, IPSET_MAXNAMELEN, "ipset", log_name);
+ }
+ 
+ static void
+@@ -1124,6 +1127,12 @@ vrrp_iptables_handler(__attribute__((unused)) const vector_t *strvec)
+ 
+ #ifdef _WITH_NFTABLES_
+ #ifdef _WITH_VRRP_
++static bool
++check_valid_nftables_chain_name(const vector_t *strvec, unsigned entry, const char *log_name)
++{
++	return check_valid_iptables_ipset_nftables_name(strvec, entry, NFT_TABLE_MAXNAMELEN, "nftables", log_name);
++}
++
+ static void
+ vrrp_nftables_handler(__attribute__((unused)) const vector_t *strvec)
+ {
+@@ -1135,10 +1144,8 @@ vrrp_nftables_handler(__attribute__((unused)) const vector_t *strvec)
+ 	}
+ 
+ 	if (vector_size(strvec) >= 2) {
+-		if (strlen(strvec_slot(strvec, 1)) >= NFT_TABLE_MAXNAMELEN) {
+-			report_config_error(CONFIG_GENERAL_ERROR, "nftables table name too long - ignoring");
++		if (!check_valid_nftables_chain_name(strvec, 1, "chain"))
+ 			return;
+-		}
+ 		name = strvec_slot(strvec, 1);
+ 	}
+ 	else {
+@@ -1178,10 +1185,8 @@ ipvs_nftables_handler(__attribute__((unused)) const vector_t *strvec)
+ 	}
+ 
+ 	if (vector_size(strvec) >= 2) {
+-		if (strlen(strvec_slot(strvec, 1)) >= NFT_TABLE_MAXNAMELEN) {
+-			report_config_error(CONFIG_GENERAL_ERROR, "ipvs nftables table name too long - ignoring");
++		if (!check_valid_nftables_chain_name(strvec, 1, "ipvs chain"))
+ 			return;
+-		}
+ 		name = strvec_slot(strvec, 1);
+ 	}
+ 	else {
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.patch b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.patch
new file mode 100644
index 0000000000..084f7f69b1
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.patch
@@ -0,0 +1,33 @@
+From 67174a59068633ada8f77756d56399a53794224e Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Fri, 12 Jul 2024 15:11:13 +0100
+Subject: [PATCH] lib: don't return subtracted addresses for rb_find() compare
+ function
+
+If sizeof(int) < sizeof(void *) returning the difference between two
+addresses in an int can cause an overflow.
+
+Use less_equal_greater_than() for comparing addresses.
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+
+CVE: CVE-2024-41184
+Upstream-Status: Backport [https://github.com/acassen/keepalived/commit/f3a32e3557520dccb298b36b4952eff3e236fb86]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lib/memory.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/memory.c b/lib/memory.c
+index 78ca675..46d7172 100644
+--- a/lib/memory.c
++++ b/lib/memory.c
+@@ -185,7 +185,7 @@ static FILE *log_op = NULL;
+ static inline int
+ memcheck_ptr_cmp(const MEMCHECK *m1, const MEMCHECK *m2)
+ {
+-	return (char *)m1->ptr - (char *)m2->ptr;
++	return less_equal_greater_than((char *)m1->ptr, (char *)m2->ptr);
+ }
+ 
+ static inline int
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
index ca476f8605..582f6341db 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
@@ -13,6 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
            file://0001-layer4-Change-order-of-include-files.patch \
            file://CVE-2021-44225.patch \
+           file://CVE-2024-41184-1.patch \
+           file://CVE-2024-41184-2.patch \
+           file://CVE-2024-41184-3.patch \
+           file://CVE-2024-41184-4.patch \
            "
 SRC_URI[sha256sum] = "103692bd5345a4ed9f4581632ea636214fdf53e45682e200aab122c4fa674ece"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"

