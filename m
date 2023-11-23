Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3995DC5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 06:15:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.85668.1700720132214558905
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 22:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gbb6SsCm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96911f4787=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AN68eCE031093
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 22:15:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=hVrXm+u2n87EH6Q3W6
	NdHj8MXKmdya1m/OBMKUwb0oM=; b=gbb6SsCmmsmWIgsnxBCBkXRgQmtRoRYPmj
	uMls/7M2Q0rwGBnQ/tEbqzBfdHoJ8pFIXvHJO6qcuAmphIit6XWE9hCL7410zAKj
	nDU8DJt4ALlMTq+TXtjyi/i1QOya5+kiS8IXczMTod4iEp71BWQSxPaxLDXnB427
	0BjMOEIPWln0RSLToGwNuJw55Ud65DVAbBtoTaFw4FMkjrgtqYFvx5gpIG2zjMh4
	7GLIdqCLnWTsjufDb6MKJqnSqEaHFMPf2YUe0WHNcT2oJWIM5LG4JW7NALd43h9t
	t//DWOuphH0Vb4/ft7tACQkTn7dGEQBarBM9iagStw1GSfWOKF2g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uewnkuy7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 22:15:31 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AN6FVHo011181
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 22:15:31 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uewnkuy7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 22:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYvmCKc1hvo56hmx6SJu8IJ1A19Dx1dxYkIUfC8xhm0FnWRHgDKltmz3CDv6hWm7setFB2Lgd8vn7XBJfZJn2e3q2YR/MPKt9s13s9DlPNvo9kmtYWbD+dGv1w0K56TdM2BvwFa6SY6cmnwOfcLrIE/nNiva0uip5MNGfivrYC0DNdg7NP4z8vGcbYjcDrfKYB04mQAJOmFQkNbyusPvwCZq+cTKcM2LlUZ5gifQo3q73PtbmsbtTVoFiyrtiUNZFxvr2rWT7W+zk8qtYEL3Xvmi6OiBUi4qHorVvVQH32kwYt5JzvGVuo+jXBT1s3fyXS8BLfnlj/Ss9QThdWh84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVrXm+u2n87EH6Q3W6NdHj8MXKmdya1m/OBMKUwb0oM=;
 b=l9ptM9IHCLszBDiTYCK9OHMKHb3+EHOWVbNL/YezeGtaa5pSLUzPFrjtMefWAuen2dOtQMZ5WAXLO5J6s/kAnNw09i7u78GU8qvWiqiubAglFc909rT6wlvRCDFV6dS/BRGdK/qArMPGjGNmtzGnUwgnA+Sg+3X1J8U4lnYB/XYuv4fjX2qUv1oNMZbG+dF7cX1vO1aoNNb2E4uWeBf3RoFrBiOuazNZ+xRn+AqgJRqhRclJ0t/x33QBZVbL1qaRygdAWipulC3m/RFhKmRH/NuSQPxEM5164TGXQKaRA2MsudjmKvLQwTvNfr+QLJB8z6LPy7J75tg0Wi4GJvQd/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 06:15:13 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391%5]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 06:15:13 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "anuj.mittal@intel.com"
	<anuj.mittal@intel.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH V2 1/2] samba: fix
 CVE-2023-4091
Thread-Topic: [oe][meta-networking][kirkstone][PATCH V2 1/2] samba: fix
 CVE-2023-4091
Thread-Index: AQHaHSExMiyv6oq+N0uZa1tRhZu6OLCHHIMAgABRpbQ=
Date: Thu, 23 Nov 2023 06:15:13 +0000
Message-ID: 
 <MW4PR11MB5822A7B42F3E9F6EF383454C84B9A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20231122085138.3517090-1-archana.polampalli@windriver.com>
 <bc39408c385e5ef76361033c3e11544ec80ba040.camel@intel.com>
