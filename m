Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6710DC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:21:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31648.1788776508807167657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hxu0kLWh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3710b275f7=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879cjnL3809206
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Sep 2026 03:21:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=c3ORsVEVXCIK3ArvoGDJ+7oWQMDWYR/DsaA+mu+JzDs=; b=
	Hxu0kLWhOkKrC5IsZZBtXWPgvIx2dsjgjFOFxcOGErijAoMY7IWE18A7MzbwqU7Q
	qsr5VO2M5aq4aLDzbGFlCoErh1kuDYFw9DrJBHrLpWQrbYWOtpZCSoqTA1QiWeND
	htu5RlEztAyfA8BC6AlKi3X1dNLeG9V3IfXBWYEJ03b4z/lMdInLK+ZA+Rwf0oQT
	ShPVmdZS2R1iqJyx/mlbXAIPlfQEBsubkBrcTX3LkCpnXpBljMPxT5uASQFWvn/u
	cOFn0bb2lRHy2yk3NCCP9gDTbOBzCqtGn9077kmTYKlsiT78LF5Klvw7YppDSTXJ
	q0PXq9Yv+8C2H9JanETjuQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021123.outbound.protection.outlook.com [52.101.62.123])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ggec0t36w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzpLxNGZjic56RqKtCTg8xYqjnpgeTdsVQQISRx50b1CIW4rRgDGx9OgdW2FDd2v0DYyb0Lx5JlMsb4bTCYPg2arl0OeD+ygACkH/LX7Tt0kjf7eOaYqafb1ax62YO1RlJttN9s+FQMCITydhjVBgzaLEqGcxUjAHl7I7ZfZjr5WjsobeGJUPNQtcOJxUt0kzCnZsq73ujwfDTx7nic+3mnfnYiqa9YORiFdOOE7J+0Vwzca/8gr2cZGM+2CgTSbV77cdv6zwmcBDi5FAA/rvu5GAWhDawmyBpANokCe/zcFSyBSavgdroO+hSMJiFY/rGQOOqEmAwN/917sVUyesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3ORsVEVXCIK3ArvoGDJ+7oWQMDWYR/DsaA+mu+JzDs=;
 b=rFQ19Tr5wW4HeJc3smg7PQKteLBJ3wLPP8ZmS1/36+3LVe6Fyulj0CzV4ww5KPBFqYhoADJ2kLk9WhZkRcxowF7eK89yrsTayXkpwLhiu2GVmblXQiZlzeel1L0EPz32FGy2Lnj4eqzRdgeKUxHQ/3BTc3F5E1QeIp01/oqIqYWHaK/Hp2VqyPvp9giKbf4jLM0uTOEDcPMGHvyGy0jLB/ipfUQ89a0U7zMwyktePQ3wG7kxz3V1nm95rAXUJ1SnsYwWsWjwHU2+eXgjVotAJ2fvggKD1oi1pQoyiFvniIXLUvtAcw/LisPxsa+iKgc06Ovg5AjTiVsno+o/gp02Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW6PR11MB8410.namprd11.prod.outlook.com (2603:10b6:303:249::17)
 by DS0PR11MB8738.namprd11.prod.outlook.com (2603:10b6:8:192::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Mon, 7 Sep
 2026 10:21:42 +0000
Received: from MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578]) by MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:21:42 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [meta-oe][wrynose][PATCH 2/4] thrift: fix CVE-2026-48586
Date: Mon,  7 Sep 2026 15:51:05 +0530
Message-Id: <20260907102107.4007371-3-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com>
References: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::7) To SJ2PR11MB8402.namprd11.prod.outlook.com
 (2603:10b6:a03:545::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR11MB8410:EE_|DS0PR11MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 190c5c3b-9a3e-4318-0847-08df0cc9cf41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|10067099003|56012099006|11063799006|6133799003|12006099003|18002099003|22082099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	kUr/H37pKuF818A4BjNPxDtLQGl+coRiaZW5mQdJCi5acH/MeTEyW04uDrNPCHoS5MkBaxN5gKipU3NijvSVqGUofTmpJ9asbxMpkv9fvAq2JHgDV/3tufenarPxyfk+XTe1iVd4d/FIn/Lsq/QMuY23BM7pDeLwxeuAZbrtr7vY4EN4FJCwNRKJaygjXkIsZ+3oXYJsXzeOc7FUD030+Y+aB4Cnb19CRisy0htLHHh3uyimN4/weJl/bFgVUTLWVjduYbQqSW/yBBT+XYewBmbwzaqYnqalnfGqPY96TXmkgJ2uaxyOL3E+VTqLOZM3mRndmioTypASaW7neTmCRO8bkf3dRiSfCzM2i9Xw0XG14JzSkAryTTZfNAR/mp+epswkNu77hW3pEGYDeM3lIPg7dtNQWZ2BmSq8d0EVWMd/BBG8ujbv3k6THd9L6G1geiTwa3t9cJJonMAZso41eDeA5/0E56/vj6JcphvKjaftP+ILU0qAuazCfTtBHYGj4eRjjHyVB8Tm+lC5DpahLTnAjpZnTRB+ZnXJ0lU9HMMueb9cktHoCLf8A8IMxw0znN5HD4va8G9X47y51YbNdd72kxecJhsFJUnGcPO6hbcoWe6yO/7oaNdK9Zrd+b4IkOMP6IRSfQC2wZDU3kfdaAxkFiaLli+PTH0vZrvgA4iSu3fv7TwV2Kzq/CIizUNPGqFZ1tDxPfpeJagnHwF5bmrL/vJTDCDO2aJaVzgkVdQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR11MB8410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(10067099003)(56012099006)(11063799006)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P8UeUIGZjIqFcVBHQvRjOQsDrCpgFrU5ghc5FZx/qCCcQUBnkmwUcMJV18yp?=
 =?us-ascii?Q?AJDjWT70udG5+hbc0dSAQDIEP8SIoWTXDeKY/cstjc9zsdlgDEWlJpvulCF4?=
 =?us-ascii?Q?0VwNKee/QL3beg1rp3lRgtm4DtgdF31dhHZb6iaCh6WAWYC0MZ8sfQDRpYR4?=
 =?us-ascii?Q?9QgTjdTLQM9ZY9darGYZFifrbZriG2strfiC4dRbHnQOJhguPxoVGJ+5kh7h?=
 =?us-ascii?Q?wFrk2Tq0HPPH/zr8g+up/iTpzk9dnLRtCfNrAODsQwqvHP8CNX1dFuSbHHTL?=
 =?us-ascii?Q?I5TiPsfKV53ZwQ/elswyc58P4/5by5zhtqjUOjCXlu9XOLAHyNc9V506XvTh?=
 =?us-ascii?Q?c+DAf3l1UMTiNLHn7QMShGdJD+/3tO5nCLQtDmVyriGeEVYx5lZEN06FyCwG?=
 =?us-ascii?Q?egTIO0bdfQV/8yF+ig9s6HoGwenbqrU33jNmfvfJeZOfD029HrAIhTiWHouf?=
 =?us-ascii?Q?RiGLyDWC0ulKbcI5O5me4mFqMvpAL+q7m2g4sE1WDWwEfH0MCES51TdEk2IH?=
 =?us-ascii?Q?Gi5e9v7r+2Qpn20t1lQA3KbG7D5bWyEXdVOe6naY+AJsDy9qgV7/a5coko7G?=
 =?us-ascii?Q?vE0jJmoJQTrL+ugfj3J46rU1KtN6ZBklV0HoalXYmv6SQROxEHElUgoTSp/R?=
 =?us-ascii?Q?IkRkBCv0NI+TswwJhrmHjVoWpEcXc1vhZpSO9nl7JvhEOutUcfpA9mQ7wOdg?=
 =?us-ascii?Q?n+QQdrDOQFzzUQGDzq44B/pZk2jtGFwsKygHSiyR8HcVKVOhGxg66Vyx+yF5?=
 =?us-ascii?Q?J8PQredjVsqbpQi4bWFnSdq3zNXJB88vs8RIlweUQHo9CfYzLH1jtf1kvctC?=
 =?us-ascii?Q?djAcoHBzwz7fAaSN6azNBh0YZ/DNPaixYtkINRh3UEXuI6wBzXqR+L4s7ufu?=
 =?us-ascii?Q?ib6yATJHRl8T7O5S5CCchcvXsUSwS+fvzAaY4VD1r9zZIW7mCm2OsI075IOl?=
 =?us-ascii?Q?NKa7OYLMI/LjXJTE1EIBpohekmvY7C9A2aeShxJ0X6msz6SVOvCp5PbNOhh8?=
 =?us-ascii?Q?bmyhdEzKHHF886XgdKSVejgnWlx9Y5CtgGumyFCBMA/cg9B9CRGIUrhQmlW7?=
 =?us-ascii?Q?xGCmvubn2LjGZgZ3O3di4QzRdn9pVGXDhIZhF1AVyIw4Lgpo6quD+fCQoQbJ?=
 =?us-ascii?Q?RVWw7/rZeSQrgxl8lJ3l0jfmZ4uxIEB2kDB2nWpSg+wMtxmy4cEgWruLDyNU?=
 =?us-ascii?Q?H0C+6jvtNM98o44p+qC+ZRATrxZ7IzOrx03yEfETNyh9ugwkQkSm3bZcvFAe?=
 =?us-ascii?Q?MWrj5DDao4v5cI3j8PEiwGCOLrDUTW2yB+62aSEQuv+64RP9E4yAR8qUGrtK?=
 =?us-ascii?Q?jmriybrIZVIRJgmFJCeGBHcWp396lFwGcNW6fYFJ5fSTSNgZ2fRDieWaL733?=
 =?us-ascii?Q?muLntdel9z2uL4Wytwy9Lt/zuW6sFUmf5SV2VCzOdH2gFPrk4ngUvbrXVBHB?=
 =?us-ascii?Q?ni0Ql99j6xNEWvlQl173y9niRQsH++MMv3OoNUfEY9pYugt12kK4Oof7MUmj?=
 =?us-ascii?Q?AmUCDiOhE1cXStmTUZArIGjD48F4U8+E5Yfk1Iis/X4WAbI8G+JNomMsg6g9?=
 =?us-ascii?Q?4LF7hVO5RHPWHpDeUjtXkOZX8H+qj+D1uhrj9UJLGIvImOQkvT6QCBxH5jPh?=
 =?us-ascii?Q?ZN77KonIWrQ8gg0rlSO3qCdJZqJJzhTAeqAf0v5bGKn7aQhFg2ms3iuwUX93?=
 =?us-ascii?Q?VtiIBvZz2SSX4KP5Q9b9kXyyGnXIvERP5EClfzDoO8T48Ij7P6O/3Y+Asy6w?=
 =?us-ascii?Q?4ZdjN8XwZsJVtpssXOa/EKjHIYKbUcJVeKImVEFsAQ8gVUE1Wmgz?=
X-Exchange-RoutingPolicyChecked: 
	CsDwUR6JWS+T9WZa6QrLfLZ+F5lWrhsvvguejmmJCPnOndr4uFkZYPAiiIQBax9zkQllcEuhP/5CshzoqcgIZ8sv1oyfBhfOSv4/nDzHL9+vXbDJ2xTCvO9zxVlYxmTuGv3s7mUloh23mYS5FjwV2vI9shoV/JlM5JgbQIX4PBbDcxBjcA3xfZuLX3PIbhUQFWsTko2r1nVGXpuaQ2Scbxu96RtNKjj8vCwiEnQYWrdCETiOSlQrkUzcJk6ZHggFvgnBOQ3cQZce4Nc+yABPtAv+mG32e6LFdkgGUccGjJIPT6QkWX7GOR2MkzhvsI0iEQFtrPtDexki1LSIo+eGbw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190c5c3b-9a3e-4318-0847-08df0cc9cf41
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8402.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:21:42.0241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s920xQmLrxC3Ht1WVNdw7c2P6ECEsGZfxEsFVPE1tSqwBa23fFjwT8VJj15PTQnjv82pabMD2rwrvAbnOM9eEFxs2XYPywtEcJ8AXdyJGT5I+DUrpyjOuPLunciHGubd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8738
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a9e903c cx=c_pps
 a=rsLAoTD1kIcpcG7DHw0aAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=6gl_cCoBAAAA:8
 a=2xrm0QnkwNtaVoLOhK0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-ORIG-GUID: my4BK3ECvSvQpfL4pPEzk8Cmrx47dn0-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfXyyhDYdJueqeM
 uTAT8BH5SjwoZx/m3WROty2p01gau1+svIGozbkPc8tJ6LLDQJq6wZmsPeJ0H5E3iHi9twBUwWx
 qeKcfpSLXiocsrkQNIC1CCAOGps7RC/ScHzIHGeP7nvNXSqIkh5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfXxaNn9wK2T62/
 53CqFD6UAXXgzavMZyHU6KnkOsGv61M7QVtEV+1S1yUzNgOYkJ7vkC2TjN2FMd+uI4gPiIScJNx
 nc2MS70/D3mi6dyWS9LbrOEObdRHTAME1fQzUvZ/OE6P1eFA4Iu9dbB7BdAGKVN82uFq5NHJnth
 KIENLha2v1ymrIkWVl/aq/9Gd5/qFEMQxEpQiiPn7ykZdHksmaLIRaLYRlOfaU8F1Q71LqgjoB3
 tPyuAKfsMpOZ9y3+x9VCNFOWIdBXkqeaxcnvFsPohQ7DN5Ef5YSpod8gxpshaNIpMwRLYwEMZfF
 tUr0aPNptLIFCZydAviEJ1QWtQJAycPdr2A9LS/CV0hpnXAtoqSO3k6sB5WW/0b5RTCpaG56k7B
 za+wdB/ihUvaSkgi15lss1NiBJzTYbYj+nooblDQr+5IKXSIJeUpyC5fb/nhDRuDlCJifzSqn6Y
 nf1fX8vxHmr22YIdm6A==
X-Proofpoint-GUID: my4BK3ECvSvQpfL4pPEzk8Cmrx47dn0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129810

Improper Handling of Highly Compressed Data (Data Amplification)
vulnerability in Apache Thrift C++, Java, Python, Go, D, C/GLib
bindings. This issue affects Apache Thrift: before 0.24.0.

Backport patch to fix CVE-2026-48586.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-48586]

