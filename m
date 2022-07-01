Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E9BC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 04:06:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.34480.1656648391910628733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 21:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ktBYfB6E;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=418120a4d2=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2613hmXV025291
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Jul 2022 04:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=AJQuIp0JVgi/td7C9rNVjXQx/2WBDrcrm16/cfSl+aA=;
 b=ktBYfB6E8hCIEiGmr2/Wp4yDWGF2UZiAvsgM2Klz7JKb/7OAnGn+bKbyqY+4egU6teOp
 y+JKZm2r19tYsu2stmE5c0NC+MIsAImOaguMwKAumr2bOjfltqe+cSxSztkWgN+c2fM8
 VbMi4ktJCwiqbUzWJfHtqJ5ycYUSZ7nBJ1IOx2HZOA4E7/iqwl9Z15YK67IXR/SojD2T
 RwVp+aUMQXjeouWApQrDCN7GOvvbhzlmRCOnS0BzR05bks/4zI9lcJbOY2onZG4aSOOp
 6aRx+BkPIBHVCBYQu/5/bmuB3BWOCPhXQlF5/vJkeHWRylR86lf6LBUwRocLZU0/KApH eg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwsbamnx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:06:30 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26146UYr007155
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Jul 2022 04:06:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwsbamnx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 04:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Htb8CpwnqsLeEtTM+UsXaaMQ0rWsEciHoVYDIwtSTDf3EBORaGFqToOPobHA0Dg+zWGWh0mUfk2kMnsxf9/LI+J3ATLG4LpAgzCAlxrPE7L0EHJNBgQn11IJ0oSbbQZdsqC2pbWTPgqPiO2mQhKRau0yRHg6isd9lLUNAr/uphNhBiBj6ovpRrLQ+ISrSkHSPNk8tGGehZdpigLjBSyvz3NyrN9xFYFzZkdclb6tEoN7mvTObKEw1DChpsmPP3QLd/lUcclQNsQgACVtXELFEJTOEtUs8LXDocApKkPbMJjwDBHq/VQpQthKFK3CGuT8TS9TRdbI8A4KpcL7RgXWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJQuIp0JVgi/td7C9rNVjXQx/2WBDrcrm16/cfSl+aA=;
 b=PjMljz4MYIjyBjZKunmeKHPgLfJCQSWmtOsHZuALnVjz8HIVktcZ0ZDkct2Ic6XwdZxatFwBnVBuPwYLZv15N0MsVL761YDHuosLrP3JlyCovMCRI+n1feWvuMI+qYwnwit0GXQxTNjZgFqj53aylyVKvsFi+ugCUudmP8Y3QHo8HbIYjMAhyZ421RrGEhTinDbC2BM7b79KN/WvA97bjtX2mMgaTZoDyovaT9wieDNcmroWjT7hP9ZuhWb7WFe+HRYDf6luOw96Q47c9enUnAz4zUQv5lIns/YKH7Lv13iJ8nTFjD9XwlK4NsyFoT5j9QGWW+fTBKFT0Gi03a6Vfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5022.namprd11.prod.outlook.com (2603:10b6:a03:2d7::17)
 by SA2PR11MB4795.namprd11.prod.outlook.com (2603:10b6:806:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 1 Jul
 2022 04:06:26 +0000
Received: from SJ0PR11MB5022.namprd11.prod.outlook.com
 ([fe80::e14f:db04:f857:86ab]) by SJ0PR11MB5022.namprd11.prod.outlook.com
 ([fe80::e14f:db04:f857:86ab%9]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 04:06:25 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.8.3
Thread-Topic: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.8.3
Thread-Index: AQHYjHAigtq/GTaA2ESBUMwWG0cwiq1o5nUQ
Date: Fri, 1 Jul 2022 04:06:25 +0000
Message-ID: 
 <SJ0PR11MB5022263AD57F4C24A8FAE2BCF1BD9@SJ0PR11MB5022.namprd11.prod.outlook.com>
References: <20220628093149.3723242-1-mingli.yu@windriver.com>
 <CAMKF1soxrNEMqrLq+Xgt5YKmWrbTUrp+FvaQqTw5wZYQMKRJ5g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soxrNEMqrLq+Xgt5YKmWrbTUrp+FvaQqTw5wZYQMKRJ5g@mail.gmail.com>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65798707-b946-46f7-6643-08da5b17114d
x-ms-traffictypediagnostic: SA2PR11MB4795:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Xii/7zDUz9NZkGx/0RioY9xVRsmI2e8jUaSyqpfDjHLtGdScRG8yEPrdauKnr9pxQPvRcKpSKGKElxwQIqh6MTEiOg5evTYe4MOFRBOPi4EBXrY1zM5PvEwhv1QbWRdnXQNTvNeYeJT2pRRq0IkvbMmDmWhjbCif95OL145VuRmECiDyqJHVQeeXybPyjlzV8cuMwMbUJ0huqrAJ0w14KQD75azcxEJzSo33BBRLyFjPIZZNvKc4V7r94g+G8s+HFJKHrEb+UKP13uStJmyxgU9jA80s2IpBBLQqQ6qwNcP+BQ9xmm4D96oBcthKx1VMH+c3s4Trnh+U6nqoaPv7QkZdJ2KM/CzKU6vfSP5OA8C9TsiFIv0hjoRyAEuJM8N67FTn7xT/+QI6Yv+kYTEa0ga1fx9ccyyLDkcJajfXpLr0dzlJ0TovAdRAAIY3FoEMf21x6odm3pJV7sUvJdGy9jwHT/ugaqifTJDIaRFYAsM9rIQWAMbDuvw+p9fIoe0nj6MWr3QjOHtwFVB1n5WZLS/MvQqlFLmck55orGMJHZSpi+IjIJVKv0Yqa7fVorz7vrH1qQ4A8UZCO9YydPnvdbhTwoCFUjyIZkHnRjBVu8OybNQIcBzvhQHKu+ql9REOGn4kb7jubc0BoLfWkAAn1SWGbrbKgw/K/ylVON/QrZvuHThvCHsS6SXXF65KOkFLsdCJQUdqgaWzSPLGeHarx0bHKK7LBuvQYQi2sdVTt0M2AfIic4OQ9ODZpTgnAl5vlqDdwbcO1arNL7f22PAj4sFOM4bv2Bv+L5WwBXYFANETkONMpHvWrZEqjyMBbZeTZPgVIPeGj/41uwjGcC33cvpzAPYiFii6nprRm/bfMJ/d5MfVbhHQregf5vGZOcrafi4aqrkvMZo6Ox1n/OqM7ujr8pfIv0X2+hV7KI6uDxQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39850400004)(396003)(136003)(346002)(366004)(30864003)(122000001)(316002)(66446008)(53546011)(83380400001)(6506007)(19627405001)(26005)(9686003)(7696005)(6916009)(2906002)(66556008)(18265965005)(41300700001)(8936002)(166002)(76116006)(966005)(33656002)(8676002)(64756008)(66476007)(71200400001)(4326008)(86362001)(55016003)(38100700002)(478600001)(5660300002)(66946007)(52536014)(186003)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ro7BraX+XwIv4INGtoHcxlv89XumA3zjYoy8ZVv4gwMgYKnb5t/KPWUPWQB3?=
 =?us-ascii?Q?2+Q9TfFdh9WngjF8JRg8qaveHiqUjIsWDbKfK4X4o9kemjfsLCXRJlg5SZfs?=
 =?us-ascii?Q?KPiDaO37ZQhZ265EqQAzDlxSrVlnKDd9qG1dJN9b+9lqmJPbXiQKGgxWtpUU?=
 =?us-ascii?Q?SxXdqSPJNnoecR46n0kj/OXZBLJwMN2k/f+OM7oXYpVUr0lMwwPFQjtPWRhm?=
 =?us-ascii?Q?pYIDt3MgbPm0CcBKaATmo81gmYT7lUBAFV7W+elcwa3V0wC4NqsHt8q59V4T?=
 =?us-ascii?Q?boj6VunXTwUezZnCeQcoIiQldlDJT30yUgeRxfLScQQWhAX0APTZRfHaeW8i?=
 =?us-ascii?Q?bEuzX8ZHn0eG+ENkuB+t2B1rkANTJ/hgDApSmUXEF82vw8/9io3gFn+Jp/yH?=
 =?us-ascii?Q?ArZyeVHZLm5vk+uGdGR75ObXPwRdMIymVxlgatxxYb78vGDOWKCctKycr2hd?=
 =?us-ascii?Q?4Tfm45G5bMZmPvpBd84bnCmf9yQO96xxe6ZDmMhHwfPhmCeGYVKrxlNPxXmB?=
 =?us-ascii?Q?iFBzBcqvL/uQu34X6U7Cmf+YXtXCNBAdpO3WG0f1v8DEE77C9iCayrTI/71t?=
 =?us-ascii?Q?oaQhpqXhuE4KerySWtt5qFE+IcByGgCU2sAsDkI0gsM5x5A/fP+g4ipLNmdl?=
 =?us-ascii?Q?/mLyg7MAhtfN3ETILkGV/XOkaKfebWjshAvmMfUlGhVbXhdDgyaaO8jkOJsq?=
 =?us-ascii?Q?DMl05VU6hwf3j3rhrogrzDOZkopMmGuxqIAiDETiP6PDbim7Qx1MHGwUeddo?=
 =?us-ascii?Q?JQ7YG1GGWMsKvNxjcms+I0vdbiR/jIiiLSPQFYVaMgWqxumuD78ZZy33sHc2?=
 =?us-ascii?Q?G2WZBaA8Q2qQyb2/V3ODXBamSBLoWPsDjcwlLhMgOZB3gFQ3o1lOf/v8BZkT?=
 =?us-ascii?Q?6Dcs12HMdOSYVfHmld9VW9joBzlCSGVN8D9bkw4hqgMfGj/CcldySCku7gnG?=
 =?us-ascii?Q?2YRlJ21d/N4DtUgD/AXGMkCzdGg94RXE27gqg0od+FqQs/P7dcKHLYexpK83?=
 =?us-ascii?Q?sCz5ET38GlTrNBOy9XI5x4rCUcHQ+bseXT/RURPXRFCaEwYc/z7tBER2HMzX?=
 =?us-ascii?Q?Vp1swN3htImJ85ZBkUTyFw3cTYCSgFOKuSNgusy52szH7VXR71HoRm4mhLu2?=
 =?us-ascii?Q?Gs/Nx7ALQuJLBg/UlNPuSueS53lN3gW26u8s4/56kEZBVtdseiFQ7QA58HMv?=
 =?us-ascii?Q?NnNW0DciinecExj1D5K9GEw50lbHIw5kGxLDyr+L2KgVQmwC9RVMQdq+nJe0?=
 =?us-ascii?Q?GCODNiqbE65POPKq3iVRZbKv0+wEHdXl+X9scFPOpktpl7uJ36iFvi93sEWK?=
 =?us-ascii?Q?hisHb/VEkSq2mKP3hks/0qLVrJ1MXgWs+CKnggZpRC+PLaJJZIkcSRzxKSPH?=
 =?us-ascii?Q?GNqFHPxXlk8CK8ULChdXosgo4Aj3OoyuDQu8CE21aj6uNYkEQ4qnYlMrRPmJ?=
 =?us-ascii?Q?eve2/Bf4chJEFtjNopsTkAYXcLZgCW00OJov0reperswhLi+xG8XO/IMEWNZ?=
 =?us-ascii?Q?wZu1McTJkJZV02zB6oLp30+8q9sPOtNyuEcPqVvDFYUedCBuSkoLnrJmPHhN?=
 =?us-ascii?Q?WQVZOKNvTm1HK1UkPcjdkYpllrpRORNb1CifjUHb?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB5022263AD57F4C24A8FAE2BCF1BD9SJ0PR11MB5022namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 65798707-b946-46f7-6643-08da5b17114d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 04:06:25.8381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 wvXBbO9c1i8rDIGEE3VbEKlhOPy311GHpW7mPpcMydz/LyVzfToz8g/s+DYQrJI09zmlKJ7E4uczznvMbAmQ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4795
X-Proofpoint-ORIG-GUID: jgLccT7f8kpHOITpyzZ_88kcs2Qr5wt1
X-Proofpoint-GUID: pjMCeB8-wcUD4sRxbA6SQo4mbCK6bTtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_02,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 04:06:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97650

--_000_SJ0PR11MB5022263AD57F4C24A8FAE2BCF1BD9SJ0PR11MB5022namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Seems the zstd lib not recognized with clang through the log you pasted.
TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/mariadb/10.8.3-r=
0/recipe-sysroot-native/usr/lib/libzstd.so: file not recognized: file forma=
t not recognized
clang-14: error: linker command failed with exit code 1 (use -v to see invo=
cation)

I will look into this further.

Thanks,

________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Thursday, June 30, 2022 18:56
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.8.3

[Please note: This e-mail is from an EXTERNAL e-mail address]

this fails to build where its not finding right zlib see

https://errors.yoctoproject.org/Errors/Details/659134/
https://errors.yoctoproject.org/Errors/Details/659124/

On Tue, Jun 28, 2022 at 5:31 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Remove the backported patch mariadb-openssl3.patch as the logic
> is included in the new version.
>
> Add libzstd to RDEPENDS to fix below qa issue:
>  mariadb-10.8.3-r0 do_package_qa: QA Issue: /usr/lib64/plugin/zstd.so con=
tained in package mariadb-server requires libzstd.so.1()(64bit), but no pro=
viders found in RDEPENDS:mariadb-server? [file-rdeps]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...ive_10.7.4.bb =3D> mariadb-native_10.8.3.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  12 +-
>  .../mysql/mariadb/mariadb-openssl3.patch      | 416 ------------------
>  .../{mariadb_10.7.4.bb =3D> mariadb_10.8.3.bb}  |   0
>  4 files changed, 9 insertions(+), 419 deletions(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.4.bb =3D> mariadb-=
native_10.8.3.bb} (100%)
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.pa=
tch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.4.bb =3D> mariadb_10.8.3.=
bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb b/meta-oe=
/recipes-dbs/mysql/mariadb-native_10.8.3.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 922373b63..4c072dbf7 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -19,11 +19,10 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source=
/${BP}.tar.gz \
>             file://ssize_t.patch \
>             file://mm_malloc.patch \
>             file://sys_futex.patch \
> -           file://mariadb-openssl3.patch \
>            "
>  SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
>
> -SRC_URI[sha256sum] =3D "73dd9c9d325520f20ca5e0ef16f94b7be1146bed7e4a78e7=
35c20daebf3a4173"
> +SRC_URI[sha256sum] =3D "887eadc55176ac1ead1fccfc89ade4b5990ef192745ad4dc=
d879acb41c050892"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
>
> @@ -176,6 +175,13 @@ do_install() {
>      if [ -f ${D}${datadir}/doc/README ]; then
>          mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
>      fi
> +
> +    # mini-benchmark used for Gitlab-CI to run on every commit to catch
> +    # if there are severe performance regressions.
> +    # remove it to avoid introducing bash dependency
> +    if [ -f ${D}${datadir}/mysql/mini-benchmark ]; then
> +        rm -rf ${D}${datadir}/mysql/mini-benchmark
> +    fi
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d=
)}; then
>          pam_so=3D$(find ${D} -name pam_user_map.so)
>          if [ x"${pam_so}" !=3D x ]; then
> @@ -206,7 +212,7 @@ RDEPENDS:${PN}-client =3D "perl perl-module-getopt-lo=
ng perl-module-file-temp \
>  RDEPENDS:${PN}-server =3D "perl perl-module-getopt-long perl-module-data=
-dumper \
>      perl-module-file-basename perl-module-file-path perl-module-sys-host=
name \
>      perl-module-file-copy perl-module-file-temp perl-module-posix \
> -    ${PN}-client ${PN}-setupdb libdbi-perl libdbd-mysql-perl lzo"
> +    ${PN}-client ${PN}-setupdb libdbi-perl libdbd-mysql-perl lzo libzstd=
"
>  RDEPENDS:${PN}-leftovers =3D "perl perl-module-cwd perl-module-benchmark=
 perl-module-getopt-long \
