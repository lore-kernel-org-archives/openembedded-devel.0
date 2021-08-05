Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3973.1628130962059290074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lsW9NrsY;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38514ef0f4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1752OB3R015215
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Aug 2021 19:36:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=KU+FZz6L1a+vMZ52VaTHnEckI0Gs00KV6NL4sy1I0JA=;
 b=lsW9NrsY5awKOgA/nM7gd95J9TICUUYD4q6HCKHyUh59ivXHic8len04zmamUtWlBHL1
 6YZmCtMve3RC06Ia0dWALfUE5GFnQ/5YuXyLXPrfqkbXoxL9qW1cvo99NmVVY/Nx49LW
 UEg4XUqBadD//LT8ONcQjfGZE5/XbF/kRdD+rlJwGRLXD3ybIKMJ2tHIUROWH0wzlbWD
 kDqVwbQ7UbAGOcE3hFmgkJ/yc2Z+/QF0XDSSttjyOHcWq+Sv/R/PTbm8hK6j+mlJEJqw
 knSln83ZK+Zv7uA67NjmaymN/c9maWu5TXyBSjBjpjLO8Vv5S3xizOVS+o5esXzJTEXW 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a7vt6re28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 19:36:01 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1752a074032240
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Aug 2021 19:36:00 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a7vt6re21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Aug 2021 19:35:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnixKIJbQ/S+qIlC+EsabtiaJ3dJQfmZEpckHoRilkWasJJHDs0+vtfDEjJYreI3mAh7avIJkwvovXd1L/lhNY3d3Abxcojjp2O8QBo3hxL3KXa0u37gXwQYjV93odHDTfm+veomllfy3Bx0iONB3RzCjTJmUcXcMQMTICdc1URRveTo47AGlENxbDZFKySEQQNx14pU4Jk9JY6q/j9dKcWalAR6Jntqr6yj6mK5xIwLyPAUfHgwNlHePdUS5eUbEw282BJ2PqDsDnuyiPOJkfw8u6vfkrb4i3LRh6QwXSb1AG1TgjN3gjxVwJ6OvTg1wHOd1HlHPQqmvio1z90s2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KU+FZz6L1a+vMZ52VaTHnEckI0Gs00KV6NL4sy1I0JA=;
 b=i7DNT5tW6BrkLVOXr/U7ZJsdV4T+Mx0m7S32OIcEQh1GukjmKPb+qmpQdIaxMqFYQvDTbKI+StWCzvDnBKpN2jIhlD0Rh3bgA2KXc2wGtYBymwA02oqZUNPBM556yZKddpm4AcXpj6Tpc6MP8nb2o2EWOTcfEQ/HbKMr3btBXN6JhMyOupvmPUnceDCXeJ6z/9kRjcjkAZwaETWdYVfwAIrN1ki6WxZe5i3AYgpwzcZ3AItWYlyxvaMZDaM7bD9x6eZ0qHR/4nxDNE+L/W9akmlFqg+5wAaNxQpFcB0bNpTfRrtidjx88i5NQYw3bhoG2ypPPS0gPBHbi/Lvse4fNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB0080.namprd11.prod.outlook.com (2603:10b6:301:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Thu, 5 Aug
 2021 02:35:47 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e%4]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 02:35:47 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: akuster808 <akuster808@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
Thread-Topic: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
Thread-Index: AQHXiPLQtgYQe+wE3kGtNuvU8+Y+SqtjX8+AgADSZcY=
Date: Thu, 5 Aug 2021 02:35:47 +0000
Message-ID: 
 <CO1PR11MB500988659DDA01C7B1B713C4F1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <16959244EFE5AD42.32573@lists.openembedded.org>
 <7df92ec1-743d-7b45-2bff-807ad3314c13@windriver.com>,<19a36bf6-c3fb-bd5f-a95b-4c1adb4ec9df@gmail.com>
