Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0106CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:04:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9551.1790856292139105397
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ii/50+SW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691BkcT92606406
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 12:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=qoRAzjFIz
	58LillS+yyrDl7eA3yttfNm8S3SyxI5BQk=; b=ii/50+SWB0ORri9MnH3LHbbZA
	eAdbPkTY/xJ+Hfyb68QV6FzezmX1EXSpIxDfI6+G5StoNvImZbceoi87S/Ur9auk
	4mggF6muZMwsoM8pjiGzYgKe+Gf//1gZfhQa/PazR/PqjnhjwRNhtsm5OAU3aYE3
	p5NCdSSjiMf1jcCucMFcAvaKRMpEdaItvVVimqsJ+Tww1roex+s6XQnZWBLLdgXm
	GtQBkb/QiXQ1w3zEhrTPJeuIYeJAWNA+VvD/odgRIvSX1iEflQzq/Vpl0qYJfalI
	UtKOt4o3+Pykr1j4mt1SUp5jCV6gyjRK6fRSmDRKKu7dwTLeDAzTq9y717sWA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022094.outbound.protection.outlook.com [52.101.43.94])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515gx5x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:04:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrJ1+WSKWfDyrWcWRGxEZ5a5Del1GYHpwlqUUdE2g5yBcNF2wIi9LFi9FULNEoC9EAakhLBLpMVE/+iVEzidtbG735Hn3BjfXGhxw3n8js/hIfjUrV/3nUXXGMoQNrAt2wBOFg4YYBSkSxDCsuSNdQI1H/ON+B6lrGxwd3nU5f70AMr13bhtTfrJCCYUYpmfUInV3h5IaAG2DZ9VZCPvEW+mKzrUhsAx+nx5JbpWqKEqvUGbQpbz8sQTrShMJOhfQK9jx0bQhceCMHL2fln5KmQ7TYAlP9FUXtuLj5xc8NYCw1SsZB+JLRebafSh7FJ+wZrX48xwhCsKDI0N3Fb4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoRAzjFIz58LillS+yyrDl7eA3yttfNm8S3SyxI5BQk=;
 b=NpVUifHBgM+fycM2J038jHfYg1tbqRJgpTHijvOKd8wjHiZ2kcR4D8xgsnxhn+vS5Tatfo/nVWBhnWn4Jmzw4X1V6+HOKdKtK3LrYoGfq1oIFTm1RZ3KSzlY/FopuGiVDFP9N74D/C/9oSm85k9/Ue9NBY14+eGV/9OYF9hyl+NSlTcH5eX2AZMraxUocRVDJmhIaLbfIiags5WC0LQUH1mVizZJQrnb6BTlq54+vxAHzVOAxHWFPSHcowZQQ/XJ+dJoQvYdP2IDA8y1+z0ZGL9ARCWnVRERhoeFtwtq9tOOQ12h8DAzbaAfAERswUWCkg5Qi3cCWX3cqySjmrLCgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:04:44 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:04:44 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 00/11] strongswan: fix
