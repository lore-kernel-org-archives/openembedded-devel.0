Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7020.1621932666306896141
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 01:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MGbRCJ+v;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=077953792e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14P8jNdC017275;
	Tue, 25 May 2021 01:51:04 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 38rmkbr9s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 May 2021 01:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZWddpHqqqqK0keD9aOCVZPF1lLig2oYZdgjD56bJix2w+qdj5zNPgQnilnEz6civoffrM7LPk/zip+/wwszDILu+Ipw8VqHK+2oDnA46f0rPJ+0yZgIUESmneVG1IMudxrE5yWQyeahpjbQpGSmdNQusyF2pBpn0f61UtA5w+OjkeCzWsk3jGqJr/sdj/EXvjcjaQruWcjPbHu6oogszamAu5r9NJdLVeUbeXeNzRMkj9Y0Fvbn0cj6FmBJZgyWCmSbn3ynw2JwMHwy1fWe+0WVlaVSHKtiMW2mfyT/66Aa7db1Z7EqOuyIlPCSdeYsf3axzJK6q56MMcYT38+LHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRwmH4AEKYimranph96Nbzo8MqBI5XeOGNnDTLN9JSw=;
 b=mlCBGPF5ENMqfy95dlTY/bCmkdxxfDqJhKlkL5/HeNF4dP/ttVO7+qANmXxiUkqvdY8txNKGtnK891BgvxI+VgRV73fbplmmGLd5ea5KXjV+J0irixPBUc7AA/V1DZJsPKmSYXVHLD07Vxp1URfsMCmIZi+3SdSSk4N2h4oSy/8fKYdg8OzqQJiy0pFno+SnqfEHmnczDfpWot3aFTlA5BV5uBxdyLcqK7AdXfqQeqaW3we9szsIURuxJLsHmtAa6GfVgAybgbB9zviO6vWBBSCsbl8sjm4prf+1FFY23IhvdVrq/PwXFOYDqHR+A4owoQdryXgTp5DnUrDmHWofyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRwmH4AEKYimranph96Nbzo8MqBI5XeOGNnDTLN9JSw=;
 b=MGbRCJ+vOf26hCTe7vTjPacv4zTRmFbHeWC/VBbs1vauovbWMaIJQZs0DW6KCFsvk/hfcHibRMSW68tXLHLUgt0faeLenzh4FDQgNxiZgE0lYODMORypPrn8qRjt8BsXYqESzYP3DYSz6jr0jnRUlBW9yUC1ikUHb1t9jxdnnh0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 08:51:02 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 08:51:02 +0000
Subject: Re: [oe] [meta-networking][PATCH] dhcp-relay: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <167FC4DDC2069D52.24037@lists.openembedded.org>
 <931b389f-1994-22ef-2eba-d20dbf6ff8b4@windriver.com>
 <f8d57238-0030-f053-fed2-47aa916bb682@gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <7c844c73-44c6-df1b-0823-75ed822dd681@windriver.com>
