Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA767C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 08:53:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21375.1719392030196840062
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 01:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=690732675f=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q1YcA1016483
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 01:53:50 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fuex8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 01:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQg92wsLjuQZASuOfZSdhgiRqAWGi4+8BPti1SqKXdA2lAvnHOdkXn9pMPBXSi09S+1IwdezTMWYkH7+E9bJvnJx55MX5u2CoQGw0JZ5GUvTRCQm8xrLJ+GDUiYhADxqHYUuExv50YAti3tFXti8ivgef7CYPRerc0FuWnGYIF3DwGOTaCvK/S0Lu2Fi1WmqdSyBLJ38yU84F2zA8GBBoUrKdDZ+cPvns0clPz1O4ra2lEGwJQisv46va0Eg/JU6juqBaIeNDs4w0mcM1OHtdy3sbzHPrds5rDxbzitBZ+8AQuHRxWPo0e5l/WspaAiTp82outpXpPg7gJyx1DPULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uknYRXJ1C4GI2kn998rL6/oHxUSVKz2GylsZqZnuA+g=;
 b=Lwk9M7Z7UspSBhrEE3kYakZxLmocYGZfQ6wFpQJTUi4lYxHbqzbGPcR/QmYceLDgYe1T6fuJzEtsssTUZSnuqMfBT3Du4gBKVpfvCBtmPFabdtW7T/wEfAKNRc75/g9mYD4XbfEVQGKrOiO/fSZ6zfm3gw9roFy34NE4/+/LvxUZbqP6cwZNCtaW4U80vXv6uLsO92nr/XeB9In6Dv8dEbCKXqxeM7JAU8jJazZS3bCaifAME885jUjX/P9Br+x0BHRfnXF9j742BBvHqz8b/h1MZo+cSitYu5903YEyRKrMtJlwUHjnYlH2FDAtPEWejEQ5EUQfB4SuZydw138png==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by MW4PR11MB6788.namprd11.prod.outlook.com (2603:10b6:303:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 08:53:45 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::14d5:b763:637b:cb68]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::14d5:b763:637b:cb68%6]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 08:53:44 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Sambu, Soumya"
	<Soumya.Sambu@windriver.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] php: Fix CVE-2024-5458
Thread-Topic: [oe][meta-oe][scarthgap][PATCH 1/1] php: Fix CVE-2024-5458
Thread-Index: AQHaxd5tD6xiH2ll00GUFV1C0QuuqLHZwJsY
Date: Wed, 26 Jun 2024 08:53:44 +0000
Message-ID: 
 <BYAPR11MB339789003745C5EC6B0D430C81D62@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <17DBCFCEEFB347B2.28936@lists.openembedded.org>
