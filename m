Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAABD43FEC
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 08:06:35 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.36359.1731917193970309410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 00:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X4uQJAdT;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20ce65c8e13so28368695ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731917193; x=1732521993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trDyayp/su47C63SzHosB/uJxU0k5lDqhIgjUGfP+kA=;
        b=X4uQJAdTjezVaOg02AAJFInG81p7e2HYUCQOhPemGH4zFUQGwHDMm9aMs+izP/DndE
         lq5Tfqx+EoNtV6ki+HrQCy1JQEPnfJ51ajmL/YYwS8LLEG5T0DY51Tp8kKnnysBBlr/X
         cY54Kq994KKxRldZpIDL7hp2DR+vFItSJ7R68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731917193; x=1732521993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trDyayp/su47C63SzHosB/uJxU0k5lDqhIgjUGfP+kA=;
        b=NfZ1t/RQ+kNeimtC+WMBvwa/hVxBbxD0R6EkzyQviauxktA8ncXRNQkCbg8Vg8MOKA
         TCmI7wB53TsE+qIPN+tdM4eyCq0F2UvpaPsPwMzy8s9I+n+bg9Cbm+YUTBdWdpyffbbF
         lVqbA6yUR9f7iLeaaAXQsbrG07b7r9frf3ZTisrxs5dC70j3eFtkkr7OygnItnWpLvs4
         wL6LfSC9PfMXoF5llG2jhlvv8Muj4lBwIeR6xW1jl/ParsFVWXxXNuJ8kInxI1k/64o8
         n7bMLlAw/jhNMFL7W+NEHnEaehxQOhM0fhBsuYzfgE9i+hs+Fzn8yafsmd/vCK4Y3ryJ
         ptSQ==
X-Gm-Message-State: AOJu0Yysz/6i+pK710+QgR6TWKkPD9ySESEC0Rwa5fD40cVfJDZDU3s5
	4VPbMDckp6lZlG6j1OU7r5wRn59Y5Vr121C5F8ujw8lviJmOYvDOadDxR4ZV7dfWKYylK6WP4Er
	GTFU=
X-Google-Smtp-Source: AGHT+IEoch8MOLhzr6S4lCmn2N6zA+E0SCuGsGENBIVsX9plblnf2pqZj+geFg7pOyEe5P8umxy+BA==
X-Received: by 2002:a17:902:f54c:b0:20c:dd71:c94f with SMTP id d9443c01a7336-211d0ebd06emr165909695ad.41.1731917192873;
        Mon, 18 Nov 2024 00:06:32 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882e:fb89:6ca5:61f9:bb54:6194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211fe7244b0sm29188465ad.198.2024.11.18.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 00:06:32 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] openipmi: Security fix for CVE-2024-42934
Date: Mon, 18 Nov 2024 13:36:21 +0530
Message-Id: <20241118080621.126542-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 08:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113864

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://sourceforge.net/p/openipmi/code/ci/663e3cd3 &
https://sourceforge.net/p/openipmi/code/ci/b52e8e2538b2b48ef6b63bff12b5cc9e2d52eff1
& https://sourceforge.net/p/openipmi/code/ci/4c129d0540f3578ecc078d8612bbf84b6cd24c87

Reference: https://access.redhat.com/errata/RHSA-2024:8037

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openipmi/files/CVE-2024-42934.patch       | 78 +++++++++++++++++++
 .../openipmi/openipmi_2.0.32.bb               |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-networking/recipes-support/openipmi/files/CVE-2024-42934.patch

diff --git a/meta-networking/recipes-support/openipmi/files/CVE-2024-42934.patch b/meta-networking/recipes-support/openipmi/files/CVE-2024-42934.patch
new file mode 100644
index 000000000..f8ce11836
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/CVE-2024-42934.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Backport [import from Redhat RHEL9 OpenIPMI-2.0.32-5.el9_4.src.rpm
+Upstream commit https://sourceforge.net/p/openipmi/code/ci/663e3cd3 & https://sourceforge.net/p/openipmi/code/ci/b52e8e2538b2b48ef6b63bff12b5cc9e2d52eff1 & https://sourceforge.net/p/openipmi/code/ci/4c129d0540f3578ecc078d8612bbf84b6cd24c87]
+CVE: CVE-2024-42934
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+
+diff --git a/lanserv/lanserv_ipmi.c b/lanserv/lanserv_ipmi.c
+index ccd60015..e707454e 100644
+--- a/lanserv/lanserv_ipmi.c
++++ b/lanserv/lanserv_ipmi.c
+@@ -882,6 +882,12 @@ handle_temp_session(lanserv_data_t *lan, msg_t *msg)
+     }
+ 
+     auth = msg->data[0] & 0xf;
++    if (auth >= MAX_IPMI_AUTHS) {
++	lan->sysinfo->log(lan->sysinfo, NEW_SESSION_FAILED, msg,
++		 "Activate session failed: Invalid auth: 0x%x", auth);
++	return;
++    }
++
+     user = &(lan->users[user_idx]);
+     if (! (user->valid)) {
+ 	lan->sysinfo->log(lan->sysinfo, NEW_SESSION_FAILED, msg,
+@@ -3016,17 +3022,33 @@ ipmi_handle_lan_msg(lanserv_data_t *lan,
+ {
+     msg_t   msg;
+ 
++    memset(&msg, 0, sizeof(msg));
++
+     msg.src_addr = from_addr;
+     msg.src_len = from_len;
+ 
+     msg.oem_data = 0;
+ 
++    msg.channel = lan->channel.channel_num;
++    msg.orig_channel = &lan->channel;
++
++    /*
++     * Initialize the data so the log won't crash if it gets called, and
++     * so the log might have useful info.
++     */
++    msg.data = data;
++    msg.len = len;
++
+     if (len < 5) {
+ 	lan->sysinfo->log(lan->sysinfo, LAN_ERR, &msg,
+ 		 "LAN msg failure: message too short");
+ 	return;
+     }
+ 
++    /* Length is at least marginally correct, skip the first part now. */
++    msg.data = data + 5;
++    msg.len = len - 5;
++
+     if (data[2] != 0xff) {
+ 	lan->sysinfo->log(lan->sysinfo, LAN_ERR, &msg,
+ 		 "LAN msg failure: seq not ff");
+@@ -3034,17 +3056,15 @@ ipmi_handle_lan_msg(lanserv_data_t *lan,
+     }
+ 
+     msg.authtype = data[4];
+-    msg.data = data+5;
+-    msg.len = len - 5;
+-    msg.channel = lan->channel.channel_num;
+-    msg.orig_channel = &lan->channel;
+-
+     if (msg.authtype == IPMI_AUTHTYPE_RMCP_PLUS) {
+ 	ipmi_handle_rmcpp_msg(lan, &msg);
++    } else if (msg.authtype >= MAX_IPMI_AUTHS) {
++	lan->sysinfo->log(lan->sysinfo, LAN_ERR, &msg,
++			  "LAN msg failure: Invalid authtype: %d", data[4]);
++	return;
+     } else {
+ 	ipmi_handle_rmcp_msg(lan, &msg);
+     }
+-
+ }
+ 
+ static void
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
index 8625afaa7..e670fde39 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://openipmi-helper \
            file://ipmi.service \
            file://0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch \
+           file://CVE-2024-42934.patch \
            "
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
-- 
2.25.1


