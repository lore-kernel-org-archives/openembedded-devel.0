Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.11421.1629036404693661683
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aJA5Qmfg;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id n12so17204816plf.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Zad+5Xw6zUpL35n4bQvVCvg2NtM4y2pmy+fEVtMne/4=;
        b=aJA5QmfgpONgwfibDj3Kj3MacSB7gR2QCsdwP/4sOARhHtPPq3+jvucVP8uRusBNPG
         F7H27BW3k/LalyZnsoktVgl+cqI8z3B6gOhPMiDMa6DqRom9EpkSv/Wn7rWnNnxgSy5D
         tNYpf0M3MNr1qH3JVDPRZ+v6Q1vrzxv06LnU5SFnxSmIicuy7ZV3MSPdSJ4SymTHgzcJ
         Y0UvUhqFU0HCzGDkLcSNCU6mlB3+c4cIzClqDgP6r73ZDyuXMVohsy2rZzh/7S+UY1Np
         afYxJdTroFrG/qGxO5xr1mOHrHRZsPuNCP1Tl4jhmYELQ40t51MLi/vHqiOdaBIlHBiA
         2L9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zad+5Xw6zUpL35n4bQvVCvg2NtM4y2pmy+fEVtMne/4=;
        b=GOO0qdiW5GHnQg5e3e6ZcVXMBuWLdN0SV1v2BkL+OQmnjYzmogeOQLY+AW1R0bk96j
         rmTkmR+AZykd4vkItYXCzqbqslo+NEUkSWxYWKmBK5UHrr1lyyNeTnmVbDh85JnKqsU1
         lznGgktzmVGpK3JuNhJYcgwbUBMt4GFa8KSYrufH5bBWseuQFExEPGAI9skSv00zWoBO
         00JUSISyAM5JHPZ30iiDv/ID0Nrxtmb/mKtU0TQNema5cm/HQSdGizLjpTRUXrO6r3XF
         rencI79kt6gC8IzXzjFwXFvnn9cgkG68GPLwkru3FJOv9Gg9EpNMJHSSHLL2b95+M2oI
         i/EQ==
X-Gm-Message-State: AOAM531qlxSwif2z21ITqG0Ywx7l1K7WuDzj8C9y+6Ozd4dXrhf6D7Ad
	+k3v47oL5Qkl7YGMXPRzEYh3kSJ6DE/yGQ==
X-Google-Smtp-Source: ABdhPJzRbsZ1apNJ+0JxOxw1a1X1MTn9w+qwEQd83OclJPcBA1h1ZbFs+r3KGW5uBX57AtOQRCDAPA==
X-Received: by 2002:a17:90a:bf92:: with SMTP id d18mr12390862pjs.193.1629036404040;
        Sun, 15 Aug 2021 07:06:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:43 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 04/18] openlldp: fix segfault
Date: Sun, 15 Aug 2021 07:06:16 -0700
Message-Id: <e20a9a88502ea6098b6b654e83fcde002ff977d7.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Wang <li.wang@windriver.com>

~ lldpad -d
~ 8021q: 802.1Q VLAN Support v1.8
~ 8021q: adding VLAN 0 to HW filter on device eth0
~ lldpad[xxx]: segfault at 0 ip xxx sp xxx error 4 in lldpad[xxx+xxx]
~ Code: xxx

the issue is introduced by:
0002-lldp_head-rename-and-make-extern.patch

Upstream patches:
https://github.com/intel/openlldp/commit/ed6a8e5a75f56b7034a46294a0bf2a9a7fd14fbc

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 145f59ba75c992c4ce1f808308c041c1f7519244)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../lldp_head-remove-all-references.patch     | 331 ++++++++++++++++++
 .../openlldp/openlldp_1.0.1.bb                |   1 +
 2 files changed, 332 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch

