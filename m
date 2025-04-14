Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B309CC3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 03:21:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41994.1744600890973899358
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 20:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61992b229a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E2CYJ6030659
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 03:21:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58hhga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 03:21:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGMOefKc/UHVzGM85LSEwCQirgTwDKlQmVVYwjp4p1Gtq4e9m6JZXVWf7D2lQIiy/7W5N0yxrIaHUvMfEEAALmH/NDQQAZIx4slv0EP1CTa+pZX6E16Qiz7e15TyktKyF2PIYsdE3/UcbCmVaYFb+ajZKid1Hxn+ajEQDaGyao4EsHn5ZxAP1wDxMnIef1pPl/7dbDnjRo62hgBndFEog7ZGaCYF8nRfl2n+dBZS9ZN159roqa5mBL7ivrrYos/GPer9+H97LpWnvFUmxpzfQTo1vZQ9sLb/XiD1EKgyGhYjCrgH6SGLGzaEBz9uhnqbDAr/fyApyKXnqMW0k3Ra4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ymgae9fr1c/4u5htVL9NGfBFu3qLIf+s+zDQU+7Fzzw=;
 b=FOa/hcbXpB1rep1giwiJrsZPlq2jWqTsTSB6acSX3xHo1m5witTe5bD0L7X8fKkjwzFvugcxtucDKqKaE7SgiF3PcDqiefCgXhlB6KcFSup6wfujxBwGJudJ7U/IraWJsbhOnj85HWKPxfjzjblCNd+y/NQI4AKZOq4ymFiVNAhHv+b8Gg69dnD5+3layrf3WLxngR7NvbvvK8Wn7zkZsTdWOoj/tMqJR8TzmHKhTJyE12x/7LFUUznanZc7SEZmwLzr1Y+VLWsBB1P9l5UHNMNQE856x05A56UnnndS+yjf8uk5JbdYu9qD05u+kpN9HIPiX9Zu89D+9qmsX5GlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH8PR11MB8108.namprd11.prod.outlook.com (2603:10b6:510:257::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 14 Apr
 2025 03:21:27 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:21:27 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] lmsensors: Clean stale files for sensord to avoid incorrect GCC header dependencies
