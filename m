Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43340C6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 09:14:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5240.1663838087838570203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 02:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=MsnYY5Lf;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=626430303a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28M8qJ51007226
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 09:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=MVTaXjaMp3g4Q//rysIE/+I6YOtCiknegJ+Jj0k+SdE=;
 b=MsnYY5LfVLL6hJ3dJPLQEwfi1YzTNN1g7SXvHtZP9pX9T6/7LbMemmH1eLdF1+V4IvUz
 qbbHdg5EIO8Ng673H97QTGDIUjKDFnNzACcFK/B+c2Zt9O9P8O5tFHPEbaHU8KCqIPtt
 YtNDIzE1BduR1pbgVWlStZjLzWBNNcG1XsopE5EsYgs82gj0SLAToiuSwb8wOu+HXv0Y
 Cog3dGyvgM1jITFCNQclbrPQEKzctXrqDEtalMipOLxuc9JX1VUWNfryVjpz1/h1itUZ
 MLFdOgp6j332Knj9E3TpOFGHpDTbwjt/0eMiT+eaPp1GJu7orEwTAQZjBYHUp403UZUN cw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a48yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 09:14:46 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28M9EkUP024593
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 09:14:46 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a48ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 09:14:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgWdi9agl/yFFq7KDqmM8qI1Fnso8PLsevShGqeO8+CxTzjTHRbnjqsQ8ZxJU03y4UmgG19dFSPoQO78UYDXXdeG6M+0Qj9DmaCormzQvF2C6CEKjxrfX9k+d5P7YFaG4pl68/XeImgV3F9+0ZlbY94tnKegW27sJjlvmqwTwO+EnQlq7Az03rTv5I9ZPmdroruap3RB/p92/7ViBei4rlAmfSviRmvkBVKc0zx+IVdc4wDJ8Aw89rOlfdLWk97del8owAXklYQ/4qZrfPX/sba7LnSFSwIVSJD+FegtsKtM1RYltZ7Z+diPQbjf8tmMQo/FCLy7g+Gxj7wEfBH1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVTaXjaMp3g4Q//rysIE/+I6YOtCiknegJ+Jj0k+SdE=;
 b=Z3/WK7Kaja1MKsash9w8JuZZZzmhyZfOMnhsEjrjAMGakPvJlCMXHFOrE1MIa0dQ2EOpDxd/26zG1ve0r0Y1Z7csaKtzW1BHBYAqOtl/2x+yEbkKiR44zfDA+CxwvQAOHXMrJX7IAtUPfnQSjHmUj9qLjN5SwxNt1BCKhYAu/e/fh5BPDuuct8NfTigHcgv0xTyA4YocRYkuSCO0Z7s0AM76bvlLAGkrnEVCoaylk66O7zemeq7JG6dYCrxrsU6QR+ShUV1JGs995Q/MY2ZfGfaMuuTcOPN2FNEPz23vM4exViLkk4HnzchSsTbaSEVX7anjo2O8Y1Or1xVu44rRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 09:14:43 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203%7]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 09:14:43 +0000
Message-ID: <357e1896-3eaf-5f52-25fc-4a239086de3e@windriver.com>
Date: Thu, 22 Sep 2022 17:14:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-oe][PATCH 1/2] mariadb: Use qemu to run cross-compiled
 binaries
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>,
        =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55?=
 =?UTF-8?Q?i?= <zboszor@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210706065549.187176-1-zboszor@gmail.com>
 <CAMKF1srZS52Vt+YRVi-7WCzYOjBWAJH3Cy8PZCc2B8XgTgO2Xw@mail.gmail.com>
 <17171F2CE99AF5CD.13460@lists.openembedded.org>