diff --git a/meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch b/meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch
new file mode 100644
index 0000000000..bb3400cfa6
--- /dev/null
+++ b/meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch
@@ -0,0 +1,331 @@
+From ed6a8e5a75f56b7034a46294a0bf2a9a7fd14fbc Mon Sep 17 00:00:00 2001
+From: Aaron Conole <aconole@redhat.com>
+Date: Fri, 23 Oct 2020 14:40:32 -0400
+Subject: [PATCH] lldp_head: remove all references
+
+There were a number of references missed during the module cleanup.  This hits the remaining
+ones.
+
+Fixes: 07a83c583b9d ("lldp_head: rename and make extern")
+Signed-off-by: Aaron Conole <aconole@redhat.com>
+
+Reference to upstream patch:
+https://github.com/intel/openlldp/commit/ed6a8e5a75f56b7034a46294a0bf2a9a7fd14fbc
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ ctrl_iface.c   |  4 +---
+ lldp_8021qaz.c | 11 +++++------
+ lldp_8023.c    |  6 ++----
+ lldp_basman.c  |  6 ++----
+ lldp_evb.c     |  6 ++----
+ lldp_evb22.c   |  6 ++----
+ lldp_mand.c    | 10 ++++------
+ lldp_med.c     |  6 ++----
+ qbg_utils.c    |  3 +--
+ 9 files changed, 21 insertions(+), 37 deletions(-)
+
+diff --git a/ctrl_iface.c b/ctrl_iface.c
+index 1734f49..666f7c8 100644
+--- a/ctrl_iface.c
++++ b/ctrl_iface.c
+@@ -53,8 +53,6 @@
+ #include "lldp_util.h"
+ #include "messages.h"
+ 
+-extern struct lldp_head lldp_head;
+-
+ struct ctrl_dst {
+ 	struct ctrl_dst *next;
+ 	struct sockaddr_un addr;
+@@ -116,7 +114,7 @@ int clif_iface_module(struct clif_data *clifd,
+ 		return cmd_invalid;
+ 	}
+ 
+-	mod = find_module_by_id(&lldp_head, module_id);
++	mod = find_module_by_id(&lldp_mod_head, module_id);
+ 	if (mod && mod->ops && mod->ops->client_cmd)
+ 		return  (mod->ops->client_cmd)(clifd, from, fromlen,
+ 			 cmd_start, cmd_len, rbuf+strlen(rbuf), rlen);
+diff --git a/lldp_8021qaz.c b/lldp_8021qaz.c
+index 16ae167..e747710 100644
+--- a/lldp_8021qaz.c
++++ b/lldp_8021qaz.c
+@@ -48,7 +48,6 @@
+ #include "lldp_dcbx.h"
+ 
+ 
+-struct lldp_head lldp_head;
+ extern config_t lldpad_cfg;
+ extern bool read_only_8021qaz;
+ 
+@@ -84,7 +83,7 @@ static int ieee8021qaz_check_pending(struct port *port,
+ 	if (!port->portEnabled)
+ 		return 0;
+ 
+-	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
++	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
+ 	if (iud) {
+ 		LIST_FOREACH(tlv, &iud->head, entry) {
+ 			if (!strncmp(port->ifname, tlv->ifname, IFNAMSIZ)) {
+@@ -143,7 +142,7 @@ struct ieee8021qaz_tlvs *ieee8021qaz_data(const char *ifname)
+ 	struct ieee8021qaz_user_data *iud;
+ 	struct ieee8021qaz_tlvs *tlv = NULL;
+ 
+-	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
++	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
+ 	if (iud) {
+ 		LIST_FOREACH(tlv, &iud->head, entry) {
+ 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
+@@ -629,7 +628,7 @@ void ieee8021qaz_ifup(char *ifname, struct lldp_agent *agent)
+ 	LIST_INIT(&tlvs->app_head);
+ 	read_cfg_file(port->ifname, agent, tlvs);
+ 
+-	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
++	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
+ 	LIST_INSERT_HEAD(&iud->head, tlvs, entry);
+ 
+ initialized:
+@@ -2179,7 +2178,7 @@ int ieee8021qaz_tlvs_rxed(const char *ifname)
+ 	struct ieee8021qaz_user_data *iud;
+ 	struct ieee8021qaz_tlvs *tlv = NULL;
+ 
+-	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
++	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
+ 	if (iud) {
+ 		LIST_FOREACH(tlv, &iud->head, entry) {
+ 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
+@@ -2198,7 +2197,7 @@ int ieee8021qaz_check_active(const char *ifname)
+ 	struct ieee8021qaz_user_data *iud;
+ 	struct ieee8021qaz_tlvs *tlv = NULL;
+ 
+-	iud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8021QAZ);
++	iud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8021QAZ);
+ 	if (iud) {
+ 		LIST_FOREACH(tlv, &iud->head, entry) {
+ 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
+diff --git a/lldp_8023.c b/lldp_8023.c
+index 422026e..8a03211 100644
+--- a/lldp_8023.c
++++ b/lldp_8023.c
+@@ -39,8 +39,6 @@
+ #include "lldp_8023_clif.h"
+ #include "lldp_8023_cmds.h"
+ 
+-extern struct lldp_head lldp_head;
+-
+ struct tlv_info_8023_maccfg {
+ 	u8 oui[3];
+ 	u8 sub;
+@@ -84,7 +82,7 @@ static struct ieee8023_data *ieee8023_data(const char *ifname, enum agent_type t
+ 	struct ieee8023_user_data *ud;
+ 	struct ieee8023_data *bd = NULL;
+ 
+-	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8023);
++	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8023);
+ 	if (ud) {
+ 		LIST_FOREACH(bd, &ud->head, entry) {
+ 			if (!strncmp(ifname, bd->ifname, IFNAMSIZ) &&
+@@ -456,7 +454,7 @@ void ieee8023_ifup(char *ifname, struct lldp_agent *agent)
+ 		goto out_err;
+ 	}
+ 
+-	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_8023);
++	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_8023);
+ 	LIST_INSERT_HEAD(&ud->head, bd, entry);
+ 	LLDPAD_INFO("%s:port %s added\n", __func__, ifname);
+ 	return;
+diff --git a/lldp_basman.c b/lldp_basman.c
+index a4f69c1..614e2a2 100644
+--- a/lldp_basman.c
++++ b/lldp_basman.c
+@@ -75,8 +75,6 @@ struct tlv_info_manaddr {
+ 	struct tlv_info_maoid o;
+ } __attribute__ ((__packed__));
+ 
+-extern struct lldp_head lldp_head;
+-
+ static const struct lldp_mod_ops basman_ops =  {
+ 	.lldp_mod_register 	= basman_register,
+ 	.lldp_mod_unregister 	= basman_unregister,
+@@ -91,7 +89,7 @@ static struct basman_data *basman_data(const char *ifname, enum agent_type type)
+ 	struct basman_user_data *bud;
+ 	struct basman_data *bd = NULL;
+ 
+-	bud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_BASIC);
++	bud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_BASIC);
+ 	if (bud) {
+ 		LIST_FOREACH(bd, &bud->head, entry) {
+ 			if (!strncmp(ifname, bd->ifname, IFNAMSIZ) &&
+@@ -688,7 +686,7 @@ void basman_ifup(char *ifname, struct lldp_agent *agent)
+ 		goto out_err;
+ 	}
+ 
+-	bud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_BASIC);
++	bud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_BASIC);
+ 	LIST_INSERT_HEAD(&bud->head, bd, entry);
+ 	LLDPAD_DBG("%s:port %s added\n", __func__, ifname);
+ 	return;
+diff --git a/lldp_evb.c b/lldp_evb.c
+index dcdcc7e..a8f3965 100644
+--- a/lldp_evb.c
++++ b/lldp_evb.c
+@@ -36,14 +36,12 @@
+ #include "messages.h"
+ #include "config.h"
+ 
+-extern struct lldp_head lldp_head;
+-
+ struct evb_data *evb_data(char *ifname, enum agent_type type)
+ {
+ 	struct evb_user_data *ud;
+ 	struct evb_data *ed = NULL;
+ 
+-	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_EVB);
++	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_EVB);
+ 	if (ud) {
+ 		LIST_FOREACH(ed, &ud->head, entry) {
+ 			if (!strncmp(ifname, ed->ifname, IFNAMSIZ) &&
+@@ -347,7 +345,7 @@ static void evb_ifup(char *ifname, struct lldp_agent *agent)
+ 
+ 	evb_init_tlv(ed, agent);
+ 
+-	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_EVB);
++	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_EVB);
+ 	LIST_INSERT_HEAD(&ud->head, ed, entry);
+ 	LLDPAD_DBG("%s:%s agent %d added\n", __func__, ifname, agent->type);
+ }
+diff --git a/lldp_evb22.c b/lldp_evb22.c
+index 76ba883..6e92d9d 100644
+--- a/lldp_evb22.c
++++ b/lldp_evb22.c
+@@ -37,14 +37,12 @@
+ #include "messages.h"
+ #include "config.h"
+ 
+-extern struct lldp_head lldp_head;
+-
+ struct evb22_data *evb22_data(char *ifname, enum agent_type type)
+ {
+ 	struct evb22_user_data *ud;
+ 	struct evb22_data *ed = NULL;
+ 
+-	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_EVB22);
++	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_EVB22);
+ 	if (ud) {
+ 		LIST_FOREACH(ed, &ud->head, entry) {
+ 			if (!strncmp(ifname, ed->ifname, IFNAMSIZ) &&
+@@ -453,7 +451,7 @@ static void evb22_ifup(char *ifname, struct lldp_agent *agent)
+ 	STRNCPY_TERMINATED(ed->ifname, ifname, IFNAMSIZ);
+ 	ed->agenttype = agent->type;
+ 	evb22_init_tlv(ed, agent);
+-	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_EVB22);
++	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_EVB22);
+ 	LIST_INSERT_HEAD(&ud->head, ed, entry);
+ 	LLDPAD_DBG("%s:%s agent %d added\n", __func__, ifname, agent->type);
+ }
+diff --git a/lldp_mand.c b/lldp_mand.c
+index 0db63cb..b857a88 100644
+--- a/lldp_mand.c
++++ b/lldp_mand.c
+@@ -42,8 +42,6 @@
+ #include "lldp/l2_packet.h"
+ #include "lldp_tlv.h"
+ 
+-extern struct lldp_head lldp_head;
+-
+ static const struct lldp_mod_ops mand_ops = {
+ 	.lldp_mod_register 	= mand_register,
+ 	.lldp_mod_unregister 	= mand_unregister,
+@@ -59,7 +57,7 @@ struct mand_data *mand_data(const char *ifname, enum agent_type type)
+ 	struct mand_user_data *mud;
+ 	struct mand_data *md = NULL;
+ 
+-	mud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_MAND);
++	mud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_MAND);
+ 	if (mud) {
+ 		LIST_FOREACH(md, &mud->head, entry) {
+ 			if (!strncmp(ifname, md->ifname, IFNAMSIZ) &&
+@@ -608,7 +606,7 @@ void mand_ifup(char *ifname, struct lldp_agent *agent)
+ 		STRNCPY_TERMINATED(md->ifname, ifname, IFNAMSIZ);
+ 		md->agenttype = agent->type;
+ 
+-		mud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_MAND);
++		mud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_MAND);
+ 		LIST_INSERT_HEAD(&mud->head, md, entry);
+ 	}
+ 
+@@ -636,7 +634,7 @@ struct lldp_module *mand_register(void)
+ 		LLDPAD_ERR("failed to malloc LLDP Mandatory module data\n");
+ 		goto out_err;
+ 	}
+-	mud = malloc(sizeof(struct mand_user_data));
++    mud = malloc(sizeof(struct mand_user_data));
+ 	if (!mud) {
+ 		free(mod);
+ 		LLDPAD_ERR("failed to malloc LLDP Mandatory module user data\n");
+@@ -644,8 +642,8 @@ struct lldp_module *mand_register(void)
+ 	}
+ 	LIST_INIT(&mud->head);
+  	mod->id = LLDP_MOD_MAND;
++    mod->data = mud;
+ 	mod->ops = &mand_ops;
+-	mod->data = mud;
+ 	LLDPAD_INFO("%s:done\n", __func__);
+ 	return mod;
+ out_err:
+diff --git a/lldp_med.c b/lldp_med.c
+index f6c373e..7b6996e 100644
+--- a/lldp_med.c
++++ b/lldp_med.c
+@@ -40,8 +40,6 @@
+ #include "lldp_mand_clif.h"
+ #include "lldp_med_cmds.h"
+ 
+-extern struct lldp_head lldp_head;
+-
+ struct tlv_info_medcaps {
+ 	u8 oui[OUI_SIZE];
+ 	u8 subtype;
+@@ -95,7 +93,7 @@ static struct med_data *med_data(const char *ifname, enum agent_type type)
+ 	struct med_user_data *mud;
+ 	struct med_data *md = NULL;
+ 
+-	mud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_MED);
++	mud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_MED);
+ 	if (mud) {
+ 		LIST_FOREACH(md, &mud->head, entry) {
+ 			if (!strncmp(ifname, md->ifname, IFNAMSIZ) &&
+@@ -914,7 +912,7 @@ void med_ifup(char *ifname, struct lldp_agent *agent)
+ 		free(md);
+ 		goto out_err;
+ 	}
+-	mud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_MED);
++	mud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_MED);
+ 	LIST_INSERT_HEAD(&mud->head, md, entry);
+ 	LLDPAD_INFO("%s:port %s added\n", __func__, ifname);
+ 	return;
+diff --git a/qbg_utils.c b/qbg_utils.c
+index 9daeade..0d40c5b 100644
+--- a/qbg_utils.c
++++ b/qbg_utils.c
+@@ -36,7 +36,6 @@
+ #include "qbg_utils.h"
+ 
+ extern int loglvl;			/* Global lldpad log level */
+-extern struct lldp_head lldp_head;
+ 
+ /*
+  * hexdump_frame - print raw evb/ecp/vdp frame
+@@ -73,7 +72,7 @@ void hexdump_frame(const char *ifname, char *txt, const unsigned char *buf,
+  */
+ int modules_notify(int id, int sender_id, char *ifname, void *data)
+ {
+-	struct lldp_module *mp = find_module_by_id(&lldp_head, id);
++	struct lldp_module *mp = find_module_by_id(&lldp_mod_head, id);
+ 	int rc = 0;
+ 
+ 	if (mp && mp->ops->lldp_mod_notify)
+-- 
+2.18.1
+
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
index d8a0d6913a..ec3e557ad9 100644
--- a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=master \
            file://0007-lldp_8021qaz-extern-config-object.patch \
            file://0008-stringops-fix-some-string-copy-errors.patch \
            file://0009-8021qaz-mark-prio-map-functions-static.patch \
+           file://lldp_head-remove-all-references.patch \
            "
 
 # Makefile.am adds -Werror to AM_CFLAGS. There are warnings so disable it.
-- 
2.25.1

