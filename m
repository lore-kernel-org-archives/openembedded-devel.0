Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72008C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 08:26:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8626.1646295967447371114
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 00:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k/xPjP2r;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0061b402b8=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2237gDvZ001589
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Mar 2022 08:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=BV7c7S2d0xTKu8IZGudSXzW5DYqtp0MyceFE4nYNKZQ=;
 b=k/xPjP2rAEnDuEbVFhq/KWWgWDA5+bjEZywXkZP5JIBnD+svntxkjhZq4RMHds24LYLD
 7gS3aJqAh9tKcQUp+Vy2NQK3Wu6pz2RMxdc/u1n69/txhkAjyf+QXcdJxZmRnuufjOFD
 ITZKgY1P3cV03/FUGu6n480fERcTl8DH4qBYSO2W0HHhmngrFrxR0ZgtKT4etViaPHOG
 jfjdIRd1/JEx00edjHSIW+LjcChttxQjK7lmKoHZIiUMmmUdSy7ru0QQArkohogWwjdK
 Ef1zROKQgpCVPxI/ySG6fITLbgEK+dtxaGGcta9qQ461PGujhfkJkCuv668lvpwYlkxG EQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh0yjajyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:26:06 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2238Q6ph001648
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Mar 2022 08:26:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh0yjajyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Mar 2022 08:26:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miCEySr+F28rWM7w3MGrptSLljPKLwR4SdQ24GEh71x0fh1vcxZl8bwuO7WYQjqdSABTPI5IhCWJhDh3ifbH6ysxhFzxcQHv4fkJw+DNQ5M2guBewTqvHrdyeuz8Wr2Zl07haq81sdWvdplLGNB63FpzcGqfBCTwyZ0qBoR4xlYZQW+OjDi6ixZzcK9IMt5BMQGMjGbqCvcklPdCxQSSOT0GHhV9tX2GSWgFJ7Gk+P90QM3f1ba4KxAOlXzypvFZx9uvrd09sy5wer3SaVxwYe6dplXCmaCO8KG71URSF+Ip8pnwZqS9uTCyyUONrXUVRZA/EEdVHexBUoMUvN4W+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BV7c7S2d0xTKu8IZGudSXzW5DYqtp0MyceFE4nYNKZQ=;
 b=L7EI27aeDys10upIL9Kaa0h+sLdcOmqFzNg0UJPz+WsOwM5sZsXesISiy0JTwqi7X899IlfBIgJjmXq7ZPrHbIzUkAQC5pC/3cjvPhHs28u2/uSqoRvkwrGEWT+mZ3L/vFr1dSkaF5925x6Jc7/tQvYO5VOYzYBQIWdl4/OhRfx5k2Yl+u0Ih9C4O9pyTDtty9GwitmYFD1pxrKkvwupZGLVYPLjzJR38bzTxZJcft8/unCqvNyyQ5djpSmFWRGkl87Yp4t9iseu/NSil+APsGiPEaA4rEexZdHZH6y5STN8MgBBrtoJ+B73/mROjv62TOmNtAsoiko0nn4gDW4LRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10)
 by SN6PR11MB3424.namprd11.prod.outlook.com (2603:10b6:805:d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 08:26:02 +0000
Received: from SA2PR11MB4858.namprd11.prod.outlook.com
 ([fe80::50a3:409a:6f29:1fca]) by SA2PR11MB4858.namprd11.prod.outlook.com
 ([fe80::50a3:409a:6f29:1fca%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 08:26:00 +0000
Subject: Re: [oe] [meta-oe][PATCH] cairomm: correct SRC_URI
From: Kai <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <16D8826CF4C77018.30493@lists.openembedded.org>
Message-ID: <1c252063-7c63-3caf-35ea-c28530255e46@windriver.com>
Date: Thu, 3 Mar 2022 16:25:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <16D8826CF4C77018.30493@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------FFAF9E95022843D223154E76"
Content-Language: en-US
X-ClientProxiedBy: YQBPR0101CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::25) To SA2PR11MB4858.namprd11.prod.outlook.com
 (2603:10b6:806:f9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd4ade6e-24d3-4ce5-bf98-08d9fcef72cc
X-MS-TrafficTypeDiagnostic: SN6PR11MB3424:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3424BCBEFDA83E7FD41EED2C95049@SN6PR11MB3424.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t0RbdgvRx1fzlU3ErZU15UGa+S+3fAop3caP2PJR8/EVO2ZFB7htpkaLrqiQ8BJW5STYcUwf9ZjBhFUXq18LcxTpR3wEQPi65ZhRjKYkE/6RvMExb3Y1ZsQGnT84cyOvFTs/kOE2ZglxEVdBQjHBUun/D35eP8Vp+Cy5DDeQrgFCrqX7EYy2jT/eR5sand7TtB7F/JrFUAR/HoXzL73iOnJDijPveZ13Ce5GJZ0LpQM0sxkQTltybSWzoBT5glauDsRtKNmLLp01kD4q6ohpKF1FfYnRIX81bT9eO1AKiRB9fHKYAaW1poPn/QaIIiffm2zA8xfXv72VqUvAXJdyq93PoHSn5BweDCzPe3dMSopWuJAIw4LfqoWHZDTOMM+rth4yU6U97BHilgEqV9gNU7Lhh/Qmh7Hjl7roqr7l1waR/QAL/TDNaFb5gy8jAhYNeoK2bEr+XXBKiTijV2YEkXGNuPpvbbBgEf3gmz+T3UeR5SBfZRPGTjlu/SK1F+cANQPd2neoIp/oNbQ0Uki4wxD/46QRZ8Pg2P/OTBxLVaE83h6+vnqqf9xpBLOkEKMdZ+ri+KHgtl0l1EiHiwCfKPZ7FjF+6ZmsC5SvOq50P1EW9eQXQVbPkzfvdC/MY5LU+In3F592H4aov+Ro0L7jIgPs4ox8Ssdkl7EQjRpHqPiUEBSEYqwSaml6JB+yGvHm+RSnko7EZYh5NrEDy6K/pOmrAEbv8gweLEcMQatuG43jZRgZux0PK/UBQvd/cwcwlsM2ZPs6iVhO0Y85PQXMMpklxRC61wqoNItRvDHfQ8xstSD3ZoiDBI6eXVWtrPqEHEVJ7lMKqKwKEv6PTPw6+tipEOKh3P2HL49sSQBQFa7M1GKa2PfbWQv+72WIX8Ka
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4858.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(6666004)(966005)(316002)(83380400001)(8936002)(86362001)(6916009)(6486002)(36756003)(31696002)(186003)(26005)(166002)(6506007)(2616005)(5660300002)(52116002)(38350700002)(38100700002)(8676002)(66946007)(508600001)(66476007)(66556008)(33964004)(53546011)(2906002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVFhQUhudDhoRmtTaDJtN0NLaXBROXFCem9ITUNKSDdMbHlyYjRuUWlxbGhu?=
 =?utf-8?B?VTFuS1VOdnRZR3hMNHkzMjIwYlo3aTVVc1BxY3ZCQnJmcXgzTlNSWXd0QUlv?=
 =?utf-8?B?WkJsVzk3UUpWM2FPRWFmbHdvZk5CLzVRMlVMcVZWQkVUV29SR2JrNmFteWhC?=
 =?utf-8?B?VVBWc2xoSXFYbHh3d1hWdnJVaW9Jby9aU3d2amcrb1Jta2NZbCtUdEQ3Yi9Y?=
 =?utf-8?B?K21BZVh0WUNSa0NqOGFkZVNxOXY1Q2dUaU9BNFVQbUh3NHNkNmplTEMyeXJp?=
 =?utf-8?B?VzRiSCthVUVnYVFkQlIyY0N2OFRRV3FPV083MDFCSFJhVGJBbmdRVStnUEdU?=
 =?utf-8?B?NVZjYmlkQ1VES3l5ZFZ0ZllsdG9mZVJicThqWlQ4YlNLby9xU24wY2NvZEZR?=
 =?utf-8?B?VG0rbUdDUVlQTkhyN3lUMEZ5d1dmdk1UNXpUUDVzK09XeFhGY3JtNVpFZkpC?=
 =?utf-8?B?NldCY3lSYUVEV3h6L3dnSWhTaSsvR1RQcGgyRWZMMnNEdGFCSVd6bk1UbzVj?=
 =?utf-8?B?MVUxbE5yZVdER2tpYk1ITEFEbVBjMkJuRkhwYnphZ2VmdUp1WXVkSkxYczlO?=
 =?utf-8?B?a2dLTzFDVmt0RHM4dXYyRUhvTWp6ZXpzOEVLWDJmcUl3NEVrV3d6YlVDZVd2?=
 =?utf-8?B?Q0xUVitBZ2NOS0l4dEV2bHJaODI5TGVTaTBEZVYzNTU1azhSSmpMemRyN0dX?=
 =?utf-8?B?S1kvRlpXelBpcDNpSCszR0h3cHhUN25Ub1ptSE4xN3JRd3NGanpSejdrMW9Z?=
 =?utf-8?B?ZVBJazFMQ3RKQkpXM2NHbURqYUZrMm1td2RtN00zYVlqNEJTMVorVm0xeHZU?=
 =?utf-8?B?T1FtdFB4amwwREtqSG1RemJPNmZEY1F2aHAyZHhka0M4MHc1VElGN3Z2OTJv?=
 =?utf-8?B?akY3TXB4bkdhUFRNQSsvR05GblpLYkNZZjAvV3lCbmhKbTE4ZllpL3ZyZkpi?=
 =?utf-8?B?ODRGUTdZWFJJa2oyZGFhbEhOVDhORTZ0aU5vdzBTMHlDK1BSTWwyQ0pVcVg5?=
 =?utf-8?B?cmNZK24xOFF2NFlrc09iYk44Q25WTEoyckZoa2Fna2h6eXYvRnRRelc3bHY3?=
 =?utf-8?B?T0xDaUVIMCtvTmVDZWFhaGcxUnNLWWFOcHhPRzFnZ1h6cXl0dkpBSHZmdVd5?=
 =?utf-8?B?UEE3UlZpSGIveEZ1bEUzMEJ5ajg4ZHcwNGhtV0xYTENCM3lmREczaG84NjN3?=
 =?utf-8?B?cVBUS29iK0RzcUJYalVVUFpYTTV1MlFqa3JzcGZYdjI1cytIMU5VV2lrakE2?=
 =?utf-8?B?TEpGMUF4ekdVWVBsdHZQQ1BVNmZLRnlMeS81VHhrOWs1b2NhRmlVaW5xUmNr?=
 =?utf-8?B?bFhOQ2grdFI2ZVpTYk5URVFsWGRTWjVDd244bDdWMkt0bFJjM21XU0RQbVQy?=
 =?utf-8?B?Z2xUKzJpTmVuNDJSWmE1Zlg3VEVZcGphYUZNbzBMQ29ac1ZMVFg1ckZSZzZI?=
 =?utf-8?B?OWxQdHo3eU1TVEtoZTEvdTZGSG1iOTlCa2EzWVczc2FqMEZTUXlqVHQ4SlI5?=
 =?utf-8?B?OE55M0tDUnRHZko2eWMrU0VHZ1luaXpkTk9DOHhFaVpTdzNjQTUxWmVsOSti?=
 =?utf-8?B?NXVBT1NESS9YRTJTZGZkOC91WTM2VVFpdUVHck9JRmZvbm1nOXBKd2wzTlMz?=
 =?utf-8?B?NHZNOXEzWW9XS01odVpyRkxrQ1dhQUdjNTZOSDh3Ukg4SGszd1dTS2h3dDNM?=
 =?utf-8?B?NnhBQWs3eGJQRFZqTmxPMWxDU3dTRDFYY1B5N1BXR3VrL3k4UFV2UlBRRHRD?=
 =?utf-8?B?MmRBTjdoellHVDQvZE1vaExTUWZER2JGSmJ4OURDVHA3VitJUXRKdmpuQ3NW?=
 =?utf-8?B?NzEyODd5a0Fadjd5NzVVR0VTTEZ5NjZSVUd4bVZnWXBRYUQvazlWLzMrK0Ni?=
 =?utf-8?B?TEozcWxET2FsTmh4U1paU3VkbXJ2eXFHWlVqbmJ3VE84UTFlUmF3VGIyMXdD?=
 =?utf-8?B?dFRxdzFaSlB3REZJOVJvOVhBS1czcCsyeWJpMmh1cWdLRzNsUWFBditxb2Nw?=
 =?utf-8?B?TUdTd0lHV09oUVoyZHdOTCthbEQwcUp4K0VqaHJMQnQrdXFaWXhtd0RRWlVT?=
 =?utf-8?B?VFQ4ZTQ5MElMOWUzbXlxcW9hQis3aVN6VFI1L2dSa3Joc0wxSzBjTGlsdERP?=
 =?utf-8?B?QjcwQnBKQTI5bW1WVlZ4YzNpSXBXNGVRSlRBcHA3OWRYeThSRlozZUVlcWtJ?=
 =?utf-8?Q?PqDHUtko3+XjD/mT9ZgaCGk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd4ade6e-24d3-4ce5-bf98-08d9fcef72cc
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4858.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 08:26:00.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2ZzsuI1UtM7M87T0x610xUUW8+x3mqebMQLaNiQl/f7VnV5Fdhb+Nh8QteDgD1odKfyLL9y7p8uwhH6VWw6jEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3424
X-Proofpoint-GUID: oYpl3AaSgwUWIDi3LghGPL0vVQKApPKf
X-Proofpoint-ORIG-GUID: BytijPx4w-ygX6a372HYYTBDhVx0kqZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-03_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=904 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203030040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 08:26:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95732

--------------FFAF9E95022843D223154E76
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/22 4:17 PM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
Hi Khem,
> Issue: LINUXEXEC-18920

Just find some internal info in the commit message. v2 will be sent.

Sorry for inconvenience.

Kai


>
> It fails to run do_fetch for multilib build.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
> index 6407c6885..2e16da312 100644
> --- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
> +++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
> @@ -8,7 +8,7 @@ inherit gnomebase
>   
>   DEPENDS += "boost cairo libsigc++-2.0"
>   
> -SRC_URI = "https://www.cairographics.org/releases/${P}.tar.xz"
> +SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.xz"
>   SRC_URI[sha256sum] = "0d37e067c5c4ca7808b7ceddabfe1932c5bd2a750ad64fb321e1213536297e78"
>   
>   FILES:${PN}-doc += "${datadir}/devhelp"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95680): https://lists.openembedded.org/g/openembedded-devel/message/95680
> Mute This Topic: https://lists.openembedded.org/mt/89497039/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


--------------FFAF9E95022843D223154E76
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/2/22 4:17 PM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16D8826CF4C77018.30493@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
</pre>
    </blockquote>
    Hi Khem,<br>
    <blockquote type="cite" cite="mid:16D8826CF4C77018.30493@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
Issue: LINUXEXEC-18920</pre>
    </blockquote>
    <p>Just find some internal info in the commit message. v2 will be
      sent.</p>
    <p>Sorry for inconvenience.</p>
    <p>Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:16D8826CF4C77018.30493@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

It fails to run do_fetch for multilib build.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
index 6407c6885..2e16da312 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
@@ -8,7 +8,7 @@ inherit gnomebase
 
 DEPENDS += &quot;boost cairo libsigc++-2.0&quot;
 
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://www.cairographics.org/releases/${P}.tar.xz">&quot;https://www.cairographics.org/releases/${P}.tar.xz&quot;</a>
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://www.cairographics.org/releases/${BP}.tar.xz">&quot;https://www.cairographics.org/releases/${BP}.tar.xz&quot;</a>
 SRC_URI[sha256sum] = &quot;0d37e067c5c4ca7808b7ceddabfe1932c5bd2a750ad64fb321e1213536297e78&quot;
 
 FILES:${PN}-doc += &quot;${datadir}/devhelp&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#95680): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/95680">https://lists.openembedded.org/g/openembedded-devel/message/95680</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89497039/3616933">https://lists.openembedded.org/mt/89497039/3616933</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------FFAF9E95022843D223154E76--

