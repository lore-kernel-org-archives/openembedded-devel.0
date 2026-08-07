Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF6DC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:56:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36547.1786082174089395767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 22:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=hRjb59VZ;
 spf=pass (domain: est.tech, ip: 52.101.66.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry8XtsEmfiCG5/iJqj+kOj2LBXvkIUWI1r6f/qLtIA48AdbYV6aWZgkA7jt8bSYWhZDb73DusXwBKSYAvXvyGlcVz0sWLrcyJyJW1iMHEdCP9mVlLp6GPH/HF/Bi3BTO1ukFCbxtrGnq905Q/e+kXa1To1VoK9mp3QJaeEdRvLgm3uDP9Rk99Sax0otABz/3Q335xGm5TsWRGYdJV6XBp7lMV7zkj9N3Ca8tdstx7l/DwAhgwLWs5cre47sGjy0CQSCLqWeJXvrmZTff7WZLDLyQpTwZwPnmb1V15pKg/7etKYSs7tjuyvIIPtK9gWuj2xxR91S1oF7zeBLcnY4tCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRkF1Szfkctn6XpWUpW+ecV9VOd5FDlTCLIGngaawSE=;
 b=CXvgNTW8CmmMsvGqIdB0PgBwDY0AMo1AyRKwoey9shTE5oaCZhQ7k1NMsWStYUXlCyS7lZCYHBcjieWF2+Gj/OAy52lo6IqQ7uCkn6TvQdIwv4xAaF3Ny6iMv3K9XzzdwnPTCAVXCkdhrjnkDCDM3/381RKsl1J2yFNfwT5znCRiei5quVNb9qmkYwnGV2886aUkfp3MmJeVnUF4Ej9NDVzvwDgWMLycqgyG7Fw9Zq6JA929NQbbD4L7yqFjlnOGhrXxXbArQSG/cPJ1Y9g9pwCBkVEtwGXPhmhVoon86RKF9UfgrszcXw1LXBK3cVrQkn+R114Gbm2VKnKBJEJ1pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRkF1Szfkctn6XpWUpW+ecV9VOd5FDlTCLIGngaawSE=;
 b=hRjb59VZA64eTzy0l2EC6xNpxEU61zcLm9YxmMMdPNLzJwH3qsHHlyK08VpjNLIfrrRP6FrmNzAvdxFah5hrjjkvQYEOA+xs3WzMkESBYKRt/brpHjMZA9XsshPtnAlMmihtEZrejHWT4SWdWtADlIfiMJs/SORtPkYU4pAJulmm1hgQyhoW8V1hSxwusgvq40vZx6zRO3mRT8uyCdCK9bS/0VgE2qTYvz16xjWnrEEfV7yx08GuwcvWkUdWriCwpyKFoSQ9MIYc1cKCx+nu2Gcoib2Yvg97WxYpP5yHIDQSPntDMwDCTlGXDXkRVqhF7pIBN/LATAI7gBlaWc7naw==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB2912.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.9; Fri, 7 Aug 2026
 05:56:07 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 05:56:07 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: Re: [oe] [meta-networking][PATCH 2/3] net-snmp: Backport upstream fix
 for explicit library linking
Thread-Topic: [oe] [meta-networking][PATCH 2/3] net-snmp: Backport upstream
 fix for explicit library linking
Thread-Index: AQHdJSEUeGTQb2Pi1UeEy7VSnny+RraSF/pc
Date: Fri, 7 Aug 2026 05:56:07 +0000
Message-ID: 
 <DU7PPF66507B2D76B0DC1B2BFBE539BBE38F3D12@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260805212612.1351211-1-khem.raj@oss.qualcomm.com>
 <20260805212612.1351211-2-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260805212612.1351211-2-khem.raj@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|GV2P189MB2912:EE_
x-ms-office365-filtering-correlation-id: 6f663095-54dd-4c43-9c9e-08def44892cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|10070799003|376014|366016|1800799024|13003099007|38070700021|56012099006|4143699003|11063799006|10067099003|8096899003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 
 TJSmG/u1/Tw6MO2lGvIfiPL/X2OMg7FE8OjOnDMon36rdKco3HP6t/f+ckJ3INr11QnvnpT4uFuP86BQA7F0HJj7+xfbMqwMrBtAhvWs0N5DYqgw/XDGvPJuvnsnEHvcckrWjhSajrzhTZxe997bOCrGZPo1i9+EQqMe0iOZLmZX6jTr8XCnfdI07f88ZGuAtzsPFDnv+Oeq9Yr+2j7Cv3+OE333gfhoq0rARZ6985m9utdo/dowhtSztLPppT+6UbWkJSxO98qG0QI4NF6uG+vAgFd1N/dXlDH6fk2idBWkLdETBKMKpCIizoWTqYBLP6WVsR++pPr521bWzo6GL/WMDZSQmq97O60hITTvCvpe+61xk8ScoWivfrF8jzZk8Z67+KkZ9GfsjXJFFpmRrIHrspuQyWmx2tQ0ojmqdgRrDXsfdaXJvU/DYlY580uq/IRLN0CLP52NxexuCCqtluczqoQOeEJ6vtNHZeC0pMXtjEIDy7cz+jDazEbDszB6+5o97Itl2QXNZe30xGm/vUcDBxNTP01USARxWop/4SDR/4pHUEwTsa2Ip7alUGdl+/kqpwS3R5oXP/ov/+pkzLR4nkI8JrmHRl7T6YeYjYcdppCTMq84aQNb073wxKNKd5Euml1I3WjEd0sYFqmWyaGzUlggzvi8RP55vtcD0mE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(366016)(1800799024)(13003099007)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(8096899003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?d3owWlNtY2lIVTF0ZkIwZk5Jd0x0Nlo3SXVrUUlNQm9RTEYxbHNxMkVp?=
 =?iso-2022-jp?B?VGp2YkJvbXhjeUxkYkxMZDcvTzZkWkNTc3UrRURDZ3I5dFBnZjc1U0I5?=
 =?iso-2022-jp?B?YitGS2lBVGx1MHdocVVBYWUwSGtZNjNQMGNmN0VQelBKVTZhMWxiOVJJ?=
 =?iso-2022-jp?B?blNINjZ0WExzSlZyU3pibjAzOVlXTVlhMEI4bXpjZldsNkZ6c3BZNTU1?=
 =?iso-2022-jp?B?ZlYvd2lpdkFaQWNGUGxmcWdzRnpUQ0hicnpsZXFaSlZ0THIwc2xNY1Zw?=
 =?iso-2022-jp?B?dkR4OXM1eEpzcVpLTTVaTGNBdWxtMzM5ZWVtbWFucjh1THJLL0cxS1Bx?=
 =?iso-2022-jp?B?SDk3YlE2M1V2NTVEWlFhS1ZyM3F5RGpkcGtBWFhaY2p2bGEzQ0luMWpJ?=
 =?iso-2022-jp?B?T2FEbUJvQVJQNnhUa2hIejk4aEV1NFpCbmtLOW5mOThCcHZGOVAvRmtH?=
 =?iso-2022-jp?B?cmNsNXlMM3U0Ym9DVVM4UmlNaHBLSWNZZ0R0YjkzZVNETmJ5U2NDZXli?=
 =?iso-2022-jp?B?VGpWd1hBdGJkQkZocmc1bnEvSEZsbEl2N3EwS3pBaGx1MXowTjJhSkQ5?=
 =?iso-2022-jp?B?b3NLeW9naWxXVU5YQy9ZWU5sd2xoc3pOeTBnaEJhYnVVSEFXYmhuZFV3?=
 =?iso-2022-jp?B?Nzg5RURiYm9pcGNTaWVnQ0haSTFKbVJPNHZrQmRvTzZsUzNkL0FBVGl1?=
 =?iso-2022-jp?B?UnBRNkpnaVdtTkkzaXhsbWMxZVRSTVNBaVdZdVI3YVIzUWlqT3M1RGdV?=
 =?iso-2022-jp?B?TUczbjc3aVNnUGYvWWxDVVBjREV0QWRSZmhnbU51ZHFnVVMwMjJpbFhG?=
 =?iso-2022-jp?B?SXNqU01yaUw4TmdmN3Bnc0hrakNjZWcrT2JGYklvVDB2YkMvUDJjcGFK?=
 =?iso-2022-jp?B?djdGWUkzUVhOV0tma0d3SnpzWTJDNUs0N2tYNTJmb3JoWHJ6VEVoWk1O?=
 =?iso-2022-jp?B?dE05eWRyN05ZQTFTcFdYZnZob2NxUERDWlptNjEvbXJBc2gwRlpWc3dm?=
 =?iso-2022-jp?B?NXlpRFFoLzI3VGg3bDJoVE9BTTN0dlFianVEUFN4V1VOcElNR3BMYUhl?=
 =?iso-2022-jp?B?N2xYMFhBcDMvY2M0Z000K0FhWTBva0ZMSFR1RnI5WU5mai9uOVpUYWxy?=
 =?iso-2022-jp?B?VklxaDlDM2FSWkQ2SCt4cHNvV2EyU0c3UndYaVVGbFpqaEVBVGxwVnBZ?=
 =?iso-2022-jp?B?bWtuT0JHbGZnaHo1eFdFbHFrYkFsTXZnOXpUL0pWUmtSODVGQzhSb2pG?=
 =?iso-2022-jp?B?SjMvdjZWVzExMDBjSzdTeDI2Q1IyaVpraVBaV3hLVVVZRmNIeTc5OHpr?=
 =?iso-2022-jp?B?Z2tmNldlOWxrTWxKcG5RUW5QNGNIc0ZBNC9OY3FNU0hVWTZQNm0rVTFk?=
 =?iso-2022-jp?B?Qnh2MzhlRlo5ejZtUHFadnRXRUFSVGZsV2trM1J1dDl6SWJsRVM5MGdB?=
 =?iso-2022-jp?B?UGFoNFFWQy8za0lWWDJOa2F3Yjd0ODlCVGg2blp5ZHZ4c2pyVWIrZ1I4?=
 =?iso-2022-jp?B?K0xjZ1pSVngvY1VLS3ZFSVVlN2hBMmhzZ3RwSGlRYUJQYi95WVVFczhq?=
 =?iso-2022-jp?B?ZzNzbnpabXBOQm5udGRNekg1M0I1blRFVnFrSWVMQWxuVUtlcDdqejIy?=
 =?iso-2022-jp?B?R3NuWXdhcXdtcjBrYVl5SDIvSitvblgzb0NUSHdTVUo5TUtBNitYK0RS?=
 =?iso-2022-jp?B?d3RjWFBXUWgzZHVQQlFIbGZCenBYd0JQZFdsSjRuT3dsV2ttSER3T3Vn?=
 =?iso-2022-jp?B?WG42cFJYYjZiL3NVRmJRaytIcWl6Z3U1aUFrMUc3UERxRXl5Um1Fdloz?=
 =?iso-2022-jp?B?cGREcEFMMkpLZk1zbFYwdGMrTE9PQTkxdktSSUNhL1NyaGIrbGRMYTVq?=
 =?iso-2022-jp?B?SWFwRnlRbk9rUlZLem1GbllxdndBRVBMV2xLd0FOMjdOeEhNUUNtTmYx?=
 =?iso-2022-jp?B?QzJoUHpvandjNGdZeWhORVdFM0JWbGtJVEpNZkVmTVloTmJOMGpJcVli?=
 =?iso-2022-jp?B?dWRleVJ0ZURzQ1doWXlCbEE1Ty9aTEd3NDMzQmI3VFZET1VMUTJqQVdW?=
 =?iso-2022-jp?B?NkJzK0l5YmJuZlZndWZYVnBGNjRyWlc3aEw1NkFTQlFlUW5XQ0RabDEv?=
 =?iso-2022-jp?B?TzhWM2M1TDZqR25odWpPWnRMZ2pyV09IbmZQZ1JxcVZMcUpoKzAyeU5E?=
 =?iso-2022-jp?B?cXF4cHNNalZ0RE05U1lrMWVVZmI4VlJkVnNzK0U1Rnd2eTY2S1NXL2w5?=
 =?iso-2022-jp?B?ZzE4Tmc3bGhwWkxMRUtzMS9CeE02dDAyeHlXV3E1RVVTay9mQUhuNFlY?=
 =?iso-2022-jp?B?MUNFamk3ckhpM3FvMEcrYnhMWXpCTUtvZGZIRVBtajNUZEZYQWxGZzRa?=
 =?iso-2022-jp?B?R25OUmVrOTlQM0ViRlNrSXZmbjM5aTNIVk4xdVhBV0RTL09aQ3BsZ1BR?=
 =?iso-2022-jp?B?cFRaeDZqVmI5UVdnWEhrM2JtcFZ0dmh4cjdrSWFjNy8wcDBEKzgzbUMz?=
 =?iso-2022-jp?B?SFlUTk1CbCtkUlBSOVJNdmF3Q1NTckRlaEFzUE1xZURzRGgySCtKck1P?=
 =?iso-2022-jp?B?Y2NhTGRLbmQ5dlZtQXB1Y3kvZFpoM2NpVG80bHY5cjlJZVg0?=
x-ms-exchange-antispam-messagedata-1: 2VgOdqUgpBCauuCv5BoDEj857lQtdec7nic=
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D76B0DC1B2BFBE539BBE38F3D12DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f663095-54dd-4c43-9c9e-08def44892cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 05:56:07.0355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G6lUGX9L2b90Ps19FU9IP45SUvDKG23gU0yPUzBuNUKvTGsaE7NVfC0nOhPoyU3+gY8pLTTBemWQOkOiwBvaO7dbt3WEk0ekQtuWdOvQ4jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2912
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 05:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128857

--_000_DU7PPF66507B2D76B0DC1B2BFBE539BBE38F3D12DU7PPF66507B2D7_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

This fixes the net-snmp 5.9.5.2 do_compile failure we hit after the libtool=
 2.5.4 =1B$B"*=1B(B 2.6.2 upgrade (link_all_deplibs=3Dno exposing missing d=
irect dependencies in libnetsnmptrapd).

 Tested-by: jaipaul.cheernam@est.tech

Regards,
Jaipaul
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org>
Date: Wednesday, 5 August 2026 at 23:26
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe] [meta-networking][PATCH 2/3] net-snmp: Backport upstream fix =
for explicit library linking

