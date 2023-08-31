Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51138C83F01
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 13:28:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17094.1693488478886603184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Aug 2023 06:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UzqUHR4m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76075773b5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37V6Sxi5017150
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 13:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=u+chZgD2jWwJXZXmic
	hOYHDtlqS9WWx2ukoMnJU3v+0=; b=UzqUHR4mC+2JMzNc5SG61ponBKhVtnp9B6
	jHwIpEsBCWRXghe+fzq+NPXisI+UUGhcQTR3WgCwJNLGjaElRCSfCPDDGOzlWKOM
	wLjMHqcD11/N7CQ9zGUUWDfx/D+zO6KtmSf3Q1AKFQ0TmkNf/Vi75o0V8Fv3BnlQ
	qcCTQZxhc1Jj0ndQUg6TuwhRN6wEcDKDyC749eJZwb8BJFxIGHJfnmNDUiSw7e1b
	qO9d16d7ZVPWSHjnwfW9IYKs6O2TCcibWSViBVHoPJcnObVG8IVwVUPBRdlfAO//
	VO4gNnILLIPBU4bN+geJsG9Hj3vh4SFZqsb6PbcD66HVLcAi6FTQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq6kwmv97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 13:27:57 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37VDRvc9024309;
	Thu, 31 Aug 2023 13:27:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq6kwmv96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 13:27:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF1d6GX95Fdni//VzHHmzHFjMWn+kDQ/BAxK7H1VyAc0hR3Xw8JBvCpFsXkSe6XcmirzPKjyYlC4UXFNl9JwRdbOs1I1rOia8pxZ6ZJBYYFwUMrMPh9ygVau7UXIA08OWAoE81SWUpKdn6A8EXRqxHddifwha6sMwquEVeseaBIZg9A2jdUfQ3ho7hEUO5X6rpCfZjAbs/5QwjhWm90TvLpAYp0iIJafTmkfaXOlSJVfbU3C0fcAERr/eK0gzpsuiSxnP2ogx2RXBO9xv+ZuAHqTz/kASyYM3TIicE+xzQkFKXa3AgMV4dVyBFEq+Ex0UtrmfKcbwe81gxBPUz2DVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+chZgD2jWwJXZXmichOYHDtlqS9WWx2ukoMnJU3v+0=;
 b=iCs8IgXgMdHQ/pOBKTlUsEufjGo8tDtQ4qxWmi9OTETUnOMXvSaMjUmx140c7sJRJtDBnXWOL9/vG0v7CvBbuuOjhPQeVfgAiAwIR71MRs6HLdW2QjM4F/wmivevVHkr2hbl89LHRHROqsU+s3Uma0aOLoZWzi0xdgUO1GEOakLajgR/azMLcXebQCdGm/7nFuyHpP4vpCBwyhq0biza7U1kCrISuKCuCBLexxP1lNGimAqrRSDVfGDt4wv7rcQFx8TgrHVeDgySh9FxGwgf5BLfqZ+gQTKTArFB4ssg7EJ+1288IgSoD8KCNNwMCz/RvbWBlha+Ixp50c00UKokjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 13:27:51 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a%4]) with mapi id 15.20.6699.035; Thu, 31 Aug 2023
 13:27:51 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: akuster808 <akuster808@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-oe][mickledore][PATCH 2/2] nodejs: fix CVE-2022-25883
Thread-Topic: [oe][meta-oe][mickledore][PATCH 2/2] nodejs: fix CVE-2022-25883
Thread-Index: AQHZ3AnsdsmXjPXOK02rNIVRv4uFn7AEZZVx
Date: Thu, 31 Aug 2023 13:27:51 +0000
Message-ID: 
 <MW4PR11MB582234E037223086EC91E1C484E5A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20230829113513.276561-1-archana.polampalli@windriver.com>
 <20230829113513.276561-2-archana.polampalli@windriver.com>
 <442ab424-1899-0369-02bc-c5a5727697ce@gmail.com>
