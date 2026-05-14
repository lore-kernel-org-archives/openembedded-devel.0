Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17068CD37AC
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 03:53:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2953.1778730780936408053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 20:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=atfpIvVH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9594f6a1b0=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E3aHPI3094460
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 20:53:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=GiW4FnwHHVQF96sSdDZC8gWybsCaennQG5NERTtuLHs=; b=atfpIvVHRXYW
	kv6QrlnTN5A+m4Dn39PNm9R7llW5FKnEb/GUZaIxZz6fIabtQt6NG2wwCW/RIkK3
	YITxOw4EPNs87iEFh7Mq6NYeFy9peSzso/j/M7P4paJyyBsGaLoNwQoPNzMFpx/p
	cpB5I0YLwP6aJDAMi7T2OtW0Fx7zc96+DTmdSRdJvwcUo6PnP9fZjf6MnXRdWsd7
	6VK//Z96woHF1qMGQZXk9ilTnxTaUOqh4Y11Wyu0ELs2NyJnUFiHSPoCKOeUQxUd
	5gN0lXtYqzV3jSDY5zQ9m/OWcTNHvfNAViD47l5PTG0hfuupp7YUOeXNbw3ecR7/
	gnIajyBkxw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g9q5s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 20:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eb3Q6tg8eLMn60whvtjCHdbkKuH4RHyetJa/35zCG2BzHZmTcsTJythQqrU4f19tp/Cd31WnIUsT2BkA4hc/BQwtD3bJtz5vTLCAEMnvqSzqh+vva9f136grN1CW0s2//iqIgGTHKZEjYU+t2T4ZnTqsPbsr/LxXB6aLRdIqN9pKFvXi2kyb9ozJqNjZ3dEC6ZrLrMERt2/f5nik9pcjd/Js63TlhVuyzfECdoPg6RTEFkrriMEr9OUf3GM00WOFnrlV265x+/gSdZ20uf3XieJvWMwthcNYTX7sApfAZbF71mdEHZGM+GDJTjresRDUIZ3s3/jbfcyqeeB75nS0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiW4FnwHHVQF96sSdDZC8gWybsCaennQG5NERTtuLHs=;
 b=U37Fw/4c5Vf6w7Pb8Zm+N34xZgm6f4RSUNA3zSntp7jT8pmrxKai72qG2S/POgJSZyH3aWu/q2+rWNyyDZ0+WKaT4IYxl1ugfz1/OSGPRsMmvLxaIC6oqfSbblYAOKYmZFlj/s+wDJ7wKBbNnRleJ6Y1gdvo6IklLbNpnmck8DJXY0HEoAwp/NHmp1+lm/oRZRs83yhtg0G7z9/9cQ2rCxzklXuW0mprzxZQOuwqAQLRBksOSmxJCegwNEh5Bh/2IpPnYmMXJnxmaKg4btytQwJg/yZBJYB0ih9BNg71cr3gjOXAMgUA/2vY73j1BH2XC+99ZTfC/KbKQjektuiSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB7850.namprd11.prod.outlook.com (2603:10b6:8:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 03:52:56 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 03:52:56 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] postfix: upgrade 3.10.9 -> 3.11.2
