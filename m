Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64ACFCE7B03
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 06:45:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8499.1695883527196103425
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 23:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VXJxgox9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7635b06aa0=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38S6Blxo001994
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 06:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=tYHHAgUVduxOAyYeCM
	MX8SMV+dntw59hVLy9xigOQps=; b=VXJxgox9at5/9tlZpZxcjOmlC4iOyl3Gqr
	H63ZmwYuYO6AE0QZ43NWMsPlprywSUT8woZvI5m6HKcUcpUqOlkDwAOR2+9jMBCB
	yEqfrcllqYlLAi1GsZFHNdTfceoBeGkglxjrBTdMIVNGWMqhVLz6eJ0jBTMOwrmP
	WKTlXoqcWNEjH14gHbTZRoegYrNmYuIYnFQWkfqJrahNusIF0ph4QSAJaHRoyCMc
	l9C2XCYRG1aGvoX2mYJhi1EYmZzeOP7hjQemsGzqq7EkqS0biJZgycYwjTmFOev7
	nbSU38TqZr+yqHkYAay3ITizS0488rkQ8jF/QoxSuQPyErzA9tbQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x4tec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 06:45:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKBdIb9AGeH1N0yz1pSUfAAcMaL+9qIuX0gqWuLzrF2ZtPZx6xkIXQPxuilMC/gT8UJ/QfqRtKiR7bw80IUuneH5ZrWu3MS3sCAKRpgg+33u9OUwalXtA2UnszKVF99e0I9Jf46A2IM1FCGg2Sv6kBexs6o7jNvwKUai8/q6uonR11lQwns56zlV4gz7X4oZCxWefU5qBMnvqVny5wizeTVvZj77CYMoOsDZB3/oId9bY7um51MT+N/ouvHq+dMhUpMVYdt/Acwsz8kSgsxBs98XIMW5o9lATaHXLS5OuLdId2aiZp13MdShDGamWZco4zGpg99ynsv0Elm7Dcl6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYHHAgUVduxOAyYeCMMX8SMV+dntw59hVLy9xigOQps=;
 b=GEBDwSii3ji32r8R3hEajzWB3yl3aDSg97LFuGiK01qj0N9avEE/agi3tlKHdQXAWB2TNTqewtValvx1qV38tCytEc48l3VPor1WfrkeD8v3ll5uR9wg5wG9wV4aCxwI2+8zOnPqNNLG9HdAcav0/DVTZUitniR90yEV+xsVsa/1jafcHh/CNo0G9bBpTfXWTv3Acg8Om549EYllHwOzTzDziwiml+h4kvzMmeLMzFxSIge2J9BZyAtIUFRuAFhlAJFal3bhFhtt846GfcVJd1m+co2QCBNCUIpUkaC4RW3MfRMU4Duqsl897QSIAAM7fk45IkbIgsKzxM4kz2MR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.33; Thu, 28 Sep
 2023 06:45:22 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a%4]) with mapi id 15.20.6792.026; Thu, 28 Sep 2023
 06:45:21 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -> 20.5.1
Thread-Topic: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -> 20.5.1
Thread-Index: AQHZ3O8wL3OayD/Z2UutgltO95pDYLAv9Ljb
Date: Thu, 28 Sep 2023 06:45:21 +0000
Message-ID: 
 <MW4PR11MB58220042C32020C11D6DBF1584C1A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <1780D25DDBA68D32.30067@lists.openembedded.org>
