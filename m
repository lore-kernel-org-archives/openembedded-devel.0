Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2551CC6379F
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 17:06:16 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.13430.1676135168999540762
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 09:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=au+z7YKP;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id bd6so7027566oib.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 09:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgAry9Dv0qtGcWhKvpB1WKqrn2HKEL7/0jNeVa4Dv+k=;
        b=au+z7YKPVlqi4dWci+uY1xY2FTejC1NcjTKV0dvNmH5A3j03teeHITX83e4NOFA1jB
         FMq1geNkWZWihiSu+0OoJHBMYfWy2B+HbZ/Diyu0MnkecsrB+//hGe81jGlWJWfZ/Dfn
         k+DV3tqlS13kn+nqbJJWqqoyhF1TUj6G+cnnQkqO0RvplYB4vuKZzDtT1N6dpaJ03Swo
         JDOXjAWTmzlm7FDX2qdlMgEYAeqBG7Ay5vJJ0uxlIXPlucriCCsXsyLs4ssiRUst0SRM
         gLtop9qo2zXU/iy+Efc/HYI2gNdQj4SbMLmTn5p3yZaX1Uzit7yQCLwNIRPaO8fJ+CFp
         3N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgAry9Dv0qtGcWhKvpB1WKqrn2HKEL7/0jNeVa4Dv+k=;
        b=zqJZwyjp6c2Aw4Jh01ESQgeoBAVSRx7hELDeNC8wahimd7dsvIrtImMMkLUXMT4/85
         lZMrHND0+QgndRaiHOnCoYvp6erj2Ljd2MLy3lY+fyXVXIO9YzerkAr/m2vm2Hf1Oyy5
         hGp2Dgk13UTMjg8jLH8awrfAMo/OztbF7oD43K9+MgCztHcx+/ZMBwCoVzBuhmhnKTak
         T1tr6SXNcaAg62Ko5UiZb9A0XjK+91huocM1HE+eNy/+3ytvbIwRKGgtRMcUFlJMGkUK
         fs6wKpDRXKbi7Ur2Nv19LshbZDyCwBhxel69Uxmb9E0ydq7xZL1qkpviFKOWys6aS8I1
         tsBQ==
X-Gm-Message-State: AO0yUKVrzA4pYwZuBo9NgHfLthIoifkZL+MRSIJwzf2h3UTqL1Eho/Ha
	jxdNPRE8TGn1VNlDR/kvY+0CdYRX0LY=
X-Google-Smtp-Source: AK7set9Xxe5N9sjeKgHzQFqDp/UiEvFlmKJGn2rIhVoIf5ds9u5gDEhOio+MDMCCD+RNoiQRby/UTw==
X-Received: by 2002:a05:6808:2105:b0:37a:2bf0:5018 with SMTP id r5-20020a056808210500b0037a2bf05018mr7537211oiw.6.1676135168067;
        Sat, 11 Feb 2023 09:06:08 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id p203-20020aca5bd4000000b0037d8670526esm275932oib.52.2023.02.11.09.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 09:06:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Narpat Mali <narpat.mali@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 4/6] net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
Date: Sat, 11 Feb 2023 12:05:59 -0500
Message-Id: <20230211170601.3988339-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230211170601.3988339-1-akuster808@gmail.com>
References: <20230211170601.3988339-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 17:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101039

From: Narpat Mali <narpat.mali@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-44792
https://nvd.nist.gov/vuln/detail/CVE-2022-44793

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5ae6f9434f44a57389a3f52dce17da6fe5928e1f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../CVE-2022-44792-CVE-2022-44793.patch       | 121 ++++++++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
new file mode 100644
index 0000000000..b18d4dc292
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
@@ -0,0 +1,121 @@
+From d13302656d9ff0807c5defe18623adc947f43a2b Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Wed, 8 Feb 2023 13:15:39 +0000
+Subject: [PATCH] agent: Disallow SET requests with any NULL varbind Merge pull
+ request #490 from fenner/set-null
+
+fixes: #474 and #475
+
+CVE: CVE-2022-44792, CVE-2022-44793
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/be804106fd0771a7d05236cff36e199af077af57]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ agent/snmp_agent.c                            | 32 +++++++++++++++++++
+ apps/snmpset.c                                |  1 +
+ .../default/T0142snmpv2csetnull_simple        | 31 ++++++++++++++++++
+ 3 files changed, 64 insertions(+)
+ create mode 100644 testing/fulltests/default/T0142snmpv2csetnull_simple
+
+diff --git a/agent/snmp_agent.c b/agent/snmp_agent.c
+index 867d0c1..3f678fe 100644
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
+index 48e14bd..d542713 100644
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
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index 78d711fbfd..f40fb8bbd6 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
            file://0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch \
+           file://CVE-2022-44792-CVE-2022-44793.patch \
            "
 SRC_URI[sha256sum] = "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
 
-- 
2.25.1


