Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C71CA5FD5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9564.1790856320375943255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eUDdFKbo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6918Ecf2955562
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 05:05:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=dW0YC9561xFayE2a7/+iyCWhUbVjmnO60XxIXtCVXbs=; b=
	eUDdFKbolBRn6mnHeWjBLAUYEOqZofpX4St4rEoU4g/DPzg+qg1Ngz/mFD/IKBwg
	2IrVB3dpuD03npMqnpkXGUo2U1UVhvtjGloJNQ+0XvwPeLlfrEssFWeGJso5qJVd
	k48jwCOq0XZKU3ZI1UwixerD+6Rhx9VJHiJSIvTAL6qEixpbCuV8VVvOdav2qEhZ
	mBwWoGWW+EMv4/bqM8o/d8pndVrco+EEAU8Avz3rx5fgLii3/Cp96HO2wcJlojJB
	XMhaqgOuHhyYMxC9ZyUlZaip4tlG9k8D/2oxYUZZ1Jh+qGRt5P7x93QShPgH7pEL
	sJ4RZ96NnPbmMkcH6ofStA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021080.outbound.protection.outlook.com [52.101.62.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1ku8gaqw-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 05:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ii0i52u5Sbk4uLY/mgXTwy4mtqhUt9m1oDt5/K1Eil99pqYqL+w9qcGRVkRP01r4IxUju1jFBEfuB3AnC3RzEIqIg06sqtGecv+wh1+r9EdUGnTF1TETKTli0dasowoHKYCBDn/9doY7TmX2lhs1tPoZ7hhF0vyu2NUfbNhTS1wcwv2085EgLit+CfJrdwSS/qJGOAr3xZrfESdupMGken9PB2JCDxTJvyfl6osLO6PzmhoZ6es1xyRYVSka3MrWLSBzwyk5YjuDGBmpmdUxxbkxoSB44kzb/BgpMr/ruGrBYw+sRHApO3/4VT8xnn7zwKnma55w0fsBGwuXSAdvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dW0YC9561xFayE2a7/+iyCWhUbVjmnO60XxIXtCVXbs=;
 b=rQauynTrKSAvbkgyD3plRkTF7VymKHalm7bu0Eajgm2SRKP6kSbIHerWQlxUOan/gINUOCsvuW/wmc4kp0wDEplNat3MJw1LdsLGJM6Wf7P5WQXQSeiHT57yBMkBCF9M7E8/CCkEfGSz4JpoCoosYm7qHZZcQxKeXf5PZwbVhlbF+xErxBJl3J8adIMYXmSzynw7rC6hUcoaTeuA6CRYdluLUEQe+OPnJq3etw1kcvCNzlbYIKFtJM9rKBsPPG/DjW04aCePO0Ievlg+boHcQWqax8bqWBo/+OYwbMnq9/8ICd8k799Odj/ByPZEJHMaszQLuIYez82Z4GR82rw7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:05:00 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:05:00 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 08/11] strongswan: fix CVE-2026-78132
