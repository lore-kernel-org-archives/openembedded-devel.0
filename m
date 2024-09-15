Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF99C35FE7
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 12:52:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.113766.1726404739169961867
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 05:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9988d41e42=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FCYMsZ018016
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1s1y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTqzjaIIJ6iUVjK3LoVkeVBcjIS3TcVIv82M6vqTsWiup87Utu7uuRD8lB2HbzAkbMrjDXZphFwuokN9GRdmPDyQ/tQ1xpmgGmMXY5/Ey5se3bzqYD8MQYppbCIHrS/zBlad317u8dkupeVjnVZR+xLocrwak6nMCFk6qY4u6stkGek8GD/rP2gwJ+3VxgSnZ1tbv1M2W7C8DnEN/bIQfs6urrhbMqzn97GQEE29+Es8xWicmCNnncFqXGehXlyQPolnHlxKkR8H5DiO44UZcFCA+Mq9Grzzjs6mRcegu85sjRSxVMeLP7vtLSKhayu49F3hwO9mq9BPbY3J2XHPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4tdG/6DU/gI3Y07qrBVO2r9YTMaVKh8UAuh6fkbffc=;
 b=Ew/FGCtEhFfmVYnbven2eHmPMrRcFIHpPBYovOtySwfMpCOQX4PwvzL/hOdvnXBHn3W6HokM1XZhvq1JWTICR98QkEwFN6y2O2w67csOg3W0IWzc30lkzfjyO+LMWa4E2RJjMwL7hZ6BB571FMFtmIxU3MrLDKrDjKI8w7tTgknboYlkVFZWG1baJW4Gltq/OqkYbgwZdE61273++0LpdzLUsV9YIJyfVd9GmQvvQZilFdARfRdT3/nu/GkF69AJGYI1/Ae8SSrnNbV9T0yQVPGsahuqn+P0Jr3WPGzKX3kJCp9QAdNHBJvtfwer/MXuPTHcxWH5w4tfsTNhdAt7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 12:52:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 12:52:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/6] fltk: upgrade 1.3.8 -> 1.3.9
