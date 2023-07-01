Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48633EB64DA
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 00:13:51 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.40])
 by mx.groups.io with SMTP id smtpd.web11.28809.1688170428348715577
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jun 2023 17:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=ptTk1vFM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.40, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR5FUY5JbEtaPtNsUkwEM4GCI2B7ZGdjDj7PvfZHcjaHeDgqiBa540rMY7MwEH3Mu7VgNqzfSUOknYtq7cksVr7Zwakkak5EtbwtI4kNhuBA6vtrWPH/jJL8/ps3jgKlp1Yxrf0zHnyO4A0RW41jmtcHmlrr8z4GMYw1qDxz4j87Z+KbBqvBEGPj6NlC0VL9be4rRFx/YiqQfdcukkmyTPIvKajrlHPLMzKQdwV/rZK2vcrfkoEonCqhI8BRWm3QaLZx9fg3FwYITxzDJpsvoSJJlDcePIm09Gk0Knr3guH/QjHWLlDyx6oTMkiJyZWiyRJQC5U6s5UvTve1X9N/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIEfy/SUcZDqmAv5HWBsuALzsdgsarkiksDfbdlToMg=;
 b=mCH/rRRucSTTwiKDZqrUEHzTW2GyQkbPNmf1VqHq/K4PLRgmB4N15E40kAVa+m3T2uTOKVmPWo7NzCDGJOrLJRbH7BkIgR634rCBd2QFT4gPseKmWurMmh40SnwyMrIySf7Uk2v+7pEGEB2Hg2FBnKphRMw+Qa06OpW2q+3q3nwyKZ/aaKB8C6eTtyaxKkZ3O5DWhDbfPiXfFV4LgG6BUGcpqVp9Gayk/IYHtJulLADscGfPZO4xmx+ogMNEAAMxVGdVLBWLcZJQppff/hJ/6R2A4DmC08BXnvuI5sGeeLGrMySfhBHkCGutOI/uBaWy00mLidoQ6e7A9AQQZ84Alw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIEfy/SUcZDqmAv5HWBsuALzsdgsarkiksDfbdlToMg=;
 b=ptTk1vFMqkSFqfe1erL4x/dOTHjg/6zb0+SjFS7fGQaxEIxgIA27HPsZwOzd9ur7eJgyXj2UBSalShJuzMEqXJNkfuM0YMgmlkA35Fw8UKv7wFqaOJfCbufyfzZac6FfsLsm3W2FCKGyOARxMdwvnhCpidz1ViKgHBQN3OlxQtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Sat, 1 Jul
 2023 00:13:45 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::29ee:5a62:a3e7:bfaa]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::29ee:5a62:a3e7:bfaa%4]) with mapi id 15.20.6544.019; Sat, 1 Jul 2023
 00:13:45 +0000
Message-ID: <d16188e4-a2be-19c6-8a00-4c2b9c46b891@amd.com>
Date: Fri, 30 Jun 2023 18:13:41 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-oe][mickledore][PATCH] opencv: Revert fix runtime
 dependencies
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
CC: mark.hatle@kernel.crashing.org, twoerner@gmail.com
References: <20230620153917.1749409-1-sandeep.gundlupet-raju@amd.com>
 <a5c4679d-2d26-682e-299d-00c30082cae8@amd.com>
