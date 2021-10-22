Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD19EC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 05:14:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4281.1634879691984167422
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 22:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=pT2Orq28;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5929f4c0fc=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M5AF6Z003134
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 05:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : cc : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=SUjVu3LtF0qCUEfpodTP7NbHACUw2M748m15ySBS7zo=;
 b=pT2Orq287UD90hpfotelVm1Kbp8Xdm4GmSFxgctx8bnBzTooe7RQRp9htlDhNE8C3KfU
 ldyvSoS4QteEWz2cbuo+Sg5YG6CJx6IsmPGfUNdLcH7AiznnTnxaKYh1LQ4BNdAjaPWL
 A/+5/cDarrjfzzJtKW4VE0Y6jVxI4w3AvEkNWrP7gUkjPevlbwPkvm7Iy9f88u41axiE
 CvoUv04mvmIGuq8Kz/Vvt5npQ+co+LWamLb0VFV9/sEJB5dCbGakehJ2pqvWmfHbtveP
 WK40sErYcpCCeZ8Kng06VckWTCZE55zUlsOogz79nazvWhx5IBvbrrXKQsn0633PE8WN WA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bu0uk91sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 05:14:50 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19M5EnAb010828
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 05:14:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bu0uk91sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Oct 2021 05:14:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsNjznD3q5DAs2NUsIn7Pq1mIWTX1SjbiTeu9LJC/T9KKIJp3yH+dzWm0c+QcJLJ5OmZl31wmlnJ81M2bBWksvPN+vOmoa/yP6A31QkQbRVPVmSR0ciNn5WMNXmrdBEreFngYbNX5OFAT11c03ydxctF4e28KzEzroOYWLs8A09UE7FlfKqxGmCs0OuVKa3CzZyA6xHVRWMIp24blJEeNeTXuh5ANhQcwE8z53wah695JZb+CAz75ZXXOryZ1d+UdN4MuUGnmdDQSHFfRvyrmgW2NvzO2FFvYY2NaU87+aZkqQas3qat0V7Sg5e9P8X7W9Uemm2wazpGzWVeIkeH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUjVu3LtF0qCUEfpodTP7NbHACUw2M748m15ySBS7zo=;
 b=nyTW+ae++NxOe5eU0mPwW1uwRwtfY9T6cA1wAR3ncF9/xH0/xgNqof2+gZsNpicaizINrwZuaNUG8b+cYWB2IFay3BOakAuYl2tM0cncSMyjkHllxODl1D/s9qxlPm8HCi/yqLEemGxfomOrxM3pQ0nxPkGNCvocGPyaEl7uVHx3RobcmnRgPbNcCyVYW29WsXaY16VWEzCC/OOwvmVPk2vKkTKzh8TTUh+qMEyEDBJGDBjb/+qZfKjRnmrIZUGbHSypsolRw5EgxoOwrhi8ln9dqyZ+iHF8iQKRb9rc5G4p+rSgSEjHfYVDSq1nZG/ZxKRLn+UotAymddhlD2kq8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 05:14:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%7]) with mapi id 15.20.4608.020; Fri, 22 Oct 2021
 05:14:47 +0000
Subject: Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs:
 upgrade to 2021.8.22
To: Khem Raj <raj.khem@gmail.com>
References: <20211019045923.51357-1-Qi.Chen@windriver.com>
 <b73a6500-6db3-57ec-2ccb-4616a719d276@gmail.com>
 <4d0ea54a-fb51-982d-2936-027fe91c4d9d@windriver.com>
 <CO6PR11MB56020D2F23E77A747EEAC365EDBF9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CO6PR11MB5602FBC27E267729CA21A55AED809@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CAMKF1sq3V_HVeo+31bYpSzCUjTF4+d5LGUvXEcz+bDiBnL6OQQ@mail.gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ba27b308-db14-f070-e024-02b216ca305a@windriver.com>
Date: Fri, 22 Oct 2021 13:27:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: 
 <CAMKF1sq3V_HVeo+31bYpSzCUjTF4+d5LGUvXEcz+bDiBnL6OQQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------AB7DE6AAF773A007A49122DD"