Date: Mon, 14 Apr 2025 11:21:12 +0800
Message-Id: <20250414032112.3634953-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::13) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH8PR11MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 7acbc47b-8d3e-468d-170e-08dd7b03714c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dEpYbW1IWHpVekpFZFRGd1dQNjVnajVWRFRTbWhSejcvVldaNmtQRjlkU25L?=
 =?utf-8?B?ZkExRGl4ckl4MlFkSDZCNGd1ejhTLzdJN29mVWdPL1BJY3Uyb0xtNCt1Y1h1?=
 =?utf-8?B?Y0hhUWxKVmE4MDdCbnFtSHJDeldiZko0a1l4Y1ZrTUc5Nm5KSCtNdDVIb0Zz?=
 =?utf-8?B?dlhLck5EMjl6TlpRUXBoWFh0eFo0dE1TaFFEeCtLWWUzSkVDTWgrbjE1R1lk?=
 =?utf-8?B?T2hCdXRIU0dSUFhQZDBtRjZBbUpSSFVCTk13MG4wUTVIMUNDSGE3cTZUU3lp?=
 =?utf-8?B?ZWxiKzFxenFSTTNMbkd6TVIrLy8vQ0ZvbHBYWXIxa0lPZGxqbVlFZHQvZWRq?=
 =?utf-8?B?d2IzWVZibzlrWlhBcVVvN3V2VlpiSVlUR2JSUzY1WE1PWUxLNEFjRUJmSWE3?=
 =?utf-8?B?M3BjY1d4T0Fmbm1qaGZ5RGF2cTJJQVBoVWFXTzZ5M3RBeTZMUCtIRG1VV2ZW?=
 =?utf-8?B?elZJZmwvYS8reGlYcU9KNkxISFhwQWdoejNqdUZ6SXFnMXI0T1VXVTBGRXov?=
 =?utf-8?B?WmQ0RkhkUTNrRUQ2VTBuanppdHFQbWdpeDZHTkRnRXRWdWUvTExLWlVnYlBl?=
 =?utf-8?B?OUl2SlJ4d09JSXNjYnk4S1o2N2l5V0VMM2gwS1BQbXN5UCtXa0pIRGp5NWUx?=
 =?utf-8?B?ZGlsLytVczVvaTZEMVMyZUdDUnpaamwwTk1UTjJVYmZya0pCNXhYaEF2V0xS?=
 =?utf-8?B?dGI5NlQvbjh5dXFkdDNEenZuemdENWpDeEVzZ2l6N0swbVRzRDFJa1FFWEd3?=
 =?utf-8?B?MFlia3RvWDl6bitRWUF2cW1iaDhXWGVOb05wVlRYdWVZdERvcG5WSk03SWdj?=
 =?utf-8?B?V2x1aDFBenlsb1ozalRBczBBRUVTNUJWT2NWUzMxcy8wS2dsbFUyNVNBQ3BN?=
 =?utf-8?B?TXN1SHRGZ0VRQndSUVh4M01SMGhHV2o3RGtuTXlxRmVVbTYya2xFai9WNHdG?=
 =?utf-8?B?UE9IRCtYSGJlWFBtTXlpSWhvR3Yra29zMEx3WVVUdnlYMW4wQWhvVEdNWUlZ?=
 =?utf-8?B?SU1yTkhPN0h0SjQ3dDBYZHlIK2IwazRBOEZxeWorRCtyUHdkblQ2elhOclBS?=
 =?utf-8?B?UVRIbHVsWXlPd0I5Y0tUVkkxQjJlSHJneUxoYkF6THdVek5oMlUva3FPeVlU?=
 =?utf-8?B?SXY0Vi9USWsvWnJRSDZzUVRaL3JlYXJnc2lFMXcwcnI2TFRkL0VKRUlYK2Fy?=
 =?utf-8?B?NTJGaHhla1NHazNaS2pzaEsrQ09mSjJIQzdnOTgxbE9qalh3cUVHcDBKU1BD?=
 =?utf-8?B?RVlCdWsrSFNhMUFJTmIrend1TGk1bVYrTEVDN1EvZEpqYU9ZbkJac2hSOHJH?=
 =?utf-8?B?OExDSHMrK1paTDR6MDA1bXEzRVhCUTdTUkVJRmQ4c2lKNVRweEFOL09VMjVk?=
 =?utf-8?B?SnpHVmlMcHZLd1pxMURwSGYwZWNVK0cwb3dmMi9PWmZmSnIxRCtyTk83bC9a?=
 =?utf-8?B?ZW5IOE9QR3NPb0dMQVRaaGRheGUrOWZidXloTVVKbkZPNGFKTGFsSTVPa000?=
 =?utf-8?B?cnNMSFpxMHc0WkJ4Vm1jTHIxTGRqUXFaZXFKa01XZ0I5UWJSQUU0VkN3cDhK?=
 =?utf-8?B?YmYzeTZXMHZHMlpteThPYnFtM3ppL1gyNlNJREM5dERSQjZSTEl0YjV3Zjl5?=
 =?utf-8?B?eC91bHNLa2JUdkZ1b1NROGdCRXBBeGhyVUxqN1dORW45SllxQStNTzAwOFQ1?=
 =?utf-8?B?RDJxT053enBmcFladmxlREljQXVvVGNxTnREeENJSEpoNGJmNmZPWXM4bWl4?=
 =?utf-8?B?UHRVTkQwMGw1UWhNdWdnemY1RmM2V2VkSTdOWjVSczlnUGkreEJwUGYxOWN4?=
 =?utf-8?B?NGJIejQ5T1VCTVZ3N1lOWGk5VWlkWDB4ck9ibGh1WTdNeVJCUE5VMVFqSFpS?=
 =?utf-8?B?T3F1SjdDd05wUnYvUVUvTS80bmZzNEhISTRxUXV2YWFGR1loZENtT2ZzUTlB?=
 =?utf-8?B?RWdyUkx4NThYOFloUkZpUjNuU0k4cmJtMDVlb1ZFVkQyV3U2ZndRNlQySGNi?=
 =?utf-8?B?ZmhDY09MNEdRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UitwVEJFKzRmQnQxNkxaMVFkR2pnNHpZUUVXQlU2RWdseU1MU1k2ZEQ1Y0Nr?=
 =?utf-8?B?UVN6QkRtRXdRS3drYVMvbnNocWF2QlBLQXRZSXlKNXFXc25yTzdzdzVUckJQ?=
 =?utf-8?B?OWlFRWVoalhiRTZRZXhleHYrejRhOHAvYy9MMWZSbCtmYUJwcm1mMkYyWU92?=
 =?utf-8?B?eG83ZFRaWDRJV0dsc2RTVkt0NFJWWmE3bzN3NzUxdlY3WXFWczM2V2hPQSs1?=
 =?utf-8?B?WXVTZWhGRW9tc3NXQXl1Tm1MUS9qSTJxS2VzdmJHQkx2RjBCU2pNbm5lTHFj?=
 =?utf-8?B?M0FJdXFGbjNhT0NqOFExem81a1hLMjdrL0EyZXc0Y1RZMWJPZlZzemlPYmFR?=
 =?utf-8?B?MXJtTnZvUFN4czFTZElmU0VHak1adE5rellYZnhCd2lTQ0p4d09GRm9pb0lY?=
 =?utf-8?B?eFU0dWJCOW1adTBlSU1wTDEzQ0R3VGRicFR3bWpqSjBUa0xjWkpNOW9LalBP?=
 =?utf-8?B?dG9wdFBKMmFJTDNlaDBOZ1R3dHVVdy9KMHNyWUszcnBLbGVlWUVJcFo5T3dJ?=
 =?utf-8?B?NUl4YTl5dStiQkM1WkIxZEhhaGh1S3pHM2UyTmJuc1N3MDFHaTJBUlFGYkFt?=
 =?utf-8?B?eVdQYWhqeVJNdnRZQTRyd3IzdklKQnBEOVFveXcybnc5Y2tkSVYrVnpRZEdz?=
 =?utf-8?B?OVJaVDdQRnBJY0NzOWhULzZDcW5BaFd0elNDN1NsOXVzdlR3MiswaTVDTExl?=
 =?utf-8?B?bG9QSlYyWEwwblR5bFNlcnRra2VIanNCdld5OXJzbG1PL3E1b0w5U3kzcERr?=
 =?utf-8?B?SVlFYnQyVDhTZXF2MUdVcVNUbjB4OXY4dW13SFZybmkwT0Nsb2FtUVhtUzV4?=
 =?utf-8?B?ajVuZkhIL3pYQXh4dGZaaFQ5Y3BuSU5XUU00WlFRTE5IcS9temJrbXhUL2RB?=
 =?utf-8?B?dDZwOW5UaDJrMm5FZmtmM2xGcy9HS2I4YkkvbXdkaDB2UVd4N3FUVUdrblJz?=
 =?utf-8?B?TUtqcjhzWElMNUtYbVYvVVFGeDlUWUF6Z0tIRU5CYlg4NmpWYkZaSkhMMmRj?=
 =?utf-8?B?aDQ1U1FXWHRiRXU5RDNBZXh3ZmdVeGx6NkxlWjliMXVaRGhZdy9JMWFJTks4?=
 =?utf-8?B?QU9yUUFSQUc2NXdWeU56Mm5LUjdTSmo1Q1V3clI3cVo1am9wYlliRHQya3B1?=
 =?utf-8?B?b0hSM3ViZlN4eUxnemFQOU5nU2RucEpKNkRubUNiVkw3dHJCT0ZNc2VnSm9h?=
 =?utf-8?B?a0YzODUrWHdIb1NpNjIwWHFqMzQzVWRQQXZpQlk0YVhvWEVDRURXOXVGSml1?=
 =?utf-8?B?eWwxWlA4dHd3MjhDdFJxOUlOWnkwOGY0aWE5b3Z1RlUrbERWa0owdkhvMkkz?=
 =?utf-8?B?QjdkdUc5c1RMSXcwa1hkVUtUbnEzS1VnZDVMdDlSdloxaTE5QVFuWjJ0OHZN?=
 =?utf-8?B?VncySnA2MHptbWRBRUVPVXNjbUVMYmx1b1Zka3FVZk03d0tZSk02Z3p6TnpK?=
 =?utf-8?B?WldLaFVzZ2ZvdFowOFdCRnI1eGorQklBZnNRZTJNS1pXb0I0THFpakhFTVhh?=
 =?utf-8?B?UTNNRFFJKzEzcURlN1ZBWTdHWStUdytCei9nYXNoQUpncnQxa0QycU5zSEhL?=
 =?utf-8?B?SmVMQXUxTlZCOU0vbFRodzBHZE5mY005TnFGczFwbUIxZ3czWVdtUWppemEw?=
 =?utf-8?B?cUVYQkhCL2dyRG5qWVo2Z1RaK2VMRGRvQXZvTFZvaUNZRmR2emNmanpDd0lu?=
 =?utf-8?B?TmYwRllUSzNHNkVFU09Bdmd3cXA0OUdqR2h4Qm5qYldEM0pORktZTTZHbUJH?=
 =?utf-8?B?YjlNVnFjVVZrc3VtclgrL2JqcWRIbUtOMzRpTTJzaExkbFNaNnVZTkpGL1Nk?=
 =?utf-8?B?NGd3ci9XVGduN21QM28yMmFRUW5JMUFCVG16MEIwc2FYZW9zS29ya2tyVjNh?=
 =?utf-8?B?SW42SVFyM2NqSktFejh2cDJWNWVsMWhXa29JRm5QT0FsSWRnZDhFWXBHQUZt?=
 =?utf-8?B?d0FWaWs2QjQvTUt0NnpxRXZWRk5lb3cwUlg3cmUzdGVqTERMbUhHUm52K1VY?=
 =?utf-8?B?NjZ5bjU4WGFsQ2dJcmFuK29reHMrSXVSRHgxTlJFMjlMeE9mTDUralRVMzFC?=
 =?utf-8?B?WWMwNVRIWW1uWVhUMVNUUnF0Q1NaR0ROeDJ2c2JVMW5qWm0zSTN1K0laeVdM?=
 =?utf-8?B?M3ZMWS9Ed0Y0eUhYNlp3WTVQTi9NZWgyKzN3TUdOVzhVY2RHSk0zWWJHUWg3?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acbc47b-8d3e-468d-170e-08dd7b03714c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:21:27.4678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/Ooc2BT2JVQqaWfPckER+302onzpWql7oNRLaCXaKJietnSIiHLxjoHnFbAxlIgfTED9zLzzZFnRUNuVb7W+FFaE8q3Wnb13Ok8FneBsRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8108
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fc7f39 cx=c_pps a=XlWNgFwcAB8XWrBhwjv7Vg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=AJs-ryozdUd9o3ahdBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: wCQpBB6Ptt2Xf8RPiR6AZoho70WmYROt
X-Proofpoint-ORIG-GUID: wCQpBB6Ptt2Xf8RPiR6AZoho70WmYROt
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=713 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53E2CYJ6030659
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 03:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116840

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

