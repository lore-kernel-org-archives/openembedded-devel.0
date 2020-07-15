Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.57])
 by mx.groups.io with SMTP id smtpd.web11.2159.1594798667603801267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 00:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hYXhTja1;
 spf=pass (domain: windriver.com, ip: 40.107.92.57, mailfrom: wenlin.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyj8R8hqXe9jK6vUMdm0bNrbzxVU0fOzoIwMYhOrDjX18UVzPq/qUYBdp+tF3MxB7c3mcf4waxsnD7U9uxhZXhK1WV53gYtHKBgGnPXa/jnmviZDxbMT6nQbhcZU0+W5qwhGB54SfAr3pt36jdLi996NLcIaZJqgrg9aFET71Gn2tSConVmCuvZTQAhJAqjlJjHozMvLcgxNb3rNpfHGLv27Bd6vO4yoOk3Q0Ct3zrJXkk9353fXkjUp4C89RlKe8BJIiM6ozc91xJWlzxNVpGnsmVjvqE4gVSeS8gvbwLpZ6Q3eSdumwFwaH1eGm8r2MBA/XogjarPaKpMyGTvAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTDlohF+MT84qSTLds/iXXLRr7Ci9a6g9/IwOle48TM=;
 b=XXMugvP+81ECSQDplSblZMURvPQqSSG2CG2fuJhGY3RL6LFmmiPe+ju524zGaF1dJQxr2Jx/6RpCxWddX0c04DquVMdFjjPMnBqXQZuVF6sfR1sKkcMVKBjaDPv4rvITsQ+JWE33k3WJl7kElf5fVrORKy4vkCrl8cW53/zsCKwH/pNRiGMm1TVGlDpOWjDmm35YaCZo52VN9mPCHzs7Pi8OepJ1oJw5Q6zipWZCDEFMRCtNaPB6JXCvCLLQCOBhRkDHqCoUfAeNZiiGfUjpNMvZ6ATvYCrZMZjAsME34TsqgxfGeSA8r3281Nr3Ano2utJnHkHf6isofVcZ7MMYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTDlohF+MT84qSTLds/iXXLRr7Ci9a6g9/IwOle48TM=;
 b=hYXhTja1AGkta27bzkDFhWV18E7/nc3h6W+C/2sQ5DgS1TiozdYS5f/HS5rKkyBklhCav9dkGHi7ifVht6YNQGx4g2aii2smPxXh1vi8KH9/K6/e/mgZHvI6JTrMnNUFmhhvVp9rVhdeyLwTYRO545aVNy4BnPPa0H3Z/Kp4uu8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2658.namprd11.prod.outlook.com (2603:10b6:406:ae::16)
 by BN6PR11MB3985.namprd11.prod.outlook.com (2603:10b6:405:7b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 15 Jul
 2020 07:37:44 +0000
Received: from BN7PR11MB2658.namprd11.prod.outlook.com
 ([fe80::8101:4c9c:62bb:9361]) by BN7PR11MB2658.namprd11.prod.outlook.com
 ([fe80::8101:4c9c:62bb:9361%3]) with mapi id 15.20.3195.018; Wed, 15 Jul 2020
 07:37:44 +0000
Subject: Re: [oe][meta-networking][PATCH] net-snmp: Fix CVE-2019-20892
To: Khem Raj <raj.khem@gmail.com>
References: <20200713100529.87717-1-wenlin.kang@windriver.com>
 <897ea3df-8c00-90ef-3d7a-6798bfa86792@gmail.com>
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
CC: openembedded-devel@lists.openembedded.org
Message-ID: <6e712c51-03d5-0f01-9d72-fd306641b730@windriver.com>
Date: Wed, 15 Jul 2020 15:40:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <897ea3df-8c00-90ef-3d7a-6798bfa86792@gmail.com>
X-ClientProxiedBy: HK2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:202:2e::25) To BN7PR11MB2658.namprd11.prod.outlook.com
 (2603:10b6:406:ae::16)
Return-Path: wenlin.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.167] (60.247.85.82) by HK2PR06CA0013.apcprd06.prod.outlook.com (2603:1096:202:2e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 07:37:42 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be6962e9-ad85-4c53-f419-08d82891f62b
X-MS-TrafficTypeDiagnostic: BN6PR11MB3985:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB398508E877E725DE50E86892E17E0@BN6PR11MB3985.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	csC4bRPnZV94M+X4zVhW69sjGHUw14GkxtEvRY7laLbzAz6qPlPGO08xE9I4QD47MNAyICC8el7Eiw1UzL9RYnMpMAEwzyoBinzUeH9mRZRj0at584SHw2Aabwv7I0x/h2qde1T5BXXnCrXkmkw+gTybM7jcGO1PuGqPehEbAZpusy5qTD5x1cuz8Evfm661OcnbPQ1qOtWgA1iDg8bUJNxH+4RAqiVLS71YQ1LU6T83xIOb1IXLwyGZwaLtTRgD71bmXRfTUo8qWrtx2vKJ09Dqp2i4N+Aup3rvap+HASy95cXGVWUnCOG/lKS5jD/CdNqdg5vqr9tRUyGsM1Rcz+9h/9mYtPOkpLsEWfBcmsG0nqy60mrmFJUtokg7PLB/F6nOLzg5V5BxRsbm2IMzhSv2RULyrVicI3UCc5L2Tcsf6FWM94rfjxQmOn+bzjHVWyxOamiHyMLnwcgSSchrMnGMPDTFbqaU/OUNk2g5c77J3HuWM5DZx43awzZ8+uP8kXPE+D/vEv6AuwmmUHJl2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39850400004)(396003)(376002)(346002)(956004)(66556008)(2616005)(31686004)(2906002)(36756003)(6666004)(966005)(186003)(4326008)(16526019)(52116002)(16576012)(8676002)(6706004)(478600001)(6916009)(26005)(83380400001)(5660300002)(66476007)(53546011)(316002)(6486002)(8936002)(31696002)(44832011)(86362001)(66946007)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UXchNdaZIhWfCYbFMPW8j+WSC1RpOf3WsmVKxiug8gK69+P98/VKqFE+aQnweqim0wVx2EUj3g+j9hd7x4VfzC1R4Japj/XEMOPOlxfDm5Mi5ae9GWKlspZ6BQw+JAF/n7aysyIzDRo5c41hg9f2hEvZKIQhXjCVI82GuhoAdTTsJPlu4R2HiAKvEaWc4SO2VpR/MK57xTksAJjIYo5Mcz1pX9XFogJjBZVwuQ8pvXKyc0mKhBYSsf67P5tFhevh2CLgt+jGk1wUjiphoIt+ZQMdOc1K6qhELWTTrlUiBlSGTyWvDfA8KrtJuPFDFreU2gQNdBL1WNMS1gsYd16GCq9pwt0Raxw+cASdT2ISLP5L6aGuczZ8RLx63G0Cl0drDnNRO3gn2y7+063rFnsZOqxMv1gMRAzpgN/BUv10EjgusDokT10rRmb5Xq6hSsMR3baANKeijoneqq4XqTZmRDxvjNcswDRXY9Y7mlDAQLA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6962e9-ad85-4c53-f419-08d82891f62b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 07:37:44.0278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akoJBrOBzTZkZg4gehYPgw1lx+p2FgbglXTkxpS+q+NogKNIA9qcbDJc51WSNZhTmr+CDH10ot+VdnIege+oS31cK7lmkgryrMRxmGuS57Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3985
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2020/7/14 =E4=B8=8A=E5=8D=881:07, Khem Raj wrote:
>
>
> On 7/13/20 3:05 AM, wenlin.kang@windriver.com wrote:
>> Fix CVE-2019-20892
>>
>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>> ---
>> =C2=A0 ...oduce-a-reference-count-in-struct-us.patch | 166 ++++++++++++=
++++++
>> =C2=A0 .../net-snmp/net-snmp_5.8.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=
=C2=A0 1 +
>> =C2=A0 2 files changed, 167 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-In=
troduce-a-reference-count-in-struct-us.patch
>>
>> diff --git=20
>> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-=
Introduce-a-reference-count-in-struct-us.patch=20
>> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-=
Introduce-a-reference-count-in-struct-us.patch=20
>>
>> new file mode 100644
>> index 000000000..99f02adb7
>> --- /dev/null
>> +++=20
>> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-=
Introduce-a-reference-count-in-struct-us.patch
>> @@ -0,0 +1,166 @@
>> +From 76819d992fdd88e3beb08b79851c6c129da7bc7e Mon Sep 17 00:00:00 2001
>> +From: Bart Van Assche <bvanassche@acm.org>
>> +Date: Fri, 10 Jul 2020 10:48:41 +0800
>> +Subject: [PATCH] libsnmp, USM: Introduce a reference count in struct
>> + usmStateReference
>> +
>> +This patch fixes https://sourceforge.net/p/net-snmp/bugs/2956/.
>> +
>> +Upstream-Status: Backport=20
>> [https://github.com/net-snmp/net-snmp/commit/5f881d3bf24599b90d67a45cae=
7a3eb099cd71c9]
>> +CVE: CVE-2019-20892
>
> do we need this on master too ?