X-ClientProxiedBy: HK2PR02CA0205.apcprd02.prod.outlook.com
 (2603:1096:201:20::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from [128.224.162.158] (60.247.85.82) by
 HK2PR02CA0205.apcprd02.prod.outlook.com (2603:1096:201:20::17) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4628.15 via Frontend
 Transport; Fri, 22 Oct 2021 05:14:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0916ad29-4b3c-47af-2520-08d9951addca
X-MS-TrafficTypeDiagnostic: CO6PR11MB5585:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB558503ECA129AAE5A597ED9FED809@CO6PR11MB5585.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ki/GlAYkJa8NViqX7qKra2Qotx/NR5LdQ0fNOiOGO/zlp+6FIruwofD37TCxYb7z++iiUUnO9IkRB+dUqV/qocJecMxNwS8J1SjmnK9lZjMQ3qNtXtZC8oOEAiYhxZtb9cUiP251q7EcTN2Kf2RTRN1QuyQ0cyr0mkTWMFP2Zl6If3p0n9ZDNIw4MVZGAYmFLtlNIWUM6j7LcXKXb669Jywcz5r0WRlMv2/dcEGeLl+zctiIuwVw3vMHdsVVBSJuVQOPCVUJrdButJkZDMINCB+WGZMaHBfMRjlKlOZKDsStMBrhJoojoOpfDhEqdI0w6EkEbH0QtSAHN2jngWIv6CDdLyY1/LOjBygFTA9BiI5IVUlu3ejAMpaJmAoxLR5rI5W5MNDA6IDgG1TlthTku7xL2vt2urzW2pxfwx1t+pz+7iLz0gyv9SWG7DSu+tmfbW7i/NSFnLEAn6qz+snCf1R7hEvkP0jjUmF6YgU8OZEiy9Ty0Nf3d4ogdibWEk3n1ACBKGeoA+2fMMR2cr2dzDfHRVw2Xonsl8em0G8t9kPaGm6KWAiSLA2eCnFfj0zeHm/tJl0iirPyfKEhCbgyFQZaDAudJcnQYI1nneaWqYYDZ6DttSUbJeZ7hbuMPqBM/bUbCf79O87STXQ8A5mphdyRRDMYP0qcKpQaGz8FRShwLL72mR1rxkJag0tNMhpdCf+13ybCj0LhsY16GAUMG+qJ5nY6hKZ+M4PQtBcPbBnToC+n2Yob1yox1B98ezUMKgFIVz4nDbY9UvSiza89JGaIGL4rCdLTQDe5g11gbwGVu8pIe/ubLd4DszmHYZCj6B4aciFt/cxUvxkeXg0ejPf4QFgbvfoSmPp7P2F8J4L9fnK6bFs8PNzGA9ZSKnaDYvZ37EjBYlkSNLiiwCMcjla5iU+zqP8wIE+CBan7k7I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(66946007)(30864003)(4326008)(8936002)(6486002)(66476007)(66556008)(38350700002)(31696002)(38100700002)(33964004)(52116002)(26005)(86362001)(53546011)(186003)(956004)(6706004)(5660300002)(166002)(36756003)(6916009)(16576012)(4001150100001)(83380400001)(508600001)(2616005)(316002)(8676002)(2906002)(31686004)(966005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1o3dXZ2cTM4TVJSNTJmNk8xRGtpTFRBUk9aT20yRVdtbTU4WCs5V3ZNTHBP?=
 =?utf-8?B?b2l6U2ljTkswSCtEYStyKzJnQkRzS2JFbGpSaDlTK245d2JQeEY4YmswVEdj?=
 =?utf-8?B?QWtJNTg2a1BBQXBXOEowOFBXOFN0clJ0cEdmT0VSdXZydkMyOXZtNk0xQnJZ?=
 =?utf-8?B?bERUck0yLy91N0x2eGhzMC9hZ3lacjN3TzVuYWhzZEZLT3dhRXFpRU1TL0Ex?=
 =?utf-8?B?b2NhZzBtUHBCdDFzL3RxYjdwUWRZRzR2RW5wT2ROb3JzYmU2MmNGYXRaUWZH?=
 =?utf-8?B?UEhqcTgwbFlNdTNyK1ovVjY0QkdyYW1CS0l4K3Z5YnFlVVNFKzRaVkROUVFm?=
 =?utf-8?B?dVM0aWhUN3orL3ZGK3VKa2MrT0twWTZkVkdVTGFGNm5udlJNUDlVQzlYZVEz?=
 =?utf-8?B?QWhCdlE5bXJRMW84aFg1algzeWRqbkhaaWc0Mk1GaGpFUCtsVmdrZmtyN2Nu?=
 =?utf-8?B?dnhzVWprR1BUbjRMRmZpWDVkUE14eWJrQTlPNlJ1RmxxZWEyOEU3anhxdEgr?=
 =?utf-8?B?V2tBMDEyU2RJRjBXcFRTZmNVREJXWUYzNHJsMkFlZ3MrZTA5cWRZMENxdnlC?=
 =?utf-8?B?UjJDWlpKUk5oTit1WGtIdFhuL0hnRHpnZXpOamVFZEovT1NOcWRHKzRDU1I0?=
 =?utf-8?B?amJSSjBvUWV4K0w0U2dFWGlnemVUN0ZPNEJaMml5WWoyTVdLUFkwMVc5MTIw?=
 =?utf-8?B?ZVJyTW1LbUdpMHllTDlKUnBoU3FyTHdNeDlDYVJzVzhGaGNoajlqYjdhZXVF?=
 =?utf-8?B?MTJ3ZVdqVW12MFFSWG9HWnRHcEtDTU4wWXZFR2xDRHBqNVJYb0JianIxQTY1?=
 =?utf-8?B?UmtZWEtIK2Rxckd6NnptOHV1R1Y0M1drbEVwQmcwOWF6ZHpQS0tDYy9WMUk1?=
 =?utf-8?B?UDFuN3FVZ1F0bHVMeDJESnV0Y2tvZ05sTlNBWmpQMHMvTU5oTjA0NVAyaFdt?=
 =?utf-8?B?aGZNZGdWVDQ0UjhrMWx5MGErcERxTjExSnFISXBKeU9nY0wvcnlENk5IU0Ry?=
 =?utf-8?B?b2UrZ1pEY1dnRlVqb3FBS1Z0M2JHdnQ2Kzl5MkRHRnJjOFVnejgyTERNbDVl?=
 =?utf-8?B?UjJPbW1FOWxVYktjdy9wdithYWk2Q0syU3padDhVMU8wc2FzZEp4NU9PU0Rq?=
 =?utf-8?B?dnNDbzNTT3AvZ0FjRSt0R0djZy9oZGRJOGFHQkN6MFpEYU5PbENjWW9vNThE?=
 =?utf-8?B?Vi9KWWs5T1R3ZUxOQkxBaGhVZ3loSGxjNEgxUi9JWEpBZ1RlRmpDNTBFVHlH?=
 =?utf-8?B?OHRzcEhjMHAxUGFFSFpjMmMwaVgzd25vR0UyaHcvSGZOcWNXNW4rUkxjV3F2?=
 =?utf-8?B?Smd1NlhBVnlId1d1bnpRTlduaU5oM1JWcFh6L1hzSitKWUljQzRONHZReXI3?=
 =?utf-8?B?U0RYODUvWjE3ZmpVUjZjYVd5T01uWTNMd3pmMHFlRXNCbWEzTSt2TGFnZzFG?=
 =?utf-8?B?U0duU2dURGxwcEtTM1BsVUl0UmNocnJWM01QYTl4cjJ1b2dDejd3eW5GSTNY?=
 =?utf-8?B?OE9kcHJMdFhuRHlWc09TbWRvOEI1VGxiNFhuNWVNWFFDS25PT1hybXlQMi94?=
 =?utf-8?B?ZDRmbSswb1Jya283cGl6dTM5NnBMZ0JpaGJEcTZtS0lDNDVtdHRHenFpdjVw?=
 =?utf-8?B?MnVsSHNBNkFoeWNNekFvbm1xVlArTzVvWVhMQzNrQ0lucFFsaFNsYVN6ZWlP?=
 =?utf-8?B?U1QzWUNjNnR0YWp1Z2tyQThTbXJ0bGpCMkdFSys1V0NmZk9YL3NxZWd0ZmpP?=
 =?utf-8?B?a1ZVT3JBVVJaajZ5d2RJQ1I4TzFmdmlZT2VaNG9Jdy80eExaOUpNT0VNckQy?=
 =?utf-8?B?Rm1VK0s0VXFQckJNMGRxeW00Mlc0ZGFMbm5pRnVvakc1U0hhNW04MkVCeUpw?=
 =?utf-8?B?N21VQU92UW5OdzhPY1ZZUXQ0MkhqWStFbFF6S1lkMCtyNXI1QU1mcjM5RjFy?=
 =?utf-8?Q?B+rNG40958E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0916ad29-4b3c-47af-2520-08d9951addca
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 05:14:47.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qi.chen@windriver.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-Proofpoint-ORIG-GUID: hPWwR5QXy_RXrSE9-qHUC1B-jkiGoZHW
X-Proofpoint-GUID: k6PN7ctXRxB5KsIb3Y_m6Gs-mOZb8ysa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_01,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110220028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 05:14:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93530

--------------AB7DE6AAF773A007A49122DD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 19M5AF6Z003134

Thanks!
I was checking hardknott-next. Now I know meta-openembedded-contrib and=20
'hardknott-nut' :)

Regards,
Qi

On 10/22/2021 12:31 PM, Khem Raj wrote:
> Stable merges takes time it=E2=80=99s already staged see
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/=
hardknott-nut=20
> <https://urldefense.com/v3/__https://git.openembedded.org/meta-openembe=
dded-contrib/log/?h=3Dstable*hardknott-nut__;Lw%21%21AjveYdw8EvQ%21IeYlFx=
xqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZUqZPZfpw$>
>
>
> On Thu, Oct 21, 2021 at 7:05 PM Chen Qi <Qi.Chen@windriver.com=20
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Hi Armin & Randy,
>
>     Could this patch be merged into hardknott?
>     Or should I send out V2 with detailed change log?
>
>     Regards,
>     Qi
>     -------------------------------------------------------------------=
-----
>     *From:* Chen, Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     *Sent:* Thursday, October 21, 2021 10:10
>     *To:* MacLeod, Randy <Randy.MacLeod@windriver.com
>     <mailto:Randy.MacLeod@windriver.com>>; Armin Kuster
>     <akuster808@gmail.com <mailto:akuster808@gmail.com>>;
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     <openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>>
>
>     *Subject:* Re: [oe][meta-filesystem][hardknott][PATCH]
>     ntfs-3g-ntfsprogs: upgrade to 2021.8.22
>     Hi Randy,
>
>      1. It's used by anaconda. I searched OE, and didn't find any
>         other place.
>
>      2. I don't think it's worth the effort to identify and fix them
>         one by one.
>
>     Regards,
>     Qi
>     -------------------------------------------------------------------=
-----
>     *From:* MacLeod, Randy <Randy.MacLeod@windriver.com
>     <mailto:Randy.MacLeod@windriver.com>>
>     *Sent:* Thursday, October 21, 2021 1:06
>     *To:* Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>; Chen, Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>;
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     <openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>>
>     *Subject:* Re: [oe][meta-filesystem][hardknott][PATCH]
>     ntfs-3g-ntfsprogs: upgrade to 2021.8.22
>     On 2021-10-19 11:09 a.m., Armin Kuster wrote:
>     >
>     >
>     > On 10/18/21 9:59 PM, Chen Qi wrote:
>     >> This upgrade revolves a bunch of CVEs. See more details in:
>     >>
>     https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5=
v-q5jp
>     <https://urldefense.com/v3/__https://github.com/tuxera/ntfs-3g/secu=
rity/advisories/GHSA-q759-8j5v-q5jp__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0=
WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZU-JVQIVw$>.
>     > Seems reasonable to me.
>     >
>     > -armin
>
>     I"m tempted to agree but I don't know enough about how ntfs-36 is
>     used. I think we need more information and a more detailed commit
>     log explaining why we think that the uprev is okay.
>
>     Qi,
>     Does it provide a library and header files that developers use?
>
>     Debian has a patch that we could make use of:
>     https://security-tracker.debian.org/tracker/CVE-2021-35266
>     <https://urldefense.com/v3/__https://security-tracker.debian.org/tr=
acker/CVE-2021-35266__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v=
_m7otpNKJDycAl3FlrhMAjFbZFEZVqLrClGw$>
>
>     $ apt-get source ntfs-3g
>
>     $ fd security.patch
>
>     ntfs-3g-2017.3.23AR.3/debian/patches/aug2021-security.patch
>
>
>     $ diffstat `fd aug`
>
>       include/ntfs-3g/attrib.h |    1
>
>       include/ntfs-3g/index.h  |    4 +
>
>       include/ntfs-3g/volume.h |    5 ++
>
>       libntfs-3g/acls.c        |    4 +
>
>       libntfs-3g/attrib.c      |  332
>     +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++------
>
>       libntfs-3g/bootsect.c    |    8 +++
>
>       libntfs-3g/compress.c    |   22 +++++++++-
>
>       libntfs-3g/dir.c         |  109
>     +++++++++++++++++++-------------------------------
>
>       libntfs-3g/index.c       |  183
>     +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--=
-----------------
>
>       libntfs-3g/inode.c       |   24 ++++++-----
>
>       libntfs-3g/lcnalloc.c    |   15 ++++--
>
>       libntfs-3g/mft.c         |   70 +++++++++++++++++++++++++++++++-
>
>       libntfs-3g/volume.c      |   81
>     ++++++++++++++++++++++++++++---------
>
>       ntfsprogs/ntfscp.c       |    3 -
>
>       ntfsprogs/ntfsfix.c      |   17 ++++++-
>
>       src/lowntfs-3g.c         |  384
>     +++++++++++++++++++++++++++++++++++++++++--------------------------=
-------------------------------------------------------------------------=
--------------------------------------
>
>       src/ntfs-3g.c            |   23 ++++++----
>
>       17 files changed, 818 insertions(+), 467 deletions(-)
>
>
>     compared to the diff of the uprev:
>
>     $ git diff 2017.3.23..2021.8.22 | diffstat | tail -1
>
>       69 files changed, 3220 insertions(+), 705 deletions(-)
>
>
>
>     ../Randy
>
>     >>
>     >> These CVEs cannot be reolved one by one. Upgrading the package
>     >> is the only reasonable way.
>     >>
>     >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     >> ---
>     >>   ...-ntfsprogs_2017.3.23.bb
>     <https://urldefense.com/v3/__http://ntfsprogs_2017.3.23.bb__;%21%21=
AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZW=
YgfT4yA$>
>     =3D> ntfs-3g-ntfsprogs_2021.8.22.bb
>     <https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2021.8.22.bb_=
_;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMA=
jFbZFEZVf9jUhnQ$>}
>     | 4 ++--
>     >>   1 file changed, 2 insertions(+), 2 deletions(-)
>     >>   rename
>     meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntf=
sprogs_2017.3.23.bb
>     <https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2017.3.23.bb_=
_;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMA=
jFbZFEZW9DigK6g$>
>     =3D> ntfs-3g-ntfsprogs_2021.8.22.bb
>     <https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2021.8.22.bb_=
_;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMA=
jFbZFEZVf9jUhnQ$>}
>     (92%)
>     >>
>     >> diff --git
>     a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2017.3.23.bb
>     <https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2017.3.23.bb_=
_;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMA=
jFbZFEZW9DigK6g$>
>     b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2021.8.22.bb
>     <https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2021.8.22.bb_=
_;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMA=
jFbZFEZVf9jUhnQ$>
>     >> similarity index 92%
>     >> rename from
>     meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfs=
progs_2017.3.23.bb
>     <https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2017.3.23.bb_=
_;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMA=
jFbZFEZW9DigK6g$>
>     >> rename to
>     meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfs=
progs_2021.8.22.bb
>     <https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2021.8.22.bb_=
_;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMA=
jFbZFEZVf9jUhnQ$>
>     >> index 6f5cb6cee..19b2d6ca2 100644
>     >> ---
>     a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2017.3.23.bb
>     <https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2017.3.23.bb_=
_;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMA=
jFbZFEZW9DigK6g$>
>     >> +++
>     b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2021.8.22.bb
>     <https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2021.8.22.bb_=
_;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMA=
jFbZFEZVf9jUhnQ$>
>     >> @@ -10,8 +10,8 @@ SRC_URI =3D
>     "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz
>     <https://urldefense.com/v3/__http://tuxera.com/opensource/ntfs-3g_n=
tfsprogs-$*7BPV*7D.tgz__;JSU%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kE=
v3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZUHYX2DNg$>
>     \
>     >>
>     file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.pa=
tch
>     \
>     >>   "
>     >>   S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
>     >> -SRC_URI[md5sum] =3D "d97474ae1954f772c6d2fa386a6f462c"
>     >> -SRC_URI[sha256sum] =3D
>     "3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5"
>     >> +SRC_URI[md5sum] =3D "90da343e78877d388eb34cefae6799ae"
>     >> +SRC_URI[sha256sum] =3D
>     "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb"
>     >>
>     >>   UPSTREAM_CHECK_URI =3D
>     "https://www.tuxera.com/community/open-source-ntfs-3g/
>     <https://urldefense.com/v3/__https://www.tuxera.com/community/open-=
source-ntfs-3g/__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7ot=
pNKJDycAl3FlrhMAjFbZFEZVAqvNWoQ$>"
>     >>   UPSTREAM_CHECK_REGEX =3D
>     "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
>     >>
>     >>
>     >>
>     >
>     >
>     >
>     >
>     >
>
>
>     --=20
>     # Randy MacLeod
>     # Wind River Linux
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#93524):
>     https://lists.openembedded.org/g/openembedded-devel/message/93524
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/93524__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3=
kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZV8Uwdb0g$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/86433129/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/8643=
3129/1997914__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNK=
JDycAl3FlrhMAjFbZFEZWypOAJnw$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_=
m7otpNKJDycAl3FlrhMAjFbZFEZXZpLVz6A$>
>     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--------------AB7DE6AAF773A007A49122DD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 19M5AF6Z003134

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"moz-cite-prefix">Thanks!<br>
      I was checking hardknott-next. Now I know
      meta-openembedded-contrib and 'hardknott-nut' :)<br>
      <br>
      Regards,<br>
      Qi<br>
      <br>
      On 10/22/2021 12:31 PM, Khem Raj wrote:<br>
    </div>
    <blockquote cite=3D"mid:CAMKF1sq3V_HVeo+31bYpSzCUjTF4+d5LGUvXEcz+bDiB=
