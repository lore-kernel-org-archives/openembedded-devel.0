Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EE1C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:53:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.6476.1646128418772091081
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Hj2YdIpF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=005938089c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2219BKVp026380
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 1 Mar 2022 01:53:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Ag7yYIxQRfnQU6z7h9F88ZlJwRsZZAWcWcKQiJTP+iw=;
 b=Hj2YdIpFYu8sNxoQL1uUs2LX01Lt4zuIcUh4UHT3IaThfU44tOg3UjODX21QBkCz/rZL
 VsD9KagE+CUZskF1E5l4/UEs7+aLhjDe7zaakNU0drcAWSrkT7lVY3PHf4XJnqKd3nV+
 iI/GXMXemfOaZfsA5sa+d1AaOzpbovoiu7RI7MR6izmcpm90crnksXAFftkqcP6Xo8tb
 k8/WLhHfHxgK03pBPjEafwPSyJcLqplTYsYtdKX/Dts8bDvEROMY7/c2jLc4cYVOumjt
 0zRO1sv0dY/WSJGQwQ+VN1gqF/YwDCBFproGym2s0vy5zn66lZOXtZzWQ+Rr1RSe+GSv mw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh7ukgc95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:53:38 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2219hKg7009932
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 1 Mar 2022 01:53:37 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh7ukgc93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Mar 2022 01:53:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bs4F4BCQRH+JUMFB+FHp7nt5R189kjsW0epyBXZRXMr1DZ809HYgf5B579dTUC5zN7ytwiGk/BhjEIbxAJmY8bNJ3iSTFTnXy2pu3jqTqBA7pf44Kpr1OdWjKDB/IyB16mtGE/q6JRFPbtB0mMFy/DQoBdVtApQoMQec5IomNPFLPb3jSwQaTq6X7v1wJhc85+tABnaOLzmG86pig2jFHiNw227LyKLyIOWlWusmWxmSCAEci9t0PwcbpYJFG0+aVy829CSHGhRgaz5OmxD4egWbhVbZ9EyUqs3ayX4McoZFrLa6G7zWXhNW+ejZoM+baDxhJV0Xw39dS3po2hKPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag7yYIxQRfnQU6z7h9F88ZlJwRsZZAWcWcKQiJTP+iw=;
 b=eMFDDk8AOrJ4zmvrmf/IYZScUekGPuoYio7atzf0g+ybPw14RI8DSONhFO7Ll7kPahY6xEI2hEHBRSbTmWePYChdLWwqsqN4jsYOYmXiMdUsL3PD5ux45SF1EjAqfNdy0iE+HpmBVWkFLcKM2m1vvnVcFuO8HT20tJKGlklKMphbn20EkwPfOSKlFOuYNM/z+cHAyygTGW34dbeutfYE41RFHQSIo8gJKhDyohCCHoLqjgsMxQfLrhF/zo4nL/4fylyYup6cL+6Cl6JM9KSPOhepCUeeLhmSmCzwI/AXxiOO2Ny1PSQU18VWPfF9OLTPjmzWFkfpmxuk428/MTogkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by CY4PR11MB1576.namprd11.prod.outlook.com (2603:10b6:910:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 09:53:34 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::31a1:4d4e:5eb5:5930]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::31a1:4d4e:5eb5:5930%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 09:53:33 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: Khem Raj <raj.khem@gmail.com>, Justin Bronder <jsbronder@cold-front.org>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python3-termcolor: drop recipe
Thread-Topic: [oe] [meta-python][PATCH] python3-termcolor: drop recipe
Thread-Index: AQHYLO38uNRW9gnAck6as0o+uXEYzKypjMCAgAFDsAA=
Date: Tue, 1 Mar 2022 09:53:33 +0000
Message-ID: <38d51c4e-880c-38b8-e6f1-618e6f4b49fb@windriver.com>
References: <20220228215547.17414-1-jsbronder@cold-front.org>
 <CAMKF1soSRc1dFegS7Me0xcjJU3NfO2BCH-=o-wawjBHSnb4dqA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soSRc1dFegS7Me0xcjJU3NfO2BCH-=o-wawjBHSnb4dqA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MW3PR11MB4633.namprd11.prod.outlook.com
 (15.20.5017.027)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