Date: Thu,  1 Oct 2026 17:34:14 +0530
Message-Id: <20261001120417.1280843-9-Abhishek.Bachiphale@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: e9d56787-1794-4928-5022-08df1fb436a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|12006099003|6133799003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	0rfO9hOlUb4wQWvXbqZnFnMsxnPhjYAs6dtu9+OKTOjxIkQKopN6qpJwbsLLbYyA1zXPvj7MxU620LqvugVB+m5A8RZ8JfYPBTVDKB6Il2nfJxT6kvGsgC1485+NpogbrgPJi+cme3O8f4n5fJYUXNf/ofYaO+kasfU0+fy/NurQCVd81n+Bw4cOO2+GvwQcvLFWq+vI0JEEFRTUv7zg4iFhcVOnTiTMZCyWVkIKfONMJ15TkSd0MMB2FzHcIN3MdDzB05rzX+MREcbEKunbN72tB6BdxSIr9KpqrEHA3ejMLXvwhnJUyfZpxvehpUt5GzdyvV//GsnoXtWbdZ97fSouGXcMbiWfENkPAhccXRmfAvqlFQ4FP8sxYKz9hlvN//h4keq8Ms80ek/+SQ4zMh6JVdpgiCiCfMBN3ogwcEa2ejcUDtg5ufBFfCyFe47VhIOr04BZzABItNCZnNjzaR3XqJtv1tP2Xt5whl3SKLWZh9OItJs4fqepYjFWlfL+rFnhrMU++Q9dz2ijgBYvuu5VvcWM2ez1eQGD917Oj3HU64TBNohDGOOUsO/1fMd1SJWRe/aUh3w6BQre+y32nBFBKmEoLDfSVew1Fj2yN+olF1MX/80LnRHwGkbvkscvE0yiddCg3HrmsQ8cPLsZikLwp0GeqcsuGhXj5bcNp+w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(12006099003)(6133799003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WwnSlwdRS8LnPxgcwT7UtUl3Ycfe+GropMe8I8JzgbQ/vrFXXibrzRimcWcp?=
 =?us-ascii?Q?C1YtMYtx+VZOZr3QTmRyOz/cqK96JjxHSk+veFaK3daOcZZ1jnBJve3MOEEw?=
 =?us-ascii?Q?/FNVXWpcsQvXvznZqpQdhjNF2kefzkkdtjxORSK3aBOdsZ2nOHRcmd49W8xc?=
 =?us-ascii?Q?UpeMGIQWgO1bUfuO2PPKG3IG7cCTOH9hwM9/QkIaTgIT3OoCIkp6arLBTgmM?=
 =?us-ascii?Q?dJZNqwzLAL6WvoH5h2miu/zEn58VlvowTC9QLW8pgNGCHsif9CHe4ShaJYak?=
 =?us-ascii?Q?NSvx64aeqeGR9CPMaaE21z/r7lGxpajakOLW/wcFx1sMZrF9iMLVcgiVcA4J?=
 =?us-ascii?Q?Q4pZCBFfw8/qy2CwBm+ePiMgaoAEjLjjonvPyWVObTmWU9LBcXk9hBTs6lM9?=
 =?us-ascii?Q?wgVa/Mp+3PqnlXdwQGvO96kLVZORX20ooWWmAlYE54WsV+Dv0tzkKkvuPId5?=
 =?us-ascii?Q?5Dw49poKvGwqxl1iehpA7J4xud3Zh+SW3jjq03WGrbzLnf4K0RA/9Ng2usUG?=
 =?us-ascii?Q?NFNKQduMiNr6KdyoozR9KkPhv1obi/J8GWXWBeaYmJJqebT2a0yv1JqfgKnb?=
 =?us-ascii?Q?YtMC6+PRJ9AQnzgvNsbe6D2vlFCrmiuh6ROBw7F0scfCRIiGtuPbZnEEh/Lr?=
 =?us-ascii?Q?5MI/VUYBSz95rY+EZA/YMd3nZ7BIjLZOxFle58rY+4zoTbxcn2J/5nDjvjvC?=
 =?us-ascii?Q?zUeNEGNMi8eXDCNdTPMODZv8hYianS4bqrKkWtuKCBeSSkKdUh91aaqwoAfJ?=
 =?us-ascii?Q?1rQjzNS1rkgzVxyFPkDZ4OqxZZ3HxCUldSpSiSCE8oPQUpFguKwOK337H1+6?=
 =?us-ascii?Q?VXLwm4t389NxNdaITTqKKLY+rXmBy/rCpYX0Sh1bM5Wa/hlT8USntQzkayr5?=
 =?us-ascii?Q?JuVw2SVF1z0P0C3OnPzAYlOv03cem5WbD8UP+pfRtj3NjTyNstJiv8EWJPcA?=
 =?us-ascii?Q?AjXnL3LYvNzhDn/bZOC5Dfc9+XcZOM4C/Zm6Dr9a5GFMgkMjeCboP1T5Om2d?=
 =?us-ascii?Q?3VxvoYOUsmnZvngTYzABaiwzt82nuClaEVQAZ2yajSDD/GO+lZY1gPpNTxMu?=
 =?us-ascii?Q?Vzu5y+bJuBC+eubuELOVIiuXetfd3rl5EG8kzP1aMg4fdt2OgoPj7VdLVNaJ?=
 =?us-ascii?Q?JAk1kT7hEG0qcvmPbMBZVciez7DU39njmo9BYggr0S9bFlN4OisaeT+KK0vu?=
 =?us-ascii?Q?dGkHQH1jwE/C4fBqmNaqi0z8yTOVVLplHxFTxjYTtg5n4ZaRo6Qwc2YvVMj4?=
 =?us-ascii?Q?FTR22QqnxUlZfvkt7gHi1cHadQCAh5XU6ji380SOP6INxKtT6vuEm0Os9TXT?=
 =?us-ascii?Q?cStHMLIgJF00VRH4o5uUvXKQ3EDgLGARXRngUlVfeht4n0Vovfe9qOSSGFyr?=
 =?us-ascii?Q?3H3bmbNwoZcUIaJLtxtD2om1BfEOyjVpihjy2PX1FP3WA2hxbiqmYjpvtAKo?=
 =?us-ascii?Q?/ZLB3VGW8dpH1UcVg4hla+WX3g9vuaMXRcAAPSnWac0fYZT9IyP8Sm4hk3Fr?=
 =?us-ascii?Q?xuJBbQJ3pPLcnApda49LaACb+L3A4nap0bet/2pQWT4sff3N3fKlzJ8L6GXP?=
 =?us-ascii?Q?FwXzJuEVvegsc3dUNp7ATClaUgsB4zDJ++kTUB/52xIGyCPaX6sXMrCNYZGD?=
 =?us-ascii?Q?/2gy+NoDTHUqzP8xRa8Qrd2qpgYySPBKgQDPbUZNjvFZhLsoPLeFjEVs4vCC?=
 =?us-ascii?Q?geMmLdNgjXbe0ee+W41umxzdhjO2pfvE/rl+8DEzLfuWtfCHLgI15YBU8UFC?=
 =?us-ascii?Q?6YsdrN8BV5SX/F3QbuDnutoHHm5rBYrXiwdOOmVgKXwXlp6QEdVt?=