In-Reply-To: <17171F2CE99AF5CD.13460@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR01CA0053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::7) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DM6PR11MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: 2083d0b6-9fca-4667-e75f-08da9c7ae2b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2eDD33a5zocAQzxOsGzdtwermO4P6mMKhXbEk7mssFcAvlbEk7nFQgsvqYNgw6mguC+BaZRobKqe9qCIJGxES/OEDqo95Vz0geaUo1E4hqpQKHffl9GdoZSd/G/W0DlHUrPi71zYp7Bka3ONuakYvly9TBk+3BdIspMae6AgRzMb7UnL1Er0VGP8G4sqdhBUaCntSwnqL1PVuBYoE7fatDqkdNu6j621675Ky2jEldWwDhqwD9Efxox+kSb+ge2EWDFdHNk9GfEHC++tNUlaPgX0Z//kJFOZxZzVMivgq7Op3EMovK3z8zRD6r2lSYWh4uolFxcih9g25umaZj1AmwtGFDZcIU/aa6HXlI3IQEzDQgTxL5/DADBfjiUdiyLxZlHbUnQ4QMyd0+5pVwg5jnOou//A+rGW6ghD+Sql2ZhP7jkSVky+FuxUVy7cs6pdJoVhwU8aWI9I/CuSoMycAtwCD3F11+XrcAMcc/4pioeUy44a4i3y5aJZkRXlfb1apgvs39UsCr4FCuQcUhnC15pi8D3CIcNh4rQ0kotaL8NLjnDa+O4/LHPPw1+83G0b16Dd003idG/tbEozjF5QchWgo9cJlPCtyYpDTZFh4vRwoHS0lVuMwy0lSgf1R8GkWWZ9yMEYsbY1JHQodCfE62AdW336aMKhOEnj+PZtPDeJhUzKJwv6RnJJmsHkEWy/tQ38FfM4qe8CoZhU8FgpCWa57BVF5go8hlBPILWo7YulyEU3YB9psGoSCY2lrUk7crcqqUY1CmDNyiwO+6F0kOi1AxOS+IfGEURt6fXvXcaCD35GXy95dDUa78bKO/NsseZ/nxPiPRXEewBs5u2WTIGYTtMvZh7SkvQ4s5wL7e8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(366004)(396003)(346002)(376002)(451199015)(2906002)(86362001)(31696002)(38100700002)(6506007)(53546011)(6666004)(2616005)(26005)(6512007)(110136005)(316002)(4326008)(478600001)(966005)(6486002)(41300700001)(8676002)(66476007)(30864003)(8936002)(5660300002)(66556008)(66574015)(186003)(83380400001)(66946007)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NldxUVN0TGRBZi80amRIT1loVW5sRVhxWmUwNms1UGZ4dVFneHBDR3VGTzY2?=
 =?utf-8?B?UStNcEhYU3ZXbnFQMXE3Ulo3d1BRZHNQVVZoaHdlc2k0bnQzMWE2MU5pcFF2?=
 =?utf-8?B?aDhXcm5aR2l4UWYyZ0VNaHYzTGZyelRwQVc5cTBBK1FrUTdtZTBQNFVVdG9L?=
 =?utf-8?B?N0JPc0RDd293UTl0T3V5SzVLUzRRNTVYaTlheUtMS3VWR3Z1SG5BVHBNczds?=
 =?utf-8?B?UGpPZGVLNkM3V3pRajM2NkFVMllBS21BN0I1YWxGbkNlRHZid0hoY3dSZ0VP?=
 =?utf-8?B?bUVodmhWbnJzVzFCMVBOSlF3dnArSHB3MTNXTnVXRXEzWmNYaFhsNzEyanVN?=
 =?utf-8?B?TC9LYkdIY3dJZ3RydmtWMjhVeHd3OGNuQnljSnE4TlNaSzFPNDYzMjI0SEZP?=
 =?utf-8?B?Q3dLNXgwUkU3QitKRkVSTGh3Y2NBSjNCeUUrSkRXaDdQUU9Sd1JQaTFyRkdJ?=
 =?utf-8?B?d3FMVjhuSVN5bkxhbzJlNGx2aTRQbFc3RjVSQ3NtVm5uQ21XZVVScjFFMWtp?=
 =?utf-8?B?TlZOTElDcGlKOWppSlFsRi9FNm5CRlBjbGR1ZzNYbElkV2NHbXA2cmwvRGYv?=
 =?utf-8?B?QkpnV2FIYXZoRGY5QUFra3ZKYWpnUUllYyszWXhrb2NIeUs0ZUZiS2o1endE?=
 =?utf-8?B?aDVnVGJGRytnajdZQ2tQbXZMeG5zaGFxQStuNFovbGRIV0NEYm1hQVEybHh2?=
 =?utf-8?B?eUFkalB1RnFjaXZ5UTI4enhreWdYNnNrUUxGWEt1NnFXQkd2eGlJTHFVY01o?=
 =?utf-8?B?L0lraUVROTZjVEZ4dFJrOGVuWlRzdzh3L3dEcTEydzFiT1BkNGgwakk4Z3JL?=
 =?utf-8?B?ZWVBY3FrRkJQNWgyb0NBejhvTEZLT1pHK1UyTlVYcnc0Q3VjbEZ3YzYwd2h4?=
 =?utf-8?B?ZGRUZFJzcGl5bWlxdlhPNEZZQlRoMXI3SEZ4akYzUWJZTytQRzFCSjBwN0c4?=
 =?utf-8?B?VllnN3Q3cGhQcEhOQlAyRURaYWVQcmpQR1M3ZWZEQWlYeVkvcFZrcWtiRE9q?=
 =?utf-8?B?VlVBS3paUGFkTGZUU2JNZTEydjRmYlV0Nmt4N0JmcVRrTHF2ak5yYWxPdkxH?=
 =?utf-8?B?RlA5WVVYU0ljSExnUitvU1M1NFdBRXJqcnkxTzd0bmg5eURkOGFKc3I4cDBm?=
 =?utf-8?B?VnpnUFhSb2RpTTRRejVYZW9LRDJpRnYrTGlTWVA0Q3lWNURQbEIvZEx2TEQ4?=
 =?utf-8?B?SWJWMUVaSjFaTW4wd0s0LysyUGZIdmJqc1dKcUh5VWl5TWE0c2ZkRFNyekpU?=
 =?utf-8?B?dXEzdWpWOHRSdnZTN0JzdXpNblU0TlQ0RUtzUGZtK1pRc2t3Zys4RWFmL3Fu?=
 =?utf-8?B?Zk1YbEFvMW5tbEtDQWNrY2x5YmpqQitVNTA0Rkd1Q01EODJFaVp5eHh3Yndo?=
 =?utf-8?B?anJydW44ai9mRWg4NVBEdUlSMkQrTWxRVGJvbXd1VFByUEVtWjQwOXhDQ0NT?=
 =?utf-8?B?OFUrMk5vanJPbjhnSW4raVZEbnNrRWJITC9odjRMQW9XZU5jVlVSdFZnbXdS?=
 =?utf-8?B?NlR4Um83Q1Bjc21md3djdlF1TlRwZWJVUmRFM1JkZkRIaSt2ekc3V2NDZzU3?=
 =?utf-8?B?M3g5MUVKd3pjcG5ScGZ6OGxhdzc0UG5LV3FWRmNwVS9lK29NMmFEYnprZmVo?=
 =?utf-8?B?MWVKTVQzVWpTRGpsNGRsTEFWUkN6am5xM3Q2SWVpS25QT2RhemVvd2xRQkdp?=
 =?utf-8?B?U3k3Nldockx4ejhZeTF4ejc5WHR2aURSejFHZDJHc1I5K0cyRlNzanNUV0Vw?=
 =?utf-8?B?Y3BkVnl0VnJmR0xibDRTbGdEMFE1bXlWZWMxZ0Z3U2xEcFdIZ0JMUVpGcU9q?=
 =?utf-8?B?b2d6L3pmQTE0ZzVWN3RkdnBIVWw4NGFrTVBBb3pVeElTRklqM0I0eXpKd1Vo?=
 =?utf-8?B?UDVqM3hrd1dnallHZUZDaUgxbG10VkdxMThBaFRZM2VDdENlUWlnbFRDSXR6?=
 =?utf-8?B?dWFVdk1qeDh5TmE4anNybjRpazBobW1HTkhWZkI3Y1Qrbmk3bHRnRXNLSDAy?=
 =?utf-8?B?UmJWdzIxdUVnZy9MOGIyZWhLK05pOXdSMmhzS3NmbWVCcGQ2MjV0ZktTY3lP?=
 =?utf-8?B?ZDNMUm94UU83WFhWZEZ0SWsrOVp0ZWxlclNEMTB3cWY4WDZ6eW85aHZhQkZo?=
 =?utf-8?Q?7M14xnyija9XMuSpn4KStm0ig?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2083d0b6-9fca-4667-e75f-08da9c7ae2b5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 09:14:43.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qO0ILyubHlyVYmhcgfmFgyCShcm6kQvy+PnOW1yJIrQLbJuwHPGmOt9iFPtF2drMhcnhZj6bjbqjlHYiAlz1Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