>      perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-m=
odule-threads \
>      perl-module-threads-shared perl-module-io-socket perl-module-sys-hos=
tname perl-module-file-copy \
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch b/m=
eta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
> deleted file mode 100644
> index 878675f30..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
> +++ /dev/null
> @@ -1,416 +0,0 @@
> -From 1626955f3a2107ec4c7fd927ebfa3c6c1d2b09b8 Mon Sep 17 00:00:00 2001
> -From: Vladislav Vaintroub <wlad@mariadb.com>
> -Date: Mon, 8 Nov 2021 18:48:19 +0100
> -Subject: [PATCH] MDEV-25785 Add support for OpenSSL 3.0
> -
> -Summary of changes
> -
> -- MD_CTX_SIZE is increased
> -
> -- EVP_CIPHER_CTX_buf_noconst(ctx) does not work anymore, points
> -  to nobody knows where. The assumption made previously was that
> -  (since the function does not seem to be documented)
> -  was that it points to the last partial source block.
> -  Add own partial block buffer for NOPAD encryption instead
> -
> -- SECLEVEL in CipherString in openssl.cnf
> -  had been downgraded to 0, from 1, to make TLSv1.0 and TLSv1.1 possible
> -
> -- Workaround Ssl_cipher_list issue, it now returns TLSv1.3 ciphers,
> -  in addition to what was set in --ssl-cipher
> -
> -- ctx_buf buffer now must be aligned to 16 bytes with openssl(
> -  previously with WolfSSL only), ot crashes will happen
> -
> -- updated aes-t , to be better debuggable
> -  using function, rather than a huge multiline macro
> -  added test that does "nopad" encryption piece-wise, to test
> -  replacement of EVP_CIPHER_CTX_buf_noconst
> -
> -Patch from Fedora https://src.fedoraproject.org/rpms/mariadb/raw/rawhide=
/f/mariadb-openssl3.patch
> -
> -Upstream-Status: Backport [https://github.com/MariaDB/server/commit/d42c=
2efbaa06a0307c2f0fd8fa87819ff50bbd7e]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - cmake/ssl.cmake                   |  21 +++++-
> - include/mysql/service_my_crypt.h  |   2 +-
> - include/ssl_compat.h              |   3 +-
> - mysql-test/lib/openssl.cnf        |   2 +-
> - mysql-test/main/ssl_cipher.result |   6 +-
> - mysql-test/main/ssl_cipher.test   |   2 +-
> - mysys_ssl/my_crypt.cc             |  46 +++++++-----
> - unittest/mysys/aes-t.c            | 121 ++++++++++++++++++++++--------
> - 8 files changed, 143 insertions(+), 60 deletions(-)
> -
> -diff --git a/cmake/ssl.cmake b/cmake/ssl.cmake
> -index a6793cf3..64c93ff9 100644
> ---- a/cmake/ssl.cmake
> -+++ b/cmake/ssl.cmake
> -@@ -118,7 +118,7 @@ MACRO (MYSQL_CHECK_SSL)
> -     ENDIF()
> -     FIND_PACKAGE(OpenSSL)
> -     SET_PACKAGE_PROPERTIES(OpenSSL PROPERTIES TYPE RECOMMENDED)
> --    IF(OPENSSL_FOUND AND OPENSSL_VERSION AND OPENSSL_VERSION VERSION_LE=
SS "3.0.0")
> -+    IF(OPENSSL_FOUND)
> -       SET(OPENSSL_LIBRARY ${OPENSSL_SSL_LIBRARY})
> -       INCLUDE(CheckSymbolExists)
> -       SET(SSL_SOURCES "")
> -@@ -139,9 +139,20 @@ MACRO (MYSQL_CHECK_SSL)
> -       SET(SSL_INTERNAL_INCLUDE_DIRS "")
> -       SET(SSL_DEFINES "-DHAVE_OPENSSL")
> -
> -+      FOREACH(x INCLUDES LIBRARIES DEFINITIONS)
> -+        SET(SAVE_CMAKE_REQUIRED_${x} ${CMAKE_REQUIRED_${x}})
> -+      ENDFOREACH()
> -+
> -+      # Silence "deprecated in OpenSSL 3.0"
> -+      IF((NOT OPENSSL_VERSION) # 3.0 not determined by older cmake
> -+         OR NOT(OPENSSL_VERSION VERSION_LESS "3.0.0"))
> -+        SET(SSL_DEFINES "${SSL_DEFINES} -DOPENSSL_API_COMPAT=3D0x101000=
00L")
> -+        SET(CMAKE_REQUIRED_DEFINITIONS -DOPENSSL_API_COMPAT=3D0x1010000=
0L)
> -+      ENDIF()
> -+
> -       SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
> -       SET(CMAKE_REQUIRED_LIBRARIES ${SSL_LIBRARIES})
> --      SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
> -+
> -       CHECK_SYMBOL_EXISTS(ERR_remove_thread_state "openssl/err.h"
> -                           HAVE_ERR_remove_thread_state)
> -       CHECK_SYMBOL_EXISTS(EVP_aes_128_ctr "openssl/evp.h"
> -@@ -150,8 +161,10 @@ MACRO (MYSQL_CHECK_SSL)
> -                           HAVE_EncryptAes128Gcm)
> -       CHECK_SYMBOL_EXISTS(X509_check_host "openssl/x509v3.h"
> -                           HAVE_X509_check_host)
> --      SET(CMAKE_REQUIRED_INCLUDES)
> --      SET(CMAKE_REQUIRED_LIBRARIES)
> -+
> -+      FOREACH(x INCLUDES LIBRARIES DEFINITIONS)
> -+        SET(CMAKE_REQUIRED_${x} ${SAVE_CMAKE_REQUIRED_${x}})
> -+      ENDFOREACH()
> -     ELSE()
> -       IF(WITH_SSL STREQUAL "system")
> -         MESSAGE(FATAL_ERROR "Cannot find appropriate system libraries f=
or SSL. Use WITH_SSL=3Dbundled to enable SSL support")
> -diff --git a/include/mysql/service_my_crypt.h b/include/mysql/service_my=
_crypt.h
> -index 2a232117..bb038aaa 100644
> ---- a/include/mysql/service_my_crypt.h
> -+++ b/include/mysql/service_my_crypt.h
> -@@ -45,7 +45,7 @@ extern "C" {
> - /* The max key length of all supported algorithms */
> - #define MY_AES_MAX_KEY_LENGTH 32
> -
> --#define MY_AES_CTX_SIZE 656
> -+#define MY_AES_CTX_SIZE 672
> -
> - enum my_aes_mode {
> -     MY_AES_ECB, MY_AES_CBC
> -diff --git a/include/ssl_compat.h b/include/ssl_compat.h
> -index 8dc12254..6db1baab 100644
> ---- a/include/ssl_compat.h
> -+++ b/include/ssl_compat.h
> -@@ -24,7 +24,7 @@
> - #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)
> - #define ERR_remove_state(X) ERR_clear_error()
> - #define EVP_CIPHER_CTX_SIZE 176
> --#define EVP_MD_CTX_SIZE 48
> -+#define EVP_MD_CTX_SIZE 72
> - #undef EVP_MD_CTX_init
> - #define EVP_MD_CTX_init(X) do { memset((X), 0, EVP_MD_CTX_SIZE); EVP_MD=
_CTX_reset(X); } while(0)
> - #undef EVP_CIPHER_CTX_init
> -@@ -77,7 +77,6 @@
> - #define DH_set0_pqg(D,P,Q,G)            ((D)->p=3D (P), (D)->g=3D (G))
> - #endif
> -
> --#define EVP_CIPHER_CTX_buf_noconst(ctx) ((ctx)->buf)
> - #define EVP_CIPHER_CTX_encrypting(ctx)  ((ctx)->encrypt)
> - #define EVP_CIPHER_CTX_SIZE             sizeof(EVP_CIPHER_CTX)
> -
> -diff --git a/mysql-test/lib/openssl.cnf b/mysql-test/lib/openssl.cnf
> -index b9ab37ac..7cd6f748 100644
> ---- a/mysql-test/lib/openssl.cnf
> -+++ b/mysql-test/lib/openssl.cnf
> -@@ -9,4 +9,4 @@ ssl_conf =3D ssl_section
> - system_default =3D system_default_section
> -
> - [system_default_section]
> --CipherString =3D ALL:@SECLEVEL=3D1
> -+CipherString =3D ALL:@SECLEVEL=3D0
> -diff --git a/mysql-test/main/ssl_cipher.result b/mysql-test/main/ssl_cip=
her.result
> -index 930d384e..66d817b7 100644
> ---- a/mysql-test/main/ssl_cipher.result
> -+++ b/mysql-test/main/ssl_cipher.result
> -@@ -61,8 +61,8 @@ connect  ssl_con,localhost,root,,,,,SSL;
> - SHOW STATUS LIKE 'Ssl_cipher';
> - Variable_name Value
> - Ssl_cipher    AES128-SHA
> --SHOW STATUS LIKE 'Ssl_cipher_list';
> --Variable_name Value
> --Ssl_cipher_list       AES128-SHA
> -+SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSI=
ON_STATUS WHERE VARIABLE_NAME=3D'Ssl_cipher_list';
> -+VARIABLE_VALUE like '%AES128-SHA%'
> -+1
> - disconnect ssl_con;
> - connection default;
> -diff --git a/mysql-test/main/ssl_cipher.test b/mysql-test/main/ssl_ciphe=
r.test
> -index 36549d76..d4cdcffb 100644
> ---- a/mysql-test/main/ssl_cipher.test
> -+++ b/mysql-test/main/ssl_cipher.test
> -@@ -98,6 +98,6 @@ let $restart_parameters=3D--ssl-cipher=3DAES128-SHA;
> - source include/restart_mysqld.inc;
> - connect (ssl_con,localhost,root,,,,,SSL);
> - SHOW STATUS LIKE 'Ssl_cipher';
> --SHOW STATUS LIKE 'Ssl_cipher_list';
> -+SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSI=
ON_STATUS WHERE VARIABLE_NAME=3D'Ssl_cipher_list';
> - disconnect ssl_con;
> - connection default;
> -diff --git a/mysys_ssl/my_crypt.cc b/mysys_ssl/my_crypt.cc
> -index e512eee9..4d7ebc7b 100644
> ---- a/mysys_ssl/my_crypt.cc
> -+++ b/mysys_ssl/my_crypt.cc
> -@@ -29,11 +29,7 @@
> - #include <ssl_compat.h>
> - #include <cstdint>
> -
> --#ifdef HAVE_WOLFSSL
> - #define CTX_ALIGN 16
> --#else
> --#define CTX_ALIGN 0
> --#endif
> -
> - class MyCTX
> - {
> -@@ -100,8 +96,9 @@ class MyCTX_nopad : public MyCTX
> - {
> - public:
> -   const uchar *key;
> --  uint klen, buf_len;
> -+  uint klen, source_tail_len;
> -   uchar oiv[MY_AES_BLOCK_SIZE];
> -+  uchar source_tail[MY_AES_BLOCK_SIZE];
> -
> -   MyCTX_nopad() : MyCTX() { }
> -   ~MyCTX_nopad() { }
> -@@ -112,7 +109,7 @@ class MyCTX_nopad : public MyCTX
> -     compile_time_assert(MY_AES_CTX_SIZE >=3D sizeof(MyCTX_nopad));
> -     this->key=3D key;
> -     this->klen=3D klen;
> --    this->buf_len=3D 0;
> -+    this->source_tail_len=3D 0;
> -     if (ivlen)
> -       memcpy(oiv, iv, ivlen);
> -     DBUG_ASSERT(ivlen =3D=3D 0 || ivlen =3D=3D sizeof(oiv));
> -@@ -123,26 +120,41 @@ class MyCTX_nopad : public MyCTX
> -     return res;
> -   }
> -
> -+  /** Update last partial source block, stored in source_tail array. */
> -+  void update_source_tail(const uchar* src, uint slen)
> -+  {
> -+    if (!slen)
> -+      return;
> -+    uint new_tail_len=3D (source_tail_len + slen) % MY_AES_BLOCK_SIZE;
> -+    if (new_tail_len)
> -+    {
> -+      if (slen + source_tail_len < MY_AES_BLOCK_SIZE)
> -+      {
> -+        memcpy(source_tail + source_tail_len, src, slen);
> -+      }
> -+      else
> -+      {
> -+        DBUG_ASSERT(slen > new_tail_len);
> -+        memcpy(source_tail, src + slen - new_tail_len, new_tail_len);
> -+      }
> -+    }
> -+    source_tail_len=3D new_tail_len;
> -+  }
> -+
> -   int update(const uchar *src, uint slen, uchar *dst, uint *dlen)
> -   {
> --    buf_len+=3D slen;
> -+    update_source_tail(src, slen);
> -     return MyCTX::update(src, slen, dst, dlen);
> -   }
> -
> -   int finish(uchar *dst, uint *dlen)
> -   {
> --    buf_len %=3D MY_AES_BLOCK_SIZE;
> --    if (buf_len)
> -+    if (source_tail_len)
> -     {
> --      uchar *buf=3D EVP_CIPHER_CTX_buf_noconst(ctx);
> -       /*
> -         Not much we can do, block ciphers cannot encrypt data that aren=
't
> -         a multiple of the block length. At least not without padding.
> -         Let's do something CTR-like for the last partial block.
> --
> --        NOTE this assumes that there are only buf_len bytes in the buf.
> --        If OpenSSL will change that, we'll need to change the implement=
ation
> --        of this class too.
> -       */
> -       uchar mask[MY_AES_BLOCK_SIZE];
> -       uint mlen;
> -@@ -154,10 +166,10 @@ class MyCTX_nopad : public MyCTX
> -         return rc;
> -       DBUG_ASSERT(mlen =3D=3D sizeof(mask));
> -
> --      for (uint i=3D0; i < buf_len; i++)
> --        dst[i]=3D buf[i] ^ mask[i];
> -+      for (uint i=3D0; i < source_tail_len; i++)
> -+        dst[i]=3D source_tail[i] ^ mask[i];
> -     }
> --    *dlen=3D buf_len;
> -+    *dlen=3D source_tail_len;
> -     return MY_AES_OK;
> -   }
> - };
> -diff --git a/unittest/mysys/aes-t.c b/unittest/mysys/aes-t.c
> -index 34704e06..cbec2760 100644
> ---- a/unittest/mysys/aes-t.c
> -+++ b/unittest/mysys/aes-t.c
> -@@ -21,27 +21,96 @@
> - #include <string.h>
> - #include <ctype.h>
> -
> --#define DO_TEST(mode, nopad, slen, fill, dlen, hash)                   =
 \
> --  SKIP_BLOCK_IF(mode =3D=3D 0xDEADBEAF, nopad ? 4 : 5, #mode " not supp=
orted")     \
> --  {                                                                    =
 \
> --    memset(src, fill, src_len=3D slen);                                =
   \
> --    ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENCRYPT,             =
 \
> --                    src, src_len, dst, &dst_len,                       =
 \
> --                    key, sizeof(key), iv, sizeof(iv)) =3D=3D MY_AES_OK,=
     \
> --      "encrypt " #mode " %u %s", src_len, nopad ? "nopad" : "pad");    =
 \
> --    if (!nopad)                                                        =
 \
> --      ok (dst_len =3D=3D my_aes_get_size(mode, src_len), "my_aes_get_si=
ze");\
> --    my_md5(md5, (char*)dst, dst_len);                                  =
 \
> --    ok(dst_len =3D=3D dlen && memcmp(md5, hash, sizeof(md5)) =3D=3D 0, =
"md5");  \
> --    ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DECRYPT,             =
 \
> --                    dst, dst_len, ddst, &ddst_len,                     =
 \
> --                    key, sizeof(key), iv, sizeof(iv)) =3D=3D MY_AES_OK,=
     \
> --       "decrypt " #mode " %u", dst_len);                               =
 \
> --    ok(ddst_len =3D=3D src_len && memcmp(src, ddst, src_len) =3D=3D 0, =
"memcmp"); \
> -+
> -+/** Test streaming encryption, bytewise update.*/
> -+static int aes_crypt_bytewise(enum my_aes_mode mode, int flags, const u=
nsigned char *src,
> -+                 unsigned int slen, unsigned char *dst, unsigned int *d=
len,
> -+                 const unsigned char *key, unsigned int klen,
> -+                 const unsigned char *iv, unsigned int ivlen)
> -+{
> -+  /* Allocate context on odd address on stack, in order to
> -+   catch misalignment errors.*/
> -+  void *ctx=3D (char *)alloca(MY_AES_CTX_SIZE+1)+1;
> -+
> -+  int res1, res2;
> -+  uint d1=3D 0, d2;
> -+  uint i;
> -+
> -+  if ((res1=3D my_aes_crypt_init(ctx, mode, flags, key, klen, iv, ivlen=
)))
> -+    return res1;
> -+  for (i=3D 0; i < slen; i++)
> -+  {
> -+    uint tmp_d1=3D0;
> -+    res1=3D my_aes_crypt_update(ctx, src+i,1, dst, &tmp_d1);
> -+    if (res1)
> -+      return res1;
> -+    d1+=3D tmp_d1;
> -+    dst+=3D tmp_d1;
> -+  }
> -+  res2=3D my_aes_crypt_finish(ctx, dst, &d2);
> -+  *dlen=3D d1 + d2;
> -+  return res1 ? res1 : res2;
> -+}
> -+
> -+
> -+#ifndef HAVE_EncryptAes128Ctr
> -+const uint MY_AES_CTR=3D0xDEADBEAF;
> -+#endif
> -+#ifndef HAVE_EncryptAes128Gcm
> -+const uint MY_AES_GCM=3D0xDEADBEAF;
> -+#endif
> -+
> -+#define MY_AES_UNSUPPORTED(x)  (x =3D=3D 0xDEADBEAF)
> -+
> -+static void do_test(uint mode, const char *mode_str, int nopad, uint sl=
en,
> -+                    char fill, size_t dlen, const char *hash)
> -+{
> -+  uchar key[16]=3D {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6};
> -+  uchar iv[16]=3D {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7};
> -+  uchar src[1000], dst[1100], dst2[1100], ddst[1000];
> -+  uchar md5[MY_MD5_HASH_SIZE];
> -+  uint src_len, dst_len, dst_len2, ddst_len;
> -+  int result;
> -+
> -+  if (MY_AES_UNSUPPORTED(mode))
> -+  {
> -+    skip(nopad?7:6, "%s not supported", mode_str);
> -+    return;
> -+  }
> -+  memset(src, fill, src_len=3D slen);
> -+  result=3D my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENCRYPT, src, sr=
c_len,
> -+                       dst, &dst_len, key, sizeof(key), iv, sizeof(iv))=
;
> -+  ok(result =3D=3D MY_AES_OK, "encrypt %s %u %s", mode_str, src_len,
> -+     nopad ? "nopad" : "pad");
> -+
> -+  if (nopad)
> -+  {
> -+    result=3D aes_crypt_bytewise(mode, nopad | ENCRYPTION_FLAG_ENCRYPT,=
 src,
> -+                                src_len, dst2, &dst_len2, key, sizeof(k=
ey),
> -+                                iv, sizeof(iv));
> -+    ok(result =3D=3D MY_AES_OK, "encrypt bytewise %s %u", mode_str, src=
_len);
> -+    /* Compare with non-bytewise encryption result*/
> -+    ok(dst_len =3D=3D dst_len2 && memcmp(dst, dst2, dst_len) =3D=3D 0,
> -+       "memcmp bytewise  %s %u", mode_str, src_len);
> -+  }
> -+  else
> -+  {
> -+    int dst_len_real=3D my_aes_get_size(mode, src_len);
> -+    ok(dst_len_real=3D dst_len, "my_aes_get_size");
> -   }
> -+  my_md5(md5, (char *) dst, dst_len);
> -+  ok(dst_len =3D=3D dlen, "md5 len");
> -+  ok(memcmp(md5, hash, sizeof(md5)) =3D=3D 0, "md5");
> -+  result=3D my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DECRYPT,
> -+                       dst, dst_len, ddst, &ddst_len, key, sizeof(key),=
 iv,
> -+                       sizeof(iv));
> -+
> -+  ok(result =3D=3D MY_AES_OK, "decrypt %s %u", mode_str, dst_len);
> -+  ok(ddst_len =3D=3D src_len && memcmp(src, ddst, src_len) =3D=3D 0, "m=
emcmp");
> -+}
> -
> --#define DO_TEST_P(M,S,F,D,H) DO_TEST(M,0,S,F,D,H)
> --#define DO_TEST_N(M,S,F,D,H) DO_TEST(M,ENCRYPTION_FLAG_NOPAD,S,F,D,H)
> -+#define DO_TEST_P(M, S, F, D, H) do_test(M, #M, 0, S, F, D, H)
> -+#define DO_TEST_N(M, S, F, D, H) do_test(M, #M, ENCRYPTION_FLAG_NOPAD, =
S, F, D, H)
> -
> - /* useful macro for debugging */
> - #define PRINT_MD5()                                     \
> -@@ -53,25 +122,15 @@
> -     printf("\"\n");                                     \
> -   } while(0);
> -
> --#ifndef HAVE_EncryptAes128Ctr
> --const uint MY_AES_CTR=3D0xDEADBEAF;
> --#endif
> --#ifndef HAVE_EncryptAes128Gcm
> --const uint MY_AES_GCM=3D0xDEADBEAF;
> --#endif
> -
> - int
> - main(int argc __attribute__((unused)),char *argv[])
> - {
> --  uchar key[16]=3D {1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6};
> --  uchar iv[16]=3D  {2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7};
> --  uchar src[1000], dst[1100], ddst[1000];
> --  uchar md5[MY_MD5_HASH_SIZE];
> --  uint src_len, dst_len, ddst_len;
> -
> -   MY_INIT(argv[0]);
> -
> --  plan(87);
> -+  plan(122);
> -+
> -   DO_TEST_P(MY_AES_ECB, 200, '.', 208, "\xd8\x73\x8e\x3a\xbc\x66\x99\x1=
3\x7f\x90\x23\x52\xee\x97\x6f\x9a");
> -   DO_TEST_P(MY_AES_ECB, 128, '?', 144, "\x19\x58\x33\x85\x4c\xaa\x7f\x0=
6\xd1\xb2\xec\xd7\xb7\x6a\xa9\x5b");
> -   DO_TEST_P(MY_AES_CBC, 159, '%', 160, "\x4b\x03\x18\x3d\xf1\xa7\xcd\xa=
1\x46\xb3\xc6\x8a\x92\xc0\x0f\xc9");
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb b/meta-oe/recipe=
s-dbs/mysql/mariadb_10.8.3.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.8.3.bb
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97603): https://lists.openembedded.org/g/openembedded=
-devel/message/97603
> Mute This Topic: https://lists.openembedded.org/mt/92040462/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_SJ0PR11MB5022263AD57F4C24A8FAE2BCF1BD9SJ0PR11MB5022namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<pre>Seems the zstd lib not recognized with clang through the log you paste=
d.<br>TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/mariadb/10=
.8.3-r0/recipe-sysroot-native/usr/lib/libzstd.so: file not recognized: file=
 format not recognized=0A=
clang-14: error: linker command failed with exit code 1 (use -v to see invo=
cation)<br><br>I will look into this further.<br><br>Thanks,<br></pre>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Thursday, June 30, 2022 18:56<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> openembeded-devel &lt;openembedded-devel@lists.openembedded.org&=
gt;<br>
<b>Subject:</b> Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.8.3</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Please note: This e-mail is from an EXTERNAL e-ma=
il address]<br>
<br>
this fails to build where its not finding right zlib see<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/659134/">https://=
errors.yoctoproject.org/Errors/Details/659134/</a><br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/659124/">https://=
errors.yoctoproject.org/Errors/Details/659124/</a><br>
<br>
On Tue, Jun 28, 2022 at 5:31 AM Yu, Mingli &lt;mingli.yu@windriver.com&gt; =
wrote:<br>
&gt;<br>
&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;<br>
&gt; Remove the backported patch mariadb-openssl3.patch as the logic<br>
&gt; is included in the new version.<br>
&gt;<br>
&gt; Add libzstd to RDEPENDS to fix below qa issue:<br>
&gt;&nbsp; mariadb-10.8.3-r0 do_package_qa: QA Issue: /usr/lib64/plugin/zst=
d.so contained in package mariadb-server requires libzstd.so.1()(64bit), bu=
t no providers found in RDEPENDS:mariadb-server? [file-rdeps]<br>
&gt;<br>
&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...ive_10.7.4.bb =3D&gt; mariadb-native_10.8.3.bb} |&nbsp;&nbsp;=
 0<br>
&gt;&nbsp; meta-oe/recipes-dbs/mysql/mariadb.inc&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 12 +-<br>
&gt;&nbsp; .../mysql/mariadb/mariadb-openssl3.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 416 ------------------<br>
&gt;&nbsp; .../{mariadb_10.7.4.bb =3D&gt; mariadb_10.8.3.bb}&nbsp; |&nbsp;&=
nbsp; 0<br>
&gt;&nbsp; 4 files changed, 9 insertions(+), 419 deletions(-)<br>
&gt;&nbsp; rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.4.bb =3D&g=
t; mariadb-native_10.8.3.bb} (100%)<br>
&gt;&nbsp; delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mariadb-ope=
nssl3.patch<br>
&gt;&nbsp; rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.4.bb =3D&gt; mari=
adb_10.8.3.bb} (100%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb b/meta=
-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb<br>
&gt; similarity index 100%<br>
&gt; rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb<br>
&gt; rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb<br>
&gt; diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-d=
bs/mysql/mariadb.inc<br>
&gt; index 922373b63..4c072dbf7 100644<br>
&gt; --- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt; +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt; @@ -19,11 +19,10 @@ SRC_URI =3D &quot;<a href=3D""></a>https://archive=
.mariadb.org/${BP}/source/${BP}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://ssize_t.patch">file://ssize_t.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://mm_malloc.patch">file://mm_malloc.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://sys_futex.patch">file://sys_futex.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://mariadb-openssl3.patch">file://mariadb-openssl3.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quo=
t;<br>
&gt;&nbsp; SRC_URI:append:libc-musl =3D &quot; <a href=3D"file://ppc-remove=
-glibc-dep.patch&quot;">file://ppc-remove-glibc-dep.patch&quot;</a><br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;73dd9c9d325520f20ca5e0ef16f94b7be1146bed=
7e4a78e735c20daebf3a4173&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;887eadc55176ac1ead1fccfc89ade4b5990ef192=
745ad4dcd879acb41c050892&quot;<br>
&gt;<br>
&gt;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/Maria=
DB/server/releases">https://github.com/MariaDB/server/releases</a>&quot;<br=
>
&gt;<br>
&gt; @@ -176,6 +175,13 @@ do_install() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -f ${D}${datadir}/doc/README ]; the=
n<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${D}${datadir=
}/doc/README ${D}${datadir}/doc/${PN}/<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; # mini-benchmark used for Gitlab-CI to run on ever=
y commit to catch<br>
&gt; +&nbsp;&nbsp;&nbsp; # if there are severe performance regressions.<br>
&gt; +&nbsp;&nbsp;&nbsp; # remove it to avoid introducing bash dependency<b=
r>
&gt; +&nbsp;&nbsp;&nbsp; if [ -f ${D}${datadir}/mysql/mini-benchmark ]; the=
n<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -rf ${D}${datadir}/mysq=
l/mini-benchmark<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ${@bb.utils.contains('DISTRO_FEATURES=
', 'pam', 'true', 'false', d)}; then<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pam_so=3D$(find =
${D} -name pam_user_map.so)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ x&quot;${pa=
m_so}&quot; !=3D x ]; then<br>
&gt; @@ -206,7 +212,7 @@ RDEPENDS:${PN}-client =3D &quot;perl perl-module-g=
etopt-long perl-module-file-temp \<br>
&gt;&nbsp; RDEPENDS:${PN}-server =3D &quot;perl perl-module-getopt-long per=
l-module-data-dumper \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-file-basename perl-module-fi=
le-path perl-module-sys-hostname \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-file-copy perl-module-file-t=
emp perl-module-posix \<br>
&gt; -&nbsp;&nbsp;&nbsp; ${PN}-client ${PN}-setupdb libdbi-perl libdbd-mysq=
l-perl lzo&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; ${PN}-client ${PN}-setupdb libdbi-perl libdbd-mysq=
l-perl lzo libzstd&quot;<br>
&gt;&nbsp; RDEPENDS:${PN}-leftovers =3D &quot;perl perl-module-cwd perl-mod=
ule-benchmark perl-module-getopt-long \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-posix perl-module-data-dumpe=
r perl-module-sigtrap perl-module-threads \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-threads-shared perl-module-i=
o-socket perl-module-sys-hostname perl-module-file-copy \<br>
&gt; diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch =
b/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 878675f30..000000000<br>
&gt; --- a/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,416 +0,0 @@<br>
&gt; -From 1626955f3a2107ec4c7fd927ebfa3c6c1d2b09b8 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Vladislav Vaintroub &lt;wlad@mariadb.com&gt;<br>
&gt; -Date: Mon, 8 Nov 2021 18:48:19 +0100<br>
&gt; -Subject: [PATCH] MDEV-25785 Add support for OpenSSL 3.0<br>
&gt; -<br>
&gt; -Summary of changes<br>
&gt; -<br>
&gt; -- MD_CTX_SIZE is increased<br>
&gt; -<br>
&gt; -- EVP_CIPHER_CTX_buf_noconst(ctx) does not work anymore, points<br>
&gt; -&nbsp; to nobody knows where. The assumption made previously was that=
<br>
&gt; -&nbsp; (since the function does not seem to be documented)<br>
&gt; -&nbsp; was that it points to the last partial source block.<br>
&gt; -&nbsp; Add own partial block buffer for NOPAD encryption instead<br>
&gt; -<br>
&gt; -- SECLEVEL in CipherString in openssl.cnf<br>
&gt; -&nbsp; had been downgraded to 0, from 1, to make TLSv1.0 and TLSv1.1 =
possible<br>
&gt; -<br>
&gt; -- Workaround Ssl_cipher_list issue, it now returns TLSv1.3 ciphers,<b=
r>
&gt; -&nbsp; in addition to what was set in --ssl-cipher<br>
&gt; -<br>
&gt; -- ctx_buf buffer now must be aligned to 16 bytes with openssl(<br>
&gt; -&nbsp; previously with WolfSSL only), ot crashes will happen<br>
&gt; -<br>
&gt; -- updated aes-t , to be better debuggable<br>
&gt; -&nbsp; using function, rather than a huge multiline macro<br>
&gt; -&nbsp; added test that does &quot;nopad&quot; encryption piece-wise, =
to test<br>
&gt; -&nbsp; replacement of EVP_CIPHER_CTX_buf_noconst<br>
&gt; -<br>
&gt; -Patch from Fedora <a href=3D"https://src.fedoraproject.org/rpms/maria=
db/raw/rawhide/f/mariadb-openssl3.patch">
https://src.fedoraproject.org/rpms/mariadb/raw/rawhide/f/mariadb-openssl3.p=
atch</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/MariaDB/serv=
er/commit/d42c2efbaa06a0307c2f0fd8fa87819ff50bbd7e">https://github.com/Mari=
aDB/server/commit/d42c2efbaa06a0307c2f0fd8fa87819ff50bbd7e</a>]<br>
&gt; -Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt; -Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; ----<br>
&gt; - cmake/ssl.cmake&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 21 +++++-<b=
r>
&gt; - include/mysql/service_my_crypt.h&nbsp; |&nbsp;&nbsp; 2 +-<br>
&gt; - include/ssl_compat.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +-<br>
&gt; - mysql-test/lib/openssl.cnf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp; 2 +-<br>
&gt; - mysql-test/main/ssl_cipher.result |&nbsp;&nbsp; 6 +-<br>
&gt; - mysql-test/main/ssl_cipher.test&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&gt; - mysys_ssl/my_crypt.cc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 46 +++++++-----<br>
&gt; - unittest/mysys/aes-t.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; | 121 ++++++++++++++++++++++--------<br>
&gt; - 8 files changed, 143 insertions(+), 60 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/cmake/ssl.cmake b/cmake/ssl.cmake<br>
&gt; -index a6793cf3..64c93ff9 100644<br>
&gt; ---- a/cmake/ssl.cmake<br>
&gt; -+++ b/cmake/ssl.cmake<br>
&gt; -@@ -118,7 +118,7 @@ MACRO (MYSQL_CHECK_SSL)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ENDIF()<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; FIND_PACKAGE(OpenSSL)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SET_PACKAGE_PROPERTIES(OpenSSL PROPERTIES TY=
PE RECOMMENDED)<br>
&gt; --&nbsp;&nbsp;&nbsp; IF(OPENSSL_FOUND AND OPENSSL_VERSION AND OPENSSL_=
VERSION VERSION_LESS &quot;3.0.0&quot;)<br>
&gt; -+&nbsp;&nbsp;&nbsp; IF(OPENSSL_FOUND)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(OPENSSL_LIBRARY ${OPENSSL_SS=
L_LIBRARY})<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INCLUDE(CheckSymbolExists)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(SSL_SOURCES &quot;&quot;)<br=
>
&gt; -@@ -139,9 +139,20 @@ MACRO (MYSQL_CHECK_SSL)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(SSL_INTERNAL_INCLUDE_DIRS &q=
uot;&quot;)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(SSL_DEFINES &quot;-DHAVE_OPE=
NSSL&quot;)<br>
&gt; -<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FOREACH(x INCLUDES LIBRARIES DEFINITI=
ONS)<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(SAVE_CMAKE_REQUIRED_$=
{x} ${CMAKE_REQUIRED_${x}})<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENDFOREACH()<br>
&gt; -+<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Silence &quot;deprecated in OpenSSL=
 3.0&quot;<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IF((NOT OPENSSL_VERSION) # 3.0 not de=
termined by older cmake<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OR NOT(OPENSSL_VERS=
ION VERSION_LESS &quot;3.0.0&quot;))<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(SSL_DEFINES &quot;${S=
SL_DEFINES} -DOPENSSL_API_COMPAT=3D0x10100000L&quot;)<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(CMAKE_REQUIRED_DEFINI=
TIONS -DOPENSSL_API_COMPAT=3D0x10100000L)<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENDIF()<br>
&gt; -+<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(CMAKE_REQUIRED_INCLUDES ${OP=
ENSSL_INCLUDE_DIR})<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(CMAKE_REQUIRED_LIBRARIES ${S=
SL_LIBRARIES})<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL=
_INCLUDE_DIR})<br>
&gt; -+<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHECK_SYMBOL_EXISTS(ERR_remove_t=
hread_state &quot;openssl/err.h&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; HAVE_ERR_remove_thread_state)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHECK_SYMBOL_EXISTS(EVP_aes_128_=
ctr &quot;openssl/evp.h&quot;<br>
&gt; -@@ -150,8 +161,10 @@ MACRO (MYSQL_CHECK_SSL)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; HAVE_EncryptAes128Gcm)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHECK_SYMBOL_EXISTS(X509_check_h=
ost &quot;openssl/x509v3.h&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; HAVE_X509_check_host)<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(CMAKE_REQUIRED_INCLUDES)<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(CMAKE_REQUIRED_LIBRARIES)<br>
&gt; -+<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FOREACH(x INCLUDES LIBRARIES DEFINITI=
ONS)<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SET(CMAKE_REQUIRED_${x} $=
{SAVE_CMAKE_REQUIRED_${x}})<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENDFOREACH()<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ELSE()<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IF(WITH_SSL STREQUAL &quot;syste=
m&quot;)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MESSAGE(FATAL_ERROR =
&quot;Cannot find appropriate system libraries for SSL. Use WITH_SSL=3Dbund=
led to enable SSL support&quot;)<br>
&gt; -diff --git a/include/mysql/service_my_crypt.h b/include/mysql/service=
_my_crypt.h<br>
&gt; -index 2a232117..bb038aaa 100644<br>
&gt; ---- a/include/mysql/service_my_crypt.h<br>
&gt; -+++ b/include/mysql/service_my_crypt.h<br>
&gt; -@@ -45,7 +45,7 @@ extern &quot;C&quot; {<br>
&gt; - /* The max key length of all supported algorithms */<br>
&gt; - #define MY_AES_MAX_KEY_LENGTH 32<br>
&gt; -<br>
&gt; --#define MY_AES_CTX_SIZE 656<br>
&gt; -+#define MY_AES_CTX_SIZE 672<br>
&gt; -<br>
&gt; - enum my_aes_mode {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; MY_AES_ECB, MY_AES_CBC<br>
&gt; -diff --git a/include/ssl_compat.h b/include/ssl_compat.h<br>
&gt; -index 8dc12254..6db1baab 100644<br>
&gt; ---- a/include/ssl_compat.h<br>
&gt; -+++ b/include/ssl_compat.h<br>
&gt; -@@ -24,7 +24,7 @@<br>
&gt; - #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)<br>
&gt; - #define ERR_remove_state(X) ERR_clear_error()<br>
&gt; - #define EVP_CIPHER_CTX_SIZE 176<br>
&gt; --#define EVP_MD_CTX_SIZE 48<br>
&gt; -+#define EVP_MD_CTX_SIZE 72<br>
&gt; - #undef EVP_MD_CTX_init<br>
&gt; - #define EVP_MD_CTX_init(X) do { memset((X), 0, EVP_MD_CTX_SIZE); EVP=
_MD_CTX_reset(X); } while(0)<br>
&gt; - #undef EVP_CIPHER_CTX_init<br>
&gt; -@@ -77,7 +77,6 @@<br>
&gt; - #define DH_set0_pqg(D,P,Q,G)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; ((D)-&gt;p=3D (P), (D)-&gt;g=3D (G))<br>
&gt; - #endif<br>
&gt; -<br>
&gt; --#define EVP_CIPHER_CTX_buf_noconst(ctx) ((ctx)-&gt;buf)<br>
&gt; - #define EVP_CIPHER_CTX_encrypting(ctx)&nbsp; ((ctx)-&gt;encrypt)<br>
&gt; - #define EVP_CIPHER_CTX_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(EVP_CIPHER_CTX)<br>
&gt; -<br>
&gt; -diff --git a/mysql-test/lib/openssl.cnf b/mysql-test/lib/openssl.cnf<=
br>
&gt; -index b9ab37ac..7cd6f748 100644<br>
&gt; ---- a/mysql-test/lib/openssl.cnf<br>
&gt; -+++ b/mysql-test/lib/openssl.cnf<br>
&gt; -@@ -9,4 +9,4 @@ ssl_conf =3D ssl_section<br>
&gt; - system_default =3D system_default_section<br>
&gt; -<br>
&gt; - [system_default_section]<br>
&gt; --CipherString =3D ALL:@SECLEVEL=3D1<br>
&gt; -+CipherString =3D ALL:@SECLEVEL=3D0<br>
&gt; -diff --git a/mysql-test/main/ssl_cipher.result b/mysql-test/main/ssl_=
cipher.result<br>
&gt; -index 930d384e..66d817b7 100644<br>
&gt; ---- a/mysql-test/main/ssl_cipher.result<br>
&gt; -+++ b/mysql-test/main/ssl_cipher.result<br>
&gt; -@@ -61,8 +61,8 @@ connect&nbsp; ssl_con,localhost,root,,,,,SSL;<br>
&gt; - SHOW STATUS LIKE 'Ssl_cipher';<br>
&gt; - Variable_name Value<br>
&gt; - Ssl_cipher&nbsp;&nbsp;&nbsp; AES128-SHA<br>
&gt; --SHOW STATUS LIKE 'Ssl_cipher_list';<br>
&gt; --Variable_name Value<br>
&gt; --Ssl_cipher_list&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AES128-SHA<br>
&gt; -+SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SE=
SSION_STATUS WHERE VARIABLE_NAME=3D'Ssl_cipher_list';<br>
&gt; -+VARIABLE_VALUE like '%AES128-SHA%'<br>
&gt; -+1<br>
&gt; - disconnect ssl_con;<br>
&gt; - connection default;<br>
&gt; -diff --git a/mysql-test/main/ssl_cipher.test b/mysql-test/main/ssl_ci=
pher.test<br>
&gt; -index 36549d76..d4cdcffb 100644<br>
&gt; ---- a/mysql-test/main/ssl_cipher.test<br>
&gt; -+++ b/mysql-test/main/ssl_cipher.test<br>
&gt; -@@ -98,6 +98,6 @@ let $restart_parameters=3D--ssl-cipher=3DAES128-SHA=
;<br>
&gt; - source include/restart_mysqld.inc;<br>
&gt; - connect (ssl_con,localhost,root,,,,,SSL);<br>
&gt; - SHOW STATUS LIKE 'Ssl_cipher';<br>
&gt; --SHOW STATUS LIKE 'Ssl_cipher_list';<br>
&gt; -+SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SE=
SSION_STATUS WHERE VARIABLE_NAME=3D'Ssl_cipher_list';<br>
&gt; - disconnect ssl_con;<br>
&gt; - connection default;<br>
&gt; -diff --git a/mysys_ssl/my_crypt.cc b/mysys_ssl/my_crypt.cc<br>
&gt; -index e512eee9..4d7ebc7b 100644<br>
&gt; ---- a/mysys_ssl/my_crypt.cc<br>
&gt; -+++ b/mysys_ssl/my_crypt.cc<br>
&gt; -@@ -29,11 +29,7 @@<br>
&gt; - #include &lt;ssl_compat.h&gt;<br>
&gt; - #include &lt;cstdint&gt;<br>
&gt; -<br>
&gt; --#ifdef HAVE_WOLFSSL<br>
&gt; - #define CTX_ALIGN 16<br>
&gt; --#else<br>
&gt; --#define CTX_ALIGN 0<br>
&gt; --#endif<br>
&gt; -<br>
&gt; - class MyCTX<br>
&gt; - {<br>
&gt; -@@ -100,8 +96,9 @@ class MyCTX_nopad : public MyCTX<br>
&gt; - {<br>
&gt; - public:<br>
&gt; -&nbsp;&nbsp; const uchar *key;<br>
&gt; --&nbsp; uint klen, buf_len;<br>
&gt; -+&nbsp; uint klen, source_tail_len;<br>
&gt; -&nbsp;&nbsp; uchar oiv[MY_AES_BLOCK_SIZE];<br>
&gt; -+&nbsp; uchar source_tail[MY_AES_BLOCK_SIZE];<br>
&gt; -<br>
&gt; -&nbsp;&nbsp; MyCTX_nopad() : MyCTX() { }<br>
&gt; -&nbsp;&nbsp; ~MyCTX_nopad() { }<br>
&gt; -@@ -112,7 +109,7 @@ class MyCTX_nopad : public MyCTX<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; compile_time_assert(MY_AES_CTX_SIZE &gt;=3D =
sizeof(MyCTX_nopad));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; this-&gt;key=3D key;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; this-&gt;klen=3D klen;<br>
&gt; --&nbsp;&nbsp;&nbsp; this-&gt;buf_len=3D 0;<br>
&gt; -+&nbsp;&nbsp;&nbsp; this-&gt;source_tail_len=3D 0;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (ivlen)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(oiv, iv, ivlen);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; DBUG_ASSERT(ivlen =3D=3D 0 || ivlen =3D=3D s=
izeof(oiv));<br>
&gt; -@@ -123,26 +120,41 @@ class MyCTX_nopad : public MyCTX<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return res;<br>
&gt; -&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -+&nbsp; /** Update last partial source block, stored in source_tail a=
rray. */<br>
&gt; -+&nbsp; void update_source_tail(const uchar* src, uint slen)<br>
&gt; -+&nbsp; {<br>
&gt; -+&nbsp;&nbsp;&nbsp; if (!slen)<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; -+&nbsp;&nbsp;&nbsp; uint new_tail_len=3D (source_tail_len + slen) % M=
Y_AES_BLOCK_SIZE;<br>
&gt; -+&nbsp;&nbsp;&nbsp; if (new_tail_len)<br>
&gt; -+&nbsp;&nbsp;&nbsp; {<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (slen + source_tail_len &lt; MY_AE=
S_BLOCK_SIZE)<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(source_tail + sour=
ce_tail_len, src, slen);<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DBUG_ASSERT(slen &gt; new=
_tail_len);<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(source_tail, src +=
 slen - new_tail_len, new_tail_len);<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -+&nbsp;&nbsp;&nbsp; }<br>
&gt; -+&nbsp;&nbsp;&nbsp; source_tail_len=3D new_tail_len;<br>
&gt; -+&nbsp; }<br>
&gt; -+<br>
&gt; -&nbsp;&nbsp; int update(const uchar *src, uint slen, uchar *dst, uint=
 *dlen)<br>
&gt; -&nbsp;&nbsp; {<br>
&gt; --&nbsp;&nbsp;&nbsp; buf_len+=3D slen;<br>
&gt; -+&nbsp;&nbsp;&nbsp; update_source_tail(src, slen);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return MyCTX::update(src, slen, dst, dlen);<=
br>
&gt; -&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp; int finish(uchar *dst, uint *dlen)<br>
&gt; -&nbsp;&nbsp; {<br>
&gt; --&nbsp;&nbsp;&nbsp; buf_len %=3D MY_AES_BLOCK_SIZE;<br>
&gt; --&nbsp;&nbsp;&nbsp; if (buf_len)<br>
&gt; -+&nbsp;&nbsp;&nbsp; if (source_tail_len)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uchar *buf=3D EVP_CIPHER_CTX_buf_noco=
nst(ctx);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Not much we can do, =
block ciphers cannot encrypt data that aren't<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a multiple of the bl=
ock length. At least not without padding.<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Let's do something C=
TR-like for the last partial block.<br>
&gt; --<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOTE this assumes that th=
ere are only buf_len bytes in the buf.<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If OpenSSL will change th=
at, we'll need to change the implementation<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of this class too.<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uchar mask[MY_AES_BLOCK_SIZE];<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint mlen;<br>
&gt; -@@ -154,10 +166,10 @@ class MyCTX_nopad : public MyCTX<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rc;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DBUG_ASSERT(mlen =3D=3D sizeof(m=
ask));<br>
&gt; -<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (uint i=3D0; i &lt; buf_len; i++)=
<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dst[i]=3D buf[i] ^ mask[i=
];<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (uint i=3D0; i &lt; source_tail_l=
en; i++)<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dst[i]=3D source_tail[i] =
^ mask[i];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; --&nbsp;&nbsp;&nbsp; *dlen=3D buf_len;<br>
&gt; -+&nbsp;&nbsp;&nbsp; *dlen=3D source_tail_len;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return MY_AES_OK;<br>
&gt; -&nbsp;&nbsp; }<br>
&gt; - };<br>
&gt; -diff --git a/unittest/mysys/aes-t.c b/unittest/mysys/aes-t.c<br>
&gt; -index 34704e06..cbec2760 100644<br>
&gt; ---- a/unittest/mysys/aes-t.c<br>
&gt; -+++ b/unittest/mysys/aes-t.c<br>
&gt; -@@ -21,27 +21,96 @@<br>
&gt; - #include &lt;string.h&gt;<br>
&gt; - #include &lt;ctype.h&gt;<br>
&gt; -<br>
&gt; --#define DO_TEST(mode, nopad, slen, fill, dlen, hash)&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp; SKIP_BLOCK_IF(mode =3D=3D 0xDEADBEAF, nopad ? 4 : 5, #mode &q=
uot; not supported&quot;)&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp; {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp; memset(src, fill, src_len=3D slen);&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp; ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENC=
RYPT,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src, src_len, dst, &amp;dst_=
len,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key, sizeof(key), iv, sizeof=
(iv)) =3D=3D MY_AES_OK,&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;encrypt &quot; #mode &quot; %u =
%s&quot;, src_len, nopad ? &quot;nopad&quot; : &quot;pad&quot;);&nbsp;&nbsp=
;&nbsp;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp; if (!nopad)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \=
<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok (dst_len =3D=3D my_aes_get_size(mo=
de, src_len), &quot;my_aes_get_size&quot;);\<br>
&gt; --&nbsp;&nbsp;&nbsp; my_md5(md5, (char*)dst, dst_len);&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp; ok(dst_len =3D=3D dlen &amp;&amp; memcmp(md5, has=
h, sizeof(md5)) =3D=3D 0, &quot;md5&quot;);&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp; ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DEC=
RYPT,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dst, dst_len, ddst, &amp;dds=
t_len,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key, sizeof(key), iv, sizeof=
(iv)) =3D=3D MY_AES_OK,&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;decrypt &quot; #mode &quo=
t; %u&quot;, dst_len);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --&nbsp;&nbsp;&nbsp; ok(ddst_len =3D=3D src_len &amp;&amp; memcmp(src,=
 ddst, src_len) =3D=3D 0, &quot;memcmp&quot;); \<br>
