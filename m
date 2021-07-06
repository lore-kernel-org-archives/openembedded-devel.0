Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2496.1625550978135801416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jul 2021 22:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Pf+k/h1a;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2821954714=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1665sORJ029452
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jul 2021 22:56:17 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39kmh8gvce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jul 2021 22:56:17 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1665uGKS031825
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jul 2021 22:56:16 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 39kmh8gvcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jul 2021 22:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJPj3U0CtdLR3hRYOmlQVC2QiLhqBp2VrEyORA9X7oVOHAT+tYRYp1qnG+KmNlFwzD9e96PoQDkhUWZ6H9zzNrJHM1tiIqJmWhXD9ux5h6Xu2nwvSTTjAftOveF0wXglcn2XbJxb9j6CMaqNiZntEAhvW0u4lULEt2jGjzvHhw1aF0uqg6XoQkPLX38Ps5hCVoEdr7qzqa2xGC/lKo9cgNiEMBDJU3F3fKDiY+Q6HTq5+DCQ355exbvmv76taED0whZKEZ5lKtVaey5UYFRpvo9f50G7AtbrUAljuFnu5qJ9gyJphRodro5Q0M54RSSEkzZbmuztnU/zzb3k4fBRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciRqiMmIG4JUWgHxvukLI5h6vMFa8ljpjtbxgs41JMA=;
 b=cW22zDVtLIuhB8vu5a6RlC9sD0T2N7VD3F8wk2UKRDToVyNrT+zLzpi7SPzpR0If167PZTqbk6Im+sN7MI/m+yfqJgnQ/eEfzSOZXoMOUJNpiOZcfiZ6dOzZfWYH4O6ZuFduhrffgs5NW4KfgKcusehRGrAluuW1hdScfX3LPGFBoGW9FBNFcP1JNOFLGOLSrFJdKCkHDOAv7gAi7uUPPHaUnHX9aCYgvEiVzY7BiWq3sInO+ojZ8pc/hADu6YXg5LgSpW901k+fF6IAHynR4iWZG78bT2ye1y9ywa7TnXou9rweqSLY60bm9mnQ6bTr5EbyYfbRUq1cOlYxRkch6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciRqiMmIG4JUWgHxvukLI5h6vMFa8ljpjtbxgs41JMA=;
 b=Pf+k/h1a96Yls5kCBQ/3/XdE1bFVUe9GsMORNLk7avU4Ja7IMTPwb62H+N9SeGBgxJMCPMyRkSPdgFBvGJ6Dwp9SU4tJcG2gSf+74GmAJC374+NbRLSljc5JjjiKPBGJFZRvkgh7JA9Euysnhj5oeGcjV5ug/QY+Ef8upzxnVAE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32)
 by BYAPR11MB3607.namprd11.prod.outlook.com (2603:10b6:a03:b2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 05:56:13 +0000
Received: from BYAPR11MB2536.namprd11.prod.outlook.com
 ([fe80::348e:1e92:4134:aaf2]) by BYAPR11MB2536.namprd11.prod.outlook.com
 ([fe80::348e:1e92:4134:aaf2%7]) with mapi id 15.20.4219.025; Tue, 6 Jul 2021
 05:56:12 +0000
Subject: Re: [oe] [meta-oe][PATCH] lmdb: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210616182123.45393-1-sakib.sajal@windriver.com>
 <f815a254-ce73-8d36-33a1-69da5b4047c4@gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <4cf83d3b-dd48-d443-af94-0c6866f3eb89@windriver.com>
Date: Tue, 6 Jul 2021 01:56:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f815a254-ce73-8d36-33a1-69da5b4047c4@gmail.com>
X-Originating-IP: [70.49.163.59]
X-ClientProxiedBy: BL1P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::24) To BYAPR11MB2536.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.20] (70.49.163.59) by BL1P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 05:56:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 507d9550-6661-45f5-c117-08d94042c283
X-MS-TrafficTypeDiagnostic: BYAPR11MB3607:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3607D4DC690B4ED626CA9529F21B9@BYAPR11MB3607.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H6iUHKsOs8ENnadvUkCDFla86CBLBTmYzW0gwsb0Dt0SwEZ68BHccRde+b+j/C14iccwhcPIvg1eHb/c29xnhBYywDQLKhUi6PjScl+Kz1fLCs1cJ03nb24EPQ/HakJipmmwkwS+MPyGCjafJgD7sjhzQNQLJYEP4iFfml7+1DGw8YrW3WjKGo5aaM+oYmrMwSBvONU9CcJfRDD0kII3vo6J4r9Conqqb26raxTx0DeP5erV0n0FqUk++/rGlih6pqoVAzuyzB7XB4Fj1SdDr714l7ufQRxD7Z074cdbe2qz/tRqEp3p0JaG9shsE4m/KfSkl6l/Q0S9njP+mnk2D4sa0J081hnSQOgQCmXXiG7+WKZW9LsRrRrVHcf9NZvB/SrAoRjkxKlglPMWNrhfzVUEDT1cknMwIaFY9uJk4gkFJlkuG0OalKmkE4rLSQs68ruf99WRKw4GEzQNT9RLVBDQOsmxXADXG6dPjkhlLHepw8eDkmnelUZlPVN3fs91xb1nCp6nEE7MuSchrE9JUwqZXOJh+HhNYL9K3PyPwiCE8gtYIsX3DLKD39xyGJnUBkUUe3vrugMKNt8rRxly9chb1lqONAExiXxVMQSTilxI0a9BkLg1CNdu+oNfsrt+W5sm46lyrz0S7fJd77Ac2K1Q9by7p41IQ+zH1aNJ9XmoKkY5srOx9/EMWSd/Z9H/zsLo2U5vzGJPcoHo05l1lLYkYn4HCFAtMG95KFsTLkJ1fWXbhP6QqmyggNc9Axcjz/nCQKYS8AchU8RkzUTXjREJFYAMk3jH3eN8JYbqzpw9N9EyZshHmv5xV/8FM3yd/I0wHLgTp6YDQl3NvMf/jvz3lNl/uzV3VFRttCUWBPOMV8/jnuwgMBt+VKcm7e/Pvgzmp85GEV4Phy9iGAN2fA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(8676002)(5660300002)(956004)(31686004)(66556008)(53546011)(966005)(2616005)(19627235002)(66476007)(6666004)(86362001)(31696002)(26005)(2906002)(52116002)(478600001)(186003)(83380400001)(44832011)(16576012)(36756003)(6486002)(8936002)(38100700002)(16526019)(38350700002)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TllMdUUvMmxVeU04dFdSdkhrVGFZZHlWYWhXSGxNNUV6V0hoMC9rUnpMNEwr?=
 =?utf-8?B?a2I0WmN1WEduM0srRTNKNE1CQ0hKWGZBQXNSc2w4T3lFYllNNzI5UWRqL3cr?=
 =?utf-8?B?V1daTG5hT3dTQXFCRy9JT25lV3VqVEhna1NYYnZXYlRFa3F2ZEpIRjAxOFFz?=
 =?utf-8?B?NWpYNlpkdDlaRTAwVmlyQm5RTkxWSUhsR1ZlVWV3YnBVWFhlaTlDYTBGQ3FB?=
 =?utf-8?B?ME10Y0pVN1BZMzdEZ1krcjllRkM2NGltOWxlVkxlcVk5ZGVKNU16TUZLM1A2?=
 =?utf-8?B?MjNZZkhaa25VcEJJV1BROVVnS2tMQll6VU1TTDZ6MWhMVXRENTU2MmxDZ1VJ?=
 =?utf-8?B?NG4wVnBEa3pXYy92a1ljRXNLc3VheStmdXUyTUwvNmdpV0FlMFpacmtRSEJs?=
 =?utf-8?B?SUhzeGlIOUJCcS96SGxHSEsreTdYblpkdXpJR1luOC8xRzNLQnVMS1JqYnE1?=
 =?utf-8?B?R3k1N2NGS0ZaT25VdGU2RnU2Y3NlV1FOelZMZmZFdGtIemd3M1EwZXBMWFR2?=
 =?utf-8?B?MW1zY0xmczRPK21HaEYyRFMwWC84UEZPbmVrTTRqSktiekdPZmkzeCtubnd3?=
 =?utf-8?B?R1hkTUNkMldBWU9wRkhEUjltREVqNi9FYk1FVnAzUWFTZktWRlJLZ1RpVFZq?=
 =?utf-8?B?UXBLdDZvVGRDUkVOWFkvVnhwUVhsanZaUTZid0VySkcvdFFJdzNXNzlxMkt4?=
 =?utf-8?B?V245SlZPL2szOVM4NXRNYkszeGlPOGFoUVhPWjMyTENpdDlScFFwemlkNEt0?=
 =?utf-8?B?QWRkaVh4UEhyU21IbUJmTUFEWDVpc0UrbTJGZFk3RXJzZFVKZFE0ZTJDVm1i?=
 =?utf-8?B?bWVaamhLSHNaeXY5akNlRHY1WXI0UE1ROHRSNkNGT08ydERsV2Y3NmowMU1i?=
 =?utf-8?B?Z29RWnJoMkV5cVdXZFNRWmlMZzhNK1pEOG8zTysxYnJDNVhwbThtYmVycmxW?=
 =?utf-8?B?eWxYakdBVy9CK04rbzBMNUREOG44RDYwdElPUExheXd0ei9FWmxrdlhaVzhE?=
 =?utf-8?B?c2dQWUdYQTJCQkZveG1sa0JmejBYbU9ZY214KzMyY0VGU3RPZVJ6TERyMmZX?=
 =?utf-8?B?NXFJalRncTZFem81WVZCQVRyVXdaVjhwS2NFZWxRSGV6Z0duNEZaRTRQb00w?=
 =?utf-8?B?eFdzWmJDUEFabU55MjRMMGg5VEk0b0R1VHNvcEpTczVhejRuSGdJV0tiaFFu?=
 =?utf-8?B?VHJPYVRXc3JqNkNnU2J2VDFlR1NvS085czE3dFBqc1RMRG1YelJiL0pnQXJo?=
 =?utf-8?B?SVFrQ3lWeStnWk9zUFRlb0plMUNzK2xtSlB3Ri9DRm1aRlZvRGsvejVONXRT?=
 =?utf-8?B?TGdjdStiUEZicHpyN1AvWDdtTFBGa0tIY3hlOGFQbm5ac2F4U3U0RDArTnZs?=
 =?utf-8?B?UnozZTN3ak56TnloMzVpemJNMG9KUzhDbUYvRVVyUmZOQVhYem0yMmI2UkFC?=
 =?utf-8?B?SDZBZERqN2V0YklMTCtyRVdWTUM3ZlV5YVJaQ0tudGJJTm0wcjhTdmxxZ2pY?=
 =?utf-8?B?TWlEUWNaWTQ5c3N5OGt5NzRRbnJoMkx5NTFIeDMyRjdCNmI3MWlrR0ZGZExx?=
 =?utf-8?B?OVpBb0tvVjlJdDBxUHB6M3hCNUhVQWxyajg0OEQ3YU5KejRGY3FXSVArRHFT?=
 =?utf-8?B?MzkrOGJqa1U0d0I5M0hHU05ONGJvWnpJRW11VmNRWXJiU3hGS2VySFF1bVpv?=
 =?utf-8?B?RWNSQkZaV3RHTG5yRU5hM3d1MmIyQkhJSi9XRFMzOXFGZHZBZDlGQmt5UGZ4?=
 =?utf-8?Q?8qQGmkKL5zG6dvEnsXs2bLIIOEh8bT5coZYXQbS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507d9550-6661-45f5-c117-08d94042c283
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 05:56:12.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxn1CeEf3LrGzdpjx7DDba6jvBgNLWPkkAdOlZ7AqgvhDENg8s+2V4rwmOwaNaAVyJzYQoy1tX5jhuUlnh7DRlEslBYoMzOohLX6GdvzvN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3607
X-Proofpoint-GUID: zV2Y5vz3LC2CaxdNX-QhH7LNMFWu9bCz
X-Proofpoint-ORIG-GUID: 59A6U6_f2okakuF7Csk2edgY99DIXc8q
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_02:2021-07-02,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060028
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1665sORJ029452
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 2021-06-16 3:47 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 6/16/21 11:21 AM, Sakib Sajal wrote:
>> lmdb provides a high-performance embedded transactional
>> database in the form of a key-value store.
>>
>> Recipe is ported from meta-qt5-extra layer.
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>> =C2=A0 .../files/0001-Patch-the-main-Makefile.patch=C2=A0 | 90 ++++++++=
+++++++++++
>> =C2=A0 meta-oe/recipes-dbs/lmdb/lmdb_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 +++++
>> =C2=A0 2 files changed, 112 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
>> =C2=A0 create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_git.bb
>>
>> diff --git=20
>> a/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch=20
>> b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
>> new file mode 100644
>> index 000000000..9ba626101
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
>> @@ -0,0 +1,90 @@
>> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
>> +Date: Tue, 1 Sep 2015 22:54:31 +0200
>> +Subject: [PATCH] Patch the main Makefile to allow for a build that=20
>> complies to packaging guidelines.
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Taken from [1]
>> +
>> +[1]=20
>> https://src.fedoraproject.org/rpms/lmdb/raw/master/f/lmdb-make.patch
>> +
>> +Upstream-Status: Pending
>> +
>> +
>> +diff --git a/Makefile b/Makefile
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -26,6 +26,7 @@ OPT =3D -O2 -g
>> + CFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(THREADS) $(OPT) $(W) $(XCF=
LAGS)
>> + LDLIBS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D
>> + SOLIBS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D
>> ++SOVERSION=C2=A0=C2=A0 =3D 0.0.0
>> + SOEXT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D .so
>> + prefix=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D /usr/local
>> + exec_prefix =3D $(prefix)
>> +@@ -38,7 +39,7 @@ mandir =3D $(datarootdir)/man
>> +=20
>> #######################################################################=
#
>> +
>> + IHDRS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D lmdb.h
>> +-ILIBS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D liblmdb.a liblmdb$(SOEX=
T)
>> ++ILIBS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D liblmdb$(SOEXT) liblmdb=
$(SOEXT).$(SOVERSION)
>> + IPROGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D mdb_stat mdb_copy mdb_dump m=
db_load
>> + IDOCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D mdb_stat.1 mdb_copy.1 m=
db_dump.1 mdb_load.1
>> + PROGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(IPROGS) mtest mtest2 =
mtest3 mtest4 mtest5
>> +@@ -49,13 +50,13 @@ install: $(ILIBS) $(IPROGS) $(IHDRS)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p $(DESTDIR)$(libdir)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p $(DESTDIR)$(includedir)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p $(DESTDIR)$(mandir)/man1
>> +-=C2=A0=C2=A0=C2=A0 for f in $(IPROGS); do cp $$f $(DESTDIR)$(bindir);=
 done
