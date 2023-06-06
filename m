Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB19C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:06:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6979.1686053165635878290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 05:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ibjv4LzM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55213888e3=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356BqQkZ016938
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jun 2023 12:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=izuCDtorhrhFirGKXZbgUDjN9cghpHS97klWfM0MqE0=;
 b=Ibjv4LzM4pmvoqSDcvNFefC7nMTKvl53YjZz63DoI5XH+v0HNNwwxWgrHkuPEAjO+EI+
 4nRyzagNPphVvOLbnCi87EAP8gRfUeugk/ARsAboaygFmabkem6+ZS+fsW8QoZUn+XiD
 uOSVpf7deDGw3YPBp/I+we/E+dSkn8o7cQGYSHRjZyPK5v9aNlVxnsixkt+5V/xu3ZLA
 HpJYJaOuAzmZZPzRkPgaeOyghdBGJPBrrc4dQjkBmW3QN/P+InQe1TRNCSQTYifnf1Ll
 iyfrfkuOWBh4Q9VuDtTWUVwZzT+Szr93/zqsnPxEDB2Vz6Swi5NZMfJRsnpm1I8LA0v3 NQ== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qytr0tfm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 12:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqgJvm29uSOBHzwmf0mNYOJRnn6icScyF+GyfvI9OL27sozopDAG9+jID8eIoOu2P3XPNiSAaKuvoXzjaICZXwneGqhE2HIKqgWF/zFhgEZqu9m1E3BmPoUI4pcBKfteQpmRsxTUT5S6BPz5oUWu3MMVuGemAk/RUAPq1E4L0czla5ZH3SWXxNtYtjaN0MyGwVWUxgS9rIj0gCYCyetDEDdSc220Z0wwueVzxYWaVf+RWc5z/QLElfCwMhHORGGznsIE4SvLTSZVsKjTKC3rznZ8pAdLEbcXNvc1eMpJiadc0stZgvMkzk7nY8l9P2dRALHZDGaprmy7vUS0ztnd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izuCDtorhrhFirGKXZbgUDjN9cghpHS97klWfM0MqE0=;
 b=dXZu6gp7LCEDexcD+s4HcvubFoDvs1ek2aIWZKXkxmK49a4CBVyMz8wgkAVCuyX63lT1qzKS6z+5wXLq2NLE+DBcEu5FPdtccSRuHywt01kOCDS7yp7DvjkcqwbCU5h9U/CSRT+1+5mO4IBE7YlLaxWCWbZkOmhhJrEmT5Lw7CME5GIBP4fX6iGEzu6mcGT9brwu3yozsyIY4top4ig1guIQSUI7kw8ZmKuZhRUWxj9CvUir8aY3cy7CtSeo19DDjJ+D3biniyPpx69+vsXxr39zpIuyYTcJZ+lENwXUboXBwAXZhSETv8Pmk4IL32ft3bRGz00z+383UKP8/cNjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL0PR11MB3410.namprd11.prod.outlook.com (2603:10b6:208:33::33)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 12:06:02 +0000
Received: from BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::5b2d:ae21:417:55d2]) by BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::5b2d:ae21:417:55d2%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:06:02 +0000
From: "Urade, Yogita" <Yogita.Urade@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-42856
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-42856
Thread-Index: AQHZmDYjBLIFWHI5LEyOhLk3jZdrFa99rgMq
Date: Tue, 6 Jun 2023 12:06:02 +0000
Message-ID: 
 <BL0PR11MB3410AD45E1DE223596A1BCB89F52A@BL0PR11MB3410.namprd11.prod.outlook.com>
