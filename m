Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AFCE7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 07:52:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8864.1733298730636997779
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 23:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20682f46d1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46D324023644
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Dec 2024 23:52:10 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7v920-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 23:52:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9gQ+7jGzjnGfApezZ/yxTKkcGVhbthz/YcuhqmiuS1wq8JRp4y/W4e7C9VsJIuGEFB2VoS1/QchE816/WWAFC1h+wElqhsSHhKuUy/v9bQ2n475/oU9Sg/WNsxb3XomCTCUqe0FOMJKE3w6fd6yHUHvJm4OhAz7by3puoGVFu2+DzeQxTbCWFzuKn9NDV1S+pmc4s4TuveNvFvpQaAEzXGkQlliNvpOc94EvWnl72hjHjLwYxcgGZa5eO245D3VOJg3xNM0GpdkhMQ8S+s+FpWkQk4U6HSF6o2mPiSCLOS7jgdJ8drH6V1t0yO9aSfNO1P7xY+g4Bj6mqIRVNtzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d31kkjPS0+4/PZeVSdNec2a9HeFGul3U02Q8CasLcf0=;
 b=Oxz4cS+wUREH1XDK/oNDVEAKlsc+WK4CO7pEj+i6/CZUviDpqQVn2fR3kOtGUqOzilzjMm0/CMkF8aB+vPP7/paaAjZlWKYm9yxQnwKOKTdg8XAF8ZLpzsKkQWulazm1lNYBzd3khfIBvJpNjG19Q1ZaeO29g4/rEFJpYs1jVe11a1qefbIN15F/jSR0lYkTu2DXbzUJPulWE0/OsMBr6nFRk5fS+EXLz9mCarPUp+tLdCMMJ844KCTU1CfH0Q8eCmcLktl9weQg13FD34O70aeN5nvhpoYdWA1EqNYoDiUPkeC5TbDcnra6nZmwXuty/1bS2wtDutqiUQV1Y+pylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Wed, 4 Dec
 2024 07:52:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 07:52:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] autoconf-2.13-native: remove recipe