In-Reply-To: <17DBCFCEEFB347B2.28936@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|MW4PR11MB6788:EE_
x-ms-office365-filtering-correlation-id: 0f674c38-f5ac-413a-0d22-08dc95bd7c38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|1800799022|366014|376012|38070700016;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?TF2wIFswPHZVpxmpnBZ/dGaCSVjoEeTA/BUszV5sjFVQzRMGHk/A3VtIiE7p?=
 =?us-ascii?Q?duVSTWGiUXd/0nGibXC6FY8ccmHr3uJ7PwpCpDZoav5vhlpT4QnUqxX0cS+w?=
 =?us-ascii?Q?Vb2HjXZKl0x+kwSj6bIhnuDNhGmxicggug/vlMGipSXSHhP3Hb+OWtZeTNfi?=
 =?us-ascii?Q?OWWJ8g4vRwLp94LKWr6e2qieCFYK49PqJ+UENrOkmfYpB5/kRlrabRkUjtxO?=
 =?us-ascii?Q?uQbj7nwPRwSoBuFZVWAqPMAEJHdb0NQmRwaTNwp5TwYDcyQwN7fZGiSFMkO4?=
 =?us-ascii?Q?lwdr8p2jICIvNbBySNJ9hQ0x/gH4iwOs/eGJ+ELzDkTJuDJrOFDnfUPqxwf9?=
 =?us-ascii?Q?LtlbN8Nt3y/jvsjFz6GyjzhQZqB03YFvItuM/EYPQMYYjDTWibZk71zskQra?=
 =?us-ascii?Q?yMeILMXkXF5ZNiiNfY7w9TEZgaDDBFJFgfdlMWFmlbRDQsF6VDBpfe/yxBWZ?=
 =?us-ascii?Q?xKjpBU2S41pF0ByxzIohfTUv9kadWKVzsW784UH7stj4ViriPrxQ3/NDNfwU?=
 =?us-ascii?Q?vtS1i95+gU/+bUentMOaagO7KH/sXihnASc69lMx8zPQ+6GoIzA3TfhByLON?=
 =?us-ascii?Q?6sbD7Km7abIZat+O3wfQfbkNT7S+xIHukStuAywSgETXzUV3pKLK4+Q3D0Im?=
 =?us-ascii?Q?3Dy3YhLLg1g0QeEFYQPqy5gOGtpf/fNsFW6jTkTf4Mo1wcsSvF/wLFVC9abw?=
 =?us-ascii?Q?R965nNMEFb2ZiIYUK7QK4udjcY58HL7bVh6eVbjhSPtTUfhTHx9jF/3XI4+d?=
 =?us-ascii?Q?NPTT0NOZKxIH3HuTw+cQ9lxNSrrcRlHFjXyk88TC5Z1P23OTYvEYHTLoerB/?=
 =?us-ascii?Q?9f49TSoAeMPX7DuXD01BJSqhuC4zeFT3jTEqnD2K5TzUicD2kU0nhapxpFr0?=
 =?us-ascii?Q?pdvYpVnI/kCXPZbDD4tB/qVZ4x4HlxPu8x3KmIGfGl3Q8VsR9Cs2iLNqOlx7?=
 =?us-ascii?Q?dJpKfh7UfrDmF4+AC2MG3AExyxJ1tvqoh2QjauWQBC+B9256FBSZrB42VVWO?=
 =?us-ascii?Q?/hNXhrACShokbxjwmPA1IA/5XPbyOR6lqk6X2qVkzwGCeb8xGhRJYEIVggma?=
 =?us-ascii?Q?BWiQWnTuhY0ktz76357ZYqOZETaVvnpC7mlf0L6x4iZLvhBZYCuBdE/MrDfY?=
 =?us-ascii?Q?hk/H1Y5f7Bt4IHUT3FE4WyNi3RuoLkPJ5zNXmuif8BUgsD+oJR18Uj+2GbEq?=
 =?us-ascii?Q?JIbZYIbMC7VHhkrj9tUfs+u/fY8EEaz+e6VLVT6Wlxlh4dIqoVVW6diNLd5z?=
 =?us-ascii?Q?YpZsSumiRtEKhOeO+7IcX2AEWUwlzxD5m1akBnzypUHDjr87dDfDfKZMtlQq?=
 =?us-ascii?Q?N/M7ZjXNd28tUKf/irG+aKqM?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(376012)(38070700016);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gpgcUcYL21ahYUvFSehuKgY7DhoPVCBV0/b/ScqW2s2V9fmLNwzdK5hl+e9T?=
 =?us-ascii?Q?m4ot4GxGDfS4r9/oS9XP/GRxJv9iuAXoZtmhKwoBNmZuw+IeHDDqJz6Q4LyI?=
 =?us-ascii?Q?H+dQKsZ/jc2JQ87avFNe6loZHBJsvw2iHqrHSP7kS4+b5jwPeNqxbZyPYI/m?=
 =?us-ascii?Q?CBWDJLsfyNGSoqP5Y+WUiupscQeMXKY0XqihNa94nAYbWRxHnHIcewt7Txi1?=
 =?us-ascii?Q?KD/XrcwVioLKGHh8zgXWfmtpnomI/TqMqGDuwtWc23IPbzE1lKjgkcTUOzjs?=
 =?us-ascii?Q?VC4uEA+9kMXBX4O/TziCtYIDVVciU89pfIq67xfqipbdt+MCqD5pHhlWYS2a?=
 =?us-ascii?Q?njHCgUv1f8q2BrJEQp/vbFYpH5vMwWB/rsCtzqaxtWfmiTH0HiIoxEQ315iN?=
 =?us-ascii?Q?UZpx6s2NngbLrhqq520n76sGm5UzR2yWSE3eQuQfYXhyhtwFloeQPDqCXdFP?=
 =?us-ascii?Q?2LQldsA1lI05WoV5fwGj0907UHhUBBFFbCMR9vQppQDQ9XMULiFA7P9kQgB7?=
 =?us-ascii?Q?d3Bidyc9lMOPP+kj/37SZIRpQCKFrxW2J4utRVLXp/YTk7jg1e7oypovLVDh?=
 =?us-ascii?Q?ELO89fwRLSatEhp2EGmq80Cd6pu6E2WKCvIH+Zr6D83qeZ/RUP6qDYqaAayM?=
 =?us-ascii?Q?DkTTVA23AcENiRZJOP+P/9/JbbqtM/Cx+8egj7/JxVEb5d+Dh58FzCZthurI?=
 =?us-ascii?Q?mZI5Yf7YKM8F4mEBZmaqGRrKt5sBlOybndYgznIFMntjcvn8G/uj+4msCv6P?=
 =?us-ascii?Q?4i0lW+6wUERF+fiuXUG+7K77bDDfXDcMpV65ByWtc4pmwt2Gagkec8zNM3kr?=
 =?us-ascii?Q?XDI2+ktM7T0KO+HHnWqxDVznKPV7IYgB56hNEiSyVLA6F0N24u+YXM3+zaZ+?=
 =?us-ascii?Q?VoVNCem9boBtc/dpyy8X+f4D6dGRMyg4dQXNEdfhWPiDOBS68fJXWjpqyr4U?=
 =?us-ascii?Q?T/ZJEzOakWD6mVYlAiL07zFkaG5GR/3uaiVwRJdzSFrLI2p46nst+9H8rUxG?=
 =?us-ascii?Q?moLa7Y257RVtRPmM6HzfUgTK0GZ3ftn+QtHZG4vYndAaLPaN4JiHyKfsGixN?=
 =?us-ascii?Q?AbeeNZZLhBx4KMsrwdbxbgs5S+p4RLzgU5n7H5+TEPK89lXIuJNR40ehfMGL?=
 =?us-ascii?Q?KNk6VRNdZbHCvDbYJQ9NbRAomomo4z+qyvFwSVyIQX+jZOSHmfPVtc9SEgnw?=
 =?us-ascii?Q?irq5gXCWrxXme0EJHMF7nbDNJDeT82QrSQa6bO7ocDi8EIdok55e4XpLkgWZ?=
 =?us-ascii?Q?N4xJHdgp+YfNXXWwaZAp6QUzFVMHmP9BublUND2eeRc2fKEkVDOjNMIrECFc?=
 =?us-ascii?Q?LRyXdo3GwAS6YysSnxXWKL8e1DTrrgSHsb0HWxp0gsCG7zh/keHsKWw3aBDx?=
 =?us-ascii?Q?MTkOKPnytxBwclGsVZ8Re8jfeIPpj4GSjpe/566qONjSUWY5+WCQ7po8aaX6?=
 =?us-ascii?Q?pEsCS/5co9rW19ppFDpnKq0huIvpcxUSxSK1OlY8T1tZ4CLixjwce6nLKaSs?=
 =?us-ascii?Q?1/A9tPlyVpuIkwyzu+pdI0jkkXwYT0PfOGoFadA96XAMH1P6icINduw45k1D?=
 =?us-ascii?Q?VaVap9sUgcNQtBPSLe/uibsgBEFYOmHH/LY+1T3J?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB339789003745C5EC6B0D430C81D62BYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f674c38-f5ac-413a-0d22-08dc95bd7c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 08:53:44.4702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kz8AhFtwc/Cm074+TJZJBW9TGFPkPNQ/rbRlrCdO9r5J8hbigrU7UFlzbAfyYwM8E2NqSpUWoMOY26KDWz30h5UepeEw/bTZdblro6A0+Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6788
