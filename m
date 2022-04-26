Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBEBC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 06:42:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3148.1650955370315050145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 23:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kkzTuGAl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=11152360f4=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23Q6a9Qt006394
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 23:42:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=1pHL8Qu971E90V+qYi3u4+UvqOdC9dUWgIJG3y8Sygc=;
 b=kkzTuGAlDPyDK4tYqF3b2xlJGTZDryJyJyat7e2WqtCxXIuelvkdmXt2p0BEXQW8rNct
 ZucWALW9eSkyGkx/0DlaARvuoaJwW2CxN7Jo1iFJYdhCR2AOlYXbvue+5aIIlTLsWV/R
 Ozezac81dF8rC1gAK08BTZmbBCg7G26MxoGAA3KZMSPG0c5lhuHcHyN91wsQkeZUem8V
 PyWAP5pwQtEu0zAgV7fPX+vuSdNz+eTM65sjRYjix2ngJiSnYyfUB+Plj1pebnufsCU2
 pIQjyiopNqvCWXSt/kARFyk+edDHPkmxCrNPVTKRUO3+MX7p+GNHNrem5d9AtsnAfFpY Qg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmcr4a2d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 23:42:49 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23Q6btQt010207
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 23:42:49 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmcr4a2d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Apr 2022 23:42:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYsEZyI3K017hiET0sF66nAK37aIorrrbywcRYi4PVYrh08G+43ku4Dlroc6Ukiwb1YZJN5DulIOArizUVOPt6iZZbLBY05y00xxWOyTILLIKb28vnQb53g+V9mW0aPIFnjF9eCqImjWoZU5BbpS9r6bbrLUayCRMa/7CZv9WxEZ6cjH7qk4nq3I5GaB2Ut0sFCgmNzhlZTtcH2zcB24CmksUWJ+Q5H+kIWXXREvWz/VZAzVjdm3fO6H6lrwT5/8mfesIdzCbr2r4GVurs1ARAVrWy+ha6TCsTl1hSH2UMoOINXrsJNwwaC8hSw2clygjBQC1HtiVgH8r7geOz4GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pHL8Qu971E90V+qYi3u4+UvqOdC9dUWgIJG3y8Sygc=;
 b=GDLprW6MRfNu7UPFQ+C67vfuy3oL0fDob8Xk7laeGqujgcQCb9FOd2Xx32CyBHpLPtTKTidSE8x5RMH8r38HYXOwMkOe6Ck+aKx1arYs8hAqkRbUp8ttv2Poxc84TC57ltiAQrkzdUdyMFwWnEhU7T9hyUgOcxdM/YEm+tUW064uPAZVnl2GWRCKq0Pyja5srCqld/eWSknTLHqu4JPtQ6zKNymuw1BNEdb7dB3NimSMFR/eQ7AnmLDiY8d6UPqPTM1Eig8LepF/zqopdWIHkpwXoIBe24BWj3rNxhZWA3SEfE9qWcXvfYJlQBHPGOnSHs2HBRnx7Eei4gG3az8zOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DM5PR1101MB2123.namprd11.prod.outlook.com (2603:10b6:4:53::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 06:42:45 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::2151:8727:290d:b39b]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::2151:8727:290d:b39b%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 06:42:45 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cdrkit: add new option -eltorito-platform for
 genimageiso
Thread-Topic: [meta-oe][PATCH] cdrkit: add new option -eltorito-platform for
 genimageiso
Thread-Index: AQHYWTE4R5cw/ELezkitBpW9AeaQG60Bv0Fg
Date: Tue, 26 Apr 2022 06:42:45 +0000
Message-ID: 
 <MW3PR11MB4633C3EBA02FFC226953576E94FB9@MW3PR11MB4633.namprd11.prod.outlook.com>