nL6OQQ@mail.gmail.com" type=3D"cite">
     =20
      <div dir=3D"auto">Stable merges takes time it=E2=80=99s already sta=
ged see&nbsp;</div>
      <div dir=3D"auto"><br>
      </div>
      <div dir=3D"auto">
        <div><a moz-do-not-send=3D"true" href=3D"https://urldefense.com/v=
3/__https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstabl=
e*hardknott-nut__;Lw%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7=
otpNKJDycAl3FlrhMAjFbZFEZUqZPZfpw$">https://git.openembedded.org/meta-ope=
nembedded-contrib/log/?h=3Dstable/hardknott-nut</a></div>
        <br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 21, 2021 at 7=
:05
            PM Chen Qi &lt;<a moz-do-not-send=3D"true" href=3D"mailto:Qi.=
Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">
            <div dir=3D"ltr">
              <div style=3D"font-family:Calibri,Arial,Helvetica,sans-seri=
f;font-size:12pt;color:rgb(0,0,0)">Hi
                Armin &amp; Randy,</div>
              <div><br>
              </div>
              <div>Could this patch be merged into hardknott?</div>
              <div>Or should I send out V2 with detailed change log?</div=
>
              <div><br>
              </div>
              <div>Regards,</div>
              <div>Qi<br>
              </div>
              <hr style=3D"display:inline-block;width:98%">
              <div id=3D"m_5439778302784622376divRplyFwdMsg" dir=3D"ltr">=