>> +-=C2=A0=C2=A0=C2=A0 for f in $(ILIBS); do cp $$f $(DESTDIR)$(libdir); =
done
>> +-=C2=A0=C2=A0=C2=A0 for f in $(IHDRS); do cp $$f $(DESTDIR)$(includedi=
r); done
>> +-=C2=A0=C2=A0=C2=A0 for f in $(IDOCS); do cp $$f $(DESTDIR)$(mandir)/m=
an1; done
>> ++=C2=A0=C2=A0=C2=A0 for f in $(IPROGS); do cp -a $$f $(DESTDIR)$(bindi=
r); done
>> ++=C2=A0=C2=A0=C2=A0 for f in $(ILIBS); do cp -a $$f $(DESTDIR)$(libdir=
); done
>> ++=C2=A0=C2=A0=C2=A0 for f in $(IHDRS); do cp -a $$f $(DESTDIR)$(includ=
edir); done
>> ++=C2=A0=C2=A0=C2=A0 for f in $(IDOCS); do cp -a $$f $(DESTDIR)$(mandir=
)/man1; done
>> +
>> + clean:
>> +-=C2=A0=C2=A0=C2=A0 rm -rf $(PROGS) *.[ao] *.[ls]o *~ testdb
>> ++=C2=A0=C2=A0=C2=A0 rm -rf $(PROGS) *.[ao] *.[ls]o* *~ testdb
>> +
>> + test:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 all
>> +=C2=A0=C2=A0=C2=A0=C2=A0 rm -rf testdb && mkdir testdb
>> +@@ -64,20 +65,24 @@ test:=C2=A0=C2=A0=C2=A0 all
>> + liblmdb.a:=C2=A0 mdb.o midl.o
>> +=C2=A0=C2=A0=C2=A0=C2=A0 $(AR) rs $@ mdb.o midl.o
>> +
>> +-liblmdb$(SOEXT):=C2=A0=C2=A0=C2=A0 mdb.lo midl.lo
>> ++liblmdb$(SOEXT):=C2=A0=C2=A0=C2=A0 liblmdb$(SOEXT).$(SOVERSION)
>> ++=C2=A0=C2=A0=C2=A0 rm -f $@
>> ++=C2=A0=C2=A0=C2=A0 ln -s $< $@
>> ++
>> ++liblmdb$(SOEXT).$(SOVERSION):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mdb=
.lo midl.lo
>> + #=C2=A0=C2=A0 $(CC) $(LDFLAGS) -pthread -shared -Wl,-Bsymbolic -o $@ =
mdb.o=20
>> midl.o $(SOLIBS)
>> +-=C2=A0=C2=A0=C2=A0 $(CC) $(LDFLAGS) -pthread -shared -o $@ mdb.lo mid=
l.lo $(SOLIBS)
>> ++=C2=A0=C2=A0=C2=A0 $(CC) $(LDFLAGS) -pthread -shared -Wl,-soname,$@ -=
o $@ mdb.lo=20
>> midl.lo $(SOLIBS)
>> +
>> +-mdb_stat: mdb_stat.o liblmdb.a
>> +-mdb_copy: mdb_copy.o liblmdb.a
>> +-mdb_dump: mdb_dump.o liblmdb.a
>> +-mdb_load: mdb_load.o liblmdb.a
>> +-mtest:=C2=A0=C2=A0=C2=A0 mtest.o=C2=A0=C2=A0=C2=A0 liblmdb.a
>> +-mtest2:=C2=A0=C2=A0=C2=A0=C2=A0 mtest2.o liblmdb.a
>> +-mtest3:=C2=A0=C2=A0=C2=A0=C2=A0 mtest3.o liblmdb.a
>> +-mtest4:=C2=A0=C2=A0=C2=A0=C2=A0 mtest4.o liblmdb.a
>> +-mtest5:=C2=A0=C2=A0=C2=A0=C2=A0 mtest5.o liblmdb.a
>> +-mtest6:=C2=A0=C2=A0=C2=A0=C2=A0 mtest6.o liblmdb.a
>> ++mdb_stat: mdb_stat.o liblmdb.so
>> ++mdb_copy: mdb_copy.o liblmdb.so
>> ++mdb_dump: mdb_dump.o liblmdb.so
>> ++mdb_load: mdb_load.o liblmdb.so
>> ++mtest:=C2=A0=C2=A0=C2=A0 mtest.o=C2=A0=C2=A0=C2=A0 liblmdb.so
>> ++mtest2:=C2=A0=C2=A0=C2=A0=C2=A0 mtest2.o liblmdb.so
>> ++mtest3:=C2=A0=C2=A0=C2=A0=C2=A0 mtest3.o liblmdb.so
>> ++mtest4:=C2=A0=C2=A0=C2=A0=C2=A0 mtest4.o liblmdb.so
>> ++mtest5:=C2=A0=C2=A0=C2=A0=C2=A0 mtest5.o liblmdb.so
>> ++mtest6:=C2=A0=C2=A0=C2=A0=C2=A0 mtest6.o liblmdb.so
>> +
>> + mdb.o: mdb.c lmdb.h midl.h
>> +=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(CFLAGS) $(CPPFLAGS) -c mdb.c
>> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_git.bb=20
>> b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
>> new file mode 100644
>> index 000000000..22db6d44b
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY =3D "Symas Lightning Memory-Mapped Database (LMDB)"
>> +HOMEPAGE =3D "http://symas.com/mdb/"
>> +LICENSE =3D "OLDAP-2.8"
>
> We might need a copy of this license in meta-oe/licenses too.
License is already present, its meta-oe/licenses/OpenLDAP
>
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D153d07ef052c4a37a8fac23bc6031972"
>> +
>> +SRC_URI =3D " \
>> +=C2=A0=C2=A0=C2=A0 git://github.com/LMDB/lmdb.git;nobranch=3D1 \
>> +=C2=A0=C2=A0=C2=A0 file://0001-Patch-the-main-Makefile.patch \
>> +"
>> +SRCREV =3D "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
>> +S =3D "${WORKDIR}/git/libraries/liblmdb"
>> +PV =3D "0.9.29"
>
> remove PV here and rename recipe to lmdb_0.0.29.bb
>
>> +
>> +do_compile() {
>> +=C2=A0=C2=A0=C2=A0 oe_runmake "CC=3D${CC}"
>> +}
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 oe_runmake DESTDIR=3D${D} prefix=3D${prefix} libdir=
=
=3D${libdir}=20
>> mandir=3D${mandir} install
>> +=C2=A0=C2=A0=C2=A0 chown -R root:root ${D}${bindir}
>> +=C2=A0=C2=A0=C2=A0 chown -R root:root ${D}${libdir}
>
> why do we need this extra chown op? Is pseudo not able to handle it?
>
> please add it to relevant test packagegroup in packagegroups-meta-oe.bb
> as well.
>
>> +}
>>
>>
>>
>>=20
>>