In-Reply-To: <442ab424-1899-0369-02bc-c5a5727697ce@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|LV3PR11MB8483:EE_
x-ms-office365-filtering-correlation-id: 17a10dfd-368b-44c0-39e5-08dbaa261340
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b18zGYnTowiK41Ybo4iTHQxmoXHETDi0sw/no2rc2B0VXQrSsX2Yy32G9lUPWyyZiZejKFYACKbvKm5HS+ORVQ4PTb+sq7DPm5Cca3R8pnBvIJ6TaU/21A6mzIsZoAb9wS17e3oZxlxr0yjoSH/g4BxzstL7iuS8eUIhIXfZ89QVLXns/8GF6iWrwskz3w6YlJQMYD3N8cAaN1tAd/SPP3ekf3vRLn9UXzDxvBYlm+JQ5YL7WBuPcdKkqI7fwdjuLQllcUi8qwoR1HH+q/EmszLYPRozJgpCeY4cMnLxfoTrCQ8vWT0vBvOd4sXe15ja3jOByljh1XsvttoPHMdS1CjtfY6FttMiexcb535eN3pS83DILG0ilfeXXbFxIwu3E4jhhbs+RjnOxQiRGXB838RlshAKYX2cGiP4b1mVcEAaq2pentvx5Ho5g8y4lq85xLGT/DvgKjkUULO3T5dt6UklRoNYC2r2YR6lf2dsQwbgxphwAKJLy/WFgRy4NsPs1ZsSIQ/JuimcaWOvXuxu44NJar/dVYeUZJjFx5CbH7cQ4Sm2jQmuhlqf7noxlZyLcgaytoinyNdRAKBdURgsGbScPchBkElp8Mqr6NBiRx9kbvNjj5VqoC1p3YQdLtXn8YzEoWjvbOoPmzovFsaCL6HimYeRprM+X4Hb8Quz7Lj8oenQAL5gdhcIR8Xgof5La9BdLwv0oeG3xPySLMZXag==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(136003)(346002)(366004)(451199024)(1800799009)(186009)(9686003)(18265965005)(38070700005)(38100700002)(41300700001)(66899024)(316002)(5660300002)(4326008)(33656002)(107886003)(83380400001)(52536014)(30864003)(86362001)(26005)(8676002)(55016003)(2906002)(8936002)(166002)(66556008)(7696005)(71200400001)(6506007)(64756008)(966005)(66446008)(66476007)(91956017)(76116006)(19627405001)(122000001)(478600001)(53546011)(110136005)(66946007)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gf/QY+WLw8Kal9rA0oWSGYCG3G1uiHaqZbQW/6yhcvVP4GUJakxbtCOO2uYG?=
 =?us-ascii?Q?HpD9vCc3HYJ0AX4ATYqWGOfmTPjdCVq2ue0R1SId36kdpqqPiAXkHFcORo6s?=
 =?us-ascii?Q?e5GKcMS/ob+8fzFXJwShwOZyZE66n6/Gt2sWDzNbN9Qhn3wef7zcVEYdwPc1?=
 =?us-ascii?Q?V9ty3h1wFDgudBw5ueMcKjxzJD6clfqaqEGH3I3MbtTXIFG57CXQUmZjauub?=
 =?us-ascii?Q?5PQfQH98QH2xGptSz2h9GZzQdItUa6QRgwesjwXBah5tRaEa022ni/r9a+ic?=
 =?us-ascii?Q?6vInEGss8+DguaSXJYRr85tkgqVqJDiQF6rmwioEakP3oajQL/yn3YqPGx8o?=
 =?us-ascii?Q?l+ZHu32S2RCGeA0idPNfZCKl0oeQACeNml1eVreY/msoNPcCExfMxL/3A3D2?=
 =?us-ascii?Q?4/HuPqvJSwP0sVMVnhIOXXXzXdiBwAEThD44GCKRWzPjIVaHBGpCfwqzUvd1?=
 =?us-ascii?Q?3Azfc/VbD4Nl6EspDr5ktv/RlLQLgkqTZNs0z6GhFcS0S/BNjJ1ebWGjg+V4?=
 =?us-ascii?Q?j8t02853nfC56suUvttG1bent/damDSW8GT2IyXiz09Ej1bSu++xRFL3CD7y?=
 =?us-ascii?Q?ih2iERmd3ItVAcM30ZxCXbWcnJrcpwwLbGza9Hxvqh5NmJhIYckYt7G5ZkDV?=
 =?us-ascii?Q?JFs2JYR6q5phzfqYhl4CBktVI3MF4FDnO4zjnyTCubxQ1tvegAnPPsYagtzw?=
 =?us-ascii?Q?SNLY3BECXKn3XRVwGcslNL8ELCEbYPUdxvtzqqS6rVpkHtAeJWSM3zQoqzWL?=
 =?us-ascii?Q?Fmv/I5OD2upTVtiXJDa39UgWoWX9KH6y/8Tx2jQrsVBP6FPjBlBJXpe7X9nA?=
 =?us-ascii?Q?kXR2GhW/ejh+CrSimXTfellLcqXlw94z5f7MTDIAyjgJ2oAHbU84rKlZaK4e?=
 =?us-ascii?Q?qix0/CfVuRWdjNMeHFT2RULqcJaSV5KiHWXtZEtFHHpJ1d7l3CvlClhD9DjX?=
 =?us-ascii?Q?tSus3P0j4Qa2vm7+13vnU7qCm7H36ZDM/1729NXiyDRGneCVsheFpELMyZZS?=
 =?us-ascii?Q?EWSj36OXwlZw6hskzRObkHQSw6JwQc6ktBs8/XMTLdBbYF57VrIags6FDbnI?=
 =?us-ascii?Q?WOIZIsaiuPN1WME5YTVYUOCTiwgHGvL5Qtluy7du4CidQ8gI+9B1JULcLMjS?=
 =?us-ascii?Q?wpUZhitln1uz8F/u59qyspHmnDE7Ous35p/G0i+28HPuK5yeJ8ML3ONgvjMY?=
 =?us-ascii?Q?uOmtc6b7lxqEb0XgUWurbWt2VBR0vqjrlA8UccX+Xf+BQqyExMRtK9Vm39D7?=
 =?us-ascii?Q?K4aMlf6bSdgZ4D1exaRV1/VT7oRtzc1MdvTbifz5QpdWo3RfXj8emZgc9Q96?=
 =?us-ascii?Q?stPp1OVBC8MxuHEwMoS4N5FR4U97PcVNF33tjqqj1tzuwzh73HL/ntNHcbWe?=
 =?us-ascii?Q?Inw5VhMY+z7vVyghmWIgn5t1X8t+xJV839siKZld6aoiX4dKny81Rpli6Yma?=
 =?us-ascii?Q?fdDKX7qB11wrbonS6lw/AgHcIqUgIn4W8H/LvKxVJN0eB1cjnYdCXh1C5X4U?=
 =?us-ascii?Q?TwBGEc5qkO9OcnG6gexymuxTMuOvRf/usIK/uadHkFRZxSYM92FiiugEuZO+?=
 =?us-ascii?Q?ZrkgKHm9LZCYdY3RjIvBAiGlbnEqsVwGZbvI4sgyF9uoWe/0UD4KYHhpDm8r?=
 =?us-ascii?Q?hg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB582234E037223086EC91E1C484E5AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a10dfd-368b-44c0-39e5-08dbaa261340
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 13:27:51.1072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35GEtqI7ovtCIpWo9f4Kp9sZ/A/X5M74qX++/s3KhLE8Kr28k0/ZcHmfCbz3cnCl3kcQsto3EwmqDwH+i0Aw49sGaM4XBRqYtlIKXvB4ALRP6vuV+wl8hluPBkUERXmb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
X-Proofpoint-GUID: _Kn0Qx6U5v5pspviGZn-owgzJLEMmlSZ
X-Proofpoint-ORIG-GUID: CfWhGD6VG3EKWCPSOcLIkvHLL0gRv7Lw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_11,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308310120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 13:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104684