References: <20230606051634.303687-1-yogita.urade@windriver.com>
In-Reply-To: <20230606051634.303687-1-yogita.urade@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3410:EE_|SJ0PR11MB7704:EE_
x-ms-office365-filtering-correlation-id: 4fa79adb-5f52-4b4f-b2b2-08db668665ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ijL79FBif6G1ZkRauw6PkW6CEW0nisnQ3pw3vnpVCE78c/N9R/mGnTELCA3uskjCGqLjajwAN7uprAO2UKQsMdKfQ4QQkKH7WucK/bV+6DBzfaD1azHobOKmcW0EWZtHBZ+TRfswuT0Y85InNmx6e7dA4Eln3sZz2vCFMK1Oi27HpT5jfCD9lUdwseuY2Rj6nyalcb94TVtVn8DiJ2WzVTdeLX+Dnjcy1FmvzjHBSj4y4RWWbuskfPODXHggZdPCBXoYQcSQChxesqpyfl7XPQYFfJJDFF0kjqLjkMiOhkmXJzqMxbiyBldYn/77XEIsw1ZqmtHdmL1Xbub1ZSvkMdICbc5gJOp7gJTMgkwmEXRx84NvRroCh5iMK/mqAsWuCaQdl96vDaUI5y+TUuES2uz7UFcintlPCyiRsRGG1rrdqfckpEhga6PHcrRp3sKVRLS4FCHAqQkXDG2GjT/5Mf9l/sF+/O4eL767JpjPp94bhX4RlZXmDeYjCS4Bk0v3YeBc16o/rWliLRdSFOiCeGj3P/v/88Ew1df1dQm10jJuyv9vXFVftEY5cG3NkCaKtA2H6yHeRwZVncQOJSIJbk8oTXlRVRC7z1FJpPgSlCwX6dk+K5fs5D2NcAmclVlHXqRiop+HT0AoUtegfxvKRQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39850400004)(346002)(396003)(451199021)(19627405001)(6506007)(26005)(53546011)(9686003)(19627235002)(83380400001)(122000001)(18265965005)(186003)(2906002)(86362001)(52536014)(33656002)(166002)(316002)(5660300002)(8676002)(55016003)(8936002)(41300700001)(38070700005)(966005)(66476007)(66446008)(6916009)(64756008)(66556008)(76116006)(66946007)(91956017)(38100700002)(478600001)(71200400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Q67LorkanzinJuyh0CQol88URSMZ13XHgPq5ePBpQBGDeby/BSsfvb1hJ0eb?=
 =?us-ascii?Q?OQGGIsOh0/u/QU2j6m+vgFO4MjJAkdjbX19B7x4NmXUvk6ozzOTEefIz7tuD?=
 =?us-ascii?Q?33fOY1EKxa4ym1fSTbY84pU/BLoRCJGDMJoHT+qdlUUb8lAMXx9bcPozOEgx?=
 =?us-ascii?Q?lhLzoZbji1YurugkhCK/BTIucFqyIc5d/sAhgE7kYJVOoiIWW+5iBMPQOQfh?=
 =?us-ascii?Q?fD6iTlAXqkL51Qb8PI3io2q3LWwLNhNOs7jhqPRGofhovUVhdtc0g/pKeWCK?=
 =?us-ascii?Q?Su9KsRSb1f4H39ZdRZNdy4liHulO+uA3PeqyJmLuZwWTe0z6HJJmh7MmwatO?=
 =?us-ascii?Q?abY0XvYqCrJxKiWJZ3zV9tZgprPh3JK4G8PS7C2Jey+0VXZoFW4Q9kXom7OG?=
 =?us-ascii?Q?TA1LfP0fAOCK4JxO/y4Skc3m/ClS4tP1HpohzIS0yZQaoMok2z4G1VisEk1/?=
 =?us-ascii?Q?K63a5QcouNaUVNi155IqMDCYBdkeGmjgfNHPpuULfOHlEmj52ygMZ17v0vJf?=
 =?us-ascii?Q?G5YwgT37DCVlQY2/BjXMRjbFFGZnpuu0yDwduvdWe8WlqLSIWEzOrvXunepT?=
 =?us-ascii?Q?qFZ0spTg/QY3p1R0+dc7d8jgxnnWSG5jsUcjJXVHmveylTvOJzUfAxlRQc3v?=
 =?us-ascii?Q?LoMQp6tcZVPeVzneJ6vmCSTU5FL7rZAa7fdf1A0E0RXd4hT0mpzs2RS1LG7S?=
 =?us-ascii?Q?o7oseBYphpRzM7LhWy6cc032hegw7rhFOFN4taiPV2Sq4SaO43MadvKBuFkq?=
 =?us-ascii?Q?6ezAhQPxmiTT6AWXfl526ZU3N0+Z1KhOQVyuB77QyJQpbuNtTvVfkmihtnFH?=
 =?us-ascii?Q?er8ACt+agERBOBeQkMhoHuKK389mNkdAl+Gn8iKW+5gzFGMKfD2sZGGJewqH?=
 =?us-ascii?Q?xURC+2Cn73+Czam+xpj1R0TEkuYlAHMZB6lbPD5mt49EWIkjAJeZuywNgLfL?=
 =?us-ascii?Q?3eV1GWKVP5Xzv6SpBUhbPTXTrcR/g9+j/m2uwaObOtcoDCj3021tX8oZLx32?=
 =?us-ascii?Q?VQ2YdxyA6tkXn4q3VgXmQbA3Q2wsieoJRjTWHZe/i5RQ4hNezGrEjU5ZduFp?=
 =?us-ascii?Q?+zmV7VUdpthrgL7lgodrnBaKJhXnJRlt55SvsmVOzpENNXpCiv+2AoL9jwD1?=
 =?us-ascii?Q?d5WHOeTRV0eeqyJJ+GOUBLub4Ic8a9u9vbRcd4I+7V9pViyJUMHnoHsj3uS6?=
 =?us-ascii?Q?zmSMcfJgA3wRwxC6y9m+GQ3o2HmyuLR3d79F/GEkkM3mL1SouhNLANML/3to?=
 =?us-ascii?Q?66k6tc6NQgQicBSYIuhBOybauFmm4KI1vaKZSpTBptrTVDR1QINvjeDsVvgn?=
 =?us-ascii?Q?+pgueVwof5Ux1XH4dgnLW9rfGvRbtXzGEgNdBzLjyaZRN+NZe+L7Ltk7/meG?=
 =?us-ascii?Q?znB+5DJR+yVMakJyp67fWUwdSNSmjasXt4oPWJ4EWZRhSnbDbZIYzOF8fD5X?=
 =?us-ascii?Q?A6lVCNK+5JDawItyVviirDBWzLhESIX9+OAw4t3iXwyKUh9e79fZM44GfE8w?=
 =?us-ascii?Q?yjD4gaCEMnIeOqAMwmC2Z8t5iJkmQxlmqumi2dDlngfDbRODKn+64NqwJjxH?=
 =?us-ascii?Q?iyGW8IT2yu+r90U445vd3rf3Hx+SY+ye6J3mxZxo?=
Content-Type: multipart/alternative;
	boundary="_000_BL0PR11MB3410AD45E1DE223596A1BCB89F52ABL0PR11MB3410namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa79adb-5f52-4b4f-b2b2-08db668665ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:06:02.0376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFDuyK9rPYKFaJy4ERqMaITrsdoP6Rp5VBoLxOq0GLLvk9mGHIZtWiEhkl1hrIXdh8ZESClRzGwRnkiDdSy/AcfEPfi5PyZPp1cbRL0V5q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
X-Proofpoint-GUID: 8Z-6Mq9hojTNP_wCJjfJ4sYElMFPUqfR
X-Proofpoint-ORIG-GUID: 8Z-6Mq9hojTNP_wCJjfJ4sYElMFPUqfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 12:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103142

--_000_BL0PR11MB3410AD45E1DE223596A1BCB89F52ABL0PR11MB3410namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

By mistake, this patch sent to meta-oe.

Regards,
Yogita
________________________________
From: Urade, Yogita <Yogita.Urade@windriver.com>
Sent: Tuesday, June 6, 2023 10:46 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>; Urade, Yogita <Yogita.Urad=
e@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-42856

A type confusion issue was addressed with improved state handling. This iss=
ue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 15.7.2 and i=
PadOS 15.7.2, iOS 16.1.2. Processing maliciously crafted web content may le=
ad to arbitrary code execution. Apple is aware of a report that this issue =
may have been actively exploited against versions of iOS released before iO=
S 15.1.

References:
https://support.apple.com/en-us/HT213531

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkit/webkitgtk/CVE-2022-42856.patch     | 110 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch b/meta=
/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch
new file mode 100644
index 0000000000..97d58c955a
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch
@@ -0,0 +1,110 @@
+From 71cdc1c09ef199db74b2b60ed5de781250d96a56 Mon Sep 17 00:00:00 2001
+From: Mark Lam <mark.lam@apple.com>
+Date: Wed, 23 Nov 2022 13:48:49 -0800
+Subject: [PATCH] The provenType filtering in FTL's speculateRealNumber is
+ incorrect. https://bugs.webkit.org/show_bug.cgi?id=3D248266
+ <rdar://problem/102531234>
+
+Reviewed by Justin Michaud.
+
+speculateRealNumber does a doubleEqual compare, which filters out double v=
alues which
+are not NaN.  NaN values will fall through to the `intCase` block.  In the=
 `intCase` block,
+the isNotInt32() check there was given a proven type that wrongly filters =
out ~SpecFullDouble.
+
+Consider a scenario where the edge was proven to be { SpecInt32Only, SpecD=
oubleReal,
+SpecDoublePureNaN }.  SpecFullDouble is defined as SpecDoubleReal | SpecDo=
ubleNaN, and
+SpecDoubleNaN is defined as SpecDoublePureNaN | SpecDoubleImpureNaN.  Henc=
e, the filtering
+of the proven type with ~SpecFullDouble means that isNotInt32() will effec=
tively be given
+a proven type of
+
+    { SpecInt32Only, SpecDoubleReal, SpecDoublePureNaN } - { SpecDoubleRea=
l, SpecDoublePureNaN }
+
+which yields
+
+    { SpecInt32Only }.
+
+As a result, the compiler will think that that isNotIn32() check will alwa=
ys fail.  This
+is not correct if the actual incoming value for that edge is actually a Pu=
reNaN.  In this
+case, speculateRealNumber should have OSR exited, but it doesn't because i=
t thinks that
+the isNotInt32() check will always fail and elide the check altogether.
+
+In this patch, we fix this by replacing the ~SpecFullDouble with ~SpecDoub=
leReal.  We also
+rename the `intCase` block to `intOrNaNCase` to document what it actually =
handles.
+
+* JSTests/stress/speculate-real-number-in-object-is.js: Added.
+(test.object_is_opt):
+(test):
+* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:
+(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq):
+
+Canonical link: https://commits.webkit.org/252432.839@safari-7614-branch
+
+CVE: CVE-2022-42856
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/71cdc1c09ef199db74b2b60ed5de78125=
0d96a56]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .../speculate-real-number-in-object-is.js     | 22 +++++++++++++++++++
+ Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp |  8 +++----
+ 2 files changed, 26 insertions(+), 4 deletions(-)
+ create mode 100644 JSTests/stress/speculate-real-number-in-object-is.js
+
+diff --git a/JSTests/stress/speculate-real-number-in-object-is.js b/JSTest=
s/stress/speculate-real-number-in-object-is.js
+new file mode 100644
+index 000000000000..0b10799954da
+--- /dev/null
++++ b/JSTests/stress/speculate-real-number-in-object-is.js
+@@ -0,0 +1,22 @@
++function test() {
++    function object_is_opt(value) {
++        const tmp =3D {p0: value};
++
++        if (Object.is(value, NaN))
++            return 0;
++
++        return value;
++    }
++
++    object_is_opt(NaN);
++
++    for (let i =3D 0; i < 0x20000; i++)
++        object_is_opt(1.1);
++
++    return isNaN(object_is_opt(NaN));
++}
++
++resultIsNaN =3D test();
++if (resultIsNaN)
++    throw "FAILED";
++
+diff --git a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp b/Source/JavaSc=
riptCore/ftl/FTLLowerDFGToB3.cpp
+index 8621b554d578..588298eba350 100644
+--- a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
++++ b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
+@@ -20285,18 +20285,18 @@ IGNORE_CLANG_WARNINGS_END
+         LValue value =3D lowJSValue(edge, ManualOperandSpeculation);
+         LValue doubleValue =3D unboxDouble(value);
+
+-        LBasicBlock intCase =3D m_out.newBlock();
++        LBasicBlock intOrNaNCase =3D m_out.newBlock();
+         LBasicBlock continuation =3D m_out.newBlock();
+
+         m_out.branch(
+             m_out.doubleEqual(doubleValue, doubleValue),
+-            usually(continuation), rarely(intCase));
++            usually(continuation), rarely(intOrNaNCase));
+
+-        LBasicBlock lastNext =3D m_out.appendTo(intCase, continuation);
++        LBasicBlock lastNext =3D m_out.appendTo(intOrNaNCase, continuatio=
n);
+
+         typeCheck(
+             jsValueValue(value), m_node->child1(), SpecBytecodeRealNumber=
,
+-            isNotInt32(value, provenType(m_node->child1()) & ~SpecFullDou=
ble));
++            isNotInt32(value, provenType(m_node->child1()) & ~SpecDoubleR=
eal));
+         m_out.jump(continuation);
+
+         m_out.appendTo(continuation, lastNext);
+--
+2.35.5
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.36.8.bb
index 1dac4f5677..93dae6039a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}.tar=
.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLA=
G.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2022-42856.patch \
            "
 SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136ed=
