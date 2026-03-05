Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD42F33A70
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:15:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44933.1772720117894656343
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VhyhKYca;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439c944bb62so1504105f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772720116; x=1773324916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOh3gCbuALKdwg80g4k9LxBXo/PN57S/YIYusTsqGP4=;
        b=VhyhKYca6ApudlZv3Y1DOa6HC/4m1l0Z2yWCOfgyBnGm7XPruakJOS5W029JLxOT1p
         Nd7uVanb5kqHcq/r42rZjcSI+lcaW6ECBkJhbpSXlccm8McMdv/+Ke8bM5iVMnhvYtdY
         +D6eJCt6qJ5m6ZgloA53oIcoipK4bHRdyai/WPSJKNK6HAl2GQ0ESTl1n8xVPuKQCLvX
         yujYiISQpiIDnQUrcnNHF3pdZCGi/yBZZfyT9qjnkJHgDBiQA7DLF7WcQ1N8xw0PpOwa
         gNDh5K0OjOM6EkAAt+7OkdvS9W1Ok1pdsX3LYTactdQTwaazeeRfdUvuTzFcr+DUituo
         rmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720116; x=1773324916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOh3gCbuALKdwg80g4k9LxBXo/PN57S/YIYusTsqGP4=;
        b=V1SvJFLJ8+MfBih3dFsQMh8UNWqb/1J6JdNmm6U2BTZf2ezySodrzPasGN9PSjwp69
         pXfus9Hj/pqhL4YjsJVJZawJaVi9pD1fl8QwzeXHYVzugOr7pqPXUkI0y5mT4aIR0a9d
         O+m7fL2WAIOBsxESiGCQgh3Qnncqm37+W2JmFKzt0dZ0c+oY1p+Uvrp3f5EueP+RND4N
         j60c+tbpxSDR42bU4SnYHoRZaFNdw8kqocI3rK44EEmYL4KegByk0Xejm+I6KsLV0Rh2
         54ffkZzG852DCV5xVmoaGt5GjAVKOqpYHV8nLMt75yu/ePKEuYMlNOQTXS09T/SvI1ex
         43vA==
X-Gm-Message-State: AOJu0YwnUjDdnuCeDnViIlloA8NLgVxZA5b6mnGBc/Pb92aEVwmYh3Rz
	gO197DKWrjVr+k7attc1azBmMnGksZfsBhS2sfUpyD+Ar6iEGqgCcHBYfaQoBg==
X-Gm-Gg: ATEYQzyTfBHod21YMpjPHsriCWD2+1zfuHnBB6Dm1LkzXXtrSTv5vbf2IoEQnMuP3Rl
	EK02rOAYYATgqtJtca00CStE8Fq7121NjkdJ9A9jWu4+QGylBWVcY541acfm3R1wG0h4e0JKUmg
	heJIFZhYaeC//GAUcydtUKjAIpJY5WelFK6SmbyLRsKNEUrI81IBFGNEWzFqSA8gnOmmCWsoxLG
	CQtDEyPgEtVfHDxmvjkKF0UTTj78dmcGsAl+FyhCgIVlZQ6DjAcLb6aWBMNLWAbt1y0JkdkEAbG
	iKCsiy2DkdEBRPo51yrNzywBFUlX/LPZKQD3YShAPT0l3mwCxJNXRsRaoZGMrBjCQ79qmnlOWYy
	n3yqwaiDgruQugSYCG9nF0d5wPIl6j09DE7I7oHHfcq7XBkYi0pVweWdysqrtgn2EV5Qz0xSSr4
	F3ZWFj/pDEV045f+b1Gt23
X-Received: by 2002:a05:6000:184a:b0:439:8da3:d77e with SMTP id ffacd0b85a97d-439c7fae58fmr11541402f8f.20.1772720115981;
        Thu, 05 Mar 2026 06:15:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm40034096f8f.5.2026.03.05.06.15.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:15:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 2/3] keepalived: patch CVE-2024-41184
Date: Thu,  5 Mar 2026 15:15:13 +0100
Message-ID: <20260305141514.3058998-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305141514.3058998-1-skandigraun@gmail.com>
References: <20260305141514.3058998-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 14:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124876

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-41184