Date: Tue, 25 May 2021 16:50:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <f8d57238-0030-f053-fed2-47aa916bb682@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY3PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:a03:255::29) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by BY3PR10CA0024.namprd10.prod.outlook.com (2603:10b6:a03:255::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Tue, 25 May 2021 08:50:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 985e5734-cad6-42f7-dd19-08d91f5a38f1
X-MS-TrafficTypeDiagnostic: CO1PR11MB4914:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4914F47195BED11A092B4027F9259@CO1PR11MB4914.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1QfdXOxtEbnoW6o4vcmSQIebIUFM0Yxi+WnMODMn4YEfxih6S2sDuNeJLP3Qg07KXUQOMUKlXii+pQQ7pn/KpvxbHsx9LuhraqT7i7mfYK5fxMvxfYyROqhFIbbITpqioTtUBtBx3TVu1JREYNicdqVrUnsPJw4pHZ0qOQemLLniaVC8RZxhSBrsfG/DvOE8KF0QEWg+h9isEC3tXJ7/wxn2aV3pNv9ol73QNuv417UnvwN1CJVRAcytWTbqrOufxHC4twbigm9Iw41ZJKBle+t74EAKtjtVNzcTXNhea3OR84UOodnqwn/y+LnHST/WxD/vdSIqvDZ5SWjJQgloaVKS2g3UUhHvsnCXSh1o28/hACaueFsyV3rYTpbZNC9eMC1KEJceuQO5YXZXnZ73vr18x9hr26nrI1ztnofhjY995MTkEjBsvCUzcR1wMnmORbG/Y4THmnVJ2+kfpYSIzxGF4vgK2Wtbd/G52nndOw5mMWOg61/mybj8C0jkTNm3sW+AD00hw1DH2DP04Buo9UVVJiP2nF1VuJSM/BoQQrRYBoTfbgMc6reIjWgbC01wNSPDszluw/AQL8AH+k2FMwe2WzQDCcJDWyJXNdmMxgwfA/eXEtT1pSvdDbxOPZtABvvSNTGoxMDti9OFIToBwTsYGtgHjUnMvDh5L8Nr3aSwkPShf17ZIaY0h0OP8+yF7TPlDr0DCOdvtx8FYhtzowmo8415ohN72myjM4+xplzPxDAudgmjlu3wPm+HN+aTtVCk0G+ttThGy3MXoRzDXntkIUnRZpWoEZkmsEvtxmUCBoXOsaeNqChjOGJW2HV5a6tUOJNzGEfXkEsiR2aOwW7TmYU0Fqv5bv10b8i6nCo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39850400004)(366004)(346002)(6486002)(66556008)(66476007)(6666004)(66574015)(36756003)(44832011)(8936002)(66946007)(966005)(8676002)(6706004)(83380400001)(2616005)(186003)(52116002)(21615005)(53546011)(33964004)(478600001)(2906002)(31696002)(86362001)(31686004)(16576012)(16526019)(38350700002)(316002)(30864003)(38100700002)(5660300002)(956004)(26005)(166002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WVJBclY3VHZ1NE9nL0pOOFpFa0wwdDcySld5WGJ6dUh3YURHMXo2TWgzSmN6?=
 =?utf-8?B?d1BsM0Ewc3Vpd3pxNGFPcWkzeUZLcGF5NC80YmdJYzBBS0xsa1UzZ1BJUUJL?=
 =?utf-8?B?bmRlOHlDRHNZSG96L2JpTlY0QXVVNkRMUTFIQjY0Sk50UnZsL3lLWDFFWHdy?=
 =?utf-8?B?YnVQNDdqSW95YTMvdjR4M2pQUEp3QTU2c0lQOVI2RTVPOFNLREg5NTVkRy9r?=
 =?utf-8?B?bndiTGI4bGRPVTdyNThUc25zSWU5WTBtU2c4blorZ3VncTQ2NVFoU0pETUt2?=
 =?utf-8?B?bEhPV3lzWWRDbTMvWndicTNKcTRTbG5aczF1U1VTa3djZEpjeWF4bm5rU1dY?=
 =?utf-8?B?eThXRWFzaUFyeUlHRjhkSFByWHh5VFFuWDFoMCtvZmRJOXVMc21JY3ZwWHd0?=
 =?utf-8?B?cHN4TG5IbTdnbTFFQ3BXSEJqdmNXektEYlRrZnJmY2hYYU42YVNTTXZpb1lu?=
 =?utf-8?B?eERrSmUxMHZUaVVkWXFkNXprbGNYbEhRQVFyQktaMTdNMjM1a0dHd1gxbERL?=
 =?utf-8?B?TjQ3R05ucjFiWS9GbjQ2a21kZUdWL0xnZjFQejNXNkhLdlRzUXRqOUMwdlFI?=
 =?utf-8?B?dFkvcXNHRDhNM0l6N2lxYk16RWJsZTRFVEJBcEhMR1VlMEgrVzcyUGVZNXBC?=
 =?utf-8?B?WFRDWmpWY0ltajMyNjBydERSOXROOUw1YXFuTU1iTkNoblpsUjhTa2MrN1hm?=
 =?utf-8?B?MDVWeVlGK3F3WlFQcVZ0QWYycE42RlpNWWwybGhzRjFGVWFWR01kU2doVVJG?=
 =?utf-8?B?OWVhM0Y0c1dyRFFEb1Q2QmlQT3l4Ly9HTEpJZGovd0l1TVY1Ky9jQm95N2dY?=
 =?utf-8?B?K2kxT2Z3bGN3RXBjU0xNSUhIU1hzNkt0UWo0azE0SVRlMFRHRGFWb2dnSlU5?=
 =?utf-8?B?RkxGUUxiR3l2M0FIM3RhYjUxdXNvbDZLZ0tXNjg3b1RWcS9SMi9EVzB1SzMr?=
 =?utf-8?B?STQ0VGFwUHhleldOWDkyMVVqSTh2TEJ0bURiK2JwMmcwSHgyOEpSVUpuTit6?=
 =?utf-8?B?TitlbHZxVHEzK09UOW5jNEEvRytHZ21DbUsrSFlFRncxM1gzTHdMUEswR2Nu?=
 =?utf-8?B?NTVoQzkzazZkd1c3b25lTVFiSG9wVDM5ZzdTQVJlcEZGTFAyT3ZjQ0VuUmpn?=
 =?utf-8?B?bGVVWXE0eC80WCtOU3B3K2lJVzdrdWFjZGpweUhBNVJFTlBTTVAvMGRxczRG?=
 =?utf-8?B?UCsyaklLM1lobFY0ZHpIdURRMlB1YTcwaDRBenRzV09TbStDdjJvbzRzRGg1?=
 =?utf-8?B?bkJvZlJzaUtrMDcrK0ZZd24rOTk0QXhvWkFRRGlINFlZUjJVWFZvSytsbCts?=
 =?utf-8?B?UHEyMng4OHduSFNSTlZKT0ZPazN2aCtqcnNlSE1tRHVnQUlPUUpMNnhxdnQz?=
 =?utf-8?B?bkcyaUF6Yjl1U04vUVA2N0hEKzQzdm5jUG00cDZJSngyRU9UYXRhUVVCajN0?=
 =?utf-8?B?S2ZYc1BGdjZkSTYrM2hHRHN3MUdDaDl0VFdFYVl5R25udEw3TzdtOHVadnBH?=
 =?utf-8?B?MkdUK1BKTmxCLzVYT2xkVnkzWjZMZmFUd01SQmZNWVpPS0MrWStHV1IwSW1Z?=
 =?utf-8?B?S1kzSFltWTRtVHFnVkdWclpLREZsWkg5UjU1Zmh2bUdmY1ZvNkp4MmtEU0Fj?=
 =?utf-8?B?QjBkUkYzeHRzck1laWFxVzlsZWpUVmZLZHc3cmVXSEJiYTh0ZmQ0aFhvTzhR?=
 =?utf-8?B?NExqVmdaYmluVFRILzdxbkRBR3hLazV6cDRGQlp4SlhqRVBtMHRMNnR3RWxJ?=
 =?utf-8?Q?eBEZa6VRpOx9jZo1ZITnbNZrqyM+8Gc4J9ylFZn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985e5734-cad6-42f7-dd19-08d91f5a38f1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 08:51:02.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sULU7t1hRjmgciKMUOkOiYad5RZuiertf3ZQngIic9zeLeWjADPXXiDQWIg5ypxAIIqj2fsS/6NjlwVlxB7JsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
X-Proofpoint-ORIG-GUID: YB0K4Kc04MoJr3FU-S6hLevPVi9-TsN8
X-Proofpoint-GUID: YB0K4Kc04MoJr3FU-S6hLevPVi9-TsN8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-25_05:2021-05-24,2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250060
Content-Type: multipart/alternative;
 boundary="------------D83C501F4CFB983407C8951A"
Content-Language: en-US

--------------D83C501F4CFB983407C8951A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 14P8jNdC017275


On 5/24/21 10:23 PM, Khem Raj wrote:
> Can you resend this patch ? secondly, I worry that since kea is way
> to go we are adding a package which perhaps is virtually going to be
> dead soon. Is there any work on kea itself providing similar=20
> functionality?


The kea doesn't provide a dhcp relay agent. See:=20
https://lists.isc.org/pipermail/kea-users/2021-April/003040.html

And kea + dhcrelay + dhcpcd can work without problems in my test.


//Yi


>
> On 5/23/21 11:36 PM, Yi Zhao wrote:
>> Ping ...
>>
>>
>> //Yi
>>
>>
>> On 5/17/21 1:53 PM, Yi Zhao wrote:
>>> The current default dhcp server kea in oe-core doesn't provide
>>> dhcp-relay tool. Add a recipe to provide dhcrelay which is from dhcp.
>>> This patch is picked up from dhcp recipe with some tweaks. In order to
>>> fix the build dependency, we use bundled bind instead of external bind=
.
>>>
>>> Signed-off-by: Yi Zhao<yi.zhao@windriver.com>
>>> ---
>>> =C2=A0 .../dhcp/dhcp-relay_4.4.2.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 62=
=
=20
>>> +++++++++++++++++++
>>> =C2=A0 ...0001-Makefile.am-only-build-dhcrelay.patch | 30 +++++++++
>>> =C2=A0 .../dhcp/files/default-relay=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12=
 ++++
>>> =C2=A0 .../dhcp/files/dhcrelay.service=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++
>>> =C2=A0 .../dhcp/files/init-relay=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 44 +++++++++++++
>>> =C2=A0 5 files changed, 158 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
>>> =C2=A0 create mode 100644=20
>>> meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-=
build-dhcrelay.patch
>>> =C2=A0 create mode 100644=20
>>> meta-networking/recipes-connectivity/dhcp/files/default-relay
>>> =C2=A0 create mode 100644=20
>>> meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
>>> =C2=A0 create mode 100644=20
>>> meta-networking/recipes-connectivity/dhcp/files/init-relay
>>>
>>> diff --git=20
>>> a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb=20
>>> b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
>>> new file mode 100644
>>> index 000000000..bd816106c
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
>>> @@ -0,0 +1,62 @@
>>> +SECTION =3D "console/network"
>>> +SUMMARY =3D "Internet Software Consortium DHCP Relay Agent"
>>> +DESCRIPTION =3D "A DHCP relay agent passes DHCP requests from one \
>>> +LAN to another, so that a DHCP server is not needed on every LAN."
>>> +
>>> +HOMEPAGE =3D"http://www.isc.org/"
>>> +
>>> +LICENSE =3D "ISC"
>>> +LIC_FILES_CHKSUM=20
>>> =3D"file://LICENSE;beginline=3D4;md5=3D004a4db50a1e20972e924a8618747c0=
1"
>>> +
>>> +DEPENDS =3D "openssl libcap zlib"
>>> +
>>> +SRC_URI =3D"https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \ +=
=20
>>> file://default-relay \ + file://init-relay \ +=20
>>> file://dhcrelay.service \ +=20
>>> file://0001-Makefile.am-only-build-dhcrelay.patch \ + "
>>> +
>>> +SRC_URI[md5sum] =3D "2afdaf8498dc1edaf3012efdd589b3e1"
>>> +SRC_URI[sha256sum] =3D=20
>>> "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
>>> +
>>> +UPSTREAM_CHECK_URI =3D"http://ftp.isc.org/isc/dhcp/"
>>> +UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+\.\d+\.(\d+?))/"
>>> +
>>> +S =3D "${WORKDIR}/dhcp-${PV}"
>>> +
>>> +inherit autotools-brokensep systemd
>>> +
>>> +SYSTEMD_SERVICE_${PN} =3D "dhcrelay.service"
>>> +SYSTEMD_AUTO_ENABLE_${PN} =3D "disable"
>>> +
>>> +CFLAGS +=3D "-D_GNU_SOURCE -fcommon"
>>> +LDFLAGS_append =3D " -pthread"
>>> +
>>> +EXTRA_OECONF =3D "--enable-paranoia \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 --disable-static \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 --enable-libtool \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 --with-randomdev=3D/dev/random \
>>> +" + +# Enable shared libs per dhcp README +do_configure_prepend ()=20
>>> { + cp configure.ac+lt configure.ac +} + +do_install_append () { +=20
>>> install -d ${D}${sysconfdir}/default + install -m 0644=20
>>> ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay + + if=
=20
>>> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};=
=20
>>> then + install -d ${D}${systemd_unitdir}/system + install -m 0644=20
>>> ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system + sed -i=20
>>> -e 's,@SBINDIR@,${sbindir},g'=20
>>> ${D}${systemd_unitdir}/system/dhcrelay.service + sed -i -e=20
>>> 's,@SYSCONFDIR@,${sysconfdir},g'=20
>>> ${D}${systemd_unitdir}/system/dhcrelay.service + else + install -d=20
>>> ${D}${sysconfdir}/init.d + install -m 0755 ${WORKDIR}/init-relay=20
>>> ${D}${sysconfdir}/init.d/dhcp-relay + fi +} + +PARALLEL_MAKE =3D ""
>>> diff --git=20
>>> a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-onl=
y-build-dhcrelay.patch=20
>>> b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-onl=
y-build-dhcrelay.patch=20
>>>
>>> new file mode 100644
>>> index 000000000..fed85d2a8
>>> --- /dev/null
>>> +++=20
>>> b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-onl=
y-build-dhcrelay.patch
>>> @@ -0,0 +1,30 @@
>>> +From 17cc080e58894644dd18664ac6f3451096d5f065 Mon Sep 17 00:00:00 200=
1
>>> +From: Yi Zhao<yi.zhao@windriver.com>
>>> +Date: Thu, 13 May 2021 15:23:16 +0800
>>> +Subject: [PATCH] Makefile.am: only build dhcrelay
>>> +
>>> +Drop client and server build as we don't need them.
>>> +
>>> +Upstream-Status: Inappropriate [embedded specific]
>>> +
>>> +Signed-off-by: Yi Zhao<yi.zhao@windriver.com>
>>> +---
>>> + Makefile.am | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/Makefile.am b/Makefile.am
>>> +index ed692a5..34f9772 100644
>>> +--- a/Makefile.am
>>> ++++ b/Makefile.am
>>> +@@ -38,7 +38,7 @@ endif
>>> +
>>> + # Use an autoconf substitution vs an automake conditional here
>>> + # to fool automake when the bind directory does not exist.
>>> +-SUBDIRS =3D @BINDSUBDIR@ includes tests common omapip client dhcpctl=
=
=20
>>> relay server
>>> ++SUBDIRS =3D @BINDSUBDIR@ includes common omapip relay
>>> +
>>> + DIST_SUBDIRS =3D $(SUBDIRS) keama
>>> +
>>> +--
>>> +2.17.1
>>> +
>>> diff --git=20
>>> a/meta-networking/recipes-connectivity/dhcp/files/default-relay=20
>>> b/meta-networking/recipes-connectivity/dhcp/files/default-relay
>>> new file mode 100644
>>> index 000000000..7961f014b
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-connectivity/dhcp/files/default-relay
>>> @@ -0,0 +1,12 @@
>>> +# Defaults for dhcp-relay initscript
>>> +# sourced by /etc/init.d/dhcp-relay
>>> +
>>> +# What servers should the DHCP relay forward requests to?
>>> +# e.g: SERVERS=3D"192.168.0.1"
>>> +SERVERS=3D""
>>> +
>>> +# On what interfaces should the DHCP relay (dhrelay) serve DHCP=20
>>> requests?
>>> +INTERFACES=3D""
>>> +
>>> +# Additional options that are passed to the DHCP relay daemon?
>>> +OPTIONS=3D""
>>> diff --git=20
>>> a/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service=20
>>> b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
>>> new file mode 100644
>>> index 000000000..15ff927d3
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
>>> @@ -0,0 +1,10 @@
>>> +[Unit]
>>> +Description=3DDHCP Relay Agent Daemon
>>> +After=3Dnetwork.target
>>> +
>>> +[Service]
>>> +EnvironmentFile=3D@SYSCONFDIR@/default/dhcp-relay
>>> +ExecStart=3D@SBINDIR@/dhcrelay -d --no-pid -q $SERVERS
>>> +
>>> +[Install]
>>> +WantedBy=3Dmulti-user.target
>>> diff --git=20
>>> a/meta-networking/recipes-connectivity/dhcp/files/init-relay=20
>>> b/meta-networking/recipes-connectivity/dhcp/files/init-relay
>>> new file mode 100644
>>> index 000000000..019a7e84c
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-connectivity/dhcp/files/init-relay
>>> @@ -0,0 +1,44 @@
>>> +#!/bin/sh
>>> +#
>>> +# $Id: dhcp3-relay,v 1.1 2004/04/16 15:41:08 ml Exp $
>>> +#
>>> +
>>> +# It is not safe to start if we don't have a default configuration...
>>> +if [ ! -f /etc/default/dhcp-relay ]; then
>>> +=C2=A0=C2=A0=C2=A0 echo "/etc/default/dhcp-relay does not exist! - Ab=
orting..."
>>> +=C2=A0=C2=A0=C2=A0 echo "create this file to fix the problem."
>>> +=C2=A0=C2=A0=C2=A0 exit 1
>>> +fi
>>> +
>>> +# Read init script configuration (interfaces the daemon should=20
>>> listen on
>>> +# and the DHCP server we should forward requests to.)
>>> +. /etc/default/dhcp-relay
>>> +
>>> +# Build command line for interfaces (will be passed to dhrelay below.=
)
>>> +IFCMD=3D""
>>> +if test "$INTERFACES" !=3D ""; then
>>> +=C2=A0=C2=A0=C2=A0 for I in $INTERFACES; do
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IFCMD=3D${IFCMD}"-i "${I}"=
 "
