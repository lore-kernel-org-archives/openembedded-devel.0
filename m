Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C447C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 10:17:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.124])
 by mx.groups.io with SMTP id smtpd.web11.144967.1723803460276523476
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Aug 2024 03:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=YJp4yNTV;
 spf=pass (domain: navimatix.de, ip: 52.101.70.124, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqG14pE3u/a20XuM6WTnw5ZaiwteRuSgey5bJdzcmlrJcUDMiyieQZpCsQP5YwqhP9xivyhU3A/9SVvbJaGGZMEPS6E2MgMOrCGi0xLK/HekDcps+Anh5O1oXwaSBntWs+/HAwR8AHzekAJAlCBy5JBw/Uahe4n4zIr60Wq4zW5gv3gdVKtq/hdwwfHokmuARANYV1ePmjRbF904TL3J7tyoIBZnsaz6W1Ek+r+ImHXwIlSUp+Hs7mYuPQd5xTz29zjXA9kIgSWTh+N5R9hWuiKdXO4I8uOV+QGaLQM5fPkk8Imn3lPWZ28Q31i0GbPfLRga2cs9mjcOfZ4L0QBRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9j/lVChrFMTz1rkKhfySA+d6xPnjWSM/20IZ+AgkzM=;
 b=ehu79ar8DNju4EQYgE/u/4s4u2upZMvPoqM8hMovcDAr09cBq3xmluYD5MebphJZHwNTeB55K4Us4lHxfKSGGk1ZR7ixmEc3xRbtOMqAzyrkVP8D8XXqMTxNKYphKPKE+kGZWOnO0ZoMRDURqUVpaO23x3qvvuPYXjQSa8ECa2uJsPrxEFx/eG3oIor5lIEawuHPMJhXk4m8LloTjHI2VdhjXUCsGoN1swvTrz5XG9q91TCOKYTKASRYshE/REwa2dZroOQIzgYmY23Gyg9jmcykzuGFYvGSzNsPh/EWz0F++5XnCfstBh7Sa8G1w8mJuipi4zgua+ZoITNOxwWoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9j/lVChrFMTz1rkKhfySA+d6xPnjWSM/20IZ+AgkzM=;
 b=YJp4yNTVSO3dO3CTENWEPrqwvpWs+s0+zt2FjtehESJqgpnzgjtlWElpgrflE7cTIU8DosYbsYhSwMlBsEdIsVJbZBj+xql67KT1lh7eZdR29a3BdmRvyATdelLk+UjR6IPT99tS8Vr7bOT+o/ko0+mrSsuo1imc50mByYGwP6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by GVXPR01MB10671.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:157::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 10:17:34 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 10:17:34 +0000
Date: Fri, 16 Aug 2024 12:17:33 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 1/2] dnsmasq: Install conf example from upstream instead of
 our version