<font style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(0,=
0,0)" face=3D"Calibri, sans-serif"><b style=3D"font-family:Calibri,sans-s=
erif">From:</b>
                  Chen, Qi &lt;<a moz-do-not-send=3D"true" href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank" style=3D"font-family:Calibri,sa=
ns-serif">Qi.Chen@windriver.com</a>&gt;<br>
                  <b style=3D"font-family:Calibri,sans-serif">Sent:</b>
                  Thursday, October 21, 2021 10:10<br>
                  <b style=3D"font-family:Calibri,sans-serif">To:</b>
                  MacLeod, Randy &lt;<a moz-do-not-send=3D"true" href=3D"=
mailto:Randy.MacLeod@windriver.com" target=3D"_blank" style=3D"font-famil=
y:Calibri,sans-serif">Randy.MacLeod@windriver.com</a>&gt;;
                  Armin Kuster &lt;<a moz-do-not-send=3D"true" href=3D"ma=
ilto:akuster808@gmail.com" target=3D"_blank" style=3D"font-family:Calibri=
,sans-serif">akuster808@gmail.com</a>&gt;;
                  <a moz-do-not-send=3D"true" href=3D"mailto:openembedded=
-devel@lists.openembedded.org" target=3D"_blank" style=3D"font-family:Cal=
ibri,sans-serif">openembedded-devel@lists.openembedded.org</a>
                  &lt;<a moz-do-not-send=3D"true" href=3D"mailto:openembe=