>>> +=C2=A0=C2=A0=C2=A0 done
>>> +fi
>>> +
>>> +DHCRELAYPID=3D/var/run/dhcrelay.pid
>>> +
>>> +case "$1" in
>>> +=C2=A0=C2=A0=C2=A0 start)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start-stop-daemon -S -x /u=
sr/sbin/dhcrelay -- -q $OPTIONS=20
>>> $IFCMD $SERVERS
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>>> +=C2=A0=C2=A0=C2=A0 stop)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start-stop-daemon -K -x /u=
sr/sbin/dhcrelay
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>>> +=C2=A0=C2=A0=C2=A0 restart | force-reload)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $0 stop
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sleep 2
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $0 start
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>>> +=C2=A0=C2=A0=C2=A0 *)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "Usage: /etc/init.d/d=
hcp-relay=20
>>> {start|stop|restart|force-reload}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 1
>>> +esac
>>> +
>>> +exit 0
>>>
>>
>>
>>
>>
>
>=20
>

--------------D83C501F4CFB983407C8951A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/24/21 10:23 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:f8d57238-0030-f053-fed2-47aa916bb682@gmail.com">Can you
      resend this patch ? secondly, I worry that since kea is way
      <br>
      to go we are adding a package which perhaps is virtually going to
      be
      <br>
      dead soon. Is there any work on kea itself providing similar
      functionality?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>The kea doesn't provide a dhcp relay agent. See:
      <a class="moz-txt-link-freetext" href="https://lists.isc.org/pipermail/kea-users/2021-April/003040.html">https://lists.isc.org/pipermail/kea-users/2021-April/003040.html</a></p>
    <p>And kea + dhcrelay + dhcpcd can work without problems in my test.</p>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:f8d57238-0030-f053-fed2-47aa916bb682@gmail.com">
      <br>
      On 5/23/21 11:36 PM, Yi Zhao wrote:
      <br>
      <blockquote type="cite">Ping ...
        <br>
        <br>
        <br>
        //Yi
        <br>
        <br>
        <br>
        On 5/17/21 1:53 PM, Yi Zhao wrote:
        <br>
        <blockquote type="cite">The current default dhcp server kea in
          oe-core doesn't provide
          <br>
          dhcp-relay tool. Add a recipe to provide dhcrelay which is
          from dhcp.
          <br>
          This patch is picked up from dhcp recipe with some tweaks. In
          order to
          <br>
          fix the build dependency, we use bundled bind instead of
          external bind.
          <br>
          <br>
          Signed-off-by: Yi Zhao<a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; .../dhcp/dhcp-relay_4.4.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 62
          +++++++++++++++++++
          <br>
          &nbsp; ...0001-Makefile.am-only-build-dhcrelay.patch | 30 +++++++++
          <br>
          &nbsp; .../dhcp/files/default-relay&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 12 ++++
          <br>
          &nbsp; .../dhcp/files/dhcrelay.service&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10 +++
          <br>
          &nbsp; .../dhcp/files/init-relay&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 44
          +++++++++++++
          <br>
          &nbsp; 5 files changed, 158 insertions(+)
          <br>
          &nbsp; create mode 100644
          meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
          <br>
          &nbsp; create mode 100644
meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch<br>
          &nbsp; create mode 100644
          meta-networking/recipes-connectivity/dhcp/files/default-relay
          <br>
          &nbsp; create mode 100644
          meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
          <br>
          &nbsp; create mode 100644
          meta-networking/recipes-connectivity/dhcp/files/init-relay
          <br>
          <br>
          diff --git
          a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
          <br>
          new file mode 100644
          <br>
          index 000000000..bd816106c
          <br>
          --- /dev/null
          <br>
          +++
          b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
          <br>
          @@ -0,0 +1,62 @@
          <br>
          +SECTION = &quot;console/network&quot;
          <br>
          +SUMMARY = &quot;Internet Software Consortium DHCP Relay Agent&quot;
          <br>
          +DESCRIPTION = &quot;A DHCP relay agent passes DHCP requests from
          one \
          <br>
          +LAN to another, so that a DHCP server is not needed on every
          LAN.&quot;
          <br>
          +
          <br>
          +HOMEPAGE =<a class="moz-txt-link-rfc2396E" href="http://www.isc.org/">&quot;http://www.isc.org/&quot;</a>
          <br>
          +
          <br>
          +LICENSE = &quot;ISC&quot;
          <br>
          +LIC_FILES_CHKSUM
          =<a class="moz-txt-link-rfc2396E" href="file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01">&quot;file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01&quot;</a>
          <br>
          +
          <br>
          +DEPENDS = &quot;openssl libcap zlib&quot;
          <br>
          +
          <br>
          +SRC_URI
          =<a class="moz-txt-link-rfc2396E" href="https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz\+file://default-relay\+file://init-relay\+file://dhcrelay.service\+file://0001-Makefile.am-only-build-dhcrelay.patch\+">&quot;https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \ +
          file://default-relay \ + file://init-relay \ +
          file://dhcrelay.service \ +
          file://0001-Makefile.am-only-build-dhcrelay.patch \ + &quot;</a>
          <br>
          +
          <br>
          +SRC_URI[md5sum] = &quot;2afdaf8498dc1edaf3012efdd589b3e1&quot;
          <br>
          +SRC_URI[sha256sum] =
          &quot;1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521&quot;
          <br>
          +
          <br>
          +UPSTREAM_CHECK_URI =<a class="moz-txt-link-rfc2396E" href="http://ftp.isc.org/isc/dhcp/">&quot;http://ftp.isc.org/isc/dhcp/&quot;</a>
          <br>
          +UPSTREAM_CHECK_REGEX = &quot;(?P&lt;pver&gt;\d+\.\d+\.(\d+?))/&quot;
          <br>
          +
          <br>
          +S = &quot;${WORKDIR}/dhcp-${PV}&quot;
          <br>
          +
          <br>
          +inherit autotools-brokensep systemd
          <br>
          +
          <br>
          +SYSTEMD_SERVICE_${PN} = &quot;dhcrelay.service&quot;
          <br>
          +SYSTEMD_AUTO_ENABLE_${PN} = &quot;disable&quot;
          <br>
          +
          <br>
          +CFLAGS += &quot;-D_GNU_SOURCE -fcommon&quot;
          <br>
          +LDFLAGS_append = &quot; -pthread&quot;
          <br>
          +
          <br>
          +EXTRA_OECONF = &quot;--enable-paranoia \
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-static \
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --enable-libtool \
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --with-randomdev=/dev/random \
          <br>
          +&quot; + +# Enable shared libs per dhcp README
          +do_configure_prepend () { + cp configure.ac+lt configure.ac
          +} + +do_install_append () { + install -d
          ${D}${sysconfdir}/default + install -m 0644
          ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
          + + if
          ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};
          then + install -d ${D}${systemd_unitdir}/system + install -m
          0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
          + sed -i -e 's,@SBINDIR@,${sbindir},g'
          ${D}${systemd_unitdir}/system/dhcrelay.service + sed -i -e
          's,@SYSCONFDIR@,${sysconfdir},g'
          ${D}${systemd_unitdir}/system/dhcrelay.service + else +
          install -d ${D}${sysconfdir}/init.d + install -m 0755
          ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay + fi
          +} + +PARALLEL_MAKE = &quot;&quot;
          <br>
          diff --git