&gt; -+<br>
&gt; -+/** Test streaming encryption, bytewise update.*/<br>
&gt; -+static int aes_crypt_bytewise(enum my_aes_mode mode, int flags, cons=
t unsigned char *src,<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int slen, unsigned char *dst, unsigne=
d int *dlen,<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char *key, unsigned int klen,<b=
r>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char *iv, unsigned int ivlen)<b=
r>
&gt; -+{<br>
&gt; -+&nbsp; /* Allocate context on odd address on stack, in order to<br>
&gt; -+&nbsp;&nbsp; catch misalignment errors.*/<br>
&gt; -+&nbsp; void *ctx=3D (char *)alloca(MY_AES_CTX_SIZE+1)+1;<br>
&gt; -+<br>
&gt; -+&nbsp; int res1, res2;<br>
&gt; -+&nbsp; uint d1=3D 0, d2;<br>
&gt; -+&nbsp; uint i;<br>
&gt; -+<br>
&gt; -+&nbsp; if ((res1=3D my_aes_crypt_init(ctx, mode, flags, key, klen, i=
v, ivlen)))<br>
&gt; -+&nbsp;&nbsp;&nbsp; return res1;<br>
&gt; -+&nbsp; for (i=3D 0; i &lt; slen; i++)<br>
&gt; -+&nbsp; {<br>
&gt; -+&nbsp;&nbsp;&nbsp; uint tmp_d1=3D0;<br>
&gt; -+&nbsp;&nbsp;&nbsp; res1=3D my_aes_crypt_update(ctx, src+i,1, dst, &a=
mp;tmp_d1);<br>
&gt; -+&nbsp;&nbsp;&nbsp; if (res1)<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return res1;<br>
&gt; -+&nbsp;&nbsp;&nbsp; d1+=3D tmp_d1;<br>
&gt; -+&nbsp;&nbsp;&nbsp; dst+=3D tmp_d1;<br>
&gt; -+&nbsp; }<br>
&gt; -+&nbsp; res2=3D my_aes_crypt_finish(ctx, dst, &amp;d2);<br>
&gt; -+&nbsp; *dlen=3D d1 + d2;<br>
&gt; -+&nbsp; return res1 ? res1 : res2;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+<br>
&gt; -+#ifndef HAVE_EncryptAes128Ctr<br>
&gt; -+const uint MY_AES_CTR=3D0xDEADBEAF;<br>
&gt; -+#endif<br>
&gt; -+#ifndef HAVE_EncryptAes128Gcm<br>
&gt; -+const uint MY_AES_GCM=3D0xDEADBEAF;<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; -+#define MY_AES_UNSUPPORTED(x)&nbsp; (x =3D=3D 0xDEADBEAF)<br>
&gt; -+<br>
&gt; -+static void do_test(uint mode, const char *mode_str, int nopad, uint=
 slen,<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char fill, size_t dlen, cons=
t char *hash)<br>
&gt; -+{<br>
&gt; -+&nbsp; uchar key[16]=3D {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5=
, 6};<br>
&gt; -+&nbsp; uchar iv[16]=3D {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6,=
 7};<br>
&gt; -+&nbsp; uchar src[1000], dst[1100], dst2[1100], ddst[1000];<br>
&gt; -+&nbsp; uchar md5[MY_MD5_HASH_SIZE];<br>
&gt; -+&nbsp; uint src_len, dst_len, dst_len2, ddst_len;<br>
&gt; -+&nbsp; int result;<br>
&gt; -+<br>
&gt; -+&nbsp; if (MY_AES_UNSUPPORTED(mode))<br>
&gt; -+&nbsp; {<br>
&gt; -+&nbsp;&nbsp;&nbsp; skip(nopad?7:6, &quot;%s not supported&quot;, mod=
e_str);<br>
&gt; -+&nbsp;&nbsp;&nbsp; return;<br>
&gt; -+&nbsp; }<br>
&gt; -+&nbsp; memset(src, fill, src_len=3D slen);<br>
&gt; -+&nbsp; result=3D my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENCRYPT,=
 src, src_len,<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dst, &amp;=
dst_len, key, sizeof(key), iv, sizeof(iv));<br>
&gt; -+&nbsp; ok(result =3D=3D MY_AES_OK, &quot;encrypt %s %u %s&quot;, mod=
e_str, src_len,<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp; nopad ? &quot;nopad&quot; : &quot;pad&quot;=
);<br>
&gt; -+<br>
&gt; -+&nbsp; if (nopad)<br>
&gt; -+&nbsp; {<br>
&gt; -+&nbsp;&nbsp;&nbsp; result=3D aes_crypt_bytewise(mode, nopad | ENCRYP=
TION_FLAG_ENCRYPT, src,<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src_len, dst2, &amp;dst_len2, k=
ey, sizeof(key),<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iv, sizeof(iv));<br>
&gt; -+&nbsp;&nbsp;&nbsp; ok(result =3D=3D MY_AES_OK, &quot;encrypt bytewis=
e %s %u&quot;, mode_str, src_len);<br>
&gt; -+&nbsp;&nbsp;&nbsp; /* Compare with non-bytewise encryption result*/<=
br>
&gt; -+&nbsp;&nbsp;&nbsp; ok(dst_len =3D=3D dst_len2 &amp;&amp; memcmp(dst,=
 dst2, dst_len) =3D=3D 0,<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;memcmp bytewise&nbsp; %s =
%u&quot;, mode_str, src_len);<br>
&gt; -+&nbsp; }<br>
&gt; -+&nbsp; else<br>
&gt; -+&nbsp; {<br>
&gt; -+&nbsp;&nbsp;&nbsp; int dst_len_real=3D my_aes_get_size(mode, src_len=
);<br>
&gt; -+&nbsp;&nbsp;&nbsp; ok(dst_len_real=3D dst_len, &quot;my_aes_get_size=
&quot;);<br>
&gt; -&nbsp;&nbsp; }<br>
&gt; -+&nbsp; my_md5(md5, (char *) dst, dst_len);<br>
&gt; -+&nbsp; ok(dst_len =3D=3D dlen, &quot;md5 len&quot;);<br>
&gt; -+&nbsp; ok(memcmp(md5, hash, sizeof(md5)) =3D=3D 0, &quot;md5&quot;);=
<br>
&gt; -+&nbsp; result=3D my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DECRYPT,=
<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dst, dst_l=
en, ddst, &amp;ddst_len, key, sizeof(key), iv,<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(iv)=
);<br>
&gt; -+<br>
&gt; -+&nbsp; ok(result =3D=3D MY_AES_OK, &quot;decrypt %s %u&quot;, mode_s=
tr, dst_len);<br>
&gt; -+&nbsp; ok(ddst_len =3D=3D src_len &amp;&amp; memcmp(src, ddst, src_l=
en) =3D=3D 0, &quot;memcmp&quot;);<br>
&gt; -+}<br>
&gt; -<br>
&gt; --#define DO_TEST_P(M,S,F,D,H) DO_TEST(M,0,S,F,D,H)<br>
&gt; --#define DO_TEST_N(M,S,F,D,H) DO_TEST(M,ENCRYPTION_FLAG_NOPAD,S,F,D,H=
)<br>
&gt; -+#define DO_TEST_P(M, S, F, D, H) do_test(M, #M, 0, S, F, D, H)<br>
&gt; -+#define DO_TEST_N(M, S, F, D, H) do_test(M, #M, ENCRYPTION_FLAG_NOPA=
D, S, F, D, H)<br>
&gt; -<br>
&gt; - /* useful macro for debugging */<br>
&gt; - #define PRINT_MD5()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; \<br>
&gt; -@@ -53,25 +122,15 @@<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;\&quot;\n&quot;);&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; -&nbsp;&nbsp; } while(0);<br>
&gt; -<br>
&gt; --#ifndef HAVE_EncryptAes128Ctr<br>
&gt; --const uint MY_AES_CTR=3D0xDEADBEAF;<br>
&gt; --#endif<br>
&gt; --#ifndef HAVE_EncryptAes128Gcm<br>
&gt; --const uint MY_AES_GCM=3D0xDEADBEAF;<br>
&gt; --#endif<br>
&gt; -<br>
&gt; - int<br>
&gt; - main(int argc __attribute__((unused)),char *argv[])<br>
&gt; - {<br>
&gt; --&nbsp; uchar key[16]=3D {1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6};<br>
&gt; --&nbsp; uchar iv[16]=3D&nbsp; {2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7};<br>
&gt; --&nbsp; uchar src[1000], dst[1100], ddst[1000];<br>
&gt; --&nbsp; uchar md5[MY_MD5_HASH_SIZE];<br>
&gt; --&nbsp; uint src_len, dst_len, ddst_len;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp; MY_INIT(argv[0]);<br>
&gt; -<br>
&gt; --&nbsp; plan(87);<br>
&gt; -+&nbsp; plan(122);<br>
&gt; -+<br>
&gt; -&nbsp;&nbsp; DO_TEST_P(MY_AES_ECB, 200, '.', 208, &quot;\xd8\x73\x8e\=
x3a\xbc\x66\x99\x13\x7f\x90\x23\x52\xee\x97\x6f\x9a&quot;);<br>
&gt; -&nbsp;&nbsp; DO_TEST_P(MY_AES_ECB, 128, '?', 144, &quot;\x19\x58\x33\=
x85\x4c\xaa\x7f\x06\xd1\xb2\xec\xd7\xb7\x6a\xa9\x5b&quot;);<br>
&gt; -&nbsp;&nbsp; DO_TEST_P(MY_AES_CBC, 159, '%', 160, &quot;\x4b\x03\x18\=
x3d\xf1\xa7\xcd\xa1\x46\xb3\xc6\x8a\x92\xc0\x0f\xc9&quot;);<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb b/meta-oe/rec=
ipes-dbs/mysql/mariadb_10.8.3.bb<br>
&gt; similarity index 100%<br>
&gt; rename from meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb<br>
&gt; rename to meta-oe/recipes-dbs/mysql/mariadb_10.8.3.bb<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#97603): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/97603">
https://lists.openembedded.org/g/openembedded-devel/message/97603</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92040462=
/1997914">https://lists.openembedded.org/mt/92040462/1997914</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [raj.khem@gma=
il.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR11MB5022263AD57F4C24A8FAE2BCF1BD9SJ0PR11MB5022namp_--