Date: Sun, 15 Sep 2024 20:51:48 +0800
Message-Id: <20240915125153.2940806-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d0244a-e93b-4066-fe01-08dcd58534e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkV4akpxK3lMQmMzZnlOaFlHVExBMVhmUmFwNjJmODV6Q3NIZ084QVd3dXpO?=
 =?utf-8?B?SitoV1JBYkMzVElIYVJoaG0wZ0JmbVhkeVVtSUd1SGRFYlA5NTVWdkU5Q3o4?=
 =?utf-8?B?aDIrc2dGcTBhSmM1RFB6cDMzZytEU1k2QmZ4THBIdXlMSW1qeWJJYnpXWUJO?=
 =?utf-8?B?TVNKdHB5d2tsMFVmckY4ZGlwdFFVUDMveVM2b2JpQmhMM3pEblozWXZid003?=
 =?utf-8?B?Ukwyby9sakRyT3RmU2NNQnNBb1V0ZVYxUCtFOUdqZWxQZ2R5MDZFTzlzTGxn?=
 =?utf-8?B?akU0RDUyOVJPcmV1TjFHMGEvL2lRRUFkOVhabmlpYXVBRE0wTEJEWXBLclND?=
 =?utf-8?B?RnpmT3R4N0FJbEtmaG1BcmszQ3B3QXVGUW9pUDVrZXlmclZjN1poMjNCNFo2?=
 =?utf-8?B?MWJyYXlaVitYcWNmVjRDVDd0LytaL0NNbUhDVzZnUnYxVW5kd2lRMGJWQ3ZW?=
 =?utf-8?B?MnQxTllIMFdYMzdab2YvT09TMFRsZ3JBdEFkS2pNYmJvUWplSTNJanAyTnpn?=
 =?utf-8?B?NDZEeTVMNy9RYnJlaUEvSmF0Mk1CeFpqNHpVclc0dk1DdkF3clBha1FLU3FZ?=
 =?utf-8?B?N2E1N0oxeDBMVUpCdS84RWtoOUowTDhUY3JZUSt5TWFFaEl4SEpxN1ZTUDIv?=
 =?utf-8?B?bS9yQ0R2eUprdlROYnZTNlJJNFRUdnhRQXNKeE9sUGR4M3QvKzgwMTR3L0V4?=
 =?utf-8?B?UWF0T0FJdTdidUdlZnkzSzV0NzREQUsvZ21JTDVOMTZYRG1Qb3dOYVQwY2Ni?=
 =?utf-8?B?SmtsbzVDZ2lyRGxKZ0ZRUXFSZU0zcGozdi9YZGRpNHBiQytDZGJhR3lTeTlG?=
 =?utf-8?B?WjdqL1BOUWM0RHRJampJemlKRTZ5b1BhN2FRTnN1anFTcTVDMWdSeGVLTURo?=
 =?utf-8?B?STdBS2RzSTNPb1AxK29tbGRZeWd5eUR6RXd5aW0zOFFxMUxDZDJQZ3l2WXZm?=
 =?utf-8?B?c1dxVUgxV1d3Lzk1NnpGOUNxNjJ0bDNySzRMVW1tb0ZJRjA2LzJHTDNtQ1Fu?=
 =?utf-8?B?Q25panY2ZFJLZXROckpHeEJYR3FSb1dhMG1Vckp0dU4vSFpkRk5HYm5BUUtC?=
 =?utf-8?B?RTlaN0VaUVVOTXJ6ek40TTArUmFycS9nZ25kYS82ckFxMkFmdXpaOUpna2M5?=
 =?utf-8?B?NXdSTXNxdVVXWk1ZbVRITUtPL0JPODJxWmc3djNBdEdZaE9pZHM4NlJXNHcz?=
 =?utf-8?B?QTIvQXgzenhiVGZ4eWNoUWVyMDVOYWh4cVRGdk50alhRbnZLZk1UQXNBSFJS?=
 =?utf-8?B?VW9iOHk0NFlNYVVZQytiL2dXb0p6dTVBeTM4eGRESlUrR2xmMmJLaFMrQ0NQ?=
 =?utf-8?B?dzZ5WTRNUm5CRHVrREg4RTJIUkNYZ21JN2IzK3dnTTM2UHFkcWd6YTRDYlJK?=
 =?utf-8?B?Si9HWDVUamZjOHR0ZVlyTDBYRUV3T0ZRZWVRSUdKRXJ3RGVGTmFtOW5sQmJG?=
 =?utf-8?B?SVNNb0M5RS9tRWhlbVFmN2o4VWJpa3dQTUloOER5RFBYTkMzYWFqS3B3SFlF?=
 =?utf-8?B?VTRFUGtGbmdpaXdGNlR6UGg5OUdOcjd3UlBTRGJmL0FMYUJkOHRSOVJFREQ1?=
 =?utf-8?B?MU5DdUJDbTRtRFAxa0sySzNwbXNkN3lWK1VHVWxrMTgwODhlS21aaEZmL3lx?=
 =?utf-8?B?OW84bDk5Qkx6eCtZZWovc1dESDBSOXBRb0kzNFdOZUJUdlk5bmNwRlV1YzZG?=
 =?utf-8?B?L1IwSzgveVgwckVXMVFCVjhNTnY4THA3bHVhalJhRW14dUdkUTBSVW92SlR4?=
 =?utf-8?B?dGJRcDJIMnZLUlhDU09wTWpnVnJuSm5VcXpROVU1L1UxZ2JEdEdjL2V4U0Yz?=
 =?utf-8?Q?fnx2GVDsJBPkSkJoJFGSpu3bZcyfVrfn5lbCI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZitqbHJXQVFiQWpIUWowUkFrVGFmUnZSZkRLbTYvSjZOS0pkU3FmN2cycWlC?=
 =?utf-8?B?dmZTUmVibUkrT2wzd2pidzM3ZGo1NnBDWlUyM3E0T1c5dHgwUyswVkVFZ1JO?=
 =?utf-8?B?dDExQzM2MzAwL1lSUmRGR2NENU5WRGlDUHBBZzIwdnhzNG10Umw2d0cwcldn?=
 =?utf-8?B?a042a3NJUUxNTkZmMUdsNGtOQzZhSWtJWjJ5RGg1cmc3SFVFY3MvZGlhOVVP?=
 =?utf-8?B?MXJvWkRrNUxXMHR1MTZka09vbTFaeHJ1MFBEZmNuQzlITkhySEtuTFJwZ3lN?=
 =?utf-8?B?NUlJTE1hbzV4eW5TcXlHZjdpTlN2TmJGeFZZL1lZNmx5UmdTWkQ5TEtEczBp?=
 =?utf-8?B?VnpvVGpiYjN1SWdLR2luQ3dVVndFUWVha1hkeHlYT0ZubEtoS0tDd3RQRjZU?=
 =?utf-8?B?bWo0amtwWE51akQxZmxLUjlnblc2UjdHeFNYckpSWDNKMzE5N0lYTTRMd25P?=
 =?utf-8?B?MDlLSW0wTHc4ZkZsZndRK0xqb2JFVlhpK0FweTZtUGhOU1k4eFNHQ1dwK0RP?=
 =?utf-8?B?a3FVRzlleDlNZFJRa3ZFQmZOeHRlU05Nd0JjWEFDUjR3bGo3Z0IrMElkRlhj?=
 =?utf-8?B?LzcwTmVLMVplTHNINHdDWTg0NXJ3bVBzUzBRKytoWFZBdFpVb0JGSGVuZGxL?=
 =?utf-8?B?bXhuT0RtaFdTZTRNM1hDK0VmMnErRzhkWHRhZmpmajVPdlhGUlk0WGRSSmFs?=
 =?utf-8?B?cWZZUDExUE9LRWF5RjYzU0xiUFNITm9rYjJlZHVza0NBWGZJNVI0dkhwV2h5?=
 =?utf-8?B?V1IwdTlicTcvYlJwejNCejhxVE5GVFNjdlZLTkFSaGhzd0kwWWVZcmpZYTIv?=
 =?utf-8?B?ZENUUGJ1aVJzNUtvL1B4NWEzTHAyWXdKbzFzcm1kOFZta1o1TmN2dEE1ckYr?=
 =?utf-8?B?eTRrY1h6Vjhycm1SRzZpNTNBTUFldGszOGZTV1p2TFRjOEl1VjJWS2ZTWTNZ?=
 =?utf-8?B?Uk0xNVUyYWgyUkR0SW94dVJHczFrcmlWZW44UEVOL0JVVXk4ZTJVVzFrakJk?=
 =?utf-8?B?dDJ4T0cyditHT2ZGMThzSHJieEtBSnpMNXRFRzFjMElnYW92a1dyTyt0d3F6?=
 =?utf-8?B?SUVjY2hnVVV3ZU9RN09oQ3F6RWZYMHFaelRUZVhPUUY4UnVqWW1jb0p2Z0JG?=
 =?utf-8?B?TDRmK2VZT1BMTDRLTi80TWZ0T0VkakQwMUgxTlIzSWVtN1dwVmU2NGFUblR5?=
 =?utf-8?B?d0c0RVFUVUFKVzIyYmYvY1N6aUErVXpZVzVsMzBEcTF3WkFaNCtrNWtlMFpW?=
 =?utf-8?B?WGNUWCtITDVCS2ZPeVRlTmMycTVhbGd1UVcvRXQ1M1FSeU9pcExkalJUM3A5?=
 =?utf-8?B?TVlzSDNyQU9UbkdTZ2p5OUhYaUlKSk85UVpCRkRUOVN3eFBzdjlhMHpsWWc4?=
 =?utf-8?B?aGtycFpyRnBGWFRaMUN3NmJkVXUrY1B1dkNycVFOWHlyb0xhQ1dIdVNzaVM4?=
 =?utf-8?B?WmdYcVl3aFdHM09aUGQvdHNlWkxjYnNvOFlPemthK1Z3N21DU2lycVFrTmJ2?=
 =?utf-8?B?WGdKQWl2dSthTmFaZnVyd05uVDhRVGNFcjRjQlFKbzZFVWFjZ3duOVd5cHFn?=
 =?utf-8?B?cmFLL2lodVZLMm16eTdKRkhORTZaY21ONE52U2RyTWpMTTVUVUpIcW9EZUNh?=
 =?utf-8?B?dUNsWjkyL3RaSy9pRENKZThkcHhqMTIxektJUXlMNTgvK3J1YmZDa1YwaXBl?=
 =?utf-8?B?VVlBc0ZuY3A0STdRZ2szZlBqejNKUWNHUVQrYmFWaG5zS01JQ1lHL3lzUDdU?=
 =?utf-8?B?YTcxdTcwYXN1VGpaVlQ5emZnbWxPZ2xTUlFYcWlZaVpocUlaQXI4OHN5SWJ1?=
 =?utf-8?B?QlpCdkhWWklET0RVQ2V5TDltanV4anpuVzAxa3Rnb0kxUWVTenF2Y2psZHlL?=
 =?utf-8?B?ZnJmMmZOL1hBZU1VekRVc2Zad3NicGh6K1JSTEV3MHhLN1diNEllQUlOSXMw?=
 =?utf-8?B?UXY4aENFMlZJYTRkS0tLT0V6UWhNaFVjNTR5Q2tGMHR5UUdORHZuTFZDdHpO?=
 =?utf-8?B?aTV6RTV6aDVWUzFXS0Zqcm5rRElEUTh5QzFBU1l3d051VnVVTWhRcDBQcFIr?=
 =?utf-8?B?ZFEvTzVJd3djZ2V6UkRDbXlGWEF6WGNVYzVJRDg0N1UveHlDT2dzM2hFTSs0?=
 =?utf-8?Q?9wIwbLPgHTf1LyaSLutdRBPFk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d0244a-e93b-4066-fe01-08dcd58534e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 12:52:07.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7w+fdA4Y+Z0gaLCyPI9EcumxwMfgsPnz6iKMNeXIOHObpkT0J33N52Ii9wo32IfL2G+hm6GzBI7Lb4R+CEVlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66e6d882 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=OYMCiYonAAAA:8 a=t7CeM3EgAAAA:8
 a=mK_AVkanAAAA:8 a=hbWoJc9qX5pFGrt-OosA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=4MVqoSYplEcA:10 a=2rklPmxFnYA4oAlhb8RG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: ZxUn2MSOHBJYU8CXZowq4pSlsHICaQ6S