In-Reply-To: <1780D25DDBA68D32.30067@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|SA1PR11MB7700:EE_
x-ms-office365-filtering-correlation-id: 93e8522a-52a1-42af-b412-08dbbfee7cb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oWlVEIxZTxamhR+tnTHd8CX4A33UPg8JO5UFUp385OOPesTSw4rLfhAwO5ltuHhgP3V13it6J8JvNIMMfjeupYJ8oG2U9nCsdfQ+ZqgM4CpzJzIHRLjb70DsRQYXh6hXPUNhercsGamqHvBc9gsxt+3LJQMZKU8dhXgKmDZpbTfVpGqq4X2BDGxJmAe1coZ9YMOejN3m0ehxsqMQjap6TdQ3wXI2zCRsJq0CKw8e0BfQGXAyu02/lqYbh8MnhkNw4Lu+OWCU8l55ImwFg2ySVExsoznfZpvDOk0s+niBfGmFWRUO07CRiGDoCxknJzGMCiEvizP9m5nyAqT/fzRHg1veiGy2pqTnhe6bGT+HL7eymj2SMN2GPCmCxmHTxlJ1z/ETOYWuHTuEIE5Oku3+0i+NZTD/UWpw8fUJsuefAccYLMGG0xEQZDqi8bvL2mEbk3P7omfF0JVGX8iYnTJfLfNJugJ6Ij5skv1JPZN8/WyTCwgI4NmBUnTWQN2uP7tYSO3gxHQOIpi+wsjhRCDEGbkgL80zNdaTjoSjhqb1H1WJ1nWtB888GbaJMYktqKDZMRUGMB/ZRZQrX3VdrdmLEurIAi6uCN9jiGdai6QFZ87GyMsPVb0iSA7PgCYooOqcZ5pTipmQ2mXLKO0OFGQdihlveOxairlvYViKhP70hss=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39850400004)(376002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(55016003)(478600001)(30864003)(7696005)(6506007)(9686003)(26005)(122000001)(18265965005)(166002)(8676002)(8936002)(86362001)(2906002)(5660300002)(41300700001)(66946007)(76116006)(33656002)(52536014)(110136005)(316002)(66446008)(66476007)(16799955002)(66556008)(64756008)(91956017)(71200400001)(83380400001)(66574015)(966005)(19627405001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?wF1b5TYSHLFhJxzIH1jnu/QMO8CgLXV1qduUxoIu4Q22C5jx2UGg3mHz2F?=
 =?iso-8859-1?Q?dLKzivf+UE7wjNprTbkGCjVQAJ0+RhoNZPZFoIu6/heYN0OKIOux7JMWYo?=
 =?iso-8859-1?Q?kOW3PiKfRT6WwII0Ye5Y+wxdKyDZA/xuZ8TLuo621qKgyvasqYg5DzG4RB?=
 =?iso-8859-1?Q?+iCBawiu545JXtjWVHB0kpGRcPw2unGZoYBQ+4TnEYwwDETvOyQ4qIZMkQ?=
 =?iso-8859-1?Q?fVraSfi9klMwAbfuVr8w0FEL9gcGPOv4SZffXpA8m1oKwWwSEAvnYpKrro?=
 =?iso-8859-1?Q?3NiY3wDd/lORip+8M+g8dW9jX+aosoOwCO2NZF5/EnQKHGQx20MabXLfu0?=
 =?iso-8859-1?Q?xzlxThmbrG1ptVCpByXuVW/wj0pDekk0tGq/c8M6OeBsvRVBJheThKWRxP?=
 =?iso-8859-1?Q?1Y/CNkiYC92JrqZ526QKBVYcb8/UneAjrVC63Peml21lv7QnZG93nUUUxr?=
 =?iso-8859-1?Q?pCKfkVS12cQ9z1JtxJiuzYgwfS13sDgAVzIhz9eyJL46SvEOI0VUd5vq9C?=
 =?iso-8859-1?Q?UvgAmTQEGoJBKOOJpWBrqiIKy3Gx/p/YKZPJD2/T/Ke09r8E4dKSTtbvSy?=
 =?iso-8859-1?Q?T2mVbJmveCLjcBr+o3IlOju2pyPEsUxWmetmgjY58VAJdhVC3+25G4oHDj?=
 =?iso-8859-1?Q?dHcJ5rlbu9gAUDZFDL7BE/27w45K8anF+HfY5di52znHNY/IiN6vxRW2gj?=
 =?iso-8859-1?Q?Hjll0yGtrlpUVABbey87jzhkecaNQRVrYbv1FvmE9YoVUvmeqOTNksW2we?=
 =?iso-8859-1?Q?2lPsRJ6YXV6SCtLix0FLG3B4drgQA93ZBDjvOFwqy18qG2qvoTbPLUljDa?=
 =?iso-8859-1?Q?/XDMNKyWb1MLqA6tUZ+gAeMgW7+OlPrFv8xv9INJAT6LW5vBGqnc7g/pkU?=
 =?iso-8859-1?Q?DiJ8onq878pi99G984G2V566pOwqDhIOpbDzRB4rDj1diol/4yGxV5PVDQ?=
 =?iso-8859-1?Q?2Pip9XMLdg0J4EwdonIR7LvFwSW0JvTkjzZ7h9RaeXlwpv3+iCJLzB/U7C?=
 =?iso-8859-1?Q?ZF4JzbYDVWdOZLgMmJLn3gaqxqq4dLvsZ+CnD/9cYFWGSDB+zfjbiWbMMb?=
 =?iso-8859-1?Q?c3nCofStOL4d9ovHP63V4xaqucp4+SvGx+Uu1CrercqzPiL8mGOhRifaHQ?=
 =?iso-8859-1?Q?JQ62kPNntx0S/8Xvem2+IFYZiUegfqaDZlssatAO6y+FhH4t16WSa3vR3W?=
 =?iso-8859-1?Q?Jal0RHTUQAzyvSseA2ogNAeYMlvPNkeVw4SRXAqHFyfGuHS7793Y2n60Ia?=
 =?iso-8859-1?Q?ymjl35pUkIYMuDtdmJTrrtGQJhpu5IMuWed/BWST09oOsolKEGH5PYeSIQ?=
 =?iso-8859-1?Q?rHcPFiz6tsPD8GpdDhCYrY40dPKcHrGYlYeVk/Dwu72u4BdWakUnwVZDSP?=
 =?iso-8859-1?Q?xLsWm6KeHGCiTVyO9hCbMzxoZGIQ7yooBE/1IkeXPrQnp5aGmOGjTpkKrM?=
 =?iso-8859-1?Q?KKzIkSE9EbloM22clhjgY7Zw/hWeRIZ2+OUsnYe+W6zLcgCN2mLDF7/d/+?=
 =?iso-8859-1?Q?vCfIF69Gltktd7kra1FI4IMPxZWrSriZSS0y30n76pAF1WSqsuWF71CWWc?=
 =?iso-8859-1?Q?dqQJ2cns9ak1BMU995alIibvNU4+KOTg6Ac1a9ZDSOKYKIJCcDdevptHR1?=
 =?iso-8859-1?Q?Nh6hyjsQM1YqQQvkCtLjbhJ5DrhxcVCoD7R+pn5RAQg2y4dWGqB2qWCQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58220042C32020C11D6DBF1584C1AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e8522a-52a1-42af-b412-08dbbfee7cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 06:45:21.8129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzJOEtG6nmqKwp1o47HfG941kwM6k2w6oXY5TXZS0IxR/KNCo9/D99BY1m8S4HLohILUYZDLdKx/CMWAf4xO9ovK9LlB0S+nnTc4QYijZTWaygK1LzjqDujfaQFmssxW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
X-Proofpoint-ORIG-GUID: FuNSVtZOvInbJyb4WhDgG2nuqrugX7q_
X-Proofpoint-GUID: FuNSVtZOvInbJyb4WhDgG2nuqrugX7q_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_03,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309280055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 06:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105215

--_000_MW4PR11MB58220042C32020C11D6DBF1584C1AMW4PR11MB5822namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Is there any issue with this patch.

-Archana
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: 01 September 2023 21:42
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -> 20.5.1

Update to latest release of latest LTS 20 release

    * node v20 introduces several new features and fixes many bugs and CVEs=
 as shown in [1]

    * Refresh 0001-liftoff-Correct-function-signatures.patch against 20.5.1

    * License-Update:
       - Change zlib version 1.2.13, October 13th, 2022 to version 1.2.13.1=
, October xxth, 2022 [2]
       - Change Copyright 2023 from Ada authors to Yagiz Nizipli and Daniel=
 Lemire [4]

    * Remove big-endian.patch as it is merged in v20.x [5] [6]

    * Remove below list of patches since mips32 is deleted from v8 as part =
of update V8 to 10.7.193.13 [7] [8]
       - mips-less-memory.patch
       - 0001-mips-Use-32bit-cast-for-operand-on-mips32.patch

    * Update Using-native-binaries.patch for node_js2c, it resolved below d=
o_compile error [9]
       Error:
       /bin/sh: line 1: build/tmp/work/core2-64-poky-linux/nodejs/20.5.1/no=
de-v20.5.1/out/Release/node_js2c: No such file or directory

    * Remove obsolete dtrace & etw configure options (we had: --without-<fe=
ature>) from the recipe [10]

https://github.com/nodejs/node/releases/tag/v20.5.1

[1] https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V20.m=
d
[2] https://github.com/nodejs/node/commit/f1007325753e62b13083f6e9e499fdc33=
f753d7d
[3] https://github.com/nodejs/node/commit/900ae1bda76caaa7213431a5268560b57=
8ed2d55
[4] https://github.com/nodejs/node/commit/d2465369243bc4313d9840b62c2393c4f=
179ffbb
[5] https://github.com/v8/v8/commit/3cea5d5425c3a0d7d1768b3758269ac98875de7=
7
[6] https://github.com/nodejs/node/commit/f226350fcbebd4449fb0034fdaffa147e=
4de28ea
[7] https://github.com/v8/v8/commit/a26ca5ed147dde47f02d70c5b38d8befc1c93cb=
3
[8] https://github.com/nodejs/node/commit/6bd756d7c6dfb7dc25daee329ad70df68=
c14223e
[9] https://github.com/nodejs/node/commit/4da7bc915c714989eba7eab753db9eb9e=
bd8451a
[10] https://github.com/nodejs/node/commit/aa3a572e6bee116cde69508dc29478b4=
0f40551a

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                              |  0
 ...8.17.bb =3D> nodejs-oe-cache-native_20.5.bb} |  0
 .../nodejs/0001-Using-native-binaries.patch   | 19 ++++++++-
 ...-liftoff-Correct-function-signatures.patch | 42 +++++++------------
 ...Use-32bit-cast-for-operand-on-mips32.patch | 34 ---------------
 .../nodejs/nodejs/big-endian.patch            | 18 --------
 .../nodejs/nodejs/mips-less-memory.patch      | 37 ----------------
 .../{nodejs_18.17.1.bb =3D> nodejs_20.5.1.bb}   |  9 +---
 8 files changed, 34 insertions(+), 125 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.17 =3D> nodejs-=
oe-cache-20.5}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.17.bb =
=3D> nodejs-oe-cache-native_20.5.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32=
bit-cast-for-operand-on-mips32.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory=
.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_18.17.1.bb =3D> nodejs_20.5=
.1.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-c=
ache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-ca=
che
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.b=
b b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binar=
ies.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binari=
es.patch
index 66e10a0d0..0178cec77 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.pat=
ch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.pat=
ch
@@ -12,7 +12,7 @@ https://git.openembedded.org/meta-openembedded/commit/?id=
=3Dfeeb172d1a8bf010490d22

 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- node.gyp                 | 1 +