libnetsnmptrapd uses symbols that live in libnetsnmpagent, but
apps/Makefile.in only passes $(MIBLIB) and $(USELIBS) to the link. That
works with GNU ld, which resolves symbols through the DT_NEEDED entries
of the libraries named on the command line, and libnetsnmpmibs records a
dependency on libnetsnmpagent. lld deliberately does not, so the link
fails:

| ld.lld: error: undefined symbol: init_vacm_config_tokens
| >>> referenced by snmptrapd_auth.c:51
| >>>               .libs/snmptrapd_auth.o:(init_netsnmp_trapd_auth)
| ld.lld: error: undefined symbol: send_v2trap
| >>> referenced by snmptrapd_handlers.c:886
| >>>               .libs/snmptrapd_handlers.o:(axforward_handler)

Backport upstream commit 5e66246bd994 which names $(AGENTLIB) explicitly
and additionally links libcrypto into libnetsnmpmibs and the apps, both
of which rely on the same transitive resolution. The libnetsnmptrapd.la
hunk is rebased because 5.9.5.2 still puts $(LDFLAGS) at the end of that
link command.

Verified on aarch64 for qemuarm64: do_compile fails before the change
with the errors above; after it do_compile and do_package succeed and
libnetsnmptrapd.so records DT_NEEDED on libnetsnmpmibs, libnetsnmpagent
and libnetsnmp directly.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...akefile.in-Link-libraries-explicitly.patch | 103 ++++++++++++++++++
 .../net-snmp/net-snmp_5.9.5.2.bb              |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/001=