Date: Wed,  4 Dec 2024 15:51:56 +0800
Message-Id: <20241204075156.3811134-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204075156.3811134-1-yi.zhao@windriver.com>
References: <20241204075156.3811134-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f80563-5e91-44c9-d47f-08dd14388cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SWdSallpeXRESlljcHFaMDBrc0hwV2IzN1JGUFdTT0VVa2FsbUQzSG9HNWVG?=
 =?utf-8?B?d0xWVEk5VENMMTI5OXRCU2JoNWtnWi9IN2Y1djFFWldNbnk1QTBGQ3hFbHVz?=
 =?utf-8?B?U2dadk5wRjBQN3pqNXYwdnFpK0FLYlcxWlYxcVI4S3ZlZDRtMVJZRTdtZzR1?=
 =?utf-8?B?NmpGTWpyY0RuQTRtME5oOVVlUSt5Nm1JQzc0UzNMaHNnWjZ6V3FWaWNuVUhM?=
 =?utf-8?B?ZlBwVHZPOWQrZjJReVhUdUpJdnJtR203WnhiekswbnFJZitIZ1NkeGhKcE5R?=
 =?utf-8?B?aW5oVG9CaHlyWUNFL0l4dFVvZ1dieHY5anhuVmFQRDNOeG51SGJNTHdkWkZU?=
 =?utf-8?B?Qnpvb0I4Sm5Uamp3ZzR6L3FqejZ1Nm5kVEM0YUJnUjliQnUzKzNnU0dydldn?=
 =?utf-8?B?eVdzL3FqMDRRSkhNVXZFbDQrcXhYeXJ0d1cweVRtSUFjNEhnanRQcWoyQnpK?=
 =?utf-8?B?QU9kMDAzZ24waDNucTRBNDdMdVRCWGVpWE1TaWxSb3B3UGgwVUp5djZtelUw?=
 =?utf-8?B?SE9YQzZMRnA0dzhHVGZLdW5SN0NuczVDWjhoTk5OUDNXUk05cEhLQjNINk5X?=
 =?utf-8?B?bk1Pa2NTT3BXSmZ6U0tJc291Ync1bFphK1AyYnNtVmpJWCsrdVhEaW5qcWVt?=
 =?utf-8?B?MG9PRUZMVWJqMWh6V282TmFodGNaUmZJOWFVdEVCa2NoUEJWdUtBWURYRlNI?=
 =?utf-8?B?U2d6RWJlUEFiTHVIcHdtQlpGZUV4djVBb0wvak10ZDhCWnBxQm1wWExzakkr?=
 =?utf-8?B?NFNDU2p6NXJzN25xUDkyUE9KVlRtNlZ0Q09QSGRUM3IxMkFoK0RwZTdIMXkx?=
 =?utf-8?B?NjRlOWp1dURlVlppODFBbU84ZzdBVlpvL1ZGWGEyTHdHaWFuZ0ZlaGNwS2ZH?=
 =?utf-8?B?UkVXdFVyaWQvY0U1dWxkdlE2WllEdGwvOGFpRTJkK3J3SmkrUTBJQUJBVUQw?=
 =?utf-8?B?RkV6NkNOVll2KzQxMUxRTHdqOTZqUW5ibVBPenEvbmNBUEJ3b3hubStKUEls?=
 =?utf-8?B?WFJ1aGY1aDA1amFybFl5LzdBcjVpVHowTzJ3WGlDbFhHNE9NYloreWZIWVlH?=
 =?utf-8?B?Mis0dEgvSTJzZk95TzlwQkxQaVVkQ1NCdTBJTUhHVnI0ZHZtbkQ1aEpzcnBi?=
 =?utf-8?B?NW1iVkNCMStRWUN0cXVTdUVrNFdXR1BWeGlsV1ZacHk1YzZOQTZWZ2xSS0h4?=
 =?utf-8?B?YXhmL1RNbERTSmRxblV6RGVFZHdyN2xETVBuV3JBRko0cnRvcFRyTklsdmxj?=
 =?utf-8?B?TUR0eWorTEpIZmNjQ1YzR3hGRTBwNFQ3N1ZpZHRSMUJVaEo0Q0xialAzcVlU?=
 =?utf-8?B?N25QVzRCMS9yRSs1ci96RXJhSisvem1GMmFoTHVSQnE2RVlyY0lFS25KYlVV?=
 =?utf-8?B?aWpxcUNidGpYMVZuYVBWSUE5UnRoQ2h3V0s1NEwrbHAxcldVZlAxVHhaUVpi?=
 =?utf-8?B?R2FWZHp0QzlvczBGVmpqQ0lPdVEwUFBQWThYWnZ1RkZoR252bXhPNFlUek1s?=
 =?utf-8?B?QjhxRHNQeE9BRHl3OHMyalo5NFpsSFZVcXhPbmRNTlR3cWZPdy8raWQ3eDZV?=
 =?utf-8?B?NGVXNDd0RFhRRWJqa05IR0RkVklxZ0NIQUs5SXZKZGs4SGMwSHhkR1FNWHJK?=
 =?utf-8?B?ZElkSXBUdCt0UzhnbmNsa0dWdFBKUS9kT0dpbjZxZHlUaWJWSlhNRjVCa29i?=
 =?utf-8?B?WExvbjcya2pYSVc0aXQ1RnBqVFVkazVWUDUrVnYwN0hWK1lYc0ExZEVCc2FK?=
 =?utf-8?B?TlRjL0hpWjk3VWo2cjZFUER4UmNDTU90U25UZzVPY084ZUJ5NEpXTEdlMDVT?=
 =?utf-8?B?NFllYXNNUDlzaHNTNzc4ZmQxVlowcG9ETGZlMVFmVDN5U0xHaVV4a3hHdW1l?=
 =?utf-8?B?MEMxR0xYRkRPcnVUcXFhb1FvM0s4WTczeElVS3BWczdib2kwWEhaOWFYMFVZ?=
 =?utf-8?Q?POdKQzjImas=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0tFZXBRS0NIYzdyeG1VRzhRdm1NV0hvVm8rcGFaS3llWTMybUw5V1JKTVls?=
 =?utf-8?B?SnZqUU91QTFBbGdnMkprc2ZCK3hOOURPd1dkeFQ2SElVSk9BMVd4NDVIQnlo?=
 =?utf-8?B?eDBueDJBZTZGNlhlNG52bkFOTkw1WVlhZVZGY3AxdHNmTDd6eWt5a01TZ05X?=
 =?utf-8?B?dE5EYmo1TUZkV2l3VkhvaTFyZnh5WlBXVG1oWk14OWt4Y1pMSTQ3ejN5Z2tS?=
 =?utf-8?B?ZzZHWVZMNXRJZTFUcDBxTU0xRVRCOWVValo2dlZxTEdoQTAyRTNpWHRURzVC?=
 =?utf-8?B?ZXNEbFNRSGJQdmY5Rlcya3Q2RUNxR1NaRXNkZjlObmk1ZENRelVNSExBUW01?=
 =?utf-8?B?R2JoSitrYS9IZmtidXV4ZXh5T0srNTFEWlhEZVl6dFZQemQ0ZE54T2Z5STJ0?=
 =?utf-8?B?Rzl2WGJ5WEF3RWNrWHZ5bVc2K0VxUHhlck1EbDZodVRncWRDOXJxQ2hDQXRS?=
 =?utf-8?B?SFZ6dXhlQ1hsdlpkK2I4bjRGNS9FOWM4V211ZFA4dEVGT1A5WXJOWWhwUmhz?=
 =?utf-8?B?V084L1dqR2tDZHlmdmEzeFZFY1J1L1ZiOG9mMEY4ZjFJNWRkTjlMU3NGUzFY?=
 =?utf-8?B?b0h5SS9LYzhlWU55QjVIMWRRUWgrNENhNVRsU2p5V0JKQllTeFdTVWp1aUd4?=
 =?utf-8?B?emd5MFJDSzEzWlNHV0w0dy9BQW1Ib0U4VEY3RFdZVmdvdWRlb3dmbndxd0ho?=
 =?utf-8?B?UWN3c3plZkRuQUI3dFM0UUFQZzZqNmZVTHQ3Nk1RNjNNY0ZRSGJCL001Zm1T?=
 =?utf-8?B?UEVNZGhnbGFwN3lCOGowU0lYWWFoeTJtNlg0TGs5QTBZREFqSGQ4NEFDSXZB?=
 =?utf-8?B?V29mSFIycVBWdzhPWU1pL1hMVHQ0ek8vQ294cVZzaU5LSXUxeHUzUVlNZ2VT?=
 =?utf-8?B?OUVkZnVFMDkwMzdGVEMvN2syeFJKK0V0eVg0TmI2UFZrcGk5akt6a0trM1NI?=
 =?utf-8?B?Y0hoRFhNNnlkKzg4Y1hzU2FjK1RWbDgzS3h0cjA3ZU9zOVFheXBXWkFRQ1BK?=
 =?utf-8?B?Vm5sR2NBMkloZWdMU0VxQW9nUVNKWnNIdjZaTE9UWUpOb0J0cjdGSW0vaHM4?=
 =?utf-8?B?Slp3YTB4Yk4xQUkvKzl0REdOaElWZXpCczVudzkybjAzdFpvZkhZc0FMZER3?=
 =?utf-8?B?aGp0VWN1OUxxVFVjd25aVGY3RmpUM1U5ZmN5RVlzMEhLTk5waE42M1hlRFh5?=
 =?utf-8?B?enRDOVRSN0Q0bkUrR0ZMaUM3NFRXSW50bmZDNS9mbFZxYkxZSTR6MzJBMktM?=
 =?utf-8?B?Z0lqci9NaC9GOTNjUVhKV0lQZFMrN3krQlNNWTlMai9tQ1JrM29MVitjWGsx?=
 =?utf-8?B?Vk5CNWdicHlpUFpRVXpZV1pXbEp6WnNndC9EbDJsUXM3bG5DbC9iTjZhUDUr?=
 =?utf-8?B?ZW1YZlF4V2xMNjVDMVdiMC9XMks0MFkxRXJHM21IeWhtUUNGN2Q5Ymk1QnJo?=
 =?utf-8?B?NmRJNVB6cW85VkNubGFHWTNTMWZsdmx4VzFpUDl6aU55VHN0NjVsRWp2cFVp?=
 =?utf-8?B?ZlpyZG1uOGVBVVI0S3ZyWWpVa2VLQTVrZmhYRCtXcWJ4Y2U2Rlpodk4wVzBn?=
 =?utf-8?B?SU9WNlA0Q0xZVmQzcFJacmxXNmcyZk4wazFibVZ5VS9McUxXZEJXVkVacUFQ?=
 =?utf-8?B?NVpGdWUwOWdPUW56NFRqTUUzSDlsbG5ZQ0tTRGxWZ01UQk84S2RlWVRwR2R4?=
 =?utf-8?B?V0lCSWVaTndURHRocmtPSllNZ0tITWpoTXYzTnFLa0RUc3Z2Rzh4eHJWSnl0?=
 =?utf-8?B?RnEvOVhHM0ZQWENVTmRLSkhKUUR3SUpXdThOR2JjWDVnSEpOUGdnR1hWejJQ?=
 =?utf-8?B?T28ybFU5ZEVtRmdGaGlDL3RKSzdORWt1UU5NRUl3U0dMTWhYYjlZSnJQTEZJ?=
 =?utf-8?B?cnRCTXlIU3E1dWVUQzl5RGd2ZzhuZFdVdlBpckxheFQ0K0hFRU9aTDNPYkhm?=
 =?utf-8?B?eHBOckMvZm5XNk5zckNBNk9ueWVoS1BiY05zLzNsYVRJaS92dTlkVDZ2Y2dM?=
 =?utf-8?B?QmFzWVA3N0ljYzU4NUw2aUpRekJEVGxYVnlOTHFWaWtyWjdmQUxwdzdLZytR?=
 =?utf-8?B?R2cwNlNxYThraXdRd2t4anhBQXlqQzU1NmF4Q3UrWjhQdDdMckVUUmEvdk9x?=
 =?utf-8?Q?gRbn9yQYcy4Ih6cMego8zM0kp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f80563-5e91-44c9-d47f-08dd14388cd5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 07:52:07.1847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5eC0ZRyXYbmlNjwiWWOmscuozBa230qlkecxjRoGjAuoaNSRE51YeWhFA28DRWZTgKgRE+3Oi4prpeioUL20g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-Proofpoint-GUID: yui6edeEDhpQcUBgIyf-2v8pv6ccwpr4
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=67500a2a cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=pyvtBbrsAAAA:8 a=FGqIs18fuTmYtjqEzw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ykIQO9eVlTWXpgri3un8:22
X-Proofpoint-ORIG-GUID: yui6edeEDhpQcUBgIyf-2v8pv6ccwpr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_05,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412040060
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B46D324023644
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 07:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114195