+ node.gyp                 | 3 +
  tools/v8_gypfiles/v8.gyp | 5 +++++
  2 files changed, 6 insertions(+)

@@ -28,6 +28,23 @@ index e8e1d9f9..e60ccc10 100644
                      '<(node_mksnapshot_exec)',
                      '<(node_snapshot_main)',
                    ],
+@@ -935,6 +935,7 @@
+           'action_name': 'node_js2c',
+           'process_outputs_as_sources': 1,
+           'inputs': [
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(node_js2c_exec)',
+             '<@(library_files)',
+             '<@(deps_files)',
+@@ -944,6 +945,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/node_javascript.cc',
+           ],
+           'action': [
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(node_js2c_exec)',
+             '<@(_outputs)',
+             'lib',
+
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
 index 42e26cd9..bc721991 100644
 --- a/tools/v8_gypfiles/v8.gyp
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-fu=
nction-signatures.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-lifto=
ff-Correct-function-signatures.patch
index c9a522d2e..5af87d866 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-=
signatures.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-=
signatures.patch
@@ -1,6 +1,6 @@
 From dc3652c0abcdf8573fd044907b19d8eda7ca1124 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Oct 2021 12:49:58 -0700
+Date: Mon, 3 Jul 2023 12:33:16 +0000
 Subject: [PATCH] [liftoff] Correct function signatures

 Fixes builds on mips where clang reports an error
@@ -13,16 +13,15 @@ Upstream-Status: Submitted [https://chromium-review.goo=
glesource.com/c/v8/v8/+/3
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
  deps/v8/src/wasm/baseline/liftoff-assembler.h               | 6 +++---
- deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h     | 2 +-
  deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h | 2 +-
- .../src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h   | 2 +-
- 4 files changed, 6 insertions(+), 6 deletions(-)
+ deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)

 diff --git a/deps/v8/src/wasm/baseline/liftoff-assembler.h b/deps/v8/src/w=
asm/baseline/liftoff-assembler.h
-index 22c7f73a..db4cb168 100644
+index aef63c64..f2a11b01 100644
 --- a/deps/v8/src/wasm/baseline/liftoff-assembler.h
 +++ b/deps/v8/src/wasm/baseline/liftoff-assembler.h
-@@ -646,7 +646,7 @@ class LiftoffAssembler : public TurboAssembler {
+@@ -717,7 +717,7 @@ class LiftoffAssembler : public MacroAssembler {
    void FinishCall(const ValueKindSig*, compiler::CallDescriptor*);

    // Move {src} into {dst}. {src} and {dst} must be different.
@@ -31,7 +30,7 @@ index 22c7f73a..db4cb168 100644

    // Parallel register move: For a list of tuples <dst, src, kind>, move =
the
    // {src} register of kind {kind} into {dst}. If {src} equals {dst}, ign=
ore
-@@ -795,8 +795,8 @@ class LiftoffAssembler : public TurboAssembler {
+@@ -884,8 +884,8 @@ class LiftoffAssembler : public MacroAssembler {
    inline void MoveStackValue(uint32_t dst_offset, uint32_t src_offset,
                               ValueKind);

@@ -42,24 +41,11 @@ index 22c7f73a..db4cb168 100644

    inline void Spill(int offset, LiftoffRegister, ValueKind);
    inline void Spill(int offset, WasmValue);
-diff --git a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h b/dep=
s/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
-index c76fd2f4..0fffe231 100644
---- a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
-+++ b/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
-@@ -661,7 +661,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,
-     pinned =3D pinned | LiftoffRegList{dst_op.rm(), src};
-     LiftoffRegister tmp =3D GetUnusedRegister(src.reg_class(), pinned);
-     // Save original value.
--    Move(tmp, src, type.value_type());
-+    Move(tmp, src, type.value_type().kind());
-
-     src =3D tmp;
-     pinned.set(tmp);
 diff --git a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h b=
/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
-index 36413545..48207337 100644
+index 96cba24c..53e1842d 100644
 --- a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
 +++ b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
-@@ -593,7 +593,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,
+@@ -592,7 +592,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp =3D GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
@@ -68,11 +54,11 @@ index 36413545..48207337 100644

      src =3D tmp;
      pinned.set(tmp);
-diff --git a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h=
 b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
-index 642a7d2a..56ffcc2a 100644
---- a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
-+++ b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
-@@ -589,7 +589,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,
+diff --git a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h b=
/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h
+index 1d6ae09e..397e82b2 100644
+--- a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h
++++ b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h
+@@ -286,7 +286,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp =3D GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
@@ -82,4 +68,4 @@ index 642a7d2a..56ffcc2a 100644
      src =3D tmp;
      pinned.set(tmp);
 --
-2.34.1
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cas=
t-for-operand-on-mips32.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001=
-mips-Use-32bit-cast-for-operand-on-mips32.patch
deleted file mode 100644
index a0242d8e1..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-o=
perand-on-mips32.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e65dde8db17da5acddeef7eb9316199c4e5e0811 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 Apr 2022 12:40:25 -0700
-Subject: [PATCH] mips: Use 32bit cast for operand on mips32
-
-Fixes
-deps/v8/src/compiler/backend/mips/code-generator-mips.cc: In member functi=
on 'void v8::internal::compiler::CodeGenerator::AssembleReturn(v8::internal=
::compiler::InstructionOperand*)':
-../deps/v8/src/compiler/backend/mips/code-generator-mips.cc:4233:48: error=
: call of overloaded 'Operand(int64_t)' is ambiguous
- 4233 |                 Operand(static_cast<int64_t>(0)));
-      |                                                ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- deps/v8/src/compiler/backend/mips/code-generator-mips.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/v8/src/compiler/backend/mips/code-generator-mips.cc b/de=
ps/v8/src/compiler/backend/mips/code-generator-mips.cc
-index 2b8197e..b226140 100644
---- a/deps/v8/src/compiler/backend/mips/code-generator-mips.cc
-+++ b/deps/v8/src/compiler/backend/mips/code-generator-mips.cc
-@@ -4230,7 +4230,7 @@ void CodeGenerator::AssembleReturn(InstructionOperan=
d* additional_pop_count) {
-     } else if (FLAG_debug_code) {
-       __ Assert(eq, AbortReason::kUnexpectedAdditionalPopValue,
-                 g.ToRegister(additional_pop_count),
--                Operand(static_cast<int64_t>(0)));
-+                Operand(static_cast<int32_t>(0)));
-     }
-   }
-   // Functions with JS linkage have at least one parameter (the receiver)=
.
---
-2.36.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch b/meta=
-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
deleted file mode 100644
index 529381842..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-https://github.com/v8/v8/commit/878ccb33bd3cf0e6dc018ff8d15843f585ac07be
-
-did some automated cleanups but it missed big-endian code.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/deps/v8/src/runtime/runtime-utils.h
-+++ b/deps/v8/src/runtime/runtime-utils.h
-@@ -126,7 +126,7 @@ static inline ObjectPair MakePair(Object
- #if defined(V8_TARGET_LITTLE_ENDIAN)
-   return x.ptr() | (static_cast<ObjectPair>(y.ptr()) << 32);
- #elif defined(V8_TARGET_BIG_ENDIAN)
--  return y->ptr() | (static_cast<ObjectPair>(x->ptr()) << 32);
-+  return y.ptr() | (static_cast<ObjectPair>(x.ptr()) << 32);
- #else
- #error Unknown endianness
- #endif
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch =
b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
deleted file mode 100644
index 16776cb76..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Description: mksnapshot uses too much memory on 32-bit mipsel
-Author: J=E9r=E9my Lal <kapouer@melix.org>
-Last-Update: 2020-06-03
-Forwarded: https://bugs.chromium.org/p/v8/issues/detail?id=3D10586
-
-This ensures that we reserve 500M instead of 2G range for codegen
-ensures that qemu-mips can allocate such large ranges
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Imported from debian https://salsa.debian.org/js-team/nodejs/-/blob/master=
-12.x/debian/patches/mips-less-memory.patch
-https://buildd.debian.org/status/fetch.php?pkg=3Dnodejs&arch=3Dmipsel&ver=
=3D12.17.0~dfsg-2&stamp=3D1591050388&raw=3D0
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/deps/v8/src/common/globals.h
-+++ b/deps/v8/src/common/globals.h
-@@ -224,7 +224,7 @@ constexpr size_t kMinimumCodeRangeSize =3D
- constexpr size_t kMinExpectedOSPageSize =3D 64 * KB;  // OS page on PPC L=
inux
- #elif V8_TARGET_ARCH_MIPS
- constexpr bool kPlatformRequiresCodeRange =3D false;
--constexpr size_t kMaximalCodeRangeSize =3D 2048LL * MB;
-+constexpr size_t kMaximalCodeRangeSize =3D 512 * MB;
- constexpr size_t kMinimumCodeRangeSize =3D 0 * MB;
- constexpr size_t kMinExpectedOSPageSize =3D 4 * KB;  // OS page.
- #else
---- a/deps/v8/src/codegen/mips/constants-mips.h
-+++ b/deps/v8/src/codegen/mips/constants-mips.h
-@@ -140,7 +140,7 @@ const uint32_t kLeastSignificantByteInIn
- namespace v8 {
- namespace internal {
-
--constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 4096;
-+constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 1024;
-
- // ----------------------------------------------------------------------=
-------
- // Registers and FPURegisters.
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_20.5.1.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.5.1.bb
index ee5e848bf..6bb0f7fab 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.5.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE =3D "http://nodejs.org"
 LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apac=
he-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbc1f9ebe76be76f163e3b675303ad9c=
d"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D059ecf3a6f87111685e51b611b9563e=
5"

 CVE_PRODUCT =3D "nodejs node.js"

@@ -22,11 +22,8 @@ COMPATIBLE_HOST:powerpc =3D "null"
 SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
-           file://big-endian.patch \
-           file://mips-less-memory.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
-           file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            file://run-ptest \
            "

@@ -39,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 =3D " \
 SRC_URI:append:toolchain-clang:powerpc64le =3D " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] =3D "f215cf03d0f00f07ac0b674c6819f804c1542e16f152da0498=
0022aeccf5e65a"
+SRC_URI[sha256sum] =3D "439c71aa2f38c2861657bfa538e99191a571258066cbfd4548=
586049c8134190"

 S =3D "${WORKDIR}/node-v${PV}"

@@ -148,8 +145,6 @@ do_configure () {
     # $TARGET_ARCH settings don't match --dest-cpu settings
     python3 configure.py --verbose --prefix=3D${prefix} \
                --shared-openssl \
-               --without-dtrace \
-               --without-etw \
                --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d=
)}" \
                --dest-os=3Dlinux \
                --libdir=3D${baselib} \
--
2.40.0


--_000_MW4PR11MB58220042C32020C11D6DBF1584C1AMW4PR11MB5822namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Is there any issue with this patch.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
-Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 01 September 2023 21:42<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -&gt; 20.5=
.1</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Update to latest release of latest LTS 20 release<=
br>
<br>
&nbsp;&nbsp;&nbsp; * node v20 introduces several new features and fixes man=
y bugs and CVEs as shown in [1]<br>
<br>
&nbsp;&nbsp;&nbsp; * Refresh 0001-liftoff-Correct-function-signatures.patch=
 against 20.5.1<br>
<br>
&nbsp;&nbsp;&nbsp; * License-Update:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Change zlib version 1.2.13, October =
13th, 2022 to version 1.2.13.1, October xxth, 2022 [2]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Change Copyright 2023 from Ada autho=
rs to Yagiz Nizipli and Daniel Lemire [4]<br>
<br>
&nbsp;&nbsp;&nbsp; * Remove big-endian.patch as it is merged in v20.x [5] [=
6]<br>
<br>
&nbsp;&nbsp;&nbsp; * Remove below list of patches since mips32 is deleted f=
rom v8 as part of update V8 to 10.7.193.13 [7] [8]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - mips-less-memory.patch<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 0001-mips-Use-32bit-cast-for-operand=
-on-mips32.patch<br>
<br>
&nbsp;&nbsp;&nbsp; * Update Using-native-binaries.patch for node_js2c, it r=
esolved below do_compile error [9]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Error:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /bin/sh: line 1: build/tmp/work/core2-=
64-poky-linux/nodejs/20.5.1/node-v20.5.1/out/Release/node_js2c: No such fil=
e or directory<br>
<br>
&nbsp;&nbsp;&nbsp; * Remove obsolete dtrace &amp; etw configure options (we=
 had: --without-&lt;feature&gt;) from the recipe [10]<br>
<br>
<a href=3D"https://github.com/nodejs/node/releases/tag/v20.5.1">https://git=
hub.com/nodejs/node/releases/tag/v20.5.1</a><br>
<br>
[1] <a href=3D"https://github.com/nodejs/node/blob/main/doc/changelogs/CHAN=
GELOG_V20.md">
https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V20.md</a=
><br>
[2] <a href=3D"https://github.com/nodejs/node/commit/f1007325753e62b13083f6=
e9e499fdc33f753d7d">
https://github.com/nodejs/node/commit/f1007325753e62b13083f6e9e499fdc33f753=
d7d</a><br>
[3] <a href=3D"https://github.com/nodejs/node/commit/900ae1bda76caaa7213431=
a5268560b578ed2d55">
https://github.com/nodejs/node/commit/900ae1bda76caaa7213431a5268560b578ed2=
d55</a><br>
[4] <a href=3D"https://github.com/nodejs/node/commit/d2465369243bc4313d9840=
b62c2393c4f179ffbb">
https://github.com/nodejs/node/commit/d2465369243bc4313d9840b62c2393c4f179f=
fbb</a><br>
[5] <a href=3D"https://github.com/v8/v8/commit/3cea5d5425c3a0d7d1768b375826=
9ac98875de77">
https://github.com/v8/v8/commit/3cea5d5425c3a0d7d1768b3758269ac98875de77</a=
><br>
[6] <a href=3D"https://github.com/nodejs/node/commit/f226350fcbebd4449fb003=
4fdaffa147e4de28ea">
https://github.com/nodejs/node/commit/f226350fcbebd4449fb0034fdaffa147e4de2=
8ea</a><br>
[7] <a href=3D"https://github.com/v8/v8/commit/a26ca5ed147dde47f02d70c5b38d=
8befc1c93cb3">
https://github.com/v8/v8/commit/a26ca5ed147dde47f02d70c5b38d8befc1c93cb3</a=
><br>
[8] <a href=3D"https://github.com/nodejs/node/commit/6bd756d7c6dfb7dc25daee=
329ad70df68c14223e">
https://github.com/nodejs/node/commit/6bd756d7c6dfb7dc25daee329ad70df68c142=
23e</a><br>
[9] <a href=3D"https://github.com/nodejs/node/commit/4da7bc915c714989eba7ea=
b753db9eb9ebd8451a">
https://github.com/nodejs/node/commit/4da7bc915c714989eba7eab753db9eb9ebd84=
51a</a><br>
[10] <a href=3D"https://github.com/nodejs/node/commit/aa3a572e6bee116cde695=
08dc29478b40f40551a">
https://github.com/nodejs/node/commit/aa3a572e6bee116cde69508dc29478b40f405=
51a</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../oe-npm-cache&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 0<br>
&nbsp;...8.17.bb =3D&gt; nodejs-oe-cache-native_20.5.bb} |&nbsp; 0<br>
&nbsp;.../nodejs/0001-Using-native-binaries.patch&nbsp;&nbsp; | 19 ++++++++=
-<br>
&nbsp;...-liftoff-Correct-function-signatures.patch | 42 +++++++-----------=
-<br>
&nbsp;...Use-32bit-cast-for-operand-on-mips32.patch | 34 ---------------<br=
>
&nbsp;.../nodejs/nodejs/big-endian.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 18 --------<br>
&nbsp;.../nodejs/nodejs/mips-less-memory.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 37 ----------------<br>
&nbsp;.../{nodejs_18.17.1.bb =3D&gt; nodejs_20.5.1.bb}&nbsp;&nbsp; |&nbsp; =
9 +---<br>
&nbsp;8 files changed, 34 insertions(+), 125 deletions(-)<br>
&nbsp;rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.17 =3D&gt;=
 nodejs-oe-cache-20.5}/oe-npm-cache (100%)<br>