In-Reply-To: <19a36bf6-c3fb-bd5f-a95b-4c1adb4ec9df@gmail.com>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09da45cf-df3b-4c03-25ca-08d957b9bb8f
x-ms-traffictypediagnostic: MWHPR11MB0080:
x-microsoft-antispam-prvs: 
 <MWHPR11MB0080E5AAE40211252113F55BF1F29@MWHPR11MB0080.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5GRRSKKmL+gVQYWNMJEo3N2uDxiN8ktsNZBCVJ2C1ezZKHpcabS9h2b2DOfGTMpS2fsaNfiHVZJP/dGJ5EdzUHKYOCezAli4dUxrRX6g4OJF74duhMmwOkMdKK18yJfRU3QLAGZFxPLB/c0GFvT7IwBkPt/D8JZhMvsVlexonSzC9b6X6M7u8IL6ZdwRUhQ92wk2Db7B3YRUXgdwlehhvp5SRlOZNFQzSOn/jtjiXNBRNWOZx143wRre5P9n4bjMs5lYT/46uk5fjmukcyQZJ+kg5xMj+89CjZ56t9UWHyvocxchmv6cCsYMD+/KkRGWlS4Ga4JpwNJgSpfyqXTdTxQNOmoaw4cPghCnlTJ2PDXfuDskOH1nn3F518Zra5XaH+/URJSL3e0mrmr57ahmBJkPd9pdArb6eRBDg9UOOm0a0te+gqptVRnL+FO6oGaKXtEy9Gb2T5rKvMHRYm+eZvNV8xKGBC6L1K7r/itAGDFlsIKGt8gze6rXAUOdpD4glVChf48QwP1fKaMMdQ7wERLdu1YcNGVqmKW6Q3IabvKYuAzCN5zUruCE/HHUfCjUSe0/ipd3UX+uOnRiFhFBitv9CLbMLM3bVyRX5nW8fLEV0EyPokeXUoOoh3TXa+ZluDQi6z20kYeSOlpMf3PeHb1H2NnSBPxNBfoqJl4+znCalNZnLLyrLobMoADV6omyowc/AogYmJOXi29EBQBgEzPfcUCn081LLVco2NBRiogUIUW8Yh0RZ00tKXGFNBbMnQYdCfDDUD09vqQpih3UzJuhjfHaTrCC1qaFH17KACZuw+07hkLz1cAtMRef+GTIhugcKYX/8etVSW/bs4sWRgtCuBidZFtudazJEr+rcAo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(376002)(136003)(346002)(53546011)(66476007)(71200400001)(9686003)(122000001)(66946007)(7696005)(18265965003)(83380400001)(64756008)(2906002)(66556008)(38100700002)(19627405001)(26005)(33656002)(66446008)(76116006)(91956017)(55016002)(6506007)(5660300002)(52536014)(15650500001)(8676002)(166002)(966005)(186003)(478600001)(8936002)(86362001)(316002)(38070700005)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gRCDM5S51+sJefPdqqXGTUJiSVz688DLeQqLQXOuRYlvfMSxk5XP+rT2cv4u?=
 =?us-ascii?Q?lQIYuputTfb0YpWQpvfGH9+A3Pa755TX5iIAscdS+9dS4fKZMeQ9WP8WMl/w?=
 =?us-ascii?Q?xwPnjtAaXifyDeENof/0fAakmSwJqFdVc9etG80GvqwB55KbI9brdp73iPpb?=
 =?us-ascii?Q?c5u58AJ7VU8KUXPTha/WrjE/6xKzSB9kDmKJzKS7el20PR7fbDrMHm8K0uN1?=
 =?us-ascii?Q?HQmqVxtLKI8ra5BKXdp+n6zHjTBdmBku+qnWswOxf60nAGdHibKJ8OjZOPPO?=
 =?us-ascii?Q?JwwQ/GfaPSHmbCd2HsTU8sNqxwyQonLVQZEpQi7zyxBBlc/A52Nbvazk80aS?=
 =?us-ascii?Q?vJEE2ZLMOHTmKDhK1cKaxFN6Pu3dRJfJeUl6T0g5+7iEberNgSpqBUQlh/Ta?=
 =?us-ascii?Q?EpgUdRkJ5j6Fic+JnyLcixidYgXV1GI6Nlw6x+S3uJzWzpi9aXXvnAcPej3B?=
 =?us-ascii?Q?uv9jttmOnTIMQUurJA6w/hjY8iVQaPMbXBfXPnR/zgCuAA8SeRhRMAzBBFO6?=
 =?us-ascii?Q?CqVG43ClQdsHbBepIX6r8ZPLiPSxZ3rHxYAgXRC6UhpXcJhbhKsPfPuzWsv2?=
 =?us-ascii?Q?DbqhEEy6XRd+0T4iqfbFWQqYICGeOv+C6GixU9/0P6kAF8iYMRf1g80GeCtN?=
 =?us-ascii?Q?c4kBJFWf553nphj7kclUSwECDM8iNiZEaCYi+4xJ7M/fS/bJr3JEkj4+iy2C?=
 =?us-ascii?Q?RbYAfnbZ+V64/4MoaI//DLNzmPcbQW4FaN9MOXQSDGEm7iYHIGcLxdz/0CMB?=
 =?us-ascii?Q?ZE3hFhqKA0dlkYkfCpBKEM6W6nK1eXtMAHY3CFwR5EqWYJuTrOvNX7AfsEMF?=
 =?us-ascii?Q?qQqUEmhbGYFbRRDTE2Tw3mofuHrb49j0JoHtqkr2l7p+P92gHRdGLi3u6tcr?=
 =?us-ascii?Q?5+gqhFBsa4dRnreN9W8ypiqvygtVi5IYjY5OtYyIhnQElpDn2D1rAUVvc5ij?=
 =?us-ascii?Q?okW01G+gb+ruCeueUlZ+SWMdgZJv31p4wp3Sgpg/sliBgIlX3fS2+lg8a5Bc?=
 =?us-ascii?Q?UDjcOsDmlugZ1AyzPdsACaK4q3VDTCcSgJHfpZ9IZI97cYTXBbgcvr20oRSR?=
 =?us-ascii?Q?FSlJ11ILv1jPR48ujB/E9YF+vWkMCiI4EiELHYS+uOjjPuh3ISnewZWKaKW9?=
 =?us-ascii?Q?c7hTKCQWfUHL4TtKqx2iTxPSzUJC1gEJKqE8rUTOIvOkBrbBOB+VGyJxEIBP?=
 =?us-ascii?Q?C4sCG47m/7nAB6+DYSGFSWY7jy5rIyb8ENbXJVquwmIzr92ka2+tCcWlANXq?=
 =?us-ascii?Q?8y0of0FRkaeb2OnTXAs3GZ1t2XNjZvapJdkvCghEHwF3w1iaokRqdsNXw0iN?=
 =?us-ascii?Q?P4U=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09da45cf-df3b-4c03-25ca-08d957b9bb8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 02:35:47.6106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e2jM2f9G1WWhiYLziwAksA2KZ6oZ25TXkSX7SetZcZWoYLi3wfOyD0t2rXXMyAXW+8SwcF9W0nEKFLdhlfdVVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0080