After upgrading GCC=E2=80=94for example, from 14.1.0 to 14.2.0=E2=80=94bu=
ilding lmsensors that
was previously compiled with GCC 14.1.0 may fail with an error like:
lmsensors/3.6.0/recipe-sysroot-native/usr/lib/x86_64-wrs-linux/gcc/x86_64=
-wrs-linux/
14.1.0/include/stddef.h can't find, which is needed by 'prog/sensord/args=
.rd'.

This occurs because prog/sensord/args.rd still references stale headers f=
rom the
older GCC version.
The root cause is that stale *.rd and *.ro files under prog/sensord are n=
ot
properly cleaned during do_configure. This patch ensures those files are =
removed
to prevent broken dependencies when GCC is upgraded.
Also remove the same statement in do_compile.

(master rev: 86b20b84ec278cacf4975b7933d46b894d74796e)

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/=
recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index aba5ab587886..e3186132c76c 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -50,8 +50,11 @@ EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
         LIBDIR=3D${libdir} \
         CC=3D"${CC}" AR=3D"${AR}"'
=20
+do_configure:prepend() {
+    sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
+}
+
 do_compile() {
-    sed -i -e 's:^# \(PROG_EXTRA\):\1:' ${S}/Makefile
     # Respect LDFLAGS
     sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
     sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
--=20
2.35.5