--_000_MW4PR11MB582234E037223086EC91E1C484E5AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

CVE-2022-25883 is fixed in 20.x , I will send upgrade to latest 20.x releas=
e for master very soon,

Regards,
Archana
________________________________
From: akuster808 <akuster808@gmail.com>
Sent: 31 August 2023 18:21
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-de=
vel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-oe][mickledore][PATCH 2/2] nodejs: fix CVE-2022-2588=
3

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On 8/29/23 7:35 AM, Polampalli, Archana via lists.openembedded.org wrote:
> Versions of the package semver before 7.5.2 are vulnerable to Regular Exp=
ression
> Denial of Service (ReDoS) via the function new Range, when untrusted user=
 data is
> provided as a range.

Doesn't this apply to master too as it is @ version 18.17.1?

- Armin
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-25883
>
> Upstream patches:
> https://github.com/npm/node-semver/commit/717534ee353682f3bcf33e60a8af429=
2626d4441
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   .../nodejs/nodejs/CVE-2022-25883.patch        | 260 ++++++++++++++++++
>   .../recipes-devtools/nodejs/nodejs_18.17.1.bb |   1 +
>   2 files changed, 261 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-2588=
3.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch =
b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
> new file mode 100644
> index 000000000..1c9daf714
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
> @@ -0,0 +1,260 @@
> +From 717534ee353682f3bcf33e60a8af4292626d4441 Mon Sep 17 00:00:00 2001
> +From: Luke Karrys <luke@lukekarrys.com>
> +Date: Thu, 15 Jun 2023 12:21:14 -0700
> +Subject: [PATCH] fix: better handling of whitespace (#564)
> +
> +CVE: CVE-2022-25883
> +
> +Upstream-Status: Backport [https://github.com/npm/node-semver/commit/717=
534ee353682f3bcf33e60a8af4292626d4441]
> +---
> + classes/comparator.js          |  3 +-
> + classes/range.js               | 64 ++++++++++++++++------------
> + classes/semver.js              |  2 +-
> + functions/coerce.js            |  2 +-
> + internal/re.js                 | 11 +++++
> + package.json                   |  2 +-
> + 6 files changed, 53 insertions(+), 31 deletions(-)
> +
> +diff --git a/classes/comparator.js b/classes/comparator.js
> +index 2146c88..3d39c0e 100644
> +--- a/classes/comparator.js
> ++++ b/classes/comparator.js
> +@@ -16,6 +16,7 @@ class Comparator {
> +       }
> +     }
> +
> ++    comp =3D comp.trim().split(/\s+/).join(' ')
> +     debug('comparator', comp, options)
> +     this.options =3D options
> +     this.loose =3D !!options.loose
> +@@ -133,7 +134,7 @@ class Comparator {
> + module.exports =3D Comparator
> +
> + const parseOptions =3D require('../internal/parse-options')
> +-const { re, t } =3D require('../internal/re')
> ++const { safeRe: re, t } =3D require('../internal/re')
> + const cmp =3D require('../functions/cmp')
> + const debug =3D require('../internal/debug')
> + const SemVer =3D require('./semver')
> +diff --git a/classes/range.js b/classes/range.js
> +index d9e866d..53c2540 100644
> +--- a/classes/range.js
> ++++ b/classes/range.js
> +@@ -26,19 +26,26 @@ class Range {
> +     this.loose =3D !!options.loose
> +     this.includePrerelease =3D !!options.includePrerelease
> +
> +-    // First, split based on boolean or ||
> ++    // First reduce all whitespace as much as possible so we do not hav=
e to rely
> ++    // on potentially slow regexes like \s*. This is then stored and us=
ed for
> ++    // future error messages as well.
> +     this.raw =3D range
> +-    this.set =3D range
> ++      .trim()
> ++      .split(/\s+/)
> ++      .join(' ')
> ++
> ++    // First, split on ||
> ++    this.set =3D this.raw
> +       .split('||')
> +       // map the range to a 2d array of comparators
> +-      .map(r =3D> this.parseRange(r.trim()))
> ++      .map(r =3D> this.parseRange(r))
> +       // throw out any comparator lists that are empty
> +       // this generally means that it was not a valid range, which is a=
llowed
> +       // in loose mode, but will still throw if the WHOLE range is inva=
lid.
> +       .filter(c =3D> c.length)
> +
> +     if (!this.set.length) {
> +-      throw new TypeError(`Invalid SemVer Range: ${range}`)
> ++      throw new TypeError(`Invalid SemVer Range: ${this.raw}`)
> +     }
> +
> +     // if we have any that are not the null set, throw out null sets.
> +@@ -64,9 +71,7 @@ class Range {
> +
> +   format () {
> +     this.range =3D this.set
> +-      .map((comps) =3D> {
> +-        return comps.join(' ').trim()
> +-      })
> ++      .map((comps) =3D> comps.join(' ').trim())
> +       .join('||')
> +       .trim()
> +     return this.range
> +@@ -77,8 +82,6 @@ class Range {
> +   }
> +
> +   parseRange (range) {
> +-    range =3D range.trim()
> +-
> +     // memoize range parsing for performance.
> +     // this is a very hot path, and fully deterministic.
> +     const memoOpts =3D
> +@@ -105,9 +108,6 @@ class Range {
> +     // `^ 1.2.3` =3D> `^1.2.3`
> +     range =3D range.replace(re[t.CARETTRIM], caretTrimReplace)
> +
> +-    // normalize spaces
> +-    range =3D range.split(/\s+/).join(' ')
> +-
> +     // At this point, the range is completely trimmed and
> +     // ready to be split into comparators.
> +
> +@@ -203,7 +203,7 @@ const Comparator =3D require('./comparator')
> + const debug =3D require('../internal/debug')
> + const SemVer =3D require('./semver')
> + const {
> +-  re,
> ++  safeRe: re,
> +   t,
> +   comparatorTrimReplace,
> +   tildeTrimReplace,
> +@@ -257,10 +257,13 @@ const isX =3D id =3D> !id || id.toLowerCase() =3D=
=3D=3D 'x' || id =3D=3D=3D '*'
> + // ~1.2.3, ~>1.2.3 --> >=3D1.2.3 <1.3.0-0
> + // ~1.2.0, ~>1.2.0 --> >=3D1.2.0 <1.3.0-0
> + // ~0.0.1 --> >=3D0.0.1 <0.1.0-0
> +-const replaceTildes =3D (comp, options) =3D>
> +-  comp.trim().split(/\s+/).map((c) =3D> {
> +-    return replaceTilde(c, options)
> +-  }).join(' ')
> ++const replaceTildes =3D (comp, options) =3D> {
> ++  return comp
> ++    .trim()
> ++    .split(/\s+/)
> ++    .map((c) =3D> replaceTilde(c, options))
> ++    .join(' ')
> ++}
> +
> + const replaceTilde =3D (comp, options) =3D> {
> +   const r =3D options.loose ? re[t.TILDELOOSE] : re[t.TILDE]
> +@@ -298,10 +301,13 @@ const replaceTilde =3D (comp, options) =3D> {
> + // ^1.2.0 --> >=3D1.2.0 <2.0.0-0
> + // ^0.0.1 --> >=3D0.0.1 <0.0.2-0
> + // ^0.1.0 --> >=3D0.1.0 <0.2.0-0
> +-const replaceCarets =3D (comp, options) =3D>
> +-  comp.trim().split(/\s+/).map((c) =3D> {
> +-    return replaceCaret(c, options)
> +-  }).join(' ')
> ++const replaceCarets =3D (comp, options) =3D> {
> ++  return comp
> ++    .trim()
> ++    .split(/\s+/)
> ++    .map((c) =3D> replaceCaret(c, options))
> ++    .join(' ')
> ++}
> +
> + const replaceCaret =3D (comp, options) =3D> {
> +   debug('caret', comp, options)
> +@@ -358,9 +364,10 @@ const replaceCaret =3D (comp, options) =3D> {
> +
> + const replaceXRanges =3D (comp, options) =3D> {
> +   debug('replaceXRanges', comp, options)
> +-  return comp.split(/\s+/).map((c) =3D> {
> +-    return replaceXRange(c, options)
> +-  }).join(' ')
> ++  return comp
> ++    .split(/\s+/)
> ++    .map((c) =3D> replaceXRange(c, options))
> ++    .join(' ')
> + }
> +
> + const replaceXRange =3D (comp, options) =3D> {
> +@@ -443,12 +450,15 @@ const replaceXRange =3D (comp, options) =3D> {
> + const replaceStars =3D (comp, options) =3D> {
> +   debug('replaceStars', comp, options)
> +   // Looseness is ignored here.  star is always as loose as it gets!
> +-  return comp.trim().replace(re[t.STAR], '')
> ++  return comp
> ++    .trim()
> ++    .replace(re[t.STAR], '')
> + }
> +
> + const replaceGTE0 =3D (comp, options) =3D> {
> +   debug('replaceGTE0', comp, options)
> +-  return comp.trim()
> ++  return comp
> ++    .trim()
> +     .replace(re[options.includePrerelease ? t.GTE0PRE : t.GTE0], '')
> + }
> +
> +@@ -486,7 +496,7 @@ const hyphenReplace =3D incPr =3D> ($0,
> +     to =3D `<=3D${to}`
> +   }
> +
> +-  return (`${from} ${to}`).trim()
> ++  return `${from} ${to}`.trim()
> + }
> +
> + const testSet =3D (set, version, options) =3D> {
> +diff --git a/classes/semver.js b/classes/semver.js
> +index 99dbe82..e1208fe 100644
> +--- a/classes/semver.js
> ++++ b/classes/semver.js
> +@@ -1,6 +1,6 @@
> + const debug =3D require('../internal/debug')
> + const { MAX_LENGTH, MAX_SAFE_INTEGER } =3D require('../internal/constan=
ts')
> +-const { re, t } =3D require('../internal/re')
> ++const { safeRe: re, t } =3D require('../internal/re')
> +
> + const parseOptions =3D require('../internal/parse-options')
> + const { compareIdentifiers } =3D require('../internal/identifiers')
> +diff --git a/functions/coerce.js b/functions/coerce.js
> +index 2e01452..febbff9 100644
> +--- a/functions/coerce.js
> ++++ b/functions/coerce.js
> +@@ -1,6 +1,6 @@
> + const SemVer =3D require('../classes/semver')
> + const parse =3D require('./parse')
> +-const { re, t } =3D require('../internal/re')
> ++const { safeRe: re, t } =3D require('../internal/re')
> +
> + const coerce =3D (version, options) =3D> {
> +   if (version instanceof SemVer) {
> +diff --git a/internal/re.js b/internal/re.js
> +index ed88398..f73ef1a 100644
> +--- a/internal/re.js
> ++++ b/internal/re.js
> +@@ -4,16 +4,27 @@ exports =3D module.exports =3D {}
> +
> + // The actual regexps go on exports.re
> + const re =3D exports.re =3D []
> ++const safeRe =3D exports.safeRe =3D []
> + const src =3D exports.src =3D []
> + const t =3D exports.t =3D {}
> + let R =3D 0
> +
> + const createToken =3D (name, value, isGlobal) =3D> {
> ++  // Replace all greedy whitespace to prevent regex dos issues. These r=
egex are
> ++  // used internally via the safeRe object since all inputs in this lib=
rary get
> ++  // normalized first to trim and collapse all extra whitespace. The or=
iginal
> ++  // regexes are exported for userland consumption and lower level usag=
e. A
> ++  // future breaking change could export the safer regex only with a no=
te that
> ++  // all input should have extra whitespace removed.
> ++  const safe =3D value
> ++    .split('\\s*').join('\\s{0,1}<file://\\s*').join('\\s{0,1}>')
> ++    .split('\\s+').join('\\s<file://\\s+').join('\\s>')
> +   const index =3D R++
> +   debug(name, index, value)
> +   t[name] =3D index
> +   src[index] =3D value
> +   re[index] =3D new RegExp(value, isGlobal ? 'g' : undefined)
> ++  safeRe[index] =3D new RegExp(safe, isGlobal ? 'g' : undefined)
> + }
> +
> + // The following Regular Expressions can be used for tokenizing,
> +diff --git a/package.json b/package.json
> +index 204e008..7207703 100644
> +--- a/package.json
> ++++ b/package.json
> +@@ -37,7 +37,7 @@
> +     "range.bnf"
> +   ],
> +   "tap": {
> +-    "check-coverage": true,
> ++    "timeout": 30,
> +     "coverage-map": "map.js",
> +     "nyc-arg": [
> +       "--exclude",
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_18.17.1.bb
> index 402cf5671..359ccab54 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
> @@ -28,6 +28,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
>              file://0001-liftoff-Correct-function-signatures.patch \
>              file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch =
\
>              file://run-ptest \
> +           file://CVE-2022-25883.patch;patchdir=3Ddeps/npm/node_modules/=
semver \
>              "
>
>   SRC_URI:append:class-target =3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104640): https://lists.openembedded.org/g/openembedde=
d-devel/message/104640
> Mute This Topic: https://lists.openembedded.org/mt/101029114/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
kuster808@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_MW4PR11MB582234E037223086EC91E1C484E5AMW4PR11MB5822namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span style=3D"font-size:12pt;margin:0px" class=3D"ContentPasted0">Hi Armin=
,</span>
<div style=3D"font-size:12pt;margin:0px"><br class=3D"ContentPasted0">
</div>
<div style=3D"font-size:12pt;margin:0px"><span class=3D"ContentPasted0" sty=
le=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri,=
 Helvetica, sans-serif; margin: 0px; display: inline !important; color: rgb=
(36, 36, 36); background-color: rgb(255, 255, 255);">CVE-2022-25883
 is fixed in 20.x , I will send upgrade to latest 20.x release for master v=
ery soon,</span><br class=3D"ContentPasted0">
</div>
<div style=3D"font-size:12pt;margin:0px"><span class=3D"ContentPasted0" sty=
le=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)=
&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &q=
uot;Helvetica Neue&quot;, sans-serif; margin: 0px; display: inline !importa=
nt; color: rgb(36, 36, 36); background-color: rgb(255, 255, 255);"><br clas=
s=3D"ContentPasted0">
</span></div>
<div style=3D"font-size:12pt;margin:0px"><span class=3D"ContentPasted0" sty=
le=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri,=
 Helvetica, sans-serif; margin: 0px; display: inline !important; color: rgb=
(36, 36, 36); background-color: rgb(255, 255, 255);">Regards,</span></div>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span style=3D"font-size:12pt;margin:0px"><span class=3D"ContentPasted0" st=
yle=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri=
, Helvetica, sans-serif; margin: 0px; display: inline !important; color: rg=
b(36, 36, 36); background-color: rgb(255, 255, 255);">Archana</span></span>=
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> akuster808 &lt;akuste=
r808@gmail.com&gt;<br>
<b>Sent:</b> 31 August 2023 18:21<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; op=
enembedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openem=
bedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> Re: [oe][meta-oe][mickledore][PATCH 2/2] nodejs: fix CVE-20=
22-25883</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On 8/29/23 7:35 AM, Polampalli, Archana via lists.openembedded.org wrote:<b=
r>
&gt; Versions of the package semver before 7.5.2 are vulnerable to Regular =
Expression<br>
&gt; Denial of Service (ReDoS) via the function new Range, when untrusted u=
ser data is<br>
&gt; provided as a range.<br>
<br>
Doesn't this apply to master too as it is @ version 18.17.1?<br>
<br>
- Armin<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-25883">https://nv=
d.nist.gov/vuln/detail/CVE-2022-25883</a><br>
&gt;<br>
&gt; Upstream patches:<br>
&gt; <a href=3D"https://github.com/npm/node-semver/commit/717534ee353682f3b=
cf33e60a8af4292626d4441">
https://github.com/npm/node-semver/commit/717534ee353682f3bcf33e60a8af42926=
26d4441</a><br>
&gt;<br>
&gt; Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com=
&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; .../nodejs/nodejs/CVE-2022-25883.patch&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | 260 ++++++++++++++++++<br>
&gt;&nbsp;&nbsp; .../recipes-devtools/nodejs/nodejs_18.17.1.bb |&nbsp;&nbsp=
; 1 +<br>
&gt;&nbsp;&nbsp; 2 files changed, 261 insertions(+)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/=
CVE-2022-25883.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.pat=
ch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..1c9daf714<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch<br>
&gt; @@ -0,0 +1,260 @@<br>
&gt; +From 717534ee353682f3bcf33e60a8af4292626d4441 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Luke Karrys &lt;luke@lukekarrys.com&gt;<br>
&gt; +Date: Thu, 15 Jun 2023 12:21:14 -0700<br>
&gt; +Subject: [PATCH] fix: better handling of whitespace (#564)<br>
&gt; +<br>
&gt; +CVE: CVE-2022-25883<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/npm/node-sem=
ver/commit/717534ee353682f3bcf33e60a8af4292626d4441">https://github.com/npm=
/node-semver/commit/717534ee353682f3bcf33e60a8af4292626d4441</a>]<br>
&gt; +---<br>
&gt; + classes/comparator.js&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; 3 +-<br>
&gt; + classes/range.js&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 64 ++++++++++++++++------------<br>
&gt; + classes/semver.js&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt; + functions/coerce.js&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt; + internal/re.js&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 11 +++++<br>
&gt; + package.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt; + 6 files changed, 53 insertions(+), 31 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/classes/comparator.js b/classes/comparator.js<br>
&gt; +index 2146c88..3d39c0e 100644<br>
&gt; +--- a/classes/comparator.js<br>
&gt; ++++ b/classes/comparator.js<br>
&gt; +@@ -16,6 +16,7 @@ class Comparator {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; comp =3D comp.trim().split(/\s+/).join(' ')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; debug('comparator', comp, options)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; this.options =3D options<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; this.loose =3D !!options.loose<br>
&gt; +@@ -133,7 +134,7 @@ class Comparator {<br>
&gt; + module.exports =3D Comparator<br>
&gt; +<br>
&gt; + const parseOptions =3D require('../internal/parse-options')<br>
&gt; +-const { re, t } =3D require('../internal/re')<br>
&gt; ++const { safeRe: re, t } =3D require('../internal/re')<br>
&gt; + const cmp =3D require('../functions/cmp')<br>
&gt; + const debug =3D require('../internal/debug')<br>
&gt; + const SemVer =3D require('./semver')<br>
&gt; +diff --git a/classes/range.js b/classes/range.js<br>
&gt; +index d9e866d..53c2540 100644<br>
&gt; +--- a/classes/range.js<br>
&gt; ++++ b/classes/range.js<br>
&gt; +@@ -26,19 +26,26 @@ class Range {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; this.loose =3D !!options.loose<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; this.includePrerelease =3D !!options.include=
Prerelease<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; // First, split based on boolean or ||<br>
&gt; ++&nbsp;&nbsp;&nbsp; // First reduce all whitespace as much as possibl=
e so we do not have to rely<br>
&gt; ++&nbsp;&nbsp;&nbsp; // on potentially slow regexes like \s*. This is =
then stored and used for<br>
&gt; ++&nbsp;&nbsp;&nbsp; // future error messages as well.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; this.raw =3D range<br>
&gt; +-&nbsp;&nbsp;&nbsp; this.set =3D range<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .trim()<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .split(/\s+/)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .join(' ')<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; // First, split on ||<br>
&gt; ++&nbsp;&nbsp;&nbsp; this.set =3D this.raw<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .split('||')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // map the range to a 2d array o=
f comparators<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .map(r =3D&gt; this.parseRange(r.trim=
()))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .map(r =3D&gt; this.parseRange(r))<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // throw out any comparator list=
s that are empty<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // this generally means that it =
was not a valid range, which is allowed<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // in loose mode, but will still=
 throw if the WHOLE range is invalid.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .filter(c =3D&gt; c.length)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!this.set.length) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new TypeError(`Invalid SemVer R=
ange: ${range}`)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new TypeError(`Invalid SemVer R=
ange: ${this.raw}`)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // if we have any that are not the null set,=
 throw out null sets.<br>
&gt; +@@ -64,9 +71,7 @@ class Range {<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; format () {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; this.range =3D this.set<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .map((comps) =3D&gt; {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return comps.join(' ').tr=
im()<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .map((comps) =3D&gt; comps.join(' ').=
trim())<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .join('||')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .trim()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return this.range<br>
&gt; +@@ -77,8 +82,6 @@ class Range {<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; parseRange (range) {<br>
&gt; +-&nbsp;&nbsp;&nbsp; range =3D range.trim()<br>
&gt; +-<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // memoize range parsing for performance.<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // this is a very hot path, and fully determ=
inistic.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const memoOpts =3D<br>
&gt; +@@ -105,9 +108,6 @@ class Range {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // `^ 1.2.3` =3D&gt; `^1.2.3`<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; range =3D range.replace(re[t.CARETTRIM], car=
etTrimReplace)<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; // normalize spaces<br>
&gt; +-&nbsp;&nbsp;&nbsp; range =3D range.split(/\s+/).join(' ')<br>
&gt; +-<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // At this point, the range is completely tr=
immed and<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // ready to be split into comparators.<br>
&gt; +<br>
&gt; +@@ -203,7 +203,7 @@ const Comparator =3D require('./comparator')<br>
&gt; + const debug =3D require('../internal/debug')<br>
&gt; + const SemVer =3D require('./semver')<br>
&gt; + const {<br>
&gt; +-&nbsp; re,<br>
&gt; ++&nbsp; safeRe: re,<br>
&gt; +&nbsp;&nbsp; t,<br>
&gt; +&nbsp;&nbsp; comparatorTrimReplace,<br>
&gt; +&nbsp;&nbsp; tildeTrimReplace,<br>
&gt; +@@ -257,10 +257,13 @@ const isX =3D id =3D&gt; !id || id.toLowerCase(=
) =3D=3D=3D 'x' || id =3D=3D=3D '*'<br>
&gt; + // ~1.2.3, ~&gt;1.2.3 --&gt; &gt;=3D1.2.3 &lt;1.3.0-0<br>
&gt; + // ~1.2.0, ~&gt;1.2.0 --&gt; &gt;=3D1.2.0 &lt;1.3.0-0<br>
&gt; + // ~0.0.1 --&gt; &gt;=3D0.0.1 &lt;0.1.0-0<br>
&gt; +-const replaceTildes =3D (comp, options) =3D&gt;<br>
&gt; +-&nbsp; comp.trim().split(/\s+/).map((c) =3D&gt; {<br>
&gt; +-&nbsp;&nbsp;&nbsp; return replaceTilde(c, options)<br>
&gt; +-&nbsp; }).join(' ')<br>
&gt; ++const replaceTildes =3D (comp, options) =3D&gt; {<br>
&gt; ++&nbsp; return comp<br>
&gt; ++&nbsp;&nbsp;&nbsp; .trim()<br>
&gt; ++&nbsp;&nbsp;&nbsp; .split(/\s+/)<br>
&gt; ++&nbsp;&nbsp;&nbsp; .map((c) =3D&gt; replaceTilde(c, options))<br>
&gt; ++&nbsp;&nbsp;&nbsp; .join(' ')<br>
&gt; ++}<br>
&gt; +<br>
&gt; + const replaceTilde =3D (comp, options) =3D&gt; {<br>
&gt; +&nbsp;&nbsp; const r =3D options.loose ? re[t.TILDELOOSE] : re[t.TILD=
E]<br>
&gt; +@@ -298,10 +301,13 @@ const replaceTilde =3D (comp, options) =3D&gt; =
{<br>
&gt; + // ^1.2.0 --&gt; &gt;=3D1.2.0 &lt;2.0.0-0<br>
&gt; + // ^0.0.1 --&gt; &gt;=3D0.0.1 &lt;0.0.2-0<br>
&gt; + // ^0.1.0 --&gt; &gt;=3D0.1.0 &lt;0.2.0-0<br>
&gt; +-const replaceCarets =3D (comp, options) =3D&gt;<br>
&gt; +-&nbsp; comp.trim().split(/\s+/).map((c) =3D&gt; {<br>
&gt; +-&nbsp;&nbsp;&nbsp; return replaceCaret(c, options)<br>
&gt; +-&nbsp; }).join(' ')<br>
&gt; ++const replaceCarets =3D (comp, options) =3D&gt; {<br>
&gt; ++&nbsp; return comp<br>
&gt; ++&nbsp;&nbsp;&nbsp; .trim()<br>
&gt; ++&nbsp;&nbsp;&nbsp; .split(/\s+/)<br>
&gt; ++&nbsp;&nbsp;&nbsp; .map((c) =3D&gt; replaceCaret(c, options))<br>
&gt; ++&nbsp;&nbsp;&nbsp; .join(' ')<br>
&gt; ++}<br>
&gt; +<br>
&gt; + const replaceCaret =3D (comp, options) =3D&gt; {<br>
&gt; +&nbsp;&nbsp; debug('caret', comp, options)<br>
&gt; +@@ -358,9 +364,10 @@ const replaceCaret =3D (comp, options) =3D&gt; {=
<br>
&gt; +<br>
&gt; + const replaceXRanges =3D (comp, options) =3D&gt; {<br>
&gt; +&nbsp;&nbsp; debug('replaceXRanges', comp, options)<br>
&gt; +-&nbsp; return comp.split(/\s+/).map((c) =3D&gt; {<br>
&gt; +-&nbsp;&nbsp;&nbsp; return replaceXRange(c, options)<br>
&gt; +-&nbsp; }).join(' ')<br>
&gt; ++&nbsp; return comp<br>
&gt; ++&nbsp;&nbsp;&nbsp; .split(/\s+/)<br>
&gt; ++&nbsp;&nbsp;&nbsp; .map((c) =3D&gt; replaceXRange(c, options))<br>
&gt; ++&nbsp;&nbsp;&nbsp; .join(' ')<br>
&gt; + }<br>
&gt; +<br>
&gt; + const replaceXRange =3D (comp, options) =3D&gt; {<br>
&gt; +@@ -443,12 +450,15 @@ const replaceXRange =3D (comp, options) =3D&gt;=
 {<br>
&gt; + const replaceStars =3D (comp, options) =3D&gt; {<br>
&gt; +&nbsp;&nbsp; debug('replaceStars', comp, options)<br>
&gt; +&nbsp;&nbsp; // Looseness is ignored here.&nbsp; star is always as lo=
ose as it gets!<br>
&gt; +-&nbsp; return comp.trim().replace(re[t.STAR], '')<br>
&gt; ++&nbsp; return comp<br>
&gt; ++&nbsp;&nbsp;&nbsp; .trim()<br>
&gt; ++&nbsp;&nbsp;&nbsp; .replace(re[t.STAR], '')<br>
&gt; + }<br>
&gt; +<br>
&gt; + const replaceGTE0 =3D (comp, options) =3D&gt; {<br>
&gt; +&nbsp;&nbsp; debug('replaceGTE0', comp, options)<br>
&gt; +-&nbsp; return comp.trim()<br>
&gt; ++&nbsp; return comp<br>
&gt; ++&nbsp;&nbsp;&nbsp; .trim()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .replace(re[options.includePrerelease ? t.GT=
E0PRE : t.GTE0], '')<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -486,7 +496,7 @@ const hyphenReplace =3D incPr =3D&gt; ($0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; to =3D `&lt;=3D${to}`<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp; return (`${from} ${to}`).trim()<br>
&gt; ++&nbsp; return `${from} ${to}`.trim()<br>
&gt; + }<br>
&gt; +<br>
&gt; + const testSet =3D (set, version, options) =3D&gt; {<br>
&gt; +diff --git a/classes/semver.js b/classes/semver.js<br>
&gt; +index 99dbe82..e1208fe 100644<br>
&gt; +--- a/classes/semver.js<br>
&gt; ++++ b/classes/semver.js<br>
&gt; +@@ -1,6 +1,6 @@<br>
&gt; + const debug =3D require('../internal/debug')<br>
&gt; + const { MAX_LENGTH, MAX_SAFE_INTEGER } =3D require('../internal/cons=
tants')<br>
&gt; +-const { re, t } =3D require('../internal/re')<br>
&gt; ++const { safeRe: re, t } =3D require('../internal/re')<br>
&gt; +<br>
&gt; + const parseOptions =3D require('../internal/parse-options')<br>
&gt; + const { compareIdentifiers } =3D require('../internal/identifiers')<=
br>
&gt; +diff --git a/functions/coerce.js b/functions/coerce.js<br>
&gt; +index 2e01452..febbff9 100644<br>
&gt; +--- a/functions/coerce.js<br>
&gt; ++++ b/functions/coerce.js<br>
&gt; +@@ -1,6 +1,6 @@<br>
&gt; + const SemVer =3D require('../classes/semver')<br>
&gt; + const parse =3D require('./parse')<br>
&gt; +-const { re, t } =3D require('../internal/re')<br>
&gt; ++const { safeRe: re, t } =3D require('../internal/re')<br>
&gt; +<br>
&gt; + const coerce =3D (version, options) =3D&gt; {<br>
&gt; +&nbsp;&nbsp; if (version instanceof SemVer) {<br>
&gt; +diff --git a/internal/re.js b/internal/re.js<br>
&gt; +index ed88398..f73ef1a 100644<br>
&gt; +--- a/internal/re.js<br>
&gt; ++++ b/internal/re.js<br>
&gt; +@@ -4,16 +4,27 @@ exports =3D module.exports =3D {}<br>
&gt; +<br>
&gt; + // The actual regexps go on exports.re<br>
&gt; + const re =3D exports.re =3D []<br>
&gt; ++const safeRe =3D exports.safeRe =3D []<br>
&gt; + const src =3D exports.src =3D []<br>
&gt; + const t =3D exports.t =3D {}<br>
&gt; + let R =3D 0<br>
&gt; +<br>
&gt; + const createToken =3D (name, value, isGlobal) =3D&gt; {<br>
&gt; ++&nbsp; // Replace all greedy whitespace to prevent regex dos issues.=
 These regex are<br>
&gt; ++&nbsp; // used internally via the safeRe object since all inputs in =
this library get<br>
&gt; ++&nbsp; // normalized first to trim and collapse all extra whitespace=
. The original<br>
&gt; ++&nbsp; // regexes are exported for userland consumption and lower le=
vel usage. A<br>
&gt; ++&nbsp; // future breaking change could export the safer regex only w=
ith a note that<br>
&gt; ++&nbsp; // all input should have extra whitespace removed.<br>
&gt; ++&nbsp; const safe =3D value<br>
&gt; ++&nbsp;&nbsp;&nbsp; .split('<a href=3D"file://\\s*').join('\\s{0,1}">=
\\s*').join('\\s{0,1}</a>')<br>
&gt; ++&nbsp;&nbsp;&nbsp; .split('<a href=3D"file://\\s+').join('\\s">\\s+'=
).join('\\s</a>')<br>
&gt; +&nbsp;&nbsp; const index =3D R++<br>
&gt; +&nbsp;&nbsp; debug(name, index, value)<br>
&gt; +&nbsp;&nbsp; t[name] =3D index<br>
&gt; +&nbsp;&nbsp; src[index] =3D value<br>
&gt; +&nbsp;&nbsp; re[index] =3D new RegExp(value, isGlobal ? 'g' : undefin=
ed)<br>
&gt; ++&nbsp; safeRe[index] =3D new RegExp(safe, isGlobal ? 'g' : undefined=
)<br>
&gt; + }<br>
&gt; +<br>
&gt; + // The following Regular Expressions can be used for tokenizing,<br>
&gt; +diff --git a/package.json b/package.json<br>
&gt; +index 204e008..7207703 100644<br>
&gt; +--- a/package.json<br>
&gt; ++++ b/package.json<br>
&gt; +@@ -37,7 +37,7 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;range.bnf&quot;<br>
&gt; +&nbsp;&nbsp; ],<br>
&gt; +&nbsp;&nbsp; &quot;tap&quot;: {<br>
&gt; +-&nbsp;&nbsp;&nbsp; &quot;check-coverage&quot;: true,<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;timeout&quot;: 30,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;coverage-map&quot;: &quot;map.js&quot;=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;nyc-arg&quot;: [<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;--exclude&quot;,<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb b/meta-=
oe/recipes-devtools/nodejs/nodejs_18.17.1.bb<br>
&gt; index 402cf5671..359ccab54 100644<br>
&gt; --- a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb<br>
&gt; +++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb<br>
&gt; @@ -28,6 +28,7 @@ SRC_URI =3D &quot;<a href=3D""></a>http://nodejs.org=
/dist/v${PV}/node-v${PV}.tar.xz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://0001-liftoff-Correct-function-signatures.patch">f=
ile://0001-liftoff-Correct-function-signatures.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://0001-mips-Use-32bit-cast-for-operand-on-mips32.pa=
tch">
file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://run-ptest">file://run-ptest</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-25883.patch;patchdir=3Ddeps/npm/node_modules/semver">
file://CVE-2022-25883.patch;patchdir=3Ddeps/npm/node_modules/semver</a> \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &quot;<br>
&gt;<br>
&gt;&nbsp;&nbsp; SRC_URI:append:class-target =3D &quot; \<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#104640): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/104640">
https://lists.openembedded.org/g/openembedded-devel/message/104640</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10102911=
4/3616698">
https://lists.openembedded.org/mt/101029114/3616698</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [akuster808@g=
mail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB582234E037223086EC91E1C484E5AMW4PR11MB5822namp_--

