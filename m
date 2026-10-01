Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE66CA5FCC
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9562.1790856317102550122
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lRiWAC1D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6918Ecew955562
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 05:05:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=EMAHVE8QdJYklYiuL4j50HpLKgSd67YFblaS8zqszFk=; b=
	lRiWAC1DelSyNhPNyAQTauh4gVOEdRHMcin0NcHERtfQJ8sUgdrDczeS4/nKHEzm
	M8p+wz+THiMHXHweX1GpVZqXFazNhbS1XltwRGCZ5FyG5unERr5lHsHyHNrbHU8t
	UWFbUN+8oPq0TFHA8G8876cAz0eyjdChcNkXVJtr+izlJD5XHSgzte+CuUq6Pw8o
	RspZQa6uykLzr3rxqFaC0i9QeICzCuQVgTu0G7BPzGggzTR2x0u1lkw2hvDz1B4/
	dyWu0qG1+oXnJpRNgLMiBUZyvvyU1vt8j68DZgKW75MGTr8Bj359XXW9OEUlJxkZ
	o9f/b0KHxf8tvtSmEQIPWQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021080.outbound.protection.outlook.com [52.101.62.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1ku8gaqw-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 05:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEDpMwU9BrDs/1y7yjO7xrpooG1i+4KafPYGWHhJPbrciESgCFtVN0TqXlZB6riOvNhD452fpIOehnYmHHpXIAUYjNeVsCoot4w00/bv0llhFAsJAfrcxccmNWRDlW8JDsHLEDSqdMpHDtfd0Rcx8QNPS3xg9j0TpxX9qG7eEHUtpFMGiDPh6SLdDAFPuh2HDIT+XrO39a83kxMtoqeuGgd+B2LMaxVcDOxoi/aB3/J9qIzxy9vrvHP5jkdNtjMl+ucfHmzJY0QFCL7Qc54fFCEQNBebRLNPAdUGWYFkjicjt6B2uKkttVktcdY55+CvxkT75RwuZuPauhypuVzy9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMAHVE8QdJYklYiuL4j50HpLKgSd67YFblaS8zqszFk=;
 b=CwOTTRKer/x/0R16EV88HAK3P+A8ADYFpPpMK2ENjqfv9jHNSXuSSn8qoamtP9oAosbWTOTzvb1O74WwFpXBRx6mCH3Is/u5EESPrIbtAUyN7hNLr1YXy8dy/pUSKJpS/zp7dYQ4JHIvVPUUXSEK57l74XIgwnokefhayHAihx0mjs4UZa9iI3sUpVnd+6oLbEHWyle6TSFxG7aGmYh+BEWM3vwVWGolfOqIB4xTZ0UIsWQEN8XoAuNcIXBPvWGJbE2H+jI7psBjU6Jig4kEbKYmbM6cvlq/+R7+sE0wu7RwcHNfdnyxY79gCLf+V7Ir3eIgLB4AZU474i1Y28aOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:04:54 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:04:54 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 06/11] strongswan: fix CVE-2026-78130
