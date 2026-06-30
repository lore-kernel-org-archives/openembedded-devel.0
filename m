Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E444C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 19:41:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28265.1782844142251877290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 11:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nIiSLmkU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=16419c01d2=venkatasainath.ravikanti@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UIC9rR1589095;
	Tue, 30 Jun 2026 11:29:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=YaSXGEYRp
	4kpDLFJht5lI0JfP5bbOmjV0fcbAt8bWeA=; b=nIiSLmkUR9C3ECl5j6Srfb41S
	ZSOY30fzvePO7G9h8po0JNBJV7oNMFqVjHhfCwciC9q2lvzZWfOyZirUF3HQGF3b
	LVlEZXuQatK3DpIXD6bObuJ/hhZ1xiOUhgATVGp/evlwK41YHClBgf7Yej4IiUBT
	IEfnxfi5K2YF20Pv30fe0oqRA/UOSVocUX74BCnZpL6EtfHZLugpl67SvoXAMdiH
	hP45r2xktlu+tB4Q2+Bt4uuTpn9paSI1Ni6QPn/NqUsIUmmUrfT1nozAd9caQoKu
	G9alB0Nb/IPgg15Wa9LcORnKslYdSjcHTbbu73WFvED9v7lmQKW+s8VlBxP4A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f29sym98v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Jun 2026 11:29:00 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 30 Jun 2026 11:29:00 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 30 Jun 2026 11:29:00 -0700
From: "Ravikanti, Venkatasainath" <Venkatasainath.Ravikanti@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [PATCH] syslog-ng: update config version to match installed binary
Date: Tue, 30 Jun 2026 18:28:59 +0000
Message-ID: <20260630182900.1677729-1-venkatasainath.ravikanti@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-GUID: uvtSZ9urjJkZSzqXdDDQeifirEgAQNp_
X-Authority-Analysis: v=2.4 cv=HsJG3UTS c=1 sm=1 tr=0 ts=6a440aec cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=xNf9USuDAAAA:8
 a=dfCgHIyVNrt7UoQkNYAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: uvtSZ9urjJkZSzqXdDDQeifirEgAQNp_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE3NyBTYWx0ZWRfX5FFs/17g1123
 kkBIvsUxRRbVjWfhNUvpuwVG1uVLYkDb/38VQsswXhqMb1bMbt2w3mZgqoQmttwUbSvfUjCqd8q
 MrcJ53lzOVSCnr7Kq0+cA8vmAYJsGM+G9WiXRXN4o8WuNlcoQCBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE3NyBTYWx0ZWRfX0bNdlHCC7lDd
 955Ihd1VPLR3y182y/CpHBybC2kk7Ycf5kre7cUXUAy6yiz5uOrp35sCopx83u1oO86J6m29QAl
 BJzkkf2nKtZY+PzmtV6fZXTFh8rLmsvtJzBjj9jZR5hdmOHllZgJEx+t/1EPHvdZS9/pdzmr6Mz
 nUOH/aIe1l7pN5NFw12Mq/mDatIR9COcRSjNJBl+6gs6XbNPFNHImMa8thLXX4ESEs2sRULG3FY
 yznOT3aU7eGIL08qUrn2UQpmnGYbRek1F4h9EcFogmMe0fRCdGYplq9Re0U0dhjc0HN06+WT8j7
 BZ5CsCvbkYyX1sAjU9VwpYQrFKPZjU/AOcm+xsLnIjFKZtNb1AVMLLFINB4o1JzVLq5YPYwCjkz
 /c1hFWBrt12OtRU1oAKT9s2AzN7fjsRUmBL8fm32RZuixXCcwuC462z55QndMleRIrCP4XtRuuE
 oPdLfPwAQGLSzKT0s/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300177
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 19:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127981

From: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>

syslog-ng 4.6.0 ships with Config version 4.2, but the configuration
files still declare @version: 3.36. This causes two warnings at startup:

  WARNING: Configuration file format is too old, syslog-ng is running
  in compatibility mode
  WARNING: Your configuration file uses an obsoleted keyword

Update the @version to 4.2 to match the binary's config version.
Also replace the deprecated stats_freq() option with the modern
stats(freq()) syntax, and add @include "scl.conf" for the systemd
config to align with current upstream recommendations.

These changes mirror what was done in fee12741695f ("syslog-ng: upgrade
4.7.0 -> 4.8.1") for the master branch, adapted for the 4.6.0 version
on scarthgap.

Signed-off-by: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>
Assisted-by: Kiro:claude-sonnet-4
---
 .../syslog-ng/files/syslog-ng.conf.systemd            | 11 +++++------
 .../syslog-ng/files/syslog-ng.conf.sysvinit           |  9 ++++-----
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
index 851bf252b..bb8784d31 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
@@ -1,5 +1,5 @@
-@version: 3.36
-#
+@version: 4.2
+@include "scl.conf"
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
 # Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
@@ -8,11 +8,10 @@
 #     Only change is to add dns_cache(no) to options to suppress initialization warning.
 #
 #     Joe Slater <joe.slater@windriver.com>
-
 # First, set some global options.
-options { chain_hostnames(off); flush_lines(0); use_dns(no); dns_cache(no); use_fqdn(no);
-	  owner("root"); group("adm"); perm(0640); stats_freq(0);
-	  bad_hostname("^gconfd$");
+options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
+	  dns_cache(no); owner("root"); group("adm"); perm(0640);
+	  stats(freq(0)); bad_hostname("^gconfd$");
 };
 
 ########################
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
index 70afd0da8..a25acf889 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
@@ -1,4 +1,4 @@
-@version: 3.36
+@version: 4.2
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
@@ -8,11 +8,10 @@
 #     Only change is to add dns_cache(no) to options to suppress initialization warning.
 #
 #     Joe Slater <joe.slater@windriver.com>
-
 # First, set some global options.
-options { chain_hostnames(off); flush_lines(0); use_dns(no); dns_cache(no); use_fqdn(no);
-	  owner("root"); group("adm"); perm(0640); stats_freq(0);
-	  bad_hostname("^gconfd$");
+options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
+	  dns_cache(no); owner("root"); group("adm"); perm(0640);
+	  stats(freq(0)); bad_hostname("^gconfd$");
 };
 
 ########################
-- 
2.54.0