Date: Thu,  1 Oct 2026 17:34:06 +0530
Message-Id: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d02bce-1e15-4180-1a93-08df1fb42e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|10067099003|11063799006|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	kh1+C7IvI0AIjQiD7+1qQpPZtOc7VO2yMwU/uHBJKi/XvgABueHE/i/Yz/rxWAyv8y7G+xw4ACu5kpd43kHJv2og9frQEefNh9btg3bO5OtH+d3y6wN2Gcjs2wLwN/6ustGgqaF6bc9udPAndTqE5h4i3Y3ARFatcAYXZvjp1TCz992r4ePvoimupQ//AegPTR7Fpo/U1uPJP/nf+po30qRl8M/s7+HHr0DIhD9VltxKyJTolkYIW1I3pXhO6sSlUeh0Z33+07sULEgE/F7BUhtMMpwf4ciG0Ngi0EsF90xCWDsJY9UhEHOVerbv9ZmKQdPza6DzWDQfoWFQsJSA7EpCcqUaM4Hf1M6jJWmVwx9PjKOGgiB8FJKPhJ09lxPu9mlokcxffroGfzo8MyqPxKSDf5N1OMmsx55tPd4CdGRg/DluDXhVoboNrVLbonnHGQorKKV+8zUsXNjbXWrIOL4D5qv7OdW1O28N72mZAskS0F++J7SRXXbGBF4B9r8rthWcvX+OMpPbtN3SuBfktVIf/ehTS9E+hm0AfM0hJFRUzlkOQhij4eazRorpDhhX3dfcPSYJZ6ezx0UDNekjYhVN5cC8OEEsoCjaPw/D8WMgTl6PHWfrNfcVZ8r71t5wNSXaOkdHFhraAKQkh1KChiwvQbCgKz2DkruH9WjhO2U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I7Qcg5hcms1MKxwJRzDaYPfQYVS8hXEKlQY/pYx07bePaFhIarH71EBmtjmp?=
 =?us-ascii?Q?eaI7/JNO8C5Qzq6PBAvYnWzoRdCJKBbKG46l3V2xtnsh4Qu4T9cl+MP4EMp2?=
 =?us-ascii?Q?iF7XArMfzOZPlPc6/ekurI1HxTDpGBlcQWko0QRhF0H9vAN7BGYHZ20+V02I?=
 =?us-ascii?Q?Dx6BaoAo8WaJiKy6QhQD1ci7W5Vff7fK2JXBQlAzSHScNuwP2wxehHrw5eyY?=
 =?us-ascii?Q?3vPT75YkRGcY6ZZ3NNW5ZcDfImRVLm0aPAFM3SI4Z4ZmVAO89a2zDV0467+I?=
 =?us-ascii?Q?X673aJj0rjGarouVvgTuNv+aj+YYeBJ01jChX4CdSpuMtqvbz7OstGB1Oi+X?=
 =?us-ascii?Q?oCEm9m3wcvAaHmLLKHu85Tf44rbjs7HnAtagRxCKFQgSFdPc00QlliIsUPtg?=
 =?us-ascii?Q?EZSOpy/Iwb+8zTRWXR4oKPI3HJU51xMLu+90H98LSmmPT/h6M5jqtsye32lB?=
 =?us-ascii?Q?bs2ZvrExaZ2kRV9jDYJpuSUNrCpDB35LMflyK/BHxSvar+7DeOEkbwN+Rg8b?=
 =?us-ascii?Q?GkJfJDjGDKa8PyirR6xQNAsPUeKFMuMq2a/uF6F5v+kFfTtaJ0s+ygB/Uddo?=
 =?us-ascii?Q?CL464sMQPC3760DkBbMbdkZRhyJQcJh9DbaCiXLSd1EPavSnQ+313/lBmf03?=
 =?us-ascii?Q?IvnZVAzTTdaafAmP7CfssPLrGwXE2A/5f2H0FcU71KoAcda5HpiECULbFOoi?=
 =?us-ascii?Q?EyCSaeGQxEQDfI1fECzMOqSEh7g3Dg59m7X9llUGWBDjqB4nAF0nepiRoffe?=
 =?us-ascii?Q?u38uT5GZuZRcaEyfAvfEgDHRdP5g0tKWXsln2rEerwNWVyOwBsfUiZemAlL6?=
 =?us-ascii?Q?l+z0h4rp/2JHlpKG+YKg9xkW+O7H7yy8bUrhfSzqapfloVtfICO+sPqpR4Ek?=
 =?us-ascii?Q?vl0uTggS1Y81N84hONkd6+LV5dd3I2GXxFH9qYaOipbI6oUlQt+j71iHM0n5?=
 =?us-ascii?Q?REuWVFXbM2P44zZfRJEyfpJg2k4pMzbTE0KnQ9bKwVJDykL1t9+EA6p+8sj6?=
 =?us-ascii?Q?UiV4kF9ZRpIixgD++d7BU2dSul3W4PNc0PvDiumBWX/f64kc8v2OFjBg2TPA?=
 =?us-ascii?Q?Je0sK1Mfg5n46OoW4kb8D/B9k+UPnSFHZfugWMsjV9yDe+Skwao341a55ZG7?=
 =?us-ascii?Q?TrWrNk1/dPxMD0o0gpoXdeedSthQ41CmcBxHR8HnPUoglwFSoqU/S7e0gH1m?=
 =?us-ascii?Q?EuM+ZRhPSINW2/9lUOonNaFAaup3QkwaGPuX6IvImaYSfghzzH3EfRNq2/9b?=
 =?us-ascii?Q?OWe8bbm28YpchFBCQh4EpGxJ3jWAkFKHgqUw4kUWHHvkNwhJloFEpGz77e4o?=
 =?us-ascii?Q?9afpHcNDX9QL1F3ToRA6IOcqfI5PrPvshVLypHiaZrP5DnT9UOCRYYAxUpZq?=
 =?us-ascii?Q?pwQO81TNGPKPTI5HFChEtyr11sd77DOaLKlvNTD0OIt4PWvKcGQ0PhokbY+/?=
 =?us-ascii?Q?DUfuW7wB1un3V83a0NEazVIq0bcOuT2BN+kfKqfGzezb+I+6i66M38GeKpgI?=
 =?us-ascii?Q?lPURgKROC2Dcrn2dl0Zr42FEymPSy3TFYl2F9XHr25+QtxqIF7aWJVnK15IX?=
 =?us-ascii?Q?bde+Qh5cG3ieuDd4DB731WeR3YrncyC4xdf7BMfz3vCPvbzjlOBwAvRVEBrT?=
 =?us-ascii?Q?qE019HJpRWtCeqeG3Ai/DEgpEo/6p6B3ZrjQvhkK1G0iF/C4Mz01J8Sli3sz?=
 =?us-ascii?Q?yAxcoDQizGvtH3C832Z3+fecnD1dFCKHpa8smXEMdimg+zD6sxhd/QYnEOEM?=
 =?us-ascii?Q?zLPNDdrkrpXDGdUcjWoKl9XaneEL5nW/oUBt+YjNObm2iZCd6+WV?=