dded-devel@lists.openembedded.org" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">openembedded-devel@lists.openembedded.org</a>&gt;</f=
ont></div>
            </div>
            <div dir=3D"ltr">
              <div id=3D"m_5439778302784622376divRplyFwdMsg" dir=3D"ltr">=
<font style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(0,=
0,0)" face=3D"Calibri, sans-serif"><br>
                  <b style=3D"font-family:Calibri,sans-serif">Subject:</b=
>
                  Re: [oe][meta-filesystem][hardknott][PATCH]
                  ntfs-3g-ntfsprogs: upgrade to 2021.8.22</font></div>
            </div>
            <div dir=3D"ltr">
              <div id=3D"m_5439778302784622376divRplyFwdMsg" dir=3D"ltr">
                <div>&nbsp;</div>
              </div>
            </div>
            <div dir=3D"ltr">
              <div dir=3D"ltr">
                <div style=3D"font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt;color:rgb(0,0,0)">Hi
                  Randy,</div>
                <div style=3D"font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt;color:rgb(0,0,0)"><br>
                </div>
                <div style=3D"font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt;color:rgb(0,0,0)">
                  <ol style=3D"font-family:Calibri,Arial,Helvetica,sans-s=
erif">
                    <li style=3D"font-family:Calibri,Arial,Helvetica,sans=