X-Proofpoint-ORIG-GUID: rNxAJdGVkiRraKiWzgt05tv9wHa7Epmj
X-Proofpoint-GUID: kC2UiMYuDGx0QBcBZfe6COFh6rXJQufr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_05,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209220060
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28M8qJ51007226
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 09:14:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98924

# bitbake -cdevshell mariadb
# pwd
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4
# cd=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/scripts &&=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/qemuwrapper=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/scripts/com=
p_sql=20
mysql_fix_privilege_tables mysql_fix_privilege_tables.sql=20
mysql_fix_privilege_tables_sql.c
qemu: uncaught target signal 4 (Illegal instruction) - core dumped
Illegal instruction (core dumped)


Thanks,

On 9/22/22 15:47, Yu, Mingli wrote:
> Failed to build for amd64:
> | make[2]: Leaving directory=20
> '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
> | qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> | [=C2=A0 4%] Built target tpool
> | [=C2=A0 8%] Built target skip_all-t
> | [=C2=A0 4%] Built target no_plan-t
> | [=C2=A0 8%] Built target wsrep-lib
> | [=C2=A0 8%] Built target ref10
> | [=C2=A0 8%] Built target mariadb_obj
> | make=C2=A0 -f libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/buil=
d.make=20
> libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/depend
> | make=C2=A0 -f libmariadb/libmariadb/CMakeFiles/libmariadb.dir/build.m=
ake=20
> libmariadb/libmariadb/CMakeFiles/libmariadb.dir/depend
> | make[2]: Entering directory=20
> '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
> | cd /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build &&=20
> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot-=
native/usr/bin/cmake=20
> -E cmake_depends "Unix Makefiles"=20
> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4=20
> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4/=
libmariadb/libmariadb=20
> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build=20
> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariad=
b/libmariadb=20
> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariad=
b/libmariadb/CMakeFiles/mariadbclient.dir/DependInfo.cmake=20
> --color=3D
> | make[2]: Leaving directory=20
> '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
> | make=C2=A0 -f libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/buil=
d.make=20
> libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build
> | Illegal instruction (core dumped)
> | make[2]: *** [sql/CMakeFiles/GenServerSource.dir/build.make:76:=20
> sql/lex_hash.h] Error 132
> | make[2]: *** Deleting file 'sql/lex_hash.h'
> | make[2]: Entering directory=20
> '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
> | [=C2=A0 8%] Linking C static library libmariadbclient.a
> | cd=20
> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariad=
b/libmariadb=20
> &&=20
> /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot-=
native/usr/bin/cmake=20
> -P CMakeFiles/mariadbclient.dir/cmake_clean_target.cmake
> | Illegal instruction (core dumped)
> | Illegal instruction (core dumped)
> | make[2]: *** [scripts/CMakeFiles/GenFixPrivs.dir/build.make:78:=20
> scripts/mysql_fix_privilege_tables_sql.c] Error 132
>=20
> Thanks,
>=20
> On 7/6/21 16:37, Khem Raj wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> On Mon, Jul 5, 2021 at 11:56 PM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi=
 <zboszor@gmail.com>=20