X-Proofpoint-GUID: k948RzHEfZ9qmQlBRHyh7cJc8ohQUOTj
X-Proofpoint-ORIG-GUID: k948RzHEfZ9qmQlBRHyh7cJc8ohQUOTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406260067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 08:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111087

--_000_BYAPR11MB339789003745C5EC6B0D430C81D62BYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch. This CVE will be fixed with php upgradation - htt=
ps://lore.kernel.org/openembedded-devel/20240626085038.2951548-1-soumya.sam=
bu@windriver.com/

Regards,
Soumya
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Soumya via lists.openembedded.org <soumya.sam=
bu=3Dwindriver.com@lists.openembedded.org>
Sent: Monday, June 24, 2024 7:59 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] php: Fix CVE-2024-5458

From: Soumya Sambu <soumya.sambu@windriver.com>

In PHP versions 8.1.* before 8.1.29, 8.2.* before 8.2.20, 8.3.* before 8.3.=
8,
due to a code logic error, filtering functions such as filter_var when
validating URLs (FILTER_VALIDATE_URL) for certain types of URLs the functio=
n
will result in invalid user information (username + password part of URLs)
being treated as valid user information. This may lead to the downstream co=
de
accepting invalid URLs as valid and parsing them incorrectly.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-5458

Upstream-patches:
https://github.com/php/php-src/commit/c7486130d97d592aee8809a5bce97e11deac9=
4a5

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../php/php/CVE-2024-5458.patch               | 153 ++++++++++++++++++
 meta-oe/recipes-devtools/php/php_8.2.18.bb    |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2024-5458.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2024-5458.patch b/meta-oe=