X-Exchange-RoutingPolicyChecked: 
	gUy+i3FPkX3UtzVVsDa0jdFkt3ZhFbUYYoF9Q89uKDjty67ELINYUtLBRAWig3YaDVn+gKDnJV7Ew4LgeBaMgidxdwZ4BjWealn/ZPRwqnXQowgnKS+B9Fn27moJSgqpEIur35+kJhdmMeePO1pYIFR4QU6vJvx1lCENaGmJ+Ml8AgrCg2kes9QNtks54WoXtSaK+2Q64+9v6za29ny1s694r3x97K3bXuh508G/1Up93EpFrwofWQCyfy/NcNtNssu9lrWjk66263he3IlfdHgg2KhLmxs/frLO7PuZaOUvFcJMcJevx+fO4J1qda/9kK4sT1mqGh4V8VTSqaqrhg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d56787-1794-4928-5022-08df1fb436a5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:04:58.3833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHP0njI8RZMkk6a+CVYmx8s9mbvOR+I4BeZiSc8gi0eZaM9gTw6wijXPjsRHnlDQQfe/aHjwF+CF/hbJSjQo1NaD/OvTYfl2f6UsaspxfS/wcJaT4qPbilvyzSEJy1Z7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6abe4c7f cx=c_pps
 a=rDyEm/81vvKQCy/iKDMZrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=zAYA0XYkj0k-cts__vUA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXxkcS3+c5epA4
 bniU2sdK0fm4XfW4o7EMvJydtUs1Gk0cnQeQIP7qw5Qz2i98eTceGXmITUtDXcKHTwlCR1Y5jNY
 dhRN99PQNdXIgC9gh4YLk6Z72FmIBaSq+08+E3JDZ1MnvnD2JMIP
X-Proofpoint-ORIG-GUID: X5QMZO1avqRebf2ZMf9ta7sEPF5rHuhq
X-Proofpoint-GUID: X5QMZO1avqRebf2ZMf9ta7sEPF5rHuhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXzJdrGptxCPNE
 4h7PWcHcLn1H2so7aW/FLafB50Pf2bw0gv2JWnANrs85AzkNOJvyydxiYevULCYAXLcLuhyhDS2
 mNDMV4tM7qj097bZfYvBvo2ik0VXeQACow4N+sO6RE5QGfkB39VpAOHQYMG8M7oXlgg3MJovL1X
 NOsnoEemn3Z4L70XHl6Jf8Vp0w8M3KK/QoX5M8zEd2/hbCk5fnK07ZbqiJjRLYHDN2KxOv7/MVc
 yRkG2nwUGYkI38oseGaYn6gbmaNGbHhRv0MDZ97S7RFK9uKYwvqm89wmdq51hVq+A3UF8AMTamT
 M0pgiMdKD4d8k1e9ZYl3bgEdPBJielpzXwCn5MfSIIRXVidgmG04QLVQGOFmgaRglMd2hObueCe
 eF65lf9dImfBhWu+mX+/Zw9LVgSUQut57vIaYXzK6rYTXmL4tUJJRRHuNxawu49+TJt+iqqminT
 4v0XI02xKSE4e7+97Ng==
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
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130585

