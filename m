Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03D4C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:06:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6986.1686053191422684819
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 05:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=liQ5bMqI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55213888e3=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356BdIQD027745
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jun 2023 12:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=pQ1WTS4LZz1tR2UTyf1HrnwYdYoCrI484mKTHc3X1Jc=;
 b=liQ5bMqIky69mnfWj7DCRkrmtGjM179B+P6NMz+NcxSeofhWLgUGMSi6LM66pt2jgn+5
 YFDNVtN6UO8Vq3xki09EB44w2BFiNMYRFS/7WHQelLEAKeJ8a7BR1KWMrB44JYqTZf+2
 Ardxf+r9zISSUaRcOgSSAhldpHiqP4FF7OCEC+ZAAmFIz2drt9hoZUWRz9wF5Y09ISF5
 F+RmpM2CI0vmf5Rt/o9iC2ZL//WUiXf7qZAlwTq4HuBWqiovZwwnV99rAwxn7IEvzB8U
 3VbmXbrqvBx+hO7/k+KE+3SpFhyJJ3on4j6Fzoqizd892l9fD9+QDxFeaLmN3qos1Uq6 lQ== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qytr0tfma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 12:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXK36I8/yR2BIDQClyCuImBTOdDti1Kdi6RWMaYkINhkg6iYwvapfbluTHawD1J8sl2vFGpqzBDa6BgMNS7VL8ZsGgR5XTeywDqsclcGSJxI4kac71FUfstG++svmEmVlKVpf8GlOpYeoLUJXPGuXjyRclNoFb+9YE/7tWkZt+XdcuFnSKR2rfrJu52pM9mQTcu2kcVek9lGhMXSq/OG5Rtyxvj8L/hBKNMxHNGXivp6Nrem+9pZKzIZwe0WNNaYab0uHtk6vjsomuWtB6TBIRNKxDOcaOKU5VY1KqGISMJJiTqI+euuouMOZ5BH4fsCvoUy/sqFNW16RaMn06UdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ1WTS4LZz1tR2UTyf1HrnwYdYoCrI484mKTHc3X1Jc=;
 b=i2Af9d3BEVIOp7EZ3P72Td446Nft9Kajj6pq+HrPQmvj1KioVed8rnLsZF8D9blIqA9p2w7qlRUHlVMoJ5mtHQpOZeNKC6N5E+cn/L7KZXANownWQj7PNq92N+hD8vw8JDevhpNf9TfVSUwbA+XOVeofMm1A8vsftR57HcS5EPp/TBwolV7ZdqXx4Z2qk5ctHIruBEshgtqsxoMA99WasBjDKtntjCFPqID2gyyXQKlnO5Ra5NvTjlmB6EAnjjHEElSF0Hg43p/g6WsRWbkgkc9Vx6D0UeXtMgui7fPBLIrc9nnApfJYxYbcE8/3+lbhwPDiQ8W3DD5qqtCQFzqy9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL0PR11MB3410.namprd11.prod.outlook.com (2603:10b6:208:33::33)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 12:06:27 +0000
Received: from BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::5b2d:ae21:417:55d2]) by BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::5b2d:ae21:417:55d2%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:06:27 +0000
From: "Urade, Yogita" <Yogita.Urade@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2023-23517,
 CVE-2023-23518
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2023-23517,
 CVE-2023-23518
Thread-Index: AQHZlS8HfBETyH4LWkiPNPsSplDWSK99tD4u
Date: Tue, 6 Jun 2023 12:06:27 +0000
Message-ID: 
 <BL0PR11MB34101D5167BABFA53EDC4ADD9F52A@BL0PR11MB3410.namprd11.prod.outlook.com>