a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
          <br>
          new file mode 100644
          <br>
          index 000000000..fed85d2a8
          <br>
          --- /dev/null
          <br>
          +++
b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch<br>
          @@ -0,0 +1,30 @@
          <br>
          +From 17cc080e58894644dd18664ac6f3451096d5f065 Mon Sep 17
          00:00:00 2001
          <br>
          +From: Yi Zhao<a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
          <br>
          +Date: Thu, 13 May 2021 15:23:16 +0800
          <br>
          +Subject: [PATCH] Makefile.am: only build dhcrelay
          <br>
          +
          <br>
          +Drop client and server build as we don't need them.
          <br>
          +
          <br>
          +Upstream-Status: Inappropriate [embedded specific]
          <br>
          +
          <br>
          +Signed-off-by: Yi Zhao<a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
          <br>
          +---
          <br>
          + Makefile.am | 2 +-
          <br>
          + 1 file changed, 1 insertion(+), 1 deletion(-)
          <br>
          +
          <br>
          +diff --git a/Makefile.am b/Makefile.am
          <br>
          +index ed692a5..34f9772 100644
          <br>
          +--- a/Makefile.am
          <br>
          ++++ b/Makefile.am
          <br>
          +@@ -38,7 +38,7 @@ endif
          <br>
          +
          <br>
          + # Use an autoconf substitution vs an automake conditional
          here
          <br>
          + # to fool automake when the bind directory does not exist.
          <br>
          +-SUBDIRS = @BINDSUBDIR@ includes tests common omapip client
          dhcpctl relay server
          <br>
          ++SUBDIRS = @BINDSUBDIR@ includes common omapip relay
          <br>
          +
          <br>
          + DIST_SUBDIRS = $(SUBDIRS) keama
          <br>
          +
          <br>
          +--
          <br>
          +2.17.1
          <br>
          +
          <br>
          diff --git
          a/meta-networking/recipes-connectivity/dhcp/files/default-relay