X-Proofpoint-ORIG-GUID: ZxUn2MSOHBJYU8CXZowq4pSlsHICaQ6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_04,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=996 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409150098
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48FCYMsZ018016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112293

Release Notes:
https://www.fltk.org/articles.php?L1898

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/fltk/fltk.inc                         | 4 ++--
 ...Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.inc b/meta-oe/recipes-supp=
ort/fltk/fltk.inc
index b1bc83578..0b2921095 100644
--- a/meta-oe/recipes-support/fltk/fltk.inc
+++ b/meta-oe/recipes-support/fltk/fltk.inc
@@ -11,8 +11,8 @@ SRC_URI =3D " \
     file://0002-always-build-fluid-and-export-pointers.patch \
 "
=20
-PV =3D "1.3.8"
-SRC_URI[sha256sum] =3D "1d9832409fc08c908c64ab40ad9fd8b0e8af5d203651eb96=
90b810f41e2f412d"
+PV =3D "1.3.9"
+SRC_URI[sha256sum] =3D "103441134915402808fd45424d4061778609437e80433443=
4e946cfd26b196c2"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do=
-not-use-dlopen-in-case-glibc-s.patch b/meta-oe/recipes-support/fltk/fltk=
/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
index d1cbb3547..0d47dac2d 100644
--- a/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-us=
e-dlopen-in-case-glibc-s.patch
+++ b/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-us=
e-dlopen-in-case-glibc-s.patch
@@ -16,10 +16,10 @@ Content-Transfer-Encoding: 8bit
 |                                     ^
 | src/CMakeFiles/fltk.dir/build.make:1217: recipe for target 'src/CMakeF=
iles/fltk.dir/Fl_Preferences.cxx.o' failed
=20
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
----
 Upstream-Status: Pending
=20
+Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
+---
  src/Fl_Preferences.cxx | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
--=20
2.25.1


