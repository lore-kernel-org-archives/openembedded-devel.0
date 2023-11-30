Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E7AC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 05:02:51 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.65627.1701320563114893435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 21:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fEC9JL+e;
 spf=pass (domain: mvista.com, ip: 209.85.167.174, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b843fea0dfso295196b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 21:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701320562; x=1701925362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=51DG8radNywVkDwQlrpNMZtRrg9AOuAkeArCya5HIxY=;
        b=fEC9JL+ell97Kqc+fOiB7sGILFXUbQFC5SeR4j+Ep9MmOJ2L0zM+gXJ3JA71kAAX4d
         qHb7yByYAC0ZIzcSPxKkHuFHrBOV6oeA+77jPrfDQAZKCKcQ5M1jcPNWGXCQFyulRaNo
         IrGdls1cdDovSUxaOxLnPAEPwy30d5HnEyKFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701320562; x=1701925362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51DG8radNywVkDwQlrpNMZtRrg9AOuAkeArCya5HIxY=;
        b=rzTcH7Qu367Y5DlY7R7xms9nsS9z4L8NO6rw7bZLaeUsFiXCBKCkiItb2g8eFyFzNN
         NM/Yu49RB3fSrSGd4I1Nv4qle31FN5gSSSjc/s5RDkyE+vgzt0JH/uaolkeYlON9Jsf8
         EJ1dk49KjUvuGTU195T8Uy9faAX2FbayT0AeSEytb7OgDnDhAbBWrfeCIPRRx4QUN3kg
         JppBPSP9sHN5UwmgeuODIpAXh/HTXZ0hmfxdxtjRRrLDwzhncmxQU4ZnPczLplQHP59K
         7UaKtmRa107Fy3yDqTPNqPwnr3WsGPtOQOHUE3yKzc3EBFCwVKkdIGXGcoUl3/LEwqZy
         5ojQ==
X-Gm-Message-State: AOJu0Yxq4hm3wL76pu3mD1zZYlnb63mFmyUheP1cJp0ShZT51ycHcrVM
	5/UWjjpD0/c0xLM0mL1cfm+TjvCRf0hXjPW+Fu9Ydw==
X-Google-Smtp-Source: AGHT+IF8/L/6OZ0lxcT8GgXGtPrvdvBsTko796z2G+Ujbbu/Al/7jg1mH2lBQR62O8afH0eCn6U4RA==
X-Received: by 2002:aca:2307:0:b0:3b8:918f:4869 with SMTP id e7-20020aca2307000000b003b8918f4869mr5149508oie.59.1701320562063;
        Wed, 29 Nov 2023 21:02:42 -0800 (PST)
Received: from MVIN00016.mvista.com ([27.121.101.117])
        by smtp.gmail.com with ESMTPSA id a1-20020a656041000000b005891f3af36asm264879pgp.87.2023.11.29.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 21:02:41 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] samba: fix CVE-2023-42669 denial of service
Date: Thu, 30 Nov 2023 10:32:35 +0530
Message-Id: <20231130050235.205222-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 05:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107162

Upstream-Status: Backport from https://www.samba.org/samba/ftp/patches/security/samba-4.17.12-security-2023-10-10.patch

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../samba/samba/CVE-2023-42669.patch          | 93 +++++++++++++++++++
 .../samba/samba_4.10.18.bb                    |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch
new file mode 100644
index 0000000000..0d1cbe5ad4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch
@@ -0,0 +1,93 @@
+From 3f62a590b02bf4c888a995017e2575d3b2ec6ac9 Mon Sep 17 00:00:00 2001
+From: Andrew Bartlett <abartlet@samba.org>
+Date: Tue, 12 Sep 2023 18:59:44 +1200
+Subject: [PATCH] CVE-2023-42669 s4-rpc_server: Disable rpcecho server by
+ default
+
+The rpcecho server is useful in development and testing, but should never
+have been allowed into production, as it includes the facility to
+do a blocking sleep() in the single-threaded rpc worker.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=15474
+
+Signed-off-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://www.samba.org/samba/ftp/patches/security/samba-4.17.12-security-2023-10-10.patch]
+CVE: CVE-2023-42669
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml | 2 +-
+ lib/param/loadparm.c                                   | 2 +-
+ selftest/target/Samba4.pm                              | 2 +-
+ source3/param/loadparm.c                               | 2 +-
+ source4/rpc_server/wscript_build                       | 3 ++-
+ 5 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml b/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml
+index 8a217cc..c6642b7 100644
+--- a/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml
++++ b/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml
+@@ -6,6 +6,6 @@
+ 	<para>Specifies which DCE/RPC endpoint servers should be run.</para>
+ </description>
+ 
+-<value type="default">epmapper, wkssvc, rpcecho, samr, netlogon, lsarpc, drsuapi, dssetup, unixinfo, browser, eventlog6, backupkey, dnsserver</value>
++<value type="default">epmapper, wkssvc, samr, netlogon, lsarpc, drsuapi, dssetup, unixinfo, browser, eventlog6, backupkey, dnsserver</value>
+ <value type="example">rpcecho</value>
+ </samba:parameter>
+diff --git a/lib/param/loadparm.c b/lib/param/loadparm.c
+index 4c3dfff..db4ae5e 100644
+--- a/lib/param/loadparm.c
++++ b/lib/param/loadparm.c
+@@ -2653,7 +2653,7 @@ struct loadparm_context *loadparm_init(TALLOC_CTX *mem_ctx)
+ 	lpcfg_do_global_parameter(lp_ctx, "ntvfs handler", "unixuid default");
+ 	lpcfg_do_global_parameter(lp_ctx, "max connections", "0");
+ 
+-	lpcfg_do_global_parameter(lp_ctx, "dcerpc endpoint servers", "epmapper wkssvc rpcecho samr netlogon lsarpc drsuapi dssetup unixinfo browser eventlog6 backupkey dnsserver");
++	lpcfg_do_global_parameter(lp_ctx, "dcerpc endpoint servers", "epmapper wkssvc samr netlogon lsarpc drsuapi dssetup unixinfo browser eventlog6 backupkey dnsserver");
+ 	lpcfg_do_global_parameter(lp_ctx, "server services", "s3fs rpc nbt wrepl ldap cldap kdc drepl winbindd ntp_signd kcc dnsupdate dns");
+ 	lpcfg_do_global_parameter(lp_ctx, "kccsrv:samba_kcc", "true");
+ 	/* the winbind method for domain controllers is for both RODC
+diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm
+index a7a6c4c..ffa4b95 100755
+--- a/selftest/target/Samba4.pm
++++ b/selftest/target/Samba4.pm
+@@ -773,7 +773,7 @@ sub provision_raw_step1($$)
+ 	wins support = yes
+ 	server role = $ctx->{server_role}
+ 	server services = +echo $services
+-        dcerpc endpoint servers = +winreg +srvsvc
++        dcerpc endpoint servers = +winreg +srvsvc +rpcecho
+ 	notify:inotify = false
+ 	ldb:nosync = true
+ 	ldap server require strong auth = yes
+diff --git a/source3/param/loadparm.c b/source3/param/loadparm.c
+index 0db44e9..b052d42 100644
+--- a/source3/param/loadparm.c
++++ b/source3/param/loadparm.c
+@@ -877,7 +877,7 @@ static void init_globals(struct loadparm_context *lp_ctx, bool reinit_globals)
+ 
+ 	Globals.server_services = str_list_make_v3_const(NULL, "s3fs rpc nbt wrepl ldap cldap kdc drepl winbindd ntp_signd kcc dnsupdate dns", NULL);
+ 
+-	Globals.dcerpc_endpoint_servers = str_list_make_v3_const(NULL, "epmapper wkssvc rpcecho samr netlogon lsarpc drsuapi dssetup unixinfo browser eventlog6 backupkey dnsserver", NULL);
++	Globals.dcerpc_endpoint_servers = str_list_make_v3_const(NULL, "epmapper wkssvc samr netlogon lsarpc drsuapi dssetup unixinfo browser eventlog6 backupkey dnsserver", NULL);
+ 
+ 	Globals.tls_enabled = true;
+ 	Globals.tls_verify_peer = TLS_VERIFY_PEER_AS_STRICT_AS_POSSIBLE;
+diff --git a/source4/rpc_server/wscript_build b/source4/rpc_server/wscript_build
+index 510335a..a95e070 100644
+--- a/source4/rpc_server/wscript_build
++++ b/source4/rpc_server/wscript_build
+@@ -36,7 +36,8 @@ bld.SAMBA_MODULE('dcerpc_rpcecho',
+ 	source='echo/rpc_echo.c',
+ 	subsystem='dcerpc_server',
+ 	init_function='dcerpc_server_rpcecho_init',
+-	deps='ndr-standard events'
++        deps='ndr-standard events',
++        enabled=bld.CONFIG_GET('ENABLE_SELFTEST')
+ 	)
+ 
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index d7b5864715..3b8da2b1cb 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch \
            file://CVE-2020-14318.patch \
            file://CVE-2020-14383.patch \
+           file://CVE-2023-42669.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
-- 
2.25.1