Date: Thu, 14 May 2026 11:51:19 +0800
Message-Id: <20260514035119.3939262-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMKF1sr-mFccrpOTJ3yVitujsrkCCJyS+SFdPyki8Wo0vk+TCA@mail.gmail.com>
References: <CAMKF1sr-mFccrpOTJ3yVitujsrkCCJyS+SFdPyki8Wo0vk+TCA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0026.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::10) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 248a11f1-830d-47d3-9358-08deb16c4838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18002099003|22082099003|38350700014|3023799003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	LdQkOuxsDifi8hLRuTIakGBPnTEEu2E9eGL+/VDuzW0utfM0Y+Lxh4HpI4Q4jURIpFZ1vtqGMHXjcKiTRQCNt0NkKHgNoxfk6NDz8RVQwkLGLg09jaTGv4oE0fYIV+ysiYWjxXGo4BzFn6gX669YguXCLHakrZFSwqwuTPFGfM5K/Qo85Br9BHL7Oyo4+XwJmogIrpoNKYPC/ICE4NOdg7wrR/lSlrMxk3SwrkXZoMuhjCojpGa7RipJ7skqMHKTdkPJ9QJEE0lEmTRUaoh8JYj9iPK8aDGyAKi9vrMYDUeybOyEAbDLl071mvbehoSsFs/pkQsZa1cUyIviXOSXXpDzRyVWoZTqbvpw1FtwqW9pMNHa++B0qY0+9Fv/JbVd03Om8F+pke+A0MTETwyHnIv1o8ksiCjC4xhCzcaIUxUghii8m8tf5450/bInZ581Ux5UctZYduC9n6Q1uCpNGfOvm/EdrGI9QsViPsii9etNjxcUKEMNZbmxmpehs56Rtv1Cswm1XXvCOap87+4U1pl61bWsOERtPxKvZbmJvBfg+7zdghcIyzT5bZRLOj4XqdZ1eB1d2yToa768yiVNU1J1ktnHB6yhxkLPiTiW3DqBMs3Zmx9vfPmOMkoRIpicidK8fsHkOMeVcMLiQfwX/8vT7A9+C+17r18RiRJjGWmxEgI97uQWJVKzCYvDx2V4uC6FwHt/Ed/ycN5XMnl7Hg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18002099003)(22082099003)(38350700014)(3023799003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dvxESmJAVklfUCeS4Rxoj6wzP8MOU0TcH64UMMz5QWyoMEg8WyHKuIuJhb6a?=
 =?us-ascii?Q?qc0IjMdTPWHpWpDF56jgQkU4MRhBgkd8cyZN1OyaTwGvgjMA/NKC6sFcEvf5?=
 =?us-ascii?Q?sR+qcYloj1cL9egO+xpkI3z8RQfckJ7Hz38jYngKtcrK/Yy2p0Xsc4BaKKw+?=
 =?us-ascii?Q?tgRWGqlzA0/q65d20sBxwP76RXKGpVH+A2lHlUOVd10YOUok0z/ApzSlJRfv?=
 =?us-ascii?Q?LQ8u0I2P4otPmEp7cfL/o+/g2jTuuTAw7CqyHusE71QGw2fuPj5eqg3rRI/4?=
 =?us-ascii?Q?Y5mxGKK4zLF8A3H/xekj8WDWuRDgTiyd4GELYfh0eGdFkduolO4xQelHRX1/?=
 =?us-ascii?Q?ZvbB/F4UmdkAev9vJhhCGQ9Svno8muF1rta18tP+FUlyKiYj/yA7W/jE1Iaf?=
 =?us-ascii?Q?n0iklYc4GFrE+DXCzmMbI7dFClVZ0PX+wWw/rKhvjdbnO9VG8OPu5XiOclJ1?=
 =?us-ascii?Q?VNgQgLekAvuRsm95xd4noqWkwtghidYSYMFyQ1Q+cAl9W7OnndHdFra+9IcR?=
 =?us-ascii?Q?z98ERyqdRyrEpRi2Rs5U0KvBefhT/OwbDlOsyh8eB1vXOb2wQ6fuPHbxt2hp?=
 =?us-ascii?Q?bA0vXrVPC7VMCbYxHWermxniUJePSsdNQHb0Q0bv3/6cY9Om722iEjtUaaNM?=
 =?us-ascii?Q?XjA3Y6hamtYFb0avoKoB2KEW51Iq154dOeFFdcjeFQlDw2xq++agwrOcqM84?=
 =?us-ascii?Q?tq41axSlLsRnq5NkiQo/2nPa0SkzCDYFLgLfZX8D8140rCbqcmBeRFqEi6Ej?=
 =?us-ascii?Q?FOoOuviWZlkBtZs1vDZO0dMD3WDmZT6IGF4N66ySU7qg8nw/MfYrUIytdYCx?=
 =?us-ascii?Q?7XViid0oYon5GPBNEC0b+QrLiD/w7Wb4IDCoxTdIKBGqDHdBJtIUwUI8Sohl?=
 =?us-ascii?Q?BF/E+YXq2VF8UWQ0mQT3lgSRB2bujfvfsddk5ZDD8GpHOdac+YZuoiUHLkvR?=
 =?us-ascii?Q?1Yzm+13utZ5xGbzj3A02HvgSqN0kbJp7YjXnzVNjx2Zf+vsA9I8lkSBF21/E?=
 =?us-ascii?Q?4QVBVHAE1keuMTmsq6IZTk7qXOVeyrTccY7TDIs5JO3Ab8hCcjc3ZVN8vgyr?=
 =?us-ascii?Q?LsPft2btAleynyh7km5AwS2wOA0tRm/r3vYw/Gqdj6gbr2qg/ScoOeZadgOT?=
 =?us-ascii?Q?4bF3mKWwQyYnixdyfWOcb7tyt80bF2bSsMkkbncfdHOOzzi9xNBYTtQCdOY/?=
 =?us-ascii?Q?bHRmLGctqSZ31e6C4nxbdVWHVlOiGxbGt1tQ/g60GeNrhEb3Osxe+KoUHFwf?=
 =?us-ascii?Q?uJ8SOFec8p2lKA2Z8A9LzS+aj4NSyIXitHndTpBgAIsZdajT0pEL9iLaaXJQ?=
 =?us-ascii?Q?lw2ujWIhDdL6mV7GrRSxP48Ugdu9MA/rYa0YHzW1z4ol7RL9f7rzRGHabxrp?=
 =?us-ascii?Q?1kiCo3kZkltF1b9PEjBw6dSWqkNXPfU87kHvohCgNVsPnepOcJbEfVVr7lhN?=
 =?us-ascii?Q?GZEWQUSaRye+/N7RdoRD1VzWJmmfp1NmUtZd7ZlFGmJkTHLkDWvVSvQSguBV?=
 =?us-ascii?Q?78CXtx7DpvckYX3azEsFKBa/82V8bBH6Rh3wE+9u8QkfB7MZk1m4zI9ac1B+?=
 =?us-ascii?Q?x9obiM0H+GDvYirVkTwAnL53g5LQ8JCXWCCBxzskKVqo4NKaHC26+mUlHRHK?=
 =?us-ascii?Q?EHVUHvCayD4Gn6LRwc3IwVc5L6XJ6jQhK+Wrw091wulII+atcOp+RYOfXp0d?=
 =?us-ascii?Q?9Hs+K+/lZmjtQNT/c8bcDoBg8JEeyS+DyQVcDoCcdRM1y68VZbL40YcwuCTo?=
 =?us-ascii?Q?a+1i6HUjdTAJdXwbYJJhNTENdV2C/Xo=3D?=
X-Exchange-RoutingPolicyChecked: 
	gAXnRzvDgpdYICMHrozVjKhXGdA6wjufaPAy/3Esp58W5V5xlNqj9FDL9xomHAUV/sTYqG677hJZcwUCo9mftLqQ5gwcdMyu18DByWEGtzg84+oVypyqwYT+hPHSUYa6EqitMX3SFwcm+UYE4uC8agZYp9EwMP5UOS/Gt2dZ26L1fQmb/UsjW4h+4TuS2Z92XRCJ2r/hmohcNXEjcwvkPjO475I6IiQHY+3vZ6y6w0ouPRfSlVMg1HkrJhMci0qNDHJS2ymxTl5+NEAd7So2/OMjrXq+2k1nDD32fCDFB/+JGaRGu+w9DB91qvKIwuI28cd50IzfjnGs9P89cUCMmQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248a11f1-830d-47d3-9358-08deb16c4838
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 03:52:56.2357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbn6secqKfvt8rm8eddN77ebvwUTxY4j14SELIx8DueIaBb1JElYmLqHh7racReOIbFZ3qPX0tn8xaejspOL71IoGn1Q3KCR089fLMwOihc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7850
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNSBTYWx0ZWRfX5Jco4hnLTtVc
 tSvRULrXBTPYqcSGEFJIpBah/q7U1Tt6MgCHIdbURGyY3dbLtzWgDhJ7qXkUxzPHrs1i0Fya4wo
 jeZPWrj75Ni4opxNJECRzo4zQh2gZGzyeoHP8jXD7ErqcLOZPdCEKV3q/8NZRehJ0/O+kqknK2q
 n+wiSDtX4ucIErMY7wZ9mM/JScFReu80tiBcxqd8z9AhL14F7e7bEkH0EfJtQ4aFKkkTjrsUqIM
 v6BcW0yzgEraca0JXTo0gUW+l/Gwl9pNBX88474VH5aaqLqIUriTMiwhl1iVH8nuChO6qEGc8wh
 ZHWVznCPfPKWL4TjgwLWo25CCR46zajcS4SKfS/6SfgY9sTDyh68sbmrTAOcF0Yb8HNwheJPgMj
 A/A2NCR8avOh22if3JKqre21CfyCCPipdU68+9QDFvlCxx/RIt0Ohsjs4c+ARkDiuaInYPZXYu8
 6lm5BQVw8/XiyBsR0/A==
X-Proofpoint-ORIG-GUID: TX-UEtFr7lRTJInt7XYOv9ZTQuaZzkVM
X-Proofpoint-GUID: TX-UEtFr7lRTJInt7XYOv9ZTQuaZzkVM
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a05471c cx=c_pps
 a=jAY+Yiv4fe/m5iF0AiXt4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VJYubktbAAAA:8
 a=gmDo1nssAAAA:8 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8
 a=pGLkceISAAAA:8 a=j6XmuH0Gu1IliE9Xzg0A:9 a=OqWDEjY5HwswFcA5adJo:22
 a=DmCNEmdWNTAeIjfGWauO:22 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 03:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126984

* Refresh patch to mute patch-fuzz
* Remove 0001-makedefs-Account-for-linux-7.x-version.patch
* This upgrade include the following commit, which make postfix can
  compile on latest stable ubuntu 26.04, which have Linux 7.x kernel

  Postfix works on Linux 7.x kernels. Frank Scheiner. Files:
        makedefs, util/sys_defs.h.

Changes:
https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../postfix/files/0001-Fix-makedefs.patch     | 25 ++++++++-----------
 ...tconf-to-a-variable-for-cross-compil.patch |  9 +++----
 ...tive-compiler-to-build-makedefs.test.patch | 17 ++++++-------
 .../postfix/files/0004-Fix-icu-config.patch   |  9 +++----
 ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 +++-----
 .../{postfix_3.10.9.bb => postfix_3.11.2.bb}  |  3 +--
 6 files changed, 29 insertions(+), 45 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.9.bb => postfix_3.11.2.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index 785fe87452..4e187849dc 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -1,4 +1,4 @@
-From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
+From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 16:45:54 +0900
 Subject: [PATCH] Fix makedefs
@@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  1 file changed, 11 insertions(+), 16 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index a740e41..28fb128 100644
+index d5103ce..9713327 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -230,9 +230,6 @@ echo "# pie=$pie"
+@@ -232,9 +232,6 @@ echo "# pie=$pie"
  
  # Defaults for most sane systems
  
@@ -32,7 +32,7 @@ index a740e41..28fb128 100644
  ARFL=rv
  
  # Ugly function to make our error message more visible among the
-@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -48,8 +48,8 @@ index a740e41..28fb128 100644
  		    else
  			# No, we're not going to try db1 db2 db3 etc.
  			# On a properly installed system, Postfix builds
-@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
- 			echo "Install the appropriate db*-devel package first." 1>&2
+@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
+ 			echo "Alternatively, build with CCARGS=\"-NO_DB ...\"" 1>&2
  			exit 1
  		    fi
 -		    SYSLIBS="-ldb"
@@ -63,7 +63,7 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
-@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
  		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
  		       then
  			   :
@@ -72,7 +72,7 @@ index a740e41..28fb128 100644
  		       then
  			   echo CCARGS="$CCARGS -DNO_EPOLL"
  		       else
-@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
+@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
  }
  EOF
  			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
