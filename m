Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EE9D730AC
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 07:00:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6367.1775199616018438979
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 00:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X3crztvs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8553e5715c=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6335TAqB1342030
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Apr 2026 07:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=d5aQxGVWWEN3/2rY1i6f
	u1WGBNyI7R25kH1eyxUxE44=; b=X3crztvsFqaN/Xl5xDmmVqTkrhj8nTU+AEwd
	Nm19S4e3RED1NXFAAzNSRj/oZQpMXg8Cul/GH6+FH72DPtCkVR2Dl/DEkl0RNA4+
	mLNcptVwVyet9HhKRO8tYami8p9sB513Zoq6it7VopxjbhwSvxQGBSlzudJRFpJZ
	SqGpsKlx1EtJ+/B9B7l+GX8OoDb3tVodHa8YFrcMIKra0tAO3f0ZqbKubdVl0r5Y
	WToMQ1410jwBccwY5JY2EOBAKe1+Zf/DUsjo4qOc/emUmj8HhEXhtNmF8IhmLwLD
	S/DqDpJqCitISxVUckE5/nOYvP7HBsujpqRHvf8Co7tdVeQerg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d646w123t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:00:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNTFuCJyTgjwKty78BVZRILUmp4KbNM4PU/7HPmC46vEut9Cp0lyAQx1xDXtYRISH6xHhhCm5/+xOBG7rJV1lb/4tuU63v4MuhaDuDGxc8/eETYbSxy2axAECGk0kPklYQDWIDEG01+axMjd7xXMyL0sYy66QIR7RnbTf+YNV2ydzmWl1jvTTEXttBTsB+NDz6a8u/dX9H1pOuIqxtNHBgVVDvkwnHGcAwqaKtaB9MK2uB39mXUmSUfyc4ByFaL0eLvFAGql+TqFu12bfKUhQpohTgxRUqdJV1WiQ2EQk0EMdUAijC65PUZN7y0hbgNCaNPxm+w36/ltp5w3f7RQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5aQxGVWWEN3/2rY1i6fu1WGBNyI7R25kH1eyxUxE44=;
 b=kjPafGoK5KvkPHNEUyCRB0dVBBaK/pNGCy5JCpnb6jcWI3/DX9zVn5AtyDkUDTdB+l4K85TmZLZAhkYAwSRL2Zsz0wnhzIBXuYWG86E3raG8sdfQL+Ct5SeJNNPDYAKvW68xJvhjsJwFxoCioY/2md9hGZNeAic0O1FNCfTuztmq/E6zNDOeB46yqq1aitq05pyo5ObQknzwGs1AOdv3QFT/uq4JBgfjmO5/HZz9svrTQwBgE07SO8VfeLnGelA1snbcnAqxJvUHk9ow364/eA0Jaq1ItxtDD5Rd9Y3VZ0kOLNJmtcVQmlQ+gtlFwaBtU8G7FTJN9dRA7FGJzbupeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA3PR11MB7612.namprd11.prod.outlook.com (2603:10b6:806:31b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 07:00:10 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 07:00:10 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dlt-daemon: update patch to fix dlt-daemon crash issue
Date: Fri,  3 Apr 2026 14:59:29 +0800
Message-Id: <20260403065929.1430874-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA3PR11MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbfa167-3452-481f-8167-08de914ea550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	8weHSNaUhYAQMxIoojW0eedMMzxBfm+WqfRDpvDZBDci2qi0gRg01TVgnVR7Ss0chaPuMO/r7Yp/HYbTj2PjWLIOcfJCkQ0nBsZ/GvH30hKnBlsUTrCAH2SM8xz/RlD74XHPJeA0J4zJ3pPYwOC9EoQsO0tBGAMfAH5teyPN4R+bbNnOm+i4dZteL/kCKAwzObDdXqVb0bIMl/Js0wYY714xe2Pxead4HUwzObpj0XM9ww5NOfDNjIAviGRXh4Bypx0a9WMYU9bL5b203UCc3rw7BC36ff64IJmYttKdmqaPEbub8R7hNKBR37FbvYNhdALrNUJyPB0DUAb21UR/TbX0fAkKvOifM+TaYHIK+AcE2cq/40ymHfres3UMiuDBBNpKvxQndn3E7z46XlMQB8o+7NnmSiXnynCO9/m33PeGnwqK1FwRE+YTXbXx8ISPY6pfwToW1siYjYmdyxtluaKBZmd9Hnq7v6/+WJoAvOM1egu2LLKkHeEvEs0zySsJQ3p99/rOSaibf5B/0/McI15OJsve7s/+zfhOQQ5SNu5y2PmVwG6drRIgR0O2VKSBF1sR3IvfLlqkFfCvGBL4yx/PrqmIJVEerFAPjCamanJUgkFRAfflFuvUY8G8q7PFoj8i86r9SNB1BguOSQ3ZN3k6xuCx/KNMWu4zoq4N3+ukdGA/wAUK4i/ae9ryizB61cmp8n3N4nt4wPdqQMagI4w4C3ilrCnxbZmptU1gydT7OlvDruh6Xr67XSFVYoNhrj52yfnA+cRNmt1wTSLYHNgWJY9NJOG7gH2WkGm9XYiN5fbSx8vUIogrx+1tbMuk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BWf9QquH/r/GIG5N5VRSWXLx3nc1+lFPPPChJiDcB7O5CH24m9qF1mdTmVb6?=
 =?us-ascii?Q?1RpWlA1liV4F5u/KReR2Stkh/XZmRwjFOEx1JHWR8wdb4o8XhvCJq5i66C4Y?=
 =?us-ascii?Q?ZdcuXoKg0mUUFIZQ0DRUKvoyruUdpJG6ZyLG9dyXlsVmqaYme2MYfRd87ynD?=
 =?us-ascii?Q?iHPnC3BHfTozh3SQmxrKdaN5XR+tAMYFcMUMpCINTW1uDzw2/iTt3+BQmABV?=
 =?us-ascii?Q?hi7wCMAPPUQ/DA4rNR1Iq5S8d3kBufBAilU6A5mDMNih/88Pp1T1uOO3QauS?=
 =?us-ascii?Q?fKeMZr760v+tuaN3ZEdUI/qvNbjv1z3AF14Nbk39Y9xj2PxWPdaxVzgvSZpW?=
 =?us-ascii?Q?jH4S9VVVRWLQdK30tvrE8OjyNqcDY6GP+InjBbbouT1ySQrxTy+/7IqOERIH?=
 =?us-ascii?Q?8HtcvPN7TLrkNeWzc8BfGGWE5lmjy8o3QnbHAWVH5JJaegXMK+g/zaWXng/o?=
 =?us-ascii?Q?gYLWMYNSDZuqWi8G4T4xIfhck9wLObIFPbQPn1xOyr5xW51IEOy8IGP9LWlv?=
 =?us-ascii?Q?NtQAbtRMNvarWIaJHrku3XHuRHWOgbCgp+OnNVZ8/c/i9y8bPTQ6sO2Xl/q+?=
 =?us-ascii?Q?xth4SY9VN3zCx3pJeLjQaljuHJzyt6rIVk4xBguFequei+GoBNW7vHIDdFWY?=
 =?us-ascii?Q?gzc5+x3bRu1BCTnx9CYJZyo33bRn8jj0jZh5XUbSU1ADBImURK6i8JReFg4/?=
 =?us-ascii?Q?H7wMcRluO8MY96ZyCvQKhvqfcG38GgYjXTPBjB126DhH8OxU8VkLz8EmN/fG?=
 =?us-ascii?Q?EDhMVmrOHPCjl8VtNZAOW1UbRl3meitYM64pza6tcYG7xFrzM1tqtJlvLSLo?=
 =?us-ascii?Q?+vQk2GJiqGuS1/Lfyyuf6mUNRP1xXlIRmD2fz1t+DIFM7BwJi92krrVG2gXQ?=
 =?us-ascii?Q?/3CXPP2uVoiItktQ99LCJgzohp0DL+4s1i2qIzkhmsx+ymkgPUMyDN/pGpX2?=
 =?us-ascii?Q?5vWJrGfqE6qZ3nbmtVBfrXltOcZN8Ur3X2pGEbTmCUmaC5h1JNUvaC+BUjx6?=
 =?us-ascii?Q?vF3ssAfa70DjCmuIonYbNOzCkDKatQ6VyXtX+BB3eaWqGOGLjCuutxohCNbK?=
 =?us-ascii?Q?XRYrA5Y6gmqPY3Ds89PK0dUpvqVtL8ixSv5Me4jdU6ioy1BEmaT6O+74l3o8?=
 =?us-ascii?Q?A1zQUi+WRX2cu8vHc4e5dKmFdOeiVhVfr1QkmwrN+aiqmmGo7jHTlxLlz3oA?=
 =?us-ascii?Q?cnQfw8qpgVQK9u1dNSyIdUuCSMrD72/KfuPR4ds3NtENBtlIVsZHUq/D7iML?=
 =?us-ascii?Q?eGy48WRdP+XswPIfM/g5OmeWSPITXM/TdpkgnfwoVX8zaCi479ck1ZOl81/a?=
 =?us-ascii?Q?LS7MDMy4N4dQYPtM8bMT9AmQDNK7T7hHeeUKrvdvMaA/VReC6z8tuZQJsC7m?=
 =?us-ascii?Q?hW8koJe6kyOUaZguOMtlPgjaMbl/cJhmR6qmBod1DPK1VXHFUpy/IF/Tw/48?=
 =?us-ascii?Q?T00OhVezv9Sg8rk93h6wApzs3wCK1UmybmgoXNjM9iH3Tc8dQ4RX67KcgJKe?=
 =?us-ascii?Q?v4p0yO4Ls20AwdqvnR0ymDoDo/U11Q3HNJVcXco46YqiDW6PDcG990IolSb5?=
 =?us-ascii?Q?nIvj/8n9QFBVlU5zL7T1I5tzmSiXbwIAw6u0to0ylfjj63DixJXaWalpHKbu?=
 =?us-ascii?Q?cN+wjapGAK3vrkxRB1h5B+a7uYmlpbNscL8JuWJ+rYIG0hYFOhNhuHV16Xka?=
 =?us-ascii?Q?7BwPDjVB3+ImpJB29Zjha38ZFlV3ij1s5DAhrOUCfYRobiV/1gTLasR3cAOV?=
 =?us-ascii?Q?MnWtSAaOaEt7UDBrislVw2Sf08osTkU=3D?=
X-Exchange-RoutingPolicyChecked: 
	NBt2XF00agJcWOmLj1YmhbfqHLnOrIvTfpGKpYD9QABAmMF0SFfgQQL6Dv24EHnqL3vjd0W7FybAxLeiBEHQrxeDdW4t6b1l8IAiTFbCtMO3Zhv6enCHaz564CAgtxgYytyCprBsl149xwqoLj0/clUpv7mYm6NzGD6zSNCL8O589u/2z6hZaBlKT9y1YV3XSVsDVKQwAWIL058u3SDgudA9B+znP6BKaL0rZQ4FDYgLsJOPNsiFGuV5PyoulzS7RSF0upW5P+saOOjzdLJOXUEQT0v0WbpPCO1i/z8byq8Et9BWBmsLyqgGCcUq51UsgDQzMwzcy/MfI5ZlD2Hnfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbfa167-3452-481f-8167-08de914ea550
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 07:00:10.2432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Veakl+EhfQDMI0ovRZ7JpAY9Q63Dfs/Qq7vsrod94stYj2yOSew4heJ9Xw81iXbJLjjNm5KNX4IcnJWvl1u6WKHzI8Ivr/MmzT1xIcgDqHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7612
X-Authority-Analysis: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69cf657e cx=c_pps
 a=WFfob/tpvpsU+KY5JpTU8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=SgZi-1eHzZr7Rd7FQVUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qsZD-bEsBwf-qphW5hiV1gOG16IrKaZt
X-Proofpoint-GUID: qsZD-bEsBwf-qphW5hiV1gOG16IrKaZt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA2MCBTYWx0ZWRfXyfPeb5S3BQDf
 mXv8rTmGyZk8FnAXQKja0CWh+5l1uTe8vlZ/3wEmQv4RF85dYnHMnUjQ8xGZDRK4yf3nhbjDwWR
 Z0wQnlCgk2LTltRy4TNJkIE+bQoDs0Eij+bEN+fvtP9OTyisA7GeoGAwj9JnVryklH6ZRsxD/of
 5jnnf5FvEkRwaTwUKao42S0bgErFvDDTM2OAlqDO0oevXp0M2Uu/CIQ+YG7G58uIDN+r+7E7pRa
 a2wEtGfuJz3Qho5T8UpVm0AIy2/FP5iVOSbkCBeGrw5DvSydUSWCcLzwQzfI2n6sEKuuHFNq8rF
 l1BVRYaNGbbV0DtVbtyh3y5SAjpa78fjfA2/Bt7lfyYh/gPPXGeazff0H9lNfka1kw/wIYsiY/r
 iFjT4nPAYqWeWQUNdKlGNzcErvdLrf27uh9R0L577l5bJDsCRDv+QaKiQL/n6haN/gSt8XUS1Jn
 bP8Y1FgFEu8+8o30a4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125972

A wrong type conversion makes dlt-daemon crash, update the patch to fix
it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../dlt-daemon/0001-Fix-kinds-of-build-failure.patch         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-failure.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-failure.patch
index 403d1089e2..ff840b809d 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-failure.patch
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-failure.patch
@@ -27,7 +27,8 @@ src/console/dlt-control-common.c:922:25: error: cast discards 'const' qualifier
 
 Use explicit type conversion to make the build can pass
 
-Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/826]
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/826,
+https://github.com/COVESA/dlt-daemon/pull/837]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
@@ -102,7 +103,7 @@ index 4c40cda8..b3408773 100644
 -        memcpy(data, data1, size1);
 -        memcpy(data + size1, data2, size2);
 +        memcpy(data, data1, (size_t)size1);
-+        memcpy((int*)data + size1, data2, (size_t)size2);
++        memcpy((char*)data + size1, data2, (size_t)size2);
  
 -        if (sendto(g_udp_sock_fd, data, size1 + size2, 0, (struct sockaddr *)&clientinfo->clientaddr,
 +        if (sendto(g_udp_sock_fd, data, (size_t)(size1 + size2), 0, (struct sockaddr *)&clientinfo->clientaddr,
-- 
2.34.1


