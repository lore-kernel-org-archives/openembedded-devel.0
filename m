Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1C5C38159
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 05:07:56 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.67584.1674191271347187934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 21:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Wv7dd/VD;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id o13so4569092pjg.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 21:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ar9k523BojR9/soKLRmYQvkjHe9T1pesq3iauOVEqJM=;
        b=Wv7dd/VD6uOGJJeCFkfbZepnmNq18dRw1oxwTrCkhOLYM+ePuJYgGlFoSgWretNNdL
         WfMD66koGJhDjNrSCCYVQnJKVJYTmUQ1beP2DOFdZR4ukhb4y6AHroA+7lvqbM5/1taS
         J67kIGqddCkh0tJay2/RYZwNt/fV8gJWPh9bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ar9k523BojR9/soKLRmYQvkjHe9T1pesq3iauOVEqJM=;
        b=dDQeKDuca/NBE0msadpsr3rCdukop3OvVTq62nCNp/v0DYw9mHeU4SH7Hb3dholApD
         RiXOOXwuryiH9yVmItMfDTVLl7rhxvLJJOjm9LVHcZnHEJuG9NnpiltGlieHmoaH6Fmz
         dFXaZaVnskt6HkTW5C9f9H2Z1tiNPgv+ywT3jjKG7YO3e+kQpkdjgOjrwmQ7d2OVW33F
         pqJzw2buQaI+52zxDfej4cuakQ5yXYQuN3PDUVCF2+XA4RUkJKdvcxe4n7Lab2eST+q8
         FC9MYVldVPL++axP7kXwiQ7H1szxYu6vN2AEM1KFkorQVUrs/E+4fFsP91SDZBU1Z0Tt
         hMpQ==
X-Gm-Message-State: AFqh2kpAC8hx4uLZjnldN853E5WTN3TUJEmjbfTXW+dgUxu4UA44WYRs
	M2vhwHW1Y8/keMT23vfWJSvX4iVpKYMmgypi
X-Google-Smtp-Source: AMrXdXtPOdipggaj9Ojv+11wYBk21D+Tewp3bijFNLbrEIPw4jKejTCtIZ7yW2DU6lN6xnWcZNJVmA==
X-Received: by 2002:a17:902:d2d1:b0:194:c5d6:328 with SMTP id n17-20020a170902d2d100b00194c5d60328mr8591863plc.35.1674191270580;
        Thu, 19 Jan 2023 21:07:50 -0800 (PST)
Received: from MVIN00024 ([150.129.170.231])
        by smtp.gmail.com with ESMTPSA id v7-20020a1709028d8700b00186bc66d2cbsm26036727plo.73.2023.01.19.21.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 21:07:50 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 20 Jan 2023 10:37:45 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
Date: Fri, 20 Jan 2023 10:37:43 +0530
Message-Id: <20230120050743.6630-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jan 2023 05:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100667

Upstream-Status: Backport from https://github.com/net-snmp/net-snmp/commit/be804106fd0771a7d05236cff36e199af077af57

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2022-44792-CVE-2022-44793.patch       | 116 ++++++++++++++++++
 .../net-snmp/net-snmp_5.8.bb                  |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
new file mode 100644
index 0000000000..4e537c8859
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
+index 26653f4..eba5b4e 100644
+--- a/agent/snmp_agent.c
++++ b/agent/snmp_agent.c
+@@ -3708,12 +3708,44 @@ netsnmp_handle_request(netsnmp_agent_session *asp, int status)
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
+index a2374bc..cd01b9a 100644
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
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 6b4b6ce8ed..79f2c1d89d 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -35,6 +35,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://CVE-2020-15861-0004.patch \
            file://CVE-2020-15861-0005.patch \
            file://CVE-2020-15862.patch \
+           file://CVE-2022-44792-CVE-2022-44793.patch \
            "
 SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
 SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
-- 
2.25.1