@@ -81,7 +81,7 @@ index a740e41..28fb128 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -644,12 +639,12 @@ EOF
+@@ -690,12 +685,12 @@ EOF
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -97,8 +97,8 @@ index a740e41..28fb128 100644
  		    else
  			# On a properly installed system, Postfix builds
  			# by including <db.h> and by linking with -ldb
-@@ -657,12 +652,12 @@ EOF
- 			echo "Install the appropriate db*-devel package first." 1>&2
+@@ -705,12 +700,12 @@ EOF
+ 			echo "See: https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf" 1>&2
  			exit 1
  		    fi
 -		    SYSLIBS="-ldb"
@@ -112,6 +112,3 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
index d46efb95cb..a74c46fa92 100644
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
@@ -1,4 +1,4 @@
-From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
+From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 17:14:58 +0900
 Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
@@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  2 files changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index a37f89f..17cb64b 100644
+index 8d7501a..d2a85e8 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -22,7 +22,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
+@@ -23,7 +23,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
  EXPAND	= sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
  	    -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
  SHLIB_DIR_OVERRIDE = \
@@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
      "daemon_directory = $daemon_directory" \
      "data_directory = $data_directory" \
      "command_directory = $command_directory" \
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
index 6f8e3e84da..201b4741de 100644
--- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
@@ -1,4 +1,4 @@
-From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
+From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 26 Aug 2017 10:29:37 -0700
 Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 28fb128..313b401 100644
