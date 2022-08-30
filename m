Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8E7C6FA84
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:33 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.8722.1661843672489489805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WuiNi95O;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id f4so9867393pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=AsSzRgRKtsgYzdXXvSYoXsP+vqOdrcBpjxY26ers9Rg=;
        b=WuiNi95OvJ3SYHr5prQlsC5cHXVsCfzEN46f11TY/mxbkY69G58TsKSOXu8a7Hy5Tw
         /ILBFcU2SUzTcft6y734TbnmGSR0e6GUU1TGfzNHr4/jVHQrQGso5HyfVVvVry4v5KU2
         caur6AZqfGR8aLLHYhrtZpwkWPbE2qA9Z+5ONile+hgNKFSbCqMAZyAgJG8p5A1J8+9w
         atcgZnfF80dlXZSE+wKjOOF1WgNaPd5t5NZ4Upkbj5RZ3AKsriTZp4P6bXBBBpUYXMZ7
         prTM0ZwKlTh2YpoBm2Kej0NFcFffT7kA/Jt1n04SGtFsXXJrTpTiWgddD4ILCmwfwb9U
         5KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=AsSzRgRKtsgYzdXXvSYoXsP+vqOdrcBpjxY26ers9Rg=;
        b=twIuAxDQSL+W6ujfwkQYcw5Aun3c7+U/goY9h0Q5FQKPpJQ3vMcoBzCOm1iB6f8/So
         LADEVey6ffRzi9iktIBC7XWBbDTpqX2J3Bq1slgN2fs2Gl/qkKI07HDj6SZKEc8qwtj5
         4Hgltp/Bok0f61ARI3yWF8fK32mhblodLKYnB+77vmPIK5mG2CMJYwqdwv8PnBzscL69
         48wsMFZKYN65KYgWPgVyIxqmrWOTMCBPFkk2mQFKwHJajLhm7o6AhXaSqxF6xIZoPL6e
         2KSuSkbsxq64BShrbcESN+qIb7NfrsBjnYcXagcTumzPLeSRGYWySAf2HQbnh+Cy5Hgq
         zbjQ==
X-Gm-Message-State: ACgBeo1x8/jW/REqDmgvkUYBFubwuA3rONhuzIeufi9E8UuY82Mn8FXn
	OJ/VgGKNdKZoQutp9zoI4kcMk5sqxAEIEQ==
X-Google-Smtp-Source: 
 AA6agR4R1mFTTGaiBUSAp2agE778i1JD6JcNenf+KbyyWJqDXtiOcSb7En2kVRmIKJyvvdo6Uqq/3Q==
X-Received: by 2002:a63:de02:0:b0:428:9e02:5f3e with SMTP id
 f2-20020a63de02000000b004289e025f3emr17170358pgg.592.1661843670971;
        Tue, 30 Aug 2022 00:14:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 17/21] openlldp: Upgrade to 1.1.0
Date: Tue, 30 Aug 2022 00:14:09 -0700
Message-Id: <20220830071413.3887189-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98554

Drop already upstreamed patches
Add fix for clang15 build
Drop Wno-error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-cmds-fix-enum-conversion.patch |  91 ----
 ...002-lldp_head-rename-and-make-extern.patch | 500 ------------------
 ...03-lldp-add-packed-struct-definition.patch |  49 --
 ...string.h-for-mem-function-prototypes.patch |  23 +
 .../files/0004-lldptool-make-extern.patch     |  41 --
 ..._oui-match-encode-handler-prototypes.patch |  28 -
 ...ake-enum-a-type-rather-than-instance.patch |  33 --
 ...07-lldp_8021qaz-extern-config-object.patch |  29 -
 ...tringops-fix-some-string-copy-errors.patch |  61 ---
 ...21qaz-mark-prio-map-functions-static.patch |  39 --
 .../lldp_head-remove-all-references.patch     | 331 ------------
 .../{openlldp_1.0.1.bb => openlldp_1.1.0.bb}  |  18 +-
 12 files changed, 26 insertions(+), 1217 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-cmds-fix-enum-conversion.patch
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0002-lldp_head-rename-and-make-extern.patch
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0003-lldp-add-packed-struct-definition.patch
 create mode 100644 meta-networking/recipes-protocols/openlldp/files/0004-clif-Include-string.h-for-mem-function-prototypes.patch
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0004-lldptool-make-extern.patch
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0005-cisco_oui-match-encode-handler-prototypes.patch
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0006-ecp22-make-enum-a-type-rather-than-instance.patch
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0007-lldp_8021qaz-extern-config-object.patch
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0008-stringops-fix-some-string-copy-errors.patch
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0009-8021qaz-mark-prio-map-functions-static.patch
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch
 rename meta-networking/recipes-protocols/openlldp/{openlldp_1.0.1.bb => openlldp_1.1.0.bb} (57%)

diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-cmds-fix-enum-conversion.patch b/meta-networking/recipes-protocols/openlldp/files/0001-cmds-fix-enum-conversion.patch
deleted file mode 100644
index 680f6b67d7..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0001-cmds-fix-enum-conversion.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 090854e09fe18ebf1ba428864895a690086f78ee Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Mon, 19 Aug 2019 11:41:13 -0400
-Subject: [PATCH 1/9] cmds: fix enum conversion
-
-Multiple modules use implicit conversion between enum types, but
-this triggers warnings with some compilers.  ex:
-
-  qbg/vdp_cmds.c:110:39: error: implicit conversion from enumeration type
-      'lldp_cmd' to different enumeration type 'cmd_status'
-      [-Werror,-Wenum-conversion]
-        cmd_status good_cmd = vdp_cmdok(cmd, cmd_gettlv);
-
-Reported-at: https://github.com/intel/openlldp/issues/53
-Signed-off-by: Aaron Conole <aconole@redhat.com>
----
- lldp_evb22_cmds.c | 2 +-
- lldp_evb_cmds.c   | 2 +-
- qbg/vdp22_cmds.c  | 2 +-
- qbg/vdp_cmds.c    | 2 +-
- vdptool.c         | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/lldp_evb22_cmds.c b/lldp_evb22_cmds.c
-index cebfeb2..51810bc 100644
---- a/lldp_evb22_cmds.c
-+++ b/lldp_evb22_cmds.c
-@@ -225,7 +225,7 @@ int evb22_conf_enabletx(char *ifname, enum agent_type type)
- 				TLVID(OUI_IEEE_8021Qbg22, LLDP_EVB22_SUBTYPE));
- }
- 
--static int evb22_cmdok(struct cmd *cmd, cmd_status expected)
-+static int evb22_cmdok(struct cmd *cmd, int expected)
- {
- 	if (cmd->cmd != expected)
- 		return cmd_invalid;
-diff --git a/lldp_evb_cmds.c b/lldp_evb_cmds.c
-index eec4f33..e6af03b 100644
---- a/lldp_evb_cmds.c
-+++ b/lldp_evb_cmds.c
-@@ -163,7 +163,7 @@ int evb_conf_enabletx(char *ifname, enum agent_type type)
- 	return is_tlv_txenabled(ifname, type, TLVID_8021Qbg(LLDP_EVB_SUBTYPE));
- }
- 
--static int evb_cmdok(struct cmd *cmd, cmd_status expected)
-+static int evb_cmdok(struct cmd *cmd, int expected)
- {
- 	if (cmd->cmd != expected)
- 		return cmd_invalid;
-diff --git a/qbg/vdp22_cmds.c b/qbg/vdp22_cmds.c
-index 479b1b0..2e1bbbd 100644
---- a/qbg/vdp22_cmds.c
-+++ b/qbg/vdp22_cmds.c
-@@ -296,7 +296,7 @@ int vdp22_sendevent(struct vdpnl_vsi *p)
- 	return 0;
- }
- 
--static int vdp22_cmdok(struct cmd *cmd, cmd_status expected)
-+static int vdp22_cmdok(struct cmd *cmd, int expected)
- {
- 	if (cmd->cmd != expected)
- 		return cmd_invalid;
-diff --git a/qbg/vdp_cmds.c b/qbg/vdp_cmds.c
-index 95bcfb1..50f2781 100644
---- a/qbg/vdp_cmds.c
-+++ b/qbg/vdp_cmds.c
-@@ -85,7 +85,7 @@ static char *print_mode(char *s, size_t length, struct vsi_profile *p)
- 	return s;
- }
- 
--static int vdp_cmdok(struct cmd *cmd, cmd_status expected)
-+static int vdp_cmdok(struct cmd *cmd, int expected)
- {
- 	if (cmd->cmd != expected)
- 		return cmd_invalid;
-diff --git a/vdptool.c b/vdptool.c
-index 9872348..8f36277 100644
---- a/vdptool.c
-+++ b/vdptool.c
-@@ -141,7 +141,7 @@ static char *print_status(cmd_status status)
- 		str = "TLV does not support agent type";
- 		break;
- 	default:
--		str = print_vdp_status(status);
-+		str = print_vdp_status((enum vdp22_cmd_status)status);
- 		break;
- 	}
- 	return str;
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-protocols/openlldp/files/0002-lldp_head-rename-and-make-extern.patch b/meta-networking/recipes-protocols/openlldp/files/0002-lldp_head-rename-and-make-extern.patch
deleted file mode 100644
index 8f65b799f0..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0002-lldp_head-rename-and-make-extern.patch
+++ /dev/null
@@ -1,500 +0,0 @@
-From 07a83c583b9d508c7040dc6254a6a7113b2ce55f Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Mon, 3 Aug 2020 15:05:42 -0400
-Subject: [PATCH 2/9] lldp_head: rename and make extern
-
-Try to resolve this silly mod issue
-
-Signed-off-by: Aaron Conole <aconole@redhat.com>
----
- config.c           |  4 ++--
- event_iface.c      |  4 ++--
- include/lldp_mod.h |  2 +-
- lldp/agent.c       |  2 +-
- lldp/rx.c          |  4 ++--
- lldp/tx.c          |  4 ++--
- lldp_dcbx.c        |  8 ++++----
- lldp_mand_cmds.c   |  8 ++++----
- lldpad.c           | 12 +++++++-----
- lldptool.c         | 14 ++++++++------
- lldptool_cmds.c    |  2 +-
- qbg/ecp22.c        |  8 ++++----
- qbg/vdp.c          |  4 ++--
- qbg/vdp22.c        |  6 +++---
- qbg/vdp22_cmds.c   |  2 +-
- vdptool.c          | 16 +++++++++-------
- 16 files changed, 53 insertions(+), 47 deletions(-)
-
-diff --git a/config.c b/config.c
-index be458fd..bc3fbae 100644
---- a/config.c
-+++ b/config.c
-@@ -185,7 +185,7 @@ void scan_port(UNUSED void *eloop_data, UNUSED void *user_ctx)
- 		LIST_FOREACH(agent, &port->agent_head, entry) {
- 			LLDPAD_DBG("%s: calling ifdown for agent %p.\n",
- 				   __func__, agent);
--			LIST_FOREACH(np, &lldp_head, lldp) {
-+			LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 				ops = np->ops;
- 				if (ops->lldp_mod_ifdown)
- 					ops->lldp_mod_ifdown(ifname, agent);
-@@ -394,7 +394,7 @@ void init_ports(void)
- 		LIST_FOREACH(agent, &port->agent_head, entry) {
- 			LLDPAD_DBG("%s: calling ifup for agent %p.\n",
- 				   __func__, agent);
--			LIST_FOREACH(np, &lldp_head, lldp) {
-+			LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 				if (np->ops->lldp_mod_ifup)
- 					np->ops->lldp_mod_ifup(p->if_name, agent);
- 			}
-diff --git a/event_iface.c b/event_iface.c
-index 43a95c7..1be2963 100644
---- a/event_iface.c
-+++ b/event_iface.c
-@@ -216,7 +216,7 @@ int oper_add_device(char *device_name)
- 	LIST_FOREACH(agent, &port->agent_head, entry) {
- 		LLDPAD_DBG("%s: calling ifup for agent %p.\n",
- 			   __func__, agent);
--		LIST_FOREACH(np, &lldp_head, lldp) {
-+		LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 			if (np->ops->lldp_mod_ifup)
- 				np->ops->lldp_mod_ifup(device_name, agent);
- 		}
-@@ -283,7 +283,7 @@ static void event_if_decode_nlmsg(int route_type, void *data, int len)
- 			LIST_FOREACH(agent, &port->agent_head, entry) {
- 				LLDPAD_DBG("%s: calling ifdown for agent %p.\n",
- 					   __func__, agent);
--				LIST_FOREACH(np, &lldp_head, lldp) {
-+				LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 					ops = np->ops;
- 					if (ops->lldp_mod_ifdown)
- 						ops->lldp_mod_ifdown(device_name,
-diff --git a/include/lldp_mod.h b/include/lldp_mod.h
-index 49a50e4..9733595 100644
---- a/include/lldp_mod.h
-+++ b/include/lldp_mod.h
-@@ -96,7 +96,7 @@ struct lldp_module {
- };
- 
- LIST_HEAD(lldp_head, lldp_module);
--struct lldp_head lldp_head;
-+extern struct lldp_head lldp_mod_head;
- 
- static inline struct lldp_module *find_module_by_id(struct lldp_head *head, int id)
- {
-diff --git a/lldp/agent.c b/lldp/agent.c
-index 333929a..aa4a8d1 100644
---- a/lldp/agent.c
-+++ b/lldp/agent.c
-@@ -163,7 +163,7 @@ static void timer(UNUSED void *eloop_data, UNUSED void *user_ctx)
- 			run_rx_sm(port, agent);
- 			update_rx_timers(agent);
- 
--			LIST_FOREACH(n, &lldp_head, lldp) {
-+			LIST_FOREACH(n, &lldp_mod_head, lldp) {
- 				if (n->ops && n->ops->timer)
- 					n->ops->timer(port, agent);
- 			}
-diff --git a/lldp/rx.c b/lldp/rx.c
-index 12d07bc..43aeeba 100644
---- a/lldp/rx.c
-+++ b/lldp/rx.c
-@@ -359,7 +359,7 @@ void rxProcessFrame(struct port *port, struct lldp_agent *agent)
- 		}
- 
- 		/* rx per lldp module */
--		LIST_FOREACH(np, &lldp_head, lldp) {
-+		LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 			if (!np->ops || !np->ops->lldp_mod_rchange)
- 				continue;
- 
-@@ -402,7 +402,7 @@ u8 mibDeleteObjects(struct port *port, struct lldp_agent *agent)
- {
- 	struct lldp_module *np;
- 
--	LIST_FOREACH(np, &lldp_head, lldp) {
-+	LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 		if (!np->ops || !np->ops->lldp_mod_mibdelete)
- 			continue;
- 		np->ops->lldp_mod_mibdelete(port, agent);
-diff --git a/lldp/tx.c b/lldp/tx.c
-index c3a5c62..0746e34 100644
---- a/lldp/tx.c
-+++ b/lldp/tx.c
-@@ -71,7 +71,7 @@ bool mibConstrInfoLLDPDU(struct port *port, struct lldp_agent *agent)
- 	fb_offset += sizeof(struct l2_ethhdr);
- 
- 	/* Generic TLV Pack */
--	LIST_FOREACH(np, &lldp_head, lldp) {
-+	LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 		if (!np->ops || !np->ops->lldp_mod_gettlv)
- 			continue;
- 
-@@ -206,7 +206,7 @@ bool mibConstrShutdownLLDPDU(struct port *port, struct lldp_agent *agent)
- 	memcpy(agent->tx.frameout, (void *)&eth, sizeof(struct l2_ethhdr));
- 	fb_offset += sizeof(struct l2_ethhdr);
- 
--	np = find_module_by_id(&lldp_head, LLDP_MOD_MAND);
-+	np = find_module_by_id(&lldp_mod_head, LLDP_MOD_MAND);
- 	if (!np)
- 		goto error;
- 	if (!np->ops || !np->ops->lldp_mod_gettlv)
-diff --git a/lldp_dcbx.c b/lldp_dcbx.c
-index 7e53c0f..809086f 100644
---- a/lldp_dcbx.c
-+++ b/lldp_dcbx.c
-@@ -129,7 +129,7 @@ struct dcbx_tlvs *dcbx_data(const char *ifname)
- 	struct dcbd_user_data *dud;
- 	struct dcbx_tlvs *tlv = NULL;
- 
--	dud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_DCBX);
-+	dud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_DCBX);
- 	if (dud) {
- 		LIST_FOREACH(tlv, &dud->head, entry) {
- 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
-@@ -148,7 +148,7 @@ int dcbx_tlvs_rxed(const char *ifname, struct lldp_agent *agent)
- 	if (agent->type != NEAREST_BRIDGE)
- 		return 0;
- 
--	dud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_DCBX);
-+	dud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_DCBX);
- 	if (dud) {
- 		LIST_FOREACH(tlv, &dud->head, entry) {
- 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
-@@ -172,7 +172,7 @@ int dcbx_check_active(const char *ifname)
- 	struct dcbd_user_data *dud;
- 	struct dcbx_tlvs *tlv = NULL;
- 
--	dud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_DCBX);
-+	dud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_DCBX);
- 	if (dud) {
- 		LIST_FOREACH(tlv, &dud->head, entry) {
- 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
-@@ -507,7 +507,7 @@ void dcbx_ifup(char *ifname, struct lldp_agent *agent)
- 	ifindex = get_ifidx(ifname);
- 	port = port_find_by_ifindex(ifindex);
- 
--	dud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_DCBX);
-+	dud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_DCBX);
- 	tlvs = dcbx_data(ifname);
- 
- 	if (!port)
-diff --git a/lldp_mand_cmds.c b/lldp_mand_cmds.c
-index 8a88177..1c43bf4 100644
---- a/lldp_mand_cmds.c
-+++ b/lldp_mand_cmds.c
-@@ -466,7 +466,7 @@ int handle_get_args(struct cmd *cmd, UNUSED char *arg, char *argvalue,
- 	nbuf = obuf;
- 	nbuf_len = obuf_len;
- 
--	LIST_FOREACH(np, &lldp_head, lldp) {
-+	LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 		if (!np->ops->get_arg_handler)
- 			continue;
- 		if (!(ah = np->ops->get_arg_handler()))
-@@ -496,7 +496,7 @@ int handle_get_arg(struct cmd *cmd, char *arg, char *argvalue,
- 	struct arg_handlers *ah;
- 	int rval, status = cmd_not_applicable;
- 
--	LIST_FOREACH(np, &lldp_head, lldp) {
-+	LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 		if (!np->ops->get_arg_handler)
- 			continue;
- 		if (!(ah = np->ops->get_arg_handler()))
-@@ -593,7 +593,7 @@ int handle_test_arg(struct cmd *cmd, char *arg, char *argvalue,
- 	struct arg_handlers *ah;
- 	int rval, status = cmd_not_applicable;
- 
--	LIST_FOREACH(np, &lldp_head, lldp) {
-+	LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 		if (!np->ops->get_arg_handler)
- 			continue;
- 		if (!(ah = np->ops->get_arg_handler()))
-@@ -626,7 +626,7 @@ int handle_set_arg(struct cmd *cmd, char *arg, char *argvalue,
- 	struct arg_handlers *ah;
- 	int rval, status = cmd_not_applicable;
- 
--	LIST_FOREACH(np, &lldp_head, lldp) {
-+	LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 		if (!np->ops->get_arg_handler)
- 			continue;
- 		if (!(ah = np->ops->get_arg_handler()))
-diff --git a/lldpad.c b/lldpad.c
-index 01fb588..65e92c7 100644
---- a/lldpad.c
-+++ b/lldpad.c
-@@ -80,6 +80,8 @@ struct lldp_module *(*register_tlv_table[])(void) = {
- 	NULL,
- };
- 
-+struct lldp_head lldp_mod_head;
-+
- char *cfg_file_name = NULL;
- bool daemonize = 0;
- int loglvl = LOG_WARNING;
-@@ -98,7 +100,7 @@ static void init_modules(void)
- 	struct lldp_module *premod = NULL;
- 	int i = 0;
- 
--	LIST_INIT(&lldp_head);
-+	LIST_INIT(&lldp_mod_head);
- 	for (i = 0; register_tlv_table[i]; i++) {
- 		module = register_tlv_table[i]();
- 		if (!module)
-@@ -106,7 +108,7 @@ static void init_modules(void)
- 		if (premod)
- 			LIST_INSERT_AFTER(premod, module, lldp);
- 		else
--			LIST_INSERT_HEAD(&lldp_head, module, lldp);
-+			LIST_INSERT_HEAD(&lldp_mod_head, module, lldp);
- 		premod = module;
- 	}
- }
-@@ -115,9 +117,9 @@ void deinit_modules(void)
- {
- 	struct lldp_module *module;
- 
--	while (lldp_head.lh_first != NULL) {
--		module = lldp_head.lh_first;
--		LIST_REMOVE(lldp_head.lh_first, lldp);
-+	while (lldp_mod_head.lh_first != NULL) {
-+		module = lldp_mod_head.lh_first;
-+		LIST_REMOVE(lldp_mod_head.lh_first, lldp);
- 		module->ops->lldp_mod_unregister(module);
- 	}
- }
-diff --git a/lldptool.c b/lldptool.c
-index 2b14f61..664a248 100644
---- a/lldptool.c
-+++ b/lldptool.c
-@@ -64,6 +64,8 @@
- #include "lldp_util.h"
- #include "lldpad_status.h"
- 
-+struct lldp_head lldp_mod_head;
-+
- static int show_raw;
- 
- static const char *cli_version =
-@@ -199,7 +201,7 @@ static void init_modules(void)
- 		if (premod)
- 			LIST_INSERT_AFTER(premod, module, lldp);
- 		else
--			LIST_INSERT_HEAD(&lldp_head, module, lldp);
-+			LIST_INSERT_HEAD(&lldp_mod_head, module, lldp);
- 		premod = module;
- 	}
- }
-@@ -208,9 +210,9 @@ void deinit_modules(void)
- {
- 	struct lldp_module *module;
- 
--	while (lldp_head.lh_first != NULL) {
--		module = lldp_head.lh_first;
--		LIST_REMOVE(lldp_head.lh_first, lldp);
-+	while (lldp_mod_head.lh_first != NULL) {
-+		module = lldp_mod_head.lh_first;
-+		LIST_REMOVE(lldp_mod_head.lh_first, lldp);
- 		module->ops->lldp_mod_unregister(module);
- 	}
- }
-@@ -346,7 +348,7 @@ cli_cmd_help(UNUSED struct clif *clif, UNUSED int argc, UNUSED char *argv[],
- 	printf("%s\n%s\n%s", commands_usage, commands_options, commands_help);
- 
- 	printf("\nTLV identifiers:\n");
--	LIST_FOREACH(np, &lldp_head, lldp)
-+	LIST_FOREACH(np, &lldp_mod_head, lldp)
- 		if (np->ops->print_help)
- 			np->ops->print_help();
- 	return 0;
-@@ -406,7 +408,7 @@ u32 lookup_tlvid(char *tlvid_str)
- 	struct lldp_module *np;
- 	u32 tlvid = INVALID_TLVID;
- 
--	LIST_FOREACH(np, &lldp_head, lldp) {
-+	LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 		if (np->ops->lookup_tlv_name) {
- 			tlvid = np->ops->lookup_tlv_name(tlvid_str);
- 			if (tlvid != INVALID_TLVID)
-diff --git a/lldptool_cmds.c b/lldptool_cmds.c
-index daef8c8..70b7b0d 100644
---- a/lldptool_cmds.c
-+++ b/lldptool_cmds.c
-@@ -464,7 +464,7 @@ static void print_tlvs(struct cmd *cmd, char *ibuf)
- 			offset += 8;
- 		
- 		printed = 0;
--		LIST_FOREACH(np, &lldp_head, lldp) {
-+		LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 			if (np->ops->print_tlv(tlvid, tlv_len, ibuf+offset)) {
- 					printed = 1;
- 					break;
-diff --git a/qbg/ecp22.c b/qbg/ecp22.c
-index 6561d14..825392b 100644
---- a/qbg/ecp22.c
-+++ b/qbg/ecp22.c
-@@ -774,7 +774,7 @@ void ecp22_start(char *ifname)
- 	struct ecp22 *ecp;
- 
- 	LLDPAD_DBG("%s:%s start ecp\n", __func__, ifname);
--	eud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_ECP22);
-+	eud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_ECP22);
- 	if (!eud) {
- 		LLDPAD_DBG("%s:%s no ECP module\n", __func__, ifname);
- 		return;
-@@ -837,7 +837,7 @@ void ecp22_stop(char *ifname)
- 	struct ecp22 *ecp;
- 
- 	LLDPAD_DBG("%s:%s stop ecp\n", __func__, ifname);
--	eud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_ECP22);
-+	eud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_ECP22);
- 	ecp = find_ecpdata(ifname, eud);
- 	if (ecp)
- 		ecp22_remove(ecp);
-@@ -852,7 +852,7 @@ static int ecp22_data_from_evb(char *ifname, struct evb22_to_ecp22 *ptr)
- 	struct ecp22_user_data *eud;
- 	struct ecp22 *ecp;
- 
--	eud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_ECP22);
-+	eud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_ECP22);
- 	ecp = find_ecpdata(ifname, eud);
- 	if (ecp) {
- 		ecp->max_rte = ptr->max_rte;
-@@ -930,7 +930,7 @@ static int ecp22_req2send(char *ifname, unsigned short subtype,
- 
- 	LLDPAD_DBG("%s:%s subtype:%d\n", __func__, ifname, subtype);
- 
--	eud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_ECP22);
-+	eud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_ECP22);
- 	ecp = find_ecpdata(ifname, eud);
- 	if (!ecp) {
- 		rc = -ENODEV;
-diff --git a/qbg/vdp.c b/qbg/vdp.c
-index d131560..c26bbd6 100644
---- a/qbg/vdp.c
-+++ b/qbg/vdp.c
-@@ -188,7 +188,7 @@ struct vdp_data *vdp_data(char *ifname)
- 	struct vdp_user_data *ud;
- 	struct vdp_data *vd = NULL;
- 
--	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP02);
-+	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP02);
- 	if (ud) {
- 		LIST_FOREACH(vd, &ud->head, entry) {
- 			if (!strncmp(ifname, vd->ifname, IFNAMSIZ))
-@@ -1624,7 +1624,7 @@ void vdp_ifup(char *ifname, struct lldp_agent *agent)
- 
- 	LIST_INIT(&vd->profile_head);
- 
--	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP02);
-+	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP02);
- 	LIST_INSERT_HEAD(&ud->head, vd, entry);
- 
- out_start_again:
-diff --git a/qbg/vdp22.c b/qbg/vdp22.c
-index cf02310..81ea3a8 100644
---- a/qbg/vdp22.c
-+++ b/qbg/vdp22.c
-@@ -694,7 +694,7 @@ static struct vdp22 *vdp22_findif(const char *ifname,
- 	struct vdp22 *vdp = 0;
- 
- 	if (!ud) {
--		ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP22);
-+		ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP22);
- 		if (!ud)
- 			LLDPAD_DBG("%s:%s no VDP22 module\n", __func__,
- 				   ifname);
-@@ -794,7 +794,7 @@ void vdp22_stop(char *ifname)
- 	struct vsi22 *vsi;
- 
- 	LLDPAD_DBG("%s:%s stop vdp\n", __func__, ifname);
--	vud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP22);
-+	vud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP22);
- 	if (!vud) {
- 		LLDPAD_ERR("%s:%s no VDP22 module\n", __func__, ifname);
- 		return;
-@@ -874,7 +874,7 @@ void vdp22_start(const char *ifname, int role)
- 	struct vsi22 *vsi;
- 
- 	LLDPAD_DBG("%s:%s start vdp\n", __func__, ifname);
--	vud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP22);
-+	vud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP22);
- 	if (!vud) {
- 		LLDPAD_ERR("%s:%s no VDP22 module\n", __func__, ifname);
- 		return;
-diff --git a/qbg/vdp22_cmds.c b/qbg/vdp22_cmds.c
-index 2e1bbbd..a8025ee 100644
---- a/qbg/vdp22_cmds.c
-+++ b/qbg/vdp22_cmds.c
-@@ -57,7 +57,7 @@ static struct lldp_module *get_my_module(int thisid)
- {
- 	struct lldp_module *np = NULL;
- 
--	LIST_FOREACH(np, &lldp_head, lldp)
-+	LIST_FOREACH(np, &lldp_mod_head, lldp)
- 		if (thisid == np->id)
- 			break;
- 	return np;
-diff --git a/vdptool.c b/vdptool.c
-index 8f36277..f1d946c 100644
---- a/vdptool.c
-+++ b/vdptool.c
-@@ -61,6 +61,8 @@
- #define OUI_ENCODE_HNDLR(name) name##_oui_encode_hndlr
- #define OUI_PRNT_DECODE_HNDLR(name) name##_oui_print_decode_hndlr
- 
-+struct lldp_head lldp_mod_head;
-+
- #define EXTERN_OUI_FN(name) \
- 	extern bool name##_oui_encode_hndlr(char *, char *, size_t); \
- 	extern void name##_oui_print_decode_hndlr(char *)
-@@ -796,13 +798,13 @@ static void init_modules(void)
- 	struct lldp_module *premod = NULL;
- 	int i = 0;
- 
--	LIST_INIT(&lldp_head);
-+	LIST_INIT(&lldp_mod_head);
- 	for (i = 0; register_tlv_table[i]; i++) {
- 		module = register_tlv_table[i]();
- 		if (premod)
- 			LIST_INSERT_AFTER(premod, module, lldp);
- 		else
--			LIST_INSERT_HEAD(&lldp_head, module, lldp);
-+			LIST_INSERT_HEAD(&lldp_mod_head, module, lldp);
- 		premod = module;
- 	}
- }
-@@ -811,9 +813,9 @@ void deinit_modules(void)
- {
- 	struct lldp_module *module;
- 
--	while (lldp_head.lh_first != NULL) {
--		module = lldp_head.lh_first;
--		LIST_REMOVE(lldp_head.lh_first, lldp);
-+	while (lldp_mod_head.lh_first != NULL) {
-+		module = lldp_mod_head.lh_first;
-+		LIST_REMOVE(lldp_mod_head.lh_first, lldp);
- 		module->ops->lldp_mod_unregister(module);
- 	}
- }
-@@ -953,7 +955,7 @@ cli_cmd_help(UNUSED struct clif *clif, UNUSED int argc, UNUSED char *argv[],
- 	printf("%s\n%s\n%s", commands_usage, commands_options, commands_help);
- 
- 	printf("\nTLV identifiers:\n");
--	LIST_FOREACH(np, &lldp_head, lldp)
-+	LIST_FOREACH(np, &lldp_mod_head, lldp)
- 		if (np->ops->print_help)
- 			np->ops->print_help();
- 	return 0;
-@@ -1006,7 +1008,7 @@ u32 lookup_tlvid(char *tlvid_str)
- 	struct lldp_module *np;
- 	u32 tlvid = INVALID_TLVID;
- 
--	LIST_FOREACH(np, &lldp_head, lldp) {
-+	LIST_FOREACH(np, &lldp_mod_head, lldp) {
- 		if (np->ops->lookup_tlv_name) {
- 			tlvid = np->ops->lookup_tlv_name(tlvid_str);
- 			if (tlvid != INVALID_TLVID)
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-protocols/openlldp/files/0003-lldp-add-packed-struct-definition.patch b/meta-networking/recipes-protocols/openlldp/files/0003-lldp-add-packed-struct-definition.patch
deleted file mode 100644
index 4d0594cb6c..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0003-lldp-add-packed-struct-definition.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 702dd20f43d9ca7e0bcb917e8acfec3f1acdcb5c Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Mon, 3 Aug 2020 15:14:50 -0400
-Subject: [PATCH 3/9] lldp: add packed struct definition
-
-Signed-off-by: Aaron Conole <aconole@redhat.com>
----
- include/lldp.h   | 6 ++++++
- lldp/l2_packet.h | 5 ++---
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/include/lldp.h b/include/lldp.h
-index fb5ee93..de6a4ad 100644
---- a/include/lldp.h
-+++ b/include/lldp.h
-@@ -255,5 +255,11 @@ enum {
- #define LLDP_EVB_DEFAULT_RTE				15
- #define LLDP_EVB_DEFAULT_MAX_RTE			31
- 
-+#ifndef _MSC_VER
-+#define STRUCT_PACKED(STRUCT) STRUCT __attribute__((__packed__))
-+#else
-+#define STRUCT_PACKED(STRUCT) __pragma(pack(push, 1)) STRUCT __pragma(pack(pop))
-+#endif
-+
- void somethingChangedLocal(const char *ifname, int type);
- #endif /* _LLDP_H */
-diff --git a/lldp/l2_packet.h b/lldp/l2_packet.h
-index 607b8a3..831958c 100644
---- a/lldp/l2_packet.h
-+++ b/lldp/l2_packet.h
-@@ -58,12 +58,11 @@
-  */
- struct l2_packet_data;
- 
--
--struct l2_ethhdr {
-+STRUCT_PACKED(struct l2_ethhdr {
- 	u8 h_dest[ETH_ALEN];
- 	u8 h_source[ETH_ALEN];
- 	u16 h_proto;
--} STRUCT_PACKED;
-+});
- 
- /**
-  * l2_packet_init - Initialize l2_packet interface
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-protocols/openlldp/files/0004-clif-Include-string.h-for-mem-function-prototypes.patch b/meta-networking/recipes-protocols/openlldp/files/0004-clif-Include-string.h-for-mem-function-prototypes.patch
new file mode 100644
index 0000000000..b6d9cf7707
--- /dev/null
+++ b/meta-networking/recipes-protocols/openlldp/files/0004-clif-Include-string.h-for-mem-function-prototypes.patch
@@ -0,0 +1,23 @@
+From d88aae2230683517b6d5b62cced51da81317a722 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 22:37:14 -0700
+Subject: [PATCH] clif: Include string.h for mem* function prototypes
+
+Upstream-Status: Submitted [https://github.com/intel/openlldp/pull/86]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clif.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/clif.c b/clif.c
+index cad6f75..0758a7e 100644
+--- a/clif.c
++++ b/clif.c
+@@ -32,6 +32,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
diff --git a/meta-networking/recipes-protocols/openlldp/files/0004-lldptool-make-extern.patch b/meta-networking/recipes-protocols/openlldp/files/0004-lldptool-make-extern.patch
deleted file mode 100644
index 16b7def684..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0004-lldptool-make-extern.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8229f4fb700ba4fcb2ec3e9956491bf5ee8c0ae2 Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Mon, 3 Aug 2020 15:17:31 -0400
-Subject: [PATCH 4/9] lldptool: make extern
-
-This should only exist per final linked object.
-
-Signed-off-by: Aaron Conole <aconole@redhat.com>
----
- include/lldptool.h | 2 +-
- lldptool.c         | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/lldptool.h b/include/lldptool.h
-index c919873..a190009 100644
---- a/include/lldptool.h
-+++ b/include/lldptool.h
-@@ -29,7 +29,7 @@
- 
- #include "clif.h"
- 
--struct lldp_head lldp_cli_head;
-+extern struct lldp_head lldp_cli_head;
- 
- int clif_command(struct clif *clif, char *cmd, int raw);
- void print_raw_message(char *msg, int print);
-diff --git a/lldptool.c b/lldptool.c
-index 664a248..d76cc48 100644
---- a/lldptool.c
-+++ b/lldptool.c
-@@ -64,6 +64,7 @@
- #include "lldp_util.h"
- #include "lldpad_status.h"
- 
-+struct lldp_head lldp_cli_head;
- struct lldp_head lldp_mod_head;
- 
- static int show_raw;
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-protocols/openlldp/files/0005-cisco_oui-match-encode-handler-prototypes.patch b/meta-networking/recipes-protocols/openlldp/files/0005-cisco_oui-match-encode-handler-prototypes.patch
deleted file mode 100644
index 4bdc5f2f62..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0005-cisco_oui-match-encode-handler-prototypes.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9203dec731e53fb72e1c0d62639e6e54378f66cc Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Mon, 3 Aug 2020 15:20:59 -0400
-Subject: [PATCH 5/9] cisco_oui: match encode handler prototypes
-
-The EXTERN_FN prototype generated requires size_t be the third parameter.
-
-Signed-off-by: Aaron Conole <aconole@redhat.com>
----
- vdptool_cisco_oui.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/vdptool_cisco_oui.c b/vdptool_cisco_oui.c
-index 7003521..3f88c76 100644
---- a/vdptool_cisco_oui.c
-+++ b/vdptool_cisco_oui.c
-@@ -28,7 +28,7 @@
- #include "lldp_util.h"
- #include "vdp_cisco.h"
- 
--bool cisco_oui_encode_hndlr(char *dst, char *src, int len)
-+bool cisco_oui_encode_hndlr(char *dst, char *src, size_t len)
- {
- 	char *src_temp = strdup(src);
- 	char *key, *data;
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-protocols/openlldp/files/0006-ecp22-make-enum-a-type-rather-than-instance.patch b/meta-networking/recipes-protocols/openlldp/files/0006-ecp22-make-enum-a-type-rather-than-instance.patch
deleted file mode 100644
index 2b0289df28..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0006-ecp22-make-enum-a-type-rather-than-instance.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2723219c08726efa08a6bad04ffb775f850a96bc Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Mon, 3 Aug 2020 15:23:28 -0400
-Subject: [PATCH 6/9] ecp22: make enum a type rather than instance
-
-The enum defined in the qbg header is setup as a discreet instance
-rather than a type.  Fix this.
-
-Signed-off-by: Aaron Conole <aconole@redhat.com>
----
- include/qbg_ecp22.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/qbg_ecp22.h b/include/qbg_ecp22.h
-index 567f6df..fe66bb3 100644
---- a/include/qbg_ecp22.h
-+++ b/include/qbg_ecp22.h
-@@ -49,10 +49,10 @@ enum {					/* ECP Transmit states */
- 	ECP22_TX_ERROR
- };
- 
--enum {
-+enum ecp22_mode {
- 	ECP22_REQUEST = 0,
- 	ECP22_ACK
--} ecp22_mode;
-+};
- 
- struct ecp22_hdr {		/* ECP22 header */
- 	u16 ver_op_sub;		/* ECP22 version, operation, subtype */
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-protocols/openlldp/files/0007-lldp_8021qaz-extern-config-object.patch b/meta-networking/recipes-protocols/openlldp/files/0007-lldp_8021qaz-extern-config-object.patch
deleted file mode 100644
index 36b575c566..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0007-lldp_8021qaz-extern-config-object.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 275fe9da663193a843de450f03e810daedc06955 Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Mon, 3 Aug 2020 15:25:38 -0400
-Subject: [PATCH 7/9] lldp_8021qaz: extern config object
-
-The config object only exists as part of the config translation unit
-so remove the extra config object in the 8021qaz module.
-
-Signed-off-by: Aaron Conole <aconole@redhat.com>
----
- lldp_8021qaz.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lldp_8021qaz.c b/lldp_8021qaz.c
-index a42fd11..673d758 100644
---- a/lldp_8021qaz.c
-+++ b/lldp_8021qaz.c
-@@ -49,7 +49,7 @@
- 
- 
- struct lldp_head lldp_head;
--struct config_t lldpad_cfg;
-+extern config_t lldpad_cfg;
- extern bool read_only_8021qaz;
- 
- static int ieee8021qaz_check_pending(struct port *port, struct lldp_agent *);
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-protocols/openlldp/files/0008-stringops-fix-some-string-copy-errors.patch b/meta-networking/recipes-protocols/openlldp/files/0008-stringops-fix-some-string-copy-errors.patch
deleted file mode 100644
index 501b66699c..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0008-stringops-fix-some-string-copy-errors.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 61291de03cb6dd1aea2a633eb72951f3fe453e7f Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Mon, 3 Aug 2020 15:33:08 -0400
-Subject: [PATCH 8/9] stringops: fix some string copy errors
-
-Reported when using gcc-10.
-
-Signed-off-by: Aaron Conole <aconole@redhat.com>
----
- dcb_protocol.c | 13 ++++---------
- lldp/ports.c   |  2 +-
- 2 files changed, 5 insertions(+), 10 deletions(-)
-
-diff --git a/dcb_protocol.c b/dcb_protocol.c
-index 75ca139..930251b 100644
---- a/dcb_protocol.c
-+++ b/dcb_protocol.c
-@@ -2257,13 +2257,8 @@ cmd_status get_bwg_descrpt(char *device_name, u8 bwgid, char **name)
- 
- 	if ((it != NULL) &&
- 		(bwgid < it->second->max_pgid_desc)) {
--		size = (int)strlen(it->second->pgid_desc[bwgid]) +
--			sizeof(char);  /* Localization OK */
--		*name = (char*)malloc(size);
--		if (*name != NULL) {
--			strncpy(*name, it->second->pgid_desc[bwgid],
--					size); /* Localization OK */
--		} else {
-+		*name = strdup(it->second->pgid_desc[bwgid]);
-+		if (*name == NULL) {
- 			goto Error;
- 		}
- 	} else {
-@@ -2272,9 +2267,9 @@ cmd_status get_bwg_descrpt(char *device_name, u8 bwgid, char **name)
- 			size = (int)strlen(
- 				attribs.descript.pgid_desc[bwgid]) +
- 				sizeof(char);
--			*name = (char*)malloc(size);
-+			*name = (char*)calloc(size, sizeof(char));
- 			if (*name != NULL) {
--				memcpy(*name, attribs.descript.pgid_desc[bwgid], size); /* Localization OK */
-+				memcpy(*name, attribs.descript.pgid_desc[bwgid], size - 1); /* Localization OK */
- 			} else {
- 				goto Error;
- 			}
-diff --git a/lldp/ports.c b/lldp/ports.c
-index 6384f14..9b681f7 100644
---- a/lldp/ports.c
-+++ b/lldp/ports.c
-@@ -264,7 +264,7 @@ struct port *add_port(int ifindex, const char *ifname)
- 	memset(newport, 0, sizeof(*newport));
- 	newport->ifindex = ifindex;
- 	newport->next = NULL;
--	strncpy(newport->ifname, ifname, IFNAMSIZ);
-+	strncpy(newport->ifname, ifname, IFNAMSIZ - 1);
- 
- 	newport->bond_master = is_bond(ifname);
- 	/* Initialize relevant port variables */
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-protocols/openlldp/files/0009-8021qaz-mark-prio-map-functions-static.patch b/meta-networking/recipes-protocols/openlldp/files/0009-8021qaz-mark-prio-map-functions-static.patch
deleted file mode 100644
index 0f84426f9b..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0009-8021qaz-mark-prio-map-functions-static.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7ae79b0dff53a23fa0a964f77b9e3bb387a293c4 Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Tue, 4 Aug 2020 09:17:50 -0400
-Subject: [PATCH 9/9] 8021qaz: mark prio map functions static
-
-Inline is not the correct way to mark a function for inclusion
-in a single translation unit.  Use 'static' to restrict export
-of these functions.
-
-Signed-off-by: Aaron Conole <aconole@redhat.com>
----
- lldp_8021qaz.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lldp_8021qaz.c b/lldp_8021qaz.c
-index 673d758..16ae167 100644
---- a/lldp_8021qaz.c
-+++ b/lldp_8021qaz.c
-@@ -397,7 +397,7 @@ static int read_cfg_file(char *ifname, struct lldp_agent *agent,
- 	return 0;
- }
- 
--inline int get_prio_map(u32 prio_map, int prio)
-+static int get_prio_map(u32 prio_map, int prio)
- {
- 	if (prio > 7)
- 		return 0;
-@@ -405,7 +405,7 @@ inline int get_prio_map(u32 prio_map, int prio)
- 	return (prio_map >> (4 * (7-prio))) & 0xF;
- }
- 
--inline void set_prio_map(u32 *prio_map, u8 prio, int tc)
-+static void set_prio_map(u32 *prio_map, u8 prio, int tc)
- {
- 	u32 mask = ~(0xffffffff & (0xF << (4 * (7-prio))));
- 	*prio_map &= mask;
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch b/meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch
deleted file mode 100644
index bb3400cfa6..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch
+++ /dev/null
@@ -1,331 +0,0 @@
-From ed6a8e5a75f56b7034a46294a0bf2a9a7fd14fbc Mon Sep 17 00:00:00 2001
-From: Aaron Conole <aconole@redhat.com>
-Date: Fri, 23 Oct 2020 14:40:32 -0400
-Subject: [PATCH] lldp_head: remove all references
-
-There were a number of references missed during the module cleanup.  This hits the remaining
-ones.
-
-Fixes: 07a83c583b9d ("lldp_head: rename and make extern")
-Signed-off-by: Aaron Conole <aconole@redhat.com>
-
-Reference to upstream patch:
-https://github.com/intel/openlldp/commit/ed6a8e5a75f56b7034a46294a0bf2a9a7fd14fbc
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- ctrl_iface.c   |  4 +---
- lldp_8021qaz.c | 11 +++++------
- lldp_8023.c    |  6 ++----
- lldp_basman.c  |  6 ++----
- lldp_evb.c     |  6 ++----
- lldp_evb22.c   |  6 ++----
- lldp_mand.c    | 10 ++++------
- lldp_med.c     |  6 ++----
- qbg_utils.c    |  3 +--
- 9 files changed, 21 insertions(+), 37 deletions(-)
-
-diff --git a/ctrl_iface.c b/ctrl_iface.c
-index 1734f49..666f7c8 100644
---- a/ctrl_iface.c
-+++ b/ctrl_iface.c
-@@ -53,8 +53,6 @@
- #include "lldp_util.h"
- #include "messages.h"
- 
--extern struct lldp_head lldp_head;
--
- struct ctrl_dst {
- 	struct ctrl_dst *next;
- 	struct sockaddr_un addr;
-@@ -116,7 +114,7 @@ int clif_iface_module(struct clif_data *clifd,
- 		return cmd_invalid;
- 	}
- 
--	mod = find_module_by_id(&lldp_head, module_id);
-+	mod = find_module_by_id(&lldp_mod_head, module_id);
- 	if (mod && mod->ops && mod->ops->client_cmd)
- 		return  (mod->ops->client_cmd)(clifd, from, fromlen,
- 			 cmd_start, cmd_len, rbuf+strlen(rbuf), rlen);
-diff --git a/lldp_8021qaz.c b/lldp_8021qaz.c
-index 16ae167..e747710 100644
---- a/lldp_8021qaz.c
-+++ b/lldp_8021qaz.c
-@@ -48,7 +48,6 @@
- #include "lldp_dcbx.h"
- 
- 
--struct lldp_head lldp_head;
- extern config_t lldpad_cfg;
- extern bool read_only_8021qaz;
- 
-@@ -84,7 +83,7 @@ static int ieee8021qaz_check_pending(struct port *port,
- 	if (!port->portEnabled)
- 		return 0;
- 
--	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
-+	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
- 	if (iud) {
- 		LIST_FOREACH(tlv, &iud->head, entry) {
- 			if (!strncmp(port->ifname, tlv->ifname, IFNAMSIZ)) {
-@@ -143,7 +142,7 @@ struct ieee8021qaz_tlvs *ieee8021qaz_data(const char *ifname)
- 	struct ieee8021qaz_user_data *iud;
- 	struct ieee8021qaz_tlvs *tlv = NULL;
- 
--	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
-+	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
- 	if (iud) {
- 		LIST_FOREACH(tlv, &iud->head, entry) {
- 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
-@@ -629,7 +628,7 @@ void ieee8021qaz_ifup(char *ifname, struct lldp_agent *agent)
- 	LIST_INIT(&tlvs->app_head);
- 	read_cfg_file(port->ifname, agent, tlvs);
- 
--	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
-+	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
- 	LIST_INSERT_HEAD(&iud->head, tlvs, entry);
- 
- initialized:
-@@ -2179,7 +2178,7 @@ int ieee8021qaz_tlvs_rxed(const char *ifname)
- 	struct ieee8021qaz_user_data *iud;
- 	struct ieee8021qaz_tlvs *tlv = NULL;
- 
--	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
-+	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
- 	if (iud) {
- 		LIST_FOREACH(tlv, &iud->head, entry) {
- 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
-@@ -2198,7 +2197,7 @@ int ieee8021qaz_check_active(const char *ifname)
- 	struct ieee8021qaz_user_data *iud;
- 	struct ieee8021qaz_tlvs *tlv = NULL;
- 
--	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
-+	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
- 	if (iud) {
- 		LIST_FOREACH(tlv, &iud->head, entry) {
- 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
-diff --git a/lldp_8023.c b/lldp_8023.c
-index 422026e..8a03211 100644
---- a/lldp_8023.c
-+++ b/lldp_8023.c
-@@ -39,8 +39,6 @@
- #include "lldp_8023_clif.h"
- #include "lldp_8023_cmds.h"
- 
--extern struct lldp_head lldp_head;
--
- struct tlv_info_8023_maccfg {
- 	u8 oui[3];
- 	u8 sub;
-@@ -84,7 +82,7 @@ static struct ieee8023_data *ieee8023_data(const char *ifname, enum agent_type t
- 	struct ieee8023_user_data *ud;
- 	struct ieee8023_data *bd = NULL;
- 
--	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8023);
-+	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8023);
- 	if (ud) {
- 		LIST_FOREACH(bd, &ud->head, entry) {
- 			if (!strncmp(ifname, bd->ifname, IFNAMSIZ) &&
-@@ -456,7 +454,7 @@ void ieee8023_ifup(char *ifname, struct lldp_agent *agent)
- 		goto out_err;
- 	}
- 
--	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8023);
-+	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8023);
- 	LIST_INSERT_HEAD(&ud->head, bd, entry);
- 	LLDPAD_INFO("%s:port %s added\n", __func__, ifname);
- 	return;
-diff --git a/lldp_basman.c b/lldp_basman.c
-index a4f69c1..614e2a2 100644
---- a/lldp_basman.c
-+++ b/lldp_basman.c
-@@ -75,8 +75,6 @@ struct tlv_info_manaddr {
- 	struct tlv_info_maoid o;
- } __attribute__ ((__packed__));
- 
--extern struct lldp_head lldp_head;
--
- static const struct lldp_mod_ops basman_ops =  {
- 	.lldp_mod_register 	= basman_register,
- 	.lldp_mod_unregister 	= basman_unregister,
-@@ -91,7 +89,7 @@ static struct basman_data *basman_data(const char *ifname, enum agent_type type)
- 	struct basman_user_data *bud;
- 	struct basman_data *bd = NULL;
- 
--	bud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_BASIC);
-+	bud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_BASIC);
- 	if (bud) {
- 		LIST_FOREACH(bd, &bud->head, entry) {
- 			if (!strncmp(ifname, bd->ifname, IFNAMSIZ) &&
-@@ -688,7 +686,7 @@ void basman_ifup(char *ifname, struct lldp_agent *agent)
- 		goto out_err;
- 	}
- 
--	bud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_BASIC);
-+	bud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_BASIC);
- 	LIST_INSERT_HEAD(&bud->head, bd, entry);
- 	LLDPAD_DBG("%s:port %s added\n", __func__, ifname);
- 	return;
-diff --git a/lldp_evb.c b/lldp_evb.c
-index dcdcc7e..a8f3965 100644
---- a/lldp_evb.c
-+++ b/lldp_evb.c
-@@ -36,14 +36,12 @@
- #include "messages.h"
- #include "config.h"
- 
--extern struct lldp_head lldp_head;
--
- struct evb_data *evb_data(char *ifname, enum agent_type type)
- {
- 	struct evb_user_data *ud;
- 	struct evb_data *ed = NULL;
- 
--	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_EVB);
-+	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_EVB);
- 	if (ud) {
- 		LIST_FOREACH(ed, &ud->head, entry) {
- 			if (!strncmp(ifname, ed->ifname, IFNAMSIZ) &&
-@@ -347,7 +345,7 @@ static void evb_ifup(char *ifname, struct lldp_agent *agent)
- 
- 	evb_init_tlv(ed, agent);
- 
--	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_EVB);
-+	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_EVB);
- 	LIST_INSERT_HEAD(&ud->head, ed, entry);
- 	LLDPAD_DBG("%s:%s agent %d added\n", __func__, ifname, agent->type);
- }
-diff --git a/lldp_evb22.c b/lldp_evb22.c
-index 76ba883..6e92d9d 100644
---- a/lldp_evb22.c
-+++ b/lldp_evb22.c
-@@ -37,14 +37,12 @@
- #include "messages.h"
- #include "config.h"
- 
--extern struct lldp_head lldp_head;
--
- struct evb22_data *evb22_data(char *ifname, enum agent_type type)
- {
- 	struct evb22_user_data *ud;
- 	struct evb22_data *ed = NULL;
- 
--	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_EVB22);
-+	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_EVB22);
- 	if (ud) {
- 		LIST_FOREACH(ed, &ud->head, entry) {
- 			if (!strncmp(ifname, ed->ifname, IFNAMSIZ) &&
-@@ -453,7 +451,7 @@ static void evb22_ifup(char *ifname, struct lldp_agent *agent)
- 	STRNCPY_TERMINATED(ed->ifname, ifname, IFNAMSIZ);
- 	ed->agenttype = agent->type;
- 	evb22_init_tlv(ed, agent);
--	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_EVB22);
-+	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_EVB22);
- 	LIST_INSERT_HEAD(&ud->head, ed, entry);
- 	LLDPAD_DBG("%s:%s agent %d added\n", __func__, ifname, agent->type);
- }
-diff --git a/lldp_mand.c b/lldp_mand.c
-index 0db63cb..b857a88 100644
---- a/lldp_mand.c
-+++ b/lldp_mand.c
-@@ -42,8 +42,6 @@
- #include "lldp/l2_packet.h"
- #include "lldp_tlv.h"
- 
--extern struct lldp_head lldp_head;
--
- static const struct lldp_mod_ops mand_ops = {
- 	.lldp_mod_register 	= mand_register,
- 	.lldp_mod_unregister 	= mand_unregister,
-@@ -59,7 +57,7 @@ struct mand_data *mand_data(const char *ifname, enum agent_type type)
- 	struct mand_user_data *mud;
- 	struct mand_data *md = NULL;
- 
--	mud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_MAND);
-+	mud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_MAND);
- 	if (mud) {
- 		LIST_FOREACH(md, &mud->head, entry) {
- 			if (!strncmp(ifname, md->ifname, IFNAMSIZ) &&
-@@ -608,7 +606,7 @@ void mand_ifup(char *ifname, struct lldp_agent *agent)
- 		STRNCPY_TERMINATED(md->ifname, ifname, IFNAMSIZ);
- 		md->agenttype = agent->type;
- 
--		mud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_MAND);
-+		mud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_MAND);
- 		LIST_INSERT_HEAD(&mud->head, md, entry);
- 	}
- 
-@@ -636,7 +634,7 @@ struct lldp_module *mand_register(void)
- 		LLDPAD_ERR("failed to malloc LLDP Mandatory module data\n");
- 		goto out_err;
- 	}
--	mud = malloc(sizeof(struct mand_user_data));
-+    mud = malloc(sizeof(struct mand_user_data));
- 	if (!mud) {
- 		free(mod);
- 		LLDPAD_ERR("failed to malloc LLDP Mandatory module user data\n");
-@@ -644,8 +642,8 @@ struct lldp_module *mand_register(void)
- 	}
- 	LIST_INIT(&mud->head);
-  	mod->id = LLDP_MOD_MAND;
-+    mod->data = mud;
- 	mod->ops = &mand_ops;
--	mod->data = mud;
- 	LLDPAD_INFO("%s:done\n", __func__);
- 	return mod;
- out_err:
-diff --git a/lldp_med.c b/lldp_med.c
-index f6c373e..7b6996e 100644
---- a/lldp_med.c
-+++ b/lldp_med.c
-@@ -40,8 +40,6 @@
- #include "lldp_mand_clif.h"
- #include "lldp_med_cmds.h"
- 
--extern struct lldp_head lldp_head;
--
- struct tlv_info_medcaps {
- 	u8 oui[OUI_SIZE];
- 	u8 subtype;
-@@ -95,7 +93,7 @@ static struct med_data *med_data(const char *ifname, enum agent_type type)
- 	struct med_user_data *mud;
- 	struct med_data *md = NULL;
- 
--	mud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_MED);
-+	mud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_MED);
- 	if (mud) {
- 		LIST_FOREACH(md, &mud->head, entry) {
- 			if (!strncmp(ifname, md->ifname, IFNAMSIZ) &&
-@@ -914,7 +912,7 @@ void med_ifup(char *ifname, struct lldp_agent *agent)
- 		free(md);
- 		goto out_err;
- 	}
--	mud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_MED);
-+	mud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_MED);
- 	LIST_INSERT_HEAD(&mud->head, md, entry);
- 	LLDPAD_INFO("%s:port %s added\n", __func__, ifname);
- 	return;
-diff --git a/qbg_utils.c b/qbg_utils.c
-index 9daeade..0d40c5b 100644
---- a/qbg_utils.c
-+++ b/qbg_utils.c
-@@ -36,7 +36,6 @@
- #include "qbg_utils.h"
- 
- extern int loglvl;			/* Global lldpad log level */
--extern struct lldp_head lldp_head;
- 
- /*
-  * hexdump_frame - print raw evb/ecp/vdp frame
-@@ -73,7 +72,7 @@ void hexdump_frame(const char *ifname, char *txt, const unsigned char *buf,
-  */
- int modules_notify(int id, int sender_id, char *ifname, void *data)
- {
--	struct lldp_module *mp = find_module_by_id(&lldp_head, id);
-+	struct lldp_module *mp = find_module_by_id(&lldp_mod_head, id);
- 	int rc = 0;
- 
- 	if (mp && mp->ops->lldp_mod_notify)
--- 
-2.18.1
-
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
similarity index 57%
rename from meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
rename to meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
index acde9c3659..812f4fbcf0 100644
--- a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
@@ -12,27 +12,15 @@ inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
 
 DEPENDS = "libnl libconfig readline"
 
-SRCREV = "b71bfb87fefb31c4b1a6a7ae351791c90966c3a8"
+SRCREV = "85e55837a81d710e5baa7da47f7ed0d205c8ede5"
 PV .= "+git${SRCPV}"
-SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=branch-1.1 \
            file://0001-Fix-musl-libc-build-issue.patch \
            file://0001-autotools-Add-include-path-to-generated-version.h.patch \
            file://0001-autotools-Add-option-to-disable-installation-of-syst.patch \
-           file://0001-cmds-fix-enum-conversion.patch \
-           file://0002-lldp_head-rename-and-make-extern.patch \
-           file://0003-lldp-add-packed-struct-definition.patch \
-           file://0004-lldptool-make-extern.patch \
-           file://0005-cisco_oui-match-encode-handler-prototypes.patch \
-           file://0006-ecp22-make-enum-a-type-rather-than-instance.patch \
-           file://0007-lldp_8021qaz-extern-config-object.patch \
-           file://0008-stringops-fix-some-string-copy-errors.patch \
-           file://0009-8021qaz-mark-prio-map-functions-static.patch \
-           file://lldp_head-remove-all-references.patch \
+           file://0004-clif-Include-string.h-for-mem-function-prototypes.patch \
            "
 
-# Makefile.am adds -Werror to AM_CFLAGS. There are warnings so disable it.
-TARGET_CFLAGS += "-Wno-error"
-
 # Enable install of systemd conf files.
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_system_unitdir}', '', d)}"
 
-- 
2.37.2