master has included this patch,=C2=A0 only zeus needs it.


commit 96a63b1ecf321c9a63880a963ed257086998133b
Author: Armin Kuster <akuster@mvista.com>
Date:=C2=A0=C2=A0 Fri Jun 26 16:14:10 2020 -0700

 =C2=A0=C2=A0=C2=A0 net-snmp: Security fix CVE-2019-20892

 =C2=A0=C2=A0=C2=A0 Source: net-snmp.org
 =C2=A0=C2=A0=C2=A0 MR: 104509
 =C2=A0=C2=A0=C2=A0 Type: Security Fix
 =C2=A0=C2=A0=C2=A0 Disposition: Backport from=20
https://github.com/net-snmp/net-snmp/commit/5f881d3bf24599b90d67a45cae7a3e=
b099cd71c9
 =C2=A0=C2=A0=C2=A0 ChangeID: 206d822029d48d904864f23fd1b1af69dffc26c8
 =C2=A0=C2=A0=C2=A0 Description:

 =C2=A0=C2=A0=C2=A0 Fixes CVE-2019-20892 which affect net-snmp <=3D 5.8pre=
1

 =C2=A0=C2=A0=C2=A0 Had to fix up some file do to later code restructionin=
g.
 =C2=A0=C2=A0=C2=A0 "int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 refcnt;" addition was done in=20