In-Reply-To: <a5c4679d-2d26-682e-299d-00c30082cae8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|BN9PR12MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: d68c6d09-a75f-4435-6aaa-08db79c8088b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BiDdh9IPVvqibxBuaxloCmkREsrqkOyP406pbB3gqLu0CiIO8Xtc7lv/IP9VNR3/ec+zn3/fB4gN1vWMqhzirYWn2XMS7apepraL1vldhPphfVlpdCa5Dp+elCMIo9nYLAxnH5wxHhD2i+XtOjd0XIj4wsMM5B7+0jYyqsXHW9FNrfjlh1nDHwCsk/z3kqXtdDC1DHq+hKqh6Ya2vK2YxC7dI9dsGsMDoUCP0z8hhhgXz1WNgLf8GI5ekIUyKlVJRC1no5uQ66RvJJvHbFpFb5KTR0cl8kPQN3nIqmuPv7Rm2p37VqOrAvZI/48ikxGfoW2Yq1nsdZcxjlEheHxufjhqLc/sWK5ZyQH6QxG9S5rd4KVR2fJVID/+ofOjZ4uz/q8N1t/sXPbLdqNkxL/KUonKTOA3QRYnNQXOb7gOyvfxdYeQ0XB0lAxKFMUFm4+UI/p+8Gj8bl4D6J6wzi6v/ya1lW+6Bq+dAt5W9+mD5wjkUKn2qYzU0nfsna+nEJ/S8NFKFu838pkt3sNHyESk9ZKrchuvIbAGVDjXIhj5eIB8aWUSmWwIXgHNs8rwdoFUMwZhL4vMNnuBkaEznMMlz3LQW3qa0P6w4N8jlh3bcJbFX3MeA06QSsh4KVDVER1FIIKIIzuD1cXA0Ye9WpYuiw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199021)(6486002)(478600001)(6666004)(6512007)(26005)(186003)(53546011)(6506007)(83380400001)(36756003)(2616005)(38100700002)(86362001)(31696002)(4326008)(66946007)(66556008)(66476007)(2906002)(316002)(5660300002)(8936002)(8676002)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yuX92FMQK9SHfRxD844EgrHgMroLt0ex1Kfmv2fAyqpgekv/k0YQO9cSH7cY?=
 =?us-ascii?Q?fFAuZZaPnC1dimgbea9wzQ1za7YN9LmLqOlHgz+hAHc4lhExT6NIhDoSb4MO?=
 =?us-ascii?Q?s3HRPiV7F4O0sT6GG8BG+bnp9jh5qp6+6fK5cb+bJCeYABh5IavGzhP046hM?=
 =?us-ascii?Q?/8fTeanxY9Yc/WMp0oU2rFseao8mRF3UgYftGiahpGPsh23JXe9UxTAeGJVY?=
 =?us-ascii?Q?WLipxnvHA6AYy3it65SQ1TfFfISF247v/iB849A8lWcwYXze5bM/K2r8DABc?=
 =?us-ascii?Q?7rZ8m4nRdVFDzHrujeBNLJriSzv2L6F0D2gJLTEOSm41QNAcQPv8bGkVXfIm?=
 =?us-ascii?Q?Hg3LSXqFjF8dJKo7/vvlyfarVfyV2RoZoenQ8FVoz1qTFbrrAOouVtFbBh61?=
 =?us-ascii?Q?en6y5mUvySSTAent7OVjFm/aJFQp3BqFyllMlIDQ+mgMxkFXxzZiOd/y5STh?=
 =?us-ascii?Q?lCv2IPhtcD5kjaRAlLuPzeHHPQ6xDJkT26U1d3LY0DpAXYIqixcF8p6OECWj?=
 =?us-ascii?Q?ESDIuKw9jAm3vfLeO5f6MqIOkuAMgIgh+AP0sA3rUxmUBiOUlJKzF48pNa4d?=
 =?us-ascii?Q?1Im2VhiA6eGsTAqLYvujKpQ0lxQYluqbTONnoWpxMHOp/04+MeYOfeO/hprr?=
 =?us-ascii?Q?lWjMbArxl+ZPOkW9BXf9AVdIK1F+j6sYfOkxWFUODnenJwgEixb7cd1+Q4FS?=
 =?us-ascii?Q?VVbzn/n2FUo/bLqily9kfNabkfdzbh1FNuvVQ4/0JCeTGa/MRQrkmU8ORBN3?=
 =?us-ascii?Q?ib+Ut9hP6d7kT0TKdUvsSaSh1bbR3tVlsjm6xrYhXCXPp6lFWvfgW2cFPS+n?=
 =?us-ascii?Q?j29c5tQ5Songf7g+rXe441SuTbm2JX4BU4kfYJClmdefuOwHENbsBY3Y+iW6?=
 =?us-ascii?Q?GeSCBcGbM+asfA7QGPHuVqsehsyIU8r9fTJIE7YUCjxg2JPveYco63GwCqEc?=
 =?us-ascii?Q?7fH/u+ryAj9KshSmgK5489gVjJgQb2kk/w3RcI4SyCaeUsEcW1Co0bGKHCQh?=
 =?us-ascii?Q?I1qVMfI8vELiAH/mnSNLKSzltckX+0/NOEtgVqmb7t+pa6n0oOrKRYdzCNsE?=
 =?us-ascii?Q?0Kbylth7hwvKAc5AyE1J+8uyfC/HgQuMIqNBn0PleloBvDpPHIAZd7QgYSw6?=
 =?us-ascii?Q?HZgU6RnhXwFllFulTbKuCNwERHv0gfpWQStJ4NFQKRub17fM3Y/iN49BpjMX?=
 =?us-ascii?Q?5u7BGmbedWG4KZJWK8Gumbjmdb7SML6suA8zttLe7pWLNQoy9AFQFm++LiVX?=
 =?us-ascii?Q?d88CIWfIYfpvwPoFBa20fJ34ejutnpzxeJlXtYN7gYN8817AdtFIEvkCqUhm?=
 =?us-ascii?Q?Y8n7vv0AOmSPLCLECni75qu+dQnIaxh759ZIGqcvIQyt7Ia615k35502YxtP?=
 =?us-ascii?Q?3gJVyYlloXxkE4mvYEOFKnAc6BxVbXC5iEupx9skzojT3UCAmWRKShzSP1O5?=
 =?us-ascii?Q?39Un422JN23JIL7+r5ntUXPiX0g5yYQw252V0oZtQsL6mcTM9TM359z9YsCj?=
 =?us-ascii?Q?cMrpimuQW0gLh9li5jAYOK/RbcUZwi9i+4APFHJA/dtF9A9ApJT3eXTdhnjJ?=
 =?us-ascii?Q?P8RB9mIjuGhNldaEIbgSBprv+zmOfq6lAbjPtmc9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68c6d09-a75f-4435-6aaa-08db79c8088b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2023 00:13:44.9616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyPSbbDnBWzkF8aGhrgiyAqGYExdUV55ojuOjbKpj7a3DOR75/Q82sg6bUfA6ax/d8gZQH4ofdL1xcw5yP5+2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5259
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Jul 2023 00:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103645