-serif"><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">It=
's used by
                        anaconda. I searched OE, and didn't find any
                        other place.</span></li>
                  </ol>
                </div>
                <ol start=3D"2">
                  <li style=3D"font-family:Calibri,Arial,Helvetica,sans-s=
erif;font-size:12pt;color:rgb(0,0,0)">I
                    don't think it's worth the effort to identify and
                    fix them one by one.</li>
                </ol>
                <div>Regards,</div>
                <div>Qi</div>
                <hr style=3D"display:inline-block;width:98%">
                <div id=3D"m_5439778302784622376x_divRplyFwdMsg" dir=3D"l=
tr"><font style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rg=
b(0,0,0)" face=3D"Calibri, sans-serif"><b style=3D"font-family:Calibri,sa=
ns-serif">From:</b>
                    MacLeod, Randy &lt;<a moz-do-not-send=3D"true" href=3D=
"mailto:Randy.MacLeod@windriver.com" target=3D"_blank" style=3D"font-fami=
ly:Calibri,sans-serif">Randy.MacLeod@windriver.com</a>&gt;<br>
                    <b style=3D"font-family:Calibri,sans-serif">Sent:</b>
                    Thursday, October 21, 2021 1:06<br>
                    <b style=3D"font-family:Calibri,sans-serif">To:</b>
                    Armin Kuster &lt;<a moz-do-not-send=3D"true" href=3D"=
mailto:akuster808@gmail.com" target=3D"_blank" style=3D"font-family:Calib=
ri,sans-serif">akuster808@gmail.com</a>&gt;;
                    Chen, Qi &lt;<a moz-do-not-send=3D"true" href=3D"mail=
to:Qi.Chen@windriver.com" target=3D"_blank" style=3D"font-family:Calibri,=
sans-serif">Qi.Chen@windriver.com</a>&gt;;
                    <a moz-do-not-send=3D"true" href=3D"mailto:openembedd=
ed-devel@lists.openembedded.org" target=3D"_blank" style=3D"font-family:C=
alibri,sans-serif">openembedded-devel@lists.openembedded.org</a>
                    &lt;<a moz-do-not-send=3D"true" href=3D"mailto:openem=
bedded-devel@lists.openembedded.org" target=3D"_blank" style=3D"font-fami=
ly:Calibri,sans-serif">openembedded-devel@lists.openembedded.org</a>&gt;<=
br>
                    <b style=3D"font-family:Calibri,sans-serif">Subject:<=
/b>
                    Re: [oe][meta-filesystem][hardknott][PATCH]
                    ntfs-3g-ntfsprogs: upgrade to 2021.8.22</font>
                  <div>&nbsp;</div>
                </div>
                <div><font style=3D"color:rgb(0,0,0)" size=3D"2"><span st=
yle=3D"font-size:11pt">
                      <div>On 2021-10-19 11:09 a.m., Armin Kuster wrote:<=
br>
                        &gt; <br>
                        &gt; <br>
                        &gt; On 10/18/21 9:59 PM, Chen Qi wrote:<br>
                        &gt;&gt; This upgrade revolves a bunch of CVEs.
                        See more details in:<br>
                        &gt;&gt; <a moz-do-not-send=3D"true" href=3D"http=
s://urldefense.com/v3/__https://github.com/tuxera/ntfs-3g/security/adviso=
ries/GHSA-q759-8j5v-q5jp__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv=
3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZU-JVQIVw$" target=3D"_blank">
https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp=
</a>.<br>
                        &gt; Seems reasonable to me.<br>
                        &gt; <br>
                        &gt; -armin<br>
                        <br>
                        I&quot;m tempted to agree but I don't know enough
                        about how ntfs-36 is<br>
                        used. I think we need more information and a
                        more detailed commit<br>
                        log explaining why we think that the uprev is
                        okay.<br>
                        <br>
                        Qi,<br>
                        Does it provide a library and header files that
                        developers use?<br>
                        <br>
                        Debian has a patch that we could make use of:<br>
                        &nbsp;&nbsp;&nbsp; <a moz-do-not-send=3D"true" hr=
ef=3D"https://urldefense.com/v3/__https://security-tracker.debian.org/tra=
cker/CVE-2021-35266__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_=
m7otpNKJDycAl3FlrhMAjFbZFEZVqLrClGw$" target=3D"_blank">https://security-=
tracker.debian.org/tracker/CVE-2021-35266</a><br>
                        <br>
                        $ apt-get source ntfs-3g<br>
                        <br>
                        $ fd security.patch<br>
                        <br>
ntfs-3g-2017.3.23AR.3/debian/patches/aug2021-security.patch<br>
                        <br>
                        <br>
                        $ diffstat `fd aug`<br>
                        <br>
                        &nbsp; include/ntfs-3g/attrib.h |&nbsp;&nbsp;&nbs=
p; 1<br>
                        <br>
                        &nbsp; include/ntfs-3g/index.h&nbsp; |&nbsp;&nbsp=
;&nbsp; 4 +<br>
                        <br>
                        &nbsp; include/ntfs-3g/volume.h |&nbsp;&nbsp;&nbs=
