Return-Path: <prasad.mulay@in.abb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CE3C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 04:23:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.web11.3888.1741321405764734310
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 20:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@in.abb.com header.s=selector2 header.b=KWnV8bwz;
 spf=pass (domain: in.abb.com, ip: 40.107.159.68, mailfrom: prasad.mulay@in.abb.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVy9slgrV5JVLd7H92cYz5VEwRr7oM14MqWFRd8FqaaAm2H0ULZHsGjMOhRUfeSyGV8j+KeNDD1fyuje8HP+vEYbN8e5LsLBtrMWsxnwl3NF7+82ctUjKKCeIuy0M9ih/hU1TSZUgtlltI6vxLY3QXLkUwzNihJvJ49ATxuwZd2nadUWWAfH6jh18GCj6eZAMWx/kNfQ0Kj+Aor0twEiuVi38j7nw7itQeAWWalmdvdqMawxPvXNhyi7xUoibPedOIClY99h4sEBVBgO1n79jqt2sY4ILs5YGDhNLe3dmmDz1QT4clk3HD/n4KwXgrZxVoubFbSxnW2MCytZ1XF44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eb3LprvErWr8+bLGXCJgo0KPCDTfOUTezh27YgPOtGM=;
 b=Q/Oo1ZyTAaRFcHuez+qH/P8SYflndDDwFDF2V4xgBJGt9Qir9hJ+iQJRKBZdWJKuyNrL5NB7Ls1tuUQIeNx7PkQsILDgpRMJDV8nEzgFKzA4Va+6mhF8LUaq1RskrbmVBHZb4XUKmpQQr+RycHzAa9Kbkyc/qNKy0bAbZLmu6lQq3lwHXaPB4BHUSOLCSrfxsgB5LSHE3oN2P93ZV2IJfA6wAGAXkNgL4MhAug4mr6MixVHvz9ELWM+pmGg3OUW2NcwkcKlJh6qfcZq/HleRp3duLcqqxGGpOFFNFO7JR2knYG6bQwarxKM/pNQcgcbDvqJHQkREV1P6cjP1ghYy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.abb.com; dmarc=pass action=none header.from=in.abb.com;
 dkim=pass header.d=in.abb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in.abb.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eb3LprvErWr8+bLGXCJgo0KPCDTfOUTezh27YgPOtGM=;
 b=KWnV8bwzFmeyS3PAKyH8b0W85LwX0DH+SQW2ZM1IKA3KOikZsX5/if7dN/AujmkLbvr2IF6nRXzgoNYr//PrydCpLDdqiBGkj6n9yMpdF30+XFdTrU8/ZvgwIVKa8oPgWDHttwzO9gLE0Z4a0otBCG8SeG+WSF3jOKEXL17WyZwu3sSXUvFFTmoRgi1AdGgaPenmkqD5jOysMgLOZHzdncsyNsEZ7/I6NR4ybBdXFR9nYHddrObngdP4CocKZue71NYewlicZ4llZ3BxFGRljqGJX7qGB8A+3WA6hbLxld4zY8IYNa37hhJmB1INc9+M4OXB+w2uuHm94ZEtiV2N1Q==
Received: from PA2PR06MB9224.eurprd06.prod.outlook.com (2603:10a6:102:409::9)
 by VI0PR06MB9369.eurprd06.prod.outlook.com (2603:10a6:800:23e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 04:23:21 +0000
Received: from PA2PR06MB9224.eurprd06.prod.outlook.com
 ([fe80::d7a2:e0ea:f70e:4c5b]) by PA2PR06MB9224.eurprd06.prod.outlook.com
 ([fe80::d7a2:e0ea:f70e:4c5b%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 04:23:20 +0000
From: Prasad Mulay <prasad.mulay@in.abb.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-python]recipes python3-pandas not getting built properly for
 arm 32 bit
Thread-Topic: [meta-python]recipes python3-pandas not getting built properly
 for arm 32 bit
Thread-Index: AduPGG5wFlE1CArYQ/yPe3dOufbUCg==
Date: Fri, 7 Mar 2025 04:23:20 +0000
Message-ID: 
 <PA2PR06MB922472DD11FB75D7BC1C90BDAAD52@PA2PR06MB9224.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_d792d246-d363-40e2-82bc-6f0655128b68_ActionId=bf62dfba-cf13-4381-98e5-e5cfd81b0ac7;MSIP_Label_d792d246-d363-40e2-82bc-6f0655128b68_ContentBits=0;MSIP_Label_d792d246-d363-40e2-82bc-6f0655128b68_Enabled=true;MSIP_Label_d792d246-d363-40e2-82bc-6f0655128b68_Method=Standard;MSIP_Label_d792d246-d363-40e2-82bc-6f0655128b68_Name=d792d246-d363-40e2-82bc-6f0655128b68;MSIP_Label_d792d246-d363-40e2-82bc-6f0655128b68_SetDate=2025-03-07T04:17:09Z;MSIP_Label_d792d246-d363-40e2-82bc-6f0655128b68_SiteId=372ee9e0-9ce0-4033-a64a-c07073a91ecd;MSIP_Label_d792d246-d363-40e2-82bc-6f0655128b68_Tag=10,
 3, 0, 1;
x-processedbytemplafy: true
x-templafyemailsigvstoversion: 9.7.0.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in.abb.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA2PR06MB9224:EE_|VI0PR06MB9369:EE_
x-ms-office365-filtering-correlation-id: ce5c62ae-7eaf-4559-ea61-08dd5d2fcb01
x-abb-o365-outbound: ABBOUTBOUND1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700018|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?/y+AvSffxg7TXuQIZBg9OFyVhbAgPkugxJTvGCd5SJOC+B5WrPcQbAtrJuR2?=
 =?us-ascii?Q?ZM/Kw7QOnHq/ZX6RNIocBbsPCxsPyM/FT17Zb+f6A58HlsppMCbqy8xhg/Du?=
 =?us-ascii?Q?MuX+0InVeXk4hEGY7xNJbmvzU5muLyHJqs5G8s6SvQW+c+krjrbIu3c2zLRt?=
 =?us-ascii?Q?dVO+gTjOIhOKh6A27+WQuJXLvtl2q/p9HfNqgN8Cg62861sSgatmKx9XdQbg?=
 =?us-ascii?Q?DKW3G9vRUIB6Vwl0IYrQLpw2Sff6gmOCmmaKDmAp++Zhv8SlyVAWc4qoMIJH?=
 =?us-ascii?Q?KHLvIXmvtDjw2G6EwmOQzWrb+PROIB4DsSIei4k5HEaqtz+UfvVwx2OuG0Bd?=
 =?us-ascii?Q?CF6KczeWuckT0IO6ej4IisNjuJ0GVq1qIx9e7O7gDtuinuCof/zR4QO/7SRk?=
 =?us-ascii?Q?fxhti+uS7YRICByQjwgewoibKcHffTMkZiLBb1SZokDrjYGs48k7pSs+iVvW?=
 =?us-ascii?Q?hD3VE2m+nddyYYHnY2H9T2Szw22svNhFx0NO9WdcTco3U9rpP6sksaCVDpxr?=
 =?us-ascii?Q?EcSEWNQVQMlUd3j/gYxZZdHRElERfu8R8cQCf6Cj0gt1EcW+ArblP+Noaw9k?=
 =?us-ascii?Q?SmEzLsOtLHqif3lsuqbujl8JjN5ZsihMyD/osW5aSTFpYj+S5fpnSbfCABAL?=
 =?us-ascii?Q?ObJjqq47TK4fN9eo0+N20Ggqzjm5UReVgifZZKlLLvtJxIvt07JKVIGTtJV2?=
 =?us-ascii?Q?ZbycGExu3e0NnQ21RElewqVazT8ETQz3mmB+tfzVkRdOaWct/dEh7ejEHg9n?=
 =?us-ascii?Q?ZRu8pCYb8mBqKcLoEqWpBsRroxwAW0vusvvqvHfYbboa2X+6ACmLgmuJnUSa?=
 =?us-ascii?Q?zELY8JLOmb6b9D4/ozqxrMrcQi9OA2/dmZhsGzF/QZV3cwlK71bffJbOsaFQ?=
 =?us-ascii?Q?JYYPc2h8xU/ReM0Jl7MvpqFpnMej+ajlhF+7cdvisQBydzsG9i2WLir2umWs?=
 =?us-ascii?Q?aJxfuxYQbvxExbsSBTX9oNqYKw+7BnFea2tqZRIZMZsFWCIKlBhAimxwQQk5?=
 =?us-ascii?Q?rJ4GScNEXe0SgkD1GmatlrFBr4KRYtCI/sLGCdLWBoRdQKBu7QTtPUsf6Cr4?=
 =?us-ascii?Q?BKo7S4/5Y3J+wWUPVLfYxE/J1psh3iYnz8U4WLTe+ZEF+/Ii9ZD8CeQjkv4N?=
 =?us-ascii?Q?YuLFZ8JeJnzvS2mqv7sTHv+9gk3qcyFoHzh/QMyfZr0fcO+lsBhDC+4Zs43C?=
 =?us-ascii?Q?CLXpo+PJh0DItyLx/onXRyVH9WoHlDxIdW5EQbPqNnyWcyLQyhddazfMA39z?=
 =?us-ascii?Q?OcxiIbwedJaQZaVcCqwxtTm2267KG5s5f6tGX1ae+dOyrxwiUIvnqbjnnB9b?=
 =?us-ascii?Q?XJ+ofJyqjjo+FbvxSs9IkM+3hGMO162VwqCLA9zvxLdwE6zHCojdqKrlbdyO?=
 =?us-ascii?Q?VviurY73hpKicFDpaT1dL/jkYhRlMSyr9FJweWLeBnui16idUFHiyO52NV+W?=
 =?us-ascii?Q?tsh77lEnjxIserDdSWcz9kjCHPT94qWQ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA2PR06MB9224.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2ojbHBD+JcTQ+o1x4Gd8RLnaablrTExSBOqZjnBuzyuJ1eKLAe5hGmkxBjMF?=
 =?us-ascii?Q?PToC8NtTmyRwzWnDdZwlBLjH4Oh85+qyD80ZfpNXbCxuYnEr88B78alG4GJ9?=
 =?us-ascii?Q?FLmJSK9mzs5uiQxMpTtdKFK+j1Lh84iU6reZr8WGJUM0RWnBQhwkm2bYVq7Q?=
 =?us-ascii?Q?jiLIcsAqi5oH4fwLP1aJeSKJMMKiTfZUoObOEajHzj/GuoJQkA5xvQMgqMDh?=
 =?us-ascii?Q?O9phM7I2EUM4dS63jWJrK6kuV7KkduxLFh42n/mCUtNP20SrblO3rxRpTE8Y?=
 =?us-ascii?Q?E0ttTI0Gz3tj8jXgPA3AldNdkfHI7FMXBXdUQAILOhqbsFD/axxT7kQOvQfL?=
 =?us-ascii?Q?aS9OjiU+kNkETym2tqmpxwZ83h3H2x6mVUDpgqOw2Offa3T7+gISbSJ82W78?=
 =?us-ascii?Q?EomjjudeYYUEcj6TKcbXvX48l3Q16xaX8xJq6A+6zHPyQYGBSTPh01meL2wc?=
 =?us-ascii?Q?TQTi5YL+WcdKC9kYKYs5ehBFKZrMHjkI0X47yBqGxwL/r7qnsuV60H4JG6GA?=
 =?us-ascii?Q?MyCG3O5r6AJAk+kUo7pVZReWJkurWl17snG6bXlYScB7KffnfeuGBqybKzVe?=
 =?us-ascii?Q?bMIC0+o7GpdSK4JsPuGAjj+BXLyEwG/Nx3M77PK3jnc5G7tk4+1co7tBcHvb?=
 =?us-ascii?Q?EQloNxYsRDJFo/Gvk+oWyu2QR8T5IvldN6PSAoEZCT/i2o1y1jf83IiY8jCO?=
 =?us-ascii?Q?VT5cS32QmdRHBwkhjYRvEFhUpIlIc03aNu+pxMW4t3zl/ToHktCLP+75qWxs?=
 =?us-ascii?Q?JDHBMnow4fTH9SuZgDnYZHlCvN+GYJRBk36uxXOxiyUJvH65cnRLqGH0zXbT?=
 =?us-ascii?Q?iQaTQzJmMoKldjVHUfA23VzDRg77y+GQu3VLK8SRDTaynkEWDIk9xF0RDpFa?=
 =?us-ascii?Q?9crRneRUVi71LXACHTw16j/NMzX4fBNBqCsl20RNr9Ah9VplffY9k2gj0sNh?=
 =?us-ascii?Q?imqhLJB53Zww+WcN6EbrB3l30IYUfvro0LuhV/FL5MrXd0XR46Hh6fheqp8R?=
 =?us-ascii?Q?sAYBC0m8+ca5frLiOjfae/fW1Q/Nbg/OqpkBpHyMHTYcUzh2Zgyr3sHc28VQ?=
 =?us-ascii?Q?u4BeVhmn+PPLa5NR5PtEyfjKqD6rsBnBmZz4g69I1Vaki+kdvDL3haPKsL1V?=
 =?us-ascii?Q?9dTxHsBNtjAbuGDpdeJuXrRml4tbVg8MkLWcMAXmfjz3t/iwENElwHMhx11R?=
 =?us-ascii?Q?d9tWmChWUNVYJo/lGSEzWKEqc+5WCF9DiM5D8Ic75eYeOzh0+S4RjdDZaTQm?=
 =?us-ascii?Q?mq7tuFYVCqb12tUFQvX//HfAkGxSI0I4u8oGT59w1zU856nUhbwzEjRFLMmD?=
 =?us-ascii?Q?WlO27MTuGyP/8GWzQrUjCebMsYxuczm2EwPFHJ6Jv9i5m4bSj72FDc5d6noJ?=
 =?us-ascii?Q?NU1Fywsg+CPzp402XnbANEFVdV7Wo4MvVxBdxpZIRRZf8f5rpNcRnJ5SKGM4?=
 =?us-ascii?Q?V6nbikPI7P1Ka2HaTm08sfmrCyV2j8n7mycG6csCNOcsA/sn+rtPui28G7ir?=
 =?us-ascii?Q?aF6b/XhF29RLXnUKnrO5ki2S8x1BGYDw+rUF23TPUSMZBipaaVpNBaBdY/hb?=
 =?us-ascii?Q?oRznlSscL8HotLOGEfFyWZl2Zdps30jpSwPen+oy?=
Content-Type: multipart/alternative;
	boundary="_000_PA2PR06MB922472DD11FB75D7BC1C90BDAAD52PA2PR06MB9224eurp_"
MIME-Version: 1.0
X-OriginatorOrg: in.abb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA2PR06MB9224.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5c62ae-7eaf-4559-ea61-08dd5d2fcb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 04:23:20.6934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 372ee9e0-9ce0-4033-a64a-c07073a91ecd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6zyImpnwFW3aQcQkipDwRTvrkI0hIqNdo5/9M4TqUcoHJTdbAniurTSuOyfifSCayM32DjLJTKXKzkvNEp4tew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9369
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 04:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115777

--_000_PA2PR06MB922472DD11FB75D7BC1C90BDAAD52PA2PR06MB9224eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello
https://github.com/pandas-dev/pandas/issues/55305
this is reported on pandas repo. looking at the comments looks to be bug fr=
om build system. I have tried the solution specified there. but still probl=
em is persisting.
I am using custom IMX6 board.

Below is rspose from my board.
root@imx6dldau:~# python
Python 3.12.6 (main, Sep  6 2024, 19:03:47) [GCC 13.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import pandas as pd
>>> # Create a list of data
>>> data =3D [["Alice", 25], ["Bob", 30], ["Carol", 35]]
>>> # Create a Pandas DataFrame from the list of data
>>> df =3D pd.DataFrame(data, columns=3D["Name", "Age"])
>>> # Print the DataFrame
>>> print(df)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.12/site-packages/pandas/core/frame.py", line 1094,=
 in __repr__
    return self.to_string(**repr_params)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/core/frame.py", line 1271,=
 in to_string
    return fmt.DataFrameRenderer(formatter).to_string(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py", lin=
e 1134, in to_string
    string =3D string_formatter.to_string()
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/io/formats/string.py", lin=
e 30, in to_string
    text =3D self._get_string_representation()
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/io/formats/string.py", lin=
e 45, in _get_string_representation
    strcols =3D self._get_strcols()
              ^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/io/formats/string.py", lin=
e 36, in _get_strcols
    strcols =3D self.fmt.get_strcols()
              ^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py", lin=
e 615, in get_strcols
    strcols =3D self._get_strcols_without_index()
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py", lin=
e 870, in _get_strcols_without_index
    str_columns =3D self._get_formatted_column_labels(self.tr_frame)
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py", lin=
e 949, in _get_formatted_column_labels
    dtypes =3D self.frame.dtypes
             ^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/core/generic.py", line 615=
8, in dtypes
    data =3D self._mgr.get_dtypes()
           ^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/core/internals/managers.py=
", line 278, in get_dtypes
    return dtypes.take(self.blknos)
                       ^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/pandas/core/internals/managers.py=
", line 179, in blknos
    self._rebuild_blknos_and_blklocs()
  File "pandas/_libs/internals.pyx", line 755, in pandas._libs.internals.Bl=
ockManager._rebuild_blknos_and_blklocs
ValueError: Buffer dtype mismatch, expected 'intp_t' but got 'long long'
>>>

Any help would be appreciated.
Thank you
Regards
Prasad Mulay


--_000_PA2PR06MB922472DD11FB75D7BC1C90BDAAD52PA2PR06MB9224eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello <o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/pandas-dev/pandas/issu=
es/55305">https://github.com/pandas-dev/pandas/issues/55305</a><o:p></o:p><=
/p>
<p class=3D"MsoNormal">this is reported on pandas repo. looking at the comm=
ents looks to be bug from build system. I have tried the solution specified=
 there. but still problem is persisting.<o:p></o:p></p>
<p class=3D"MsoNormal">I am using custom IMX6 board.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Below is rspose from my board.<o:p></o:p></p>
<p class=3D"MsoNormal">root@imx6dldau:~# python<o:p></o:p></p>
<p class=3D"MsoNormal">Python 3.12.6 (main, Sep&nbsp; 6 2024, 19:03:47) [GC=
C 13.3.0] on linux<o:p></o:p></p>
<p class=3D"MsoNormal">Type &quot;help&quot;, &quot;copyright&quot;, &quot;=
credits&quot; or &quot;license&quot; for more information.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; import pandas as pd<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; # Create a list of data<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; data =3D [[&quot;Alice&quot;, 25], [&qu=
ot;Bob&quot;, 30], [&quot;Carol&quot;, 35]]<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; # Create a Pandas DataFrame from the li=
st of data<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; df =3D pd.DataFrame(data, columns=3D[&q=
uot;Name&quot;, &quot;Age&quot;])<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; # Print the DataFrame<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; print(df)<o:p></o:p></p>
<p class=3D"MsoNormal">Traceback (most recent call last):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;&lt;stdin&gt;&quot;, line 1, in &l=
t;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/frame.py&quot;, line 1094, in __repr__<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; return self.to_string(**repr_para=
ms)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/frame.py&quot;, line 1271, in to_string<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; return fmt.DataFrameRenderer(form=
atter).to_string(<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/format.py&quot;, line 1134, in to_string<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; string =3D string_formatter.to_st=
ring()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/string.py&quot;, line 30, in to_string<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; text =3D self._get_string_represe=
ntation()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/string.py&quot;, line 45, in _get_string_representation<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; strcols =3D self._get_strcols()<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/string.py&quot;, line 36, in _get_strcols<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; strcols =3D self.fmt.get_strcols(=
)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/format.py&quot;, line 615, in get_strcols<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; strcols =3D self._get_strcols_wit=
hout_index()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/format.py&quot;, line 870, in _get_strcols_without_index<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; str_columns =3D self._get_formatt=
ed_column_labels(self.tr_frame)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/io/formats/format.py&quot;, line 949, in _get_formatted_column_label=
s<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; dtypes =3D self.frame.dtypes<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/generic.py&quot;, line 6158, in dtypes<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; data =3D self._mgr.get_dtypes()<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/internals/managers.py&quot;, line 278, in get_dtypes<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; return dtypes.take(self.blknos)<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ^^^^^^^^^^^<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/usr/lib/python3.12/site-packages/=
pandas/core/internals/managers.py&quot;, line 179, in blknos<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self._rebuild_blknos_and_blklocs(=
)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;pandas/_libs/internals.pyx&quot;, =
line 755, in pandas._libs.internals.BlockManager._rebuild_blknos_and_blkloc=
s<o:p></o:p></p>
<p class=3D"MsoNormal">ValueError: Buffer dtype mismatch, expected 'intp_t'=
 but got 'long long'<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any help would be appreciated. <o:p></o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" summary=3D"Email signature" width=3D"100%" style=3D"width:100.0%;bor=
der-collapse:collapse">
<tbody>
<tr>
<td width=3D"100%" style=3D"width:100.0%;padding:0in 0in 0in 0in">
<div id=3D"signature">
<div style=3D"margin-bottom:15.0pt">
<div>
<p class=3D"MsoNormal" style=3D"margin-top:15.0pt;line-height:12.0pt">Thank=
 you<o:p></o:p></p>
<p class=3D"MsoNormal">Regards <o:p></o:p></p>
<p class=3D"MsoNormal">Prasad Mulay<o:p></o:p></p>
</div>
</div>
</div>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PA2PR06MB922472DD11FB75D7BC1C90BDAAD52PA2PR06MB9224eurp_--

