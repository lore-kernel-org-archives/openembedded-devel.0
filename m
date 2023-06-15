Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED79BEB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 15:02:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20806.1686841318242429337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 08:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CWXSlTzt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55300b703e=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FC9Nps028135
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nuf7mF4Qo+NomL/zR/ZQVobC9ZEEH8nq2MJ8aekcv7U=;
 b=CWXSlTztsQDr20gVHKs4rvwuJxUoq9BvveHyVxAiG7qhbVP5igR3C8DFm1bLy2jI3iMx
 tvH39R5XADG3547qYhQ28iGYE86VU9xChJtW5lVi0o+ky5U7MxsXHAezFRpFS1GN7e3a
 bv40lZ6LIk9XzasWVg4HTU3JvvYN1Qp+BL7lcqqoY329aCB/20CrxGbClIqtYMOSbaZX
 fvmb0rbOf9E3mvxB9I5shVOZJRAjNjrE/MGTQMvgpWGHS4ujqEoW0L8uSScMT6SVPAYT
 K5Eu95dvM3vnEZ/l8hF1jYOCwxO2EDwQjrVBfD5B3fVPmZHRvGpskDM1BDSR1OWG6sm2 8w== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4g5850vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:01:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFG5SgO2MMQsGQgqG+ix67mc+jXoo1eYixlRMa2RXTqPtreGWsNq04wp2QHZR7WEU4g8jbrKhGgVKpRlplvMeUEWIupReN8xlSFt9az6BP5/0Q8likTH8cmGPBRVwrh03b3tgTDJTD26sfWr3jMHhY1aAdzXlP7L80JsaRWscvLEDmVwhnL9RDBDWc4XgzsUQfUIwVi5DKXezKtsZvMI05BDyxrbbEkIH5CmMGZdBJI7XGzmIs4aWxv8Lo5eRMYsATRwTfODcz8hmxgNPWtdqbumquqw80VbJ5ZOJYwWgIEIFaF5lEA9amTIusqCrj4jR5Ky0QEutp5zA5cQgLEVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuf7mF4Qo+NomL/zR/ZQVobC9ZEEH8nq2MJ8aekcv7U=;
 b=meFEtxXtgf9a2InH8UqcW4atkUNBt2Ic6lFQWqHc+aEwSVl1zGxzQoz0Du9xv12R61qEhVVsdM9z5iS71XIfH/nfOaIqGVuoH8WyimQA8ok5sLJ4/bx8kaVMwml9uA0HeB6cvdTSEgD+hnp8Ysn59YieVd14DisdkWULGL2CwTMPndMvRGWhiMe/9tsaVK/QFMhc6BXiN12xAEDgqk+PPkejLS/iWIuTBbJtK48UAc2gi+WhdW8hKnrAFKzvVyy19+lJo5enajuXe6QeLV5M7hli421uXxaAdfENWOCR1NrKQSCwgjxQxDOigW8Ael/cz6FVjXthcPkq7SbitsJHgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Thu, 15 Jun
 2023 15:01:52 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e%6]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 15:01:52 +0000