/recipes-devtools/php/php/CVE-2024-5458.patch
new file mode 100644
index 000000000..8f139f0cc
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2024-5458.patch
@@ -0,0 +1,153 @@
+From 7e0e3cc820c493301409a0ce2b6ef95e0ab06b0c Mon Sep 17 00:00:00 2001
+From: Niels Dossche <7771979+nielsdos@users.noreply.github.com>
+Date: Wed, 22 May 2024 22:25:02 +0200
+Subject: [PATCH] Fix GHSA-w8qr-v226-r27w
+
+We should not early-out with success status if we found an ipv6
+hostname, we should keep checking the rest of the conditions.
+Because integrating the if-check of the ipv6 hostname in the
+"Validate domain" if-check made the code hard to read, I extracted the
+condition out to a separate function. This also required to make
+a few pointers const in order to have some clean code.
+
+CVE: CVE-2024-5458
+
+Upstream-Status: Backport [https://github.com/php/php-src/commit/7e0e3cc82=
0c493301409a0ce2b6ef95e0ab06b0c]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ ext/filter/logical_filters.c              | 35 ++++++++++---------
+ ext/filter/tests/ghsa-w8qr-v226-r27w.phpt | 41 +++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 15 deletions(-)
+ create mode 100644 ext/filter/tests/ghsa-w8qr-v226-r27w.phpt
+
+diff --git a/ext/filter/logical_filters.c b/ext/filter/logical_filters.c
+index 3f58b2a3..ca8e65c1 100644
+--- a/ext/filter/logical_filters.c
++++ b/ext/filter/logical_filters.c
+@@ -89,7 +89,7 @@
+ #define FORMAT_IPV4    4
+ #define FORMAT_IPV6    6
+
+-static int _php_filter_validate_ipv6(char *str, size_t str_len, int ip[8]=
);
++static int _php_filter_validate_ipv6(const char *str, size_t str_len, int=
 ip[8]);