Upstream Patch:
[https://github.com/apache/thrift/commit/e3c8c534cacdbef039f4bb0bcf4b2744a982e3bf]
[https://github.com/apache/thrift/commit/702d00f9053133aba7186f2dbb242a91a1ddd491]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../thrift/thrift/CVE-2026-48586-01.patch     | 109 ++++++++++++++++++
 .../thrift/thrift/CVE-2026-48586-02.patch     |  78 +++++++++++++
 .../thrift/thrift_0.22.0.bb                   |   2 +
 3 files changed, 189 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01.patch
new file mode 100644
index 0000000000..aaa40ed843
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01.patch
@@ -0,0 +1,109 @@
+From e3c8c534cacdbef039f4bb0bcf4b2744a982e3bf Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Thu, 21 May 2026 14:24:28 +0200
+Subject: [PATCH] Add decompressed byte tracking to C++ TZlibTransport Client:
+ cpp
+
+TZlibTransport::read() called checkReadBytesAvailable() but never
+called countConsumedMessageBytes(), so remainingMessageSize_ was never
+decremented. Each read() call would pass the check regardless of how
+many bytes had already been decompressed. Add countConsumedMessageBytes()
+after each copy from the inflate buffer so that the TConfiguration
+maxMessageSize limit is correctly enforced across the lifetime of a
+decompression session.
+
+Also adds test_message_size_limit() to ZlibTest to cover this path.
+
+Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2026-48586
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/e3c8c534cacdbef039f4bb0bcf4b2744a982e3bf]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ .../src/thrift/transport/TZlibTransport.cpp   |  1 +
+ lib/cpp/test/ZlibTest.cpp                     | 37 +++++++++++++++++++
+ 2 files changed, 38 insertions(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TZlibTransport.cpp b/lib/cpp/src/thrift/transport/TZlibTransport.cpp
+index 1a171109837..d6161a129d9 100644
+--- a/lib/cpp/src/thrift/transport/TZlibTransport.cpp
++++ b/lib/cpp/src/thrift/transport/TZlibTransport.cpp
+@@ -149,6 +149,7 @@ uint32_t TZlibTransport::read(uint8_t* buf, uint32_t len) {
+     need -= give;
+     buf += give;
+     urpos_ += give;
++    countConsumedMessageBytes(give);
+ 
+     // If they were satisfied, we are done.
+     if (need == 0) {
+diff --git a/lib/cpp/test/ZlibTest.cpp b/lib/cpp/test/ZlibTest.cpp
+index ea9c617f625..8f8f5a8e7cf 100644
+--- a/lib/cpp/test/ZlibTest.cpp
++++ b/lib/cpp/test/ZlibTest.cpp
+@@ -45,8 +45,10 @@
+ 
+ #include <thrift/transport/TBufferTransports.h>
+ #include <thrift/transport/TZlibTransport.h>
++#include <thrift/TConfiguration.h>
+ 
+ using namespace apache::thrift::transport;
++using apache::thrift::TConfiguration;
+ using std::shared_ptr;
+ using std::string;
+ 
+@@ -338,6 +340,38 @@ void test_get_underlying_transport() {
+   BOOST_CHECK_EQUAL(membuf.get(), zlib_trans->getUnderlyingTransport().get());
+ }
+ 
++void test_message_size_limit() {
++  // Write 4 KB of compressible data, then read it back with a 1 KB limit.
++  const uint32_t write_len = 4096;
++  boost::shared_array<uint8_t> buf = gen_uniform_buffer(write_len, 'a');
++
++  shared_ptr<TMemoryBuffer> membuf(new TMemoryBuffer());
++  {
++    shared_ptr<TZlibTransport> writer(new TZlibTransport(membuf));
++    writer->write(buf.get(), write_len);
++    writer->finish();
++  }
++
++  auto config = std::make_shared<TConfiguration>();
++  config->setMaxMessageSize(1024);
++  shared_ptr<TZlibTransport> reader(new TZlibTransport(
++      membuf,
++      TZlibTransport::DEFAULT_URBUF_SIZE,
++      TZlibTransport::DEFAULT_CRBUF_SIZE,
++      TZlibTransport::DEFAULT_UWBUF_SIZE,
++      TZlibTransport::DEFAULT_CWBUF_SIZE,
++      Z_DEFAULT_COMPRESSION,
++      config));
++
++  boost::shared_array<uint8_t> mirror(new uint8_t[write_len]);
++  try {
++    reader->readAll(mirror.get(), write_len);
++    BOOST_ERROR("readAll() should have thrown when maxMessageSize is exceeded");
++  } catch (TTransportException& ex) {
++    BOOST_CHECK_EQUAL(ex.getType(), TTransportException::END_OF_FILE);
++  }
++}
++
+ /*
+  * Initialization
+  */
+@@ -441,6 +475,7 @@ bool init_unit_test_suite() {
+ 
+   suite->add(BOOST_TEST_CASE(test_no_write));
+   suite->add(BOOST_TEST_CASE(test_get_underlying_transport));
++  suite->add(BOOST_TEST_CASE(test_message_size_limit));
+ 
+   return true;
+ }
+@@ -467,6 +502,8 @@ boost::unit_test::test_suite* init_unit_test_suite(int argc, char* argv[]) {
+   add_tests(suite, gen_random_buffer(buf_len), buf_len, "random");
+ 
+   suite->add(BOOST_TEST_CASE(test_no_write));
++  suite->add(BOOST_TEST_CASE(test_get_underlying_transport));
++  suite->add(BOOST_TEST_CASE(test_message_size_limit));
+ 
+   return nullptr;
+ }
diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02.patch
new file mode 100644
index 0000000000..5f03f64346
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02.patch
@@ -0,0 +1,78 @@
+From 702d00f9053133aba7186f2dbb242a91a1ddd491 Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Thu, 21 May 2026 22:29:35 +0200
+Subject: [PATCH] Add consumed byte tracking to ThriftZlibTransport read
+ Client: c_glib
+
+Call countConsumedMessageBytes() after each successful read so that
+the pre-existing checkReadBytesAvailable() limit is decremented per
+the transport's message size configuration.
+
+Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
+CVE: CVE-2026-48586
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/e3c8c534cacdbef039f4bb0bcf4b2744a982e3bf]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ .../c_glib/transport/thrift_zlib_transport.c  |  4 +++
+ lib/c_glib/test/testzlibtransport.c           | 26 +++++++++++++++++++
+ 2 files changed, 30 insertions(+)
+
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_zlib_transport.c b/lib/c_glib/src/thrift/c_glib/transport/thrift_zlib_transport.c
+index 32f1ba27d74..459d08f79bc 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_zlib_transport.c
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_zlib_transport.c
+@@ -238,6 +238,10 @@ thrift_zlib_transport_read (ThriftTransport *transport, gpointer buf,
+       break;
+   }
+ 
++  if (!ttc->countConsumedMessageBytes (transport, i, error)) {
++    return -1;
++  }
++
+   return len;
+ }
+ 
+diff --git a/lib/c_glib/test/testzlibtransport.c b/lib/c_glib/test/testzlibtransport.c
+index 04e368ffa93..531241acd7f 100644
+--- a/lib/c_glib/test/testzlibtransport.c
++++ b/lib/c_glib/test/testzlibtransport.c
+@@ -214,6 +214,31 @@ thrift_server (const int port)
+   g_object_unref (tsocket);
+ }
+ 
++static void
++test_message_size_limit(void)
++{
++  ThriftSocket *tsocket = NULL;
++  ThriftTransport *transport = NULL;
++  gchar readbuf[4096];
++  GError *err = NULL;
++  gint32 ret;
++
++  /* checkReadBytesAvailable fires before any I/O, so the underlying transport
++   * does not need to be connected or contain data. */
++  tsocket = g_object_new (THRIFT_TYPE_SOCKET, "hostname", "localhost",
++                          "port", 9999, NULL);
++  transport = g_object_new (THRIFT_TYPE_ZLIB_TRANSPORT,
++                            "transport", THRIFT_TRANSPORT (tsocket),
++                            "remainingmessagesize", (glong) 1024,
++                            NULL);
++
++  ret = thrift_zlib_transport_read (transport, readbuf, sizeof (readbuf), &err);
++  g_assert (ret < 0);
++  if (err) g_error_free (err);
++  g_object_unref (transport);
++  g_object_unref (tsocket);
++}
++
+ int
+ main(int argc, char *argv[])
+ {
+@@ -226,6 +251,7 @@ main(int argc, char *argv[])
+   g_test_add_func ("/testzlibtransport/CreateAndDestroy", test_create_and_destroy);
+   g_test_add_func ("/testzlibtransport/OpenAndClose", test_open_and_close);
+   g_test_add_func ("/testzlibtransport/ReadAndWrite", test_read_and_write);
++  g_test_add_func ("/testzlibtransport/MessageSizeLimit", test_message_size_limit);
+ 
+   return g_test_run ();
+ }
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
index 45eaea5c0e..0d804b9831 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -19,6 +19,8 @@ SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://CVE-2026-58389.patch \
            file://CVE-2026-58662.patch \
            file://CVE-2026-55969.patch \
+           file://CVE-2026-48586-01.patch \
+           file://CVE-2026-48586-02.patch \
            "
 SRC_URI[sha256sum] = "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5"
 
-- 
2.40.0