2-apps-Makefile.in-Link-libraries-explicitly.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-apps-=
Makefile.in-Link-libraries-explicitly.patch b/meta-networking/recipes-proto=
cols/net-snmp/net-snmp/0012-apps-Makefile.in-Link-libraries-explicitly.patc=
h
new file mode 100644
index 0000000000..5129282ef2
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-apps-Makefil=
e.in-Link-libraries-explicitly.patch
@@ -0,0 +1,103 @@
+From 5e66246bd994a2f693bd02773823691c8d07a070 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Fri, 24 Jul 2026 09:34:18 -0700
+Subject: [PATCH] apps/Makefile.in: Link libraries explicitly
+
+When building Net-SNMP with -no-undefined (which is used for libraries lik=
e
+libnetsnmpmibs.la and libnetsnmptrapd.la) and link_all_deplibs=3Dno (defau=
lt on
+modern systems to prevent overlinking), compilation fails due to undefined
+references to symbols from transitive dependencies.
+
+1. libnetsnmpmibs.la fails to link because it uses OpenSSL DH/BN symbols
+   (when snmp-usm-dh-objects-mib is enabled) but does not link with
+   libcrypto directly. Fix this by adding LIBCRYPTO to LMIBLIBS in
+   configure if OpenSSL is used, and exporting LIBCRYPTO.
+
+2. libnetsnmptrapd.la fails to link because it uses symbols from
+   libnetsnmpagent.la (like vacm_check_view_contents) but does not link wi=
th
+   it directly. Fix this by adding $(AGENTLIB) to libnetsnmptrapd.la link
+   line in apps/Makefile.in.
+
+3. Executables in apps/ (like snmpusm and snmptls) fail to link because
+   they use OpenSSL symbols directly but do not link with libcrypto/libssl
+   directly. Fix this by adding @LIBCRYPTO@ to LIBS in apps/Makefile.in.
+
+This makes Net-SNMP compatible with newer versions of libtool.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/5e6=
6246bd994a2f693bd02773823691c8d07a070]
+
+The libnetsnmptrapd.la hunk is rebased: 5.9.5.2 still puts $(LDFLAGS) at
+the end of that link command, upstream has since moved it before
+$(LLIBTRAPD_OBJS). The change itself is unmodified.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apps/Makefile.in            | 4 ++--
+ configure                   | 7 +++++++
+ configure.d/config_os_libs2 | 6 ++++++
+ 3 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/apps/Makefile.in b/apps/Makefile.in
+index 57b8524..252fd84 100644
+--- a/apps/Makefile.in
++++ b/apps/Makefile.in
+@@ -95,7 +95,7 @@ MYSQL_LIBS   =3D @MYSQL_LIBS@
+ MYSQL_INCLUDES        =3D @MYSQL_INCLUDES@
+
+ VAL_LIBS      =3D @VAL_LIBS@
+-LIBS          =3D $(USELIBS) $(VAL_LIBS) @LIBS@
++LIBS          =3D $(USELIBS) $(VAL_LIBS) @LIBS@ @LIBCRYPTO@
+ PERLLDOPTS_FOR_APPS =3D @PERLLDOPTS_FOR_APPS@
+ PERLLDOPTS_FOR_LIBS =3D @PERLLDOPTS_FOR_LIBS@
+
+@@ -235,7 +235,7 @@ snmppcap$(EXEEXT):    snmppcap.$(OSUFFIX) $(USEAGENTLI=
BS)
+        $(LINK) ${CFLAGS} -o $@ snmppcap.$(OSUFFIX) ${LDFLAGS} ${USEAGENTL=
IBS} ${LIBS} -lpcap
+
+ libnetsnmptrapd.$(LIB_EXTENSION)$(LIB_VERSION): $(LLIBTRAPD_OBJS)
+-      $(LIB_LD_CMD) $@ ${LLIBTRAPD_OBJS} $(MIBLIB) $(MYSQL_LIBS) $(USELIB=
S) $(PERLLDOPTS_FOR_LIBS) $(LDFLAGS)
++      $(LIB_LD_CMD) $@ ${LLIBTRAPD_OBJS} $(MIBLIB) $(AGENTLIB) $(MYSQL_LI=
BS) $(USELIBS) $(PERLLDOPTS_FOR_LIBS) $(LDFLAGS)
+        $(RANLIB) $@
+
+ snmpinforminstall:
+diff --git a/configure b/configure
+index 6ef0026..4270aff 100755
+--- a/configure
++++ b/configure
+@@ -683,6 +683,7 @@ PERLLDOPTS_FOR_APPS
+ PERLLDOPTS_FOR_LIBS
+ EMBEDPERLUNINSTALL
+ EMBEDPERLINSTALL
++LIBCRYPTO
+ LIBCURSES
+ HAVE_LIBCURSES
+ NETSNMP_BUILD_PCAP_PROG_FALSE
+@@ -32065,6 +32066,12 @@ printf "%s\n" "$netsnmp_cv_func_ceil_LNETSNMPLIBS=
" >&6; }
+  fi
+
+
++if test x$CRYPTO !=3D x; then
++    LMIBLIBS=3D"$LMIBLIBS $LIBCRYPTO"
++fi
++
++
++
+ cat >confcache <<\_ACEOF
+ # This file is a shell script that caches the results of configure
+ # tests run on this system so they can be shared between configure
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
+index 5787e58..d21ea77 100644
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -718,3 +718,9 @@ AC_SUBST([LIBCURSES])
+ #   libm for ceil
+ #
+ NETSNMP_SEARCH_LIBS(ceil, m,,,, LNETSNMPLIBS)
++
++if test x$CRYPTO !=3D x; then
++    LMIBLIBS=3D"$LMIBLIBS $LIBCRYPTO"
++fi
++
++AC_SUBST(LIBCRYPTO)
+--
+2.43.0
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
index 00a7b50cdf..48704d020f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV=
}.tar.gz \
            file://0009-net-snmp-fix-for-disable-des.patch \
            file://0010-net-snmp-Reproducibility-Don-t-check-build-host-for=
