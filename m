Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B6CCDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 09:20:51 +0000 (UTC)
Received: from mx-relay37-hz1-if1.hornetsecurity.com (mx-relay37-hz1-if1.hornetsecurity.com [94.100.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17000.1782206442745971410
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 02:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=MSA4zf2Q;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.47, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate37-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.72.106, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=am0pr02cu008.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=GYPFbgPiMAqes4G4ryKQhFgBWrwsTumWQyL2OWb0dnQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782206438;
 b=aSutm86UWR1UrdRobAv9WzTk2ydZlmFgof7kGk3WvZu7+eNIt1wCnQXuCBbF2BMBN0Zig0Zj
 h5Ur4JN74QmySNyltgu5BlURJtnipSZtCYbwuNcQ+6RBIuXLU5OgVXPp5hbkv6iW34ZEND5uSPa
 W9nZcst6TiFA8p+ej80+8Ht/G7gEwoH/5mXPCedYfRcwoFtxHb7BjEalzKhmFhI6JCBoW27rHBB
 T6+75AuqhFE51/3jLrLpKFiaAw6nNed+NksdRy5qOmm8CVY/YYfkDZ1hifJ7Jck8XoEHDVAsVPV
 WmUKli5j0EDW6fQ2/D83/VAVtm3X7C+gQhp4oYd1O1Cwg==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782206438;
 b=jnsSfdzBG+EKd2FCQVCcrhjthDc8Z6/rcwcI95SP+GySnZi7DEmRW4VOdm1e/ENrxqSIQ4u6
 VRlMqLoWrfMfGPg4ubXr4cHGRhC2XjuzpveIju8Flri7F7NfI3BtSxH29/4hvCMLZRKZPgZRqB3
 9bg322bTEWYKOElrhAt8m0jQXtsqosd06mbyEHkriDsJeOkh7JtV03TF8exDZbvoxdMhc7VczRR
 xrmPxb+nxYFdcQUYzQ5dZayX8TIeBPkrVrfG5xFpiZ23v5ZF8encE75JN2beBii7dltlg1l38OT
 T6AnAlymv5c07DqwXxjimC9gsSYlCCh/8B7v1rWjI2cFg==
Received: from mail-westeuropeazon11023106.outbound.protection.outlook.com ([52.101.72.106]) by mx-gate37-hz1;
 Tue, 23 Jun 2026 11:20:38 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvXTueiVRh5aFSUibL2ew6u0ylqace+WiubUcE0lVqGIIsACwD8fvsvO4rqlxljoWhQY3VMw7gQ98erDqcu5SF+g9eGK/YmKB0mCP6MAdCmVsT6geu+4rGG8jXy2ez+NGhlK4hWugZHB+cW3RBDx8f5t/Ifik55hls/KJRLGje/SDCj97TSe190CV2moQSZiWNuLE1FO3XhUx32g90ID3xc4pfgpqqCyd7hY8iF4pltPLStfIiDmOORQxDmKhTkWnoondaVMH3+PmD+zDap6GMKOX/+jOa+yhR6YFP7Kk+LVAEf75DdudFut7TMOafIrz1lBjuz4YyZfeOz24vZxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYPFbgPiMAqes4G4ryKQhFgBWrwsTumWQyL2OWb0dnQ=;
 b=I/UOM7r614JEVsHD70VBJRbMK+5YTzu9NwiwnetbmJ5OIXggTURtd6LdFIxkKwQLo9AmAcX7euF+29w1AuohwhU5qQq8xfNbCPxKS6Rgmezwi3DhNS3FfNtqRXo6J2sGBW4N4QyI8v5XaPDCph2ntWF0aj9F983qFvMSsHXBcqfRlw/T+jGcm9+YRXmhj6F2++zUsF+z8CtO7tilLafptgx5cOFQ6guQO+JZ+kALGyDF+TOYEyj1QQ7UMTx7NulsRcT8rac0w1drmL0XubqhEb7MaBmKCLxcw0GMHNqrMIrwNa2UC3KOmZgnsLLRL8fTv455MZDcJSjLx4Zkdqfneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYPFbgPiMAqes4G4ryKQhFgBWrwsTumWQyL2OWb0dnQ=;
 b=MSA4zf2QGq+XbyE5ftwjEwwzYtpP9tPJQLl5p+nv7SRtdey1Wlz6gOwL7DYZq5bwmdY6iVOCtVwxUvJJeQ/8IXOx96+oAjAIJk7mYYbB1/VP+bSxIQ/vIXhzDQBDfJzZVd09nI5GfwP1OvAMD4oxn2o9tj19KfM00jo+Wo+IvZDaPIVDWT5HqwKw3jttI1byXSA2ocPUeiUL3edYZ/X+NYz5Vr/fZ1ghpX0e6ll/oHZBRgzEOfVXUqiS2eT2vNlHZtq0ZbbmsgPM0zzqmBybYoFVSsgKPMbQK/7Eat+nXFUriMP8s340GTSbK14ZRy9atwG4hNLXxpl5LVYxslV9aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1862.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:51d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 09:20:27 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 09:20:26 +0000
From: tgaige.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [meta-webserver][scarthgap][PATCH] nginx: patch CVE-2026-48142
Date: Tue, 23 Jun 2026 11:20:18 +0200
Message-ID: <20260623092018.2397141-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR1PEPF000077A3.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:918::429) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AS4P192MB1862:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a812c6-29dc-4026-bb74-08ded108a989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|13003099007|18002099003|38350700014|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Q6iI7eG3oStaOnC7VndJEm0U/nVbAL70cfV0i8tctdTBU4MtJP39Z4X2ZHrrK52eChVe94HcIZfqCsiC+tWXyrq2nLagvGfJFSRduybEYCahR8N4XIEd+hUnLWGh0AGwEs6+sEqmwixLm8iHzmhJIKOTKx1AgqWYWSf/Ey7qTa9JnD4eTGKYaMa0qyRgeggeT4jOQq55tAcv35lGYxTfPXvr9LQx2wa5l+gDC2oEPhBCaIFBpbDpH8dg5vMshGUL5mBs62ZunEJExak+mM8PbQmpUej+cgZ2z8A2B/0GQsoT7BuO4ZqIBl1vH7ty/jQ7iDnxCK8jFhIkK99tPBiS3ESTaG9Q9IsDI5fO9WnxY8bgpMqNekGsumhL3aIkhjrYrC4dQXx5mNtwxkM53frM3eEIfs78HQzjBEfSwSh2rkAORvX2K9hbs6rL2r8Q5FIPD4OTkyrgP076NMiOXK5rdBoN9dAGV9chisshiTYesloncPiXPwCzylezEivuC3lXkPhnrRkOas4UhaHgwiA1JZWANPLLvDlnBNJhjkKk6DrZmmSpJGFYgpfSrVspXDWm/uN5420M3M1zlkQkN+aWTXq0LZdRslWxUAHWg2fPuQ4wj6pUOinHiET5T3e3B6kGm/nR3ygZi7Lt7uh9YdjAVZSsZ+6K7LltNcY2UDCYbiGtFJiMLc7WiKBnpEJaC0T/9Uy7rUDzMP3M6/as/E497SI8n0xclb9+v3l+xwdOOSo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(13003099007)(18002099003)(38350700014)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f0TqradBEZv4D4nz3HyggJ/FHV/uirydNj2ywLfFV3iFu/mbQAr1k+drvsjw?=
 =?us-ascii?Q?KFD6z8IwFiLvHTuVurMG7ZzLMTGa4KuwuDve49HIjoZqRUdcd4lVhGGIZ6HU?=
 =?us-ascii?Q?UQ8H7hAEProfJ9UxvnR1Fwkx5TY6qyVigWBI8DCci2OL1kkQ+6KDDzUNixqP?=
 =?us-ascii?Q?mStgk+hnN3ZtagMWz3VRRq3DpWUron6cgLXTsbmpmcXd5sqiMaGr0IAxewXz?=
 =?us-ascii?Q?uCNET2ANACb1kNFFSNecVoAzd010N+8Zz+uDH7ozZJ3Lg+yfnPsXlYd822fm?=
 =?us-ascii?Q?fU0DLlY37ZCJWtFw55POnv/QHFaJvvyRfyQUmcWenlyNV7/VPudGdF9zMQG9?=
 =?us-ascii?Q?hHoRdKk8uai7+QCHwRDLV+6h8EOi7KXaCt0le+ostx0i9Sf5yAGlu6X1Q+V+?=
 =?us-ascii?Q?QR2GBQYUBZZyKEd0bubYTvVPkN/1IInbjKqPmCEblputb1EpFNPULoz01Dk9?=
 =?us-ascii?Q?+u4010P+zoyz2I9pc25Ox3uwgYZC53fiMZXPhO5f8SdnYZE/TzdjKe8J0Xn+?=
 =?us-ascii?Q?7FKUBUtR122tYu3/wbKBOEFBDwr5Kbi3zb3l8BNYA8XV5L/Lz9ERVLRPR6xE?=
 =?us-ascii?Q?Bb3J/TryM0rvR34wfW6/K1koc8CHyfhAozHoNK4+eEmkjSRG17+ATliAOCvH?=
 =?us-ascii?Q?VMmI6a1ozxqiLMEHEngSxSwKwRaGL68U8KiXH2XvZs7CQUNxoTGmVO/IGTvb?=
 =?us-ascii?Q?9NDhbHxeR6rZvYPDjgcplCaCuXMW0JFInPkqzOZAqgnirwek4or4oGGw8AfJ?=
 =?us-ascii?Q?wLZzEqWm6PsgdA/10XaEwGIMQqGkEivo6+wG94B7g5hb/LqVhnkMfXfQykbY?=
 =?us-ascii?Q?Od9T1KYJdFG/pEovORniOKFhtwoTX2OpNirzbBTndjdpYADDfPb2uOihHJfl?=
 =?us-ascii?Q?W9gN2PyQK4RJNYw+5NbRyWGB3xGL0qBq8hR9kTIhPxCIfMSnRL2R9z0JXU0Y?=
 =?us-ascii?Q?jO6wd89MfQRbbeMkzlrk5548butM6JDHcH3SVqAu3Zl5oIt+Bho3HTtyEKV1?=
 =?us-ascii?Q?F7YEQLVGkSN9Swfd/SHnFDNS43CjnUqQEr0J7m2RLomXLomui/oIMeqCulej?=
 =?us-ascii?Q?baOWoAt0JLUjQZiuOqqBL2OMR82W8mcsPXE7aro/uUcPHHMqZ+gR0eurFNHR?=
 =?us-ascii?Q?JMM85FTiACRLbJZkNfHA52aJ7Y9fFfuDhFXVDZFVDlFi5NLGcPikvKsyUsr0?=
 =?us-ascii?Q?sNXsnDCViWy9XroxmpZ4PWIvBnrfmwOjtlq04orQ9/qDm6wncouFoTNpm6no?=
 =?us-ascii?Q?ezuFY0nw0dZ34zn2lv3AOMELoIMRDQmAVsRiqTdYnGL3NL4Z0R9/XLaxMZH8?=
 =?us-ascii?Q?+Bqf1060cweozKfvskVHgfcbfXwsvTeq3ncSkKZuZ/cctFlXBbnLIzGOy6M7?=
 =?us-ascii?Q?pGspYPNGlYSxzjZUqeulHlM/z8nTyljDn7T/JcKDFMCHDpcArOpQ/Go76+Pw?=
 =?us-ascii?Q?UgT7SrwdCTHGgHR2+WZykLKtj/uBFGnKOy4VrklhnbauZGbxpL4KDEU5nF8x?=
 =?us-ascii?Q?yCmHxZhUtAb96jYudvuj9DynWyKxUr5SvRecI8eA6+L6gq3HjzFZYKNGv4Hv?=
 =?us-ascii?Q?mBJsJWU9AIj16FaDW1RT9MBcqCuWDufyGNqOeZGU5maR4McqtGbcoYOYIb+H?=
 =?us-ascii?Q?+0PA1dMNIy8aRQS8hpIVWMb/XKesIgAdS7f10xjgKjvt6+UtecOT6QJ7ZMPn?=
 =?us-ascii?Q?Y7koza/6K/lAvurie9fyXWrbtRMil2VMuyStRnpSiA5mjUso5fYLceYqecla?=
 =?us-ascii?Q?0ly2xrnxgA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	AvLW1dlSShfTgMTN9GptCsN2uGGNEoM4QjBUlerb+MEvNM+bp1sJkgAL5FjOZkpVNc30QWhQyibi/NXCED3f64y2v+m+O4hAjbfV24Yuc4tm1fLZLcngU/n+Ve2wa5SzCEbEuJmrezcWjws67cHFTsSP7I0Hw5iLcFLTbIFXo5X0vrMTgV1FclTXzCrHUB5h2ArAdi+5AErcdBwk0udnCLTRrhExtw5hbT04pSGPYHdLb5qI5eNnU9lDrS2Bczfge5wHVmMEHWBg6MPEJe7rra2N8BPK3wNLStvWfmuJKHpGsNUcC6Y87C/svwI0e624HHwrQDCy5ZsA+cF204ib2Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iT3zuws22bL+bKl2RuA0TgAM8ClQKpZh0T9YwTQ6aaS/jKLmQwd0E4PjNGC2f+4VPvV7ezIuEiXjm6cCXcGAGhMm1Nql/xm1ILOiukgElz1gGAn5PW6+RLAk23wLSwRie9q0h7D+idfYWAKaTbUuTe8tvT7/SxOhKCOSHAO2oBi+pbOL8JfsFQ/D0Op0t1mBgDGuiCZCyIqOB9v+OFuMDoQgzKV5Q1ELURb/zjrRU66Ji8MRcinTUj1dFS1pW4vmQsQJnE6hzEnyqezpXgan+I9+kC4+PkEAw5o6ga3NzVDlPlKDTqLMRkfxcRl6095lBl6cqruxAKT+1zAbqJWGofVR8iiIjkifc1cjKwyjfXrC100B3MgvNaKNd3jWqT/jwVQnWcG025DUDPLjp3uIC/Lyqi7qpGGEtuCCcGtVyYOyuw22SrnBV+x/Dj00xFnDBao7MBlHDJQDDeJb4KxIrYRu5nBzCTQT3WGya5SCfskWYp+DXsjX4xRVcblz+/OG3LGWa71I1vOB27UHhuXZpaZYAZgFehD0qG/Wy/+U4HpXORL3ADeYL2/jWOvWSHErjBAYOi8gSD8s8/eaRMX9Qxt5kAHZ5tJYZMWcQ8LHXuvkTCGZv1mY9H+bPo3x+5N9
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a812c6-29dc-4026-bb74-08ded108a989
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 09:20:26.8822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2wFn+iKJdZYDE8cnY3PxS1RkF6pYJ7N72C9oQ4roB/P3h2WcEYvcc9E6bTxJma0ZkSUtqJ8cjKuKcgE1RNxqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1862
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate37-hz1 with 4gl00X3KDxz2Yl4s
X-cloud-security-connect: mail-westeuropeazon11023106.outbound.protection.outlook.com[52.101.72.106], TLS=1, IP=52.101.72.106
X-cloud-security-Digest: 88e2ae73b789a94502c392f56ed87ba2
X-cloud-security: scantime:2.975
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 09:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127696

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentioned in [2].

[1] https://github.com/nginx/nginx/commit/60c4243eb8775d51662a01def8a7dad5d9fb34a7

[2] https://security-tracker.debian.org/tracker/CVE-2026-48142

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-48142.patch   | 43 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-48142.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-48142.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-48142.patch
new file mode 100644
index 0000000000..f3c5ec4f7a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-48142.patch
@@ -0,0 +1,43 @@
+From f0a5aa7beb3d210753dfb104dcfd873bf1af35f0 Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Mon, 1 Jun 2026 21:46:48 +0400
+Subject: [PATCH] Charset: fixed another rare buffer overread in
+ recode_from_utf8()
+
+With prerequisites similar to 696a7f1b9, it was possible to gain 1-byte
+overread on invalid UTF-8 sequences.  The reason is ngx_utf8_decode()
+stops advancing the pointer position on the first encountered invalid
+byte.  The fix is to adjust the advanced pointer up to the whole saved
+sequence in this case.  Note that this may result in different output
+compared to complete invalid UTF-8 sequences, which we can disregard
+at this point.
+
+Reported by Han Yan of Xiaomi and p4p3r of CYBERONE.
+
+(cherry picked from commit 60c4243eb8775d51662a01def8a7dad5d9fb34a7)
+
+CVE: CVE-2026-48142
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/60c4243eb8775d51662a01def8a7dad5d9fb34a7]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/http/modules/ngx_http_charset_filter_module.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_charset_filter_module.c b/src/http/modules/ngx_http_charset_filter_module.c
+index 7a518e3..ed80b5e 100644
+--- a/src/http/modules/ngx_http_charset_filter_module.c
++++ b/src/http/modules/ngx_http_charset_filter_module.c
+@@ -855,6 +855,10 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+         ngx_log_debug0(NGX_LOG_DEBUG_HTTP, pool->log, 0,
+                        "http charset invalid utf 1");
+ 
++        if (saved < &ctx->saved[ctx->saved_len]) {
++            saved = &ctx->saved[ctx->saved_len];
++        }
++
+     } else {
+         dst = ngx_sprintf(dst, "&#%uD;", n);
+     }
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index dee6c6618e..8498ce766e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -15,6 +15,7 @@ SRC_URI:append = " \
                   file://CVE-2026-42946-01.patch \
                   file://CVE-2026-42946-02.patch \
                   file://CVE-2026-9256.patch \
+                  file://CVE-2026-48142.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.43.0