suggested_attachment_session_id: 50792d6c-f39d-f1d9-b0f1-dad8b40ad20a
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3e3c4f5-1666-4c98-87d3-08d9fb695954
x-ms-traffictypediagnostic: CY4PR11MB1576:EE_
x-microsoft-antispam-prvs: 
 <CY4PR11MB157624AB1848B17F48FF261594029@CY4PR11MB1576.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oaDqpV1ebCtNRBW5kROa/s18NUeqjVMhcif6ofHj/qiY6piWkNzP3rMKDfOuU/tTdxI6bqHVRmaz13Ec6Savppb7CbiIUkBo4MXz3oTBFNZRxPIPRhg1wmDaxpQkbKw8F5fjvOdEss6AWSeVrFbE340HKS7NdwAL4WGWpK6m82aCDQC6A4bDueXZy7vNeJcw7GXSCAzVltckFkudoD9jfAtq2sqz2GOaagW0vJHzgPEO832Fj/cBV6juCVFFd77RenKEs9hMmXgz2bWtzdv9xN+DSVW4obM9R/DlN77kIJt/Oh/vOHO0LnEbcA4JorhAig69UdJQl/g9g2r12AIZ+jH/9N0PLWCNIl+xEcWKCIX7+I6l0E4X0S+KBM+gjW/pVRho1e1XqN3dd4alBTpZ+cHfBU3p8iebWKRZdo5f44fFcTBg0yniCzuCRZohIA7DUj64CBKzldwsfE8trYyjejVkheZ0sgbGjNciUtXIa/Q/kjQi1U5RjIeZoz3bQZBXHdL9ipDTpgtnlFfBpUlCynwwuuF3tYNTZej+ACbBT+omuSgzkraLmo7BOgidPIv+K1NMCkHrM9EVKra1x7dDmJuHve0OvoAIezSNAsRH8rg0TiWcWDM1tqUYMEV9yUiCs0mBdymF/C0UaogjO6yNZahySvslYry1+R8CCSbtlJ2XgaCMOdQm8UAZdgXG2HU9AGi7ziHZVM0+0FOdudBV9qsjI9kKaXUc8zY1E82c6a8HDx7NHB2Dkz7Jnzdzrm3rIr3flpx4m48e+plGZ/E6vYE6YiqVVG9xblSbRSH3/PgI+i0ZNsfOPm4l4GoUiypBWplvw+CdPiQpcHa/VCrej+XBmV5MRhrUFfif6Fi4Q2LAp73NFFrg2xKjFtYyU48S65cti9lzaReXJeb3LfI48A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(38100700002)(122000001)(2616005)(36756003)(6506007)(8936002)(2906002)(5660300002)(31686004)(66446008)(64756008)(71200400001)(31696002)(316002)(76116006)(66946007)(66556008)(508600001)(86362001)(4326008)(38070700005)(8676002)(966005)(53546011)(6486002)(66476007)(26005)(186003)(83380400001)(91956017)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Qz94tTQcOdaI4CdcCJbgPKHFrbbUVvHBzujvTF4nFWG9apke1DyHZhNGFZ?=
 =?iso-8859-1?Q?aqbcqAvZfEC/sRzOv74HqmjV9ZmBN1ALXUJ1eFp7kfhDqyZK3YWjLOyHkP?=
 =?iso-8859-1?Q?1ZF6pKgcZvkxHLo0udiD4zWG8kfq3/S4u96c7zwgTdGb3IrIZLP8MarXwV?=
 =?iso-8859-1?Q?PLtLghK41tjoCFUqdIYcluTouyv4+i+kosFynYtd2WrQnILaem+IKmpxk5?=
 =?iso-8859-1?Q?arKyuXiv0iuUH/QOEVqugMbu1JNaXDr2V4j8dCnM+E0bucPHcAwZc4bijz?=
 =?iso-8859-1?Q?Rnxiktvpdt3vzkwjI9ooUzSu3HxZtl0IU0ds8b1xRp+hyVmozBhXid68KT?=
 =?iso-8859-1?Q?4LZ7AGVK1ii6W75s4zCWITsj3DWViXRyPnDIW6q/lhuLToCuRHf9AmkuNT?=
 =?iso-8859-1?Q?TKubzLL30qz6tomnUa3mwIqCPzNOoEG4fvzbrdVbFQKWB7QxJfd1nJSU+P?=
 =?iso-8859-1?Q?axo8aTnMXf8DsVOvEhinRBW1ftX512PDKmErE4Vgqe2fLMOufBWduJ62ML?=
 =?iso-8859-1?Q?eQOarbPc4dGff6rAc6VOso4MBnItOoP2L8GxvxegFViV9jaHDy7OmdqwuB?=
 =?iso-8859-1?Q?O1B9vpIwebhRgwdkdo5ddoiGBVygR39/+7HlXjcbR1fKhMz8SfWAIJVIx5?=
 =?iso-8859-1?Q?ggNatRo4VVVbNIQbmFRxz62OBgg3M5UoyvkCPPoUiXX74jk1OdfG/wmYH5?=
 =?iso-8859-1?Q?XfBJPq+qP3bWFHWBaTzNwTiO2glxDKUAWfkcObDgth7r8gx1CfQa75GtJc?=
 =?iso-8859-1?Q?aC9ebsmLxFY/xZAry4aQJgAIVsv+YOWC1kXC4rb1zFnEx7YuP/3lm+ktAk?=
 =?iso-8859-1?Q?A8ICDYowVufULRdxdvoETiU2o9oS1T0/OwkuoQu1usd96OdtjKzuf6c0LJ?=
 =?iso-8859-1?Q?wImlbGtdnyDuuajKODH+4UYiKIODgDKjBgmQOh2Bk2lSgW+CHzLKnxEKKj?=
 =?iso-8859-1?Q?iCFGtKXy3DERn8VhL98jqfizEZlEiefPJ6QCWr9msIENEI2/PiHEpkEA+g?=
 =?iso-8859-1?Q?V774nTf21XaB7hwFVcp7GAQpTG2p1fCEeFC/hF8+VQvYLojUsA4YcLILYQ?=
 =?iso-8859-1?Q?oZ50at3rbUP7RvtthfuNSBTzw6H9aTFCYmWbQ4VAADAuyQ/EA4M5qiWR49?=
 =?iso-8859-1?Q?IIvGVOlMhuZjiC8Jw/84bY1ROpMqLB3p+PypBZPjVz0s72/MGyoNEDqzNl?=
 =?iso-8859-1?Q?UuA9r2HOfPCtG8OnJ3ZB07bmDo8xCkzLRoYKt0lwLJAIXBHsWqLsDz/rEH?=
 =?iso-8859-1?Q?a+aNco3ipGuMfAsExsWRHN8Y105FYB/s7ig52SsaXRYWD9tZJ1Xz/Q+Dwy?=
 =?iso-8859-1?Q?wal8RM5br72weyNORSyCkiReO8TFKN4kKfMCPn3nowdUyZYjuMNO2udkvr?=
 =?iso-8859-1?Q?jFbXrex2v24GAU3j2SJ/KhNzeEZle4p4kEytuTAKQEcWBasZ0t9fIlS/jZ?=
 =?iso-8859-1?Q?n+cS3sqFq5YhgQc8OqKznaetOrZjtBzmDCXBQHB18gXIIYJjhG1NoDXAAt?=
 =?iso-8859-1?Q?jv/lSw2HmCkPBZMKRWECvOS6cfOu5OnGjv+fER3hABqvFLQo2p96c57E/Y?=
 =?iso-8859-1?Q?W73gXLXJ4xBfKk/RKuPbMHZoNtTPhiSrZnbpPHJjoo8+PrRhJfr0Qqk9+O?=
 =?iso-8859-1?Q?hTcmZCouckC52rxJt/RKE3utAcpHezdFE7l55F+IdM1pgHYAupP+zUV2QN?=
 =?iso-8859-1?Q?nOXzt2tySCb7I1MIsxcRoI3PpdMtYB0tAAEFuUDdeEmRQ/yX+Dhill1+qg?=
 =?iso-8859-1?Q?iZJA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: 
 <8DC270601F865B40A4BBC3638B85B51B@windriversystems.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3e3c4f5-1666-4c98-87d3-08d9fb695954
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 09:53:33.6909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Uxoudaxvfd/1j7vuVRENNVmWDOIus47tEMbmwaRPXOHN0kDESOQW46AGQTER6CVZZJttK4y9ots5nKUDIz41usyT34ve9wci8vX4udXYrYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1576
X-Proofpoint-GUID: 3nIJDIVJuk5apz0A4a4HzfplOuGl3wDi
X-Proofpoint-ORIG-GUID: JZH3YCxTuW9TuEJQpBmEZypiNDARzRQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 09:53:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95624