Ping!

Thanks,

Sandeep

On 6/27/2023 4:21 PM, Gundlupet Raju, Sandeep wrote:
> Hello All,
>
> Can we get this patch merged to mickledore?
>
> Also is langdale branch is still open? If so let me know I will send=20
> the patch for langdale as well.
>
> Thanks,
>
> Sandeep
>
> On 6/20/2023 9:39 AM, Sandeep Gundlupet Raju wrote:
>> This reverts commit 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837
>>
>> libopencv-ts package is not empty and libopencv_ts libraries are
>> not all installed in the -dev package, these libraries are needed
>> for sdk development listed in opencv4.pc file.
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>> =C2=A0 meta-oe/recipes-support/opencv/opencv_4.7.0.bb | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb=20
>> b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
>> index 361b00430..bad6f1508 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
>> @@ -162,7 +162,7 @@ python populate_packages:prepend () {
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 metapkg =3D=C2=A0 pn
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('ALLOW_EMPTY:' + metapkg, "1")
>> -=C2=A0=C2=A0=C2=A0 blacklist =3D [ metapkg, "libopencv-ts" ]
>> +=C2=A0=C2=A0=C2=A0 blacklist =3D [ metapkg ]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 metapkg_rdepends =3D [ ]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pkg in packages[1:]:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not pkg in bla=
cklist and not pkg in metapkg_rdepends and=20
>> not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not=20
>> pkg.endswith('-doc') and not pkg.endswith('-locale') and not=20
>> pkg.endswith('-staticdev'):