Message-ID: <dd85bccd49b78f9ae2cc37edcc7a722484cad4f2.1723803452.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::20) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|GVXPR01MB10671:EE_
X-MS-Office365-Filtering-Correlation-Id: a974aeb7-2369-4252-7708-08dcbddca56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8leIDKRf5Qp8Plw6K37hOjhb32kkrQwzP1gMJKyk620qdF2Sbv78zf+AZmed?=
 =?us-ascii?Q?ukzKcPb1AJ5y6dV105nyx+yH5WJdFlWldNB75bJYCAF0kgwOW4GesW0TCdaQ?=
 =?us-ascii?Q?3SOk369YaejW1dGt/e36WTN/MfSZoA4NgHjPIdk12lNF//t7PbRxn3GaybbX?=
 =?us-ascii?Q?W96C9h4B1V0RUHo2zDWnfrgbtrlwOXyl7FJ4c13rEsacbLMrlCHTsAUfmqCk?=
 =?us-ascii?Q?Vfi5IYjd12WA/BCwGy0qHM4tDVBkROUYYOwJhjKZz2SU8nqWNJuWYyyMiGwG?=
 =?us-ascii?Q?gDHULArImwrgQ4dUXwuYYZgoI1L1yKhRtvLtnp9vxXB7v7r4IpskxUMNOW3T?=
 =?us-ascii?Q?l/sA5CPpZqA9wOM1R7Fsu/Jv61g4SSX3bfGl3JJe066KzwipDAokKj7L/7rO?=
 =?us-ascii?Q?Sa3HB+3FrHqKuxfbiR0c3jqV3rXpkwr0qFRJ3KOI7lPIxEAbg080LExqXjme?=
 =?us-ascii?Q?4CFYaSjnxBG1NKBOEoMJtT2Ijjl87PMFWHEcORNO764FjMzE5Y9qC/t0sniv?=
 =?us-ascii?Q?qhHv6kzWzPfAsW4E/uUbMC5TRofBcBLtx5GhaTF23wf0XaVnAWSGIzcbnK6V?=
 =?us-ascii?Q?X06xSxK8JsJJ5C8S3YhDFj1pGMgJqvQnSz9m9/g1AHGBT4ZAwvkIK3fuyJGX?=
 =?us-ascii?Q?oOWtJxyuBT937rr28OAI12r8Z3K+XegKWNFefdWhwLgy5DY8hjb8te50A/c1?=
 =?us-ascii?Q?fBi4hrBuRerEM1a9LqiqreO7VsbgOTYM7RCFA/1Xm71uyb2ybfmexIyo6iCd?=
 =?us-ascii?Q?sutM0MZqNUt5LIz2wQUbTEzL/v8lVoLiHTgu7DD3NDkimkOD9zZxzw75tF3O?=
 =?us-ascii?Q?NblZTv0bIackWigdjb2qE7DWIkBEUqgD1zOk8z6d39xU+S0QewTJJOxpLEc1?=
 =?us-ascii?Q?2hi32VFx+4phoftJNwG9mJP5WrPRKxGwvSnBQKby+OhIXpevTPgA55v3VbRI?=
 =?us-ascii?Q?PV4D12n28imKauObwo8IRU+KKefDwykVyblYj8qIFB++Gcb5odLA/sWSwFgW?=
 =?us-ascii?Q?E1Xh6/anOQiCh/oplC1/XT+We9akOTjq3ajiYA2v4kAWF1KI7aQj7//AUjLu?=
 =?us-ascii?Q?RsdiK67iRVwpq3yVdu1NS7uuVBbLw0bwe00q58mxgSrC4rud/xV+TlA4iPZK?=
 =?us-ascii?Q?p1hqmqLpqJwi2ESO2fHLDNRJ3W05BurHCkpM98AoPFcvkZXaNe1Vz1qnyKV8?=
 =?us-ascii?Q?XJLzZkqQFwFi+4xQuLZ6OTR4lrP28OrYCuD69z9u70fnD6uj/rhYCzJ8NlBu?=
 =?us-ascii?Q?pJ5Xaz31thJ59oAwhSJAN5y3cjBQMXk0ILoTravlJN06e8rf9uYjlAj7Zmis?=
 =?us-ascii?Q?I4A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1qM85qFJYL101ejDsy2A4ryAH8Dw2r5QB8inwnmovzvHeWCdozyu8MUtqtYp?=
 =?us-ascii?Q?73aluB/sVIGe+Si1rfT4PovnebO3URgxznT1TCyZTWYFrBYqOpLTPM6MowPK?=
 =?us-ascii?Q?bx+7IxzQQNUmmSgMLs4rLJd4bZM1AQgmn1ZNWN/7bHQeebq/KQQDJy+vcwjV?=
 =?us-ascii?Q?bYQSoO7WQErtllJSLK5yMHi3bmcTInidsob3BmrHwofsubjlPBIYbRm/MFcD?=
 =?us-ascii?Q?9GqA09OWgL4iys4D8Dc22zKfOn4WKCjAzKlBZ/utxBmki2V4rBu8XYTL6jbb?=
 =?us-ascii?Q?4a6bkRGlzi2ZNNx7I6MuJHd66x9bjUnTdcvSDO2qPW2WGD3sAPP7TH3efluF?=
 =?us-ascii?Q?Fpfea5UYx7mzv41KAAiE1DGTdclS+TAPYGw74GgKQAbBz6BcmF4SsQ79MTVL?=
 =?us-ascii?Q?W0iWBryeEWsQ84RzZfKE309G50XvnfWaj7/F2L0XXrLynjFLLo+HWzt5urIU?=
 =?us-ascii?Q?6ZSFKSvfRVUnwHISMjrDlVHnB6vnfe1CycDGVJi2a6CQ0KD8sG8KJN0h04KM?=
 =?us-ascii?Q?6L2vBoGdkt0nqGbOsTCUFha+JoNrg6phmGVZbxpM288b6Ek4ZD+ZxXMFS74b?=
 =?us-ascii?Q?DjF0DtFFPGi9ky+5d62reLMVMgEV8JwxZRwc8PpILv6Dsgnx/FenHpGilbus?=
 =?us-ascii?Q?PvUSHw2Z4g3ojKPajnkOS9xERnFgeFrrUv0m4X3taHS3TN87Gv+XknBRyUHX?=
 =?us-ascii?Q?cYpAJkZdxvIfIrz7pOls9MIdardGO15mtQDJBoPmyHyFrgyD94kPORHbtpBB?=
 =?us-ascii?Q?vL2NvPvMLIuu5MLUFVAdhxpPBZxrWbz7n4JH9+a1+u3dOqdyzOUOfZj5/X0I?=
 =?us-ascii?Q?ijyzyzCCUHVvUAex2TbFXRUZUh/4LusZIb5CT56AdPb+XnEgmMERWZyLbPdq?=
 =?us-ascii?Q?K2Tlx3wZvZllCo5r6rmxFFrBlvYxonD8asqBkCdaEhx+7fEeTvlv9qghzKGZ?=
 =?us-ascii?Q?UNXHTCDlIj/0o9q61DgNDXEHGwulHQI9TE81a0TrmQCgKVtduNY9R01L/1/E?=
 =?us-ascii?Q?7POz3Psd75DMNXdvRZpdhWZvdze8pRWXQJWxWw2wv1l6x0GaNGu6CoSrhieV?=
 =?us-ascii?Q?ZFvndxCvkNmg56qt68Cw53RyhGI1T5v6X9UecxKDPbwDwm/R6LQz7v4QSzFR?=
 =?us-ascii?Q?ElvpG5tLisch/mTq+dRLD7NAliErLporBQ9OVrcYO9ATEKh+Ce2gKQ5snVYa?=
 =?us-ascii?Q?l5mDgiEgVqFixT5RhvQYxMq+g08qEFHtDdyajJFgXZ8htOGCzpASAsj0zkO+?=
 =?us-ascii?Q?EWLwFO1XSNsJT9sbSqxfEJCDUspls23TE2MV9pFw1Bb4iJa/P4QgrTYUd374?=
 =?us-ascii?Q?5wHg1KzoZH6EaRgQs2pka1hTsnptnOG5bRkz5pcw/EI3Jc2KS1nEl0EFc4ST?=
 =?us-ascii?Q?s9ooQmJe6ancFEjcQ2yADqTwATfqSQGiBtmMlgdjzovriKttSHvNgaeSWgLu?=
 =?us-ascii?Q?u0nNe4I/JTUu5ntp/F4ZEXbzY+bUpwdzT4gtmtGxw2otwXpK/hrMJtLZgn9s?=
 =?us-ascii?Q?60ysRPkp1KOqkOrWy2lAR0c68JCAIbsJusvXLDFtJzARSrpL6jQt/07lSoAm?=
 =?us-ascii?Q?e0IyhGsJJdlxebj5fn8oVG9QEslnPrgIdjijSegFG6indP413GaanAtVny/k?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a974aeb7-2369-4252-7708-08dcbddca56c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 10:17:34.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMV3AHjbiiGwqssDiCMp0+tZz3jkgFLVsW6eAgCt1Wo68yZ/u8qo4aamjSAXJy0JEikpFaLJ/MVzNM8zAX9ShiZ6Y3E/dmgG2hmwhqgeqlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB10671
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 10:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111835

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Our version was copied 2011 and is out of date. The changes in the meantime
affected only comments.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |   3 +-
 .../dnsmasq/files/dnsmasq.conf                | 298 ------------------
 2 files changed, 1 insertion(+), 300 deletions(-)
 delete mode 100755 meta-networking/recipes-support/dnsmasq/files/dnsmasq.c=