References: <20230602084813.270697-1-yogita.urade@windriver.com>
In-Reply-To: <20230602084813.270697-1-yogita.urade@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3410:EE_|SJ0PR11MB7704:EE_
x-ms-office365-filtering-correlation-id: 9ad8bb84-138e-40ce-be35-08db668674ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oPBcLegLH6xCMWdVeRET/d5tmiVFQxXR4i8xom1gSYkkB7QZ0Y/Yq6LgLGFLr2ouzg/IJtkfeInT52sxdVrtIaluEkiC2KyX9H+jlIlLLCagUGhcFksbTFMSA9mOnWyL3NvdNeV1I4bnPm9g0WujcrmAPXB6rM4LrHIsK3Y23/+TLHKLpBdPuTGbeEEBuBneBh1uXTF1M4xfubDtZPXzDjr0C1bPqTL/6SGZC8/gHj8KdFjgwGmhjsWuux13nFPzZEdGoQ1sAXWsmQEwCdpkGJ1/UtIQD9l4djdtZ2AHDcGfOI5VKPtUtsYAp+qtdgcbEgOUr/2yIWITOHlPPhdNw8ZJpGWtB7z6r07oAky0oQ1UpdX5eBJlZO9w0RGkaf9KdFRK0cQOUJ1NUBAD1ignTVQfs3DbobjbLstgazqptPQRq2qPyyLsxW2xbdfecf6VWtY3EzAPyQKM5NwK3g9xvPMwRW5yA/ZMz3bfWAD/fYvRI+cGkelcFwY2rGuw6LYYyhjZPJ0nCM/R9HMxmmsmqRW5s+gdYu+ppi/HL1SiUdIyYEA/+PNOn7Wx7BJSnHUjr8wRQfC0GODqYAIaJSYnulmJx8FMna+LnaytU5Z+m3HAhYn2E/qu85f+DhNt7JZbi0GFV+9LpwA3fMHVBBdaGsCjDP5u8SNaG1Ul1zBHwdls1RvzKHlrMsJcJZdL+54VA+cb0QqRUshpM8oL6Me3FQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39850400004)(346002)(396003)(451199021)(19627405001)(6506007)(26005)(53546011)(9686003)(83380400001)(122000001)(18265965005)(186003)(2906002)(86362001)(52536014)(33656002)(166002)(316002)(5660300002)(8676002)(55016003)(8936002)(41300700001)(38070700005)(966005)(66476007)(66446008)(6916009)(64756008)(66556008)(76116006)(66946007)(91956017)(38100700002)(478600001)(71200400001)(7696005)(408884003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bR95wTEAYmB17NFB78fA+qpM1XlVMcAj3CFPmf3NxEcx5AJO73v7EvfKEhBJ?=
 =?us-ascii?Q?BaQF5rnwlItcAMAjcLKbFpBQm5g0VBiTsS+zKyD2DSWMuQH2Gi9F1234mFcX?=
 =?us-ascii?Q?iJnbTUJ4EkrJY86yHtdRcuCFxtalqmQXGHJ/Xpg0G3ovH8shMETeokZ5ay0H?=
 =?us-ascii?Q?tIAqYHuZq4Pv8Q5jLXMcDoe8h0o4ro43AQ0mMvLaGGJG8rfnPqKdjKODpFL/?=
 =?us-ascii?Q?dOBIEhT2W3S1Srv44/9D/S14fVeYE2ldjAilQ5WqdysoFJmvjsQu3Rx0KuZa?=
 =?us-ascii?Q?EdatT1dHuC2mpwxXz1IJmd7Sb7aNEJzp/QOJ4QVIm5GVbPqe3/IQ4Bv3QxGd?=
 =?us-ascii?Q?8hX6ddm2EIn1LWrqG8TMFd0ahGrtmfMp2dYuTSJ9aMWzqBYSjvBSBAnbQuyQ?=
 =?us-ascii?Q?H9p71rQgreRcworcHA/I4eT4h3sD5esGV3Vylsc0LrhJ26p9fksB+Nbjw0fz?=
 =?us-ascii?Q?9eFKCF+FmrvNnSSMsAMzmsgOmRFbe3EkqOe89CuZSfhnqu71mISlowie1uYS?=
 =?us-ascii?Q?lX0PMan/66Ebhm4virZW6SgmNuVJOKbKGu1jDZXn+9i7gA0vRFeCkARO2MKa?=
 =?us-ascii?Q?mEmOolBOEfXFG/WcXxAP3NAFxJ5rYDRXHDitAn2dAHIT/mHBb1LeF/ppJKHy?=
 =?us-ascii?Q?UvPWlX+/aHNBduUCaWw6hOrKJbjBEcore6kSTXkGVD3149SDVEwnco+dOBrR?=
 =?us-ascii?Q?0MUyKoU7UPkjgx5QZbHMl03/5LTlv9EtJwFDghx2gpaEoMu0R5rXNnXR72lr?=
 =?us-ascii?Q?HdsiWilsoC6U8gUH/m75/DdII+ZxM7FsQfDXmTINqcWqG0mKCIMSX3CJnHZf?=
 =?us-ascii?Q?lIEywhGknaH4zXugEV4L3FMqsTMWs6a/kCEVGVrb5BmRHB19o3Qt4d/BJNrD?=
 =?us-ascii?Q?Ke6/tKNpfNEUMIjEWYc7LEyvBLzgAzHtd48wmsYZxltDqid05lJshm8PqV2d?=
 =?us-ascii?Q?rMz5fA9VYb3f125hnyuvV9T5w/+YBdN+Mdisdop6obFkVUsH0DCFHKsutfMl?=
 =?us-ascii?Q?5n1OH4ZtNmfjZhzvGQKHea4hO0KVuXkBvHjGodGpqMBvIYIFxLdVFnmEzWf6?=
 =?us-ascii?Q?IGH2/SCM+sSEx1LW2TmmPUtTg3kKEnoLroAo62gL/MlUSQ0QjQJxiRjbCmKF?=
 =?us-ascii?Q?U3SSFfYuKznoW7gh19sFlaw0hMQ0q3+lTxldEjlFw6GBKX40XaOL7JWZQmph?=
 =?us-ascii?Q?+U+JF2xUstmQnpT1yfD66tu5m83qcqfeD2x9FoLUZgR7i7tLcFfpZEGefir4?=
 =?us-ascii?Q?K/T6zCYIBkbDh81sZ5CHMPEot8i3FygiDVF07sTiX6PkF00gw21/Oxnn0kW9?=
 =?us-ascii?Q?2UWtn2E338RFNeBxOBDlfL9NlL8uJFw6ctWmChYzUwZfos1gULEl8KHWq3p7?=
 =?us-ascii?Q?icqrCTmRw+WyJHzRl5YxywG1xD9WA9C/+vSuOAQkI8RfX9ZxUWi2OuuDUU9U?=
 =?us-ascii?Q?3+B4df3cOhG8EA5YMwcrngU9lkdSNBRSipu1kl0i+X2ZGDmQUVc5hCwX1nWR?=
 =?us-ascii?Q?nY9bQY0tbBCKMYQKphIVFQnkLiEaUuTCpUO71wj2/MZzXiVTK6o7NhEZDPKA?=
 =?us-ascii?Q?bdOb/35nhcN4qewwLspF95yT22Dip1+3CsoArwgQ?=
Content-Type: multipart/alternative;
	boundary="_000_BL0PR11MB34101D5167BABFA53EDC4ADD9F52ABL0PR11MB3410namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad8bb84-138e-40ce-be35-08db668674ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:06:27.6463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OWCdWGcrzjIf+Nsyk92vKHtTXra8XRM3srTI8IOC+PAH77yP61RAfOn7mU8EIU/ps6o0edEnx2SKFsfyBrhvqw25NgtnFb1jdCi9OwJfSgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
X-Proofpoint-GUID: AybNHLmlNcTUyHfiLdUZQWts1HTSSjyT
X-Proofpoint-ORIG-GUID: AybNHLmlNcTUyHfiLdUZQWts1HTSSjyT
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
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 12:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103143

--_000_BL0PR11MB34101D5167BABFA53EDC4ADD9F52ABL0PR11MB3410namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

By mistake, this patch sent to meta-oe.

Regards,
Yogita
________________________________
From: Urade, Yogita <Yogita.Urade@windriver.com>
Sent: Friday, June 2, 2023 2:18 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>; Urade, Yogita <Yogita.Urad=
e@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2023-23517, CVE=
-2023-23518

The issue was addressed with improved memory handling.
This issue is fixed in macOS Ventura 13.2, macOS Monterey 12.6.3, tvOS 16.3=
, Safari 16.3, watchOS 9.3, iOS 16.3 and iPadOS 16.3, macOS Big Sur 11.7.3.
Processing maliciously crafted web content may lead to arbitrary code execu=
tion.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-23517
https://support.apple.com/en-us/HT213638
https://bugs.webkit.org/show_bug.cgi?id=3D248268
https://github.com/WebKit/WebKit/pull/6756

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../CVE-2023-23517-CVE-2023-23518.patch       | 131 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2=
023-23518.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-235=
18.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518=
.patch
new file mode 100644
index 0000000000..f4116f55cd
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518.patc=
h
@@ -0,0 +1,131 @@
+From f44648f07471b6c34f61993baa8997f7519a18a1 Mon Sep 17 00:00:00 2001
+From: Youenn Fablet <youennf@gmail.com>
+Date: Mon, 28 Nov 2022 00:43:35 -0800
+Subject: [PATCH] Type getter is not needed for internal ReadableStream sou=
rces
+ https://bugs.webkit.org/show_bug.cgi?id=3D248268 rdar://102338913
+
+Reviewed by Eric Carlson.
+
+Make ReadableStreamSource method privates.
+In ReadableStream, use @getters instead of private getters to allow gettin=
g private values from prototype.
+Covered by added test.
+
+* LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt: Added.
+* LayoutTests/http/wpt/fetch/fetch-stream-source.html: Added.
+* Source/WebCore/Modules/streams/ReadableStream.js:
+(initializeReadableStream):
+* Source/WebCore/Modules/streams/ReadableStreamSource.idl:
+* Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h:
+(WebCore::IDLOperationReturningPromise::call):
+
+Canonical link: https://commits.webkit.org/257063@main
+
+CVE: CVE-2023-23517 CVE-2023-23518
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/f44648f07471b6c34f61993baa8997f75=
19a18a1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .../fetch/fetch-stream-source-expected.txt    |  3 +++
+ .../http/wpt/fetch/fetch-stream-source.html   | 24 +++++++++++++++++++
+ .../WebCore/Modules/streams/ReadableStream.js |  4 ++--
+ .../Modules/streams/ReadableStreamSource.idl  |  8 +++----
+ .../js/JSDOMOperationReturningPromise.h       |  4 +++-
+ 5 files changed, 36 insertions(+), 7 deletions(-)
+ create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source-expecte=
d.txt
+ create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source.html
+
+diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt b=
/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt
+new file mode 100644
+index 000000000000..856ea8180ca2
+--- /dev/null
++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt
+@@ -0,0 +1,3 @@
++
++PASS Only JS streams should check type
++
+diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source.html b/LayoutT=
ests/http/wpt/fetch/fetch-stream-source.html
+new file mode 100644
+index 000000000000..fbebfa5e524f
+--- /dev/null
++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source.html
+@@ -0,0 +1,24 @@
++<!doctype html>
++<html>
++  <head>
++    <meta charset=3D"utf-8">
++    <title>Fetch and source</title>
++    <script src=3D"/resources/testharness.js"></script>
++    <script src=3D"/resources/testharnessreport.js"></script>
++  </head>
++  <body>
++    <script>
++promise_test(async () =3D> {
++    let counter =3D 0;
++    Object.prototype.__defineGetter__("type", function() {
++        counter++;
++    });
++
++    const response =3D await fetch('/');
++    const fetchReadableStream =3D response.body;
++    const [r1, r2] =3D fetchReadableStream.tee();
++    assert_equals(counter, 0);
++}, "Only JS streams should check type");
++    </script>
++  </body>
++</html>
+diff --git a/Source/WebCore/Modules/streams/ReadableStream.js b/Source/Web=
Core/Modules/streams/ReadableStream.js
+index ddef56ecd460..7f0def325d84 100644
+--- a/Source/WebCore/Modules/streams/ReadableStream.js
++++ b/Source/WebCore/Modules/streams/ReadableStream.js
+@@ -48,10 +48,10 @@ function initializeReadableStream(underlyingSource, st=
rategy)
+
+     // FIXME: We should introduce https://streams.spec.whatwg.org/#create=
-readable-stream.
+     // For now, we emulate this with underlyingSource with private proper=
ties.
+-    if (@getByIdDirectPrivate(underlyingSource, "pull") !=3D=3D @undefine=
d) {
++    if (underlyingSource.@pull !=3D=3D @undefined) {
+         const size =3D @getByIdDirectPrivate(strategy, "size");
+         const highWaterMark =3D @getByIdDirectPrivate(strategy, "highWate=
rMark");
+-        @setupReadableStreamDefaultController(this, underlyingSource, siz=
e, highWaterMark !=3D=3D @undefined ? highWaterMark : 1, @getByIdDirectPriv=
ate(underlyingSource, "start"), @getByIdDirectPrivate(underlyingSource, "pu=
ll"), @getByIdDirectPrivate(underlyingSource, "cancel"));
++        @setupReadableStreamDefaultController(this, underlyingSource, siz=
e, highWaterMark !=3D=3D @undefined ? highWaterMark : 1, underlyingSource.@=
start, underlyingSource.@pull, underlyingSource.@cancel);
+         return this;
+     }
+
+diff --git a/Source/WebCore/Modules/streams/ReadableStreamSource.idl b/Sou=
rce/WebCore/Modules/streams/ReadableStreamSource.idl
+index cce9ea37ce80..ae7f1403b8ac 100644
+--- a/Source/WebCore/Modules/streams/ReadableStreamSource.idl
++++ b/Source/WebCore/Modules/streams/ReadableStreamSource.idl
+@@ -30,10 +30,10 @@
+     LegacyNoInterfaceObject,
+     SkipVTableValidation
+ ] interface ReadableStreamSource {
+-    [Custom] Promise<undefined> start(ReadableStreamDefaultController con=
troller);
+-    [Custom] Promise<undefined> pull(ReadableStreamDefaultController cont=
roller);
+-    undefined cancel(any reason);
++    [Custom, PrivateIdentifier] Promise<undefined> start(ReadableStreamDe=
faultController controller);
++    [Custom, PrivateIdentifier] Promise<undefined> pull(ReadableStreamDef=
aultController controller);
++    [PrivateIdentifier] undefined cancel(any reason);
+
+     // Place holder to keep the controller linked to the source.
+-    [CachedAttribute, CustomGetter] readonly attribute any controller;
++    [CachedAttribute, CustomGetter, PrivateIdentifier] readonly attribute=
 any controller;
+ };
+diff --git a/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h b=
/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
+index c4d1513ad5c4..1dda9d3834f7 100644
+--- a/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
++++ b/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
+@@ -43,8 +43,10 @@ public:
+             if constexpr (shouldThrow !=3D CastedThisErrorBehavior::Asser=
t) {
+                 if (UNLIKELY(!thisObject))
+                     return rejectPromiseWithThisTypeError(promise.get(), =
JSClass::info()->className, operationName);
+-            } else
++            } else {
++                UNUSED_PARAM(operationName);
+                 ASSERT(thisObject);
++            }
+
+             ASSERT_GC_OBJECT_INHERITS(thisObject, JSClass::info());
+
+--
+2.40.0
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.36.8.bb
index 1dac4f5677..e340c3b19d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}.tar=
.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLA=
G.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2023-23517-CVE-2023-23518.patch \
            "
 SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136ed=
bab2c133d00437"

--
2.40.0


--_000_BL0PR11MB34101D5167BABFA53EDC4ADD9F52ABL0PR11MB3410namp_
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
<b>Sent:</b> Friday, June 2, 2023 2:18 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Urade, Yogita=
 &lt;Yogita.Urade@windriver.com&gt;<br>
<b>Subject:</b> [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2023-235=
17, CVE-2023-23518</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The issue was addressed with improved memory handl=
ing.<br>
This issue is fixed in macOS Ventura 13.2, macOS Monterey 12.6.3, tvOS 16.3=
, Safari 16.3, watchOS 9.3, iOS 16.3 and iPadOS 16.3, macOS Big Sur 11.7.3.=
<br>
Processing maliciously crafted web content may lead to arbitrary code execu=
tion.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-23517">https://nvd.nis=
t.gov/vuln/detail/CVE-2023-23517</a><br>
<a href=3D"https://support.apple.com/en-us/HT213638">https://support.apple.=
com/en-us/HT213638</a><br>
<a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D248268">https://bugs.w=
ebkit.org/show_bug.cgi?id=3D248268</a><br>
<a href=3D"https://github.com/WebKit/WebKit/pull/6756">https://github.com/W=
ebKit/WebKit/pull/6756</a><br>
<br>
Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
---<br>
&nbsp;.../CVE-2023-23517-CVE-2023-23518.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 131 ++++++++++++++++++<br>
&nbsp;meta/recipes-sato/webkit/webkitgtk_2.36.8.bb&nbsp; |&nbsp;&nbsp; 1 +<=
br>
&nbsp;2 files changed, 132 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-=
CVE-2023-23518.patch<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-235=
18.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518=
.patch<br>
new file mode 100644<br>
index 0000000000..f4116f55cd<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518.patc=
h<br>
@@ -0,0 +1,131 @@<br>
+From f44648f07471b6c34f61993baa8997f7519a18a1 Mon Sep 17 00:00:00 2001<br>
+From: Youenn Fablet &lt;youennf@gmail.com&gt;<br>
+Date: Mon, 28 Nov 2022 00:43:35 -0800<br>
+Subject: [PATCH] Type getter is not needed for internal ReadableStream sou=
rces<br>
+ <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D248268">https://bugs=
.webkit.org/show_bug.cgi?id=3D248268</a> rdar://102338913<br>
+<br>
+Reviewed by Eric Carlson.<br>
+<br>
+Make ReadableStreamSource method privates.<br>
+In ReadableStream, use @getters instead of private getters to allow gettin=
g private values from prototype.<br>
+Covered by added test.<br>
+<br>
+* LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt: Added.<br>
+* LayoutTests/http/wpt/fetch/fetch-stream-source.html: Added.<br>
+* Source/WebCore/Modules/streams/ReadableStream.js:<br>
+(initializeReadableStream):<br>
+* Source/WebCore/Modules/streams/ReadableStreamSource.idl:<br>
+* Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h:<br>
+(WebCore::IDLOperationReturningPromise::call):<br>
+<br>
+Canonical link: <a href=3D"https://commits.webkit.org/257063@main">https:/=
/commits.webkit.org/257063@main</a><br>
+<br>
+CVE: CVE-2023-23517 CVE-2023-23518<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/WebKit/WebKit/commit/f44648f07471b6c34f6199=
3baa8997f7519a18a1">https://github.com/WebKit/WebKit/commit/f44648f07471b6c=
34f61993baa8997f7519a18a1</a>]<br>
+<br>
+Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
+---<br>
+ .../fetch/fetch-stream-source-expected.txt&nbsp;&nbsp;&nbsp; |&nbsp; 3 ++=
+<br>
+ .../http/wpt/fetch/fetch-stream-source.html&nbsp;&nbsp; | 24 ++++++++++++=
+++++++<br>
+ .../WebCore/Modules/streams/ReadableStream.js |&nbsp; 4 ++--<br>
+ .../Modules/streams/ReadableStreamSource.idl&nbsp; |&nbsp; 8 +++----<br>
+ .../js/JSDOMOperationReturningPromise.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; |&nbsp; 4 +++-<br>
+ 5 files changed, 36 insertions(+), 7 deletions(-)<br>
+ create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source-expecte=
d.txt<br>
+ create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source.html<br=
>
+<br>
+diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt b=
/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt<br>
+new file mode 100644<br>
+index 000000000000..856ea8180ca2<br>
+--- /dev/null<br>
++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt<br>
+@@ -0,0 +1,3 @@<br>
++<br>
++PASS Only JS streams should check type<br>
++<br>
+diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source.html b/LayoutT=
ests/http/wpt/fetch/fetch-stream-source.html<br>
+new file mode 100644<br>
+index 000000000000..fbebfa5e524f<br>
+--- /dev/null<br>
++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source.html<br>
+@@ -0,0 +1,24 @@<br>
++&lt;!doctype html&gt;<br>
++&lt;html&gt;<br>
++&nbsp; &lt;head&gt;<br>
++&nbsp;&nbsp;&nbsp; &lt;meta charset=3D&quot;utf-8&quot;&gt;<br>
++&nbsp;&nbsp;&nbsp; &lt;title&gt;Fetch and source&lt;/title&gt;<br>
++&nbsp;&nbsp;&nbsp; &lt;script src=3D&quot;/resources/testharness.js&quot;=
&gt;&lt;/script&gt;<br>
++&nbsp;&nbsp;&nbsp; &lt;script src=3D&quot;/resources/testharnessreport.js=
&quot;&gt;&lt;/script&gt;<br>
++&nbsp; &lt;/head&gt;<br>
++&nbsp; &lt;body&gt;<br>
++&nbsp;&nbsp;&nbsp; &lt;script&gt;<br>
++promise_test(async () =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; let counter =3D 0;<br>
++&nbsp;&nbsp;&nbsp; Object.prototype.__defineGetter__(&quot;type&quot;, fu=
nction() {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; counter++;<br>
++&nbsp;&nbsp;&nbsp; });<br>
++<br>
++&nbsp;&nbsp;&nbsp; const response =3D await fetch('/');<br>
++&nbsp;&nbsp;&nbsp; const fetchReadableStream =3D response.body;<br>
++&nbsp;&nbsp;&nbsp; const [r1, r2] =3D fetchReadableStream.tee();<br>
++&nbsp;&nbsp;&nbsp; assert_equals(counter, 0);<br>
++}, &quot;Only JS streams should check type&quot;);<br>
++&nbsp;&nbsp;&nbsp; &lt;/script&gt;<br>
++&nbsp; &lt;/body&gt;<br>
++&lt;/html&gt;<br>
+diff --git a/Source/WebCore/Modules/streams/ReadableStream.js b/Source/Web=
Core/Modules/streams/ReadableStream.js<br>
+index ddef56ecd460..7f0def325d84 100644<br>
+--- a/Source/WebCore/Modules/streams/ReadableStream.js<br>
++++ b/Source/WebCore/Modules/streams/ReadableStream.js<br>
+@@ -48,10 +48,10 @@ function initializeReadableStream(underlyingSource, st=
rategy)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; // FIXME: We should introduce <a href=3D"https://=
streams.spec.whatwg.org/#create-readable-stream">
https://streams.spec.whatwg.org/#create-readable-stream</a>.<br>
+&nbsp;&nbsp;&nbsp;&nbsp; // For now, we emulate this with underlyingSource=
 with private properties.<br>
+-&nbsp;&nbsp;&nbsp; if (@getByIdDirectPrivate(underlyingSource, &quot;pull=
&quot;) !=3D=3D @undefined) {<br>
++&nbsp;&nbsp;&nbsp; if (underlyingSource.@pull !=3D=3D @undefined) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const size =3D @getByIdDi=
rectPrivate(strategy, &quot;size&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const highWaterMark =3D @=
getByIdDirectPrivate(strategy, &quot;highWaterMark&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @setupReadableStreamDefaultCon=
troller(this, underlyingSource, size, highWaterMark !=3D=3D @undefined ? hi=
ghWaterMark : 1, @getByIdDirectPrivate(underlyingSource, &quot;start&quot;)=
, @getByIdDirectPrivate(underlyingSource, &quot;pull&quot;), @getByIdDirect=
Private(underlyingSource,
 &quot;cancel&quot;));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @setupReadableStreamDefaultCon=
troller(this, underlyingSource, size, highWaterMark !=3D=3D @undefined ? hi=
ghWaterMark : 1, underlyingSource.@start, underlyingSource.@pull, underlyin=
gSource.@cancel);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+diff --git a/Source/WebCore/Modules/streams/ReadableStreamSource.idl b/Sou=
rce/WebCore/Modules/streams/ReadableStreamSource.idl<br>
+index cce9ea37ce80..ae7f1403b8ac 100644<br>
+--- a/Source/WebCore/Modules/streams/ReadableStreamSource.idl<br>
++++ b/Source/WebCore/Modules/streams/ReadableStreamSource.idl<br>
+@@ -30,10 +30,10 @@<br>
+&nbsp;&nbsp;&nbsp;&nbsp; LegacyNoInterfaceObject,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; SkipVTableValidation<br>
+ ] interface ReadableStreamSource {<br>
+-&nbsp;&nbsp;&nbsp; [Custom] Promise&lt;undefined&gt; start(ReadableStream=
DefaultController controller);<br>
+-&nbsp;&nbsp;&nbsp; [Custom] Promise&lt;undefined&gt; pull(ReadableStreamD=
efaultController controller);<br>
+-&nbsp;&nbsp;&nbsp; undefined cancel(any reason);<br>
++&nbsp;&nbsp;&nbsp; [Custom, PrivateIdentifier] Promise&lt;undefined&gt; s=
tart(ReadableStreamDefaultController controller);<br>
++&nbsp;&nbsp;&nbsp; [Custom, PrivateIdentifier] Promise&lt;undefined&gt; p=
ull(ReadableStreamDefaultController controller);<br>
++&nbsp;&nbsp;&nbsp; [PrivateIdentifier] undefined cancel(any reason);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; // Place holder to keep the controller linked to =
the source.<br>
+-&nbsp;&nbsp;&nbsp; [CachedAttribute, CustomGetter] readonly attribute any=
 controller;<br>
++&nbsp;&nbsp;&nbsp; [CachedAttribute, CustomGetter, PrivateIdentifier] rea=
donly attribute any controller;<br>
+ };<br>
+diff --git a/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h b=
/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h<br>
+index c4d1513ad5c4..1dda9d3834f7 100644<br>
+--- a/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h<br>
++++ b/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h<br>
+@@ -43,8 +43,10 @@ public:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f constexpr (shouldThrow !=3D CastedThisErrorBehavior::Assert) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; if (UNLIKELY(!thisObject))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rejectPromiseWithThis=
TypeError(promise.get(), JSClass::info()-&gt;className, operationName);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else=
 {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; UNUSED_PARAM(operationName);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; ASSERT(thisObject);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A=
SSERT_GC_OBJECT_INHERITS(thisObject, JSClass::info());<br>
+<br>
+--<br>
+2.40.0<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.36.8.bb<br>
index 1dac4f5677..e340c3b19d 100644<br>
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
le://CVE-2023-23517-CVE-2023-23518.patch">file://CVE-2023-23517-CVE-2023-23=
518.patch</a> \<br>
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

--_000_BL0PR11MB34101D5167BABFA53EDC4ADD9F52ABL0PR11MB3410namp_--