X-Exchange-RoutingPolicyChecked: 
	jh40bWpOvFbg6ThcHccM1TxpdXER8OAmrr2NDc+lcWEZE2Z/A9VsWn7+kLtjJKyeT/LKlk9Dhy8KFTKa1N+r/4ASZBtwYtgJes9sqIKHqfkgNUnBmtVT0OwtYO3yO3hhzVfTlSCXHfLuxk8YP5Zv0UQeITzFiHcWYz+18csx/I7iSEM2ynkYUoDvjvugzTu8yig6ICBzs3C5VkWQzbx9IdIWx+cX5rdgZ7pJIxU6htgsm9B5xsgMpSz4Lmc+5qtBlULURsTWJasP50RUxY4khBu0UvXDrldwrEohGKaCgm4D+Z7rmlZw9ww7gipTc213GdnBHh3A9zKqRhe5LMXF7w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d02bce-1e15-4180-1a93-08df1fb42e02
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:04:43.9077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxjVlRB5B33ybhArw7wbejL817fAyUGyf1BXurUlxy3i33C9vNKRKCCwMmUu6JMYWLMIbddnB3r3KgcLz7le6Wetrk3inrqMq9kk+sulUHc+mLrqmS5BqH6Q3lSJirjj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX11UcEG4hIwCs
 yBbhHVHP0dm+HWxPdlsF/c7wBYHAPtPf+4D3dJVAXf3gi1wsoSyL7/eo3g0vEOusTjfuTMTu26t
 8qHZ0JFDr5FkfuABPuym0Z+yz0J1uLG9QwXugEFhg5qaO6vus8hP