References: <20220426031713.3146450-1-hongxu.jia@windriver.com>
 <CAMKF1soPGSypVZQav130t6HDdpobvomzf2XLQcVpKy2o6ZJDmw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soPGSypVZQav130t6HDdpobvomzf2XLQcVpKy2o6ZJDmw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 5c64f062-238a-d902-0976-d6ee3180e7e7
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb715821-dc25-4c1a-72f1-08da274ff8c9
x-ms-traffictypediagnostic: DM5PR1101MB2123:EE_
x-microsoft-antispam-prvs: 
 <DM5PR1101MB212318A6D61A0C5FD4AFA84994FB9@DM5PR1101MB2123.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Zn0LzwmNK6zlRD0SbK2/flMFSuKLZBOWvlGh+lE5lieYfVlwCGQFslFk1S/j5obf4QdQd4BZ8/pX/Vj3yZJAAopOLnfq2DdkB/090iAHus2H4+bojDVkb3i4Rskd+DWls9nrmOO4IUhpAWrS7p6v1UXflqTPzKJj1RK5DYsCzgsQqw41GboSyQhiDpRbkotmkn7qhRnaY3xgTOcG/nstA6N3ppwW674VklJkfj8fV4GONDivtREBQl966ln/lA56kfXT3MiM3N28ukRNOtYPtlMCiF/Pp5QqRqljeLFLWQvgiw+Etld0e4ILUeO80BZGhvgO8yKjYeipZCMb180WMLG8J02wZW6brZ0AKTL3Yx5HBYHPTRvF6PCcGbiyb0WUHC3b0uV2Ri9JdjbgK6sSSZnqlIU19mbvz/IaJSf6wKVbTztKE/gH2vQtoC18tVGLRf6EKLHYNtTGy+onmqGn200gupkJCupnP3E4lsybtBmOrfWEpeQzKz+XYlyzxBzZRgK03qkPuDl6YsNjRvRSHA6z7ua1z/faF4YUrop/H7U7GJ247aUR94NUptqlbrgNGrhgGIm9GoWVR/8eiZDSKHpDsrRcoBPkWZiyAfT1DU73bvqyOB4JpQzA5EqyaDkUkt2V1MuxMoaObdAw9fMqmi0innFMg4SJeHx1BBkXVrWxbaeBOmM8GtoVSu6wjTiuNMBWQTj82hCnqTuDLxE2T4AsbX9O8ZrZYLHBRwVbcwd4Jv8ZFiF1XN3F1pWnhBqn/aZ8r+xp2sdE+97MHx+QJs+EjrSOON/Ly78IcMLzKjSW4GVJYtVwzSbNyvWEI2J/bT+pdC+nIbcG1pEQ1spRDIYGlX8L+RVMdqmc8nYOLS0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66446008)(4326008)(8676002)(186003)(91956017)(19627405001)(316002)(86362001)(66556008)(66946007)(64756008)(166002)(55016003)(8936002)(5660300002)(9686003)(26005)(30864003)(76116006)(966005)(83380400001)(33656002)(6916009)(508600001)(6506007)(71200400001)(53546011)(7696005)(38070700005)(38100700002)(2906002)(122000001)(52536014)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+bAJllD6w+rRxZWV8LhcstSQZks49fO9cDeRASp+qtKzEkEjk0yagpeCCKKt?=
 =?us-ascii?Q?KrYdRyae6dXuDwEOeeHKXqEz/7GH5zHcTNEUwLP7/QOqQs4MaLjROHGczlR/?=
 =?us-ascii?Q?sGvpdZmaWmw0J7BevTy5KTSqgKmVZZQeSpgx9Rr3mXZ3jrXAMvJYnUTG6zuo?=
 =?us-ascii?Q?kTVrHZJTNz0Vn6VnEHWc1iGWOte5uBfxhs/4K8pPpIuBsHZY5efNsZ+lIUxe?=
 =?us-ascii?Q?r9aTBUA7sErZTpH2qbn7KMubkN+ea/NzL2ES2/mHLCFm5HN1IgbObM49fNME?=
 =?us-ascii?Q?AXpAirHXLbuiUfHY1Ct1F1vDvzsNd+e6PjOKmoRsmMGAkeDNcrlcHTRmcA35?=
 =?us-ascii?Q?dTw/l070DLvD9LyXj9n4VVPX34q/y3UeGrhdiFlV+4CsOz3PRQFhRp61L5Dp?=
 =?us-ascii?Q?2BTa+tqkKNLxndbXskYA0jsH/nUlVapP/tVQ3VBj2E20Dkno739b9arjz555?=
 =?us-ascii?Q?NNhOhWn4+MM5zkXNRcHJ+R4HEes4/fn5R82amSzKAjvG58fHGCnG/QBLgD7O?=
 =?us-ascii?Q?X9F8M4wUMhNo/1tVf6NMqolYdv30hnUadb6yMgZgUsBrIvnLCR/XU/nOX21A?=
 =?us-ascii?Q?Zz7KANtXdkI+IRyR0SFY/saTyslVrDfn1o8kRxM+YosZ/s18DOIrKJJXidLu?=
 =?us-ascii?Q?atHkeQZAOfqCIMkhsD8mEv8RinvqkuRyl1bdOngmSmvKN3SCehViB/YlEmJ8?=
 =?us-ascii?Q?HUgcbwahnyl3a0DFvVRHRD8CBHU0amOk74FNLYIATjBHc5H6RVUFGZxhyBhB?=
 =?us-ascii?Q?TlUbV2IR38slWLrt4BU1xORUudx3O2mgXkrrTAin3YXPPTstWdIULNja4cW9?=
 =?us-ascii?Q?P/8jgVjYZ/p9VIxIjivwhpq4pXhqa7IfzagTtNnSgG1PBwiy9LA0JYWtcdkf?=
 =?us-ascii?Q?NIpNX4s5DHJ85gJ3MHQAQyD04YvP93CohRUGZS7/nYlvlq32fE8FmptPVgty?=
 =?us-ascii?Q?2UFR0Fc5/7atfxNe3A/ZnsBG+vAj23otlV89NORvNMwFck5HfIQszY8Xer1x?=
 =?us-ascii?Q?+qCUE6TOmQobvidZMDV8HwCE9xH1TSGWcLiy84Cw5DE2YsYIVSxM27ITRBUQ?=
 =?us-ascii?Q?j8haQK/z5lmi7hl0Capv/qMcBtns+f9eWO2ZTKhLF5yoibzib9TpIBE1cjRs?=
 =?us-ascii?Q?0d1JCrsVziHFdpAoQNovjfrBq24xtHMQ2peejvEWDHVeeFP7EUPNRzD6VraI?=
 =?us-ascii?Q?eL+6AzALxi5/6+kNLawDzbHdwb9r2WJAqPmKzyQ1/Z399LjaQNpFW8Uewp8m?=
 =?us-ascii?Q?F3BUJARJlk9URLxV3q6UZB5jEPuPJjUI1D4vLYmtgiXvJ27OUMjrsiTea68E?=
 =?us-ascii?Q?2rLcYGP29jLnFNNA/pqhYEQTVQdRjvBlUXVuDoPBnkdRFwhn7OQI5sxiDJpc?=
 =?us-ascii?Q?xCUfFhbOqbllqP0RjxM3U9a7PdnSLaQWyhBd8i+753oTNXwcACX8KodRdj3p?=
 =?us-ascii?Q?8mto75/2q6uecoWvuVZRb5uv8i7h8MY6V3Kru0DXRlDV9ni5LqZcEE5QmuCU?=
 =?us-ascii?Q?NrS5MHj2AM8QNBwKzhUnXn/WpfH0QZ65IaTf6h/Thqua+WhGAOnBFFs/fJkf?=
 =?us-ascii?Q?9EwHjw/nNG5SsamERlM978ywklEednFPM4XDKfwWpbrCBmgCX7iLk/uzwo8U?=
 =?us-ascii?Q?m2G581GqekW2kFGViSqHky7fe8AqNKGkILEa+5Y5xQ/zvMHbF46X4WPfd6eE?=
 =?us-ascii?Q?wjS8ka/ap4pkyEbzhqDt8Vl+Z5MabXRCuDsjpp5et0pOVgXEMpZieCJdGI4M?=
 =?us-ascii?Q?naUNuhuMqA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR11MB4633C3EBA02FFC226953576E94FB9MW3PR11MB4633namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb715821-dc25-4c1a-72f1-08da274ff8c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 06:42:45.6041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 0NAcmELytYo4axSmg6MJTFxcv2jHm25wjTdb53kx1qf78ihklMWCQFkgxS7WnvkDBRl05Q7nximI+Z8S6qfjY/rH5kynB/IsgfEVN9oF+fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2123
X-Proofpoint-GUID: otlTWJ5OIiUK7RGK1adKA68Uig2UYN7w
X-Proofpoint-ORIG-GUID: M8HUvW-pIMYa-RYassKxL71wOg7CMF_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 clxscore=1011 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 06:42:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96793

--_000_MW3PR11MB4633C3EBA02FFC226953576E94FB9MW3PR11MB4633namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Got it, I will fix it, v2 incoming


//Hongxu

________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Tuesday, April 26, 2022 1:47 PM
To: Jia, Hongxu <Hongxu.Jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cdrkit: add new option -eltorito-platform for=
 genimageiso

[Please note: This e-mail is from an EXTERNAL e-mail address]

fails to build on clang/mips

