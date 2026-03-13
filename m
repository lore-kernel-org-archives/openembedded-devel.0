Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22903105F7A2
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 12:11:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14341.1773403882289911176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 05:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XLf9mDho;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75329b8642=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBKhpv3134841
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=U5jslPDchFU7bmXuVRJAPF9Hxdas0LM420dcLs3StJ4=; b=XLf9mDhoSZ1c
	uFtBEzrMookMYT4JG3xvIu0Pne/XlWKTcmtSh6EjJUzbL+0QrzCF2NXGqccN6g+e
	Cg6G5WCM9DDCNvk6ZrcQdW+BXulqNSPk5ItQEMDR2XsWtJ5LKmrPNQF/9UxHYACa
	1EziXRrwcJX1Ztt3BH4Bba0w/5vHwVx2nBoZQn8AHsxCBmRz46D4LXHl6IkI+EEF
	npvKTGgQD8CCGhy8h58u92fbOhNjtHOLG2Ds7bW6qrV3iFFtG/6CWGUMU5akjROm
	LvBTwCdZ+P2CIdDMVbMDFFuDE87hj4fS5A+ow0vRyRMApPP3PvJgJxuwTliaUyry
	Mau7CDLpfA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqshvs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ub0Npe187647jzpiH5jMsvW/4tdNMMfcv49fBpxVCCgblnyxjMLiBi81ssAv1+xVU9PvjYMdlTd2ZNiVdIS2GSMj62oGUPVHdUW0qNoSl33cJaT7m0v7MU60QxRlpRMo+wDiCZuv2L8wZdEpnC0XMpVzHb1lGVab1ZIqhdvgorNE9W50ErCMxEhmzmlWqLr2KVBBgH7cpbqLSgsrPAFv7aufD5S/mHMbZPk6Wq2BS3QsF3ZlaoGrkxtxpbLIPpWPiGklx55pf/bFgzhtazZNfU3DycCqwJsmBaMfmLycoLQCZ2jUxaWqvbti986wRofk3C72OnjwW1WtWvYFoRq4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5jslPDchFU7bmXuVRJAPF9Hxdas0LM420dcLs3StJ4=;
 b=GtU/2SiWkulVY4BxYsHA5BfvZuazxX0yaal0MlOx7IrGozxaV4P+Rp28I3Mh5gH7w7coqoxJOwU/DXAPVk/mANWHcmChDrTn2fCRfodavsCrysSvJe4Ki283ryLtBWhJIzxCiNKT/rMDMRMB48F73tTHFRt+hcooV/bo9X/xOzQIyl+MjejzDr90CKW8cBA2rvTYZy3zFTBf2oNSCgnGiSlIo9ReJ+PC55f3i80IVQuD9I1nJ80smXoJ7R4VE/w1AmJHzjPPTD/g8bUVoVC+rWzWDmf+IARSzq6dGlznUYIIF24i87SJiPhLHaOZ5c+z/aGrzVcMmNCmg5hgMCe9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.8; Fri, 13 Mar 2026 12:11:18 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 12:11:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/5] fltk: upgrade 1.3.9 -> 1.3.11