b/meta-networking/recipes-connectivity/dhcp/files/default-relay
          <br>
          new file mode 100644
          <br>
          index 000000000..7961f014b
          <br>
          --- /dev/null
          <br>
          +++
          b/meta-networking/recipes-connectivity/dhcp/files/default-relay
          <br>
          @@ -0,0 +1,12 @@
          <br>
          +# Defaults for dhcp-relay initscript
          <br>
          +# sourced by /etc/init.d/dhcp-relay
          <br>
          +
          <br>
          +# What servers should the DHCP relay forward requests to?
          <br>
          +# e.g: SERVERS=&quot;192.168.0.1&quot;
          <br>
          +SERVERS=&quot;&quot;
          <br>
          +
          <br>
          +# On what interfaces should the DHCP relay (dhrelay) serve
          DHCP requests?
          <br>
          +INTERFACES=&quot;&quot;
          <br>
          +
          <br>
          +# Additional options that are passed to the DHCP relay
          daemon?
          <br>
          +OPTIONS=&quot;&quot;
          <br>
          diff --git
          a/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
          <br>
          new file mode 100644
          <br>
          index 000000000..15ff927d3
          <br>
          --- /dev/null
          <br>
          +++
          b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
          <br>
          @@ -0,0 +1,10 @@
          <br>
          +[Unit]
          <br>
          +Description=DHCP Relay Agent Daemon
          <br>
          +After=network.target
          <br>
          +
          <br>
          +[Service]
          <br>
          +EnvironmentFile=@SYSCONFDIR@/default/dhcp-relay
          <br>
          +ExecStart=@SBINDIR@/dhcrelay -d --no-pid -q $SERVERS
          <br>
          +
          <br>
          +[Install]
          <br>
          +WantedBy=multi-user.target
          <br>
          diff --git
          a/meta-networking/recipes-connectivity/dhcp/files/init-relay
          b/meta-networking/recipes-connectivity/dhcp/files/init-relay
          <br>
          new file mode 100644
          <br>
          index 000000000..019a7e84c
          <br>
          --- /dev/null
          <br>
          +++
          b/meta-networking/recipes-connectivity/dhcp/files/init-relay
          <br>
          @@ -0,0 +1,44 @@
          <br>
          +#!/bin/sh
          <br>
          +#
          <br>
          +# $Id: dhcp3-relay,v 1.1 2004/04/16 15:41:08 ml Exp $
          <br>
          +#
          <br>
          +
          <br>
          +# It is not safe to start if we don't have a default
          configuration...
          <br>
          +if [ ! -f /etc/default/dhcp-relay ]; then
          <br>
          +&nbsp;&nbsp;&nbsp; echo &quot;/etc/default/dhcp-relay does not exist! -
          Aborting...&quot;
          <br>
          +&nbsp;&nbsp;&nbsp; echo &quot;create this file to fix the problem.&quot;
          <br>
          +&nbsp;&nbsp;&nbsp; exit 1
          <br>
          +fi
          <br>
          +
          <br>
          +# Read init script configuration (interfaces the daemon
          should listen on
          <br>
          +# and the DHCP server we should forward requests to.)
          <br>
          +. /etc/default/dhcp-relay
          <br>
          +
          <br>
          +# Build command line for interfaces (will be passed to
          dhrelay below.)
          <br>
          +IFCMD=&quot;&quot;
          <br>
          +if test &quot;$INTERFACES&quot; != &quot;&quot;; then
          <br>
          +&nbsp;&nbsp;&nbsp; for I in $INTERFACES; do
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IFCMD=${IFCMD}&quot;-i &quot;${I}&quot; &quot;
          <br>
          +&nbsp;&nbsp;&nbsp; done
          <br>
          +fi
          <br>
          +
          <br>
          +DHCRELAYPID=/var/run/dhcrelay.pid
          <br>
          +
          <br>
          +case &quot;$1&quot; in
          <br>
          +&nbsp;&nbsp;&nbsp; start)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q
          $OPTIONS $IFCMD $SERVERS
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;
          <br>
          +&nbsp;&nbsp;&nbsp; stop)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; start-stop-daemon -K -x /usr/sbin/dhcrelay
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;
          <br>
          +&nbsp;&nbsp;&nbsp; restart | force-reload)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $0 stop
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sleep 2
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $0 start
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;
          <br>
          +&nbsp;&nbsp;&nbsp; *)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;Usage: /etc/init.d/dhcp-relay
          {start|stop|restart|force-reload}&quot;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit 1
          <br>
          +esac
          <br>
          +
          <br>
          +exit 0
          <br>
          <br>
        </blockquote>
        <br>
        <br>
        <br>
        <br>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D83C501F4CFB983407C8951A--