X-Proofpoint-GUID: jYfIH_N0ytMT4y00pm5MuMS_-BhoFwQq
X-Proofpoint-ORIG-GUID: tZwZLrrYAhl6EaGNW6RVQAUvuSlT4En1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_08,2021-08-04_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050013
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB500988659DDA01C7B1B713C4F1F29CO1PR11MB5009namp_"

--_000_CO1PR11MB500988659DDA01C7B1B713C4F1F29CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Though the do_fetch issue is gone after upgrade mariadb to 10.5.11, but af=
ter 10.5.12 comes out, the issue will be there again if we don't upgrade ti=
mely.

Considering the previous URL only stores the latest tar ball and the updat=
ed one stores all the tar balls. It's better use the updated one.

Thanks,
________________________________
From: akuster808 <akuster808@gmail.com>
Sent: Wednesday, August 4, 2021 21:58
To: Yu, Mingli <Mingli.Yu@windriver.com>; openembedded-devel@lists.openemb=
edded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI

[Please note: This e-mail is from an EXTERNAL e-mail address]

On 8/3/21 10:43 PM, Yu, Mingli wrote:
> Ping.
>
> Thanks,
>
> On 7/27/21 2:32 PM, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Fixes:
>> WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL
>> https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariad=
b-10.5.9.tar.gz,
>> attempting MIRRORS if available