Date: Thu,  1 Oct 2026 17:34:12 +0530
Message-Id: <20261001120417.1280843-7-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: bc961cd7-5a7c-45e7-f824-08df1fb43490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|3023799007|12006099003|6133799003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	6U0ladHBtCNyoOJEBDvDvFNrCB8j/sYR9fHCv5qx3fKmPfwqolYywzwqk8LXDioRcEv0tstvdsdRa0r5/ieQf8sMEy0Qp5B/T7oEGUXAZLSdagaDL1Cl/rzkWH5EF9r9wV6DucelU/P3rf1u2ZYZ5JYJfDjFv+JA1uhIK+WCacS2COS1TJseKE7exBHt/DjLvtXOzv4mipeJCLQBkWr/VwIxKlvoZxg6ypi+v45KRB7g+hdXLYUExbYg/3YpEy9flKtA9Zn6aNQ+vCtkpBo4lW8wnSc2YvLtILIjBn9vMxGQoXYOGAyGvz/y8RTHCxC3GMHaj3GqA/+V6+j4KedhG7g+K7krxnt562IvscWZOghkzhyStztBdi4eAODalfeJQ9YeUk1+eAaxgXXcr8g1pxo42HmYj4r6k+O95CuMQCWGSb519WNCiaH6qKfRF8lRNV3ivX6Clioa6LOZE9NY59I1lN0gAcmJ9qVjF/ZNtwEOrqJFGQpDXDhJhW/C5pjdW5IhO6FBFeykqZFXTSDsNw9HSYxvcGQdIaABPA90vLHa+aLZ+TP67MPQpeYF5ftYyCqhRypTEF8CC4m0tEOWXC18/proEqhBSSPgSNAL5nb4XAiqVOQiCm4Br6y0+TP4n0uGYYTtcSMx/3Qec43+K/Pw0Y5LUvP7TCnXZgssNhw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(3023799007)(12006099003)(6133799003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gK13Q5nwJp7ppgL9UUuF1V3cOvccnPOtxkkQU28sinEWx0FyGsEXy6LfJp84?=
 =?us-ascii?Q?HUDvb/ni6r5+tAS9NEAXIeKmtxgbVAgIt2cEXvChYpKL2fBH1OCmyAhjCrCE?=
 =?us-ascii?Q?jQFs+deH8qQpXQ/YMbm4W5zl7wuWeej3tkjafAJD1f9LekYuKwYEobXSKTIt?=
 =?us-ascii?Q?AltLUI6AOtRQ0yOMQrXJaBMkeExS/sPtee5G5X/B5SCpay0hEUnIgTXx+yCE?=
 =?us-ascii?Q?+Hu3po6A4q4bA/w7lA13BByIAtgCeRgrINmGAHWUIyQZTGObykVHOg+aZgTd?=
 =?us-ascii?Q?MptY4AAJkDggCGrNZ+3tqTbw/n5m+SRp6XpYk+XSng2hBeMaQDFFtBxpaJgv?=
 =?us-ascii?Q?B9cEtGeZR1C9L8m3ajen71sgFiQ2mkAFL4Wuc3Cgx0t3TB5iVFGvR450w84y?=
 =?us-ascii?Q?YgunQwi2a799m+kseJN9c+SczvnVclWJHLCDOHxIjI7hyBqC+ucCg6Wk+Kem?=
 =?us-ascii?Q?PT70Al1d67PB3cbyhzojXCH5U2+55baCqs5ZnydEUwcn1tRPZBoP+HVwqr0g?=
 =?us-ascii?Q?a7ARb540GIxw0Gz5+rjoJ1+9QKKU0ywjQKVTmh9J+hexuACsAu2XxaEm7rdb?=
 =?us-ascii?Q?tm0fwjSPnJR51dgLQOA4H9PsfFVz4Ydp1Qs3mNXeweJmzapR0SfjI1uK1EEc?=
 =?us-ascii?Q?U8VTmQgOyGMDonS7WgqlS+AIID+pgLx6wAH8MO7DA3UX2NSEy7s0QIzUIbvb?=
 =?us-ascii?Q?qYxIzl++1dPS2nebVTu/qi3dgrw3Zxd6f1FDvlNWxt5m2my0e4ViZ1xwGIbL?=
 =?us-ascii?Q?M+TKC4tItMREwwNevSZXhgu5o6YRqVsCBm/khTYpwGF+uHhP1so+jHulHfzg?=
 =?us-ascii?Q?Z1Bz8hliqUe5by9M0l204aLRlBy/KUv4uFSO9zf3VNzr+v7W2gOteg91Wpiv?=
 =?us-ascii?Q?rS1Uzj+9+RsKbQ/DwdcYVxchope17zFIDEByMKphEjVoJG4AjUbGgin6iwbH?=
 =?us-ascii?Q?b9BQR00Q53xsBW0ud6FWaaaEyDM1O2bl1eb5eDeC9LqjMNNJa0Uxpc4A9wiY?=
 =?us-ascii?Q?75w20xW2MD+2ULpTheWnQ/DmqtXgaYFQq7XF78QjLvz7pB7ppmamexMphDn0?=
 =?us-ascii?Q?TqzI9XwV0rcEgA65jBHLZzkqZuWYYCz3wulXdWsRvTW0OK+wK+4qkEG1I2A7?=
 =?us-ascii?Q?9jxsYQyPlrpA9Xw8Kw8Opk+bhg/+IQGSC6ZqMXlQmLc4wudeR0rbMP5WJRgF?=
 =?us-ascii?Q?3NwddfbWMmcIoSQIQoMucwsJ4neFm5IJxzR4FxRIycfNkgIOFabtSBsh5zIU?=
 =?us-ascii?Q?r3cRMUEfTGU6r2kb3OBmeD4FCi6TKCBLtKOOjwAAYkssxJJSvZrs5tru3tUD?=
 =?us-ascii?Q?3KkibxOYPUtdyR2ufIxhqyHzfg3WS7BkOwg/agT1aU8HwVnS562pQwpSo3T1?=
 =?us-ascii?Q?p3ifPh1Mll+0TLFXj0ikntCiJecc89v7ihUbIvKYDi6dS4Ki/a8dbapPz3xG?=
 =?us-ascii?Q?sYTSWXjYCojUj/Uix6EAFcMmF3TXbUhOH+EGaTa2v0al9AF5tuYIgibOzyLf?=
 =?us-ascii?Q?1Kqthr/zRYCZwpvsHNRTWNxAAhYUI9FYztmcN5ks1LWtAZFlyBayp4yqvLdX?=
 =?us-ascii?Q?jq/uOrwZRkARDiWeVrDmlOVUGaTi4YCHtaNldSsqIyi9h55eXcMDzz1LKdPP?=
 =?us-ascii?Q?F/s9RLEWTLVEi+JyRHkjZzilZR7P+BC5IRklBr3wRNkXjzGoytFiW/LviXXs?=
 =?us-ascii?Q?ksQPpnwwtAZisRV/qw+eNa7PteIxIZOm+uD8YbU5UUMB6AkgtlzCyBO4eL6z?=
 =?us-ascii?Q?eyPUtVeYEEMaOk2ipdD+N7xtnraCzqKzlXqLNVwL5dtFOd5ouoO4?=
X-Exchange-RoutingPolicyChecked: 
	XUeDY255hOTF6EpOb3rxIIaRqda2hsmGFJsqfrdjp+US8YeJfeTT3AN0M2W/5ZzuXYZvmwlYCJM8zeZ7x+ITb3XwnADEUBULDLKlIAsZOKnsfG7UtlzZVZ/GzvMlsFT6ut9tLk/blaI/7OaTplTPK990cH/B2hK+34oK1C7m08EwjvrtEW5VgyZhdLOloxsIH4WeM6YR/stZwkAUU53i60XbCRPNeGH905zX0YBl7EeRXHgF8FGrCpxOEAESNt69oOmNpTQfRykuJ6iClYHreKnVzRe2C01X8G8R9bQWiRO1/Yt713VIa5iFJ5UgiAJ1aO+uyYrawvUcbhzbXnxuMA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc961cd7-5a7c-45e7-f824-08df1fb43490
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:04:54.8212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1oWkUWjrPAWfkNINlH9qEOI4R+fh/g9/amLEpJB1eDE7mNSOATjC0xbMF7CBAhNPi2VAMHXUMA2x3lf8ivaTDUbDHcBMe83TeeoNdJi7+H/fhdvk51qg91/iptFDkbP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6abe4c7c cx=c_pps
 a=rDyEm/81vvKQCy/iKDMZrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=w4HlngbNAmabE5WA5hYA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX5iHGNMY8wLOI
 ZdbLlfqUy53hETtTv9xheEa8IITC11gSKUtv2JQONPXMgMXuXOnSLA/xNk1FQbs4mPr8Q1BIO/J
 jz2cfbx1ScA8aLudPslo7BpURC758S6I/ISYEn9pWW6Oe5qJk1RP
X-Proofpoint-ORIG-GUID: qGVrrNUdCRCe6Otv22W58zJ5rLC3F_LY
X-Proofpoint-GUID: qGVrrNUdCRCe6Otv22W58zJ5rLC3F_LY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX/L8PLNT+5s9U
 8N7nr1+rR+M4ttcvG3SzjtzocYqTrF3Recoz+YjLcylszDCTNwD676yYp9c6KGnh5ilTNQ0qJgH
 ehs3JpI/2uNPAo8F59FL2bevbvWZbLulTrb8Guf6D6iPr/GaoWUHnEAkcyLJH9XAAoAGpixEDVM
 zL9Cgstqvd0c4ZftD5yreX+xQjpR2UlCJWnLC4w47RcD15WiKrXyEjnIAmRH9tZYXphUAG1RDm6
 sSgP7xftgVu8BQ7hrI0ewdhYxFdY51Q1Bv+5LV/r42EFpkaSJD4j4srO9olWeHfGjATOq14ZKQl
 pFbdxjidkT92a0Wcuv/jpV2Mmy7HNCD2oBSxx6K0SXXTbuzSbbQwxM/qOcqT22Qknc5f1USxmUz
 UMGeMmukcdHhY4dRJXiv6SUH4jtFQZz7FUSbZhaQ8KeINktwqTgrvk2zH4EnoV5fJCE6TuwlUbu
 XNjE0WLyLtJxtP5JImA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130583

strongSwan (since 4.2.0, through 6.0.7) allows a denial of
service in the x509 plugin related to the verification of
X.509 attribute certificates.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78130]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78130).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78130]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78130/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78130.patch           | 51 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
new file mode 100644
index 0000000000..92768c2bb3
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
@@ -0,0 +1,51 @@
+From 4dae392b32a2c56441fd7ca50ad32a0874455995 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 19 Jun 2026 11:57:48 +0200
+Subject: [PATCH] x509: Avoid NULL-pointer dereference if issuerName is missing
+ in attribute certificate
+
+If neither authoritiyKeyIdentifier nor issuerName are encoded in an
+attribute certificate, the validation in `acert_validator.c:verify()`
+will cause a NULL-pointer dereference via `issued_by()` (the lookup
+with NULL identity will enumerate all trusted certificates).
+
+Fixes: 26930a8c3e42 ("certificate factory can load certs from file")
+Fixes: CVE-2026-78130
+CVE: CVE-2026-78130
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78130/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index 4fa9f6d0a3e0..4436bc4debef 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -897,7 +897,11 @@ METHOD(certificate_t, has_issuer, id_match_t,
+ 	{
+ 		return ID_MATCH_PERFECT;
+ 	}
+-	return this->issuerName->matches(this->issuerName, issuer);
++	if (this->issuerName)
++	{
++		return this->issuerName->matches(this->issuerName, issuer);
++	}
++	return ID_MATCH_NONE;
+ }
+ 
+ METHOD(certificate_t, issued_by, bool,
+@@ -934,7 +938,8 @@ METHOD(certificate_t, issued_by, bool,
+ 	}
+ 	else
+ 	{
+-		if (!this->issuerName->equals(this->issuerName,
++		if (!this->issuerName ||
++			!this->issuerName->equals(this->issuerName,
+ 									  issuer->get_subject(issuer)))
+ 		{
+ 			return FALSE;
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 06668fb19a..d0b015f741 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78126.patch \
            file://CVE-2026-78127.patch \
            file://CVE-2026-78129.patch \
+           file://CVE-2026-78130.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