Date: Fri, 13 Mar 2026 20:11:03 +0800
Message-ID: <20260313121105.2180430-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313121105.2180430-1-yi.zhao@windriver.com>
References: <20260313121105.2180430-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4a8528-c943-45f3-3c6c-08de80f9a1e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	6MNrpjoZIWWOj+lot45WMUxQm+DcgF1EWLrb4IJNDHjoWEfZ/CJqBTIBJZ1mhR/Exxfj0/UVBmc+ziBj5EsZoRXv+IP7lLuYUs3+KQ+nHwNzcAGpA4sJz8ynzk7qQATP7dRjDdigiA1G8UL9Wp++VwFwtGqKpNPWHxtoIJbtIgaR4dwFRhMvwXKmKBUXOB1WecAVFY+S+zukyxYyWPYS0WpPNtBCOnCGAfilnp0n+b62/gbmoryrZ73ZZiQP/It7ahmqbh01AdeyRImcaa7tDKRB4UJGLAZV8fM5L4L3xV829HvO51OljSGLhcVXwM48fux1tB16F2/WO331AuYbIZkplJdf4R28A0kJXaf5f6S5sXGewySAjvn5Y+ebPAsGnATjfBoYFnF3buw4cHAXnrxG5/F3cxTDyEv6tsD/4T4FoqIHxDX1ZjXHb+QUPIRfUgQGdUnpJGT1YYvVARl0AYnLvzMGuFgTzMIIExKBfM/a7uvWA4tVkOd2/DD10HXOnUdZM9YjMiQ4tzFSQYIqeR1HdJ9tJxoMgMvY9nXO1GyZL0yAISkJN6i4fbV875EGf6zFApKT6S1owbwoa4xQqGLxfaHR9UEPLkJV/AjsXzRSJMbf7TIdnRUhXYfuo96h44JIQn7A4ldS0si+MRFzmwn/DY5z/c8rD+CvZYRSDcvPC6ihxSUcdmrclCxR9Mb8JZx1zv4kRXog/8pWHMeKBftAfLljTYyehK8eZ3dpp5M/V6SejSDV11bPiEiHkvGZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/LkHcCtr0+e9H9Aei2wBo2WVEVUVWXj8jKCIRZr9YVlLUUM/KBsIxADuuwuu?=
 =?us-ascii?Q?n++1c5boFzLjC7aIHT9OqxiyFROx/idEdXszhe7k5jkAyS582Fy9lmGswrIG?=
 =?us-ascii?Q?6ffb183DI2Yt++DD1vQMLe7NnYXMQh+3p3eGKYbOD5GLTV59LLew07aDBTjC?=
 =?us-ascii?Q?D9THK18H/Q1N/lWq+GirJEKu+pi7RxnQGlNLRP6jBkUr+tDET1LXkB9pJUmR?=
 =?us-ascii?Q?9I3p2yA9voXq4IFf3SUx6ZTX030f8MgvyRR5MLuNs52woGLiBcLA6A9HxtWc?=
 =?us-ascii?Q?tFIERe9ZCveGtky1eHQSo/ACrw1EO3n1KR5n9/hN3IVrbg0CCwKb4Vl607em?=
 =?us-ascii?Q?5WEEFQakQmvG1lJd9mbOg65CvM0WADOiiPVp6RcbIUmUfaB38lvIV9d9gT1y?=
 =?us-ascii?Q?qSGrrqDpzzjLozy4QYXpb7kFbqyQseXW//1kGAPIzYNPCeo7SPTpHBcy2xnP?=
 =?us-ascii?Q?xGvC1i7Ady5wbWhRpgDTo0F++97MC6UOIG19tMDvbZPSKAHa/PQE3LSIkPMn?=
 =?us-ascii?Q?OStru+dcijdfxKmcw7Da1Tfimql9zEfzODNzRClarA1lwDBuY0vKZCuAFLCG?=
 =?us-ascii?Q?Yd9ocrgpPZK3+oPrBUPYijeV2rcWcgXg8mtyDd8FLXEgYshjrDQqww38cQNP?=
 =?us-ascii?Q?9QIw2OL1e/0r0bFDt2dHTGuim4WT2sRvs9att0liGtde64XnTURTbQQX18nx?=
 =?us-ascii?Q?FBXrfDCi4h32ycKx7IHjnZWef+NYBzyBRw6QheNVeiaH9kyIOi+HgLrqj82J?=
 =?us-ascii?Q?a61A82oEjM7lPcHtBYNixTXNQOWIG28uBDuocKuYZGvQHhW+FuJUKyTSZ0Sm?=
 =?us-ascii?Q?ql4A+nq2+oDQNzauVTfIUo9BboqiD4DxkQ22aLotOgHlVGOWK/XE1Je4nabY?=
 =?us-ascii?Q?nSn5i7FqpAb1eECsYkRf3Qgm+EY1Omyj5yNlJOEQsjnpQYT0a2X4cFTxJ3bf?=
 =?us-ascii?Q?QqTbqUodyqEFRs2uoj99t6zifmqY3IaKusDigWEnb/2AonzpM+X8rCDpYQgy?=
 =?us-ascii?Q?uOmb8vYIbCUDllzPX53K0UtKtEH2OYnj1elCTVRgwHiooqlfl1pViHdkmXfe?=
 =?us-ascii?Q?uboiX1AN7LhplLGT76sfnkQmOfY3d8Oj4IP1sfTNoZj+PlMVGph8pf7prOQV?=
 =?us-ascii?Q?PDAvUlPLAANKu3oA6tNnY3Ye3deY3yR5RsQclf6eMmVGP6dQIV/IOAVlehQ/?=
 =?us-ascii?Q?x0K+VYmu6t9aSdvaoE8/Qm7queJNy31+QmWmMU0ziooINqvxPX3XXkVTR5Tq?=
 =?us-ascii?Q?txT8xgFBsCgaGdC3QHge23B5B+RWMfc5AHV0EqhL4nGkZs6bMZNShtFR+Qgf?=
 =?us-ascii?Q?Fq0AT4KjUbnxCAHoHcbwPwi37KG09bYCun/g8/55OZ12FO4rk5UI9aAjNYeM?=
 =?us-ascii?Q?SD7XpuLRS3YVyqz+69QOWxQxKwNipYaKckYyfUEG2VC/rLNDOJZmMo7OyfKz?=
 =?us-ascii?Q?56vOpndCL1J+MSqShMqGbryIUgm31NkuMXQvpmAlr8Z7QSQiWD54dKXkogku?=
 =?us-ascii?Q?IAOBUgtMR+TS63dfNju4NciQqkyDA5B+2H4Xxo6HbB5IOy44kO2bF/1IxyzO?=
 =?us-ascii?Q?D72epHPJ82yR7u0nhMWZXTBWLoE8ZKCmowBXBnbjua738dmdehX9aMp52kLe?=
 =?us-ascii?Q?Ony/6JwJYc9E1OzSWq+Oe5UxBnKO2/I/OqyxDWfWEONZfdj1jSnQdDKP3Bj1?=
 =?us-ascii?Q?cg+uJTEkc/uOioVV+n9Jm1jqHk5Zuw55mZv8uOdqw2XHkcz65nFr6jbpu46C?=
 =?us-ascii?Q?Pds7sOEy8A=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	XwTCKp5fUfoJypd2Uype71EYSlTO9O4/nd5XiIuVcM2gcSHRG3/ee3loN7/z8R+MtQUozLwEsBCN7hujwZJFJRl5Jp8MG6C1SFcqeNdb0LTNF9ZW4CHxTo5bTbOANADw+zW48sK9WbRWC2KesT0pGQGIH48QZ75dzCiEITa9C2I5jdkh+Foj+GZYxjeuKaNy0j18IXCDkAHjXtg46j71xnQR+gHTWp0gBbKoPk26l4vP/uGsvpN40wfZXVOd5/2GqXYeFfSHzr+c4gS+5yq43Ek4PHP8HwWcAikVfVqRqq76DKfZJxTWjG+ST2g3bFBIZvmPyhgztNW2SXhgCz1R8g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4a8528-c943-45f3-3c6c-08de80f9a1e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:11:18.6090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0KLE6q+nC2eitBUXPpu/DTDuqX+FCNOZ4BKmjWfYC1cFrBkcHsGKVnNuC/+i5lbtFBCpXuPJvlTEOD+bA/dgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