strongSwan (since 5.1.3, through 6.0.7) allows a denial of
service in the x509 plugin related to the parsing of the
ietfAttrSyntax ASN.1 type in X.509 attribute certificates.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78132]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78132).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78132]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78132/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78132.patch           | 77 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
new file mode 100644
index 0000000000..2be5f666a6
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
@@ -0,0 +1,77 @@
+From d925e4625626a70611a979d4ab231c6e2d313e4a Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Wed, 1 Jul 2026 16:24:23 +0200
+Subject: [PATCH] x509: Prevent infinite loop when parsing ietfAttrSyntax in
+ attribute certificates
+
+This is the same issue that was fixed with 407fcca200fd ("asn1-parser:
+Fix CHOICE parsing") for other CHOICE elements.  This one was missed and
+can be triggered pre-auth by sending an attribute certificate to a peer.
+Since it's parsed before verifying it, the certificate doesn't have to
+be valid.
+
+For versions older than 5.5.3, this patch requires prior application of
+the fix for CVE-2017-9023, which introduced proper CHOICE handling in
+the ASN.1 parser.
+
+Fixes: a17598bc6992 ("x509: Integrate IETF attribute handling, and obsolete ietf_attributes_t")
+Fixes: CVE-2026-78132
+CVE: CVE-2026-78132
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78132/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 36 +++++++++++-------------
+ 1 file changed, 17 insertions(+), 19 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index 4436bc4debef..e8e34749a59c 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -249,26 +249,24 @@ static void parse_roleSyntax(chunk_t blob, int level0)
+  */
+ static const asn1Object_t ietfAttrSyntaxObjects[] =
+ {
+-	{ 0, "ietfAttrSyntax",		ASN1_SEQUENCE,		ASN1_NONE }, /*  0 */
+-	{ 1,   "policyAuthority",	ASN1_CONTEXT_C_0,	ASN1_OPT |
+-													ASN1_BODY }, /*  1 */
+-	{ 1,   "end opt",			ASN1_EOC,			ASN1_END  }, /*  2 */
+-	{ 1,   "values",			ASN1_SEQUENCE,		ASN1_LOOP }, /*  3 */
+-	{ 2,     "octets",			ASN1_OCTET_STRING,	ASN1_OPT |
+-													ASN1_BODY }, /*  4 */
+-	{ 2,     "end choice",		ASN1_EOC,			ASN1_END  }, /*  5 */
+-	{ 2,     "oid",				ASN1_OID,			ASN1_OPT |
+-													ASN1_BODY }, /*  6 */
+-	{ 2,     "end choice",		ASN1_EOC,			ASN1_END  }, /*  7 */
+-	{ 2,     "string",			ASN1_UTF8STRING,	ASN1_OPT |
+-													ASN1_BODY }, /*  8 */
+-	{ 2,     "end choice",		ASN1_EOC,			ASN1_END  }, /*  9 */
+-	{ 1,   "end loop",			ASN1_EOC,			ASN1_END  }, /* 10 */
+-	{ 0, "exit",				ASN1_EOC,			ASN1_EXIT }
++	{ 0, "ietfAttrSyntax",		ASN1_SEQUENCE,		ASN1_NONE            }, /*  0 */
++	{ 1,   "policyAuthority",	ASN1_CONTEXT_C_0,	ASN1_OPT|ASN1_BODY   }, /*  1 */
++	{ 1,   "end opt",			ASN1_EOC,			ASN1_END             }, /*  2 */
++	{ 1,   "values",			ASN1_SEQUENCE,		ASN1_LOOP            }, /*  3 */
++	{ 2,     "value choice",	ASN1_EOC,			ASN1_CHOICE          }, /*  4 */
++	{ 3,       "octets",		ASN1_OCTET_STRING,	ASN1_OPT|ASN1_BODY   }, /*  5 */
++	{ 3,       "end choice",	ASN1_EOC,			ASN1_END|ASN1_CH     }, /*  6 */
++	{ 3,       "oid",			ASN1_OID,			ASN1_OPT|ASN1_BODY   }, /*  7 */
++	{ 3,       "end choice",	ASN1_EOC,			ASN1_END|ASN1_CH     }, /*  8 */
++	{ 3,       "string",		ASN1_UTF8STRING,	ASN1_OPT|ASN1_BODY   }, /*  9 */
++	{ 3,       "end choice",	ASN1_EOC,			ASN1_END|ASN1_CH     }, /* 10 */
++	{ 2,     "end choices",		ASN1_EOC,			ASN1_END|ASN1_CHOICE }, /* 11 */
++	{ 1,   "end loop",			ASN1_EOC,			ASN1_END             }, /* 12 */
++	{ 0, "exit",				ASN1_EOC,			ASN1_EXIT            }
+ };
+-#define IETF_ATTR_OCTETS	 4
+-#define IETF_ATTR_OID		 6
+-#define IETF_ATTR_STRING	 8
++#define IETF_ATTR_OCTETS	 5
++#define IETF_ATTR_OID		 7
++#define IETF_ATTR_STRING	 9
+ 
+ /**
+  * Parse group memberships, IETF attributes
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 8e3765ae5e..ea92655270 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78129.patch \
            file://CVE-2026-78130.patch \
            file://CVE-2026-78131.patch \
+           file://CVE-2026-78132.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