Mariadb has been updated to 10.5.11. Are you still seeing a d/l issue?

-armin
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 2974341bf..e8ff41461 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -4,7 +4,7 @@ SECTION =3D "libs"
>>   LICENSE =3D "GPLv2"
>>   LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Db1becf0cfa3366e0f4d854d1d264f311"
>>   -SRC_URI =3D
>> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
>> +SRC_URI =3D "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>              file://my.cnf \
>>              file://mysqld.service \
>>              file://install_db.service \
>>
>>
>>
>>=20
>>


--_000_CO1PR11MB500988659DDA01C7B1B713C4F1F29CO1PR11MB5009namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Hi Armin,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Though the do_fetch issue is gone after upgrade mariadb to 10.5.11, but af=
ter 10.5.12 comes out, the issue will be there again if we don't upgrade ti=
mely.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Considering the previous URL only stores the latest tar ball and the updat=
ed one stores all the tar balls. It's better use the updated one.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> akuster808 &lt;akust=
er808@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, August 4, 2021 21:58<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;; openembedded-devel@=
lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;<br=
>
<b>Subject:</b> Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_U=
RI</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">[Please note: This e-mail is from an EXTERNAL e-m=
ail address]<br>
<br>
On 8/3/21 10:43 PM, Yu, Mingli wrote:<br>
&gt; Ping.<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; On 7/27/21 2:32 PM, Yu, Mingli wrote:<br>
&gt;&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; Fixes:<br>
&gt;&gt; WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL<br>
&gt;&gt; <a href=3D"https://downloads.mariadb.org/interstitial/mariadb-10.=
5.9/source/mariadb-10.5.9.tar.gz">
https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-1=
0.5.9.tar.gz</a>,<br>
&gt;&gt; attempting MIRRORS if available<br>
<br>
Mariadb has been updated to 10.5.11. Are you still seeing a d/l issue?<br>
<br>
-armin<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-<br>
&gt;&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt;&gt; b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt;&gt; index 2974341bf..e8ff41461 100644<br>
&gt;&gt; --- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt;&gt; +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt;&gt; @@ -4,7 +4,7 @@ SECTION =3D &quot;libs&quot;<br>
&gt;&gt;&nbsp;&nbsp; LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&gt;&nbsp;&nbsp; LIC_FILES_CHKSUM =3D<br>
&gt;&gt; &quot;<a href=3D"file://COPYING;md5=3Db1becf0cfa3366e0f4d854d1d26=
4f311">file://COPYING;md5=3Db1becf0cfa3366e0f4d854d1d264f311</a>&quot;<br>
&gt;&gt;&nbsp;&nbsp; -SRC_URI =3D<br>
&gt;&gt; &quot;<a href=3D""></a>https://downloads.mariadb.org/interstitial=
/${BP}/source/${BP}.tar.gz \<br>
&gt;&gt; +SRC_URI =3D &quot;<a href=3D""></a>https://archive.mariadb.org/$=
{BP}/source/${BP}.tar.gz \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; <a href=3D"file://my.cnf">file://my.cnf</a> \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; <a href=3D"file://mysqld.service">file://mysqld.service</a> \<=
br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; <a href=3D"file://install_db.service">file://install_db.servic=
e</a> \<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB500988659DDA01C7B1B713C4F1F29CO1PR11MB5009namp_--
