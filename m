Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B059E65D19
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 03:12:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16625.1732245125526449510
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 19:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105672805c=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM3C4QB027246;
	Fri, 22 Nov 2024 03:12:04 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8ebsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 03:12:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ+jLVBGjUlYadQ/eyc0gRAD2hjy3a7IUyk6YQuAt0mf7EtW41rX94FarAWoeQaTW3DwwcOZK8wYDtFMxhcdnalBqpZpVGLQDakcvy0FdbI6TWMtb/GpQZYEvD56B2UoMvOxAn60ht5JqrmyHp2sPV06SELLGeKGSIXqRTg76i4JqdESnyIig+SaL5JIiJOGN0muMdLtMs7sk9kqCbR+hvXZZLkUhGJYhzT5cbQ8+9q/CWEkV/PqoLIxfUMUFvCVLPORrNHLyzwPWfZA96QypseBtxXXm4mg8pKCKJOntNOc0pILhmMUNt3KB1jnV8AS7+v2sztaj1SnO7BSJxHghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY3qf10gnaZT4H9qlXiK9r74xFddlCziJOQwRZjKzVo=;
 b=Ac5QlUlfFBYe04UTq3iLq/WoypC8RCAIa3fOe536mwfqbRrhnIp7o/i5aGQjV4pNyjLVl8tvuRDVrLLYGnOyyyyWoqtmNILKIxHwOMQwmwas2CRIE/Mih089J5D9GQYVngcAh3h2IxzhHGjgQES7mmBpRuBeERdanuXESLMkYbxNAXl84aEKecOXn3Xdjv2O/9noE+zqHuiQirr2tXXIM0hovsEAS0CMfkVhaH61MFrfuYQyLt74iogOx9zWY20kHju04Ph4D+VnaTHvY2lk1kSOmfc9OjDYrjZhHK8C2zlR+OoVrZ40wIsW3S62a+PgZn7E4j24fd+PJTVE8LjCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by SN7PR11MB6559.namprd11.prod.outlook.com (2603:10b6:806:26d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Fri, 22 Nov
 2024 03:12:00 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%3]) with mapi id 15.20.8158.021; Fri, 22 Nov 2024
 03:12:00 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Li, Changqing" <Changqing.Li@windriver.com>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] tcpreplay: fix
 CVE-2023-43279
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] tcpreplay: fix
 CVE-2023-43279
Thread-Index: AQHbMCExhAYL39e94EKPLuPa8GX/ErLCuBLw
Date: Fri, 22 Nov 2024 03:12:00 +0000
Message-ID: 
 <PH8PR11MB692884601E91C8CCFD136F91B8232@PH8PR11MB6928.namprd11.prod.outlook.com>