X-Proofpoint-ORIG-GUID: J1ESCgBt2qOK0x-WIo_cdrZa8sWGbYb5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXx8+8yqpZ7GRT
 dqqN7hee7BlDR4WdII7Phn3uP6Em+kEYt/HTCkIyURUOtzXd4SOPEIcKol0yYMmC3teOssTcpLt
 tgLntW3qGM5VUA3lurxhjUy6ueJ8Ve+zz6VNEGy5jxXrEnOMHTYOln93yOKw7N03fJ+PZul1u1R
 CBfCDSkrUuFxCvOKzFiZaGSMlm/YsKwRySt0f8cGUyktUy7il8LGXMbS0f9LxiKPjxiBt/C1p4q
 /IZl5AKWwnTfFexA2+lwOK/OV8UxaCCqnIzH+R6BN0fUtO3yzcjnL2Ol1HcpFR3DLQtYXFT/E3T
 cr9QGBdVYWGpYCsctKkPhSjlcc+MsAdr38OYYcxqctt/U1qmI3SfxbK9etVuFzLw0KUzVO954y5
 rSu0L8SO297s+LjF2u/tNChmcygiChBzqpEkhw5tzbVUFv2a0PEcwOdHHmtp6DYFoF7wTHulllX
 7jZfGz/bQkkXDeo+4tA==
X-Proofpoint-GUID: J1ESCgBt2qOK0x-WIo_cdrZa8sWGbYb5
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6abe4c62 cx=c_pps
 a=13WRnYNq68uQF2pe1ZmaJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=KiMCiSwjAAAA:8
 a=m9zgyrl1kc8Dps_KljAA:9 a=sPCYT0qwnquSfqsKqTDE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130581

This series backports the September 2026 strongSwan security fixes to
the 6.0.6 recipe in meta-networking. All patches are taken from the official
strongSwan security advisory archive at download.strongswan.org/security/,
version-banded for 6.0.x, and all are fixed upstream in strongSwan
6.1.0.

CVE-2026-47895 is already applied on this branch and is not included
here.

    CVE-2026-78123  openssl plugin PKCS#7 expired pointer dereference
    CVE-2026-78124  openssl plugin PKCS#7 certificate memory leak
    CVE-2026-78126  eap-aka NULL deref on AKA-Synchronization-Failure
    CVE-2026-78127  libcharon IKE message logging memory exhaustion
    CVE-2026-78129  libstrongswan encrypted PKCS#7 DoS
    CVE-2026-78130  x509 attribute certificate verification DoS
    CVE-2026-78131  x509 attribute certificate identity parsing DoS
    CVE-2026-78132  x509 ietfAttrSyntax ASN.1 parsing DoS
    CVE-2026-78133  libcharon IKEv2 rekey-collision use-after-free
    CVE-2026-78134  eap-peap/eap-ttls inner auth propagation / authz bypass
    CVE-2026-78135  libcharon early CREATE_CHILD_SA auth bypass


Abhishek Bachiphale (11):
  strongswan: fix CVE-2026-78123
  strongswan: fix CVE-2026-78124
  strongswan: fix CVE-2026-78126
  strongswan: fix CVE-2026-78127
  strongswan: fix CVE-2026-78129
  strongswan: fix CVE-2026-78130
  strongswan: fix CVE-2026-78131
  strongswan: fix CVE-2026-78132
  strongswan: fix CVE-2026-78133
  strongswan: fix CVE-2026-78134
  strongswan: fix CVE-2026-78135

 .../strongswan/CVE-2026-78123.patch           |  53 ++
 .../strongswan/CVE-2026-78124.patch           |  36 +
 .../strongswan/CVE-2026-78126.patch           |  39 +
 .../strongswan/CVE-2026-78127.patch           | 117 +++
 .../strongswan/CVE-2026-78129.patch           | 157 ++++
 .../strongswan/CVE-2026-78130.patch           |  51 ++
 .../strongswan/CVE-2026-78131.patch           |  85 +++
 .../strongswan/CVE-2026-78132.patch           |  77 ++
 .../strongswan/CVE-2026-78133.patch           | 622 +++++++++++++++
 .../strongswan/CVE-2026-78134.patch           | 711 ++++++++++++++++++
 .../strongswan/CVE-2026-78135.patch           |  74 ++
 .../strongswan/strongswan_6.0.6.bb            |  13 +-
 12 files changed, 2034 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch

-- 
2.40.0