include/net-snmp/library/snmpusm.h

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Armin Kuster <akuster@mvista.com>
 =C2=A0=C2=A0=C2=A0 Signed-off-by: Khem Raj <raj.khem@gmail.com>


>
>> +
>> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>> +---
>> + include/net-snmp/library/snmpusm.h |=C2=A0 1 +
>> + snmplib/snmp_client.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++-------
>> + snmplib/snmpusm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 65 +++++++++++++++++=
++++---------
>> + 3 files changed, 51 insertions(+), 36 deletions(-)
>> +
>> +diff --git a/include/net-snmp/library/snmpusm.h=20
>> b/include/net-snmp/library/snmpusm.h
>> +index 3f60787..87b31f3 100644
>> +--- a/include/net-snmp/library/snmpusm.h
>> ++++ b/include/net-snmp/library/snmpusm.h
>> +@@ -43,6 +43,7 @@ extern=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "C" {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Structures.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct usmStateReference {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 refcnt;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *usr_name;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usr_name_length;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u_char=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *usr_engine_id;
>> +diff --git a/snmplib/snmp_client.c b/snmplib/snmp_client.c
>> +index 2a46351..b2ea891 100644
>> +--- a/snmplib/snmp_client.c
>> ++++ b/snmplib/snmp_client.c
>> +@@ -402,27 +402,16 @@ _clone_pdu_header(netsnmp_pdu *pdu)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +-=C2=A0=C2=A0=C2=A0 if (pdu->securityStateRef &&
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdu->command =3D=3D SNMP_M=
SG_TRAP2) {
>> +-
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D usm_clone_usmState=
Reference((struct usmStateReference=20
>> *) pdu->securityStateRef,
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 (struct usmStateReference **)=20
>> &newpdu->securityStateRef );
>> +-
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> ++=C2=A0=C2=A0=C2=A0 sptr =3D find_sec_mod(newpdu->securityModel);
>> ++=C2=A0=C2=A0=C2=A0 if (sptr && sptr->pdu_clone) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* call security model if =
it needs to know about this */
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D sptr->pdu_clone(pd=
u, newpdu);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 snmp_free_pdu(newpdu);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return NULL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +-=C2=A0=C2=A0=C2=A0 if ((sptr =3D find_sec_mod(newpdu->securityModel))=
 !=3D NULL &&
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sptr->pdu_clone !=3D NULL)=
 {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * call security mode=
l if it needs to know about this
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (*sptr->pdu_clone) (pdu, n=
ewpdu);
>> +-=C2=A0=C2=A0=C2=A0 }
>> +-
>> +=C2=A0=C2=A0=C2=A0=C2=A0 return newpdu;
>> + }
>> +
>> +diff --git a/snmplib/snmpusm.c b/snmplib/snmpusm.c
>> +index 3cfa126..4d8edad 100644
>> +--- a/snmplib/snmpusm.c
>> ++++ b/snmplib/snmpusm.c
>> +@@ -285,39 +285,63 @@ free_enginetime_on_shutdown(int majorid, int=20
>> minorid, void *serverarg,
>> + struct usmStateReference *
>> + usm_malloc_usmStateReference(void)
>> + {
>> +-=C2=A0=C2=A0=C2=A0 struct usmStateReference *retval =3D (struct usmSt=
ateReference *)
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 calloc(1, sizeof(struct us=
mStateReference));
>> ++=C2=A0=C2=A0=C2=A0 struct usmStateReference *retval;
>> ++
>> ++=C2=A0=C2=A0=C2=A0 retval =3D calloc(1, sizeof(struct usmStateReferen=
ce));
>> ++=C2=A0=C2=A0=C2=A0 if (retval)
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval->refcnt =3D 1;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 return retval;
>> + }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* end=20
>> usm_malloc_usmStateReference() */
>> +
>> ++static int
>> ++usm_clone(netsnmp_pdu *pdu, netsnmp_pdu *new_pdu)
>> ++{
>> ++=C2=A0=C2=A0=C2=A0 struct usmStateReference *ref =3D pdu->securitySta=
teRef;
>> ++=C2=A0=C2=A0=C2=A0 struct usmStateReference **new_ref =3D
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (struct usmStateReference =
**)&new_pdu->securityStateRef;
>> ++=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> ++
>> ++=C2=A0=C2=A0=C2=A0 if (!ref)
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> ++
>> ++=C2=A0=C2=A0=C2=A0 if (pdu->command =3D=3D SNMP_MSG_TRAP2) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netsnmp_assert(pdu->securi=
tyModel =3D=3D SNMP_DEFAULT_SECMODEL);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D usm_clone_usmState=
Reference(ref, new_ref);
>> ++=C2=A0=C2=A0=C2=A0 } else {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netsnmp_assert(ref =3D=3D =
*new_ref);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref->refcnt++;
>> ++=C2=A0=C2=A0=C2=A0 }
>> ++
>> ++=C2=A0=C2=A0=C2=A0 return ret;
>> ++}
>> +
>> + void
>> + usm_free_usmStateReference(void *old)
>> + {
>> +-=C2=A0=C2=A0=C2=A0 struct usmStateReference *old_ref =3D (struct usmS=
tateReference=20
>> *) old;
>> +-
>> +-=C2=A0=C2=A0=C2=A0 if (old_ref) {
>> ++=C2=A0=C2=A0=C2=A0 struct usmStateReference *ref =3D old;
>> +
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_FREE(old_ref->usr_nam=
e);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_FREE(old_ref->usr_eng=
ine_id);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_FREE(old_ref->usr_aut=
h_protocol);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_FREE(old_ref->usr_pri=
v_protocol);
>> +-
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (old_ref->usr_auth_key)=
 {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SN=
MP_ZERO(old_ref->usr_auth_key,=20
>> old_ref->usr_auth_key_length);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SN=
MP_FREE(old_ref->usr_auth_key);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (old_ref->usr_priv_key)=
 {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SN=
MP_ZERO(old_ref->usr_priv_key,=20
>> old_ref->usr_priv_key_length);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SN=
MP_FREE(old_ref->usr_priv_key);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> ++=C2=A0=C2=A0=C2=A0 if (!ref)
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_ZERO(old_ref, sizeof(=
*old_ref));
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_FREE(old_ref);
>> ++=C2=A0=C2=A0=C2=A0 if (--ref->refcnt > 0)
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +
>> ++=C2=A0=C2=A0=C2=A0 SNMP_FREE(ref->usr_name);
>> ++=C2=A0=C2=A0=C2=A0 SNMP_FREE(ref->usr_engine_id);
>> ++=C2=A0=C2=A0=C2=A0 SNMP_FREE(ref->usr_auth_protocol);
>> ++=C2=A0=C2=A0=C2=A0 SNMP_FREE(ref->usr_priv_protocol);
>> ++
>> ++=C2=A0=C2=A0=C2=A0 if (ref->usr_auth_key_length && ref->usr_auth_key)=
 {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_ZERO(ref->usr_auth_ke=
y, ref->usr_auth_key_length);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_FREE(ref->usr_auth_ke=
y);
>> ++=C2=A0=C2=A0=C2=A0 }
>> ++=C2=A0=C2=A0=C2=A0 if (ref->usr_priv_key_length && ref->usr_priv_key)=
 {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_ZERO(ref->usr_priv_ke=
y, ref->usr_priv_key_length);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP_FREE(ref->usr_priv_ke=
y);
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> ++=C2=A0=C2=A0=C2=A0 SNMP_FREE(ref);
>> + }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* end usm_free_usmStateReferen=
ce() */
>> +
>> + struct usmUser *
>> +@@ -3345,6 +3369,7 @@ init_usm(void)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 def->encode_reverse =3D usm_secmod_rgenerate_=
out_msg;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 def->encode_forward =3D usm_secmod_generate_o=
ut_msg;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 def->decode =3D usm_secmod_process_in_msg;
>> ++=C2=A0=C2=A0=C2=A0 def->pdu_clone =3D usm_clone;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 def->pdu_free_state_ref =3D usm_free_usmState=
Reference;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 def->session_setup =3D usm_session_init;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 def->handle_report =3D usm_handle_report;
>> +--
>> +2.18.1
>> +
>> diff --git=20
>> a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb=20
>> b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
>> index 192b6b506..c23dcd3cf 100644
>> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
>> @@ -27,6 +27,7 @@ SRC_URI =3D=20
>> "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://reproducibility-have-printcap.patch \
>> file://reproducibility-accept-configure-options-from-env.patch \
>> file://0001-net-snmp-fix-compile-error-disable-des.patch \
>> +=20
>> file://0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch =
\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "
>> =C2=A0 SRC_URI[md5sum] =3D "63bfc65fbb86cdb616598df1aff6458a"
>> =C2=A0 SRC_URI[sha256sum] =3D=20
>> "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
>>
>>
>>=20
>>

--=20
Thanks,
Wenlin Kang