References: <180551EA85615952.24513@lists.openembedded.org>
In-Reply-To: <180551EA85615952.24513@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|SN7PR11MB6559:EE_
x-ms-office365-filtering-correlation-id: 67036a85-8639-446f-fd1a-08dd0aa36e34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?+pPdfZ69KEMlCXiB5J1DCwbfX2sD87SJtoTQ/NLVUJHn22a22LB4PcdiBgOM?=
 =?us-ascii?Q?ILLu2CPDgHmW9ELqfzFXUIS6nAu0yp5nf6+yCM2Flq+cPcsjTAv0rvUU+CaU?=
 =?us-ascii?Q?hO59ruIo4S+9GgHpWHoqanUtjc1MbR8LjIMvtxhueIZJCogE5a2Qlet3M/D+?=
 =?us-ascii?Q?tr6gBYkhQA+fvXJ862R+zW+WZo83bTiS4gUd9bBCYsLDy/PUYPVvOiSjNxOO?=
 =?us-ascii?Q?FfLo03xtBbxTGl5cD+k+mpYIuWNVD5H8ggNusBTgQdVx2oLZURFL7DT5t57r?=
 =?us-ascii?Q?Db1mwYq3rd37r6uoS+0rekDNwjaMjPzq4gJ1BF2mFV/SFPT5aMgnJiZbk9df?=
 =?us-ascii?Q?wfshUGZxxxK/avRRnBTu2AcHXSNkW1tK1MuYEZRLYj4lYYhxAX5Nbh3OukjO?=
 =?us-ascii?Q?hC9AafAl6CQtuHLIQesaXMRHalu79t+v5WwC0F2Ow0Nsqm5Ysd+IP3A4FLXQ?=
 =?us-ascii?Q?cSMINUbdol0TYeAdXUjToKmLgudkagqFoU+3dv/LquPq5rjgGi3A3ok0J9fS?=
 =?us-ascii?Q?ejwcVh6dzAXaDcNG1UCH12xYQR23uOQ2ax5Bjw+dqlTOmBHgaaf5/j52EXZj?=
 =?us-ascii?Q?DdpUYvusy0Y3VxqBMeBotAsyXe4jPLqSDQNeWnGo73v5fIFfcCTcQEBsJiht?=
 =?us-ascii?Q?ODA4XlvZKbcr1/mrMiiOWRKbnsK9Wqo+6/MxhsWxa6AMjKQlVAS2npz/3o9y?=
 =?us-ascii?Q?T1kyS9J4dMw6SybewSls4QVfGxWMv5T0SkIatUNOSWvKf3jGHrWxN4DaZnpX?=
 =?us-ascii?Q?/9+E1+X+OU3MXD25TGD5DnnyjUGRfqghjV1Yyc6viQv8AEBsy6cDVNOjOzzs?=
 =?us-ascii?Q?A94HcGGBFfiC8yPi6r/c1/vUAWSgxkajrpzIwgBwkxXXvL4vBfGVPvFNIptM?=
 =?us-ascii?Q?X4OViWhKxj+8fU+jkE9fzn4Hj0BpX1Xn6v72XqG27DIjVRSEVj33H/XveScj?=
 =?us-ascii?Q?VH2T96TSLcpeeUoMSM8I2fVaX4JcRpZUZFEbdN/M4ISRiawmImguh4u0rISg?=
 =?us-ascii?Q?1ffw6yVvL5uys2HrLC45cjB8isXDYXfrdtcy/dZZyeZI9jViZmcVFFQoVcsb?=
 =?us-ascii?Q?Yc/2nWULczX5Lfb9b6IKoRVbu36ELO+uz1B0dkQEn2N8wGJ/CJQu3A4DDh5+?=
 =?us-ascii?Q?xfTTtGilf0aEfGiVrnpXceB7nYZSYMEyG5xWizGmrWJ+nDs0dGCQ8AvLP+vn?=
 =?us-ascii?Q?oyYORy4Fr9JEILEf644efJ1D3Yl9MZHJuby5wMxwg/le2f55+Ds+Wqe2n7kB?=
 =?us-ascii?Q?aRQ1TLnTrtxqJM57xpa5tTDpxe8q90cO7W0VNLJCTwcLTyGyVMAxNf+aEfqY?=
 =?us-ascii?Q?3kvnxIH7iC1cKtSI5C7k6BogmexdOAQME69HAH/yTg+tVQHr+n2o9iBxH8aI?=
 =?us-ascii?Q?1auhh0E0+6ut6lo/ahFffDW3jZSO?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?x4IaVOJzISgTsYQpJTIjxXID8CBaKTS9JMHfeysvH2GQgtTHrKi8TtYkhSiV?=
 =?us-ascii?Q?zp+aAcx+Y7xvmiT7Z8hbVAmkPIF1AUQlRQR/ealISqun/KlQ+JPtUPrK2C9r?=
 =?us-ascii?Q?AYxBcd7MuT/1A9gplRkxYd9MwnPJEZhkUE1I8p92KhTwL7Q/wz/M9XhA7pi/?=
 =?us-ascii?Q?WpvckCRGgOA5pBTfKuq2Xe7ss8SJ+oV9/IliTHRjSNsRkczvlD4MTfxya8QQ?=
 =?us-ascii?Q?WGJMyOiYBDzXTQfriigPToqa36xU+DhZrqkWxg5y7qPfI5j42fxZHWU0Ym72?=
 =?us-ascii?Q?YOJsvNeFsCmK3UJXYUW+bhXsWSiTdSNSiOxQQX89pC5db+fpKAwCI6LVpp/S?=
 =?us-ascii?Q?Z3V7+ZomjHqC05xqscIpLPP1xhjF1SRQt92CqB5peZ96oBimKuN7JpfHdXrX?=
 =?us-ascii?Q?Xc4maaVLXQOq+oYhfmGQ5xuPABe743iNctE+yHQA37raScFQTG9UZx5i9ngr?=
 =?us-ascii?Q?9PUmC7uAvl6CUQqiyPV8Yn0PRJQ++sEE4TG3lQ/HwhjxhbA/NxtURwO6DRlw?=
 =?us-ascii?Q?78ERuyz+HU9h43WeWc6DZ/5p6l86fwvK8Ex9XtMmqUKYrvFKbbAsJcGZsBDf?=
 =?us-ascii?Q?ktG3CnwE9Xeq3tt7QQ6yCxzv0p8HR5E9Mq/mi8QUFN1NSoe1qIbX4fu234cF?=
 =?us-ascii?Q?9Q4utYQaEA06Fwc5QTyeqoACxSu/7N4tBiGj1dpXAK7sadYQvEBss8VTRoXC?=
 =?us-ascii?Q?qx7P+M0G41HJWem/utsn89EftqRZBfhOdQFchBjh+a6+gCIjbIE+QQUFyUr4?=
 =?us-ascii?Q?SmsHpysjLB+zh6fr9ApgWGZvZn7vwnw6tPFJQjZ4t4zk9MPErJVwfpZwe5tp?=
 =?us-ascii?Q?9UTO6djLk9eqrGERsfQKtVMesLg83a+OHZWmSHKTKjAUNPep75EzdV8b/UgN?=
 =?us-ascii?Q?L4e8A1GfYBo2J6qmOVCQXsr6GpfvVXPWlG3aEbsdaImure3UvPVYtOnfPjMe?=
 =?us-ascii?Q?o32/xfE1qLiMjCHVw87NPwRK4cXsdGQoei2j/ub+EZadZM/TtHNycmO7BjZm?=
 =?us-ascii?Q?5AiKEjC18Ma9mq2yte/bskbtG6f4mxkhwFbOKo8TSNUjH0AkDkaCpizuTWe9?=
 =?us-ascii?Q?gR+M88LciZchUGKfOyA4rWEy6ZyqC3/x/dIW0SLSkMHlHe7HHtJfUFj7SbwF?=
 =?us-ascii?Q?nH1nZ+KkxhnBRbLI8bbxhjD4qC9/fhSfNDN22NvnmwmXL07/stzlsRO6zFk+?=
 =?us-ascii?Q?qHWA+6ZI4odqiHcM33mXUVrhCYdNb1y9eRlE1ypTvtI6HeUuNMXKs9H765z+?=
 =?us-ascii?Q?jFQCCnDrOjESUIXVY4Lzf66E953RA8eYVCLM9ggYMLGwfWkvGVwT9kEfj6HV?=
 =?us-ascii?Q?MinfOdZdHv2K5kcer3oeR3D09Gs/K/Z7Oq5iWW7BNHIgYl6SkIWsUn1ywT8N?=
 =?us-ascii?Q?jFqtLkPJPrqytfhbsEy3bY6HhnLBy6xOj+vixwKLUf3xAgi1PYMmfCwreJTU?=
 =?us-ascii?Q?sjIfaMtUDX164hPhyHIc4IQeIRGTF/oaicgI0VG69640tAv1dWjny2ySLjhr?=
 =?us-ascii?Q?RVkzeTn3ZRomrX6aZoBVYVbTLtbP7i5epfkIEGHOaQM6KVBCuM8DnT4JbCkw?=
 =?us-ascii?Q?0eGj2kTFmPIbC30OsfzFqWmIIFuMlTkagzRp/YX+SbWKbWplWSBLvlWJFqMk?=
 =?us-ascii?Q?ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67036a85-8639-446f-fd1a-08dd0aa36e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 03:12:00.0877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVeNmp+iycMbVl8B2HGxXrU5gBlcbM++JPd6eYktyJNb95y3CAJpIh4mzK95tOEniRsYh+o8uFn5QJIIFLTwM2HdQQXO5+NqMY7ppwA+5mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6559
