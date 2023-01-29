Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E5FC636D7
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:53 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.25481.1675026046207711246
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FhuhpMoi;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id p185so8577509oif.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lYfbVAp2hYzyBq/FOqARuAlMcAIJyZ9/x4grdir4K4=;
        b=FhuhpMoiMD/HTmuk2++Y4k4LpdDoieTTle8ERGUWv2n1V9ul96wVJJmtp2tBdYOMTP
         KIk1zeapmbdRc2Ky+U7P115YvAaleGlnCcou+TikDdWZzMr4U34jM9+vXxHwQc+N2Y+o
         7MMxDYo8tTojwthJN2dG2+4KxV+BE+pr6P3/3WY0MZp+RmqsbAvfgNxSk7ei+G1POgj6
         9936wDyFn2EPpJPXzvtwU4Ut5sun7mk2Dsxn1lddDBgUCa/zd/Krm7zlyDthbR9ltANd
         n8/KEToPG2b5nucAM8OxB5+fkQlo8zqMWG0iYlu4Pm/e5LJcutd5XD1Xkxx2jNY6ahoE
         8Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lYfbVAp2hYzyBq/FOqARuAlMcAIJyZ9/x4grdir4K4=;
        b=Swt8T+SVW4BOMnlt2xFUSl+FGsfAyWd6yVOPvnwnbRJiwt9DxBh4zzBy245s1OnLM4
         rAqXdvdH0mKeekRa+7AELH4ZPejFu50cUAGC5b/lqC0mwHE9jZDFJ0PIVGds8fo4W1JO
         tb9kC8EswY1FPp1MwB2qZjPq5kbP2HCvcqymLh51I+44lPSFaF9/5z6YGsR4ekbDN2mZ
         j1MVsQPqBL0RT/+f14qsk5BHGy4B0RiFJ5cnVrI6apKZU3I9bpTO+o7Xk0Oqmc0cCgIe
         vhsvei95/bM3Y9om39kr4+/q8mIb/rLyddZY4UnZFzaBuRRkYAVBtjqNQ+oTkPPq6pxM
         EzMQ==
X-Gm-Message-State: AFqh2kqNIWAYgiQeE/CxZ3ktKfnXce/xNAxghfPQvk/XUDGemjnUhgHn
	QZNNRaBcOtPJBoy5VKpLI2aLtYee/CY=
X-Google-Smtp-Source: AMrXdXszh3qD461Cp8ehoGGtccyjt89Z6PGTlMmuZrmHTXlq0PJX6X85zxmvR/KWhaOgz6ihQEWQ1w==
X-Received: by 2002:aca:1c09:0:b0:367:18f4:dbef with SMTP id c9-20020aca1c09000000b0036718f4dbefmr21590574oic.0.1675026045304;
        Sun, 29 Jan 2023 13:00:45 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 04/10] net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
