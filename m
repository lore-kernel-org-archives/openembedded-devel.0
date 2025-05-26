Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C96C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 12:36:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27739.1748262982605769649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 05:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7241dca39d=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q8VfMj021124
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 12:36:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5391mjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 12:36:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKOT/z6qlU3v4ieXJI+TFWfZ9A+OB0KrCTND5t4szOnA85nSmMW+NssxMJNUuks9QGTxx76NwZo8mwNcDSHtB5iYCuaxYSGGX8dSer/+TV8Np71Ce//OOj31FuB7d17eIH/JDJgV6MWKo1aS/vouwpuqOEIcQFrzo5w+3+PSLr5iL6IXF6zIDb3OJJGvgVoNy3jTiRolO+4SpFZaTDH4gdd/wntCZaj+ZLRIBq3Chx2UhfkNFPkBd3XiqItJJ/XrrSTi7QQnkZjN9eP9Pr3ND87ywJBpyXx0+ENJpbi/GTIqfsAB2G27BcQWFRHloDk7xmYfIwthvvPKCSddalCwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXeNHptuZMJr0gsMfyP5seYWii/21kk0t8YOikJ2VLg=;
 b=nOZNiCgvveNvjjH6TYpzFzZdi/P6w/YHNvQukmqEGfcx+j1zCeUOUTIpCqp/S44OjdMRDxFkwphjP/9OHSTMk+HNje2rPrW2y47gk/IOhAKpp/UBgS384uzhNYYsCchkAAn0VMxHaUPwAB0lrqUn55OepiCithuVa/qIs6PbXuw3/TpyjjTGU3jEK721SQ56JjbvYvyJETyCipZ+dGDxj1wDLcuTwIIe9zahhPY1yppBrREB+DJdnnr9I4atT5+AIpNQonIdJiWAuWM89APM6KGZ+sBQCHjLUKuzTqguKsWeZJwk6HjKzpe5dJAtogfkh2lKY99G/vqxKss48EdWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from substrate-int.office.com (2603:10b6:408:1ec::18) by
 LV8PR11MB8607.namprd11.prod.outlook.com with HTTP via
 MW4PR03CA0207.NAMPRD03.PROD.OUTLOOK.COM; Mon, 26 May 2025 12:36:18 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