.patch \
            file://0011-ac_add_search_path.m4-keep-consistent-between-32bit=
-.patch \
+           file://0012-apps-Makefile.in-Link-libraries-explicitly.patch \
            file://netsnmp-swinst-crash.patch \
            "
 SRC_URI[sha256sum] =3D "16707719f833184a4b72835dac359ae188123b06b5e42817c0=
0790d7dc1384bf"

--_000_DU7PPF66507B2D76B0DC1B2BFBE539BBE38F3D12DU7PPF66507B2D7_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
</head>
<body>
<div style=3D"direction: ltr; line-height: normal; margin: 0px; font-family=
: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Hi Khem,</div>
<div style=3D"direction: ltr; line-height: normal; margin: 0px; font-family=
: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
<br>
</div>
<div style=3D"direction: ltr; line-height: normal; margin: 0px; font-family=
: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
This fixes the net-snmp 5.9.5.2 do_compile failure we hit after the libtool=
 2.5.4 =1B$B"*=1B(B 2.6.2 upgrade (link_all_deplibs=3Dno exposing missing d=
irect dependencies in libnetsnmptrapd).</div>
<div style=3D"direction: ltr; line-height: normal; margin: 0px; font-family=
: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;Tested-by: jaipaul.cheernam@est.tech&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Jaipaul</div>
<div id=3D"mail-editor-reference-message-container">
<div class=3D"ms-outlook-mobile-reference-message skipProofing">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
</div>
<div style=3D"padding: 3pt 0in 0in; border-width: 1pt medium medium; border=
-style: solid none none; border-color: rgb(181, 196, 223) currentcolor curr=
entcolor;">
<div class=3D"ms-outlook-mobile-reference-message skipProofing" style=3D"te=
xt-align: left; font-family: Aptos; font-size: 12pt; color: black;">
<b>From: </b>openembedded-devel@lists.openembedded.org &lt;openembedded-dev=
el@lists.openembedded.org&gt; on behalf of Khem Raj via lists.openembedded.=
org &lt;raj.khem=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Date: </b>Wednesday, 5 August 2026 at 23:26<br>
<b>To: </b>openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc: </b>Khem Raj &lt;khem.raj@oss.qualcomm.com&gt;<br>
<b>Subject: </b>[oe] [meta-networking][PATCH 2/3] net-snmp: Backport upstre=
am fix for explicit library linking<br>
<br>
</div>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">libnetsnmptrapd uses sy=
mbols that live in libnetsnmpagent, but<br>
apps/Makefile.in only passes $(MIBLIB) and $(USELIBS) to the link. That<br>
works with GNU ld, which resolves symbols through the DT_NEEDED entries<br>
of the libraries named on the command line, and libnetsnmpmibs records a<br=
>
dependency on libnetsnmpagent. lld deliberately does not, so the link<br>
fails:<br>
<br>
| ld.lld: error: undefined symbol: init_vacm_config_tokens<br>
| &gt;&gt;&gt; referenced by snmptrapd_auth.c:51<br>
| &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; .libs/snmptrapd_auth.o:(init_netsnmp_trapd_auth)<br=
>
| ld.lld: error: undefined symbol: send_v2trap<br>
| &gt;&gt;&gt; referenced by snmptrapd_handlers.c:886<br>
| &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; .libs/snmptrapd_handlers.o:(axforward_handler)<br>
<br>
Backport upstream commit 5e66246bd994 which names $(AGENTLIB) explicitly<br=
>
and additionally links libcrypto into libnetsnmpmibs and the apps, both<br>
of which rely on the same transitive resolution. The libnetsnmptrapd.la<br>
hunk is rebased because 5.9.5.2 still puts $(LDFLAGS) at the end of that<br=
>
link command.<br>
<br>
Verified on aarch64 for qemuarm64: do_compile fails before the change<br>
with the errors above; after it do_compile and do_package succeed and<br>
libnetsnmptrapd.so records DT_NEEDED on libnetsnmpmibs, libnetsnmpagent<br>
and libnetsnmp directly.<br>
<br>
Signed-off-by: Khem Raj &lt;khem.raj@oss.qualcomm.com&gt;<br>
---<br>
&nbsp;...akefile.in-Link-libraries-explicitly.patch | 103 +++++++++++++++++=
+<br>
&nbsp;.../net-snmp/net-snmp_5.9.5.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 104 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/0012-apps-Makefile.in-Link-libraries-explicitly.patch<br>
<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-apps-=
Makefile.in-Link-libraries-explicitly.patch b/meta-networking/recipes-proto=
cols/net-snmp/net-snmp/0012-apps-Makefile.in-Link-libraries-explicitly.patc=
h<br>
new file mode 100644<br>
index 0000000000..5129282ef2<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-apps-Makefil=
e.in-Link-libraries-explicitly.patch<br>
@@ -0,0 +1,103 @@<br>
+From 5e66246bd994a2f693bd02773823691c8d07a070 Mon Sep 17 00:00:00 2001<br>
+From: Bart Van Assche &lt;bvanassche@acm.org&gt;<br>
+Date: Fri, 24 Jul 2026 09:34:18 -0700<br>
+Subject: [PATCH] apps/Makefile.in: Link libraries explicitly<br>
+<br>
+When building Net-SNMP with -no-undefined (which is used for libraries lik=
e<br>
+libnetsnmpmibs.la and libnetsnmptrapd.la) and link_all_deplibs=3Dno (defau=
lt on<br>
+modern systems to prevent overlinking), compilation fails due to undefined=
<br>
+references to symbols from transitive dependencies.<br>
+<br>
+1. libnetsnmpmibs.la fails to link because it uses OpenSSL DH/BN symbols<b=
r>
+&nbsp;&nbsp; (when snmp-usm-dh-objects-mib is enabled) but does not link w=
ith<br>
+&nbsp;&nbsp; libcrypto directly. Fix this by adding LIBCRYPTO to LMIBLIBS =
in<br>
+&nbsp;&nbsp; configure if OpenSSL is used, and exporting LIBCRYPTO.<br>
+<br>
+2. libnetsnmptrapd.la fails to link because it uses symbols from<br>
+&nbsp;&nbsp; libnetsnmpagent.la (like vacm_check_view_contents) but does n=
ot link with<br>
+&nbsp;&nbsp; it directly. Fix this by adding $(AGENTLIB) to libnetsnmptrap=
d.la link<br>
+&nbsp;&nbsp; line in apps/Makefile.in.<br>
+<br>
+3. Executables in apps/ (like snmpusm and snmptls) fail to link because<br=
>
+&nbsp;&nbsp; they use OpenSSL symbols directly but do not link with libcry=
pto/libssl<br>
+&nbsp;&nbsp; directly. Fix this by adding @LIBCRYPTO@ to LIBS in apps/Make=
file.in.<br>
+<br>
+This makes Net-SNMP compatible with newer versions of libtool.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/net-snmp/net-snmp=
/commit/5e66246bd994a2f693bd02773823691c8d07a070" data-outlook-id=3D"53a57e=
65-69c5-46bb-a357-38413e61edf9">https://github.com/net-snmp/net-snmp/commit=
/5e66246bd994a2f693bd02773823691c8d07a070</a>]<br>
+<br>
+The libnetsnmptrapd.la hunk is rebased: 5.9.5.2 still puts $(LDFLAGS) at<b=
r>
+the end of that link command, upstream has since moved it before<br>
+$(LLIBTRAPD_OBJS). The change itself is unmodified.<br>
+<br>
+Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
+---<br>
+ apps/Makefile.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; | 4 ++--<br>
+ configure&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 7 +++++++<br>
+ configure.d/config_os_libs2 | 6 ++++++<br>
+ 3 files changed, 15 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/apps/Makefile.in b/apps/Makefile.in<br>
+index 57b8524..252fd84 100644<br>
+--- a/apps/Makefile.in<br>
++++ b/apps/Makefile.in<br>
+@@ -95,7 +95,7 @@ MYSQL_LIBS&nbsp;&nbsp; =3D @MYSQL_LIBS@<br>
+ MYSQL_INCLUDES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D @MYSQL_INCLU=
DES@<br>
+<br>
+ VAL_LIBS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D @VAL_LIBS@<br>
+-LIBS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D $(USELIBS)=
 $(VAL_LIBS) @LIBS@<br>