On 3/1/22 06:34, Khem Raj wrote:=0A=
> [Please note: This e-mail is from an EXTERNAL e-mail address]=0A=
>=0A=
> Hongxu added this recipe in 2019, I would like to hear from him. Maybe=0A=
> he has future plans for this recipe.=0A=
=0A=
This recipe is required by tensorflow, but long time no maintain, I am =0A=
open to remove it in OE=0A=
=0A=
I will move the recipe to meta-tensorflow=0A=
=0A=
//Hongxu=0A=
=0A=
> On Mon, Feb 28, 2022 at 1:55 PM Justin Bronder <jsbronder@cold-front.org>=
 wrote:=0A=
>> No releases since 2011, no upstream repository and does not build with=
=0A=
>> bdist_wheel.  If you depend upon this recipe, please work with upstream=
=0A=
>> to update the package to PEP-517 packaging.=0A=
>>=0A=
>> Note that there are alternatives on PyPI and numerous forks on github,=
=0A=
>> but none appear to have become canonical.=0A=
>>=0A=
>> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>=0A=
>> ---=0A=
>>   .../packagegroups/packagegroup-meta-python.bb        |  1 -=0A=
>>   .../python/python3-termcolor_1.1.0.bb                | 12 ------------=
=0A=
>>   2 files changed, 13 deletions(-)=0A=
>>   delete mode 100644 meta-python/recipes-devtools/python/python3-termcol=
or_1.1.0.bb=0A=
>>=0A=
>> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-py=
thon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.b=
b=0A=
>> index 9626231bba..dbfa991ebe 100644=0A=
>> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb=
=0A=
>> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb=
=0A=
>> @@ -421,7 +421,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\=0A=
>>       python3-sympy \=0A=
>>       python3-tabulate \=0A=
>>       python3-term \=0A=
>> -    python3-termcolor \=0A=
>>       python3-textparser \=0A=
>>       python3-texttable \=0A=
>>       python3-thrift \=0A=
>> diff --git a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0=
.bb b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb=0A=
>> deleted file mode 100644=0A=
>> index 17df7f983d..0000000000=0A=
>> --- a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb=0A=
>> +++ /dev/null=0A=
>> @@ -1,12 +0,0 @@=0A=
>> -SUMMARY =3D "ANSII Color formatting for output in terminal"=0A=
>> -HOMEPAGE =3D "https://pypi.python.org/pypi/termcolor"=0A=
>> -SECTION =3D "devel/python"=0A=
>> -LICENSE =3D "MIT"=0A=
>> -LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D809e8749b63567978acfbd81=
d9f6a27d"=0A=
>> -=0A=
>> -inherit pypi setuptools3=0A=
>> -=0A=
>> -SRC_URI[md5sum] =3D "043e89644f8909d462fbbfa511c768df"=0A=
>> -SRC_URI[sha256sum] =3D "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7b=
f7a1cdf4c02de613b"=0A=
>> -=0A=
>> -BBCLASSEXTEND =3D "native"=0A=
>> --=0A=
>> 2.35.1=0A=
>>=0A=
>>=0A=
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
>> Links: You receive all messages sent to this group.=0A=
>> View/Reply Online (#95597): https://lists.openembedded.org/g/openembedde=
d-devel/message/95597=0A=
>> Mute This Topic: https://lists.openembedded.org/mt/89462395/1997914=0A=
>> Group Owner: openembedded-devel+owner@lists.openembedded.org=0A=
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]=0A=
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
>>=0A=
=0A=