Backport the patches referenced by upstream in the bug
mentioned by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../keepalived/CVE-2024-41184-1.patch         | 98 +++++++++++++++++++
 .../keepalived/CVE-2024-41184-2.patch         | 88 +++++++++++++++++
 .../keepalived/CVE-2024-41184-3.patch         | 94 ++++++++++++++++++
 .../keepalived/CVE-2024-41184-4.patch         | 33 +++++++
 .../keepalived/keepalived_2.2.8.bb            |  4 +
 5 files changed, 317 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.patch

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch
new file mode 100644
index 0000000000..8aa9bb445e
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch
@@ -0,0 +1,98 @@
+From 3ff3427da746c4641e1718dcec7a2f7041ae6961 Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Fri, 12 Jul 2024 15:16:47 +0100
+Subject: [PATCH] vrrp: Handle empty ipset names with vrrp_ipsets keyword
+
+We now handle empty ipset names and return a config error.
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+CVE: CVE-2024-41184
+Upstream-Status: Backport [https://github.com/acassen/keepalived/commit/e78513fe0ce5d83c226ea2c0bd222f375c2438e7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ keepalived/core/global_parser.c | 36 +++++++++++++++++++--------------
+ 1 file changed, 21 insertions(+), 15 deletions(-)
+
+diff --git a/keepalived/core/global_parser.c b/keepalived/core/global_parser.c
+index a3f2329..504b9a1 100644
+--- a/keepalived/core/global_parser.c
++++ b/keepalived/core/global_parser.c
+@@ -1086,6 +1086,22 @@ vrrp_iptables_handler(const vector_t *strvec)
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
+@@ -1103,17 +1119,13 @@ vrrp_ipsets_handler(const vector_t *strvec)
+ 		return;
+ 	}
+ 
+-	if (strlen(strvec_slot(strvec,1)) >= IPSET_MAXNAMELEN - 1) {
+-		report_config_error(CONFIG_GENERAL_ERROR, "VRRP Error : ipset address name too long - ignored");
++	if (!check_valid_ipset_name(strvec, 1, "address"))
+ 		return;
+-	}
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
+@@ -1124,10 +1136,8 @@ vrrp_ipsets_handler(const vector_t *strvec)
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
+@@ -1142,10 +1152,8 @@ vrrp_ipsets_handler(const vector_t *strvec)
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
+@@ -1156,10 +1164,8 @@ vrrp_ipsets_handler(const vector_t *strvec)
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
index 0000000000..3565451f92
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.patch
@@ -0,0 +1,88 @@
+From 19e9f69359c204805de4d1467d9f96940910a7dd Mon Sep 17 00:00:00 2001
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
+index 504b9a1..c49e771 100644
+--- a/keepalived/core/global_parser.c
++++ b/keepalived/core/global_parser.c
+@@ -1059,6 +1059,28 @@ vrrp_higher_prio_send_advert_handler(const vector_t *strvec)
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
+@@ -1068,16 +1090,12 @@ vrrp_iptables_handler(const vector_t *strvec)
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
+@@ -1089,17 +1107,7 @@ vrrp_iptables_handler(const vector_t *strvec)
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
index 0000000000..63ddbb4f50
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.patch
@@ -0,0 +1,94 @@
+From 87f8c80bbbf9ceb3340cc89720fe9aa2284fad3a Mon Sep 17 00:00:00 2001
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
+index c49e771..1a145f9 100644
+--- a/keepalived/core/global_parser.c
++++ b/keepalived/core/global_parser.c
+@@ -1058,9 +1058,10 @@ vrrp_higher_prio_send_advert_handler(const vector_t *strvec)
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
+@@ -1074,11 +1075,13 @@ check_valid_iptables_ipset_name(const vector_t *strvec, unsigned entry, unsigned
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
+@@ -1107,7 +1110,7 @@ vrrp_iptables_handler(const vector_t *strvec)
+ static bool
+ check_valid_ipset_name(const vector_t *strvec, unsigned entry, const char *log_name)
+ {
+-	return check_valid_iptables_ipset_name(strvec, entry, IPSET_MAXNAMELEN, "ipset", log_name);
++	return check_valid_iptables_ipset_nftables_name(strvec, entry, IPSET_MAXNAMELEN, "ipset", log_name);
+ }
+ 
+ static void
+@@ -1201,6 +1204,12 @@ vrrp_iptables_handler(__attribute__((unused)) const vector_t *strvec)
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
+@@ -1212,10 +1221,8 @@ vrrp_nftables_handler(__attribute__((unused)) const vector_t *strvec)
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
+@@ -1255,10 +1262,8 @@ ipvs_nftables_handler(__attribute__((unused)) const vector_t *strvec)
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
index 0000000000..8d3ecb58c4
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.patch
@@ -0,0 +1,33 @@
+From 5e5fde051d75ffe0449418466832b8b50baeb95e Mon Sep 17 00:00:00 2001
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
+index c7217fd..4b250ac 100644
+--- a/lib/memory.c
++++ b/lib/memory.c
+@@ -200,7 +200,7 @@ static unsigned free_list_size;
+ static inline int
+ memcheck_ptr_cmp(const void *key, const struct rb_node *a)
+ {
+-	return (const char *)key - (char *)rb_entry_const(a, MEMCHECK, t)->ptr;
++	return less_equal_greater_than((const char *)key, (char *)rb_entry_const(a, MEMCHECK, t)->ptr);
+ }
+ 
+ static inline bool
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
index c4d59d3caa..f9b06b612f 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
@@ -12,6 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
            file://0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch \
+           file://CVE-2024-41184-1.patch \
+           file://CVE-2024-41184-2.patch \
+           file://CVE-2024-41184-3.patch \
+           file://CVE-2024-41184-4.patch \
            "
 SRC_URI[sha256sum] = "85882eb62974f395d4c631be990a41a839594a7e62fbfebcb5649a937a7a1bb6"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"

