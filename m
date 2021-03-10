Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.64])
 by mx.groups.io with SMTP id smtpd.web08.5843.1615363614549287076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 00:06:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LMDluKot;
 spf=pass (domain: windriver.com, ip: 40.107.236.64, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbWUBS+0u7YhH+4ZIzuG1fS/Rq5U1DanY+kHMkzEGXa06skSDsXivhM9jh1i80JER+UQ3Slga4FOMCYitALyaSwC7Jel6tU5BI/zcD1/ZsuoyWZi0RPoEwkj8T6iSEmzRvVutb/mw8ezaMBjpoT+7UTMAPkzR8yAdwTMkIac0lceUk97sA4uXgFQDzsL/QwOTWL3+qgiMvXI1kVexZR0JtgvDbmkFq6BIjD3iEIWxW5614n2Lz4Kdms9QPRyd7RCaYJI10MwerHh71jaDzsoW/y6+KKMBtCj2jOLODjbQ70ED3XewZXkHjCtzFXHHeAbVNr3XigT4ok1ju8JT3CWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stFOPRBuHZ8SrtZVjHUnoOmKwhmwR2kyvIo248i+saU=;
 b=O9mKmDAvqUJAsfpr2KdYiFapSPp6usV8Ej8PKyKesLCg4SqVDC+zmQUqd9w0sKpg40yt1VqWLB3DKjdS2LLrhsRAIM+Kt9Gln/HaIFmfmVMiSovmiQeehV53UuTZXlKIYjBtbR1TSzpe8//u06HvI95aW7WkkCEYS9QtcWz5yVtepeJGlFCQJbr+T5r/OFB+8i39lc6tmvU8f6XI0YKd4kWY3G0LEiRG5LL2jY3DkOa4W5Y+1cfGOgkR97HT6EQ2Aay7Cizm8bIsPagoW0jGZrJtty30usPu+/C6hFcB9PuiP82rdhNuzhZC3uKr6EbOVeQVXUWdPwZhYhLIopQ1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stFOPRBuHZ8SrtZVjHUnoOmKwhmwR2kyvIo248i+saU=;
 b=LMDluKotHNOldrwQP9ca+VJFbhTGenciFZsl8tjN6T32OLtJb66edbF5htE3t8+BDCJ/tUDcxUzJcRk0hil1d7djYv9VzqDTR85ifwkAvEl1hORd9ImuuLLTT+xszUbVOy6lU3LQjMDHoHAeeLK6YQBUSdWa2wMiguTM1ovtrnM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2319.namprd11.prod.outlook.com (2603:10b6:301:52::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 08:06:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::b954:4302:820c:ca28]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::b954:4302:820c:ca28%4]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 08:06:52 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] quagga: do not set PIDFile in service files