+index 9713327..e879832 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
+@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -25,7 +25,7 @@ index 28fb128..313b401 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
+@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -34,7 +34,7 @@ index 28fb128..313b401 100644
  		   ./makedefs.test 2>/dev/null ||
  			CCARGS="$CCARGS -DNO_SIGSETJMP"
  		   rm -f makedefs.test makedefs.test.[co]
-@@ -903,7 +903,7 @@ int main(int argc, char **argv)
+@@ -952,7 +952,7 @@ int main(int argc, char **argv)
  				  &error) != 14);
  }
  EOF
@@ -43,7 +43,7 @@ index 28fb128..313b401 100644
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
  			CCARGS="$CCARGS $icu_cppflags"
-@@ -1024,7 +1024,7 @@ int     main(void)
+@@ -1088,7 +1088,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -52,7 +52,7 @@ index 28fb128..313b401 100644
      ./makedefs.test || exit 1
      rm -f makedefs.test makedefs.test.[co]
  }
-@@ -1180,7 +1180,7 @@ int     main(void)
+@@ -1245,7 +1245,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -61,6 +61,3 @@ index 28fb128..313b401 100644
  	parm_val=`./makedefs.test` || exit 1
  	rm -f makedefs.test makedefs.test.[co]
  	eval ${parm_name}=\""\$parm_val"\"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
