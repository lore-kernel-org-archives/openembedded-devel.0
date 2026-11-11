Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3546.1794376449300784715
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fgv5HtqP;
 spf=pass (domain: mvista.com, ip: 74.125.82.46, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b244fb7fffso3484562c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 21:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1794376448; x=1794981248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTNvFIXbtW0n8kkDj+fHo2GWICmZJv4CuB9vPzsDum8=;
        b=fgv5HtqPTbpP2+sHO2lBxiMGBqg9ixcsOiVouJ3dpSaQzKPx7+4H2oENAPgj39Wkhd
         yjChgGQPuP6rbe1boBdyDZJxXnT2x4CXCM1DXuC/MJfGRuH43m/FawUuHmmyoUtD1Sli
         SUUHwqbF6GFR6PfMf2z3keQcTrtNGuVApo85k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376448; x=1794981248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTNvFIXbtW0n8kkDj+fHo2GWICmZJv4CuB9vPzsDum8=;
        b=GYbGHb7fJ8EVJ2DcvFaGlXbclr8Pj8G3pMmIUR6ye7gEEuYZKWP1OeAiuOs9Virsuo
         9Wh9IgxjVc9pJkdLR1Exz6dZrb5pn+j6W5k19+pXV6smxcK8g14W/fJY9znFHM79zi2L
         z3GyOFmHR6TMigL7cW5DD5z4GDMcx4xisrniS74Z2vzk0yosZdjatA+SGolAH/hhEjEX
         MLpS5iTX3LnTRFXcKmBTUBHOI7il4oLMKj8yFMFKAIK7QRiJidW0XsUdUSSmnhxmDhZc
         u8EaGzVkHgHdedM6MWOLukdwfVPfQX8Wx2D5oMiteBUuhvM1pd6hRn85A2l7srjKb/Ac
         lnbg==
X-Gm-Message-State: APuU4Z+E7edVcOFQ+MRmrNzKlBxiC1Irlc8xLI7doKW8uzQ3pMCy2nSa
	1n/Z6QkF9YzXmyN4tHSUhKseDKUvXw8+KtwveSZK4EqOapWTL+OHisQrrRV4dPHZog+CB+/VgML
	l+A/0uh8=
X-Gm-Gg: AYBFou0sfUAd3qN7fBvQpDfUdUX0rpzQneQeMFrz+Ni15JjLROSYbM5NqBDOUBPrOtv
	71Oe9v4BpKtliGi/+8cRUHgcLxI+kvWluOC7Z6tMC1qPX72myHtbm20Fpoz067k1jpqzXXcrim/
	+9MjKtnIIfjiC0HP0pmbkqQjM1vXZk1wy8Cr9bxI2DJhXLdlVCDtn+BfVsy9SICvouUr4wmKC/P
	uV63SoMM1LKg0YnDFX5XsGNRAzwQ90tfQ4AHxBmBMvdZ2DXFpCkfeGwsHYhV7kq3201fpKGBn3P
	IUkMD1KorlMH59uI8xNQsKj4Nk3cEh5laMMuimEzeRcYQ7Rv8KuhKR4Wv6Ux5riqFeGr2k/KE4B
	4xGns+4EdnqeGjfxTNfszsyE+K4WMLKF6nJBCwszyzKEpBFChKZuB13Ux1eRheFvaJJr64iq2EK
	v/FV60g5A0sPg2nIqB+J9UI6QeYYkkZUpbBUxf9N2zbiwE7Bsm4n70AyPgCyRMZCdD2QiFjQeDx
	hgiVU2OwyreG9QDsnGUv80s/58C1/OPQG6RpxJzbAUWacAcFK4/xDihb68ncFHvtv64prOIQtwM
	SaEdBLtwU/rChsQw07c9Ysyw2ZQ3lw98RFhbxWO8
X-Received: by 2002:a05:693c:4081:b0:377:678:231b with SMTP id 5a478bee46e88-37706782701mr535848eec.25.1794376448064;
        Tue, 10 Nov 2026 21:54:08 -0800 (PST)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013.mvista.com ([27.121.101.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm14730177eec.19.2026.11.10.21.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 21:54:07 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] iscsi-initiator-utils: fix for CVE-2026-44943, CVE-2026-44944
Date: Wed, 11 Nov 2026 11:24:00 +0530
Message-ID: <20261111055400.111834-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132127
Content-Type: text/plain; charset="utf-8"

Pick patch from [1] also mentioned at Debian report in [2] & [3].

[1] https://github.com/open-iscsi/open-iscsi/commit/668ca1df9c9a1e9bdd5c999ae1d67c9c8909237e
[2] https://security-tracker.debian.org/tracker/CVE-2026-44943
[3] https://security-tracker.debian.org/tracker/CVE-2026-44944

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../files/CVE-2026-44943.patch                | 181 ++++++++++++++++++
 .../files/CVE-2026-44944.patch                |  41 ++++
 .../iscsi-initiator-utils_2.1.9.bb            |   2 +
 3 files changed, 224 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-44943.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-44944.patch

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-44943.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-44943.patch
new file mode 100644
index 0000000000..1219b156b1
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-44943.patch
@@ -0,0 +1,181 @@
+From: Lee Duncan <lduncan@suse.com>
+Date: Tue, 14 Jul 2026 12:16:58 -0700
+Subject: Improve iscsid discovery handling of IQN names.
+
+Currently, IQN names received via discovery are assumed to be valid up
+to the NULL character, i.e. the end of the supplied string. But this
+may not be correct.
+
+The ASCII characters allowed in an IQN are detailed in RFC 3722, section
+6.2: "Currently Prohibited ASCII Characters".
+
+Disallowing such characters should not break current usage, since the
+disallowed characters should not be in an IQN anyway. For example, they
+include characters like forward slashes, backward slashes, spaces,
+control characters, etc..
+
+Open-iscsi uses target names as directory names in the "database"
+directory (typically /var/lib/iscsi), so fixing this eliminates discovery
+target name containing sequences like "../../../*" from being allowed.
+
+Reference: CVE-2026-44943
+Found-by: <keith@linnemanlabs.com>
+
+Reviewed-By: Daniel Leidert <dleidert@debian.org>
+Origin: https://github.com/open-iscsi/open-iscsi/commit/668ca1df9c9a1e9bdd5c999ae1d67c9c8909237e
+Origin: https://github.com/open-iscsi/open-iscsi/pull/535/changes/c61d97dccb68c2e47f35bf72ba98f6c304f488db
+Origin: https://github.com/open-iscsi/open-iscsi/commit/3f747d10ce743483a5d5e9512eb28a08b12d9677
+Bug-Debian: https://bugs.debian.org/1143059
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-44943
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-44943
+
+CVE: CVE-2026-44943
+Upstream-Status: Backport [https://github.com/open-iscsi/open-iscsi/commit/668ca1df9c9a1e9bdd5c999ae1d67c9c8909237e]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ usr/discovery.c        | 16 ++++++++++++++++
+ usr/initiator.h        |  3 +++
+ usr/initiator_common.c | 33 +++++++++++++++++++++++++++++++++
+ usr/iscsiadm.c         |  4 ++++
+ usr/iscsistart.c       |  5 ++++-
+ 5 files changed, 60 insertions(+), 1 deletion(-)
+
+diff --git a/usr/discovery.c b/usr/discovery.c
+index 587af6d..243afe2 100644
+--- a/usr/discovery.c
++++ b/usr/discovery.c
+@@ -216,6 +216,11 @@ int discovery_isns_query(struct discovery_rec *drec, const char *iname,
+ 			continue;
+ 		}
+ 
++		if (!iqn_name_valid(pg_tgt)) {
++			log_error("iSNS discovery Target Name invalid: ignoring it");
++			continue;
++		}
++
+ 		if (!isns_object_get_ipaddr(obj, ISNS_TAG_PG_PORTAL_IP_ADDR,
+ 					    &in_addr)) {
+ 			log_debug(1, "Missing addr");
+@@ -294,6 +299,11 @@ static int discovery_isns_reg_node(const char *iname, int op_reg)
+ 	log_debug(1, "trying to %s %s with iSNS server.",
+ 		  op_reg ? "register" : "deregister", iname);
+ 
++	if (!iqn_name_valid(iname)) {
++		log_error("iSNS initiatorname invalid: ignoring it");
++		return ISCSI_ERR_INVAL;
++	}
++
+ 	source = isns_source_create_iscsi(iname);
+ 	if (!source)
+ 		return ISCSI_ERR_NOMEM;
+@@ -615,6 +625,12 @@ add_target_record(char *name, char *end, discovery_rec_t *drec,
+ 		log_error("TargetName %s too long, ignoring", name);
+ 		return 0;
+ 	}
++
++	if (!iqn_name_valid(name)) {
++		log_error("Discovery TargetName invalid, ignoring");
++		return 0;
++	}
++
+ 	text = name + length;
+ 
+ 	/* skip NULs after the name */
+diff --git a/usr/initiator.h b/usr/initiator.h
+index 0222797..6bb38ca 100644
+--- a/usr/initiator.h
++++ b/usr/initiator.h
+@@ -21,6 +21,7 @@
+ #define INITIATOR_H
+ 
+ #include <stdint.h>
++#include <stdbool.h>
+ #include <net/if.h>
+ #include <sys/time.h>
+ 
+@@ -410,4 +411,6 @@ extern int iscsi_set_net_config(struct iscsi_transport *t,
+ extern void iscsi_session_init_params(struct iscsi_session *session);
+ 
+ extern int session_in_use(int sid);
++
++extern bool iqn_name_valid(const char *name);
+ #endif /* INITIATOR_H */
+diff --git a/usr/initiator_common.c b/usr/initiator_common.c
+index bc69fbd..8067a70 100644
+--- a/usr/initiator_common.c
++++ b/usr/initiator_common.c
+@@ -24,6 +24,7 @@
+ #include <stdlib.h>
+ #include <errno.h>
+ #include <dirent.h>
++#include <stdbool.h>
+ #include <libmount/libmount.h>
+ 
+ #include "initiator.h"
+@@ -732,3 +733,35 @@ int iscsi_host_set_net_params(struct iface_rec *iface,
+ 	}
+ 	return 0;
+ }
++
++/**
++ * @brief iqn_name_valid -- return whether or not the supplied
++ * IQN name valid
++ *
++ * @details Checks for invalid characters, using RFC 3722,
++ * section 6.2, "Currently Prohibited ASCII Characters"
++ *
++ * @param name the IQN name we are checking
++ * @return true iff the whole name (string) has valid
++ * charaters
++ */
++bool
++iqn_name_valid(const char *name)
++{
++	const unsigned char *cp;
++
++	/* ensure no invalid characters */
++	for (cp = (const unsigned char *)name; *cp != '\0'; cp++)
++		if ((*cp <= '\x2c') ||
++		    (*cp == '\x2f') ||
++		    ((*cp >= '\x3b') && (*cp <= '\x40')) ||
++		    ((*cp >= '\x5b') && (*cp <= '\x60')) ||
++		    (*cp >= '\x7b')) {
++			log_debug(8, "IQN name is invalid: \"%s\" (char: '%#02x')",
++				  name, *cp);
++			return false;
++		}
++
++	log_debug(8, "IQN name has all valid characters: \"%s\"", name);
++	return true;
++}
+diff --git a/usr/iscsiadm.c b/usr/iscsiadm.c
+index 862bcb6..55dd6a2 100644
+--- a/usr/iscsiadm.c
++++ b/usr/iscsiadm.c
+@@ -1155,6 +1155,10 @@ exec_disc_op_on_recs(discovery_rec_t *drec, struct list_head *rec_list,
+ 	if (op & OP_NEW || op & OP_UPDATE) {
+ 		/* now add/update records */
+ 		list_for_each_entry(new_rec, rec_list, list) {
++			if (!iqn_name_valid(new_rec->name)) {
++				log_error("FW discovery Target Name invalid: ignoring it");
++				continue;
++			}
+ 			rc = idbm_add_node(new_rec, drec, op & OP_UPDATE);
+ 			if (rc)
+ 				log_error("Could not add/update "
+diff --git a/usr/iscsistart.c b/usr/iscsistart.c
+index 546840f..b3c8270 100644
+--- a/usr/iscsistart.c
++++ b/usr/iscsistart.c
+@@ -403,7 +403,10 @@ int main(int argc, char *argv[])
+ 		case 't':
+ 			check_str_param_len(optarg, TARGET_NAME_MAXLEN,
+ 					    "targetname");
+-			strlcpy(config_rec.name, optarg, TARGET_NAME_MAXLEN);
++			if (!iqn_name_valid(optarg))
++				log_error("iscsistart Target Name invalid: ignoring");
++			else
++				strlcpy(config_rec.name, optarg, TARGET_NAME_MAXLEN);
+ 			break;
+ 		case 'g':
+ 			config_rec.tpgt = atoi(optarg);
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-44944.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-44944.patch
new file mode 100644
index 0000000000..0ce2daf137
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-44944.patch
@@ -0,0 +1,41 @@
+From: Lee Duncan <lduncan@suse.com>
+Date: Tue, 14 Jul 2026 12:16:58 -0700
+Subject: Fix iscsiuio control-socket credential verification.
+
+Prevent unprivilidged user from driving the isscsiuio control socket,
+by validating connection against correct file descriptor.
+
+Reference: CVE-2026-44944
+Found-by: <keith@linnemanlabs.com>
+
+Reviewed-By: Daniel Leidert <dleidert@debian.org>
+Origin: https://github.com/open-iscsi/open-iscsi/commit/668ca1df9c9a1e9bdd5c999ae1d67c9c8909237e
+Origin: https://github.com/open-iscsi/open-iscsi/pull/535/changes/61548b598cce28b3042073dd546e2609777fa3a5
+Bug-Debian: https://bugs.debian.org/1143059
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-44944
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-44944
+
+CVE: CVE-2026-44944
+Upstream-Status: Backport [https://github.com/open-iscsi/open-iscsi/commit/668ca1df9c9a1e9bdd5c999ae1d67c9c8909237e]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ iscsiuio/src/unix/iscsid_ipc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/iscsiuio/src/unix/iscsid_ipc.c b/iscsiuio/src/unix/iscsid_ipc.c
+index ea03d37..2eaf928 100644
+--- a/iscsiuio/src/unix/iscsid_ipc.c
++++ b/iscsiuio/src/unix/iscsid_ipc.c
+@@ -1115,10 +1115,10 @@ static void *iscsid_loop(void *arg)
+ 			continue;
+ 		}
+ 
+-		if (!mgmt_peeruser(iscsid_opts.fd, user) || strncmp(user, "root", PEERUSER_MAX)) {
++		if (!mgmt_peeruser(s2, user) || strncmp(user, "root", PEERUSER_MAX)) {
+ 			close(s2);
+ 			LOG_ERR(PFX "Access error: non-administrative connection rejected");
+-			break;
++			continue;
+ 		}
+ 
+ 		/* this closes the file descriptor s2 */
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb
index 18ab16bc20..7873efd297 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb
@@ -22,6 +22,8 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
            file://iscsi-initiator.service \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
+           file://CVE-2026-44943.patch \
+           file://CVE-2026-44944.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.50.1

