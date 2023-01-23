Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE82C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 04:25:17 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.35888.1674447912438296627
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jan 2023 20:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XOfsS7vB;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso5828548pju.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 20:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofMT21aokGxESoEQ7X1qKWxziu1rri5PhmxaFdLpELU=;
        b=XOfsS7vB1qMOd2UXmggLSIMT/L1T59TDcQJ3NEEGOaCqPuP6Lqa8BJQ7s1Gt7XqD9s
         CsVr42Iy6SQ1YZ6X4PPshjzZNIbYMuPPA9qSZl+WM4YYqEGevZieC7FMDznEVQf+qEIy
         DlTg0l7yfRFPVvvgFJ3ZAcJZKb/UoMTklkkVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofMT21aokGxESoEQ7X1qKWxziu1rri5PhmxaFdLpELU=;
        b=m0EmdYGt7YFxAXCZjt4xntAWNhpCAnBWp8Hg4QN0g6Tc+Yxjm4z+/JhTb+lTyGNbT2
         IxS1KGrVtEEPPpqJhFEO95ejBWCDYEpvTE9aFWPHrJuMENAtW3k3VVkshfUnzLeyHDUX
         Dy2a0umrqyItzgOBz3pQPEhlOkv3Dyf6qFjX65XIUSTqYbDKYK9zuHP0dDPfPnPjlmuE
         S5m2egpNEztle4+9lOzwxOkQ5wCIOvmQru7g1+LE7x+wem4oLIo06UU8/wny7v2PldNR
         staKjVwr+ByfbdTcJ5Tf8H6+bF8JjztIjVoBRy39QPEb+T96b0x6bZ1wizJPuQbXIGDa
         RRcw==
X-Gm-Message-State: AFqh2kq4TF+N2NcGjc6Emho+T40gANqmTf4GarTAGKMLvuTfhwsFD8S1
	SJYo67N8QygnwzP2Lyja2WenOtNGjEZt1gXj
X-Google-Smtp-Source: AMrXdXtOjc1dUM9JIsU/D8QaLRKXY1gBWaOIcUBz88qOq0DjYb+BSTcEalrbf+bi+261rFhlkmGhNw==
X-Received: by 2002:a05:6300:818b:b0:af:e893:fa52 with SMTP id bt11-20020a056300818b00b000afe893fa52mr23309031pzc.22.1674447911428;
        Sun, 22 Jan 2023 20:25:11 -0800 (PST)
Received: from MVIN00024 ([103.250.136.192])
        by smtp.gmail.com with ESMTPSA id j3-20020a170902690300b00193020e8a90sm1550578plk.294.2023.01.22.20.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 20:25:11 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 23 Jan 2023 09:55:06 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
Date: Mon, 23 Jan 2023 09:55:04 +0530
Message-Id: <20230123042504.5665-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jan 2023 04:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100708

Upstream-Status: Backport from https://github.com/net-snmp/net-snmp/commit/be804106fd0771a7d05236cff36e199af077af57

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