index 0660ee098e..daf5c7089e 100644
--- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
@@ -1,4 +1,4 @@
-From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
+From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Jan 2022 11:21:54 +0800
 Subject: [PATCH] Fix icu config
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/makedefs b/makedefs
-index 313b401..e5db212 100644
+index e879832..f9c132e 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -906,7 +906,6 @@ EOF
+@@ -955,7 +955,6 @@ EOF
  		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
@@ -29,6 +29,3 @@ index 313b401..e5db212 100644
  			SYSLIBS="$SYSLIBS $icu_ldflags"
  		    else
  			CCARGS="$CCARGS -DNO_EAI"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
index 1571aa844d..c2e640d6ff 100644
--- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
@@ -1,4 +1,4 @@
-From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
+From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Fri, 12 Oct 2018 12:38:02 +0800
 Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
@@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 20 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index e5db212..b00049b 100644
+index f9c132e..5ebef5b 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -35,7 +35,7 @@ index e5db212..b00049b 100644
  		# Kernel 2.4 added IPv6
  		case "$RELEASE" in
  		2.[0-3].*) CCARGS="$CCARGS -DNO_IPV6";;
-@@ -655,16 +646,7 @@ EOF
+@@ -703,16 +694,7 @@ EOF
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -53,6 +53,3 @@ index e5db212..b00049b 100644
  		SYSLIBS="$SYSLIBS -ldl"
  		: ${SHLIB_SUFFIX=.so}
  		: ${SHLIB_CFLAGS=-fPIC}
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
index 633e4a7a0d..894e58261b 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
@@ -26,11 +26,10 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-           file://0001-makedefs-Account-for-linux-7.x-version.patch \
            file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001ea054f7f2a601c759801bc13"
+SRC_URI[sha256sum] = "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3aa4207778"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