In-Reply-To: <bc39408c385e5ef76361033c3e11544ec80ba040.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|IA0PR11MB7863:EE_
x-ms-office365-filtering-correlation-id: 5b1facdf-5cc1-4e7f-a115-08dbebeb8e0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vDgqvJ26Ih9m1KoCjwUCjriM2OY5wd8GyMiytEpjwy0yqF17IpNRtY07FdAqpw8tXUeyytyMvPiH0MRPsf1M5kxQZ/ooONxUsh6RX97YuMBDqbYALBxSZ/3D0KqDKNq2TDYncV6cg/cdILR0EE/PmrMRqUWjiZursqaixyMUqxg5PxVPNaOPsChDRoJWuERV03EeyiRKZOS+S0gTTuPEXWLjUr0jQCMWbOAApLuZsehtMlJLiFxs2KRqM1s4tBUpV3gJzUb5hClFQw0Lhfsx5gHCSIcg6C4F5HaASPA6EngwmDr4vBknyqej6+YnS10TMXUiNhJo+BRnKpFHOyuRI/JU0gTOScpNJmIan2VczV9NPmQwGOl0Q5a4ms8x74uP+7ZdAGch4MuGotFigQPw3dx2TnTzn4dhuyk4nbwQjGdteCsxHW6zSGkuyy0V/WBKiXVqa7Nrrw1fLjxMIjgu+UPRn9aWTt+PuPQswJe5eXYssaV9RV3hjtA5Rx1/9gLwJ9u7lFxybhshETEWT8QGTuJYLSv49wrFVufW5jnAp7+Hh4hT8T5GMWGoFTWWQ9Tx1zbopW9J4CoJdEjVoWrQuS2OT7TwLGWQPGbrkyarnPrFdyvGmTTql31xA9GGQcB9W3doQkyelLZaEz7RDEgNhxnKN5JqeCmnGMD9ffk7k8UxHWXy7vpt/DK3ql2b6uX7WeW4qcQihl/2T7Nep6H1RQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39850400004)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(52536014)(55016003)(30864003)(2906002)(4001150100001)(19627405001)(41300700001)(8676002)(8936002)(5660300002)(91956017)(316002)(66446008)(66476007)(66556008)(64756008)(76116006)(110136005)(18265965005)(86362001)(966005)(38070700009)(478600001)(7696005)(6506007)(71200400001)(66946007)(9686003)(26005)(122000001)(166002)(83380400001)(33656002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?d8jFXQSnTyEu6juNM6yh/J/XJNTeaZh4CV8BhLcjFYoFiZaLr2vN1D4KJJe+?=
 =?us-ascii?Q?LeVUMbwANNSlI7rZ091SkyzqA8RCQE9ZpCzvkX90X2VHJWOv0bQH7AhGgv8h?=
 =?us-ascii?Q?NDDZlQQHUUEBodi+tr2Pxa55GlSR4nVPLcbcNTMeGsDQV2LHj2rjjaHsPvSk?=
 =?us-ascii?Q?hI4MR4jwHkK2xkiSmfTf6SCnHGYobR+bV8Xl6v1NhgStfT7Sm6Xt4/cqxr1c?=
 =?us-ascii?Q?FbdZHOtBiocpK1OelDLHR4Gj5eNlzXk1/pimrZSmEAFoCKV+vkOqN8jyyLnI?=
 =?us-ascii?Q?2Fcym22hysCvm23xsDvsuJmRyyzWPZ2RHu0G/UUYZInyxnV0vVr6lOaSnOVg?=
 =?us-ascii?Q?W1tfCzhFhMBlKXGiYhaGnvVrX5bS/bK1p81FPh5/suY38oha3CcH7eDRitqX?=
 =?us-ascii?Q?XylT5lue23d/GR0sM0BNwzwXbjyC3uGvOmbugfx3LILeKH1WqyAXro70XASG?=
 =?us-ascii?Q?d2/s0Hw/YUVw2cv6cSE2x19smGcsMc+nmuQO5S1wv3SgLYHyOg+fCuYBtrZK?=
 =?us-ascii?Q?suvMi4lN1BwT/CFtazCaRGfDxaM/LzaJ97NF9jBTFSliqEJvP0cdCL29RnBC?=
 =?us-ascii?Q?xGm/363pJyyirgvXBlcsQOGLkCtbh8yBj9NRmSTMTVgJLIcAYoGUFOpNFfAo?=
 =?us-ascii?Q?Dm3BlBPH2cx4qSjOQRhxuWfwUsXvdrDtSTATYRJ0DrYGZo+Gg15WB0DeqH5q?=
 =?us-ascii?Q?xCHDOWq1tI1S5TLRNAsmKHsTbr/vcFfuEE3r8e5M3WX+maoXbOW88ysnlsLg?=
 =?us-ascii?Q?l3mUspXIylHZBQMd25TKvu2tNrtSo8xl5jnvDEspb9sZqeWLbHgDct8uq8S3?=
 =?us-ascii?Q?ntxy/hletArjXCqPgXrcgBfowXK0krsopYF1mexb3Sz6fiOquZo9UT+n4KHZ?=
 =?us-ascii?Q?c/sNx4/vxBiRefGRCdf85ra0/Us6xxksump+ug+o89ckqp5t7DzQ/1PGw+cj?=
 =?us-ascii?Q?4CG/Twu8G3+eIVicxTT/r0r2icpXcy206l9au0UXBROYXwkBwpKQ5QcktOsQ?=
 =?us-ascii?Q?N2Uf+4zAPBXAuLUkqJivYu7OGJJoIetuMfnrdfBXXoOEvNGIAbYwrA4Il5Sx?=
 =?us-ascii?Q?XPkGgWYkvH/kUjvusViEzNakc3JAvMt36r5jvnj3DJpthsEGVqQvxzp/Gwu8?=
 =?us-ascii?Q?dgPRxA0mu+NyLzGvvrMUsEYEN5/3D5sETEdSSNNzufjz24yZv827HtULQLt/?=
 =?us-ascii?Q?vmjHdrTVZa0VJ9xJZChBgWy+vD+3K6owhCD1nWBx/lAKoB9t89l0sNBPHLtm?=
 =?us-ascii?Q?U6whd0mvL6aywDVbPvsqCt2QBhbx/5mVU3YZvhU1UXdEnUATNeEXDnuE7wJT?=
 =?us-ascii?Q?sDaPMuXO8uiKSTSprLy/60HzVdz5rnwoRNAKqGtqlMPKS+DEx9Rbgn2LZFNq?=
 =?us-ascii?Q?EW8RZlNhrL+SZSyTU06OXBCDAGcxl6L08wzraTGNeFCkqd714HTEWiEYpG++?=
 =?us-ascii?Q?T69yL2XwPBKuqQt8oxuFQg4Oucz0cJ48WZr7lUAaAyNg4k5M5qzHD5IB5S0S?=
 =?us-ascii?Q?8oO2Z2cAvokRrelWH5o2j6cLkDb6lLPEoT8E8cMJHmFeVewPAsXSxOHuDOMd?=
 =?us-ascii?Q?vSe62yIePJc4EpqmCrbny6CVfZ226UvTHZI4YW/ya/vPtioHzMw+2E7vJ8Bc?=
 =?us-ascii?Q?/g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822A7B42F3E9F6EF383454C84B9AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1facdf-5cc1-4e7f-a115-08dbebeb8e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 06:15:13.5931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6GcUkWqtst6ZjqW36sIL7eubWAru8P4U37obcJBOme0n/Rr03ig2le8xOr8MJh4NbLt5EI+MxCACcojfbfg/gxhmDwvSRs3jw27CQu9q9qfhVS5nqo4GuEqGsZoF8SxT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
X-Proofpoint-ORIG-GUID: eFgkJsGDZH8njDLoy_5E-fHURIy0LeVB
X-Proofpoint-GUID: vYE7PZ_ZvqH5OKv1Ni0YhEVmy_IWp4zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311230043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 06:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107021

--_000_MW4PR11MB5822A7B42F3E9F6EF383454C84B9AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

I have sent V3 with updated commit message, please let me know if any chang=
es are required.

Regards,
Archana
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Anuj Mittal via lists.openembedded.org <anuj.=
mittal=3Dintel.com@lists.openembedded.org>
Sent: Thursday, November 23, 2023 06:51
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-de=
vel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-networking][kirkstone][PATCH V2 1/2] samba: fix CVE-=
2023-4091

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed, 2023-11-22 at 08:51 +0000, Polampalli, Archana via
lists.openembedded.org wrote:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> A vulnerability was discovered in Samba, where the flaw allows SMB
> clients to
> truncate files, even with read-only permissions when the Samba VFS
> module
> "acl_xattr" is configured with "acl_xattr:ignore system acls =3D yes".
> The SMB
> protocol allows opening files when the client requests read-only
> access but
> then implicitly truncates the opened file to 0 bytes if the client
> specifies
> a separate OVERWRITE create disposition request. The issue arises in
> configurations
> that bypass kernel file system permissions checks, relying solely on
> Samba's permissions.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-4091
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../samba/samba/CVE-2023-4091-0001.patch      | 193
> ++++++++++++++++++
>  .../samba/samba/CVE-2023-4091-0002.patch      |  59 ++++++
>  .../samba/samba_4.14.14.bb                    |   2 +
>  3 files changed, 254 insertions(+)
>  create mode 100644 meta-networking/recipes-
> connectivity/samba/samba/CVE-2023-4091-0001.patch
>  create mode 100644 meta-networking/recipes-
> connectivity/samba/samba/CVE-2023-4091-0002.patch
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-
> 2023-4091-0001.patch b/meta-networking/recipes-
> connectivity/samba/samba/CVE-2023-4091-0001.patch
> new file mode 100644
> index 000000000..908ab85ba
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-
> 0001.patch
> @@ -0,0 +1,193 @@
> +From b08a60160e6ab8d982d31844bcbf7ab67ff3a8de Mon Sep 17 00:00:00
> 2001
> +From: Ralph Boehme <slow@samba.org>
> +Date: Tue, 1 Aug 2023 12:30:00 +0200
> +Subject: [PATCH 2/2] CVE-2023-4091: smbtorture: test overwrite
> dispositions on
> + read-only file
> +
> +BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15439
> +
> +Signed-off-by: Ralph Boehme <slow@samba.org>
> +
> +CVE: CVE-2023-4091
> +
> +Upstream-Status: Backport
> [https://github.com/samba-team/samba/commit/b08a60160e6ab8d982d31844b
> cbf7ab67ff3a8de]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + selftest/knownfail.d/samba3.smb2.acls |   1 +
> + source4/torture/smb2/acls.c           | 145
> ++++++++++++++++++++++++++
> + 2 files changed, 146 insertions(+)
> + create mode 100644 selftest/knownfail.d/samba3.smb2.acls
> +
> +diff --git a/selftest/knownfail.d/samba3.smb2.acls
> b/selftest/knownfail.d/samba3.smb2.acls
> +new file mode 100644
> +index 0000000..18df260
> +--- /dev/null
> ++++ b/selftest/knownfail.d/samba3.smb2.acls
> +@@ -0,0 +1 @@
> ++^samba3.smb2.acls.OVERWRITE_READ_ONLY_FILE
> +diff --git a/source4/torture/smb2/acls.c
> b/source4/torture/smb2/acls.c
> +index 4f4538b..d26caeb 100644
> +--- a/source4/torture/smb2/acls.c
> ++++ b/source4/torture/smb2/acls.c
> +@@ -3023,6 +3023,149 @@ done:
> +       return ret;
> + }
> +
> ++static bool test_overwrite_read_only_file(struct torture_context
> *tctx,
> ++                                        struct smb2_tree *tree)
> ++{
> ++      NTSTATUS status;
> ++      struct smb2_create c;
> ++      const char *fname =3D BASEDIR
> "\\test_overwrite_read_only_file.txt<file://\\test_overwrite_read_only_fi=
le.txt>";
> ++      struct smb2_handle handle =3D {{0}};
> ++      union smb_fileinfo q;
> ++      union smb_setfileinfo set;
> ++      struct security_descriptor *sd =3D NULL, *sd_orig =3D NULL;
> ++      const char *owner_sid =3D NULL;
> ++      int i;
> ++      bool ret =3D true;
> ++
> ++      struct tcase {
> ++              int disposition;
> ++              const char *disposition_string;
> ++              NTSTATUS expected_status;
> ++      } tcases[] =3D {
> ++#define TCASE(d, s) {                         \
> ++              .disposition =3D d,               \
> ++              .disposition_string =3D #d,       \
> ++              .expected_status =3D s,           \
> ++      }
> ++              TCASE(NTCREATEX_DISP_OPEN, NT_STATUS_OK),
> ++              TCASE(NTCREATEX_DISP_SUPERSEDE,
> NT_STATUS_ACCESS_DENIED),
> ++              TCASE(NTCREATEX_DISP_OVERWRITE,
> NT_STATUS_ACCESS_DENIED),
> ++              TCASE(NTCREATEX_DISP_OVERWRITE_IF,
> NT_STATUS_ACCESS_DENIED),
> ++      };
> ++#undef TCASE
> ++
> ++      ret =3D smb2_util_setup_dir(tctx, tree, BASEDIR);
> ++      torture_assert_goto(tctx, ret, ret, done,
> "smb2_util_setup_dir not ok");
> ++
> ++      c =3D (struct smb2_create) {
> ++              .in.desired_access =3D SEC_STD_READ_CONTROL |
> ++                      SEC_STD_WRITE_DAC |
> ++                      SEC_STD_WRITE_OWNER,
> ++              .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,
> ++              .in.share_access =3D NTCREATEX_SHARE_ACCESS_READ |
> ++                      NTCREATEX_SHARE_ACCESS_WRITE,
> ++              .in.create_disposition =3D NTCREATEX_DISP_OPEN_IF,
> ++              .in.impersonation_level =3D
> NTCREATEX_IMPERSONATION_ANONYMOUS,
> ++              .in.fname =3D fname,
> ++      };
> ++
> ++      status =3D smb2_create(tree, tctx, &c);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_create failed\n");
> ++      handle =3D c.out.file.handle;
> ++
> ++      torture_comment(tctx, "get the original sd\n");
> ++
> ++      ZERO_STRUCT(q);
> ++      q.query_secdesc.level =3D RAW_FILEINFO_SEC_DESC;
> ++      q.query_secdesc.in.file.handle =3D handle;
> ++      q.query_secdesc.in.secinfo_flags =3D SECINFO_DACL |
> SECINFO_OWNER;
> ++
> ++      status =3D smb2_getinfo_file(tree, tctx, &q);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_getinfo_file
> failed\n");
> ++      sd_orig =3D q.query_secdesc.out.sd;
> ++
> ++      owner_sid =3D dom_sid_string(tctx, sd_orig->owner_sid);
> ++
> ++      sd =3D security_descriptor_dacl_create(tctx,
> ++                                      0, NULL, NULL,
> ++                                      owner_sid,
> ++                                      SEC_ACE_TYPE_ACCESS_ALLOWED,
> ++                                      SEC_FILE_READ_DATA,
> ++                                      0,
> ++                                      NULL);
> ++
> ++      ZERO_STRUCT(set);
> ++      set.set_secdesc.level =3D RAW_SFILEINFO_SEC_DESC;
> ++      set.set_secdesc.in.file.handle =3D handle;
> ++      set.set_secdesc.in.secinfo_flags =3D SECINFO_DACL;
> ++      set.set_secdesc.in.sd =3D sd;
> ++
> ++      status =3D smb2_setinfo_file(tree, &set);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_setinfo_file
> failed\n");
> ++
> ++      smb2_util_close(tree, handle);
> ++      ZERO_STRUCT(handle);
> ++
> ++      for (i =3D 0; i < ARRAY_SIZE(tcases); i++) {
> ++              torture_comment(tctx, "Verify open with %s
> dispostion\n",
> ++                              tcases[i].disposition_string);
> ++
> ++              c =3D (struct smb2_create) {
> ++                      .in.create_disposition =3D
> tcases[i].disposition,
> ++                      .in.desired_access =3D SEC_FILE_READ_DATA,
> ++                      .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,
> ++                      .in.share_access =3D
> NTCREATEX_SHARE_ACCESS_MASK,
> ++                      .in.impersonation_level =3D
> NTCREATEX_IMPERSONATION_ANONYMOUS,
> ++                      .in.fname =3D fname,
> ++              };
> ++
> ++              status =3D smb2_create(tree, tctx, &c);
> ++              smb2_util_close(tree, c.out.file.handle);
> ++              torture_assert_ntstatus_equal_goto(
> ++                      tctx, status, tcases[i].expected_status, ret,
> done,
> ++                      "smb2_create failed\n");
> ++      };
> ++
> ++      torture_comment(tctx, "put back original sd\n");
> ++
> ++      c =3D (struct smb2_create) {
> ++              .in.desired_access =3D SEC_STD_WRITE_DAC,
> ++              .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,
> ++              .in.share_access =3D NTCREATEX_SHARE_ACCESS_MASK,
> ++              .in.create_disposition =3D NTCREATEX_DISP_OPEN_IF,
> ++              .in.impersonation_level =3D
> NTCREATEX_IMPERSONATION_ANONYMOUS,
> ++              .in.fname =3D fname,
> ++      };
> ++
> ++      status =3D smb2_create(tree, tctx, &c);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_create failed\n");
> ++      handle =3D c.out.file.handle;
> ++
> ++      ZERO_STRUCT(set);
> ++      set.set_secdesc.level =3D RAW_SFILEINFO_SEC_DESC;
> ++      set.set_secdesc.in.file.handle =3D handle;
> ++      set.set_secdesc.in.secinfo_flags =3D SECINFO_DACL;
> ++      set.set_secdesc.in.sd =3D sd_orig;
> ++
> ++      status =3D smb2_setinfo_file(tree, &set);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_setinfo_file
> failed\n");
> ++
> ++      smb2_util_close(tree, handle);
> ++      ZERO_STRUCT(handle);
> ++
> ++done:
> ++      smb2_util_close(tree, handle);
> ++      smb2_util_unlink(tree, fname);
> ++      smb2_deltree(tree, BASEDIR);
> ++      return ret;
> ++}
> ++
> ++
> + /*
> +    basic testing of SMB2 ACLs
> + */
> +@@ -3051,6 +3194,8 @@ struct torture_suite
> *torture_smb2_acls_init(TALLOC_CTX *ctx)
> +                       test_deny1);
> +       torture_suite_add_1smb2_test(suite, "MXAC-NOT-GRANTED",
> +                       test_mxac_not_granted);
> ++      torture_suite_add_1smb2_test(suite,
> "OVERWRITE_READ_ONLY_FILE",
> ++                      test_overwrite_read_only_file);
> +
> +       suite->description =3D talloc_strdup(suite, "SMB2-ACLS tests");
> +
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-
> 2023-4091-0002.patch b/meta-networking/recipes-
> connectivity/samba/samba/CVE-2023-4091-0002.patch
> new file mode 100644
> index 000000000..43d3b4929
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-
> 0002.patch
> @@ -0,0 +1,59 @@
> +From 8b26f634372f11edcbea33dfd68a3d57889dfcc5 Mon Sep 17 00:00:00
> 2001
> +From: Ralph Boehme <slow@samba.org>
> +Date: Tue, 1 Aug 2023 13:04:36 +0200
> +Subject: [PATCH] CVE-2023-4091: smbd: use open_access_mask for
> access check in
> +    open_file()
> +
> +If the client requested FILE_OVERWRITE[_IF], we're implicitly adding
> +FILE_WRITE_DATA to the open_access_mask in open_file_ntcreate(), but
> for the
> +access check we're using access_mask which doesn't contain the
> additional
> +right, which means we can end up truncating a file for which the
> user has
> +only read-only access via an SD.
> +
> +BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15439
> +
> +Signed-off-by: Ralph Boehme <slow@samba.org>
> +
> +CVE: CVE-2023-4091
> +
> +Upstream-Status: Backport
> [https://github.com/samba-team/samba/commit/8b26f634372f11edcbea33dfd
> 68a3d57889dfcc5]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + selftest/knownfail.d/samba3.smb2.acls | 1 -
> + source3/smbd/open.c                   | 4 ++--
> + 2 files changed, 2 insertions(+), 3 deletions(-)
> + delete mode 100644 selftest/knownfail.d/samba3.smb2.acls
> +
> +diff --git a/selftest/knownfail.d/samba3.smb2.acls
> b/selftest/knownfail.d/samba3.smb2.acls
> +deleted file mode 100644
> +index 18df260..0000000
> +--- a/selftest/knownfail.d/samba3.smb2.acls
> ++++ /dev/null
> +@@ -1 +0,0 @@
> +-^samba3.smb2.acls.OVERWRITE_READ_ONLY_FILE
> +diff --git a/source3/smbd/open.c b/source3/smbd/open.c
> +index 2c3bf9e..4bec5cb 100644
> +--- a/source3/smbd/open.c
> ++++ b/source3/smbd/open.c
> +@@ -1402,7 +1402,7 @@ static NTSTATUS open_file(files_struct *fsp,
> +                                               conn->cwd_fsp,
> +                                               smb_fname,
> +                                               false,
> +-                                              access_mask);
> ++                                              open_access_mask);