>> wrote:
>>>
>>> This way, mariadb does not depend on mariadb-native anymore.
>>>
>>
>> how does build time gets impacted ? you can count that native build is
>> not needed but still it will be good to know.
>> qemu dependency also means that qemu usermode has to be supported for
>> this to work, which maybe troublesome on some
>> newer or lesser known architectures but perhaps thats a fine=20
>> compromise perhaps.
>>
>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
>>> ---
>>> =C2=A0 meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 27 ++++----
>>> =C2=A0 .../mysql/mariadb/cross-compiling.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 25 -------
>>> =C2=A0 ...Lists.txt-fix-gen_lex_hash-not-found.patch | 67 -----------=
--------
>>> =C2=A0 meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb=C2=A0 |=C2=A0 4 +=
-
>>> =C2=A0 4 files changed, 15 insertions(+), 108 deletions(-)
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>>> =C2=A0 delete mode 100644=20
>>> meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash=
-not-found.patch=20
>>>
>>>
>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc=20
>>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>> index 18b025070..7b1f537fb 100644
>>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>> @@ -12,7 +12,6 @@ SRC_URI =3D=20
>>> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://mysql-systemd-start \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://configure.cmake-fix-valgrind.patch \
>>>             =20
>>> file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://=
sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://0001-disable-ucontext-on-musl.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://c11_atomics.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://clang_version_header_conflict.patch \
>>> @@ -21,7 +20,6 @@ SRC_URI =3D=20
>>> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>>>             =20
>>> file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>>>             =20
>>> file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://sys_futex.patch \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://=
cross-compiling.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://ssize_t.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://mm_malloc.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> @@ -60,8 +58,6 @@ SYSTEMD_AUTO_ENABLE_${PN}-setupdb ?=3D "enable"
>>> =C2=A0 ALLOW_EMPTY_${PN}-setupdb ?=3D "1"
>>> =C2=A0 FILES_${PN}-setupdb =3D "${sysconfdir}/init.d/install_db"
>>>
>>> -EXTRA_OEMAKE =3D "'GEN_LEX_HASH=3D${STAGING_BINDIR_NATIVE}/gen_lex_h=
ash'"
>>> -
>>> =C2=A0 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pa=
m', d)}=20
>>> setupdb"
>>> =C2=A0 PACKAGECONFIG_class-native =3D ""
>>> =C2=A0 PACKAGECONFIG[pam] =3D ",-DWITHOUT_AUTH_PAM=3DTRUE,libpam"
>>> @@ -95,6 +91,8 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCAT_EXECUTABLE=3D`which cat` \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCMAKE_AR:FILEPATH=3D${AR}"
>>>
>>> +EXTRA_OECMAKE_prepend_class-target =3D=20
>>> "-DCMAKE_CROSSCOMPILING_EMULATOR=3D${WORKDIR}/qemuwrapper "
>>> +
>>> =C2=A0 # With Ninja it fails with:
>>> =C2=A0 # make: *** No rule to make target `install'.=C2=A0 Stop.
>>> =C2=A0 OECMAKE_GENERATOR =3D "Unix Makefiles"
>>> @@ -117,12 +115,18 @@ do_generate_toolchain_file_append_class-native=20
>>> () {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d=
" ${WORKDIR}/toolchain.cmake
>>> =C2=A0 }
>>>
>>> -do_compile_prepend_class-target () {
>>> -=C2=A0=C2=A0=C2=A0 # These need to be in-tree or make will think the=
y need to be=20
>>> built,
>>> -=C2=A0=C2=A0=C2=A0 # and since we're cross-compiling that is disable=
d
>>> -=C2=A0=C2=A0=C2=A0 cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
>>> -=C2=A0=C2=A0=C2=A0 cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
>>> +do_configure_prepend_class-target () {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Write out a qemu wrapper that=
 will be used by cmake
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # so that it can run target hel=
per binaries through that.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_binary=3D"${@qemu_wrapper_=
cmdline(d,=20
>>> d.getVar('STAGING_DIR_HOST'),=20
>>> [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOS=
T}${base_libdir}')])}"=20
>>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat > ${WORKDIR}/qemuwrapper <<=
 EOF
>>> +#!/bin/sh
>>> +$qemu_binary "\$@"
>>> +EOF
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ${WORKDIR}/qemuwrapper
>>> +}
>>>
>>> +do_compile_prepend_class-target () {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${@bb.utils.contains('PACKAGECON=
FIG', 'krb5', 'yes',=20
>>> 'no', d)}" =3D "no" ]; then
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ! [ -e ${B}=
/include/openssl/kssl.h ] ; then
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mkdir -p ${B}/include/openssl
>>> @@ -132,11 +136,6 @@ do_compile_prepend_class-target () {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 echo "#endif" >>${B}/include/openssl/kssl.h
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> -=C2=A0=C2=A0=C2=A0 # workaround to handle out-of-source build from s=
ource package
>>> -=C2=A0=C2=A0=C2=A0 yacc_files=3D"sql_yacc.hh sql_yacc.cc sql_yacc_or=
a.hh=20
>>> sql_yacc_ora.cc"
>>> -=C2=A0=C2=A0=C2=A0 for yacc_file in ${yacc_files}; do
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp ${S}/sql/${yacc_file} =
${B}/sql/${yacc_file}
>>> -=C2=A0=C2=A0=C2=A0 done
>>> =C2=A0 }
>>>
>>> =C2=A0 SYSROOT_PREPROCESS_FUNCS +=3D "mariadb_sysroot_preprocess"
>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch=20
>>> b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>>> deleted file mode 100644
>>> index 0f4815b18..000000000
>>> --- a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>>> +++ /dev/null
>>> @@ -1,25 +0,0 @@
>>> -This is not needed for OE builds
>>> -
>>> -building failed since native does not generate import_executables.cm=
ake
>>> -In fact, our building system will export the needed commands
>>> -
>>> -Upstream-Status: Inappropriate [configuration]
>>> -
>>> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> -
>>> ---- a/CMakeLists.txt
>>> -+++ b/CMakeLists.txt
>>> -@@ -392,11 +392,6 @@ CHECK_PCRE()
>>> -
>>> - CHECK_SYSTEMD()
>>> -
>>> --IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULAT=
OR)
>>> --=C2=A0 SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH =
"Path=20
>>> to import_executables.cmake from a native build")
>>> --=C2=A0 INCLUDE(${IMPORT_EXECUTABLES})
>>> --ENDIF()
>>> --=20
>>> - #
>>> - # Setup maintainer mode options. Platform checks are
>>> - # not run with the warning options as to not perturb fragile checks
>>> diff --git=20
>>> a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_ha=
sh-not-found.patch=20
>>> b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_ha=
sh-not-found.patch=20
>>>
>>> deleted file mode 100644
>>> index 4cb044339..000000000
>>> ---=20
>>> a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_ha=
sh-not-found.patch=20
>>>
>>> +++ /dev/null
>>> @@ -1,67 +0,0 @@
>>> -From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 20=
01
>>> -From: Mingli Yu <mingli.yu@windriver.com>
>>> -Date: Thu, 23 Jul 2020 00:08:16 -0700
>>> -Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
>>> -
>>> -Fix the below do_compile issue in cross-compiling env.
>>> -| make[2]: *** No rule to make target=20
>>> '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.1=
3/sql/gen_lex_hash',=20
>>> needed by 'sql/lex_hash.h'.=C2=A0 Stop.
>>> -| make[2]: *** No rule to make target=20
>>> '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.1=
3/sql/gen_lex_token',=20
>>> needed by 'sql/lex_token.h'.=C2=A0 Stop.
>>> -
>>> -Upstream-Status: Inappropriate [oe build specific]
>>> -
>>> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ----
>>> - sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
>>> - 1 file changed, 20 insertions(+), 10 deletions(-)
>>> -
>>> -diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
>>> -index 0dc3caa..616017b 100644
>>> ---- a/sql/CMakeLists.txt
>>> -+++ b/sql/CMakeLists.txt
>>> -@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
>>> - ${CMAKE_SOURCE_DIR}/tpool
>>> - )
>>> -
>>> --ADD_CUSTOM_COMMAND(
>>> --=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>>> --=C2=A0 COMMAND gen_lex_token > lex_token.h
>>> --=C2=A0 DEPENDS gen_lex_token
>>> --)
>>> -+IF(NOT CMAKE_CROSSCOMPILING)
>>> -+=C2=A0 ADD_CUSTOM_COMMAND(
>>> -+=C2=A0=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>>> -+=C2=A0=C2=A0 COMMAND gen_lex_token > lex_token.h
>>> -+=C2=A0=C2=A0 DEPENDS gen_lex_token)
>>> -+ELSE()
>>> -+=C2=A0 ADD_CUSTOM_COMMAND(
>>> -+=C2=A0=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>>> -+=C2=A0=C2=A0 COMMAND gen_lex_token > lex_token.h)
>>> -+ENDIF()
>>> -
>>> - ADD_CUSTOM_COMMAND(
>>> -=C2=A0=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
>>> -@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
>>> -=C2=A0=C2=A0 ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
>>> - ENDIF()
>>> -
>>> --ADD_CUSTOM_COMMAND(
>>> --=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>>> --=C2=A0 COMMAND gen_lex_hash > lex_hash.h
>>> --=C2=A0 DEPENDS gen_lex_hash
>>> --)
>>> -+IF(NOT CMAKE_CROSSCOMPILING)
>>> -+=C2=A0 ADD_CUSTOM_COMMAND(
>>> -+=C2=A0=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>>> -+=C2=A0=C2=A0 COMMAND gen_lex_hash > lex_hash.h
>>> -+=C2=A0=C2=A0 DEPENDS gen_lex_hash)
>>> -+ELSE()
>>> -+=C2=A0 ADD_CUSTOM_COMMAND(
>>> -+=C2=A0=C2=A0 OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>>> -+=C2=A0=C2=A0 COMMAND gen_lex_hash > lex_hash.h)
>>> -+ENDIF()
>>> -
>>> - MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Serv=
er)
>>> - SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES=20
>>> COMPILE_FLAGS "-DTZINFO2SQL")
>>> ---
>>> -2.17.1
>>> -
>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb=20
>>> b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>>> index 8ae8241b0..57d7736ea 100644
>>> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>>> @@ -1,8 +1,8 @@
>>> =C2=A0 require mariadb.inc
>>>
>>> -EXTRA_OECMAKE +=3D "-DSTACK_DIRECTION=3D-1"
>>> +inherit qemu
>>>
>>> -DEPENDS +=3D "mariadb-native bison-native boost libpcre2 curl openss=
l=20
>>> ncurses zlib libaio libedit libevent libxml2"
>>> +DEPENDS +=3D "qemu-native bison-native boost libpcre2 curl openssl=20
>>> ncurses zlib libaio libedit libevent libxml2"
>>>
>>> =C2=A0 PROVIDES +=3D "mysql5 libmysqlclient"
>>>
>>> --=20
>>> 2.31.1
>>>
>>>
>>>
>>>
>>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98920): https://lists.openembedded.org/g/openembedd=
ed-devel/message/98920
> Mute This Topic: https://lists.openembedded.org/mt/84015256/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[mingli.yu@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

