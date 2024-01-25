Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091C5C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 10:05:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13995.1706177098220406110
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jan 2024 02:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r3TbkCHm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17540f2e71=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P7wArO015469
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jan 2024 02:04:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=fBDJj
	z7iExJgkvMFvmCt7dgd+GF5FsBlbllV83B3oE8=; b=r3TbkCHmb+6yi1R2Imp9Y
	VyDfmuq0JpGPAqjUyAqbj1qw3GgShYW36DQ59suTvM0PZmcB3okoDXTG5y9Yui3l
	2TCdix1Jze3IS+FPvjTWVuwJAVuVJfx1obMcX1mh/hakWjJE0O5Xi9z5Rb52cdqh
	Ctyft7f3mjTWv0sEF9XJF2Y2U5R1Jch2e16a1i5OJyPPlgdTXfTx6NadY4iouKWJ
	uPZlcn92IsZ7bqhJ+n6PuDeNdeO/mFHSAc8/L7uKDwo/XfVoQk4iLOYTLDduPO2/
	x/pLZihuGTeWUU1g9co0AvPWUlxvqLpiEqDRwWDVPpSEVqeYguKEifAP8g6wk7Wq
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv5rc98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jan 2024 02:04:57 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 02:05:01 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2023-0922
Date: Thu, 25 Jan 2024 10:04:43 +0000
Message-ID: <20240125100443.2101297-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 2RzeE0EBkWY88456hDyafLG0nCr0TEoX
X-Proofpoint-GUID: 2RzeE0EBkWY88456hDyafLG0nCr0TEoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_05,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jan 2024 10:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108453

From: Archana Polampalli <archana.polampalli@windriver.com>

The Samba AD DC administration tool, when operating against a remote LDAP server,
will by default send new or reset passwords over a signed-only connection.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-0922

