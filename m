Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC40C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 04:55:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12893.1700628942529146762
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 20:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PnFTeYlA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9690644334=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AM4rnlb015805
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 20:55:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=mrhG+EbeGU6Kfrr3XqA4mR+EiWSoSTTwV3TeWgQCQ44=; b=
	PnFTeYlA+Vi76NGHAwQbah+u9ij1ZozOKghCIzWxLlX4IElan+cGIJpb35+y4k7d
	i6LSH2tc2gPHh/QxyJhCEXs4GF97VxAx921aj2F0qaCeFFwQvfTwJ01ADxM5GIrA
	Q0fSoeILrjmloprMrqrqDTZC7G1B7FirnWkPRt0V3XeLJot80nf6jO21BPmLfmW8
	m56clHFBtTUAhLSAAhn2bgpC+9dFUUzu6eawtkKGzYn6rsxqvNft/p+ckKSGAIHZ
	bW5b5RAA4/HoEjVFrjDHueTfz1fcANebL+llArrrxq8Q3TfRX9Wp81frV1pUAWa8
	ynTDfu1Htoff4uyBi6ppZA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uese430y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 20:55:41 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 20:55:46 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 2/2] samba: fix CVE-2023-42669
Date: Wed, 22 Nov 2023 04:55:24 +0000
Message-ID: <20231122045524.53871-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231122045524.53871-1-archana.polampalli@windriver.com>
References: <20231122045524.53871-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: o8m2tqRQiRPGToKGS1xEwCXJlZqXrwVc
X-Proofpoint-ORIG-GUID: o8m2tqRQiRPGToKGS1xEwCXJlZqXrwVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311060001 definitions=main-2311220035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 04:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106988

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was found in Samba's "rpcecho" development server, a non-Windows
RPC server used to test Samba's DCE/RPC stack elements. This vulnerability stems
from an RPC function that can be blocked indefinitely. The issue arises because
the "rpcecho" service operates with only one worker in the main RPC task, allowing
calls to the "rpcecho" server to be blocked for a specified time, causing service
disruptions. This disruption is triggered by a "sleep()" call in the "dcesrv_echo_TestSleep()"
function under specific conditions. Authenticated users or attackers can exploit this
vulnerability to make calls to the "rpcecho" server, requesting it to block for a
specified duration, effectively disrupting most services and leading to a complete
denial of service on the AD DC. The DoS affects all other services as "rpcecho" runs
in the main RPC task.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-42669

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-42669.patch          | 94 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch
new file mode 100644
index 000000000..dfa6aeb02
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch
@@ -0,0 +1,94 @@
+From 9989568b20c8f804140c22f51548d766a18ed887 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2023-42669
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/9989568b20c8f804140c22f51548d766a18ed887]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
+	<para>Specifies which DCE/RPC endpoint servers should be run.</para>
+ </description>
+
+-<value type="default">epmapper, wkssvc, rpcecho, samr, netlogon, lsarpc, drsuapi, dssetup, unixinfo, browser, eventlog6, backupkey, dnsserver</value>
++<value type="default">epmapper, wkssvc, samr, netlogon, lsarpc, drsuapi, dssetup, unixinfo, browser, eventlog6, backupkey, dnsserver</value>
+ <value type="example">rpcecho</value>
+ </samba:parameter>
+diff --git a/lib/param/loadparm.c b/lib/param/loadparm.c
+index eedfa00..75687f5 100644
+--- a/lib/param/loadparm.c
++++ b/lib/param/loadparm.c
+@@ -2717,7 +2717,7 @@ struct loadparm_context *loadparm_init(TALLOC_CTX *mem_ctx)
+	lpcfg_do_global_parameter(lp_ctx, "ntvfs handler", "unixuid default");
+	lpcfg_do_global_parameter(lp_ctx, "max connections", "0");
+
+-	lpcfg_do_global_parameter(lp_ctx, "dcerpc endpoint servers", "epmapper wkssvc rpcecho samr netlogon lsarpc drsuapi dssetup unixinfo browser eventlog6 backupkey dnsserver");
++	lpcfg_do_global_parameter(lp_ctx, "dcerpc endpoint servers", "epmapper wkssvc  samr netlogon lsarpc drsuapi dssetup unixinfo browser eventlog6 backupkey dnsserver");
+	lpcfg_do_global_parameter(lp_ctx, "server services", "s3fs rpc nbt wrepl ldap cldap kdc drepl winbindd ntp_signd kcc dnsupdate dns");
+	lpcfg_do_global_parameter(lp_ctx, "kccsrv:samba_kcc", "true");
+	/* the winbind method for domain controllers is for both RODC
+diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm
+index 651faa7..c7b33d2 100755
+--- a/selftest/target/Samba4.pm
++++ b/selftest/target/Samba4.pm
+@@ -773,7 +773,7 @@ sub provision_raw_step1($$)
+	wins support = yes
+	server role = $ctx->{server_role}
+	server services = +echo $services
+-        dcerpc endpoint servers = +winreg +srvsvc
++        dcerpc endpoint servers = +winreg +srvsvc +rpcecho
+	notify:inotify = false
+	ldb:nosync = true
+	ldap server require strong auth = yes
+diff --git a/source3/param/loadparm.c b/source3/param/loadparm.c
+index 8bcd35f..a99ab35 100644
+--- a/source3/param/loadparm.c
++++ b/source3/param/loadparm.c
+@@ -879,7 +879,7 @@ static void init_globals(struct loadparm_context *lp_ctx, bool reinit_globals)
+
+	Globals.server_services = str_list_make_v3_const(NULL, "s3fs rpc nbt wrepl ldap cldap kdc drepl winbindd ntp_signd kcc dnsupdate dns", NULL);
+
+-	Globals.dcerpc_endpoint_servers = str_list_make_v3_const(NULL, "epmapper wkssvc rpcecho samr netlogon lsarpc drsuapi dssetup unixinfo browser eventlog6 backupkey dnsserver", NULL);
++	Globals.dcerpc_endpoint_servers = str_list_make_v3_const(NULL, "epmapper wkssvc  samr netlogon lsarpc drsuapi dssetup unixinfo browser eventlog6 backupkey dnsserver", NULL);
+
+	Globals.tls_enabled = true;
+	Globals.tls_verify_peer = TLS_VERIFY_PEER_AS_STRICT_AS_POSSIBLE;
+diff --git a/source4/rpc_server/wscript_build b/source4/rpc_server/wscript_build
+index 8c75672..a2520da 100644
+--- a/source4/rpc_server/wscript_build
++++ b/source4/rpc_server/wscript_build
+@@ -29,7 +29,8 @@ bld.SAMBA_MODULE('dcerpc_rpcecho',
+	source='echo/rpc_echo.c',
+	subsystem='dcerpc_server',
+	init_function='dcerpc_server_rpcecho_init',
+-	deps='ndr-standard events'
++    deps='ndr-standard events',
++    enabled=bld.CONFIG_GET('ENABLE_SELFTEST')
+	)
+
+
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index dcb4d8137..17d12e439 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -51,6 +51,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2023-34968_0011.patch \
            file://CVE-2023-4091-0001.patch \
            file://CVE-2023-4091-0002.patch \
+           file://CVE-2023-42669.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