The autoconf-2.13-native recipe was introduced for building mozjs-78[1].
But mozjs-78 has been removed for a long time[1] and the current mozjs
doesn't require it anymore. Considering that autoconf 2.13 was released
in 1999 and no recipes require it anymore, we can safely remove it.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3Dfe1607060=
ac2dd42ae8c5115b8cbc4993b467a87
[2] https://git.openembedded.org/meta-openembedded/commit/?id=3D7432c1a2e=
f9d75b078da31d268ffd016e8dcf583

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../autoconf-2.13-native_2.13.bb              | 67 -------------------
 ....guess-config.sub-install-to-destdir.patch | 67 -------------------
 2 files changed, 134 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-=
native_2.13.bb
 delete mode 100644 meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13/=
0001-Add-config.guess-config.sub-install-to-destdir.patch

diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_=
2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.1=
3.bb
deleted file mode 100644
index 6b4c55ed4..000000000
--- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-SUMMARY =3D "A GNU tool that produce shell scripts to automatically conf=
igure software"
-DESCRIPTION =3D "Autoconf is an extensible package of M4 macros that pro=
duce shell scripts to automatically \=20
-configure software source code packages. Autoconf creates a configuratio=
n script for a package from a template \
-file that lists the operating system features that the package can use, =
in the form of M4 macro calls."
-SECTION =3D "devel"
-
-HOMEPAGE =3D "http://www.gnu.org/software/autoconf/"
-
-LICENSE =3D "GPL-3.0-only"
-LICENSE =3D "GPL-2.0-only & GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D361b6b837cad26c6900a926b62aad=
a5f"
-
-SRC_URI =3D " \
-    ${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
-    file://0001-Add-config.guess-config.sub-install-to-destdir.patch \
-"
-
-S =3D "${WORKDIR}/${BPN}"
-SRC_URI[sha256sum] =3D "f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cff=
d3edb3cf08fd791e"
-
-inherit texinfo native
-
-DEPENDS +=3D "m4-native gnu-config-native"
-RDEPENDS:${PN} =3D "m4-native gnu-config-native"
-
-PERL =3D "${USRBINPATH}/perl"
-PERL:class-native =3D "/usr/bin/env perl"
-
-CACHED_CONFIGUREVARS +=3D "ac_cv_path_PERL=3D'${PERL}' \
-                         ac_cv_path_M4=3Dm4 \
-                        "
-
-CONFIGUREOPTS =3D " \
-    --build=3D${BUILD_SYS} \
-    --host=3D${HOST_SYS} \
-    --target=3D${TARGET_SYS} \
-    --prefix=3D${prefix} \
-    --exec_prefix=3D${exec_prefix} \
-    --bindir=3D${bindir} \
-    --sbindir=3D${sbindir} \
-    --libexecdir=3D${libexecdir} \
-    --datadir=3D${datadir} \
-    --sysconfdir=3D${sysconfdir} \
-    --sharedstatedir=3D${sharedstatedir} \
-    --localstatedir=3D${localstatedir} \
-    --libdir=3D${libdir} \
-    --includedir=3D${includedir} \
-    --oldincludedir=3D${includedir} \
-    --infodir=3D${infodir} \
-    --mandir=3D${mandir} \
-    --disable-silent-rules \
-"
-
-do_configure() {
-    ${CACHED_CONFIGUREVARS} ./configure ${CONFIGUREOPTS}
-}
-
-do_install() {
-	oe_runmake 'DESTDIR=3D${D}' install
-
-    # avoid conflicts with standard autotools
-    ver=3D"213"
-    for file in `find ${D}${bindir} -type f`; do
-        mv $file $file$ver
-    done
-	mv ${D}${datadir}/autoconf ${D}${datadir}/autoconf213
-}
diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13/0001-Ad=
d-config.guess-config.sub-install-to-destdir.patch b/meta-oe/recipes-devt=
ools/autoconf-2.13/autoconf-2.13/0001-Add-config.guess-config.sub-install=
-to-destdir.patch
deleted file mode 100644
index f6e9ecb9a..000000000
--- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13/0001-Add-confi=
g.guess-config.sub-install-to-destdir.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 3d3e23f7b14e87849405a4e109a69b76696615fc Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Wed, 11 Dec 2019 23:18:19 +0100
-Subject: [PATCH] Add config.guess config.sub / install to destdir
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [Configuration]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- Makefile.in | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index a6c94d4..4b1b708 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -137,23 +137,23 @@ installcheck: all install
- 	cd testsuite && ${MAKE} AUTOCONF=3D${bindir}/autoconf $@
-=20
- installdirs:
--	$(SHELL) ${srcdir}/mkinstalldirs $(bindir) $(infodir) $(acdatadir)
-+	$(SHELL) ${srcdir}/mkinstalldirs ${DESTDIR}$(bindir) ${DESTDIR}$(infod=
ir) ${DESTDIR}$(acdatadir)
-=20
- install: all $(M4FILES) acconfig.h installdirs install-info
- 	for p in $(ASCRIPTS); do \
--	  $(INSTALL_PROGRAM) $$p $(bindir)/`echo $$p|sed '$(transform)'`; \
-+	  $(INSTALL_PROGRAM) $$p ${DESTDIR}$(bindir)/`echo $$p|sed '$(transfor=
m)'`; \
- 	done
- 	for i in $(M4FROZEN); do \
--	  $(INSTALL_DATA) $$i $(acdatadir)/$$i; \
-+	  $(INSTALL_DATA) $$i ${DESTDIR}$(acdatadir)/$$i; \
- 	done
- 	for i in $(M4FILES) acconfig.h; do \
--	  $(INSTALL_DATA) $(srcdir)/$$i $(acdatadir)/$$i; \
-+	  $(INSTALL_DATA) $(srcdir)/$$i ${DESTDIR}$(acdatadir)/$$i; \
- 	done
- 	-if test -f autoscan; then \
--	$(INSTALL_PROGRAM) autoscan $(bindir)/`echo autoscan|sed '$(transform)=
'`; \
-+	$(INSTALL_PROGRAM) autoscan ${DESTDIR}$(bindir)/`echo autoscan|sed '$(=
transform)'`; \
- 	for i in acfunctions acheaders acidentifiers acprograms \
--	  acmakevars; do \
--	$(INSTALL_DATA) $(srcdir)/$$i $(acdatadir)/$$i; \
-+	  acmakevars config.guess config.sub; do \
-+	$(INSTALL_DATA) $(srcdir)/$$i ${DESTDIR}$(acdatadir)/$$i; \
- 	done; \
- 	else :; fi
-=20
-@@ -161,11 +161,11 @@ install: all $(M4FILES) acconfig.h installdirs ins=
tall-info
- install-info: info installdirs
- 	if test -f autoconf.info; then \
- 	  for i in *.info*; do \
--	    $(INSTALL_DATA) $$i $(infodir)/$$i; \
-+	    $(INSTALL_DATA) $$i ${DESTDIR}$(infodir)/$$i; \
- 	  done; \
- 	else \
- 	  for i in $(srcdir)/*.info*; do \
--	    $(INSTALL_DATA) $$i $(infodir)/`echo $$i | sed 's|^$(srcdir)/||'`;=
 \
-+	    $(INSTALL_DATA) $$i ${DESTDIR}$(infodir)/`echo $$i | sed 's|^$(src=
dir)/||'`; \
- 	  done; \
- 	fi
-=20
---=20
-2.21.0
-
--=20
2.25.1