Date: Wed, 10 Mar 2021 16:06:42 +0800
Message-ID: <20210310080642.210062-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::45) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BYAPR03CA0032.namprd03.prod.outlook.com (2603:10b6:a02:a8::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend Transport; Wed, 10 Mar 2021 08:06:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a7e91ba-8c83-490d-6a33-08d8e39b7694
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2319:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2319993A7802BC36F47E743DF9919@MWHPR1101MB2319.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X9uP6UaTjX8tWAOURQlC+lZZpMqh/QmtpGUO2Jh75/1tQ/Nc7DlFld296CVWvxVOJh7R3qUPrLQ0knkWgW4q+IyPTkdm+D1HmICkO4zVBrLSQs54Bsp+kOUlQ4zr4QsGb1o+igSy1CtEigV22PcF6cTOQx4NASrIMS0pgW3P/3COC6eQYOb610qz5mt0AM30YR75NzM28AsgH8HhqhiM+U1e9ehjuJ7caQsWSIPvSw8L6GG1iOcnNNQkl91rPuZ6HosEbPFH8i+FgLj7i/KfJ71JxD7M7Jti1/CcqoBTO5BFAgR51bkTXfiyX0l1k0/mT3HtZWZXQHla+gQQA3EOs2lj2X241QOrZl54RVCu6sGCYVSYAL8UZTXBZPYB9TRwwY7LfPNRJ13+0p/ozrkNjUt1QVUeVpwoSjtVhS74L/zvKoerhmlJh/BchnWPqUdJjT3xxXVYkcSvLpRdcg60N6iDqal6kXbDMzDbcmH3yw90TPaNiCGYQlfU+Uj11t+0zqOh3jBOHejsqOO5LMIk3Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39850400004)(376002)(136003)(6666004)(478600001)(2906002)(66946007)(66476007)(66556008)(956004)(2616005)(16526019)(83380400001)(316002)(6916009)(8936002)(5660300002)(6486002)(26005)(52116002)(1076003)(6512007)(44832011)(36756003)(6506007)(86362001)(186003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?MOYA4Igx4eZeaE33+Nnz8onu+SDzfEX1bZScKwK0WicZ633U0ihTrbx52JNk?=
 =?us-ascii?Q?JwBWvoY7E+9lK/uO1D1uW02gNIRmTraKFiA52wQy2YG5MTllPDmWX0VFfEIo?=
 =?us-ascii?Q?1WZnmSl43D+IIYvRj7wHe9qybyoOQ/s+QH4g1rDU+FEzWL/2Vtt1qOU5v4Uc?=
 =?us-ascii?Q?ThDuxDq1n1ZS1E9CiqOBem9EUK7VV6SReaP0MQRAnm/OizKQl9rTCsS119jw?=
 =?us-ascii?Q?pomyQ6ut4g9ygTYPXRhAj3GcwZphFKiOsbhHQcYwLdCUswtEDO1WLVWsre2V?=
 =?us-ascii?Q?bzcuL+Qg9e8xvzAFuUlTnK/TKPdG9VsPmdiQUl46j79izjJ9/QrDLcPP/CIo?=
 =?us-ascii?Q?S/dw8GXoXHoOwbpCGmP4xU8qYeqnN59HpIdjflIZKPRNrgF6JXXgHMkCF+5S?=
 =?us-ascii?Q?BvfZ329lwWzQck8PqIdbc+nMmphQoLpCvXg6S1kG+hPVOxdT0ujb+BwKxLlF?=
 =?us-ascii?Q?jJBYQ+sYerCukk6g9ALJTqMrzTjU5qh81+phh07oEzT3Vq/2D11fL3np93v5?=
 =?us-ascii?Q?HKCoiuBtrVNNxXpnVaU2p0XP8NK9JF3srZV5Eg0tQBqTkzfBoEDYDTHmcLBt?=
 =?us-ascii?Q?x5YI0L7A3KB7Twz5blTxZTOehJz1qPxyo7EBjI4M8tNzsm6s881/6ttleHDk?=
 =?us-ascii?Q?Ac5O0BBfEDPcHthe+gn4QiZt4yYSAX5tDXBALKDaTv6zH+oVHAx1k+M4vRO6?=
 =?us-ascii?Q?iA+rPDWcrVeHEZ4Ut8zUb7iJva9mGAnqPP+fVw3gJR9z7cqLbV1p8jcZvJ+5?=
 =?us-ascii?Q?xEtTElqyJ3NJLwDapszG73VM0EhuIaV9ejRWJtUoLAvLt7wMPm+Gxv8e+D7v?=
 =?us-ascii?Q?Uoc80Y+7FHK7ujWVmqPKdt7sQGBkJMPcgBVUlRX6zoo75wZae3oVamTL1VDB?=
 =?us-ascii?Q?KAbNQiornTSK6QdrM4o4eoxliYyGtHJXU/BWbtx0fcNd8cdZWBHPMqJLoe/6?=
 =?us-ascii?Q?CAfr5WoGTshelosovEDB5g8ESSFGagNQBxWHVxiS+yzM4Xe+4rwBof5Yrxxp?=
 =?us-ascii?Q?sB2C0dI8UdHLebaEC0wl2RZTy06pRjwxYaAr1gQIBrKfo8nCjar7RU7/v29o?=
 =?us-ascii?Q?l5ZUFUwvuwMb3zTjX+Wt2c9zHZcXmZSrcM/iuCKFeFz6m9K9/K5m51zlcz3r?=
 =?us-ascii?Q?3NrebejCHIjhJ5hXqAUF0w/g8ZwdseyUi7DeEWyiJVlglhPtReuw5Gx7+u+d?=
 =?us-ascii?Q?00mjgiJ75lHfOeXmGO/jFB8oajG4s55NNg+iPbUJ+RkhCNWXIdHjPh2JYyxc?=
 =?us-ascii?Q?hxDJg1dojBovv5xoy3kP/qR9M0tvgj9cl4yY4qS2vhGnkIgKHTBHyExRrWec?=
 =?us-ascii?Q?QG0FzNB+wgDZC+ZKf6h1tMbt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7e91ba-8c83-490d-6a33-08d8e39b7694
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 08:06:52.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz9RzvZM/CqZpYbK2zBKPCHYVURTHoiKL5p6pTwY/YHEy9LEZjMhiPOVsaIL4BqzkO8A4z7TToeWAs34UwnXQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2319
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The systemd can not open the pid file because it is locked by quagga
daemon.

Fixes:
$ systemctl status ospf6d.service
Feb 25 05:53:26 intel-x86-64 systemd[1]: Starting OSPF routing daemon for I=
Pv6...
Feb 25 05:53:26 intel-x86-64 systemd[1]: ospf6d.service: Can't open PID fil=
e /run/quagga/ospf6d.pid (yet?) after start: Operation not permitted
Feb 25 05:53:26 intel-x86-64 systemd[1]: Started OSPF routing daemon for IP=
v6.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/quagga/files/bgpd.service   | 1 -
 meta-networking/recipes-protocols/quagga/files/ospf6d.service | 1 -
 meta-networking/recipes-protocols/quagga/files/ospfd.service  | 1 -
 meta-networking/recipes-protocols/quagga/files/ripd.service   | 1 -
 meta-networking/recipes-protocols/quagga/files/ripngd.service | 1 -
 meta-networking/recipes-protocols/quagga/files/zebra.service  | 1 -
 6 files changed, 6 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/files/bgpd.service b/=
meta-networking/recipes-protocols/quagga/files/bgpd.service
index c1021fbd7..818b59cb2 100644
--- a/meta-networking/recipes-protocols/quagga/files/bgpd.service
+++ b/meta-networking/recipes-protocols/quagga/files/bgpd.service
@@ -7,7 +7,6 @@ ConditionPathExists=3D@SYSCONFDIR@/quagga/bgpd.conf
 [Service]
 Type=3Dforking
 EnvironmentFile=3D-@SYSCONFDIR@/default/quagga
-PIDFile=3D/run/quagga/bgpd.pid
 ExecStart=3D@SBINDIR@/bgpd -d $bgpd_options -f @SYSCONFDIR@/quagga/bgpd.co=
nf
 ExecStopPost=3D@base_bindir@/rm -rf /run/quagga/bgpd.pid
 Restart=3Don-abort
diff --git a/meta-networking/recipes-protocols/quagga/files/ospf6d.service =
b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
index 99d0e6dca..50645fe2a 100644
--- a/meta-networking/recipes-protocols/quagga/files/ospf6d.service
+++ b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
@@ -7,7 +7,6 @@ ConditionPathExists=3D@SYSCONFDIR@/quagga/ospf6d.conf
 [Service]
 Type=3Dforking
 EnvironmentFile=3D-@SYSCONFDIR@/default/quagga
-PIDFile=3D/run/quagga/ospf6d.pid
 ExecStart=3D@SBINDIR@/ospf6d -d $ospf6d_options -f @SYSCONFDIR@/quagga/osp=
f6d.conf
 ExecStopPost=3D@base_bindir@/rm -rf /run/quagga/ospf6d.pid
 Restart=3Don-abort
diff --git a/meta-networking/recipes-protocols/quagga/files/ospfd.service b=
/meta-networking/recipes-protocols/quagga/files/ospfd.service
index fe8343be1..2cab1cd14 100644
--- a/meta-networking/recipes-protocols/quagga/files/ospfd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ospfd.service
@@ -7,7 +7,6 @@ ConditionPathExists=3D@SYSCONFDIR@/quagga/ospfd.conf
 [Service]
 Type=3Dforking
 EnvironmentFile=3D-@SYSCONFDIR@/default/quagga
-PIDFile=3D/run/quagga/ospfd.pid
 ExecStart=3D@SBINDIR@/ospfd -d $ospfd_options -f @SYSCONFDIR@/quagga/ospfd=
.conf
 ExecStopPost=3D@base_bindir@/rm -rf /run/quagga/ospfd.pid
 Restart=3Don-abort
diff --git a/meta-networking/recipes-protocols/quagga/files/ripd.service b/=
meta-networking/recipes-protocols/quagga/files/ripd.service
index 7af65ca8a..2c824318a 100644
--- a/meta-networking/recipes-protocols/quagga/files/ripd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ripd.service
@@ -7,7 +7,6 @@ ConditionPathExists=3D@SYSCONFDIR@/quagga/ripd.conf
 [Service]
 Type=3Dforking
 EnvironmentFile=3D-@SYSCONFDIR@/default/quagga
-PIDFile=3D/run/quagga/ripd.pid
 ExecStart=3D@SBINDIR@/ripd -d $ripd_options -f @SYSCONFDIR@/quagga/ripd.co=
nf
 ExecStopPost=3D@base_bindir@/rm -rf /run/quagga/ripd.pid
 Restart=3Don-abort
diff --git a/meta-networking/recipes-protocols/quagga/files/ripngd.service =
b/meta-networking/recipes-protocols/quagga/files/ripngd.service
index 9305f86be..c3555b345 100644
--- a/meta-networking/recipes-protocols/quagga/files/ripngd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ripngd.service
@@ -7,7 +7,6 @@ ConditionPathExists=3D@SYSCONFDIR@/quagga/ripngd.conf
 [Service]
 Type=3Dforking
 EnvironmentFile=3D-@SYSCONFDIR@/default/quagga
-PIDFile=3D/run/quagga/ripngd.pid
 ExecStart=3D@SBINDIR@/ripngd -d $ripngd_options -f @SYSCONFDIR@/quagga/rip=
ngd.conf
 ExecStopPost=3D@base_bindir@/rm -rf /run/quagga/ripngd.pid
 Restart=3Don-abort
diff --git a/meta-networking/recipes-protocols/quagga/files/zebra.service b=
/meta-networking/recipes-protocols/quagga/files/zebra.service
index e34af7242..9186041ae 100644
--- a/meta-networking/recipes-protocols/quagga/files/zebra.service
+++ b/meta-networking/recipes-protocols/quagga/files/zebra.service
@@ -7,7 +7,6 @@ ConditionPathExists=3D@SYSCONFDIR@/quagga/zebra.conf
 [Service]
 Type=3Dforking
 EnvironmentFile=3D-@SYSCONFDIR@/default/quagga
-PIDFile=3D/run/quagga/zebra.pid
 ExecStartPre=3D@BASE_SBINDIR@/ip route flush proto zebra
 ExecStart=3D@SBINDIR@/zebra -d $zebra_options -f @SYSCONFDIR@/quagga/zebra=
.conf
 ExecStopPost=3D@base_bindir@/rm -rf /run/quagga/zebra.pid
--=20
2.25.1