https://errors.yoctoproject.org/Errors/Details/655476/

On Mon, Apr 25, 2022 at 8:17 PM Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
> Mkisofs/genimageiso now correctly supports El Torito multi boot entries b=
y
> introducing a Boot Dection Header before a list of alternate boot entries=
.
>
> New option -eltorito-platform allows to set the El Torito platform id
> for a boot entry or for a list of boot entries. Supported values for
> the parameter are:
> -   x86 the standard value vor x86 based PCs
> -   PPC the Power PC platform
> -   Mac The Apple Mac platform
> -   efi EFI based boot for PCs
> -   #   an arbitrary numerical value
>
> Port implement from cdrtools:
> https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515dbfca6=
968ca2296fd7
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../cdrkit/cdrkit_1.1.11.bb                   |   1 +
>  ...001-add-new-option-eltorito-platform.patch | 336 ++++++++++++++++++
>  2 files changed, 337 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-=
option-eltorito-platform.patch
>
> diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe=
/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> index dd0405c95..757f99d1f 100644
> --- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> +++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> @@ -11,6 +11,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV=
}.orig.tar.gz \
>             file://0001-define-__THROW-to-avoid-build-issue-with-musl.pat=
ch \
>             file://0002-Do-not-use-rcmd-on-build-with-musl.patch \
>             file://0001-genisoimage-Add-missing-extern-definition.patch \
> +           file://0001-add-new-option-eltorito-platform.patch \
>             "
>  SRC_URI:append:class-nativesdk =3D " \
>             file://0001-install-netscsid-to-bin-for-nativesdk.patch \
> diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-=
eltorito-platform.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-=
new-option-eltorito-platform.patch
> new file mode 100644
> index 000000000..c0b0364bb
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-eltorit=
o-platform.patch
> @@ -0,0 +1,336 @@
> +From 34de1b83f8000d95a10afcfdb7ec814cd75b12b2 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 25 Apr 2022 18:18:00 +0800
> +Subject: [PATCH] add new option -eltorito-platform
> +
> +Mkisofs now correctly supports El Torito multi boot entries by introduci=
ng
> +a Boot Dection Header before a list of alternate boot entries.
> +
> +New option -eltorito-platform allows to set the El Torito platform id
> +for a boot entry or for a list of boot entries. Supported values for
> +the parameter are:
> +-   x86 the standard value vor x86 based PCs
> +-   PPC the Power PC platform
> +-   Mac The Apple Mac platform
> +-   efi EFI based boot for PCs
> +-   #   an arbitrary numerical value
> +
> +Upstream-Status: Inappropriate [port from cdrtools]
> +https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515dbfca=
6968ca2296fd7
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + genisoimage/eltorito.c    | 73 +++++++++++++++++++++++++++++++++++++--
> + genisoimage/genisoimage.c | 48 +++++++++++++++++++++++++
> + genisoimage/genisoimage.h |  8 +++++
> + genisoimage/iso9660.h     | 33 ++++++++++++++++--
> + 4 files changed, 158 insertions(+), 4 deletions(-)
> +
> +diff --git a/genisoimage/eltorito.c b/genisoimage/eltorito.c
> +index d52e17e..a804988 100644
> +--- a/genisoimage/eltorito.c
> ++++ b/genisoimage/eltorito.c
> +@@ -56,6 +56,7 @@ static unsigned int bcat_de_flags;
> + void  init_boot_catalog(const char *path);
> + void  insert_boot_cat(void);
> + static        void    get_torito_desc(struct eltorito_boot_descriptor *=
boot_desc);
> ++static        void    fill_boot_shdr(struct eltorito_sectionheader_entr=
y *boot_shdr_entry, int arch);
> + static        void    fill_boot_desc(struct eltorito_defaultboot_entry =
*boot_desc_entry,
> +                                                                        =
       struct eltorito_boot_entry_info *boot_entry);
> + void  get_boot_entry(void);
> +@@ -282,7 +283,14 @@ get_torito_desc(struct eltorito_boot_descriptor *bo=
ot_desc)
> +       struct directory_entry  *de2;   /* Boot catalog */
> +       int                     i;
> +       int                     offset;
> ++      int                     arch =3D 0;
> ++      int                     nentries =3D 0;
> +       struct eltorito_defaultboot_entry boot_desc_record;
> ++      struct eltorito_sectionheader_entry boot_shdr_record;
> ++#ifdef __needed__
> ++      struct eltorito_section_entry boot_section_record;
> ++#endif
> ++      struct eltorito_sectionheader_entry *last_section_header =3D 0;
> +
> +       memset(boot_desc, 0, sizeof (*boot_desc));
> +       boot_desc->type[0] =3D 0;
> +@@ -311,13 +319,22 @@ get_torito_desc(struct eltorito_boot_descriptor *b=
oot_desc)
> +       set_731(boot_desc->bootcat_ptr,
> +               (unsigned int) get_733(de2->isorec.extent));
> +
> ++      /*
> ++       * If the platform id for the first (default) boot entry has not =
been
> ++       * explicitly set, we default to EL_TORITO_ARCH_x86
> ++       */
> ++      if ((first_boot_entry->type & ELTORITO_BOOT_ID) =3D=3D 0) {
> ++              first_boot_entry->boot_platform =3D EL_TORITO_ARCH_x86;
> ++      }
> ++      arch =3D first_boot_entry->boot_platform;
> ++
> +       /*
> +        * we have the boot image, so write boot catalog information
> +        * Next we write out the primary descriptor for the disc
> +        */
> +       memset(&valid_desc, 0, sizeof (valid_desc));
> +       valid_desc.headerid[0] =3D 1;
> +-      valid_desc.arch[0] =3D EL_TORITO_ARCH_x86;
> ++      valid_desc.arch[0] =3D arch;  /* Platform id for the default boot=
 */