X-Proofpoint-ORIG-GUID: tAzermcyXUp9nPAG2D4WvXGOZPb_dlw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX39y/I9opSpJf
 fOr+oPZa9hJaE+lv1Q8ImVweEI714BxEq+D8W5nkJTd19IJ3Kl0mM60RLvJ+lvgnl1f6Qw9ZzrU
 tHOYC1iWLfEtzP3Gp7wSrv9sNhqTUizdgU/z7S6LEFRdY95awx+Hq1KrZU0pKvgd2Cxo4mUcr71
 XJacPeDtNb1KIgQ20xDiOtaxk8N2i3qqGZuEPon3BDGAH7JvYglzkAF0ao/PW/uP2YKzm16UdBJ
 nnp7r8dbgiOqJRLuZA9HvJxCrjVgDjlHkfAqgF0p7HbYqK35dsvQRJSiDTf/MD6zc20Sn3ke8El
 bU108XaVWwzooeP2MXkaFgBrcw6xU54q2l30tmO+eTt7SoeDSH1BTM8KjYuYNGFiH+/G8XrlYPr
 9XsBDGCo+tCJuJNC6r3FzpqPxtNDD8ZbPxJkEOHsQa46MG0WFcvEvClBoY1EzBbhXvP0TCtMJRz
 JjQ9lMywduZO6b87Jeg==
X-Proofpoint-GUID: tAzermcyXUp9nPAG2D4WvXGOZPb_dlw1
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b3fee9 cx=c_pps
 a=gGLfFga2G+uCUFnDxO+Iyw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=2AKd9p0aAAAA:20
 a=OYMCiYonAAAA:8 a=t7CeM3EgAAAA:8 a=P4zpwsyUUgw0mnfdjNsA:9
 a=2rklPmxFnYA4oAlhb8RG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125188

ChangeLog:
https://github.com/fltk/fltk/releases/tag/release-1.3.10
https://github.com/fltk/fltk/releases/tag/release-1.3.11

Update SRC_URI as the source repository has been moved to github.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/fltk/fltk.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.inc b/meta-oe/recipes-support/fltk/fltk.inc
index 0b2921095c..9d0eb549bd 100644
--- a/meta-oe/recipes-support/fltk/fltk.inc
+++ b/meta-oe/recipes-support/fltk/fltk.inc
@@ -1,18 +1,18 @@
 SUMMARY = "FLTK is a cross-platform C++ GUI toolkit"
-HOMEPAGE = "http://www.fltk.org"
+HOMEPAGE = "https://www.fltk.org"
 SECTION = "libs"
 LICENSE = "LGPL-2.0-only & FLTK"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f6b26344a24a941a01a5b0826e80b5ca"
 
 SRC_URI = " \
-    http://fltk.org/pub/fltk/${PV}/${BP}-source.tar.bz2 \
+    https://github.com/fltk/fltk/releases/download/release-${PV}/${BP}-source.tar.bz2 \
     file://disable_test.patch \
     file://0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch \
     file://0002-always-build-fluid-and-export-pointers.patch \
 "
 
-PV = "1.3.9"
-SRC_URI[sha256sum] = "103441134915402808fd45424d4061778609437e804334434e946cfd26b196c2"
+PV = "1.3.11"
+SRC_URI[sha256sum] = "ca2e144e5f89173cd094cc273940d56230b1bf613083a0792e6406dc191cd99f"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