&nbsp;rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.17.=
bb =3D&gt; nodejs-oe-cache-native_20.5.bb} (100%)<br>
&nbsp;delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-U=
se-32bit-cast-for-operand-on-mips32.patch<br>
&nbsp;delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/big-endian.=
patch<br>
&nbsp;delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/mips-less-m=
emory.patch<br>
&nbsp;rename meta-oe/recipes-devtools/nodejs/{nodejs_18.17.1.bb =3D&gt; nod=
ejs_20.5.1.bb} (94%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-c=
ache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-cache<br=
>
similarity index 100%<br>
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-ca=
che<br>
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-cache=
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.b=
b b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.bb<br>
similarity index 100%<br>
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.bb=
<br>
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.bb<br=
>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binar=
ies.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binari=
es.patch<br>
index 66e10a0d0..0178cec77 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.pat=
ch<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.pat=
ch<br>
@@ -12,7 +12,7 @@ <a href=3D"https://git.openembedded.org/meta-openembedded=
/commit/?id=3Dfeeb172d1a8bf010490d22">
https://git.openembedded.org/meta-openembedded/commit/?id=3Dfeeb172d1a8bf01=
0490d22</a><br>
&nbsp;<br>
&nbsp;Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.co=
m&gt;<br>
&nbsp;---<br>
- node.gyp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 +<br>
+ node.gyp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 +<br>
&nbsp; tools/v8_gypfiles/v8.gyp | 5 +++++<br>
&nbsp; 2 files changed, 6 insertions(+)<br>
&nbsp;<br>
@@ -28,6 +28,23 @@ index e8e1d9f9..e60ccc10 100644<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '&lt;(node_mksnapshot_e=
xec)',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '&lt;(node_snapshot_mai=
n)',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
+@@ -935,6 +935,7 @@<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'action_name'=
: 'node_js2c',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'process_outp=
uts_as_sources': 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'inputs': [<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '&lt;(=
PRODUCT_DIR)/v8-qemu-wrapper.sh',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '=
&lt;(node_js2c_exec)',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '=
&lt;@(library_files)',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '=
&lt;@(deps_files)',<br>
+@@ -944,6 +945,7 @@<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '=
&lt;(SHARED_INTERMEDIATE_DIR)/node_javascript.cc',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'action': [<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '&lt;(=
PRODUCT_DIR)/v8-qemu-wrapper.sh',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '=
&lt;(node_js2c_exec)',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '=
&lt;@(_outputs)',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '=
lib',<br>
+<br>
&nbsp;diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp<br>
&nbsp;index 42e26cd9..bc721991 100644<br>
&nbsp;--- a/tools/v8_gypfiles/v8.gyp<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-fu=
nction-signatures.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-lifto=
ff-Correct-function-signatures.patch<br>
index c9a522d2e..5af87d866 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-=
signatures.patch<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-=
signatures.patch<br>
@@ -1,6 +1,6 @@<br>
&nbsp;From dc3652c0abcdf8573fd044907b19d8eda7ca1124 Mon Sep 17 00:00:00 200=
1<br>
&nbsp;From: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
-Date: Wed, 20 Oct 2021 12:49:58 -0700<br>
+Date: Mon, 3 Jul 2023 12:33:16 +0000<br>
&nbsp;Subject: [PATCH] [liftoff] Correct function signatures<br>
&nbsp;<br>
&nbsp;Fixes builds on mips where clang reports an error<br>
@@ -13,16 +13,15 @@ Upstream-Status: Submitted [<a href=3D""></a>https://ch=
romium-review.googlesource.com/c/v8/v8/+/3<br>
&nbsp;Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.co=
m&gt;<br>
&nbsp;---<br>
&nbsp; deps/v8/src/wasm/baseline/liftoff-assembler.h&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 6 +++---<br=
>
- deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h&nbsp;&nbsp;&nbsp;=
&nbsp; | 2 +-<br>
&nbsp; deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h | 2 +-<b=
r>
- .../src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h&nbsp;&nbsp; | 2=
 +-<br>
- 4 files changed, 6 insertions(+), 6 deletions(-)<br>
+ deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h | 2 +-<br>
+ 3 files changed, 5 insertions(+), 5 deletions(-)<br>
&nbsp;<br>
&nbsp;diff --git a/deps/v8/src/wasm/baseline/liftoff-assembler.h b/deps/v8/=
src/wasm/baseline/liftoff-assembler.h<br>
-index 22c7f73a..db4cb168 100644<br>
+index aef63c64..f2a11b01 100644<br>
&nbsp;--- a/deps/v8/src/wasm/baseline/liftoff-assembler.h<br>
&nbsp;+++ b/deps/v8/src/wasm/baseline/liftoff-assembler.h<br>
-@@ -646,7 +646,7 @@ class LiftoffAssembler : public TurboAssembler {<br>
+@@ -717,7 +717,7 @@ class LiftoffAssembler : public MacroAssembler {<br>
&nbsp;&nbsp;&nbsp; void FinishCall(const ValueKindSig*, compiler::CallDescr=
iptor*);<br>
&nbsp; <br>
&nbsp;&nbsp;&nbsp; // Move {src} into {dst}. {src} and {dst} must be differ=
ent.<br>
@@ -31,7 +30,7 @@ index 22c7f73a..db4cb168 100644<br>
&nbsp; <br>
&nbsp;&nbsp;&nbsp; // Parallel register move: For a list of tuples &lt;dst,=
 src, kind&gt;, move the<br>
&nbsp;&nbsp;&nbsp; // {src} register of kind {kind} into {dst}. If {src} eq=
uals {dst}, ignore<br>
-@@ -795,8 +795,8 @@ class LiftoffAssembler : public TurboAssembler {<br>
+@@ -884,8 +884,8 @@ class LiftoffAssembler : public MacroAssembler {<br>
&nbsp;&nbsp;&nbsp; inline void MoveStackValue(uint32_t dst_offset, uint32_t=
 src_offset,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ValueKind);<br>
&nbsp; <br>
@@ -42,24 +41,11 @@ index 22c7f73a..db4cb168 100644<br>
&nbsp; <br>
&nbsp;&nbsp;&nbsp; inline void Spill(int offset, LiftoffRegister, ValueKind=
);<br>
&nbsp;&nbsp;&nbsp; inline void Spill(int offset, WasmValue);<br>
-diff --git a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h b/dep=
s/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h<br>
-index c76fd2f4..0fffe231 100644<br>
---- a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h<br>
-+++ b/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h<br>
-@@ -661,7 +661,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,<br>
-&nbsp;&nbsp;&nbsp;&nbsp; pinned =3D pinned | LiftoffRegList{dst_op.rm(), s=
rc};<br>
-&nbsp;&nbsp;&nbsp;&nbsp; LiftoffRegister tmp =3D GetUnusedRegister(src.reg=
_class(), pinned);<br>
-&nbsp;&nbsp;&nbsp;&nbsp; // Save original value.<br>
--&nbsp;&nbsp;&nbsp; Move(tmp, src, type.value_type());<br>
-+&nbsp;&nbsp;&nbsp; Move(tmp, src, type.value_type().kind());<br>
- <br>
-&nbsp;&nbsp;&nbsp;&nbsp; src =3D tmp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp; pinned.set(tmp);<br>
&nbsp;diff --git a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips6=
4.h b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h<br>
-index 36413545..48207337 100644<br>
+index 96cba24c..53e1842d 100644<br>
&nbsp;--- a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h<br>
&nbsp;+++ b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h<br>
-@@ -593,7 +593,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,<br>
+@@ -592,7 +592,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinned.set(dst_op.rm());<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LiftoffRegister tmp =3D GetUnusedRegister(sr=
c.reg_class(), pinned);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Save original value.<br>
@@ -68,11 +54,11 @@ index 36413545..48207337 100644<br>
&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src =3D tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinned.set(tmp);<br>
-diff --git a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h=
 b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h<br>
-index 642a7d2a..56ffcc2a 100644<br>
---- a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h<br>
-+++ b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h<br>
-@@ -589,7 +589,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,<br>
+diff --git a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h b=
/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h<br>
+index 1d6ae09e..397e82b2 100644<br>
+--- a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h<br>
++++ b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h<br>
+@@ -286,7 +286,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regist=
er offset_reg,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinned.set(dst_op.rm());<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LiftoffRegister tmp =3D GetUnusedRegister(sr=
c.reg_class(), pinned);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Save original value.<br>
@@ -82,4 +68,4 @@ index 642a7d2a..56ffcc2a 100644<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src =3D tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinned.set(tmp);<br>
&nbsp;--<br>
-2.34.1<br>
+2.40.0<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cas=
t-for-operand-on-mips32.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001=
-mips-Use-32bit-cast-for-operand-on-mips32.patch<br>
deleted file mode 100644<br>
index a0242d8e1..000000000<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-o=
perand-on-mips32.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From e65dde8db17da5acddeef7eb9316199c4e5e0811 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
-Date: Tue, 19 Apr 2022 12:40:25 -0700<br>
-Subject: [PATCH] mips: Use 32bit cast for operand on mips32<br>
-<br>
-Fixes<br>
-deps/v8/src/compiler/backend/mips/code-generator-mips.cc: In member functi=
on 'void v8::internal::compiler::CodeGenerator::AssembleReturn(v8::internal=
::compiler::InstructionOperand*)':<br>
-../deps/v8/src/compiler/backend/mips/code-generator-mips.cc:4233:48: error=
: call of overloaded 'Operand(int64_t)' is ambiguous<br>
- 4233 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Operand(static_cast&lt;int64_t&gt;(0)));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ^<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
----<br>
- deps/v8/src/compiler/backend/mips/code-generator-mips.cc | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/deps/v8/src/compiler/backend/mips/code-generator-mips.cc b/de=
ps/v8/src/compiler/backend/mips/code-generator-mips.cc<br>
-index 2b8197e..b226140 100644<br>
---- a/deps/v8/src/compiler/backend/mips/code-generator-mips.cc<br>
-+++ b/deps/v8/src/compiler/backend/mips/code-generator-mips.cc<br>
-@@ -4230,7 +4230,7 @@ void CodeGenerator::AssembleReturn(InstructionOperan=
d* additional_pop_count) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp; } else if (FLAG_debug_code) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __ Assert(eq, AbortReason::kUnexpecte=
dAdditionalPopValue,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; g.ToRegister(additional_pop_count),<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; Operand(static_cast&lt;int64_t&gt;(0)));<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; Operand(static_cast&lt;int32_t&gt;(0)));<br>
-&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp; }<br>
-&nbsp;&nbsp; // Functions with JS linkage have at least one parameter (the=
 receiver).<br>
