Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83263C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 05:37:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20759.1637905065088412104
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 21:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=bwUEypLK;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=69641bd5a6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AQ5aMIh011817
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 21:37:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VABEBWMVlk3gHkXctTkKJdv5dci7zGjvgJfwdUL7phg=;
 b=bwUEypLKu55ZOeZL73fIYScrNp9TgVScKqS4K1EHjr+oSIr+bHTHvfSas/u7R5FUS8so
 oLUf1AQOlRLCWAnZOCFxkXMW5XSwMqWPcXhOkq9UWldeHVgndy52A+szH2lutZ02Ixcs
 gjvQEHV1xQKzXsRWhaECHHl9j7R2tCCxDqK4kiWX1Wj2fvwiICiTAvafEx2o52mNUyom
 Tr7vE4/4fwX5176klmMPnYSZ6ayiahKxiyfwNuEXfB0i9PP00o33tPR6rsWLXoD4ybTu
 k9no68SlJVA29pLYSP7aEsB1fJABLkkreBVZo1mEXVUpgfM5C5gOxE5Yz2UrZwjPBVR5 /A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chn251hbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 21:37:44 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AQ5bhan012737
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 21:37:43 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chn251hbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Nov 2021 21:37:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Op0vl5/wf5PzX8+QZ63GZU2m4ceqpW74hato6TVbzIPoEdQwZvayNa2wmHuT9wnHFJcdfqFwmJIX+gCGOeQ56qm144+NhHX06hQiKlmj5vjSBVXx3qHnMbxyhrVefaJP6fgxZrn9gDoSSD6PggC555SQnGjnEH3QZMlS1iff3++r2f3Cm1U5OQnUJ73+1ZXh/6gPqDadcIIoPqH1WUJxqcbV6f/5yYK9jWRnf4MyQH0VBID3WFzuhIP2GraLzEGbMvpBar/eSGLjCvQ8tG5TNOeZ5J62fSjnj9XUEFVpdnW7S/M0cxpfRakv5LOnr5PFzxfRXfX06d9wydG64AWtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VABEBWMVlk3gHkXctTkKJdv5dci7zGjvgJfwdUL7phg=;
 b=U4462cqJRUDn1NPCXesJPQVeQlbOZdMPfz9yUzdGHrmEnU5+cXI3c+1FOd/enebREmh6nIsn1ZwZdLpC/TgyLrrgFqVePgKF6op8BklH69YjxAs+fIwSgBj6rHGiGUlBJ8XsArQWqaJoYZuSEWh5LrJCceU4m7gEqWy1tBPkajZf0K78ttJMmhro4+3U2xuWWKrU8rmL6urwAIDPsyRZNc11QsXc5PYA/WWEnEdtPO3t3YN1kxgO5ngjgsnACMApKMwol9Si19WfyiUGpA0mYWUn6g09tYHRpAvGppkKLh02sRm9prsDqUuE+o5jwO999+jWbS/aZN0SoABdFY6+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1488.namprd11.prod.outlook.com (2603:10b6:301:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Fri, 26 Nov
 2021 05:37:41 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Fri, 26 Nov 2021
 05:37:41 +0000
Subject: Re: [oe] [meta-networking][PATCH 1/7] libtalloc: fix pyext_PATTERN
 for cross compilation
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20211125024450.143364-1-yi.zhao@windriver.com>
 <d13450e5-802a-70e7-cdab-bc6aefffc08d@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <d5ad76e7-1d15-93c7-5403-ee0f04ac9b11@windriver.com>
Date: Fri, 26 Nov 2021 13:37:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d13450e5-802a-70e7-cdab-bc6aefffc08d@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: BL0PR1501CA0005.namprd15.prod.outlook.com
 (2603:10b6:207:17::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from [128.224.162.174] (60.247.85.82) by
 BL0PR1501CA0005.namprd15.prod.outlook.com (2603:10b6:207:17::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 26 Nov 2021 05:37:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8ecae46-5008-4940-107e-08d9b09edd35
X-MS-TrafficTypeDiagnostic: MWHPR11MB1488:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1488DC10C8085630D259EA38F9639@MWHPR11MB1488.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ePHXgQqp3rRyxSoPo7mHnabhv5DFlxq33HFaBIEr6FYOSAevtnBQQbPxe2zqfEets8Wn/R5SZc3U02jcToFYF8Lzf5kAFZETBarXFb97SEgp8I4jAmkKbRpAUDRqcSbfai4bm6cvnBz896xxrwYpNMjGUyoy0oPjS3nKhbSEH6wEHOMgcSJFH6k7MebuFLCRhAvBOkPmyO9DCv70Bzrrapwr76fPEn3UnzQteBwYJnNOj2k6/J5Ghs+CuKeMT2kCsA2fbGe33PLx/anM724bgM509A/u5BWphlpqLnEDnQDlZsanhATco0+ffH1Hzh+2YWXuczK/nkJpx3RJdgA9coHbYnhDN0vjl7pmOpfXpuweyAe9PyR7FMAaVb1gSSFa2UbNs55EJKsJIxH2xlIuEbxieEy5czbegu1sTLJvMSgKRb1a1FuwSB6fglns5tESjXqKq9j87UTtq8omQUuHgCyRLZJtUxO/4+BjxI5hH+4eJU5FTR6WGwbs04OGj/Rg6keJ0/lFZsqGeTuKZSlIiDvazRkR7K5T/GNeobVoKlQuBq4jJ5BPHWV+KbCGaqBR+3+t85OeaqJa4x8U6i1Zg4qAwnWd1LQI9ErkPJ9j5Tm5ylD8PfioMLS/y744dFq4e3PH4/qq3tgyMl1wvmDB77HNDRlEST64w5NQuE0xy/MXrEv2V9bwN5T3TgeXmWjfDxjs2PlUw0T8nbzQuJ8EkeVn0CVYrIG9BUOIK8ad+LTV0BNxhvXzXQq0aaknr0yxnHX6mqHifGvuDbU1dCAQo4IH3smBP3LD99qreGbsdsLT46wF33Y+qfeuL+0fs0N7x97BOL1KnMFZBfMuvm2aoysYfA7NTsG7ZE9uGONHkGRRasHmnnr+FB+xlignIBTuT8JwS69NHd86uZXho3soe99S1Fh98+7VaZlAcF/bGHI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66556008)(66476007)(2906002)(53546011)(31686004)(66946007)(6486002)(2616005)(83380400001)(36756003)(38350700002)(38100700002)(956004)(26005)(44832011)(6666004)(508600001)(8936002)(6706004)(966005)(86362001)(186003)(52116002)(316002)(31696002)(16576012)(8676002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2NxbGhoWXJqSUtPeFR1L0JpSE00ckVJbzZvNDdhY0wxcUNVTUlFVktFYWpr?=
 =?utf-8?B?R3k4U2IvSGszV0V3NkZHdkdLNGNwZTZvRzE3cXlWS2tuVTAyODZVWnBaVjZ2?=
 =?utf-8?B?NG53MGlnL296ZFk4NXArTVdnaURIeEMzMTRFb1V0dEswNktseFhhL3psTVhC?=
 =?utf-8?B?Yjc0a25kbEQ1NThoOXJNS1AxcnpoL2xvaFFoSlNCS1Y1K1kxbEhIS0srcUN6?=
 =?utf-8?B?ZmpqMUlQYlNMVG5IVWV0dDR2TzFjV1U3QS9qS2RRVmljYVlTSVgrQ2NhTlBr?=
 =?utf-8?B?dnA1Mm5Ocm5pc1IzeS9jSWJTQWFEcmhYeG5XQXFaN3p5Qk9xbmJPYjBFcHpE?=
 =?utf-8?B?ZFVHeUJyejJQb2JZUUFhaVB6N0hZUGtlKzU4eHBpeURYTmN2NFVsdVZnM0lW?=
 =?utf-8?B?cHkvV2djVGwwanFCaGJWd20vR2RMSFJzSnNZbCtaK00ybEVjRjdGeEdBZFBB?=
 =?utf-8?B?RHl1KyszUW9GelhOZzRFZzQvbHhmQ05aNzhNR2RaZmJqV3FEVGs3a2kwU0NY?=
 =?utf-8?B?blkrcFYzdFRhKzJzR29RRWxLV2dYUUxkUTAwRHF4WVdMNlZmNjJiQzB3d1VF?=
 =?utf-8?B?dTArcUQ5c0dHRldwcUN1aWNnODdtN25QMXpIKzJmOTZHMlIydFdWdHhKck53?=
 =?utf-8?B?MGF2VzFmSVJwYWdiR1U2UDd5MSsvbHpTZUhCeHgvSGhncEhCTHJyc1lUOXZV?=
 =?utf-8?B?L1UrbEpuZ2JDWkIxRWxVeVpqUk04ZGV1cGpwd0FzQlV0RjgxZzNRZ0c0VzFq?=
 =?utf-8?B?SVRXbUUwbFJ6VzlSQ0lia0tDRzk0emZtSEtvYmFNb1dCbDR2WjlVakQrSWFO?=
 =?utf-8?B?MitaK0hSalc2N2l1V0VHM2lEY2RkUlJvdm55WXJ6eVlleStYcWZJcFE2UTlo?=
 =?utf-8?B?Y251YzFJWWI2YTNpWTJHQWRUY2JPRDFIMmtHL2R5ZTg5YVE5QXN1amlBUmpR?=
 =?utf-8?B?bGJvWEpQMTRQMTR0cm9HT05mejRybGt3RVVqSmdIUUlscDJ2NHc5elp2cko2?=
 =?utf-8?B?MDRoYjJFNWNkNWlaT2UvRkk4RVAvZE1OSUJmZHVQQUxSZGZ4REl4T08zYm90?=
 =?utf-8?B?ZEJRNlpzalBCTUczYWROSWdWNk93ZTFFSHEvV2tlMzN2SUtXSFk2bENBVGIw?=
 =?utf-8?B?b09RY2hucFhKbmlmZjFQUXhjdVFDNExjR21sakhPSnMwOEpqRkczeXg1a3BP?=
 =?utf-8?B?bkkxemVVU0RnZVRmSVMxRjlwKzgySHR3SG0wV0xsNTdGVVpTSnJHL21iZTFR?=
 =?utf-8?B?K21nei95QUZab0xna3Y4ano2RHpVRnV5anl6RGp6NDMzbnkwMUF3MGJQTUZx?=
 =?utf-8?B?K2kyTGxidTVKSkR3WEVQdHZIbkhVOU83VllvVVZkUUhlMlFqaFhXeE50NUc5?=
 =?utf-8?B?LzNnNThHK0ZDWVdXa3BiYW5MN083dHFyQkdlR1JjbHVaU083aVNwa2pxQXky?=
 =?utf-8?B?RTJIMUhUOWh5WVRSNmlVRUFRb25mTDBSWjhpMUk1SHdRVlUvNWh3Ny9nVFcv?=
 =?utf-8?B?aUttdDlkc0hZZmVpekpKTTFNTmVsK2RMVjJBaHl5Q0kvd2NNT3Jqb2p3elJ3?=
 =?utf-8?B?ZGZlOWhZMi9NZFVaaEFmVXdNYUxwQ05NOTZzMzYweTNxR25vb01GL3ZTVmk4?=
 =?utf-8?B?TjVFOVRxWTZSSE9DTTFJR21YZWRZckdrcUROd1pzZW55d3JYZktyUzgxYkhv?=
 =?utf-8?B?QWc5UHlLY0htcjd1am0vOUhKMVIrQlRLdDlBa29MSnRTbVUyamxYMDhRVkNP?=
 =?utf-8?B?UXhGK0FjV0MvcnJUb3NydXhkV2daWVFma1k2NlJWTE83RThkMzlITHhZcUQ3?=
 =?utf-8?B?SExWbk1mOXhWK1B3ZnJudll1d3RZRFZEQnNUMG81VElqMEZOMEFYMUtKdDVr?=
 =?utf-8?B?TDg2Zis0b1ZZUHA2bHhXcEN3akhoQkRJeEdDTVFZYkhwMVJpNjdRUk9QbDJx?=
 =?utf-8?B?eFZhNmd3bTFSaWNEMWZKWmxRd05Sa0lrakxVYzM0SlRzeU9WRHczNUJvZjdK?=
 =?utf-8?B?WU9pUkUwL0wrUHJVRk1ySkEyYm5sWkdpS3l5RS9aK1FMN1dPdlY2R3JQUHB6?=
 =?utf-8?B?TzdTdXpCV3ZrNkxuMjY0NkdyMTBKdzZ6MnIzNXpYVld5a3hCTGF3VDlrRUhN?=
 =?utf-8?B?T1kyWGJ3U1pUd2RtR09vbnNFTzhYYUxLQlJYTit5TzdYME1sbFF0SDdqR05X?=
 =?utf-8?Q?YFrrqRQqWMkjsq9O+ksv0/E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8ecae46-5008-4940-107e-08d9b09edd35
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 05:37:41.4340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GCPpG/QRCZUWoCc8iHLFtBONQvTZguiiVkTli06ZX++AAyru9sJilhGLWUv1zapW/AID2l68oEOFtimC0Jg+uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1488
X-Proofpoint-GUID: q7A2EqrVFPZ30RVN5g7su3As9xr8kVFo
X-Proofpoint-ORIG-GUID: gKDWlDlU85lPuPYFfSs1481z1ra7zGAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_01,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111260030
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1AQ5aMIh011817
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Nov 2021 05:37:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94126


On 11/26/21 1:30 AM, Khem Raj wrote:
>
>
> On 11/24/21 6:44 PM, Yi Zhao wrote:
>> The pyext_PATTERN will add native arch as suffix when cross compiling.
>> For example, on qemuarm64, it is expanded to:
>> pyext_PATTERN =3D'%s.cpython-310-x86_64-linux-gnu.so'
>> which will result in the incorrect library name.
>>
>> root@qemuarm64:~# find /usr/lib -name \*talloc\*
>> /usr/lib/pkgconfig/talloc.pc
>> /usr/lib/pkgconfig/pytalloc-util.cpython-310-x86_64-linux-gnu.pc
>> /usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2.3.3
>> /usr/lib/libtalloc.so.2
>> /usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2
>> /usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so
>> /usr/lib/libtalloc.so
>> /usr/lib/libtalloc.so.2.3.3
>> /usr/lib/python3.10/site-packages/talloc.cpython-310-x86_64-linux-gnu.=
so
>>
>> Set pyext_PATTERN to '%s.so' to remove the suffix.
>> After the patch:
>> root@qemuarm64:~# find /usr/lib -name \*talloc\*
>> /usr/lib/pkgconfig/talloc.pc
>> /usr/lib/pkgconfig/pytalloc-util.pc
>> /usr/lib/libpytalloc-util.so.2.3.3
>> /usr/lib/libtalloc.so.2
>> /usr/lib/libpytalloc-util.so.2
>> /usr/lib/libpytalloc-util.so
>> /usr/lib/libtalloc.so
>> /usr/lib/libtalloc.so.2.3.3
>> /usr/lib/python3.10/site-packages/talloc.so
>>
>
> does it work well in multilib environment too ?


Yes. It does.


//YI


>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>> =C2=A0 ...-pyext_PATTERN-for-cross-compilation.patch | 57 ++++++++++++=
+++++++
>> =C2=A0 .../libtalloc/libtalloc_2.3.3.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 2 files changed, 58 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PAT=
TERN-for-cross-compilation.patch
>>
>> diff --git=20
>> a/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_P=
ATTERN-for-cross-compilation.patch=20
>> b/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_P=
ATTERN-for-cross-compilation.patch=20
>>
>> new file mode 100644
>> index 000000000..47ee4bb24
>> --- /dev/null
>> +++=20
>> b/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_P=
ATTERN-for-cross-compilation.patch
>> @@ -0,0 +1,57 @@
>> +From b5eaeb7ed4e75012d2715f995e15a13850064f61 Mon Sep 17 00:00:00 200=
1
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Wed, 24 Nov 2021 13:33:35 +0800
>> +Subject: [PATCH] Fix pyext_PATTERN for cross compilation
>> +
>> +The pyext_PATTERN will add native arch as suffix when cross compiling.
>> +For example, on qemuarm64, it is expanded to:
>> +pyext_PATTERN =3D'%s.cpython-310-x86_64-linux-gnu.so'
>> +which will result in the incorrect library name.
>> +
>> +root@qemuarm64:~# find /usr/lib -name \*talloc\*
>> +/usr/lib/pkgconfig/talloc.pc
>> +/usr/lib/pkgconfig/pytalloc-util.cpython-310-x86_64-linux-gnu.pc
>> +/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2.3.3
>> +/usr/lib/libtalloc.so.2
>> +/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2
>> +/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so
>> +/usr/lib/libtalloc.so
>> +/usr/lib/libtalloc.so.2.3.3
>> +/usr/lib/python3.10/site-packages/talloc.cpython-310-x86_64-linux-gnu=
.so=20
>>
>> +
>> +Set pyext_PATTERN to '%s.so' to remove the suffix.
>> +After the patch:
>> +root@qemuarm64:~# find /usr/lib -name \*talloc\*
>> +/usr/lib/pkgconfig/talloc.pc
>> +/usr/lib/pkgconfig/pytalloc-util.pc
>> +/usr/lib/libpytalloc-util.so.2.3.3
>> +/usr/lib/libtalloc.so.2
>> +/usr/lib/libpytalloc-util.so.2
>> +/usr/lib/libpytalloc-util.so
>> +/usr/lib/libtalloc.so
>> +/usr/lib/libtalloc.so.2.3.3
>> +/usr/lib/python3.10/site-packages/talloc.so
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + third_party/waf/waflib/Tools/python.py | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/third_party/waf/waflib/Tools/python.py=20
>> b/third_party/waf/waflib/Tools/python.py
>> +index b1c8dd0..24faa31 100644
>> +--- a/third_party/waf/waflib/Tools/python.py
>> ++++ b/third_party/waf/waflib/Tools/python.py
>> +@@ -328,7 +328,7 @@ def check_python_headers(conf, features=3D'pyembe=
d=20
>> pyext'):
>> +=C2=A0=C2=A0=C2=A0=C2=A0 x =3D 'MACOSX_DEPLOYMENT_TARGET'
>> +=C2=A0=C2=A0=C2=A0=C2=A0 if dct[x]:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env[x] =3D conf.envi=
ron[x] =3D dct[x]
>> +-=C2=A0=C2=A0=C2=A0 env.pyext_PATTERN =3D '%s' + dct['SO'] # not a mi=
stake
>> ++=C2=A0=C2=A0=C2=A0 env.pyext_PATTERN =3D '%s.so'
>> +
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 # Try to get pythonX.Y-config
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb=20
>> b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
>> index e6e2066a5..9b207609f 100644
>> --- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
>> +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
>> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D=20
>> "file://talloc.h;beginline=3D3;endline=3D27;md5=3Da301712782cad6dd6
>> =C2=A0 =C2=A0 SRC_URI =3D "https://www.samba.org/ftp/talloc/talloc-${P=
V}.tar.gz \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://options-2.2.0.patch \
>> + file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
>> =C2=A0 "
>> =C2=A0 SRC_URI[sha256sum] =3D=20
>> "6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94116):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/94116
>> Mute This Topic: https://lists.openembedded.org/mt/87295464/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