X-Proofpoint-GUID: 7QmY_tbtRwAYjGCVEcJ3iLv-2rFgQb_7
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=673ff684 cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=sxLMBJgfmOQlJ3A3NsMA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7QmY_tbtRwAYjGCVEcJ3iLv-2rFgQb_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_17,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411220026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 03:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113980

ping
-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Wednesday, November 6, 2024 4:53 PM
To: openembedded-devel@lists.openembedded.org
Cc: Li, Changqing <Changqing.Li@windriver.com>
Subject: [oe] [meta-networking][scarthgap][PATCH] tcpreplay: fix CVE-2023-4=
3279

From: Jiaying Song <jiaying.song.cn@windriver.com>

Null Pointer Dereference in mask_cidr6 component at cidr.c in Tcpreplay
4.4.4 allows attackers to crash the application via crafted tcprewrite comm=
and.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-43279

Upstream patches:
https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac3242=
448a0de94fb901d3560

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2023-43279.patch  | 39 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE=
-2023-43279.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4=
3279.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4=
3279.patch
new file mode 100644
index 000000000..45581268c
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279
+++ .patch
@@ -0,0 +1,39 @@
+From 3164a75f2660a5c3537feff9fd8751346cf5ca57 Mon Sep 17 00:00:00 2001
+From: Gabriel Ganne <gabriel.ganne@gmail.com>
+Date: Sun, 21 Jan 2024 09:16:38 +0100
+Subject: [PATCH] add check for empty cidr
+
+This causes tcprewrite to exit with an error instead of crashing.
+
+Fixes: #824
+
+Upstream-Status: Backport
+CVE: CVE-2023-43279
+
+Reference to upstream patch:
+https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac
+3242448a0de94fb901d3560
+
+Signed-off-by: Gabriel Ganne <gabriel.ganne@gmail.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ src/common/cidr.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/common/cidr.c b/src/common/cidr.c index=20
+687fd04..9afbfec 100644
+--- a/src/common/cidr.c
++++ b/src/common/cidr.c
+@@ -249,6 +249,10 @@ parse_cidr(tcpr_cidr_t **cidrdata, char *cidrin, char=
 *delim)
+     char *network;
+     char *token =3D NULL;
+=20
++    if (cidrin =3D=3D NULL) {
++        errx(-1, "%s", "Unable to parse empty CIDR");
++    }
++
+     mask_cidr6(&cidrin, delim);
+=20
+     /* first iteration of input using strtok */
+--
+2.25.1
+
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b=
/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 16cff2f0e..03a6cfdba 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "https://github.com/appneta/${BPN}/releases/d=
ownload/v${PV}/${BP}.tar.
     file://0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch=
 \
     file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch=
 \
     file://CVE-2023-4256.patch \
+    file://CVE-2023-43279.patch \
 "
=20
 SRC_URI[sha256sum] =3D "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb=
2785e37ad6d4bf"
--
2.25.1