+
+ static int php_filter_parse_int(const char *str, size_t str_len, zend_lon=
g *ret) { /* {{{ */
+       zend_long ctx_value;
+@@ -580,6 +580,14 @@ static int is_userinfo_valid(zend_string *str)
+       return 1;
+ }
+
++static bool php_filter_is_valid_ipv6_hostname(const char *s, size_t l)
++{
++      const char *e =3D s + l;
++      const char *t =3D e - 1;
++
++      return *s =3D=3D '[' && *t =3D=3D ']' && _php_filter_validate_ipv6(=
s + 1, l - 2, NULL);
++}
++
+ void php_filter_validate_url(PHP_INPUT_FILTER_PARAM_DECL) /* {{{ */
+ {
+       php_url *url;
+@@ -600,7 +608,7 @@ void php_filter_validate_url(PHP_INPUT_FILTER_PARAM_DE=
CL) /* {{{ */
+
+       if (url->scheme !=3D NULL &&
+               (zend_string_equals_literal_ci(url->scheme, "http") || zend=
_string_equals_literal_ci(url->scheme, "https"))) {
+-              char *e, *s, *t;
++              const char *s;
+               size_t l;
+
+               if (url->host =3D=3D NULL) {
+@@ -609,17 +617,14 @@ void php_filter_validate_url(PHP_INPUT_FILTER_PARAM_=
DECL) /* {{{ */
+
+               s =3D ZSTR_VAL(url->host);
+               l =3D ZSTR_LEN(url->host);
+-              e =3D s + l;
+-              t =3D e - 1;
+-
+-              /* An IPv6 enclosed by square brackets is a valid hostname =
*/
+-              if (*s =3D=3D '[' && *t =3D=3D ']' && _php_filter_validate_=
ipv6((s + 1), l - 2, NULL)) {
+-                      php_url_free(url);
+-                      return;
+-              }
+
+-              // Validate domain
+-              if (!_php_filter_validate_domain(ZSTR_VAL(url->host), l, FI=
LTER_FLAG_HOSTNAME)) {
++              if (
++                      /* An IPv6 enclosed by square brackets is a valid h=
ostname.*/
++                      !php_filter_is_valid_ipv6_hostname(s, l) &&
++                      /* Validate domain.
++                       * This includes a loose check for an IPv4 address.=
 */
++                      !_php_filter_validate_domain(ZSTR_VAL(url->host), l=
, FILTER_FLAG_HOSTNAME)
++              ) {
+                       php_url_free(url);
+                       RETURN_VALIDATION_FAILED
+               }
+@@ -753,15 +758,15 @@ static int _php_filter_validate_ipv4(char *str, size=
_t str_len, int *ip) /* {{{
+ }
+ /* }}} */
+
+-static int _php_filter_validate_ipv6(char *str, size_t str_len, int ip[8]=
) /* {{{ */
++static int _php_filter_validate_ipv6(const char *str, size_t str_len, int=
 ip[8]) /* {{{ */
+ {
+       int compressed_pos =3D -1;
+       int blocks =3D 0;
+       int num, n, i;
+       char *ipv4;
+-      char *end;
++      const char *end;
+       int ip4elm[4];
+-      char *s =3D str;
++      const char *s =3D str;
+
+       if (!memchr(str, ':', str_len)) {
+               return 0;
+diff --git a/ext/filter/tests/ghsa-w8qr-v226-r27w.phpt b/ext/filter/tests/=
ghsa-w8qr-v226-r27w.phpt
+new file mode 100644
+index 00000000..0092408e
+--- /dev/null
++++ b/ext/filter/tests/ghsa-w8qr-v226-r27w.phpt
+@@ -0,0 +1,41 @@
++--TEST--
++GHSA-w8qr-v226-r27w
++--EXTENSIONS--
++filter
++--FILE--
++<?php
++
++function test(string $input) {
++    var_dump(filter_var($input, FILTER_VALIDATE_URL));
++}
++
++echo "--- These ones should fail ---\n";
++test("http://t[est@127.0.0.1");
++test("http://t[est@[::1]");
++test("http://t[est@[::1");
++test("http://t[est@::1]");
++test("http://php.net\\@aliyun.com/aaa.do");
++test("http://test[@2001:db8:3333:4444:5555:6666:1.2.3.4]");
++test("http://te[st@2001:db8:3333:4444:5555:6666:1.2.3.4]");
++test("http://te[st@2001:db8:3333:4444:5555:6666:1.2.3.4");
++
++echo "--- These ones should work ---\n";
++test("http://test@127.0.0.1");
++test("http://test@[2001:db8:3333:4444:5555:6666:1.2.3.4]");
++test("http://test@[::1]");
++
++?>
++--EXPECT--
++--- These ones should fail ---
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++--- These ones should work ---
++string(21) "http://test@127.0.0.1"
++string(50) "http://test@[2001:db8:3333:4444:5555:6666:1.2.3.4]"
++string(17) "http://test@[::1]"
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/php/php_8.2.18.bb b/meta-oe/recipes-d=
evtools/php/php_8.2.18.bb
index da04ffba6..45ae8936c 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.18.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.18.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "http://php.net/distributions/php-${PV}.tar.b=
z2 \
            file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0010-iconv-fix-detection.patch \
            file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-t=
o.patch \
+           file://CVE-2024-5458.patch \
           "

 SRC_URI:append:class-target =3D " \
--
2.40.0


--_000_BYAPR11MB339789003745C5EC6B0D430C81D62BYAPR11MB3397namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Kindly ignore this patch. This CVE will be fixed with php upgradation - <a =
href=3D"https://lore.kernel.org/openembedded-devel/20240626085038.2951548-1=
-soumya.sambu@windriver.com/" id=3D"LPlnk853310">
https://lore.kernel.org/openembedded-devel/20240626085038.2951548-1-soumya.=
sambu@windriver.com/</a><br>
<br>
Regards,<br>
Soumya</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Soumya via lists.openembedded.org &lt;soumya.sambu=3Dwindriver.com=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, June 24, 2024 7:59 AM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][scarthgap][PATCH 1/1] php: Fix CVE-2024-5458<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Soumya Sambu &lt;soumya.sambu@windriver.com&=
gt;<br>
<br>
In PHP versions 8.1.* before 8.1.29, 8.2.* before 8.2.20, 8.3.* before 8.3.=
8,<br>
due to a code logic error, filtering functions such as filter_var when<br>
validating URLs (FILTER_VALIDATE_URL) for certain types of URLs the functio=
n<br>
will result in invalid user information (username + password part of URLs)<=
br>
being treated as valid user information. This may lead to the downstream co=
de<br>
accepting invalid URLs as valid and parsing them incorrectly.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-5458">https://nvd.nist=
.gov/vuln/detail/CVE-2024-5458</a><br>
<br>
Upstream-patches:<br>
<a href=3D"https://github.com/php/php-src/commit/c7486130d97d592aee8809a5bc=
e97e11deac94a5">https://github.com/php/php-src/commit/c7486130d97d592aee880=
9a5bce97e11deac94a5</a><br>
<br>
Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
---<br>
&nbsp;.../php/php/CVE-2024-5458.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 153 ++++++++++++++++++<br>
&nbsp;meta-oe/recipes-devtools/php/php_8.2.18.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&nbsp;2 files changed, 154 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2024-5458.pat=
ch<br>
<br>
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2024-5458.patch b/meta-oe=
/recipes-devtools/php/php/CVE-2024-5458.patch<br>
new file mode 100644<br>
index 000000000..8f139f0cc<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/php/php/CVE-2024-5458.patch<br>
@@ -0,0 +1,153 @@<br>
+From 7e0e3cc820c493301409a0ce2b6ef95e0ab06b0c Mon Sep 17 00:00:00 2001<br>
+From: Niels Dossche &lt;7771979+nielsdos@users.noreply.github.com&gt;<br>
+Date: Wed, 22 May 2024 22:25:02 +0200<br>
+Subject: [PATCH] Fix GHSA-w8qr-v226-r27w<br>
+<br>
+We should not early-out with success status if we found an ipv6<br>
+hostname, we should keep checking the rest of the conditions.<br>
+Because integrating the if-check of the ipv6 hostname in the<br>
+&quot;Validate domain&quot; if-check made the code hard to read, I extract=
ed the<br>
+condition out to a separate function. This also required to make<br>
+a few pointers const in order to have some clean code.<br>
+<br>
+CVE: CVE-2024-5458<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/php/php-src/commi=
t/7e0e3cc820c493301409a0ce2b6ef95e0ab06b0c">https://github.com/php/php-src/=
commit/7e0e3cc820c493301409a0ce2b6ef95e0ab06b0c</a>]<br>
+<br>
+Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
+---<br>
+ ext/filter/logical_filters.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 35 ++++++++++---------<br>
+ ext/filter/tests/ghsa-w8qr-v226-r27w.phpt | 41 +++++++++++++++++++++++<br=
>
+ 2 files changed, 61 insertions(+), 15 deletions(-)<br>
+ create mode 100644 ext/filter/tests/ghsa-w8qr-v226-r27w.phpt<br>
+<br>
+diff --git a/ext/filter/logical_filters.c b/ext/filter/logical_filters.c<b=
r>
+index 3f58b2a3..ca8e65c1 100644<br>
+--- a/ext/filter/logical_filters.c<br>
++++ b/ext/filter/logical_filters.c<br>
+@@ -89,7 +89,7 @@<br>
+ #define FORMAT_IPV4&nbsp;&nbsp;&nbsp; 4<br>
+ #define FORMAT_IPV6&nbsp;&nbsp;&nbsp; 6<br>
+<br>
+-static int _php_filter_validate_ipv6(char *str, size_t str_len, int ip[8]=
);<br>
++static int _php_filter_validate_ipv6(const char *str, size_t str_len, int=
 ip[8]);<br>
+<br>
+ static int php_filter_parse_int(const char *str, size_t str_len, zend_lon=
g *ret) { /* {{{ */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zend_long ctx_value;<br>
+@@ -580,6 +580,14 @@ static int is_userinfo_valid(zend_string *str)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
+ }<br>
+<br>
++static bool php_filter_is_valid_ipv6_hostname(const char *s, size_t l)<br=
>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *e =3D s + l;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *t =3D e - 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return *s =3D=3D '[' &amp;&amp; *t =3D=3D =
']' &amp;&amp; _php_filter_validate_ipv6(s + 1, l - 2, NULL);<br>
++}<br>
++<br>
+ void php_filter_validate_url(PHP_INPUT_FILTER_PARAM_DECL) /* {{{ */<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; php_url *url;<br>
+@@ -600,7 +608,7 @@ void php_filter_validate_url(PHP_INPUT_FILTER_PARAM_DE=
CL) /* {{{ */<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (url-&gt;scheme !=3D NULL &amp;&am=
p;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; (zend_string_equals_literal_ci(url-&gt;scheme, &quot;http&quot;)=
 || zend_string_equals_literal_ci(url-&gt;scheme, &quot;https&quot;))) {<br=
>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; char *e, *s, *t;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; const char *s;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; size_t l;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (url-&gt;host =3D=3D NULL) {<br>
+@@ -609,17 +617,14 @@ void php_filter_validate_url(PHP_INPUT_FILTER_PARAM_=
DECL) /* {{{ */<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; s =3D ZSTR_VAL(url-&gt;host);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; l =3D ZSTR_LEN(url-&gt;host);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; e =3D s + l;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; t =3D e - 1;<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* An IPv6 enclosed by square brackets is a valid hostname */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (*s =3D=3D '[' &amp;&amp; *t =3D=3D ']' &amp;&amp; _php_filter_val=
idate_ipv6((s + 1), l - 2, NULL)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; php_url_free(url);<br=
>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; // Validate domain<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (!_php_filter_validate_domain(ZSTR_VAL(url-&gt;host), l, FILTER_FL=
AG_HOSTNAME)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* An IPv6 enclosed b=
y square brackets is a valid hostname.*/<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !php_filter_is_valid_=
ipv6_hostname(s, l) &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Validate domain.<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This includes=
 a loose check for an IPv4 address. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !_php_filter_validate=
_domain(ZSTR_VAL(url-&gt;host), l, FILTER_FLAG_HOSTNAME)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; php_url_free(url=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_VALIDATIO=
N_FAILED<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+@@ -753,15 +758,15 @@ static int _php_filter_validate_ipv4(char *str, size=
_t str_len, int *ip) /* {{{<br>
+ }<br>
+ /* }}} */<br>
+<br>
+-static int _php_filter_validate_ipv6(char *str, size_t str_len, int ip[8]=
) /* {{{ */<br>
++static int _php_filter_validate_ipv6(const char *str, size_t str_len, int=
 ip[8]) /* {{{ */<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int compressed_pos =3D -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int blocks =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int num, n, i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *ipv4;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *end;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *end;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ip4elm[4];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *s =3D str;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D str;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!memchr(str, ':', str_len)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return 0;<br>
+diff --git a/ext/filter/tests/ghsa-w8qr-v226-r27w.phpt b/ext/filter/tests/=
ghsa-w8qr-v226-r27w.phpt<br>
+new file mode 100644<br>
+index 00000000..0092408e<br>
+--- /dev/null<br>
++++ b/ext/filter/tests/ghsa-w8qr-v226-r27w.phpt<br>
+@@ -0,0 +1,41 @@<br>
++--TEST--<br>
++GHSA-w8qr-v226-r27w<br>
++--EXTENSIONS--<br>
++filter<br>
++--FILE--<br>
++&lt;?php<br>
++<br>
++function test(string $input) {<br>
++&nbsp;&nbsp;&nbsp; var_dump(filter_var($input, FILTER_VALIDATE_URL));<br>
++}<br>
++<br>
++echo &quot;--- These ones should fail ---\n&quot;;<br>
++test(&quot;<a href=3D"http://t[est@127.0.0.1">http://t[est@127.0.0.1</a>&=
quot;);<br>
++test(&quot;<a href=3D"http://t[est@[::1">http://t[est@[::1</a>]&quot;);<b=
r>
++test(&quot;<a href=3D"http://t[est@[::1">http://t[est@[::1</a>&quot;);<br=
>
++test(&quot;<a href=3D"http://t[est@::1">http://t[est@::1</a>]&quot;);<br>
++test(&quot;<a href=3D"http://php.net\\@aliyun.com/aaa.do">http://php.net\=
\@aliyun.com/aaa.do</a>&quot;);<br>
++test(&quot;<a href=3D"http://test[@2001:db8:3333:4444:5555:6666:1.2.3.4">=
http://test[@2001:db8:3333:4444:5555:6666:1.2.3.4</a>]&quot;);<br>
++test(&quot;<a href=3D"http://te[st@2001:db8:3333:4444:5555:6666:1.2.3.4">=
http://te[st@2001:db8:3333:4444:5555:6666:1.2.3.4</a>]&quot;);<br>
++test(&quot;<a href=3D"http://te[st@2001:db8:3333:4444:5555:6666:1.2.3.4">=
http://te[st@2001:db8:3333:4444:5555:6666:1.2.3.4</a>&quot;);<br>
++<br>
++echo &quot;--- These ones should work ---\n&quot;;<br>
++test(&quot;<a href=3D"http://test@127.0.0.1">http://test@127.0.0.1</a>&qu=
ot;);<br>
++test(&quot;<a href=3D"http://test@[2001:db8:3333:4444:5555:6666:1.2.3.4">=
http://test@[2001:db8:3333:4444:5555:6666:1.2.3.4</a>]&quot;);<br>
++test(&quot;<a href=3D"http://test@[::1">http://test@[::1</a>]&quot;);<br>
++<br>
++?&gt;<br>
++--EXPECT--<br>
++--- These ones should fail ---<br>
++bool(false)<br>
++bool(false)<br>
++bool(false)<br>
++bool(false)<br>
++bool(false)<br>
++bool(false)<br>
++bool(false)<br>
++bool(false)<br>
++--- These ones should work ---<br>
++string(21) &quot;<a href=3D"http://test@127.0.0.1">http://test@127.0.0.1<=
/a>&quot;<br>
++string(50) &quot;<a href=3D"http://test@[2001:db8:3333:4444:5555:6666:1.2=
.3.4">http://test@[2001:db8:3333:4444:5555:6666:1.2.3.4</a>]&quot;<br>
++string(17) &quot;<a href=3D"http://test@[::1">http://test@[::1</a>]&quot;=
<br>
+--<br>
+2.40.0<br>
diff --git a/meta-oe/recipes-devtools/php/php_8.2.18.bb b/meta-oe/recipes-d=
evtools/php/php_8.2.18.bb<br>
index da04ffba6..45ae8936c 100644<br>
--- a/meta-oe/recipes-devtools/php/php_8.2.18.bb<br>
+++ b/meta-oe/recipes-devtools/php/php_8.2.18.bb<br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;<a href=3D""></a>http://php.net/distrib=
utions/php-${PV}.tar.bz2 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch">file://0009-p=
hp-don-t-use-broken-wrapper-for-mkdir.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0010-iconv-fix-detection.patch">file://0010-iconv-fix-detection.=
patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch"=
>
file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2024-5458.patch">file://CVE-2024-5458.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;SRC_URI:append:class-target =3D &quot; \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB339789003745C5EC6B0D430C81D62BYAPR11MB3397namp_--