Date: Mon, 26 May 2025 12:36:15 +0000
Subject: Recall: [walnascar][PATCH] binutils: Fix CVE-2025-1180
Message-Id: <C790LASD9QU4.3JERVFZT32V73@ph0pr11mb5112>
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-MS-PublicTrafficType: Email
client-request-id: 01263ccf-89bd-a073-05e9-716e6439b403
request-id: 01263ccf-89bd-a073-05e9-716e6439b403
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHBOUjJlN2VybjNYZ0FCQi9VTFRiSjZZOEd4bUFnNkdhb1NtcWRnSXRYdTl3?=
 =?utf-8?B?Mmc0ZlNJZlliOExENE5NSnNQNjdXelcvKzloZmNXVkpCdnFzd2RTY0wvdVNq?=
 =?utf-8?B?Sm80am4rR0FBVmxzU1hqc2JuZk9BZGJiUEUzTXlNUjVta21BN1J1Rk15ZWMx?=
 =?utf-8?B?alZFMElHS0NSdzZTVnhKSlRSbWpPeHAzSzY3bjFTOW5JaVlMQWYvOWtVczJn?=
 =?utf-8?B?UlRWL3hqQnViSmlHbDZFNk9GZUE4SFdtUzFjWWNrM25qUll2MXRhNmM4UDNu?=
 =?utf-8?B?eWlRcmtjL2VBc05zK2U1cDBVSmJZR2ZHREpJaHBQVWI2Wm1uNzFZRklmS0t0?=
 =?utf-8?B?UmlGelp5VytqMDB1cStZVlRIbUh4S254bjdLWUxBVGk5bkV0ejNTdTFpWTNJ?=
 =?utf-8?B?dGdkUnpmbDF5MFA5V3piNXlBWDllQ1ZWa0wwS2hib0FSdFA1RS9LdVlLUnlt?=
 =?utf-8?B?b0R3cG4ycERPVklqV1hpd0grQ1lmOE82cVcrN2l0R3RXTm1qcjlFbnFjYmVW?=
 =?utf-8?B?TFpzOXQ3ZHhucEFtRHFObXZ2ODg4Tm9QdzdYRWhyWWFFbmpQck8vMGRBQXpZ?=
 =?utf-8?B?c1U1NTFBckpMRW1RdjcvWC9QSG5NdC94RHpnUlZLMHpqQmYrQWlMOUxSeDRl?=
 =?utf-8?B?Mi9JZjRUaEt6Q0ZMUnV4OVhlSDh3bEp0cjdXd0JrVExEazI0OEVucEh0WDdI?=
 =?utf-8?B?RVo3RjJRRUF5QkJWUExvZG1HMDlFbzM1YjFiOUdlZjFCM1o5S3hic0t2VWlF?=
 =?utf-8?B?TlUzc2JrQzVXQVg1TmxNRnJXamFTcTVFbjZxdWRDdmhSZWx4eHUyR3A1TDBx?=
 =?utf-8?B?anJ1WW9WY3lZZVV6MUJFSDc1Z1Vab1VndEdvaDQ4RGxvRVYzc1NaZ0NISGVC?=
 =?utf-8?B?cmE4Y2YveGx5NW83eGhtNzRKRU9xZG9QQ0pudWZaT0xxL3JjK3c4ckt0LzJB?=
 =?utf-8?B?dnd4MjRSMnNMTFFUdkVFQWJ0azVjbWFNQnFqMzFmaHZhNWFITElrNUlENlNL?=
 =?utf-8?B?VXhVcTN6eGhHUWxiYS9LLzkzaW1ydjM2SVVkU0I5YUE3ZUZ3SHFwNXc0Ung0?=
 =?utf-8?B?VVd3QlpwaW1xc3d3bk0xcnF2R2R6dFo0bzRhQXZWOCtmVHhZdFJxTTRkWDlK?=
 =?utf-8?B?a013T0ZNQVNwdEtJazN6dHR2Y2liYUYya2NiUWtRM0Z1MEJuaXMxYm4rbHNr?=
 =?utf-8?B?V1V2UHFTWVlhMm1ydG5BU29ITHU0VVNOMkNHUEJET21qdnFWcFZjdWJOT3BR?=
 =?utf-8?B?ang2YUhrRjJIcHNRcEVtZmh4YTE0eG45b2FSM3BDOVo1cUhFWDFMSlJETXZB?=
 =?utf-8?B?dy8wby9vVER1TzBZQTVWNW42WFFmZStRbGFlSEV3aXJhY01EOGZaendVVmVB?=
 =?utf-8?B?VlFHeTJzU1c2RWtmOFZFSjljOXNVZnhtblZWWnpCL3NMbUwxSDYwLytpM1Yv?=
 =?utf-8?B?VDM4dUtENEZ0N0Zzd2xLSzFVYm1Td3l3UU1iemViWjN6Z01ud1ZSa2l3SUR1?=
 =?utf-8?B?bkZ2Rk9HaEw2cDdzRGdMc0VSRTdPUFd2ek9GV2pkVndNdGNiMDlhQ3R6VzNM?=
 =?utf-8?B?QXZCZWhNa09OSGZTVEhSeG5xY0c1NDJYMVJYNkU3NDUxdmt5My85d1J1ZTFO?=
 =?utf-8?B?SEcwYmJBSE1SWFpYdDd6bENpalQ2czRJeUtaUjZBdSt4M1d4YUdQbmM0bDRS?=
 =?utf-8?B?OFRSQmFESUZ5ejNqcGRCSzZqZHdhQU1PRFpxcWVoci9rdS9zRTUyUS9UNncy?=
 =?utf-8?B?K214NVJYMC82cm1hcTRtSkozQkZDK2VvU3hVc2toSU5VUm9TdFBnT2tRTGhV?=
 =?utf-8?B?OVB0cHg3ckRvS2JxQ3l3eFhjL05nS25Vd1FoNVRieC9DQm9ic3loUFFOeXZU?=
 =?utf-8?B?SEg3RkVlY3pDa2VZcmhWWUYzQWhzN3lKRkF0czdCbUZwSHRJRmUycndUVk5O?=
 =?utf-8?Q?6HYybWwiWTo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	a/T6RRrKaGRiyFbGUIWNs/OYUWw8ybZR2Q7PgITu2xXnKnUBFpe8xhyVl46u6j93StF06pVq/h5ZiAzja/3ZlhgqzMjqo1k+lT/ajrEbYvCbB2Hpbc8eU9JxRejUmXCqGc21S/X8/akuP6x2krRZpmc66hpBBdb6Z/bzyrNEg3zy75QC/aAV5ZP/SzHjBo4O4IeeCjcXr4f7XJqqUtpKxhizL9ZhllCnfvarwekxyGZ72vEtBsdnXCUW23Ptmd0W4Feudr2SrO4Qirwi0g1Xx7eSKNlYn1h+URWT2ISHX6FG77EYrfWSfGIPOlShV38VHJbIWAxQHXfRCKrK0vYGNi0tRouy+Zi38NP+aNLNBaCneptc0jaRKRVYtA12aljDWrQ5h3yz+ASe0mqT9yR08sPvdvFrR/EpClrUGWYOI4Q=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-LV8PR11MB8607
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:36:15.7548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
	022f47b6-40f5-454d-0f95-08dd9c51e9b5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEwNiBTYWx0ZWRfXyv4iu508eqtE WhYDSX3T2lqoBshlqyngHqBcdICyPxXLTgbnMBGJdKFuydlWo8WtqyEww4pZ+OTGhLFnoLZkzG8 rTuAr218cMxA70Grn+4FYRE6R0e2qJPCFvnblohOuTjToH0Ojdj7+ldqQ7AG8WxwVS7i7Elpxv1
 EtfYbnc12j+B7SCf9HvNWQaiRniIfaGXg1EXntMS16aszq69CS84CsaPbBrTNIhlBkP6OlSTY2M EBOg5osxsOa8EeW2W2M7l0PgNcIneAJrKRiST5MvBJ05mrYTr18j5NrzfDfRsP4JM9Py+QvmFHA BDraJ7U7iulDGiGqH8SuygqYqNDkQVADyu3xpEwhbfoMLPJPX9C26lwgXrA1zsWaa5JiM3jSiik
 ti1UxWifgev/vPAGRbwEkQzG5SSXmkO5A+Opi69DDXfa9o9/uRjfKxWEVl5zCkD8YREQ/HB0
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=68346045 cx=c_pps a=BVQ1JGnixlASH4+FFkQuNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=8XvLucGswa3-RHWz7hAA:9 a=QEXdDO2ut3YA:10 a=UBSLLtGIkmIA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: toPML02uHmHWb4ySqLLf9FR0XTHax6GZ
X-Proofpoint-GUID: toPML02uHmHWb4ySqLLf9FR0XTHax6GZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_06,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=548
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505260106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 12:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117626

Harish.Sadineni@windriver.com would like to recall the message, "[walnascar][PATCH] binutils: Fix CVE-2025-1180".