bab2c133d00437"

--
2.40.0


--_000_BL0PR11MB3410AD45E1DE223596A1BCB89F52ABL0PR11MB3410namp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-size:12pt;margin:0px" class=3D"ContentPasted0">By mista=
ke, this patch sent to meta-oe.</span>
<div style=3D"font-size:12pt;margin:0px"><br class=3D"ContentPasted0">
</div>
<div style=3D"font-size:12pt;margin:0px" class=3D"ContentPasted0">Regards,<=
/div>
<span style=3D"font-size:12pt;margin:0px" class=3D"ContentPasted0">Yogita</=
span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Urade, Yogita &lt;Yog=
ita.Urade@windriver.com&gt;<br>
<b>Sent:</b> Tuesday, June 6, 2023 10:46 AM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Urade, Yogita=
 &lt;Yogita.Urade@windriver.com&gt;<br>
<b>Subject:</b> [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-428=
56</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">A type confusion issue was addressed with improved=
 state handling. This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventu=
ra 13.1, iOS 15.7.2 and iPadOS 15.7.2, iOS 16.1.2. Processing maliciously c=
rafted web content may lead to arbitrary
 code execution. Apple is aware of a report that this issue may have been a=
ctively exploited against versions of iOS released before iOS 15.1.<br>
<br>
References:<br>
<a href=3D"https://support.apple.com/en-us/HT213531">https://support.apple.=
com/en-us/HT213531</a><br>
<br>
Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
---<br>
&nbsp;.../webkit/webkitgtk/CVE-2022-42856.patch&nbsp;&nbsp;&nbsp;&nbsp; | 1=
10 ++++++++++++++++++<br>
&nbsp;meta/recipes-sato/webkit/webkitgtk_2.36.8.bb&nbsp; |&nbsp;&nbsp; 1 +<=
br>
&nbsp;2 files changed, 111 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.=
patch<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch b/meta=
/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch<br>
new file mode 100644<br>
index 0000000000..97d58c955a<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch<br>
@@ -0,0 +1,110 @@<br>
+From 71cdc1c09ef199db74b2b60ed5de781250d96a56 Mon Sep 17 00:00:00 2001<br>
+From: Mark Lam &lt;mark.lam@apple.com&gt;<br>
+Date: Wed, 23 Nov 2022 13:48:49 -0800<br>
+Subject: [PATCH] The provenType filtering in FTL's speculateRealNumber is<=
br>
+ incorrect. <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D248266">h=
ttps://bugs.webkit.org/show_bug.cgi?id=3D248266</a><br>
+ &lt;rdar://problem/102531234&gt;<br>
+<br>
+Reviewed by Justin Michaud.<br>
+<br>
+speculateRealNumber does a doubleEqual compare, which filters out double v=
alues which<br>
+are not NaN.&nbsp; NaN values will fall through to the `intCase` block.&nb=
sp; In the `intCase` block,<br>
+the isNotInt32() check there was given a proven type that wrongly filters =
out ~SpecFullDouble.<br>
+<br>
+Consider a scenario where the edge was proven to be { SpecInt32Only, SpecD=
oubleReal,<br>
+SpecDoublePureNaN }.&nbsp; SpecFullDouble is defined as SpecDoubleReal | S=
pecDoubleNaN, and<br>
+SpecDoubleNaN is defined as SpecDoublePureNaN | SpecDoubleImpureNaN.&nbsp;=
 Hence, the filtering<br>
+of the proven type with ~SpecFullDouble means that isNotInt32() will effec=
tively be given<br>
+a proven type of<br>
+<br>
+&nbsp;&nbsp;&nbsp; { SpecInt32Only, SpecDoubleReal, SpecDoublePureNaN } - =
{ SpecDoubleReal, SpecDoublePureNaN }<br>
+<br>
+which yields<br>
+<br>
+&nbsp;&nbsp;&nbsp; { SpecInt32Only }.<br>
+<br>
+As a result, the compiler will think that that isNotIn32() check will alwa=
ys fail.&nbsp; This<br>
+is not correct if the actual incoming value for that edge is actually a Pu=
reNaN.&nbsp; In this<br>
+case, speculateRealNumber should have OSR exited, but it doesn't because i=
t thinks that<br>
+the isNotInt32() check will always fail and elide the check altogether.<br=
>
+<br>
+In this patch, we fix this by replacing the ~SpecFullDouble with ~SpecDoub=
leReal.&nbsp; We also<br>
+rename the `intCase` block to `intOrNaNCase` to document what it actually =
handles.<br>
+<br>
+* JSTests/stress/speculate-real-number-in-object-is.js: Added.<br>
+(test.object_is_opt):<br>
+(test):<br>
+* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:<br>
+(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq):<br>
+<br>
+Canonical link: <a href=3D"https://commits.webkit.org/252432.839@safari-76=
14-branch">
https://commits.webkit.org/252432.839@safari-7614-branch</a><br>
+<br>
+CVE: CVE-2022-42856<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/WebKit/WebKit/commit/71cdc1c09ef199db74b2b6=
0ed5de781250d96a56">https://github.com/WebKit/WebKit/commit/71cdc1c09ef199d=
b74b2b60ed5de781250d96a56</a>]<br>
+<br>
+Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
+---<br>
+ .../speculate-real-number-in-object-is.js&nbsp;&nbsp;&nbsp;&nbsp; | 22 ++=
+++++++++++++++++<br>
+ Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp |&nbsp; 8 +++----<br>
+ 2 files changed, 26 insertions(+), 4 deletions(-)<br>
+ create mode 100644 JSTests/stress/speculate-real-number-in-object-is.js<b=
r>
+<br>
+diff --git a/JSTests/stress/speculate-real-number-in-object-is.js b/JSTest=
s/stress/speculate-real-number-in-object-is.js<br>
+new file mode 100644<br>
+index 000000000000..0b10799954da<br>
+--- /dev/null<br>
++++ b/JSTests/stress/speculate-real-number-in-object-is.js<br>
+@@ -0,0 +1,22 @@<br>
++function test() {<br>
++&nbsp;&nbsp;&nbsp; function object_is_opt(value) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const tmp =3D {p0: value};<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (Object.is(value, NaN))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=
 0;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return value;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp; object_is_opt(NaN);<br>
++<br>
++&nbsp;&nbsp;&nbsp; for (let i =3D 0; i &lt; 0x20000; i++)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object_is_opt(1.1);<br>
++<br>
++&nbsp;&nbsp;&nbsp; return isNaN(object_is_opt(NaN));<br>
++}<br>
++<br>
++resultIsNaN =3D test();<br>
++if (resultIsNaN)<br>
++&nbsp;&nbsp;&nbsp; throw &quot;FAILED&quot;;<br>
++<br>
+diff --git a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp b/Source/JavaSc=
riptCore/ftl/FTLLowerDFGToB3.cpp<br>
+index 8621b554d578..588298eba350 100644<br>
+--- a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp<br>
++++ b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp<br>
+@@ -20285,18 +20285,18 @@ IGNORE_CLANG_WARNINGS_END<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LValue value =3D lowJSVal=
ue(edge, ManualOperandSpeculation);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LValue doubleValue =3D un=
boxDouble(value);<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LBasicBlock intCase =3D m_out.=
newBlock();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LBasicBlock intOrNaNCase =3D m=
_out.newBlock();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LBasicBlock continuation =
=3D m_out.newBlock();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m_out.branch(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m=
_out.doubleEqual(doubleValue, doubleValue),<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usuall=
y(continuation), rarely(intCase));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usuall=
y(continuation), rarely(intOrNaNCase));<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LBasicBlock lastNext =3D m_out=
.appendTo(intCase, continuation);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LBasicBlock lastNext =3D m_out=
.appendTo(intOrNaNCase, continuation);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; typeCheck(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j=
sValueValue(value), m_node-&gt;child1(), SpecBytecodeRealNumber,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isNotI=
nt32(value, provenType(m_node-&gt;child1()) &amp; ~SpecFullDouble));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isNotI=
nt32(value, provenType(m_node-&gt;child1()) &amp; ~SpecDoubleReal));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m_out.jump(continuation);=
<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m_out.appendTo(continuati=
on, lastNext);<br>
+--<br>
+2.35.5<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.36.8.bb<br>
index 1dac4f5677..93dae6039a 100644<br>
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb<br>
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb<br>
@@ -17,6 +17,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://www.webkitgtk.=
org/releases/${BP}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch"=
>
file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-32888.patch">file://CVE-2022-32888.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-32923.patch">file://CVE-2022-32923.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-42856.patch">file://CVE-2022-42856.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;0ad9fb6bf28308fe3889faf184bd179d13ac1b46=
835d2136edbab2c133d00437&quot;<br>
&nbsp;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BL0PR11MB3410AD45E1DE223596A1BCB89F52ABL0PR11MB3410namp_--