onf

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta=
-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index be74759d5..30ed463ee 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -12,7 +12,6 @@ DEPENDS +=3D "gettext-native"
 #at least versions 2.69 and prior are moved to the archive folder on the s=
erver
 SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][floa=
t(d.getVar('PV').split('.')[1]) > 69]}dnsmasq-${PV}.tar.gz \
            file://init \
-           file://dnsmasq.conf \
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
@@ -81,7 +80,7 @@ do_install () {
                "MANDIR=3D${D}${mandir}" \
                install-i18n
     install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdi=
r}/dnsmasq.d
-    install -m 644 ${UNPACKDIR}/dnsmasq.conf ${D}${sysconfdir}/
+    install -m 644 ${S}/dnsmasq.conf.example ${D}${sysconfdir}/dnsmasq.con=
f
     install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
=20
     install -d ${D}${systemd_unitdir}/system
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf b/m=
eta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
deleted file mode 100755
index 2897b9030..000000000
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
+++ /dev/null
@@ -1,298 +0,0 @@
-# Configuration file for dnsmasq.
-#
-# Format is one option per line, legal options are the same
-# as the long options legal on the command line. See
-# "/usr/bin/dnsmasq --help" or "man 8 dnsmasq" for details.
-
-# Listen on this specific port instead of the standard DNS port
-# (53). Setting this to zero completely disables DNS function,
-# leaving only DHCP and/or TFTP.
-#port=3D5353
-
-# Change these lines if you want dnsmasq to serve MX records.
-# Only one of mx-host and mx-target need be set, the other defaults
-# to the name of the host  running dnsmasq.
-#mx-host=3D
-#mx-target=3D
-#selfmx
-#localmx
-
-# The following two options make you a better netizen, since they=20
-# tell dnsmasq to filter out queries which the public DNS cannot
-# answer, and which load the servers (especially the root servers)=20
-# uneccessarily. If you have a dial-on-demand link they also stop
-# these requests from bringing up the link uneccessarily.
-
-# Never forward plain names (with a dot or domain part)
-domain-needed
-# Never forward addresses in the non-routed address spaces.
-bogus-priv
-
-
-# Uncomment this to filter useless windows-originated DNS requests
-# which can trigger dial-on-demand links needlessly.
-# Note that (amongst other things) this blocks all SRV requests,=20
-# so don't use it if you use eg Kerberos.
-#filterwin2k
-
-# Change this line if you want dns to get its upstream servers from
-# somewhere other that /etc/resolv.conf=20
-#resolv-file=3D
-
-# By  default,  dnsmasq  will  send queries to any of the upstream
-# servers it knows about and tries to favour servers to are  known
-# to  be  up.  Uncommenting this forces dnsmasq to try each query
-# with  each  server  strictly  in  the  order  they   appear   in
-# /etc/resolv.conf
-#strict-order
-
-# If you don't want dnsmasq to read /etc/resolv.conf or any other
-# file, getting its servers for this file instead (see below), then
-# uncomment this
-#no-resolv
-
-# If you don't want dnsmasq to poll /etc/resolv.conf or other resolv
-# files for changes and re-read them then uncomment this.
-#no-poll
-
-# Add other name servers here, with domain specs if they are for=20
-# non-public domains.
-#server=3D/localnet/192.168.0.1
-
-# Add local-only domains here, queries in these domains are answered
-# from /etc/hosts or DHCP only.
-#local=3D/localnet/
-
-# Add domains which you want to force to an IP address here.
-# The example below send any host in doubleclick.net to a local
-# webserver.
-#address=3D/doubleclick.net/127.0.0.1
-
-# You no longer (as of version 1.7) need to set these to enable=20
-# dnsmasq to read /etc/ppp/resolv.conf since dnsmasq now uses the
-# "dip" group to achieve this.
-#user=3D
-#group=3D
-
-# If you want dnsmasq to listen for requests only on specified interfaces
-# (and the loopback) give the name of the interface (eg eth0) here.=20
-# Repeat the line for more than one interface.
-#interface=3D
-# Or you can specify which interface _not_ to listen on
-#except-interface=3D
-# Or which to listen on by address (remember to include 127.0.0.1 if
-# you use this.)
-#listen-address=3D127.0.0.1
-
-# On systems which support it, dnsmasq binds the wildcard address,
-# even when it is listening on only some interfaces. It then discards
-# requests that it shouldn't reply to. This has the advantage of=20
-# working even when interfaces come and go and change address. If you
-# want dnsmasq to really bind only the interfaces it is listening on,
-# uncomment this option. About the only time you may need this is when=20
-# running another nameserver on the same machine.
-#bind-interfaces=20
-
-# If you don't want dnsmasq to read /etc/hosts, uncomment the
-# following line.
-#no-hosts
-# or if you want it to read another file, as well as /etc/hosts, use
-# this.
-#addn-hosts=3D/etc/banner_add_hosts
-
-# Set this (and domain: see below) if you want to have a domain
-# automatically added to simple names in a hosts-file.
-#expand-hosts
-
-# Set the domain for dnsmasq. this is optional, but if it is set, it
-# does the following things.
-# 1) Allows DHCP hosts to have fully qualified domain names, as long
-#     as the domain part matches this setting.
-# 2) Sets the "domain" DHCP option thereby potentially setting the
-#    domain of all systems configured by DHCP
-# 3) Provides the domain part for "expand-hosts"
-#domain=3Dthekelleys.org.uk
- =20
-# Uncomment this to enable the integrated DHCP server, you need
-# to supply the range of addresses available for lease and optionally=20
-# a lease time. If you have more than one network, you will need to
-# repeat this for each network on which you want to supply DHCP
-# service.
-#dhcp-range=3D192.168.0.50,192.168.0.150,12h
-#dhcp-range=3D10.0.0.10,10.0.0.200,2h
-
-# This is an example of a DHCP range where the netmask is given. This
-# is needed for networks we reach the dnsmasq DHCP server via a relay=20
-# agent. If you don't know what a DHCP relay agent is, you probably
-# don't need to worry about this.
-#dhcp-range=3D192.168.0.50,192.168.0.150,255.255.255.0,12h
-
-# This is an example of a DHCP range with a network-id, so that
-# some DHCP options may be set only for this network.
-#dhcp-range=3Dred,192.168.0.50,192.168.0.150
-
-# Supply parameters for specified hosts using DHCP. There are lots
-# of valid alternatives, so we will give examples of each. Note that
-# IP addresses DO NOT have to be in the range given above, they just
-# need to be on the same network. The order of the parameters in these
-# do not matter, it's permissble to give name,adddress and MAC in any orde=
r
-
-# Always allocate the host with ethernet address 11:22:33:44:55:66=20
-# The IP address 192.168.0.60
-#dhcp-host=3D11:22:33:44:55:66,192.168.0.60
-
-# Always set the name of the host with hardware address
-# 11:22:33:44:55:66 to be "fred"
-#dhcp-host=3D11:22:33:44:55:66,fred
-
-# Always give the host with ethernet address 11:22:33:44:55:66
-# the name fred and IP address 192.168.0.60 and lease time 45 minutes
-#dhcp-host=3D11:22:33:44:55:66,fred,192.168.0.60,45m
-
-# Give the machine which says it's name is "bert" IP address
-# 192.168.0.70 and an infinite lease
-#dhcp-host=3Dbert,192.168.0.70,infinite
-
-# Always give the host with client identifier 01:02:02:04=20
-# the IP address 192.168.0.60
-#dhcp-host=3Did:01:02:02:04,192.168.0.60
-
-# Always give the host with client identifier "marjorie"
-# the IP address 192.168.0.60
-#dhcp-host=3Did:marjorie,192.168.0.60
-
-# Enable the address given for "judge" in /etc/hosts
-# to be given to a machine presenting the name "judge" when
-# it asks for a DHCP lease.
-#dhcp-host=3Djudge
-
-# Never offer DHCP service to a machine whose ethernet=20
-# address is 11:22:33:44:55:66
-#dhcp-host=3D11:22:33:44:55:66,ignore
-
-# Ignore any client-id presented by the machine with ethernet
-# address 11:22:33:44:55:66. This is useful to prevent a machine=20
-# being treated differently when running under different OS's or
-# between PXE boot and OS boot.
-#dhcp-host=3D11:22:33:44:55:66,id:*
-
-# Send extra options which are tagged as "red" to=20
-# the machine with ethernet address 11:22:33:44:55:66
-#dhcp-host=3D11:22:33:44:55:66,net:red
-
-# Send extra options which are tagged as "red" to any machine whose
-# DHCP vendorclass string includes the substring "Linux"
-#dhcp-vendorclass=3Dred,Linux
-
-# Send extra options which are tagged as "red" to any machine one=20
-# of whose DHCP userclass strings includes the substring "accounts"
-#dhcp-userclass=3Dred,accounts
-
-# If this line is uncommented, dnsmasq will read /etc/ethers and act
-# on the ethernet-address/IP pairs found there just as if they had
-# been given as --dhcp-host options. Useful if you keep
-# MAC-address/host mappings there for other purposes.
-#read-ethers
-
-# Send options to hosts which ask for a DHCP lease.
-# See RFC 2132 for details of available options.
-# Note that all the common settings, such as netmask and
-# broadcast address, DNS server and default route, are given
-# sane defaults by dnsmasq. You very likely will not need any
-# any dhcp-options. If you use Windows clients and Samba, there
-# are some options which are recommended, they are detailed at the
-# end of this section.
-# For reference, the common options are:
-# subnet mask - 1
-# default router - 3
-# DNS server - 6
-# broadcast address - 28
-
-# Set the NTP time server addresses to 192.168.0.4 and 10.10.0.5
-#dhcp-option=3D42,192.168.0.4,10.10.0.5
-
-# Set the NTP time server address to be the same machine as=20
-# is running dnsmasq
-#dhcp-option=3D42,0.0.0.0
-
-# Set the NIS domain name to "welly"
-#dhcp-option=3D40,welly
-
-# Set the default time-to-live to 50
-#dhcp-option=3D23,50
-
-# Set the "all subnets are local" flag
-#dhcp-option=3D27,1
-
-# Send the etherboot magic flag and then etherboot options (a string).
-#dhcp-option=3D128,e4:45:74:68:00:00
-#dhcp-option=3D129,NIC=3Deepro100
-
-# Specify an option which will only be sent to the "red" network=20
-# (see dhcp-range for the declaration of the "red" network)
-#dhcp-option=3Dred,42,192.168.1.1
-
-# The following DHCP options set up dnsmasq in the same way as is specifie=
d
-# for the ISC dhcpcd in=20
-# http://www.samba.org/samba/ftp/docs/textdocs/DHCP-Server-Configuration.t=
xt
-# adapted for a typical dnsmasq installation where the host running
-# dnsmasq is also the host running samba.
-# you may want to uncomment them if you use Windows clients and Samba.
-#dhcp-option=3D19,0           # option ip-forwarding off=20
-#dhcp-option=3D44,0.0.0.0     # set netbios-over-TCP/IP nameserver(s) aka =
WINS server(s)
-#dhcp-option=3D45,0.0.0.0     # netbios datagram distribution server
-#dhcp-option=3D46,8           # netbios node type
-#dhcp-option=3D47             # empty netbios scope.
-=20
-
-# Set the boot filename and tftpd server name and address
-# for BOOTP. You will only need this is you want to
-# boot machines over the network.
-#dhcp-boot=3D/var/ftpd/pxelinux.0,boothost,192.168.0.3
-
-# Set the limit on DHCP leases, the default is 150
-#dhcp-lease-max=3D150
-
-# The DHCP server needs somewhere on disk to keep its lease database.
-# This defaults to a sane location, but if you want to change it, use
-# the line below.
-#dhcp-leasefile=3D/var/lib/misc/dnsmasq.leases
-
-# Set the cachesize here.
-#cache-size=3D150
-
-# If you want to disable negative caching, uncomment this.
-#no-negcache
-
-# Normally responses which come form /etc/hosts and the DHCP lease
-# file have Time-To-Live set as zero, which conventionally means
-# do not cache further. If you are happy to trade lower load on the=20
-# server for potentially stale date, you can set a time-to-live (in=20
-# seconds) here.
-#local-ttl=3D
-
-# If you want dnsmasq to detect attempts by Verisign to send queries
-# to unregistered .com and .net hosts to its sitefinder service and
-# have dnsmasq instead return the correct NXDOMAIN response, uncomment
-# this line. You can add similar lines to do the same for other
-# registries which have implemented wildcard A records.
-#bogus-nxdomain=3D64.94.110.11
-
-# If you want to fix up DNS results from upstream servers, use the
-# alias option. This only works for IPv4.
-# This alias makes a result of 1.2.3.4 appear as 5.6.7.8
-#alias=3D1.2.3.4,5.6.7.8
-# and this maps 1.2.3.x to 5.6.7.x
-#alias=3D1.2.3.0,5.6.7.0,255.255.255.0
-
-# For debugging purposes, log each DNS query as it passes through
-# dnsmasq.
-#log-queries
-
-# Include a another lot of configuration options.
-#conf-file=3D/etc/dnsmasq.more.conf
-=20
-=20
-
-
-
--=20
2.34.1