--- <br>
-2.36.0<br>
-<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch b/meta=
-oe/recipes-devtools/nodejs/nodejs/big-endian.patch<br>
deleted file mode 100644<br>
index 529381842..000000000<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-<br>
-https://github.com/v8/v8/commit/878ccb33bd3cf0e6dc018ff8d15843f585ac07be<b=
r>
-<br>
-did some automated cleanups but it missed big-endian code.<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
---- a/deps/v8/src/runtime/runtime-utils.h<br>
-+++ b/deps/v8/src/runtime/runtime-utils.h<br>
-@@ -126,7 +126,7 @@ static inline ObjectPair MakePair(Object<br>
- #if defined(V8_TARGET_LITTLE_ENDIAN)<br>
-&nbsp;&nbsp; return x.ptr() | (static_cast&lt;ObjectPair&gt;(y.ptr()) &lt;=
&lt; 32);<br>
- #elif defined(V8_TARGET_BIG_ENDIAN)<br>
--&nbsp; return y-&gt;ptr() | (static_cast&lt;ObjectPair&gt;(x-&gt;ptr()) &=
lt;&lt; 32);<br>
-+&nbsp; return y.ptr() | (static_cast&lt;ObjectPair&gt;(x.ptr()) &lt;&lt; =
32);<br>
- #else<br>
- #error Unknown endianness<br>
- #endif<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch =
b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch<br>
deleted file mode 100644<br>
index 16776cb76..000000000<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-Description: mksnapshot uses too much memory on 32-bit mipsel<br>
-Author: J=E9r=E9my Lal &lt;kapouer@melix.org&gt;<br>
-Last-Update: 2020-06-03<br>
-Forwarded: <a href=3D"https://bugs.chromium.org/p/v8/issues/detail?id=3D10=
586">https://bugs.chromium.org/p/v8/issues/detail?id=3D10586</a><br>
-<br>
-This ensures that we reserve 500M instead of 2G range for codegen<br>
-ensures that qemu-mips can allocate such large ranges<br>
-<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-Imported from debian <a href=3D"https://salsa.debian.org/js-team/nodejs/-/=
blob/master-12.x/debian/patches/mips-less-memory.patch">
https://salsa.debian.org/js-team/nodejs/-/blob/master-12.x/debian/patches/m=
ips-less-memory.patch</a><br>
-https://buildd.debian.org/status/fetch.php?pkg=3Dnodejs&amp;arch=3Dmipsel&=
amp;ver=3D12.17.0~dfsg-2&amp;stamp=3D1591050388&amp;raw=3D0<br>
-<br>
-Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
-<br>
---- a/deps/v8/src/common/globals.h<br>
-+++ b/deps/v8/src/common/globals.h<br>
-@@ -224,7 +224,7 @@ constexpr size_t kMinimumCodeRangeSize =3D<br>
- constexpr size_t kMinExpectedOSPageSize =3D 64 * KB;&nbsp; // OS page on =
PPC Linux<br>
- #elif V8_TARGET_ARCH_MIPS<br>
- constexpr bool kPlatformRequiresCodeRange =3D false;<br>
--constexpr size_t kMaximalCodeRangeSize =3D 2048LL * MB;<br>
-+constexpr size_t kMaximalCodeRangeSize =3D 512 * MB;<br>
- constexpr size_t kMinimumCodeRangeSize =3D 0 * MB;<br>
- constexpr size_t kMinExpectedOSPageSize =3D 4 * KB;&nbsp; // OS page.<br>
- #else<br>
---- a/deps/v8/src/codegen/mips/constants-mips.h<br>
-+++ b/deps/v8/src/codegen/mips/constants-mips.h<br>
-@@ -140,7 +140,7 @@ const uint32_t kLeastSignificantByteInIn<br>
- namespace v8 {<br>
- namespace internal {<br>
- <br>
--constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 4096;<br>
-+constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 1024;<br>
- <br>
- // ----------------------------------------------------------------------=
-------<br>
- // Registers and FPURegisters.<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_20.5.1.bb<br>
similarity index 94%<br>
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb<br>
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.5.1.bb<br>
index ee5e848bf..6bb0f7fab 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.5.1.bb<br>
@@ -1,7 +1,7 @@<br>
&nbsp;DESCRIPTION =3D &quot;nodeJS Evented I/O for V8 JavaScript&quot;<br>
&nbsp;HOMEPAGE =3D &quot;<a href=3D"http://nodejs.org">http://nodejs.org</a=
>&quot;<br>
&nbsp;LICENSE =3D &quot;MIT &amp; ISC &amp; BSD-2-Clause &amp; BSD-3-Clause=
 &amp; Artistic-2.0 &amp; Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3Dbc1f9ebe76be76f=
163e3b675303ad9cd">file://LICENSE;md5=3Dbc1f9ebe76be76f163e3b675303ad9cd</a=
>&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3D059ecf3a6f87111=
685e51b611b9563e5">file://LICENSE;md5=3D059ecf3a6f87111685e51b611b9563e5</a=
>&quot;<br>
&nbsp;<br>
&nbsp;CVE_PRODUCT =3D &quot;nodejs node.js&quot;<br>
&nbsp;<br>
@@ -22,11 +22,8 @@ COMPATIBLE_HOST:powerpc =3D &quot;null&quot;<br>
&nbsp;SRC_URI =3D &quot;<a href=3D""></a>http://nodejs.org/dist/v${PV}/node=
-v${PV}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Disable-running-gyp-files-for-bundled-deps.patch">
file://0001-Disable-running-gyp-files-for-bundled-deps.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0004-v8-don-t-override-ARM-CFLAGS.patch">file://0004-v8-don-t-ov=
erride-ARM-CFLAGS.patch</a> \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://big-endian.patch">file://big-endian.patch</a> \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://mips-less-memory.patch">file://mips-less-memory.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://system-c-ares.patch">file://system-c-ares.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-liftoff-Correct-function-signatures.patch">file://0001-lift=
off-Correct-function-signatures.patch</a> \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch">
file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
@@ -39,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 =3D &quot; \<br>
&nbsp;SRC_URI:append:toolchain-clang:powerpc64le =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch">
file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
-SRC_URI[sha256sum] =3D &quot;f215cf03d0f00f07ac0b674c6819f804c1542e16f152d=
a04980022aeccf5e65a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;439c71aa2f38c2861657bfa538e99191a571258066cbf=
d4548586049c8134190&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/node-v${PV}&quot;<br>
&nbsp;<br>
@@ -148,8 +145,6 @@ do_configure () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; # $TARGET_ARCH settings don't match --dest-cpu set=
tings<br>
&nbsp;&nbsp;&nbsp;&nbsp; python3 configure.py --verbose --prefix=3D${prefix=
} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; --shared-openssl \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; --without-dtrace \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; --without-etw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; --dest-cpu=3D&quot;${@map_nodejs_arch(d.getVar('TARGET_ARCH=
'), d)}&quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; --dest-os=3Dlinux \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; --libdir=3D${baselib} \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58220042C32020C11D6DBF1584C1AMW4PR11MB5822namp_--