Message-ID: <eec3a915-552a-a8fb-5c9f-1376d492ff9f@windriver.com>
Date: Thu, 15 Jun 2023 20:29:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade
 3.2.12 -> 3.2.19
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: hari.gpillai@windriver.com
References: <1763A46E49E18848.14832@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1763A46E49E18848.14832@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: eef96452-0581-42ed-461f-08db6db17401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	swfxgIWwO6a4erIXNoxmYjuDqtBjiDFkBfNI6dI1iBcusDS3Aagym8WdLBDPAWrzMOxL5cNLHa/eVGJIIG9SyN5ISzXWl3jYHBhnTBIdnNdaUu7pEcWjIdqznIxntGc/c8Ywk7k0XUs3s9GewKEsKeZT92VRw0f9rLBysD3mE8SJPOONLvOM9bwv2vWk4Oe1dqBLhiRedXuvZLawsJXTVSDa2aXaqCL9rr5NNb2bDmuyY8L9x2it0r658ujFzTAkznq3o/cHJrSmzEF/k3M1FU1wybcIM4w/eLLrHRPTGzVgOVZPc+9RhRSASumTDwvD5G8OLYia7E05EKXMA1sKGhzM8hXZjw0g/ps7c/wsEl6PgqiXwancWMHhqeGhq2RxTeRuX99wQeJ1+hwm0Z/6YzpROFkSmH12lTIuVcFeBplX4LjvICdfnat08z3Xju6KQ1wkVjSTirbmNmV/MRaWwxb0YpvJOajg9ciCC7KyqLJ3ef9dKL5jO7M8zX+BsxqL9mNDRx/uUjQ8ci1BS/09iwwrKo8Igmy68R5bvrnoBHs0g9w6Eix896LuqKJ5ayKFfl6W1+BmCCM3NtuUynKstc5XTj+34Qe7S81uFDl/4VOPDlIZRBoSuo2uEAhACy6paqjGW4mZkalN8+hd+bvxyg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(366004)(39850400004)(451199021)(2906002)(66899021)(186003)(2616005)(83380400001)(66476007)(66556008)(66946007)(6666004)(6916009)(4326008)(966005)(41300700001)(6486002)(316002)(31696002)(86362001)(478600001)(38100700002)(36756003)(31686004)(6512007)(6506007)(26005)(53546011)(8676002)(8936002)(107886003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1YrKy9vRDcwZFdXL1lDcUcrNEpRSG0zRmFCMWNuT1RDOS90WVd5UWRZbEEx?=
 =?utf-8?B?eUpUWFgvQVVFVlJOSWhWYzlDTWFPNUdHRTQ5MU1yaDB1WDRrZzV5dWplRkFQ?=
 =?utf-8?B?N0t3c2xSUXNJeExrVW84NHFIYWNqeXdSYnlDaG12dTZiQkN5N3YxY1pJelNM?=
 =?utf-8?B?NytEMFhxMG10emxoS04rTGNrVVc4aUJiY1dXUVJWRFdNZjhmaDh1cmxBZ1RH?=
 =?utf-8?B?TTljUmVMN0h4ajF0NjFicXFGR3lYY2tSTDNMeEZyc20wa1JmRDROb3V2ODlL?=
 =?utf-8?B?cS8vTWlSbHZxc05uQk42WXcrRTI5eC8vblFYdFQ0NXRPS1VZb0F0MUVSc1pL?=
 =?utf-8?B?cVc1dUJDTHM0aHNGNk5sQllpTzdXZzNLam82M0hHbitoVTZZajh2M1BRR0F3?=
 =?utf-8?B?N1NMeUZlcWVxWHNpMlgrQWxLR3hPK1JUajlrZXRmWkh0VXAzR2xyUHNDSWVT?=
 =?utf-8?B?ejR2VCs4RmF4MmIxZzNaZWE1L1dGZnhOZUNOMFJudDB1QnBPL1ZkdkVyZnFD?=
 =?utf-8?B?ckxha0tHUVZPNUV4eHBLQzZTaStsNUpZY05iSzVZbi9xcHNmRmNDbHNqa1Rt?=
 =?utf-8?B?U0pxS2Z6WUpBQ1JXOGpHWUc2U3NvY0pRMmkwV1ZyTTVDdTQxZldYOHZ2QWUw?=
 =?utf-8?B?eTl0dmNPVUZzblRrc2dsbkxQd3lMcmZiTUZRem1ud0FUNytiZ3RnZSs3S3N0?=
 =?utf-8?B?THBUWDA1dnN0MHdUa0xjeGhVRUtQZDVqdjNONGNWeDR3RmxiRHBuaTZUS1BZ?=
 =?utf-8?B?OGd6dFR6WDgwTXdpWVZ0QUhWT1djMElaZHdmbWpmQ2x2bHZQNTNrbHVVN2dW?=
 =?utf-8?B?ZnBpY2R3N0VYdHduMFpXRi82VmlxQXRJN01yaXVNcm1VaXF1dHFpR3lQV1Bj?=
 =?utf-8?B?K2N1WE5aL3JFclFJOWtUUU12YXZtclN6ZWZPeGZvN0tRWHZZRnBQWnN5aERP?=
 =?utf-8?B?blJ0eUtvam95TE41SnVuRGJZcnAxMUVRZ2tVMFlnbzZYRWxXQm5ma0FTbXhD?=
 =?utf-8?B?NVI1U0JzeTduUmxOWnhlQWI3ckxvM3IyLzhSbitIbWNTYmwvWEVHcEpYUlBs?=
 =?utf-8?B?eEI2STc0NDM4QVFVTXZjemEzSTBLUlNvemgxSUYvVmVpZTlPS0l3eVdwUzVi?=
 =?utf-8?B?UHJxcXkyYUlDeE9iMjIzSnBNalhlK2xEdUljWktnbStDSEVUWFZWRkxiRExY?=
 =?utf-8?B?WWtKRWFDbDZEMU9OM2h0ZnBlTWl5MnRndUN4eUZHMzFpUThSMXB4NldkTE9Y?=
 =?utf-8?B?WCsxMTRNMUJiWmdKc1RSaTNCOTZpenl0MVdFVXpHWjNJd0Q4UWRtWDN1bGEw?=
 =?utf-8?B?d1RKcFgxQ0dBeXBHZHNtOW1wSXZsMkczVnFkVEx1eC96WE9YT3pIVUFJYXFY?=
 =?utf-8?B?VDJYcjk5dm1SdXdMNjM2K2ZsaHRCYzJLVHhrV0UrdmpwNUJkS0tRNXo2UHNq?=
 =?utf-8?B?T2FlYTQzamRGSExiYStTT2FjazlPdTVYWStpKy9KcnIrMkl2VGtPd09lbEhE?=
 =?utf-8?B?TjloWWtYK3NGcS9qRndxaVFNemVVbjVSUzExZnV2Qk44Q2E2NnFPeUtDQXBJ?=
 =?utf-8?B?ME5iVXc1Kys4MHFGSk9yTjlsYXliV05NRVJicHZDWkhFK2dLNy9IWGxleDdt?=
 =?utf-8?B?bUxpTWUzU2hpZVI1VTNmOU1HNHpRb0lORzFIb0pBN3psRTl6NHZEQUd1K2VU?=
 =?utf-8?B?TlY4b0F3ZmJGK2JHdlJlbG5JVGM1dHRydHh5Wkg5Ty9IZDI4ZHh5aUFHR2Y5?=
 =?utf-8?B?SVFRaFViYmV5SHltRVFUM0t3RFRxWWU0TUIwTEorVDZnQ3B5SXBIaWRJOFo5?=
 =?utf-8?B?SWNIL2IrRkxCWXVFUUVPUDJRSGVRQjlub25zSUloaWpQZHJURVVCYzhuT3Vs?=
 =?utf-8?B?ampuSkkrQUNmRXhadTZ0MFBONGdPNEpIVUFBZGo3QUUvVFRqUm9wc3BDRzhK?=
 =?utf-8?B?WWhocmlsNHZsMWdSSHF5ODhlZTlyL0M0cXo2WGlZZjVoNHVWOURNMFBKVWlV?=
 =?utf-8?B?V1Q3aktJVTBjK3hhRjRNUGFHL2tYSmFIQyswNWluaWFrWnRiYkQ4WEN6aVlp?=
 =?utf-8?B?cjRtSmx4cEhlS3lxbHN3Um0yeXEvbU5VbEtIQTJjVDVNOVB5NEZMaVd2U0dP?=
 =?utf-8?B?TFZmRDZQVkJaSzFmUzRIZEJ4MzIrb0diTDcvTnMrREtsRytlak5EZzdEZDNO?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef96452-0581-42ed-461f-08db6db17401
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 15:01:52.7597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGmwwYL1H6x8cT1bhDXKe9K09DnjUXaIZqqhq+CL6QKXp231hCIpQ/rX+u7BaRhoWD0C6lVSscciaZRe3WYHNbUJ/ukVmRRo41tlSHyjaG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
X-Proofpoint-GUID: PDoGUbDkwrJxGPln-Y5ydJ58qMY2rHQt
X-Proofpoint-ORIG-GUID: PDoGUbDkwrJxGPln-Y5ydJ58qMY2rHQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_11,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103310

Reminder.

On 29-05-2023 20:14, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> The delta between 3.2.12 and 3.2.19 contain numerous CVEs and other
> bugfixes. git log --oneline 3.2.12..3.2.19 shows:
>
> fc42edd2e6 (tag: 3.2.19) [3.2.x] Bumped version for 3.2.19 release.
> eed53d0011 [3.2.x] Fixed CVE-2023-31047, Fixed #31710 -- Prevented potential bypass of validation when uploading multiple files using one form field.
> 007e46d815 [3.2.x] Added missing backticks in docs/releases/1.7.txt.
> a37e4d5d6e [3.2.x] Added stub release notes for 3.2.19.
> 963f24cff2 [3.2.x] Added CVE-2023-24580 to security archive.
> e34a2283f2 [3.2.x] Post-release version bump.
> 722e9f8a38 (tag: 3.2.18) [3.2.x] Bumped version for 3.2.18 release.
> a665ed5179 [3.2.x] Fixed CVE-2023-24580 -- Prevented DoS with too many uploaded files.
> 932b5bd52d [3.2.x] Added stub release notes for 3.2.18.
> c35a5788f4 [3.2.x] Added CVE-2023-23969 to security archive.
> 9bd8db3940 [3.2.x] Post-release version bump.
> aed1bb56d1 (tag: 3.2.17) [3.2.x] Bumped version for 3.2.17 release.
> c7e0151fdf [3.2.x] Fixed CVE-2023-23969 -- Prevented DoS with pathological values for Accept-Language.
> 9da46345d8 [3.2.x] Fixed inspectdb.tests.InspectDBTestCase.test_custom_fields() on SQLite 3.37+.
> 4c2b26174f [3.2.x] Removed 'tests' path prefix in a couple tests.
> d21543182d [3.2.x] Adjusted release notes for 3.2.17.
> 4e31d3ea55 [3.2.x] Added stub release notes for 3.2.17.
> 238e8898ac [3.2.x] Corrected passenv value for tox 4.0.6+.
> b381ab4906 [3.2.x] Disabled auto-created table of contents entries on Sphinx 5.2+.
> f6f0699d01 [3.2.x] Removed obsolete doc reference to asyncio.iscoroutinefunction.
> accdd0576d [3.2.x] Added CVE-2022-36359 to security archive.
> 7190b38b8d [3.2.x] Post-release version bump.
> 4c85beca9d (tag: 3.2.16) [3.2.x] Bumped version for 3.2.16 release.
> 5b6b257fa7 [3.2.x] Fixed CVE-2022-41323 -- Prevented locales being interpreted as regular expressions.
> 33affaf0b6 [3.2.x] Added stub notes 3.2.16 release.
> 777362d74a [3.2.x] Added CVE-2022-36359 to security archive.
> eb5bdb461e [3.2.x] Post-release version bump.
> 653a7bd7b7 (tag: 3.2.15) [3.2.x] Bumped version for 3.2.15 release.
> b3e4494d75 [3.2.x] Fixed CVE-2022-36359 -- Escaped filename in Content-Disposition header.
> cb7fbac9f8 [3.2.x] Fixed collation tests on MySQL 8.0.30+.
> 840d009c06 [3.2.x] Fixed inspectdb and schema tests on MariaDB 10.6+.
> a5eba20f40 Adjusted release notes for 3.2.15.
> ad104fb50f [3.2.x] Added stub release notes for 3.2.15 release.
> 22916c8c1f [3.2.x] Fixed RelatedGeoModelTest.test08_defer_only() on MySQL 8+ with MyISAM storage engine.
> e1cfbe58b7 [3.2.x] Added CVE-2022-34265 to security archive.
> 605cf0d3f6 [3.2.x] Post-release version bump.
> 746e88cc63 (tag: 3.2.14) [3.2.x] Bumped version for 3.2.14 release.
> a9010fe555 [3.2.x] Fixed CVE-2022-34265 -- Protected Trunc(kind)/Extract(lookup_name) against SQL injection.
> 3acf156be3 [3.2.x] Fixed GEOSTest.test_emptyCollections() on GEOS 3.8.0.
> 4a5d98ee0a [3.2.x] Bumped minimum Sphinx version to 4.5.0.
> 1a9098166e [3.2.x] Fixed docs build with sphinxcontrib-spelling 7.5.0+.
> 37f4de2deb [3.2.x] Added stub release notes for 3.2.14.
> 7595f763a9 [3.2.x] Fixed test_request_lifecycle_signals_dispatched_with_thread_sensitive with asgiref 3.5.1+.
> 2dc85ecf3e [3.2.x] Fixed CoveringIndexTests.test_covering_partial_index() when DEFAULT_INDEX_TABLESPACE is set.
> a23c25d84a [3.2.x] Fixed #33753 -- Fixed docs build on Sphinx 5+.
> e01b383e02 [3.2.x] Added CVE-2022-28346 and CVE-2022-28347 to security archive.
> ac2fb5ccb6 [3.2.x] Post-release version bump.
> 08e6073f87 (tag: 3.2.13) [3.2.x] Bumped version for 3.2.13 release.
> 9e19accb6e [3.2.x] Fixed CVE-2022-28347 -- Protected QuerySet.explain(**options) against SQL injection on PostgreSQL.
> 2044dac5c6 [3.2.x] Fixed CVE-2022-28346 -- Protected QuerySet.annotate(), aggregate(), and extra() against SQL injection in column aliases.
> bdb92dba0b [3.2.x] Fixed #33628 -- Ignored directories with empty names in autoreloader check for template changes.
> 70035fb044 [3.2.x] Added stub release notes for 3.2.13 and 2.2.28.
> 7e7ea71a8d [3.2.x] Reverted "Fixed forms_tests.tests.test_renderers with Jinja 3.1.0+."
> 610ecc9053 [3.2.x] Fixed forms_tests.tests.test_renderers with Jinja 3.1.0+.
> 754af45773 [3.2.x] Fixed typo in release notes.
> 6f309165e5 [3.2.x] Added CVE-2022-22818 and CVE-2022-23833 to security archive.
> 1e6b555c92 [3.2.x] Post-release version bump.
>
> Release Notes: https://docs.djangoproject.com/en/3.2/releases/
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../{python3-django_3.2.12.bb => python3-django_3.2.19.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-django_3.2.12.bb => python3-django_3.2.19.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb b/meta-python/recipes-devtools/python/python3-django_3.2.19.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> rename to meta-python/recipes-devtools/python/python3-django_3.2.19.bb
> index adbc498bdf..0c2fc10e63 100644
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.19.bb
> @@ -1,7 +1,7 @@
>   require python-django.inc
>   inherit setuptools3
>   
> -SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2"
> +SRC_URI[sha256sum] = "031365bae96814da19c10706218c44dff3b654cc4de20a98bd2d29b9bde469f0"
>   
>   RDEPENDS:${PN} += "\
>       ${PYTHON_PN}-sqlparse \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102893): https://lists.openembedded.org/g/openembedded-devel/message/102893
> Mute This Topic: https://lists.openembedded.org/mt/99201148/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