What I was trying to say in last comment is that you are patching the
function call to smbd_check_access_rights here while the commit you are
referencing patches smbd_check_access_rights_fsp. Have you checked to
make sure that the changes are still correct/relevant?

Since this is not a clean backport, please mention in the commit
message that this change was done.

Thanks,

Anuj

> +
> +                               if (!NT_STATUS_IS_OK(status)) {
> +                                       DEBUG(10, ("open_file: "
> +@@ -1585,7 +1585,7 @@ static NTSTATUS open_file(files_struct *fsp,
> +                               conn->cwd_fsp,
> +                               smb_fname,
> +                               false,
> +-                              access_mask);
> ++                              open_access_mask);
> +
> +               if (NT_STATUS_EQUAL(status,
> NT_STATUS_OBJECT_NAME_NOT_FOUND) &&
> +                               (fsp->posix_flags &
> FSP_POSIX_FLAGS_OPEN) &&
> +--
> +2.40.0
> +
> diff --git a/meta-networking/recipes-
> connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-
> connectivity/samba/samba_4.14.14.bb
> index aa27592cb..dcb4d8137 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
> @@ -49,6 +49,8 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-
> ${PV}.tar.gz \
>             file://CVE-2023-34968_0009.patch \
>             file://CVE-2023-34968_0010.patch \
>             file://CVE-2023-34968_0011.patch \
> +           file://CVE-2023-4091-0001.patch \
> +           file://CVE-2023-4091-0002.patch \
>             "
>
>  SRC_URI:append:libc-musl =3D " \
>
>
>


--_000_MW4PR11MB5822A7B42F3E9F6EF383454C84B9AMW4PR11MB5822namp_
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
<span style=3D"font-family: Calibri, Helvetica, sans-serif;">Hi Anuj,</span=
></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif;"><br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif;">I have sent V3=
 with updated commit message, please let me know if any changes are require=
d.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif;"><br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif;">Regards,</span=
></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif;">Archana</span>=
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Anuj Mittal via lists.openembedded.org
 &lt;anuj.mittal=3Dintel.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, November 23, 2023 06:51<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; op=
enembedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [oe][meta-networking][kirkstone][PATCH V2 1/2] samba: f=
ix CVE-2023-4091</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Wed, 2023-11-22 at 08:51 +0000, Polampalli, Archana via<br>
lists.openembedded.org wrote:<br>
&gt; From: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<br>
&gt;<br>
&gt; A vulnerability was discovered in Samba, where the flaw allows SMB<br>
&gt; clients to<br>
&gt; truncate files, even with read-only permissions when the Samba VFS<br>
&gt; module<br>
&gt; &quot;acl_xattr&quot; is configured with &quot;acl_xattr:ignore system=
 acls =3D yes&quot;.<br>
&gt; The SMB<br>
&gt; protocol allows opening files when the client requests read-only<br>
&gt; access but<br>
&gt; then implicitly truncates the opened file to 0 bytes if the client<br>
&gt; specifies<br>
&gt; a separate OVERWRITE create disposition request. The issue arises in<b=
r>
&gt; configurations<br>
&gt; that bypass kernel file system permissions checks, relying solely on<b=
r>
&gt; Samba's permissions.<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-4091">https://nvd=
.nist.gov/vuln/detail/CVE-2023-4091</a><br>
&gt;<br>
&gt; Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com=
&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../samba/samba/CVE-2023-4091-0001.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 193<br>
&gt; ++++++++++++++++++<br>
&gt;&nbsp; .../samba/samba/CVE-2023-4091-0002.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 59 ++++++<br>
&gt;&nbsp; .../samba/samba_4.14.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +<br>
&gt;&nbsp; 3 files changed, 254 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta-networking/recipes-<br>
&gt; connectivity/samba/samba/CVE-2023-4091-0001.patch<br>
&gt;&nbsp; create mode 100644 meta-networking/recipes-<br>
&gt; connectivity/samba/samba/CVE-2023-4091-0002.patch<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-<br>
&gt; 2023-4091-0001.patch b/meta-networking/recipes-<br>
&gt; connectivity/samba/samba/CVE-2023-4091-0001.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..908ab85ba<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-<=
br>
&gt; 0001.patch<br>
&gt; @@ -0,0 +1,193 @@<br>
&gt; +From b08a60160e6ab8d982d31844bcbf7ab67ff3a8de Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Ralph Boehme &lt;slow@samba.org&gt;<br>
&gt; +Date: Tue, 1 Aug 2023 12:30:00 +0200<br>
&gt; +Subject: [PATCH 2/2] CVE-2023-4091: smbtorture: test overwrite<br>
&gt; dispositions on<br>
&gt; + read-only file<br>
&gt; +<br>
&gt; +BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15439">h=
ttps://bugzilla.samba.org/show_bug.cgi?id=3D15439</a><br>
&gt; +<br>
&gt; +Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2023-4091<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D""></a>https://github.com/samba-team/samba/commit/b08a60160=
e6ab8d982d31844b<br>
&gt; cbf7ab67ff3a8de]<br>
&gt; +<br>
&gt; +Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.co=
m&gt;<br>
&gt; +---<br>
&gt; + selftest/knownfail.d/samba3.smb2.acls |&nbsp;&nbsp; 1 +<br>
&gt; + source4/torture/smb2/acls.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 145<br>
&gt; ++++++++++++++++++++++++++<br>
&gt; + 2 files changed, 146 insertions(+)<br>
&gt; + create mode 100644 selftest/knownfail.d/samba3.smb2.acls<br>
&gt; +<br>
&gt; +diff --git a/selftest/knownfail.d/samba3.smb2.acls<br>
&gt; b/selftest/knownfail.d/samba3.smb2.acls<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..18df260<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/selftest/knownfail.d/samba3.smb2.acls<br>
&gt; +@@ -0,0 +1 @@<br>
&gt; ++^samba3.smb2.acls.OVERWRITE_READ_ONLY_FILE<br>
&gt; +diff --git a/source4/torture/smb2/acls.c<br>
&gt; b/source4/torture/smb2/acls.c<br>
&gt; +index 4f4538b..d26caeb 100644<br>
&gt; +--- a/source4/torture/smb2/acls.c<br>
&gt; ++++ b/source4/torture/smb2/acls.c<br>
&gt; +@@ -3023,6 +3023,149 @@ done:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static bool test_overwrite_read_only_file(struct torture_context<br>
&gt; *tctx,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct smb2_tree *tree)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smb2_create c;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *fname =3D BASEDIR<br>
&gt; &quot;<a href=3D"file://\\test_overwrite_read_only_file.txt">\\test_ov=
erwrite_read_only_file.txt</a>&quot;;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smb2_handle handle =3D {{0}};<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; union smb_fileinfo q;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; union smb_setfileinfo set;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct security_descriptor *sd =3D NU=
LL, *sd_orig =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *owner_sid =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ret =3D true;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tcase {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int disposition;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; const char *disposition_string;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; NTSTATUS expected_status;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } tcases[] =3D {<br>
&gt; ++#define TCASE(d, s) {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .disposition =3D d,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .disposition_string =3D #d,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
\<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .expected_status =3D s,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TCASE(NTCREATEX_DISP_OPEN, NT_STATUS_OK),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TCASE(NTCREATEX_DISP_SUPERSEDE,<br>
&gt; NT_STATUS_ACCESS_DENIED),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TCASE(NTCREATEX_DISP_OVERWRITE,<br>
&gt; NT_STATUS_ACCESS_DENIED),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TCASE(NTCREATEX_DISP_OVERWRITE_IF,<br>
&gt; NT_STATUS_ACCESS_DENIED),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; ++#undef TCASE<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smb2_util_setup_dir(tctx, tre=
e, BASEDIR);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, ret, ret, d=
one,<br>
&gt; &quot;smb2_util_setup_dir not ok&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c =3D (struct smb2_create) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.desired_access =3D SEC_STD_READ_CONTROL |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SEC_STD_WRITE_DA=
C |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SEC_STD_WRITE_OW=
NER,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.share_access =3D NTCREATEX_SHARE_ACCESS_READ |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTCREATEX_SHARE_=
ACCESS_WRITE,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.create_disposition =3D NTCREATEX_DISP_OPEN_IF,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.impersonation_level =3D<br>
&gt; NTCREATEX_IMPERSONATION_ANONYMOUS,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.fname =3D fname,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_create(tree, tctx, &a=
mp;c);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_create failed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle =3D c.out.file.handle;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_comment(tctx, &quot;get the o=
riginal sd\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(q);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; q.query_secdesc.level =3D RAW_FILEINF=
O_SEC_DESC;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; q.query_secdesc.in.file.handle =3D ha=
ndle;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; q.query_secdesc.in.secinfo_flags =3D =
SECINFO_DACL |<br>
&gt; SECINFO_OWNER;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_getinfo_file(tree, tc=
tx, &amp;q);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_getinfo_file<br>
&gt; failed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sd_orig =3D q.query_secdesc.out.sd;<b=
r>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; owner_sid =3D dom_sid_string(tctx, sd=
_orig-&gt;owner_sid);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sd =3D security_descriptor_dacl_creat=
e(tctx,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0, NULL, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; owner_sid,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; SEC_ACE_TYPE_ACCESS_ALLOWED,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; SEC_FILE_READ_DATA,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; NULL);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(set);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.level =3D RAW_SFILEIN=
FO_SEC_DESC;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.file.handle =3D ha=
ndle;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.secinfo_flags =3D =
SECINFO_DACL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.sd =3D sd;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_setinfo_file(tree, &a=
mp;set);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_setinfo_file<br>
&gt; failed\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_util_close(tree, handle);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(handle);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(tcase=
s); i++) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; torture_comment(tctx, &quot;Verify open with %s<br>
&gt; dispostion\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcases[i].disposition_string);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; c =3D (struct smb2_create) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.create_dispo=
sition =3D<br>
&gt; tcases[i].disposition,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.desired_acce=
ss =3D SEC_FILE_READ_DATA,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.file_attribu=
tes =3D FILE_ATTRIBUTE_NORMAL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.share_access=
 =3D<br>
&gt; NTCREATEX_SHARE_ACCESS_MASK,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.impersonatio=
n_level =3D<br>
&gt; NTCREATEX_IMPERSONATION_ANONYMOUS,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.fname =3D fn=
ame,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; };<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; status =3D smb2_create(tree, tctx, &amp;c);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; smb2_util_close(tree, c.out.file.handle);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; torture_assert_ntstatus_equal_goto(<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tctx, status, tc=
ases[i].expected_status, ret,<br>
&gt; done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;smb2_creat=
e failed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_comment(tctx, &quot;put back =
original sd\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c =3D (struct smb2_create) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.desired_access =3D SEC_STD_WRITE_DAC,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.share_access =3D NTCREATEX_SHARE_ACCESS_MASK,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.create_disposition =3D NTCREATEX_DISP_OPEN_IF,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.impersonation_level =3D<br>
&gt; NTCREATEX_IMPERSONATION_ANONYMOUS,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.fname =3D fname,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_create(tree, tctx, &a=
mp;c);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_create failed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle =3D c.out.file.handle;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(set);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.level =3D RAW_SFILEIN=
FO_SEC_DESC;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.file.handle =3D ha=
ndle;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.secinfo_flags =3D =
SECINFO_DACL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.sd =3D sd_orig;<br=
>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_setinfo_file(tree, &a=
mp;set);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_setinfo_file<br>
&gt; failed\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_util_close(tree, handle);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(handle);<br>
&gt; ++<br>
&gt; ++done:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_util_close(tree, handle);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_util_unlink(tree, fname);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_deltree(tree, BASEDIR);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++<br>
&gt; + /*<br>
&gt; +&nbsp;&nbsp;&nbsp; basic testing of SMB2 ACLs<br>
&gt; + */<br>
&gt; +@@ -3051,6 +3194,8 @@ struct torture_suite<br>
&gt; *torture_smb2_acls_init(TALLOC_CTX *ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_deny1)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_suite_add_1smb2_test(sui=
te, &quot;MXAC-NOT-GRANTED&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_mxac_n=
ot_granted);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_suite_add_1smb2_test(suite,<b=
r>
&gt; &quot;OVERWRITE_READ_ONLY_FILE&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_overwrite_r=
ead_only_file);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suite-&gt;description =3D talloc=
_strdup(suite, &quot;SMB2-ACLS tests&quot;);<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-<br>
&gt; 2023-4091-0002.patch b/meta-networking/recipes-<br>
&gt; connectivity/samba/samba/CVE-2023-4091-0002.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..43d3b4929<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-<=
br>
&gt; 0002.patch<br>
&gt; @@ -0,0 +1,59 @@<br>
&gt; +From 8b26f634372f11edcbea33dfd68a3d57889dfcc5 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Ralph Boehme &lt;slow@samba.org&gt;<br>
&gt; +Date: Tue, 1 Aug 2023 13:04:36 +0200<br>
&gt; +Subject: [PATCH] CVE-2023-4091: smbd: use open_access_mask for<br>
&gt; access check in<br>
&gt; +&nbsp;&nbsp;&nbsp; open_file()<br>
&gt; +<br>
&gt; +If the client requested FILE_OVERWRITE[_IF], we're implicitly adding<=
br>
&gt; +FILE_WRITE_DATA to the open_access_mask in open_file_ntcreate(), but<=
br>
&gt; for the<br>
&gt; +access check we're using access_mask which doesn't contain the<br>
&gt; additional<br>
&gt; +right, which means we can end up truncating a file for which the<br>
&gt; user has<br>
&gt; +only read-only access via an SD.<br>
&gt; +<br>
&gt; +BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15439">h=
ttps://bugzilla.samba.org/show_bug.cgi?id=3D15439</a><br>
&gt; +<br>
&gt; +Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2023-4091<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D""></a>https://github.com/samba-team/samba/commit/8b26f6343=
72f11edcbea33dfd<br>
&gt; 68a3d57889dfcc5]<br>
&gt; +<br>
&gt; +Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.co=
m&gt;<br>
&gt; +---<br>
&gt; + selftest/knownfail.d/samba3.smb2.acls | 1 -<br>
&gt; + source3/smbd/open.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++--<br>
&gt; + 2 files changed, 2 insertions(+), 3 deletions(-)<br>
&gt; + delete mode 100644 selftest/knownfail.d/samba3.smb2.acls<br>
&gt; +<br>
&gt; +diff --git a/selftest/knownfail.d/samba3.smb2.acls<br>
&gt; b/selftest/knownfail.d/samba3.smb2.acls<br>
&gt; +deleted file mode 100644<br>
&gt; +index 18df260..0000000<br>
&gt; +--- a/selftest/knownfail.d/samba3.smb2.acls<br>
&gt; ++++ /dev/null<br>
&gt; +@@ -1 +0,0 @@<br>
&gt; +-^samba3.smb2.acls.OVERWRITE_READ_ONLY_FILE<br>
&gt; +diff --git a/source3/smbd/open.c b/source3/smbd/open.c<br>
&gt; +index 2c3bf9e..4bec5cb 100644<br>
&gt; +--- a/source3/smbd/open.c<br>
&gt; ++++ b/source3/smbd/open.c<br>
&gt; +@@ -1402,7 +1402,7 @@ static NTSTATUS open_file(files_struct *fsp,<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn-&gt;cwd_fsp,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb_fname,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; false,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_mask);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; open_access_mask);<br>
<br>
What I was trying to say in last comment is that you are patching the<br>
function call to smbd_check_access_rights here while the commit you are<br>
referencing patches smbd_check_access_rights_fsp. Have you checked to<br>
make sure that the changes are still correct/relevant?<br>
<br>
Since this is not a clean backport, please mention in the commit<br>
message that this change was done.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; DEBUG(10, (&quot;open_file: &quot;<br>
&gt; +@@ -1585,7 +1585,7 @@ static NTSTATUS open_file(files_struct *fsp,<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn-&gt;cwd_fsp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb_fname,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; false,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_mask);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; open_access_mask);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (NT_STATUS_EQUAL(status,<br>
&gt; NT_STATUS_OBJECT_NAME_NOT_FOUND) &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (fsp-&gt;posix_flags &amp;<br>
&gt; FSP_POSIX_FLAGS_OPEN) &amp;&amp;<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; +<br>
&gt; diff --git a/meta-networking/recipes-<br>
&gt; connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-<br>
&gt; connectivity/samba/samba_4.14.14.bb<br>
&gt; index aa27592cb..dcb4d8137 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
&gt; +++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
&gt; @@ -49,6 +49,8 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-<br>
&gt; ${PV}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-34968_0009.patch">file://CVE-2023-34968_0009.p=
atch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-34968_0010.patch">file://CVE-2023-34968_0010.p=
atch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-34968_0011.patch">file://CVE-2023-34968_0011.p=
atch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-4091-0001.patch">file://CVE-2023-4091-0001.patch</a> \<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-4091-0002.patch">file://CVE-2023-4091-0002.patch</a> \<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI:append:libc-musl =3D &quot; \<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822A7B42F3E9F6EF383454C84B9AMW4PR11MB5822namp_--