p; 5 ++<br>
                        <br>
                        &nbsp; libntfs-3g/acls.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 +<br>
                        <br>
                        &nbsp; libntfs-3g/attrib.c&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; 332 <br>
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+------<br>
                        <br>
                        &nbsp; libntfs-3g/bootsect.c&nbsp;&nbsp;&nbsp; |&=
nbsp;&nbsp;&nbsp; 8 +++<br>
                        <br>
                        &nbsp; libntfs-3g/compress.c&nbsp;&nbsp;&nbsp; |&=
nbsp;&nbsp; 22 +++++++++-<br>
                        <br>
                        &nbsp; libntfs-3g/dir.c&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp; 109 <br>
+++++++++++++++++++-------------------------------<br>
                        <br>
                        &nbsp; libntfs-3g/index.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp; 183 <br>
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------=
-----------<br>
                        <br>
                        &nbsp; libntfs-3g/inode.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp; 24 ++++++-----<br>
                        <br>
                        &nbsp; libntfs-3g/lcnalloc.c&nbsp;&nbsp;&nbsp; |&=
nbsp;&nbsp; 15 ++++--<br>
                        <br>
                        &nbsp; libntfs-3g/mft.c&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 70
                        +++++++++++++++++++++++++++++++-<br>
                        <br>
                        &nbsp; libntfs-3g/volume.c&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp; 81
                        ++++++++++++++++++++++++++++---------<br>
                        <br>
                        &nbsp; ntfsprogs/ntfscp.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 3 -<br>
                        <br>
                        &nbsp; ntfsprogs/ntfsfix.c&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp; 17 ++++++-<br>
                        <br>
                        &nbsp; src/lowntfs-3g.c&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp; 384 <br>
+++++++++++++++++++++++++++++++++++++++++--------------------------------=
-------------------------------------------------------------------------=
--------------------------------<br>
                        <br>
                        &nbsp; src/ntfs-3g.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 23 ++++++----<br>
                        <br>
                        &nbsp; 17 files changed, 818 insertions(+), 467
                        deletions(-)<br>
                        <br>
                        <br>
                        compared to the diff of the uprev:<br>
                        <br>
                        $ git diff 2017.3.23..2021.8.22 | diffstat |
                        tail -1<br>
                        <br>
                        &nbsp; 69 files changed, 3220 insertions(+), 705
                        deletions(-)<br>
                        <br>
                        <br>
                        <br>
                        ../Randy<br>
                        <br>
                        &gt;&gt;<br>
                        &gt;&gt; These CVEs cannot be reolved one by
                        one. Upgrading the package<br>
                        &gt;&gt; is the only reasonable way.<br>
                        &gt;&gt;<br>
                        &gt;&gt; Signed-off-by: Chen Qi &lt;<a moz-do-not=
-send=3D"true" href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi=
.Chen@windriver.com</a>&gt;<br>
                        &gt;&gt; ---<br>
                        &gt;&gt;&nbsp;&nbsp; ...-<a moz-do-not-send=3D"tr=
ue" href=3D"https://urldefense.com/v3/__http://ntfsprogs_2017.3.23.bb__;%=
21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFb=
ZFEZWYgfT4yA$" target=3D"_blank">ntfsprogs_2017.3.23.bb</a>
                        =3D&gt; <a moz-do-not-send=3D"true" href=3D"https=
://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2021.8.22.bb__;%21%21Ajve=
Ydw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZVf9jU=
hnQ$" target=3D"_blank">ntfs-3g-ntfsprogs_2021.8.22.bb</a>}
                        | 4 ++--<br>
                        &gt;&gt;&nbsp;&nbsp; 1 file changed, 2 insertions=