++LIBS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D $(USELIBS)=
 $(VAL_LIBS) @LIBS@ @LIBCRYPTO@<br>
+ PERLLDOPTS_FOR_APPS =3D @PERLLDOPTS_FOR_APPS@<br>
+ PERLLDOPTS_FOR_LIBS =3D @PERLLDOPTS_FOR_LIBS@<br>
+<br>
+@@ -235,7 +235,7 @@ snmppcap$(EXEEXT):&nbsp;&nbsp;&nbsp; snmppcap.$(OSUFFI=
X) $(USEAGENTLIBS)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(LINK) ${CFLAGS} -o $@ snmppca=
p.$(OSUFFIX) ${LDFLAGS} ${USEAGENTLIBS} ${LIBS} -lpcap<br>
+<br>
+ libnetsnmptrapd.$(LIB_EXTENSION)$(LIB_VERSION): $(LLIBTRAPD_OBJS)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(LIB_LD_CMD) $@ ${LLIBTRAPD_OBJS} $(MIBLI=
B) $(MYSQL_LIBS) $(USELIBS) $(PERLLDOPTS_FOR_LIBS) $(LDFLAGS)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(LIB_LD_CMD) $@ ${LLIBTRAPD_OBJS} $(MIBLI=
B) $(AGENTLIB) $(MYSQL_LIBS) $(USELIBS) $(PERLLDOPTS_FOR_LIBS) $(LDFLAGS)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(RANLIB) $@<br>
+<br>
+ snmpinforminstall:<br>
+diff --git a/configure b/configure<br>
+index 6ef0026..4270aff 100755<br>
+--- a/configure<br>
++++ b/configure<br>
+@@ -683,6 +683,7 @@ PERLLDOPTS_FOR_APPS<br>
+ PERLLDOPTS_FOR_LIBS<br>
+ EMBEDPERLUNINSTALL<br>
+ EMBEDPERLINSTALL<br>
++LIBCRYPTO<br>
+ LIBCURSES<br>
+ HAVE_LIBCURSES<br>
+ NETSNMP_BUILD_PCAP_PROG_FALSE<br>
+@@ -32065,6 +32066,12 @@ printf &quot;%s\n&quot; &quot;$netsnmp_cv_func_ce=
il_LNETSNMPLIBS&quot; &gt;&amp;6; }<br>
+&nbsp; fi<br>
+<br>
+<br>
++if test x$CRYPTO !=3D x; then<br>
++&nbsp;&nbsp;&nbsp; LMIBLIBS=3D&quot;$LMIBLIBS $LIBCRYPTO&quot;<br>
++fi<br>
++<br>
++<br>
++<br>
+ cat &gt;confcache &lt;&lt;\_ACEOF<br>
+ # This file is a shell script that caches the results of configure<br>
+ # tests run on this system so they can be shared between configure<br>
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2<br>
+index 5787e58..d21ea77 100644<br>
+--- a/configure.d/config_os_libs2<br>
++++ b/configure.d/config_os_libs2<br>
+@@ -718,3 +718,9 @@ AC_SUBST([LIBCURSES])<br>
+ #&nbsp;&nbsp; libm for ceil<br>
+ #<br>
+ NETSNMP_SEARCH_LIBS(ceil, m,,,, LNETSNMPLIBS)<br>
++<br>
++if test x$CRYPTO !=3D x; then<br>
++&nbsp;&nbsp;&nbsp; LMIBLIBS=3D&quot;$LMIBLIBS $LIBCRYPTO&quot;<br>
++fi<br>
++<br>
++AC_SUBST(LIBCRYPTO)<br>
+--<br>
+2.43.0<br>
+<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb<br>
index 00a7b50cdf..48704d020f 100644<br>
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb<br>
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb<br>
@@ -24,6 +24,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/net-snmp/net-snmp=
-${PV}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0009-net-snmp-fix-for-disable-des.patch" data-outlook-id=3D"3b8a=
2449-e9ef-4fd1-8264-9f45cf67555f">
file://0009-net-snmp-fix-for-disable-des.patch</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch" =
data-outlook-id=3D"a375ccd2-6771-448d-9093-4c714b45034b">
file://0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch</a>&n=
bsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch"=
 data-outlook-id=3D"478e46ef-b2b5-42d8-8ada-d6ee7901adab">
file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch</a>&=
nbsp;\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0012-apps-Makefile.in-Link-libraries-explicitly.patch" data-outlook-id=
=3D"44512125-e103-4f1b-b3ef-245a0e077e59">
file://0012-apps-Makefile.in-Link-libraries-explicitly.patch</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://netsnmp-swinst-crash.patch" data-outlook-id=3D"f624672a-0099-4df=
1-9ecf-ab8aa1bbec65">
file://netsnmp-swinst-crash.patch</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;16707719f833184a4b72835dac359ae188123b06=
b5e42817c00790d7dc1384bf&quot;<br>
</div>
</div>
</body>
</html>

--_000_DU7PPF66507B2D76B0DC1B2BFBE539BBE38F3D12DU7PPF66507B2D7_--