Date: Sun, 29 Jan 2023 16:00:32 -0500
Message-Id: <99f4d05002aad159690568579a913bf33ad4772e.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675025970.git.akuster808@gmail.com>
References: <cover.1675025970.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100838

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/net-snmp/net-snmp/commit/be804106fd0771a7d05236cff36e199af077af57

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../CVE-2022-44792-CVE-2022-44793.patch       | 116 ++++++++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
new file mode 100644
index 0000000000..ce7e3422ed
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
@@ -0,0 +1,116 @@
+From 4589352dac3ae111c7621298cf231742209efd9b Mon Sep 17 00:00:00 2001
+From: Bill Fenner <fenner@gmail.com>
+Date: Fri, 25 Nov 2022 08:41:24 -0800
+Subject: [PATCH ] snmp_agent: disallow SET with NULL varbind
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/be804106fd0771a7d05236cff36e199af077af57]
+CVE: CVE-2022-44792 & CVE-2022-44793
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ agent/snmp_agent.c                            | 32 +++++++++++++++++++
+ apps/snmpset.c                                |  1 +
+ .../default/T0142snmpv2csetnull_simple        | 31 ++++++++++++++++++
+ 3 files changed, 64 insertions(+)
+ create mode 100644 testing/fulltests/default/T0142snmpv2csetnull_simple
+
+diff --git a/agent/snmp_agent.c b/agent/snmp_agent.c
+index 3376357..f51c252 100644
+--- a/agent/snmp_agent.c
++++ b/agent/snmp_agent.c
+@@ -3719,12 +3719,44 @@ netsnmp_handle_request(netsnmp_agent_session *asp, int status)
+     return 1;
+ }
+ 
++static int
++check_set_pdu_for_null_varbind(netsnmp_agent_session *asp)
++{
++    int i;
++    netsnmp_variable_list *v = NULL;
++
++    for (i = 1, v = asp->pdu->variables; v != NULL; i++, v = v->next_variable) {
++	if (v->type == ASN_NULL) {
++	    /*
++	     * Protect SET implementations that do not protect themselves
++	     * against wrong type.
++	     */
++	    DEBUGMSGTL(("snmp_agent", "disallowing SET with NULL var for varbind %d\n", i));
++	    asp->index = i;
++	    return SNMP_ERR_WRONGTYPE;
++	}
++    }
++    return SNMP_ERR_NOERROR;
++}
++
+ int
+ handle_pdu(netsnmp_agent_session *asp)
+ {
+     int             status, inclusives = 0;
+     netsnmp_variable_list *v = NULL;
+ 
++#ifndef NETSNMP_NO_WRITE_SUPPORT
++    /*
++     * Check for ASN_NULL in SET request
++     */
++    if (asp->pdu->command == SNMP_MSG_SET) {
++	status = check_set_pdu_for_null_varbind(asp);
++	if (status != SNMP_ERR_NOERROR) {
++	    return status;
++	}
++    }
++#endif /* NETSNMP_NO_WRITE_SUPPORT */
++
+     /*
+      * for illegal requests, mark all nodes as ASN_NULL 
+      */
+diff --git a/apps/snmpset.c b/apps/snmpset.c
+index 50f33db..387a51d 100644
+--- a/apps/snmpset.c
++++ b/apps/snmpset.c
+@@ -182,6 +182,7 @@ main(int argc, char *argv[])
+             case 'x':
+             case 'd':
+             case 'b':
++            case 'n': /* undocumented */
+ #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
+             case 'I':
+             case 'U':
+diff --git a/testing/fulltests/default/T0142snmpv2csetnull_simple b/testing/fulltests/default/T0142snmpv2csetnull_simple
+new file mode 100644
+index 0000000..0f1b8f3
+--- /dev/null
++++ b/testing/fulltests/default/T0142snmpv2csetnull_simple
+@@ -0,0 +1,31 @@
++#!/bin/sh
++
++. ../support/simple_eval_tools.sh
++
++HEADER SNMPv2c set of system.sysContact.0 with NULL varbind
++
++SKIPIF NETSNMP_DISABLE_SET_SUPPORT
++SKIPIF NETSNMP_NO_WRITE_SUPPORT
++SKIPIF NETSNMP_DISABLE_SNMPV2C
++SKIPIFNOT USING_MIBII_SYSTEM_MIB_MODULE
++
++#
++# Begin test
++#
++
++# standard V2C configuration: testcomunnity
++snmp_write_access='all'
++. ./Sv2cconfig
++STARTAGENT
++
++CAPTURE "snmpget -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSPORT_SPEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0"
++
++CHECK ".1.3.6.1.2.1.1.4.0 = STRING:"
++
++CAPTURE "snmpset -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSPORT_SPEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0 n x"
++
++CHECK "Reason: wrongType"
++
++STOPAGENT
++
++FINISHED
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index 7af5147566..eb8e1599fb 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://net-snmp-fix-for-disable-des.patch \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
+           file://CVE-2022-44792-CVE-2022-44793.patch \
            "
 SRC_URI[sha256sum] = "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
 
-- 
2.25.1