> +
> +       /*
> +        * we'll shove start of publisher id into id field,
> +@@ -351,8 +368,17 @@ get_torito_desc(struct eltorito_boot_descriptor *bo=
ot_desc)
> +               current_boot_entry !=3D NULL;
> +               current_boot_entry =3D current_boot_entry->next,
> +               offset +=3D sizeof (boot_desc_record)) {
> ++              int newarch =3D arch;
> +
> +-              if (offset >=3D SECTOR_SIZE) {
> ++              if (current_boot_entry->type & ELTORITO_BOOT_ID)
> ++                      newarch =3D current_boot_entry->boot_platform;
> ++              else
> ++                      current_boot_entry->boot_platform =3D arch;
> ++
> ++              /*
> ++               * El Torito has no such limitation but we currently have=
...
> ++               */
> ++              if (offset >=3D (SECTOR_SIZE - sizeof (boot_desc_record))=
) {
> + #ifdef        USE_LIBSCHILY
> +                       comerrno(EX_BAD,
> +                       "Too many El Torito boot entries\n");
> +@@ -362,12 +388,53 @@ get_torito_desc(struct eltorito_boot_descriptor *b=
oot_desc)
> +                       exit(1);
> + #endif
> +               }
> ++
> ++              if (current_boot_entry =3D=3D first_boot_entry) {
> ++                      ;
> ++                      /* EMPTY */
> ++              } else if ((current_boot_entry =3D=3D first_boot_entry->n=
ext) ||
> ++                          (arch !=3D newarch) ||
> ++                          (current_boot_entry->type & ELTORITO_SECTION_=
HEADER)) {
> ++                      if (last_section_header)
> ++                              set_721(&last_section_header->entry_count=
, nentries);
> ++                      nentries =3D 1;
> ++                      last_section_header =3D (struct eltorito_sectionh=
eader_entry *)
> ++                                                      (de2->table + off=
set);
> ++                      fill_boot_shdr(&boot_shdr_record, newarch);
> ++                      memcpy(de2->table + offset, &boot_shdr_record,
> ++                                              sizeof (boot_shdr_record)=
);
> ++                      offset +=3D sizeof (boot_desc_record);
> ++              } else {
> ++                      nentries++; /* Add entry to this section header *=
/
> ++              }
> ++              /*
> ++               * This works because a section entry has the same essent=
ial
> ++               * layout as a default entry (and we do not populate the
> ++               * selection criteria fields).
> ++               */
> ++
> +               fill_boot_desc(&boot_desc_record, current_boot_entry);
> +               memcpy(de2->table + offset, &boot_desc_record,
> +                                       sizeof (boot_desc_record));
> +       }
> ++
> ++      if (last_section_header) {
> ++              set_721(&last_section_header->entry_count, nentries);
> ++              last_section_header->header_id[0] =3D EL_TORITO_SHDR_ID_L=
AST_SHDR;
> ++      }
> ++
> + }/* get_torito_desc(... */
> +
> ++static void
> ++fill_boot_shdr(boot_shdr_entry, arch)
> ++      struct eltorito_sectionheader_entry *boot_shdr_entry;
> ++      int                 arch;
> ++{
> ++      memset(boot_shdr_entry, 0, sizeof(struct eltorito_sectionheader_e=
ntry));
> ++      boot_shdr_entry->header_id[0] =3D EL_TORITO_SHDR_ID_SHDR;
> ++      boot_shdr_entry->platform_id[0] =3D arch;
> ++}
> ++
> + static void
> + fill_boot_desc(struct eltorito_defaultboot_entry *boot_desc_entry,
> +                                       struct eltorito_boot_entry_info *=
boot_entry)
> +@@ -678,7 +745,9 @@ get_boot_entry()
> +       if (!first_boot_entry) {
> +               first_boot_entry =3D current_boot_entry;
> +               last_boot_entry =3D current_boot_entry;
> ++              current_boot_entry->boot_platform =3D EL_TORITO_ARCH_x86;
> +       } else {
> ++              current_boot_entry->boot_platform =3D last_boot_entry->bo=
ot_platform;
> +               last_boot_entry->next =3D current_boot_entry;
> +               last_boot_entry =3D current_boot_entry;
> +       }
> +diff --git a/genisoimage/genisoimage.c b/genisoimage/genisoimage.c
> +index 46f0cb7..bfa920e 100644
> +--- a/genisoimage/genisoimage.c
> ++++ b/genisoimage/genisoimage.c
> +@@ -271,6 +271,8 @@ struct rcopts {
> +       char            **variable;
> + };
> +
> ++static int get_boot_platid(opt_arg);
> ++
> + struct rcopts rcopt[] =3D {
> +       {"PREP", &preparer},
> +       {"PUBL", &publisher},
> +@@ -404,6 +406,7 @@ struct ld_option {
> +
> + #define       OPTION_ALLOW_LEADING_DOTS       1070
> + #define       OPTION_PUBLISHER                1071
> ++#define       OPTION_PLATFORM                 1072
> +
> + #ifdef                JIGDO_TEMPLATE
> + #define       OPTION_JTT_OUTPUT               1101
> +@@ -528,6 +531,8 @@ static const struct ld_option ld_options[] =3D
> +       'b', "FILE", "Set El Torito boot image name", ONE_DASH},
> +       {{"eltorito-alt-boot", no_argument, NULL, OPTION_ALT_BOOT},
> +       '\0', NULL, "Start specifying alternative El Torito boot paramete=
rs", ONE_DASH},
> ++      {{"eltorito-platform", required_argument, NULL, OPTION_PLATFORM},
> ++      '\0', "ID", "Set El Torito platform id for the next boot entry", =
ONE_DASH},
> +       {{"sparc-boot", required_argument, NULL, 'B'},
> +       'B', "FILES", "Set sparc boot image names", ONE_DASH},
> +       {{"sunx86-boot", required_argument, NULL, OPTION_SUNX86BOOT},
> +@@ -1558,6 +1563,9 @@ int main(int argc, char *argv[])
> +                        */
> +                       new_boot_entry();
> +                       break;
> ++              case OPTION_PLATFORM:
> ++                      get_boot_platid(optarg);
> ++                      break;
> +               case OPTION_BOOTALPHA:
> +                       use_alphaboot++;
> +                       /* list of pathnames of boot images */
> +@@ -3829,3 +3837,43 @@ e_malloc(size_t size)
> +      memset(pt, 0, size);
> +       return (pt);
> + }
> ++
> ++static int
> ++get_boot_platid(opt_arg)
> ++      char    *opt_arg;
> ++{
> ++      long    val;
> ++      char    *ptr;
> ++
> ++      use_eltorito++;
> ++      if (streql(opt_arg, "x86")) {
> ++              val =3D EL_TORITO_ARCH_x86;
> ++      } else if (streql(opt_arg, "PPC")) {
> ++              val =3D EL_TORITO_ARCH_PPC;
> ++      } else if (streql(opt_arg, "Mac")) {
> ++              val =3D EL_TORITO_ARCH_PPC;
> ++      } else if (streql(opt_arg, "efi")) {
> ++              val =3D EL_TORITO_ARCH_EFI;
> ++      } else {
> ++              val =3D strtol(opt_arg, &ptr, 0);
> ++              if (*ptr || val < 0 || val >=3D 0x100) {
> ++                      comerrno(EX_BAD, "Bad boot system ID.\n");
> ++              }
> ++      }
> ++
> ++      /*
> ++       * If there is already a boot entry and the boot file name has be=
en set
> ++       * for this boot entry and the new platform id differs from the
> ++       * previous value, we start a new boot section.
> ++       */
> ++      if (current_boot_entry &&
> ++          current_boot_entry->boot_image !=3D NULL &&
> ++          current_boot_entry->boot_platform !=3D val) {
> ++          new_boot_entry();
> ++      }
> ++      get_boot_entry();
> ++      current_boot_entry->type |=3D ELTORITO_BOOT_ID;
> ++      current_boot_entry->boot_platform =3D val;
> ++      return (1);
> ++}
> ++
> +diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h
> +index bbedfb0..4dae1e8 100644
> +--- a/genisoimage/genisoimage.h
> ++++ b/genisoimage/genisoimage.h
> +@@ -299,6 +299,14 @@ struct eltorito_boot_entry_info {
> +       int             boot_info_table;
> +       int             load_size;
> +       int             load_addr;
> ++
> ++#define       ELTORITO_BOOT_ID    1
> ++#define       ELTORITO_SECTION_HEADER 2
> ++      int     type;
> ++      /*
> ++       * Valid if (type & ELTORITO_BOOT_ID) !=3D 0
> ++       */
> ++      int     boot_platform;
> + };
> +
> + extern int    goof;
> +diff --git a/genisoimage/iso9660.h b/genisoimage/iso9660.h
> +index c74c2a9..61b6fc0 100644
> +--- a/genisoimage/iso9660.h
> ++++ b/genisoimage/iso9660.h
> +@@ -62,6 +62,7 @@ struct iso_volume_descriptor {
> + #define       EL_TORITO_ARCH_x86      0
> + #define       EL_TORITO_ARCH_PPC      1
> + #define       EL_TORITO_ARCH_MAC      2
> ++#define       EL_TORITO_ARCH_EFI      0xEF
> +
> + #define       EL_TORITO_BOOTABLE      0x88
> + #define       EL_TORITO_NOT_BOOTABLE  0
> +@@ -159,10 +160,15 @@ struct eltorito_boot_descriptor {
> + };
> +
> + /* Validation entry for El Torito */
> ++/*
> ++ * headerid must be 1
> ++ * id is the manufacturer ID
> ++ * cksum to make the sum of all shorts in this record 0
> ++ */
> + struct eltorito_validation_entry {
> +       char headerid                   [ISODCL(1,    1)]; /* 711 */
> +       char arch                       [ISODCL(2,    2)];
> +-      char pad1                       [ISODCL(3,    4)]; /* 711 */
> ++      char pad1                       [ISODCL(3,    4)]; /* 721 */
> +       char id                         [ISODCL(5,   28)]; /* CD devel/ma=
n*/
> +       char cksum                      [ISODCL(29,  30)];
> +       char key1                       [ISODCL(31,  31)];
> +@@ -173,7 +179,7 @@ struct eltorito_validation_entry {
> + struct eltorito_defaultboot_entry {
> +       char boot_id                    [ISODCL(1,    1)]; /* 711 */
> +       char boot_media                 [ISODCL(2,    2)];
> +-      char loadseg                    [ISODCL(3,    4)]; /* 711 */
> ++      char loadseg                    [ISODCL(3,    4)]; /* 721 */
> +       char sys_type                   [ISODCL(5,    5)];
> +       char pad1                       [ISODCL(6,    6)];
> +       char nsect                      [ISODCL(7,    8)];
> +@@ -181,6 +187,29 @@ struct eltorito_defaultboot_entry {
> +       char pad2                       [ISODCL(13,  32)];
> + };
> +
> ++/* El Torito section header entry in boot catalog */
> ++struct eltorito_sectionheader_entry {
> ++#define    EL_TORITO_SHDR_ID_SHDR      0x90
> ++#define    EL_TORITO_SHDR_ID_LAST_SHDR 0x91
> ++      char header_id          [ISODCL(1,    1)]; /* 711 */
> ++      char platform_id        [ISODCL(2,    2)];
> ++      char entry_count        [ISODCL(3,    4)]; /* 721 */
> ++      char id             [ISODCL(5,   32)];
> ++};
> ++
> ++/* El Torito section entry in boot catalog */
> ++struct eltorito_section_entry {
> ++      char boot_id            [ISODCL(1,    1)]; /* 711 */
> ++      char boot_media         [ISODCL(2,    2)];
> ++      char loadseg            [ISODCL(3,    4)]; /* 721 */
> ++      char sys_type           [ISODCL(5,    5)];
> ++      char pad1           [ISODCL(6,    6)];
> ++      char nsect          [ISODCL(7,    8)];
> ++      char bootoff            [ISODCL(9,   12)];
> ++      char sel_criteria       [ISODCL(13,  13)];
> ++      char vendor_sel_criteria    [ISODCL(14,  32)];
> ++};
> ++
> + /*
> +  * XXX JS: The next two structures have odd lengths!
> +  * Some compilers (e.g. on Sun3/mc68020) padd the structures to even le=
ngth.
> +--
> +2.27.0
> +
> --
> 2.27.0
>

--_000_MW3PR11MB4633C3EBA02FFC226953576E94FB9MW3PR11MB4633namp_
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
: 12pt; color: rgb(0, 0, 0);">
<blockquote type=3D"cite" cite=3D"mid:CAMKF1soPGSypVZQav130t6HDdpobvomzf2XL=
QcVpKy2o6ZJDmw@mail.gmail.com">
<pre class=3D"moz-quote-pre" wrap=3D""></pre>
</blockquote>
<p>Got it, I will fix it, v2 incoming</p>
<p><br>
</p>
<p>//Hongxu</p>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, April 26, 2022 1:47 PM<br>
<b>To:</b> Jia, Hongxu &lt;Hongxu.Jia@windriver.com&gt;<br>
<b>Cc:</b> openembeded-devel &lt;openembedded-devel@lists.openembedded.org&=
gt;<br>
<b>Subject:</b> Re: [meta-oe][PATCH] cdrkit: add new option -eltorito-platf=
orm for genimageiso</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Please note: This e-mail is from an EXTERNAL e-ma=
il address]<br>
<br>
fails to build on clang/mips<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/655476/">https://=
errors.yoctoproject.org/Errors/Details/655476/</a><br>
<br>
On Mon, Apr 25, 2022 at 8:17 PM Hongxu Jia &lt;hongxu.jia@windriver.com&gt;=
 wrote:<br>
&gt;<br>
&gt; Mkisofs/genimageiso now correctly supports El Torito multi boot entrie=
s by<br>
&gt; introducing a Boot Dection Header before a list of alternate boot entr=
ies.<br>
&gt;<br>
&gt; New option -eltorito-platform allows to set the El Torito platform id<=
br>
&gt; for a boot entry or for a list of boot entries. Supported values for<b=
r>
&gt; the parameter are:<br>
&gt; -&nbsp;&nbsp; x86 the standard value vor x86 based PCs<br>
&gt; -&nbsp;&nbsp; PPC the Power PC platform<br>
&gt; -&nbsp;&nbsp; Mac The Apple Mac platform<br>
&gt; -&nbsp;&nbsp; efi EFI based boot for PCs<br>
&gt; -&nbsp;&nbsp; #&nbsp;&nbsp; an arbitrary numerical value<br>
&gt;<br>
&gt; Port implement from cdrtools:<br>
&gt; <a href=3D"https://github.com/jobermayr/cdrtools/commit/a50804fd61d75e=
b689a515dbfca6968ca2296fd7">
https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515dbfca696=
8ca2296fd7</a><br>
&gt;<br>
&gt; Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../cdrkit/cdrkit_1.1.11.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 1 +<br>
&gt;&nbsp; ...001-add-new-option-eltorito-platform.patch | 336 ++++++++++++=
++++++<br>
&gt;&nbsp; 2 files changed, 337 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-=
add-new-option-eltorito-platform.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta=
-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<br>
&gt; index dd0405c95..757f99d1f 100644<br>
&gt; --- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<br>
&gt; +++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<br>
&gt; @@ -11,6 +11,7 @@ SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/c/${BPN}/${B=
PN}_${PV}.orig.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-define-__THROW-to-avoid-build-issue-with-musl.patc=
h">
file://0001-define-__THROW-to-avoid-build-issue-with-musl.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0002-Do-not-use-rcmd-on-build-with-musl.patch">file://0=
002-Do-not-use-rcmd-on-build-with-musl.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-genisoimage-Add-missing-extern-definition.patch">
file://0001-genisoimage-Add-missing-extern-definition.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-add-new-option-eltorito-platform.patch">file://0001-add-new=
-option-eltorito-platform.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; SRC_URI:append:class-nativesdk =3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-install-netscsid-to-bin-for-nativesdk.patch">file:=
//0001-install-netscsid-to-bin-for-nativesdk.patch</a> \<br>
&gt; diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-opti=
on-eltorito-platform.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-a=
dd-new-option-eltorito-platform.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..c0b0364bb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-add-new-option-elto=
rito-platform.patch<br>
&gt; @@ -0,0 +1,336 @@<br>
&gt; +From 34de1b83f8000d95a10afcfdb7ec814cd75b12b2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
&gt; +Date: Mon, 25 Apr 2022 18:18:00 +0800<br>
&gt; +Subject: [PATCH] add new option -eltorito-platform<br>
&gt; +<br>
&gt; +Mkisofs now correctly supports El Torito multi boot entries by introd=
ucing<br>
&gt; +a Boot Dection Header before a list of alternate boot entries.<br>
&gt; +<br>
&gt; +New option -eltorito-platform allows to set the El Torito platform id=
<br>
&gt; +for a boot entry or for a list of boot entries. Supported values for<=
br>
&gt; +the parameter are:<br>
&gt; +-&nbsp;&nbsp; x86 the standard value vor x86 based PCs<br>
&gt; +-&nbsp;&nbsp; PPC the Power PC platform<br>
&gt; +-&nbsp;&nbsp; Mac The Apple Mac platform<br>
&gt; +-&nbsp;&nbsp; efi EFI based boot for PCs<br>
&gt; +-&nbsp;&nbsp; #&nbsp;&nbsp; an arbitrary numerical value<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [port from cdrtools]<br>
&gt; +https://github.com/jobermayr/cdrtools/commit/a50804fd61d75eb689a515db=
fca6968ca2296fd7<br>
&gt; +<br>
&gt; +Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
&gt; +---<br>
&gt; + genisoimage/eltorito.c&nbsp;&nbsp;&nbsp; | 73 ++++++++++++++++++++++=
+++++++++++++++--<br>
&gt; + genisoimage/genisoimage.c | 48 +++++++++++++++++++++++++<br>
&gt; + genisoimage/genisoimage.h |&nbsp; 8 +++++<br>
&gt; + genisoimage/iso9660.h&nbsp;&nbsp;&nbsp;&nbsp; | 33 ++++++++++++++++-=
-<br>
&gt; + 4 files changed, 158 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/genisoimage/eltorito.c b/genisoimage/eltorito.c<br>
&gt; +index d52e17e..a804988 100644<br>
&gt; +--- a/genisoimage/eltorito.c<br>
&gt; ++++ b/genisoimage/eltorito.c<br>
&gt; +@@ -56,6 +56,7 @@ static unsigned int bcat_de_flags;<br>
&gt; + void&nbsp; init_boot_catalog(const char *path);<br>
&gt; + void&nbsp; insert_boot_cat(void);<br>
&gt; + static&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nb=
sp; get_torito_desc(struct eltorito_boot_descriptor *boot_desc);<br>
&gt; ++static&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nb=
sp; fill_boot_shdr(struct eltorito_sectionheader_entry *boot_shdr_entry, in=
t arch);<br>
&gt; + static&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nb=
sp; fill_boot_desc(struct eltorito_defaultboot_entry *boot_desc_entry,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_boot_entry_info *boot_entry);<br>
&gt; + void&nbsp; get_boot_entry(void);<br>
&gt; +@@ -282,7 +283,14 @@ get_torito_desc(struct eltorito_boot_descriptor =
*boot_desc)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct directory_entry&nbsp; *de=
2;&nbsp;&nbsp; /* Boot catalog */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; offset;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; arch =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; nentries =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_defaultboot_entr=
y boot_desc_record;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_sectionheader_entry b=
oot_shdr_record;<br>
&gt; ++#ifdef __needed__<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_section_entry boot_se=
ction_record;<br>
&gt; ++#endif<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_sectionheader_entry *=
last_section_header =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(boot_desc, 0, sizeof (*bo=
ot_desc));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_desc-&gt;type[0] =3D 0;<br>
&gt; +@@ -311,13 +319,22 @@ get_torito_desc(struct eltorito_boot_descriptor=
 *boot_desc)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_731(boot_desc-&gt;bootcat_pt=
r,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; (unsigned int) get_733(de2-&gt;isorec.extent));<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If the platform id for the fi=
rst (default) boot entry has not been<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * explicitly set, we default to=
 EL_TORITO_ARCH_x86<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((first_boot_entry-&gt;type &amp; =
ELTORITO_BOOT_ID) =3D=3D 0) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; first_boot_entry-&gt;boot_platform =3D EL_TORITO_ARCH_x86;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arch =3D first_boot_entry-&gt;boot_pl=
atform;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we have the boot image, =
so write boot catalog information<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Next we write out the pr=
imary descriptor for the disc<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;valid_desc, 0, sizeo=
f (valid_desc));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_desc.headerid[0] =3D 1;<br=
>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_desc.arch[0] =3D EL_TORITO_ARCH=
_x86;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_desc.arch[0] =3D arch;&nbsp; /*=
 Platform id for the default boot */<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we'll shove start of pub=
lisher id into id field,<br>
&gt; +@@ -351,8 +368,17 @@ get_torito_desc(struct eltorito_boot_descriptor =
*boot_desc)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; current_boot_entry !=3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; current_boot_entry =3D current_boot_entry-&gt;next,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; offset +=3D sizeof (boot_desc_record)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int newarch =3D arch;<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (offset &gt;=3D SECTOR_SIZE) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (current_boot_entry-&gt;type &amp; ELTORITO_BOOT_ID)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; newarch =3D curr=
ent_boot_entry-&gt;boot_platform;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_ent=
ry-&gt;boot_platform =3D arch;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * El Torito has no such limitation but we currently have..=
.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (offset &gt;=3D (SECTOR_SIZE - sizeof (boot_desc_record))) {<=
br>
&gt; + #ifdef&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USE_LIBSCHILY<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; comerrno(EX=
_BAD,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Too m=
any El Torito boot entries\n&quot;);<br>
&gt; +@@ -362,12 +388,53 @@ get_torito_desc(struct eltorito_boot_descriptor=
 *boot_desc)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(1);<br=
>
&gt; + #endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (current_boot_entry =3D=3D first_boot_entry) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* EMPTY */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else if ((current_boot_entry =3D=3D first_boot_entry-&gt;next)=
 ||<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; (arch !=3D newarch) ||<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; (current_boot_entry-&gt;type &amp; ELTORITO_SECTION_HEADER)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (last_section=
_header)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_721(&amp;last_section_header-&gt;entry_=
count, nentries);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nentries =3D 1;<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; last_section_hea=
der =3D (struct eltorito_sectionheader_entry *)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; (de2-&gt;table + offset);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_boot_shdr(&=
amp;boot_shdr_record, newarch);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(de2-&gt;t=
able + offset, &amp;boot_shdr_record,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof (boot_shdr_reco=
rd));<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset +=3D size=
of (boot_desc_record);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nentries++; /* A=
dd entry to this section header */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * This works because a section entry has the same essentia=
l<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * layout as a default entry (and we do not populate the<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * selection criteria fields).<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; fill_boot_desc(&amp;boot_desc_record, current_boot_entry);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; memcpy(de2-&gt;table + offset, &amp;boot_desc_record,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; sizeof (boot_desc_record));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (last_section_header) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; set_721(&amp;last_section_header-&gt;entry_count, nentries);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; last_section_header-&gt;header_id[0] =3D EL_TORITO_SHDR_ID_LAST_=
SHDR;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; + }/* get_torito_desc(... */<br>
&gt; +<br>
&gt; ++static void<br>
&gt; ++fill_boot_shdr(boot_shdr_entry, arch)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct eltorito_sectionheader_entry *=
boot_shdr_entry;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arch;<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(boot_shdr_entry, 0, sizeof(str=
uct eltorito_sectionheader_entry));<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_shdr_entry-&gt;header_id[0] =3D =
EL_TORITO_SHDR_ID_SHDR;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_shdr_entry-&gt;platform_id[0] =
=3D arch;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static void<br>
&gt; + fill_boot_desc(struct eltorito_defaultboot_entry *boot_desc_entry,<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; struct eltorito_boot_entry_info *boot_entry)<br>
&gt; +@@ -678,7 +745,9 @@ get_boot_entry()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!first_boot_entry) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; first_boot_entry =3D current_boot_entry;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; last_boot_entry =3D current_boot_entry;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; current_boot_entry-&gt;boot_platform =3D EL_TORITO_ARCH_x86;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; current_boot_entry-&gt;boot_platform =3D last_boot_entry-&gt;boo=
t_platform;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; last_boot_entry-&gt;next =3D current_boot_entry;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; last_boot_entry =3D current_boot_entry;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +diff --git a/genisoimage/genisoimage.c b/genisoimage/genisoimage.c<br=
>
&gt; +index 46f0cb7..bfa920e 100644<br>
&gt; +--- a/genisoimage/genisoimage.c<br>
&gt; ++++ b/genisoimage/genisoimage.c<br>
&gt; +@@ -271,6 +271,8 @@ struct rcopts {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **variable;<br>
&gt; + };<br>
&gt; +<br>
&gt; ++static int get_boot_platid(opt_arg);<br>
&gt; ++<br>
&gt; + struct rcopts rcopt[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;PREP&quot;, &amp;preparer=
},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot;PUBL&quot;, &amp;publishe=
r},<br>
&gt; +@@ -404,6 +406,7 @@ struct ld_option {<br>
&gt; +<br>
&gt; + #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_ALLOW_LEADING_DOT=
S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1070<br>
&gt; + #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_PUBLISHER&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 1071<br>
&gt; ++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_PLATFORM&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 1072<br>
&gt; +<br>
&gt; + #ifdef&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; JIGDO_TEMPLATE<br>
&gt; + #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTION_JTT_OUTPUT&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 1101<br>
&gt; +@@ -528,6 +531,8 @@ static const struct ld_option ld_options[] =3D<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'b', &quot;FILE&quot;, &quot;Set=
 El Torito boot image name&quot;, ONE_DASH},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;eltorito-alt-boot&quot;,=
 no_argument, NULL, OPTION_ALT_BOOT},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '\0', NULL, &quot;Start specifyi=
ng alternative El Torito boot parameters&quot;, ONE_DASH},<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;eltorito-platform&quot;, requ=
ired_argument, NULL, OPTION_PLATFORM},<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '\0', &quot;ID&quot;, &quot;Set El To=
rito platform id for the next boot entry&quot;, ONE_DASH},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;sparc-boot&quot;, requir=
ed_argument, NULL, 'B'},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'B', &quot;FILES&quot;, &quot;Se=
t sparc boot image names&quot;, ONE_DASH},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{&quot;sunx86-boot&quot;, requi=
red_argument, NULL, OPTION_SUNX86BOOT},<br>
&gt; +@@ -1558,6 +1563,9 @@ int main(int argc, char *argv[])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_boot_en=
try();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case OPTION_PLATFORM:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_boot_platid(=
optarg);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; case OPTION_BOOTALPHA:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_alphabo=
ot++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* list of =
pathnames of boot images */<br>
&gt; +@@ -3829,3 +3837,43 @@ e_malloc(size_t size)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(pt, 0, size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (pt);<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++static int<br>
&gt; ++get_boot_platid(opt_arg)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp; *opt_arg;<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long&nbsp;&nbsp;&nbsp; val;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp; *ptr;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_eltorito++;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (streql(opt_arg, &quot;x86&quot;))=
 {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; val =3D EL_TORITO_ARCH_x86;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (streql(opt_arg, &quot;PPC&=
quot;)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; val =3D EL_TORITO_ARCH_PPC;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (streql(opt_arg, &quot;Mac&=
quot;)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; val =3D EL_TORITO_ARCH_PPC;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (streql(opt_arg, &quot;efi&=
quot;)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; val =3D EL_TORITO_ARCH_EFI;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; val =3D strtol(opt_arg, &amp;ptr, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (*ptr || val &lt; 0 || val &gt;=3D 0x100) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; comerrno(EX_BAD,=
 &quot;Bad boot system ID.\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If there is already a boot en=
try and the boot file name has been set<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * for this boot entry and the n=
ew platform id differs from the<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * previous value, we start a ne=
w boot section.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (current_boot_entry &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_=
entry-&gt;boot_image !=3D NULL &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_=
entry-&gt;boot_platform !=3D val) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_boot_entr=
y();<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_boot_entry();<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry-&gt;type |=3D ELTO=
RITO_BOOT_ID;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_boot_entry-&gt;boot_platform =
=3D val;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (1);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; +diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h<br=
>
&gt; +index bbedfb0..4dae1e8 100644<br>
&gt; +--- a/genisoimage/genisoimage.h<br>
&gt; ++++ b/genisoimage/genisoimage.h<br>
&gt; +@@ -299,6 +299,14 @@ struct eltorito_boot_entry_info {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot_info_table;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; load_size;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; load_addr;<br>
&gt; ++<br>
&gt; ++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ELTORITO_BOOT_ID&nbsp;&n=
bsp;&nbsp; 1<br>
&gt; ++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ELTORITO_SECTION_HEADER =
2<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp; type;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Valid if (type &amp; ELTORITO=
_BOOT_ID) !=3D 0<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp; boot_plat=
form;<br>
&gt; + };<br>
&gt; +<br>
&gt; + extern int&nbsp;&nbsp;&nbsp; goof;<br>
&gt; +diff --git a/genisoimage/iso9660.h b/genisoimage/iso9660.h<br>
&gt; +index c74c2a9..61b6fc0 100644<br>
&gt; +--- a/genisoimage/iso9660.h<br>
&gt; ++++ b/genisoimage/iso9660.h<br>
&gt; +@@ -62,6 +62,7 @@ struct iso_volume_descriptor {<br>
&gt; + #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_x86&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&gt; + #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_PPC&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&gt; + #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_MAC&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&gt; ++#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_ARCH_EFI&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0xEF<br>
&gt; +<br>
&gt; + #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_BOOTABLE&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0x88<br>
&gt; + #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EL_TORITO_NOT_BOOTABLE&n=
bsp; 0<br>
&gt; +@@ -159,10 +160,15 @@ struct eltorito_boot_descriptor {<br>
&gt; + };<br>
&gt; +<br>
&gt; + /* Validation entry for El Torito */<br>
&gt; ++/*<br>
&gt; ++ * headerid must be 1<br>
&gt; ++ * id is the manufacturer ID<br>
&gt; ++ * cksum to make the sum of all shorts in this record 0<br>
&gt; ++ */<br>
&gt; + struct eltorito_validation_entry {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char headerid&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 711 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char arch&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 711 */<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 721 */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char id&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp; 28)]; /=
* CD devel/man*/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char cksum&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(29,&nbsp; 30)];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char key1&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(31,&nbsp; 31)];<br>
&gt; +@@ -173,7 +179,7 @@ struct eltorito_validation_entry {<br>
&gt; + struct eltorito_defaultboot_entry {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_id&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 711 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_media&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char loadseg&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 711 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char loadseg&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 721 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sys_type&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp;&nbsp; 5)];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(6,&nbsp;&nbsp;&nbsp; 6)];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char nsect&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(7,&nbsp;&nbsp;&nbsp; 8)];<br>
&gt; +@@ -181,6 +187,29 @@ struct eltorito_defaultboot_entry {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad2&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(13,&nbsp; 32)];<br>
&gt; + };<br>
&gt; +<br>
&gt; ++/* El Torito section header entry in boot catalog */<br>
&gt; ++struct eltorito_sectionheader_entry {<br>
&gt; ++#define&nbsp;&nbsp;&nbsp; EL_TORITO_SHDR_ID_SHDR&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0x90<br>
&gt; ++#define&nbsp;&nbsp;&nbsp; EL_TORITO_SHDR_ID_LAST_SHDR 0x91<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char header_id&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)]; /* 711 */=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char platform_id&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char entry_count&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)]; /* 721 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp; 32)];<br>
&gt; ++};<br>
&gt; ++<br>
&gt; ++/* El Torito section entry in boot catalog */<br>
&gt; ++struct eltorito_section_entry {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_id&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(1,&nbsp;&nbsp;&nbsp; 1)];=
 /* 711 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char boot_media&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(2,&nbsp;&nbsp;&nbsp; 2)];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char loadseg&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(3,&nbsp;&nbsp;&nbsp; 4)];=
 /* 721 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sys_type&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(5,&nbsp;&nbsp;&nbsp; 5)];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char pad1&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(6,&nbsp;&nbsp;&nbsp; 6)];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char nsect&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(7,&nbsp;&nbsp;&nbsp; 8)];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char bootoff&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ISODCL(9,&nbsp;&nbsp; 12)];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sel_criteria&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; [ISODCL(13,&nbsp; 13)];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char vendor_sel_criteria&nbsp;&nbsp;&=
nbsp; [ISODCL(14,&nbsp; 32)];<br>
&gt; ++};<br>
&gt; ++<br>
&gt; + /*<br>
&gt; +&nbsp; * XXX JS: The next two structures have odd lengths!<br>
&gt; +&nbsp; * Some compilers (e.g. on Sun3/mc68020) padd the structures to=
 even length.<br>
&gt; +--<br>
&gt; +2.27.0<br>
&gt; +<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW3PR11MB4633C3EBA02FFC226953576E94FB9MW3PR11MB4633namp_--