Upstream patches:
https://github.com/samba-team/samba/commit/04e5a7eb03a

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-0922.patch           | 111 ++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2023-0922.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-0922.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-0922.patch
new file mode 100644
index 000000000..b8cb06bee
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-0922.patch
@@ -0,0 +1,111 @@
+From 04e5a7eb03a1e913f34d77b7b6c2353b41ef546a Mon Sep 17 00:00:00 2001
+From: Rob van der Linde <rob@catalyst.net.nz>
+Date: Mon, 27 Feb 2023 14:06:23 +1300
+Subject: [PATCH] CVE-2023-0922 set default ldap client sasl wrapping to seal
+
+This avoids sending new or reset passwords in the clear
+(integrity protected only) from samba-tool in particular.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=15315
+
+Signed-off-by: Rob van der Linde <rob@catalyst.net.nz>
+Signed-off-by: Andrew Bartlett <abartlet@samba.org>
+Reviewed-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+
+CVE: CVE-2023-0922
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/04e5a7eb03a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ .../ldap/clientldapsaslwrapping.xml           | 27 +++++++++----------
+ lib/param/loadparm.c                          |  2 +-
+ python/samba/tests/auth_log.py                |  2 +-
+ source3/param/loadparm.c                      |  2 +-
+ 4 files changed, 16 insertions(+), 17 deletions(-)
+
+diff --git a/docs-xml/smbdotconf/ldap/clientldapsaslwrapping.xml b/docs-xml/smbdotconf/ldap/clientldapsaslwrapping.xml
+index 3152f06..21bd209 100644
+--- a/docs-xml/smbdotconf/ldap/clientldapsaslwrapping.xml
++++ b/docs-xml/smbdotconf/ldap/clientldapsaslwrapping.xml
+@@ -18,25 +18,24 @@
+ 	</para>
+ 	
+ 	<para>
+-	This option is needed in the case of Domain Controllers enforcing 
+-	the usage of signed LDAP connections (e.g. Windows 2000 SP3 or higher).
+-	LDAP sign and seal can be controlled with the registry key
+-	"<literal>HKLM\System\CurrentControlSet\Services\</literal>
+-	<literal>NTDS\Parameters\LDAPServerIntegrity</literal>"
+-	on the Windows server side.  
+-	</para>
++	This option is needed firstly to secure the privacy of
++	administrative connections from <command>samba-tool</command>,
++	including in particular new or reset passwords for users. For
++	this reason the default is <emphasis>seal</emphasis>.</para>
+ 
+-	<para>
+-	Depending on the used KRB5 library (MIT and older Heimdal versions)
+-	it is possible that the message "integrity only" is not supported. 
+-	In this case, <emphasis>sign</emphasis> is just an alias for 
+-	<emphasis>seal</emphasis>.
++	<para>Additionally, <command>winbindd</command> and the
++	<command>net</command> tool can use LDAP to communicate with
++	Domain Controllers, so this option also controls the level of
++	privacy for those connections.  All supported AD DC versions
++	will enforce the usage of at least signed LDAP connections by
++	default, so a value of at least <emphasis>sign</emphasis> is
++	required in practice.
+ 	</para>
+ 
+ 	<para>
+-	The default value is <emphasis>sign</emphasis>. That implies synchronizing the time
++	The default value is <emphasis>seal</emphasis>. That implies synchronizing the time
+ 	with the KDC in the case of using <emphasis>Kerberos</emphasis>.
+ 	</para>
+ </description>
+-<value type="default">sign</value>
++<value type="default">seal</value>
+ </samba:parameter>
+diff --git a/lib/param/loadparm.c b/lib/param/loadparm.c
+index 75687f5..d260691 100644
+--- a/lib/param/loadparm.c
++++ b/lib/param/loadparm.c
+@@ -2970,7 +2970,7 @@ struct loadparm_context *loadparm_init(TALLOC_CTX *mem_ctx)
+ 
+ 	lpcfg_do_global_parameter(lp_ctx, "ldap debug threshold", "10");
+ 
+-	lpcfg_do_global_parameter(lp_ctx, "client ldap sasl wrapping", "sign");
++	lpcfg_do_global_parameter(lp_ctx, "client ldap sasl wrapping", "seal");
+ 
+ 	lpcfg_do_global_parameter(lp_ctx, "mdns name", "netbios");
+ 
+diff --git a/python/samba/tests/auth_log.py b/python/samba/tests/auth_log.py
+index 8ac76fe..d2db380 100644
+--- a/python/samba/tests/auth_log.py
++++ b/python/samba/tests/auth_log.py
+@@ -471,7 +471,7 @@ class AuthLogTests(samba.tests.auth_log_base.AuthLogTestBase):
+         def isLastExpectedMessage(msg):
+             return (msg["type"] == "Authorization" and
+                     msg["Authorization"]["serviceDescription"] == "LDAP" and
+-                    msg["Authorization"]["transportProtection"] == "SIGN" and
++                    msg["Authorization"]["transportProtection"] == "SEAL" and
+                     msg["Authorization"]["authType"] == "krb5")
+ 
+         self.samdb = SamDB(url="ldap://%s" % os.environ["SERVER"],
+diff --git a/source3/param/loadparm.c b/source3/param/loadparm.c
+index a99ab35..c47c5f6 100644
+--- a/source3/param/loadparm.c
++++ b/source3/param/loadparm.c
+@@ -754,7 +754,7 @@ static void init_globals(struct loadparm_context *lp_ctx, bool reinit_globals)
+ 	Globals.ldap_debug_level = 0;
+ 	Globals.ldap_debug_threshold = 10;
+ 
+-	Globals.client_ldap_sasl_wrapping = ADS_AUTH_SASL_SIGN;
++	Globals.client_ldap_sasl_wrapping = ADS_AUTH_SASL_SEAL;
+ 
+ 	Globals.ldap_server_require_strong_auth =
+ 		LDAP_SERVER_REQUIRE_STRONG_AUTH_YES;
+-- 
+2.40.0
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 6838ac12f..2fb93be0a 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -58,6 +58,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2018-14628-0004.patch \
            file://CVE-2018-14628-0005.patch \
            file://CVE-2018-14628-0006.patch \
+           file://CVE-2023-0922.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