(+), 2
                        deletions(-)<br>
                        &gt;&gt;&nbsp;&nbsp; rename
                        meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/{<a moz-do-not-send=3D"true" href=3D"https://urldefense.com/v3/__ht=
tp://ntfs-3g-ntfsprogs_2017.3.23.bb__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0=
WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZW9DigK6g$" target=3D"_blank">n=
tfs-3g-ntfsprogs_2017.3.23.bb</a>
                        =3D&gt; <a moz-do-not-send=3D"true" href=3D"https=
://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_2021.8.22.bb__;%21%21Ajve=
Ydw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZVf9jU=
hnQ$" target=3D"_blank">ntfs-3g-ntfsprogs_2021.8.22.bb</a>}
                        (92%)<br>
                        &gt;&gt;<br>
                        &gt;&gt; diff --git
                        a/meta-filesystems/recipes-filesystems/ntfs-3g-nt=
fsprogs/<a moz-do-not-send=3D"true" href=3D"https://urldefense.com/v3/__h=
ttp://ntfs-3g-ntfsprogs_2017.3.23.bb__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O=
0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZW9DigK6g$" target=3D"_blank">=
ntfs-3g-ntfsprogs_2017.3.23.bb</a>
b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/<a moz-do-not-se=
nd=3D"true" href=3D"https://urldefense.com/v3/__http://ntfs-3g-ntfsprogs_=
2021.8.22.bb__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNK=
JDycAl3FlrhMAjFbZFEZVf9jUhnQ$" target=3D"_blank">ntfs-3g-ntfsprogs_2021.8=
.22.bb</a><br>
                        &gt;&gt; similarity index 92%<br>
                        &gt;&gt; rename from
                        meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/<a moz-do-not-send=3D"true" href=3D"https://urldefense.com/v3/__htt=
p://ntfs-3g-ntfsprogs_2017.3.23.bb__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0W=
VlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZW9DigK6g$" target=3D"_blank">nt=
fs-3g-ntfsprogs_2017.3.23.bb</a><br>
                        &gt;&gt; rename to
                        meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/<a moz-do-not-send=3D"true" href=3D"https://urldefense.com/v3/__htt=
p://ntfs-3g-ntfsprogs_2021.8.22.bb__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0W=
VlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZVf9jUhnQ$" target=3D"_blank">nt=
fs-3g-ntfsprogs_2021.8.22.bb</a><br>
                        &gt;&gt; index 6f5cb6cee..19b2d6ca2 100644<br>
                        &gt;&gt; ---
                        a/meta-filesystems/recipes-filesystems/ntfs-3g-nt=
fsprogs/<a moz-do-not-send=3D"true" href=3D"https://urldefense.com/v3/__h=
ttp://ntfs-3g-ntfsprogs_2017.3.23.bb__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O=
0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZW9DigK6g$" target=3D"_blank">=
ntfs-3g-ntfsprogs_2017.3.23.bb</a><br>
                        &gt;&gt; +++
                        b/meta-filesystems/recipes-filesystems/ntfs-3g-nt=
fsprogs/<a moz-do-not-send=3D"true" href=3D"https://urldefense.com/v3/__h=
ttp://ntfs-3g-ntfsprogs_2021.8.22.bb__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O=
0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZVf9jUhnQ$" target=3D"_blank">=
ntfs-3g-ntfsprogs_2021.8.22.bb</a><br>
                        &gt;&gt; @@ -10,8 +10,8 @@ SRC_URI =3D &quot;<a m=
oz-do-not-send=3D"true" href=3D"https://urldefense.com/v3/__http://tuxera=
.com/opensource/ntfs-3g_ntfsprogs-$*7BPV*7D.tgz__;JSU%21%21AjveYdw8EvQ%21=
IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZUHYX2DNg$" targ=
et=3D"_blank">http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz</a=
>
                        \<br>
                        &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a moz-do-not-send=3D"true">
file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch</a=
>
                        \<br>
                        &gt;&gt;&nbsp;&nbsp; &quot;<br>
                        &gt;&gt;&nbsp;&nbsp; S =3D
                        &quot;${WORKDIR}/ntfs-3g_ntfsprogs-${PV}&quot;<br=
>
                        &gt;&gt; -SRC_URI[md5sum] =3D
                        &quot;d97474ae1954f772c6d2fa386a6f462c&quot;<br>
                        &gt;&gt; -SRC_URI[sha256sum] =3D
                        &quot;3e5a021d7b761261836dcb305370af299793eedbded=
731df3d6943802e1262d5&quot;<br>
                        &gt;&gt; +SRC_URI[md5sum] =3D
                        &quot;90da343e78877d388eb34cefae6799ae&quot;<br>
                        &gt;&gt; +SRC_URI[sha256sum] =3D
                        &quot;55b883aa05d94b2ec746ef3966cb41e66bed6db99f2=
2ddd41d1b8b94bb202efb&quot;<br>
                        &gt;&gt;&nbsp;&nbsp; <br>
                        &gt;&gt;&nbsp;&nbsp; UPSTREAM_CHECK_URI =3D &quot=
;<a moz-do-not-send=3D"true" href=3D"https://urldefense.com/v3/__https://=
www.tuxera.com/community/open-source-ntfs-3g/__;%21%21AjveYdw8EvQ%21IeYlF=
xxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjFbZFEZVAqvNWoQ$" target=3D=
"_blank">https://www.tuxera.com/community/open-source-ntfs-3g/</a>&quot;<=
br>
                        &gt;&gt;&nbsp;&nbsp; UPSTREAM_CHECK_REGEX =3D
                        &quot;ntfs-3g_ntfsprogs-(?P&lt;pver&gt;\d+(\.\d+)=
+)\.tgz&quot;<br>
                        &gt;&gt;<br>
                        &gt;&gt;<br>
                        &gt;&gt;<br>
                        &gt; <br>
                        &gt; <br>
                        &gt; <br>
                        &gt; <br>
                        &gt; <br>
                        <br>
                        <br>
                        -- <br>
                        # Randy MacLeod<br>
                        # Wind River Linux<br>
                        <br>
                      </div>
                    </span></font></div>
              </div>
            </div>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#93524): <a moz-do-not-send=3D"true" href=3D=
"https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedde=
d-devel/message/93524__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1=
v_m7otpNKJDycAl3FlrhMAjFbZFEZV8Uwdb0g$" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/93524</a>=
<br>
            Mute This Topic: <a moz-do-not-send=3D"true" href=3D"https://=
urldefense.com/v3/__https://lists.openembedded.org/mt/86433129/1997914__;=
%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhMAjF=
bZFEZWypOAJnw$" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/mt/86433129/1997914</a><br>
            Group Owner: <a moz-do-not-send=3D"true" href=3D"mailto:opene=
mbedded-devel%2Bowner@lists.openembedded.org" target=3D"_blank">openembed=
ded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a moz-do-not-send=3D"true" href=3D"https://urld=
efense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/unsub=
__;%21%21AjveYdw8EvQ%21IeYlFxxqUaX36O0WVlqmBG3kEv3k1v_m7otpNKJDycAl3FlrhM=
AjFbZFEZXZpLVz6A$" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-devel/unsub</a>
            [<a moz-do-not-send=3D"true" href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------AB7DE6AAF773A007A49122DD--

