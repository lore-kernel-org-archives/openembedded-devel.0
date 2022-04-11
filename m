Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90372C47087
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:39 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.3965.1649716008231801375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 15:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dvn935ix;
 spf=pass (domain: mvista.com, ip: 209.85.216.52,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 2so16555937pjw.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 15:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y84Dagp1JvsI//eXRdzEVqi0IucE4AyqylwKJ1Gvfr0=;
        b=dvn935ix7YTexet99ZOlG4bRYZiJsO6t+e5vi2J/aNqaCkewImaU9AX2IKRc9kfL24
         CUi2wOO+ENiuM8USOSbbaOh0vn1P67AYdEakEastXQLrh8ixFDF3CNqGYEi2Apy1WKw1
         8mvbn/ueyY6RvK+amq9Cn1GCfKBTgPGXvoVBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y84Dagp1JvsI//eXRdzEVqi0IucE4AyqylwKJ1Gvfr0=;
        b=QrAGffRSQ95EOA9zzPPV+OmKU8NnhCqmwpi7PVi/6pNTkTorgYSNEGkrwGkxzZajMe
         T7sAgfiUZbi+PCNVcxfXyBU5yL8a1dMk809Vit+4SwmDr5nDaDircyo2WdkrwfdyBfWe
         oB86FN21bXQZvpullexAI93W1C/l7XYhqemoT7y0HiATN6lDSynE2goA28NchoUD51CL
         u7krwKKU93eDXnPetVRWLQB06EudHBwESVIkvBBenr/Nbp4IZc3QWsaq42TwQVr9S1QX
         EFIbPXY2yqCWdu3xBnqwfTnQPHkUvwi7q+L63GO3WfO1CgTh2AKb+St9RIRfol518a1f
         k1TA==
X-Gm-Message-State: AOAM533xhq+Zq9zkmjqe0I/mdiZ1jjqcwd5s3/vIkyXAiFUfkdCiUTyr
	hce+GRFvo2XUHxT877ynP2FQkanNVinnzQ==
X-Google-Smtp-Source: 
 ABdhPJxPwSASUPn3k1WVdZF/fSLSXD48d8gWkGsp8fB94EfKQLXkmyZSO0ppdwmTTPqsbSNhTAdcWA==
X-Received: by 2002:a17:902:f612:b0:14c:e978:f99e with SMTP id
 n18-20020a170902f61200b0014ce978f99emr34805102plg.23.1649716007440;
        Mon, 11 Apr 2022 15:26:47 -0700 (PDT)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a550400b001ca38abb248sm457026pji.53.2022.04.11.15.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 15:26:47 -0700 (PDT)
Received: by brown (sSMTP sendmail emulation); Mon, 11 Apr 2022 15:26:42 -0700
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Anand Je Sypureddy <anandje@mvista.com>,
	Sam Kappen <skappen@mvista.com>,
	Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [meta-networking][dunfell][PATCH] net-snmp: Traps/Notifications
 aren't sent when configured by snmpNotifyTable
Date: Mon, 11 Apr 2022 15:26:40 -0700
Message-Id: <20220411222640.3211000-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96557

From: Anand Je Sypureddy <anandje@mvista.com>

Source: https://github.com/net-snmp/net-snmp.git
MR: 114066
Type: Defect Fix
Disposition: Backport from https://github.com/net-snmp/net-snmp/commit/951fd2d9b07e29455ff0251b0f44ed76d935ff00
ChangeID: af87abf2aeefdac65fcd57b7faaaa0e3679fe57f
Description:

snmpd: Restore SNMPD_CALLBACK_SEND_TRAP[12] behavior

Instead of only invoking the SNMPD_CALLBACK_SEND_TRAP[12] callbacks if one
or more sessions with the corresponding SNMP version exist, invoke these
callbacks unconditionally.

Signed-off-by: Anand Je Sypureddy <anandje@mvista.com>
Reviewed-by: Sam Kappen <skappen@mvista.com>
Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 ...SNMPD_CALLBACK_SEND_TRAP-12-behavior.patch | 133 ++++++++++++++++++
 .../net-snmp/net-snmp_5.8.bb                  |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-Restore-SNMPD_CALLBACK_SEND_TRAP-12-behavior.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-Restore-SNMPD_CALLBACK_SEND_TRAP-12-behavior.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-Restore-SNMPD_CALLBACK_SEND_TRAP-12-behavior.patch
new file mode 100644
index 000000000..8279aff32
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-Restore-SNMPD_CALLBACK_SEND_TRAP-12-behavior.patch
@@ -0,0 +1,133 @@
+From 6be94cf81d56f9395b85848bbf7129eb9f992d96 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Tue, 29 Dec 2020 15:22:42 -0800
+Subject: [PATCH] snmpd: Restore SNMPD_CALLBACK_SEND_TRAP[12] behavior
+
+Instead of only invoking the SNMPD_CALLBACK_SEND_TRAP[12] callbacks if one
+or more sessions with the corresponding SNMP version exist, invoke these
+callbacks unconditionally.
+
+Fixes: f770e0f74932 ("skip send_trap callbacks if no sessions for version")
+Fixes: https://github.com/net-snmp/net-snmp/issues/247
+
+Upstream Status: Backport https://github.com/net-snmp/net-snmp/commit/951fd2d9b07e29455ff0251b0f44ed76d935ff00
+
+Signed-off-by: Anand Je Sypureddy <anandje@mvista.com>
+---
+ agent/agent_trap.c | 62 ++--------------------------------------------
+ 1 file changed, 2 insertions(+), 60 deletions(-)
+
+diff --git a/agent/agent_trap.c b/agent/agent_trap.c
+index d49c2dc..0289901 100644
+--- a/agent/agent_trap.c
++++ b/agent/agent_trap.c
+@@ -92,11 +92,6 @@ struct trap_sink {
+ 
+ struct trap_sink *sinks = NULL;
+ 
+-#ifndef NETSNMP_DISABLE_SNMPV1
+-static int _v1_sessions = 0;
+-#endif /* NETSNMP_DISABLE_SNMPV1 */
+-static int _v2_sessions = 0;
+-
+ const oid       objid_enterprisetrap[] = { NETSNMP_NOTIFICATION_MIB };
+ const oid       trap_version_id[] = { NETSNMP_SYSTEM_MIB };
+ const int       enterprisetrap_len = OID_LENGTH(objid_enterprisetrap);
+@@ -159,55 +154,6 @@ free_trap_session(struct trap_sink *sp)
+     free(sp);
+ }
+ 
+-static void
+-_trap_version_incr(int version)
+-{
+-    switch (version) {
+-#ifndef NETSNMP_DISABLE_SNMPV1
+-        case SNMP_VERSION_1:
+-            ++_v1_sessions;
+-            break;
+-#endif
+-#ifndef NETSNMP_DISABLE_SNMPV2C
+-        case SNMP_VERSION_2c:
+-#endif
+-        case SNMP_VERSION_3:
+-            ++_v2_sessions;
+-            break;
+-        default:
+-            snmp_log(LOG_ERR, "unknown snmp version %d\n", version);
+-    }
+-    return;
+-}
+-
+-static void
+-_trap_version_decr(int version)
+-{
+-    switch (version) {
+-#ifndef NETSNMP_DISABLE_SNMPV1
+-        case SNMP_VERSION_1:
+-            if (--_v1_sessions < 0) {
+-                snmp_log(LOG_ERR,"v1 session count < 0! fixed.\n");
+-                _v1_sessions = 0;
+-            }
+-            break;
+-#endif
+-#ifndef NETSNMP_DISABLE_SNMPV2C
+-        case SNMP_VERSION_2c:
+-#endif
+-        case SNMP_VERSION_3:
+-            if (--_v2_sessions < 0) {
+-                snmp_log(LOG_ERR,"v2 session count < 0! fixed.\n");
+-                _v2_sessions = 0;
+-            }
+-            break;
+-        default:
+-            snmp_log(LOG_ERR, "unknown snmp version %d\n", version);
+-    }
+-    return;
+-}
+-
+-
+ #ifndef NETSNMP_NO_TRAP_STATS
+ static void
+ _dump_trap_stats(netsnmp_session *sess)
+@@ -285,8 +231,6 @@ netsnmp_add_notification_session(netsnmp_session * ss, int pdutype,
+         sinks = new_sink;
+     }
+ 
+-    _trap_version_incr(version);
+-
+     return 1;
+ }
+ 
+@@ -338,7 +282,6 @@ remove_trap_session(netsnmp_session * ss)
+             } else {
+                 sinks = sp->next;
+             }
+-            _trap_version_decr(ss->version);
+             /*
+              * I don't believe you *really* want to close the session here;
+              * it may still be in use for other purposes.  In particular this
+@@ -490,7 +433,6 @@ snmpd_free_trapsinks(void)
+     DEBUGMSGTL(("trap", "freeing trap sessions\n"));
+     while (sp) {
+         sinks = sinks->next;
+-        _trap_version_decr(sp->version);
+         free_trap_session(sp);
+         sp = sinks;
+     }
+@@ -1025,11 +967,11 @@ netsnmp_send_traps(int trap, int specific,
+         }
+     }
+ #ifndef NETSNMP_DISABLE_SNMPV1
+-    if (template_v1pdu && _v1_sessions)
++    if (template_v1pdu)
+         snmp_call_callbacks(SNMP_CALLBACK_APPLICATION,
+                         SNMPD_CALLBACK_SEND_TRAP1, template_v1pdu);
+ #endif
+-    if (template_v2pdu && _v2_sessions)
++    if (template_v2pdu)
+         snmp_call_callbacks(SNMP_CALLBACK_APPLICATION,
+                         SNMPD_CALLBACK_SEND_TRAP2, template_v2pdu);
+     snmp_free_pdu(template_v1pdu);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 6b4b6ce8e..b28e71890 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -35,6 +35,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://CVE-2020-15861-0004.patch \
            file://CVE-2020-15861-0005.patch \
            file://CVE-2020-15862.patch \
+	   file://0001-snmpd-Restore-SNMPD_CALLBACK_SEND_TRAP-12-behavior.patch \
            "
 SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
 SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
-- 
2.31.1


