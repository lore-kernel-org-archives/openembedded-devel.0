Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237B0C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 06:46:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.84678.1677480358962102543
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Feb 2023 22:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CDi8piMk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=142232f7cb=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R5cT56017385
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 06:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=N04Emrq31fk+3sL87AY8og30iruuVaQ8DdgyZsAGWpc=;
 b=CDi8piMkoARUuSOyqqrx0AgHHwwg5r583wbCRAh1zfYwH8ITlC5dQbvk4qe2/hb8z0xK
 UGHXzIEwwpY9P7Q5YEq6qJfWTcg8/s95QMHZYcW9G690kPowHIgNLIiXCShd6p5KtXYV
 ml2jNTdFtUabwZKtGKKWZOMVJQsKKiQxaDCTQbdHdswye8uj9lzHgHjxJ4AuGIpxDIdy
 BWbqku8B13zGt3CMTeYlBvcjiFTtMRxsZmibJm58mG67wFVXVDZjXVlwLs4Qz7Uv9FfS
 t6duYYNv/ZysnpIck3L5dDym6i2G/EcDV8o5Q2PLIum2PEN6H8Zrsbq1HSWbGxHa+Fh7 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmk9m82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 06:45:57 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31R6jv5C019847
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 06:45:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmk9m81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 06:45:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czJEOxlDb1JrH03f5pkSTBTm6eoNs8O3xGmS2WSvSYUeShfMfYmB+IiJYAH7RIbFrY3HMP1/XGu92mVp9Gj6v5mLeQ3nm9K0PPjI8bYPkLswUoJiy6qWgD1QwejJYu2USJgjtZib92k7Afwp/1fz/CzugB2kbH6YDBIqDmwLZOWJQeeBXpeHgEx7tJMOUDgdFLwJUyXTFRl0fl90Ux+odlG3b6C0RdjmkduQ+Gxoc8/aYJjCBNM3rjwcM3XPhR44+fJUc4CZX8fJgIReG5nZb2tArk0ho4Xvn81rSZV3mM0XavyxrNtZRXl/xFqiLBnxaHsib5TTXDTIswCNlqEtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N04Emrq31fk+3sL87AY8og30iruuVaQ8DdgyZsAGWpc=;
 b=i6s+U0V/Cz02RCu8aVo+pBYymKK+cGBRRy5nBfKPMg3KLkSlcC6mhhdY0yCKDzipylsiZA+YKxOU9rDdxng3j8uFDwk71m9SiWuvIh00D0eJskIuGTB3hhV4r48zbb+gGc9XXFoBUQ2EeGbxPHWkM2/7KNJtMffsa/VlGx6Eapn99l08Qoz3WEvq16GYPcyZBt9qdmMSJS6ucANsTi+Dw81/bSPBq2lFpSt/cl9U8l37YznKj9hFVVxOuAg5Er7WDIzCFouXJc71xFQyvoNDCqjBWltb23gwxQr9F+2jAAfCS7Qd0APV2SwVVuuNUNksyf81UHw3ROPuPYENxyrO0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 06:45:53 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::37fa:8b56:8596:c286]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::37fa:8b56:8596:c286%4]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 06:45:52 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: akuster808 <akuster808@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc
 deprecation warning in downloadutils Warning appears as:
Thread-Topic: [oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc
 deprecation warning in downloadutils Warning appears as:
Thread-Index: AQHZE2vtlPIxu1JHAEeIoEmi+CbwLq7bRDIAgAUOhwCAAnNqzw==
Date: Mon, 27 Feb 2023 06:45:52 +0000
Message-ID: 
 <DM4PR11MB55501C9B35850E4472447641E4AF9@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221219053618.3558291-1-narpat.mali@windriver.com>
 <DM4PR11MB55505E4A9EF24EC63FC7E772E4AA9@DM4PR11MB5550.namprd11.prod.outlook.com>
 <86b0188a-bf97-a9fb-8967-d4e42a08f2e3@gmail.com>
In-Reply-To: <86b0188a-bf97-a9fb-8967-d4e42a08f2e3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|IA0PR11MB7956:EE_
x-ms-office365-filtering-correlation-id: ec70bd3d-83d1-44fb-9164-08db188e452f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 v1pCZAW+SJPdqJMp4rB4HICL8wBfVLdEHco6A2xZYXTUSPPHJR2YXEtHyMDAKjYoMXXDSMpAqJgHsjIfyiyoW5LjkjyX8vZgdkNb90juamVY38WAgIL74ly7DpjOrEmVi/dIxYrkGEK7hNT22DkyY+YrxHg7QwyvWArCMv1lUR0zznlCm+mALkOKz9xflF5h/XMIvWPU0G+FzvH2E9my/qFL4ggi2Xt8450nGWEJHJPpvyTdTYLWf1MrYiBl7W2bFI0+Qv5zOtr0UXz0YUFn2DL8unHo3CwfFdQev/aYsSf1TYEXRTdHyf0Kq+6jpaQcjE4Drrd8G5BkNG5k4rVmqgCuTTqfLuQJkthLe+fGrKjlpb4rmFukZv0N35KJCL1GAc4H8UCY7hE+oRQeqdvlQg45BG0qOoPU8Cm1hb9xQQXEYemNJqcJ87qeSixHDWSmXRCaWSuH0/4nsgtIh1A0CilyxcDUVK5f4/uZWokB7GNOVByll/mxNK6/cpHZnX3SPzQXXM6yfYFiLA6AdnRfIFds67Z9eMEQXAJvqULCe6CK/rYW4sVpI0Dnt2LPBjXTk1Ibet/I+u1V+r6Zj4GJkG2eR1txVWttkzsZva/4bcVixO5uGI4YFEaXQFYYlfI6QC6WRy6qVv5qD6ChuHP1jtQRrsDRfCkOcSxpQ2Aq/SYuVod5CCAgvjVi+inRsUDOv2/z8rNwij3re2qtlZm9CComO+vHNYXBlVnmhLBv+y0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(136003)(396003)(366004)(346002)(451199018)(19627405001)(8936002)(5660300002)(52536014)(71200400001)(91956017)(2906002)(64756008)(66946007)(76116006)(66476007)(66556008)(66446008)(4326008)(8676002)(54906003)(110136005)(966005)(316002)(66899018)(478600001)(7696005)(41300700001)(186003)(107886003)(26005)(6506007)(55236004)(53546011)(9686003)(122000001)(86362001)(33656002)(38100700002)(38070700005)(83380400001)(166002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?AZ+VKVP+UzyajGyQ4VRKpou+Hd35cDVZDwZS3TH/6q/phFBEqygFcDfImI?=
 =?iso-8859-1?Q?dEMl0HY9Y9XLhW2uOpxNVFG9eivr0GXpKkSSJ3UqNONct/jwbXjdpLkyzS?=
 =?iso-8859-1?Q?5TfS3oNC3o9WWqCbhtFEfHLrR9EaTBHQSQdw8Rk1I5hiUht08szxWZ/k2m?=
 =?iso-8859-1?Q?5BWJP4FNNNfvtlFFPnKfixNXDs6rBx3liSUkTQJK1BAlqdIDZOMMQmUfUY?=
 =?iso-8859-1?Q?lWc0QpenJBLvwNiVpnsdKp+APQc2EAebQQxtGcMM2O/cH37DsyCu7Wgqo7?=
 =?iso-8859-1?Q?u8B6RbG8youVStyA7qC3CbyOXvZqjHM6jJ9cUACcymK1ecryhj94gkoqx4?=
 =?iso-8859-1?Q?pAWMB6vx5TrBKQlqptAT+0DQjNDx3L75OgunHJ7VzQTeGezw60KcIhm3Af?=
 =?iso-8859-1?Q?ZdIEOxmPmnrpIvXBAGakU6zpzsXumKdlMT25eCJKwiEq5MxMj4uF/chY5m?=
 =?iso-8859-1?Q?00qcRXbWozrJcRg8LpeNHCzB9nwoKAQF267ugpQ+BV9yx7wSXlcQwNwlYw?=
 =?iso-8859-1?Q?acxqmIDXu9+CoU7+oIN8dBSFe0DnZQSW8Iqpj9HBMypSafUrl2itSuAuPy?=
 =?iso-8859-1?Q?+897h9kP/PVQ4dgYs7UcALNm7i2edLSeS4x5wslJPqqwgNGGN9UPP9bYcw?=
 =?iso-8859-1?Q?aqX55hpFoTRLxQDxB69MBPRz45Ctkz5EPKDVzmVze8mqZ4W/aKXa18wF+I?=
 =?iso-8859-1?Q?hUpGiFXn9D5FosnaiRXKliQVNrNjFI+d8cEmu65+2YB3sMaPUPorsW4zzB?=
 =?iso-8859-1?Q?dYVkiZNSyevV5fwvE3slBJDO0Y2sUu9DO+M6cl2A6C2oLWjxgQLyeeEqGg?=
 =?iso-8859-1?Q?5hwlP5J2/m81RYqPNOj5onSe97me1H+NuMVRYDYZLw3yyeWOIaftbutLiF?=
 =?iso-8859-1?Q?OS/t/6wRYF64rVSBUiiARdilt7O7qTQkbRvVf+nOJME8Mo/NJ7bmdWa9LT?=
 =?iso-8859-1?Q?fxCry/g9qLri9FtXFISBnnLGtoYDHN4a67tK9+ilxbuh+5ejQeuddsw0Sm?=
 =?iso-8859-1?Q?mQeBvzgK5l0pM3krHlaJ3ZaEBIWREa0n9dcz8QY93Qr4SjTnv7PGKpIpdE?=
 =?iso-8859-1?Q?GzRUA8pVRw1KVSYDSGdJuj3TNXHvL8Yvk2ppJcqdP39T6i4NejMMDvUFa1?=
 =?iso-8859-1?Q?IpD9aVqmB3aDdS2+oEFn6ZV9/MC3rqh7JOs5wcswPbuja6dCPjvVKgJF20?=
 =?iso-8859-1?Q?ktnLLo/aICL2gKqEZr46WsITVxYoH0YUZ9JwVGnYFgpvfMMsU8AjQPRNup?=
 =?iso-8859-1?Q?2aooUFGOKliCKVAh4Dg6JcceeVyuheoPZ7I0kJ143KzDtIoEBhVxpsZE3X?=
 =?iso-8859-1?Q?HC5lQNFjoLpGI/yJinwHBiOoLug+/MzGX+vKAK4v7KpACtnDQqlz3OhQNb?=
 =?iso-8859-1?Q?krtLF9hy/HBTzdtEbYcD3kXkt+POaC0NDbqJHV0m/DMz2Ix6XcbBcMy7aN?=
 =?iso-8859-1?Q?2gI3LDys3K1NjxkyNPNSIr+wDBjqO4sU8uN41pVzrO8VHk7lc/RWlGusmr?=
 =?iso-8859-1?Q?ETp+LzLYfXu+uF0vDn5rMe/5rsAGFZvthNpjRXKxNeS61mQaXvbCoAp34y?=
 =?iso-8859-1?Q?uTKCAcuTyChA+Nvq/PH/+/iId8gowtw52xDNzxZaMcQ2rFrk9Mic9yEX4n?=
 =?iso-8859-1?Q?YAR9PseVe7IsGTjjVHN6utjjvcF6t1hdx1?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB55501C9B35850E4472447641E4AF9DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec70bd3d-83d1-44fb-9164-08db188e452f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 06:45:52.7912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1gIDQbmWUTdCoUK3pQflu9TlYUUOgCZnvwILESejPAXTt4YPR3gacpIv4tGnQzSUDtA4j206CnZowI5SazmtZdSzBtrSXHvsywNR3Pc6GWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
X-Proofpoint-GUID: 4uEW3ov-kh-fh37ChD9WCTTJyfZviWZc
X-Proofpoint-ORIG-GUID: G-lSLHEaORutHbHmghyAV9b-pMnUwwFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 06:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101262

--_000_DM4PR11MB55501C9B35850E4472447641E4AF9DM4PR11MB5550namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yes, it was only.
Got it and sorry for bothering you.

Best Regards,
Narpat

________________________________
From: akuster808 <akuster808@gmail.com>
Sent: Saturday, February 25, 2023 10:45 PM
To: Mali, Narpat <Narpat.Mali@windriver.com>; openembedded-devel@lists.open=
embedded.org <openembedded-devel@lists.openembedded.org>
Cc: Polampalli, Archana <Archana.Polampalli@windriver.com>; G Pillai, Hari =
<Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc de=
precation warning in downloadutils Warning appears as:

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On 2/22/23 7:05 AM, Narpat Mali wrote:
>
> Reminder.
>

Is this it?

https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-d=
evtools/python/python3-requests-toolbelt_0.9.1.bb?h=3Dkirkstone&id=3D19f07c=
055a3d023f81882c4904d66949085fa322

- armin
>
> Best Regards,
>
> Narpat
>
> *From: *Narpat Mali <mailto:narpat.mali@windriver.com>
> *Sent: *19 December 2022 11:07
> *To: *openembedded-devel@lists.openembedded.org
> *Cc: *Polampalli, Archana <mailto:Archana.Polampalli@windriver.com>; G
> Pillai, Hari <mailto:Hari.GPillai@windriver.com>; Mali, Narpat
> <mailto:Narpat.Mali@windriver.com>
> *Subject: *[oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc
> deprecation warning in downloadutils Warning appears as:
>
> tests/test_downloadutils.py::test_stream_response_to_specific_filename
>   requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning:
> Using or importing the ABCs from 'collections' instead of from
> 'collections.abc' is deprecated, and in 3.8 it will stop working
>     if path and isinstance(getattr(path, 'write', None),
> collections.Callable):
>
> Upstream-Status: Backport
> [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0=
d5ae44e34eaf]
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  ...abc-deprecation-warning-in-downloadu.patch | 41 +++++++++++++++++++
>  .../python/python3-requests-toolbelt_0.9.1.bb |  5 ++-
>  2 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-co=
llections.abc-deprecation-warning-in-downloadu.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-=
collections.abc-deprecation-warning-in-downloadu.patch
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-=
collections.abc-deprecation-warning-in-downloadu.patch
> new file mode 100644
> index 000000000..baa833b6d
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-=
collections.abc-deprecation-warning-in-downloadu.patch
> @@ -0,0 +1,41 @@
> +From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 2001
> +From: Jon Dufresne <jon.dufresne@gmail.com>
> +Date: Fri, 1 Feb 2019 16:30:01 -0800
> +Subject: [PATCH] Fix collections.abc deprecation warning in downloadutil=
s
> +
> +Warning appears as:
> +
> +tests/test_downloadutils.py::test_stream_response_to_specific_filename
> +  requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning:
> Using or importing the ABCs from 'collections' instead of from
> 'collections.abc' is deprecated, and in 3.8 it will stop working
> +    if path and isinstance(getattr(path, 'write', None),
> collections.Callable):
> +
> +Upstream-Status: Backport
> [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0=
d5ae44e34eaf]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + requests_toolbelt/downloadutils/stream.py | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/requests_toolbelt/downloadutils/stream.py
> b/requests_toolbelt/downloadutils/stream.py
> +index eed60a7..1d1c31b 100644
> +--- a/requests_toolbelt/downloadutils/stream.py
> ++++ b/requests_toolbelt/downloadutils/stream.py
> +@@ -1,6 +1,5 @@
> + # -*- coding: utf-8 -*-
> + """Utilities for dealing with streamed requests."""
> +-import collections
> + import os.path
> + import re
> +
> +@@ -158,7 +157,7 @@ def stream_response_to_file(response, path=3DNone,
> chunksize=3D_DEFAULT_CHUNKSIZE):
> +     pre_opened =3D False
> +     fd =3D None
> +     filename =3D None
> +-    if path and isinstance(getattr(path, 'write', None),
> collections.Callable):
> ++    if path and callable(getattr(path, 'write', None)):
> +         pre_opened =3D True
> +         fd =3D path
> +         filename =3D getattr(fd, 'name', None)
> +--
> +2.25.1
> +
> diff --git
> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> index 366f41ca8..72ad7a618 100644
> ---
> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> +++
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> @@ -6,7 +6,8 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D71760e0f1dda8cff91b0bc9246caf571
> <[file://LICENSE;md5=3D71760e0f1dda8cff91b0bc9246caf571]file://LICENSE;md=
5=3D71760e0f1dda8cff91b0bc9246caf571>"
>
>  SRC_URI =3D "file://run-ptest \
> -          "
> +
> file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
> <file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch> =
\
> +           "
>
>  SRC_URI[md5sum] =3D "b1509735c4b4cf95df2619facbc3672e"
>  SRC_URI[sha256sum] =3D
> "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
> @@ -31,4 +32,4 @@ do_install_ptest() {
>          # remove test test_multipart_encoder.py as it fails,
>          # downloaded file is not supported
>          rm -f ${D}${PTEST_PATH}/tests/test_multipart_encoder.py
> -}
> +}
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101209): https://lists.openembedded.org/g/openembedde=
d-devel/message/101209
> Mute This Topic: https://lists.openembedded.org/mt/95760086/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
kuster808@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_DM4PR11MB55501C9B35850E4472447641E4AF9DM4PR11MB5550namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Yes, it was only.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Got it and s<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial=
, Helvetica, sans-serif; font-size: 12pt;">orry for bothering you.</span></=
div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Best Regards,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Narpat</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> akuster808 &lt;akuste=
r808@gmail.com&gt;<br>
<b>Sent:</b> Saturday, February 25, 2023 10:45 PM<br>
<b>To:</b> Mali, Narpat &lt;Narpat.Mali@windriver.com&gt;; openembedded-dev=
el@lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;=
<br>
<b>Cc:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; G =
Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> Re: [oe][meta-python][kirkstone][PATCH 1/1] Fix collections=
.abc deprecation warning in downloadutils Warning appears as:</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On 2/22/23 7:05 AM, Narpat Mali wrote:<br>
&gt;<br>
&gt; Reminder.<br>
&gt;<br>
<br>
Is this it?<br>
<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-pytho=
n/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb?h=3Dkirkstone&=
amp;id=3D19f07c055a3d023f81882c4904d66949085fa322" data-auth=3D"NotApplicab=
le">https://git.openembedded.org/meta-openembedded/commit/meta-python/recip=
es-devtools/python/python3-requests-toolbelt_0.9.1.bb?h=3Dkirkstone&amp;id=
=3D19f07c055a3d023f81882c4904d66949085fa322</a><br>
<br>
- armin<br>
&gt;<br>
&gt; Best Regards,<br>
&gt;<br>
&gt; Narpat<br>
&gt;<br>
&gt; *From: *Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com" d=
ata-auth=3D"NotApplicable">mailto:narpat.mali@windriver.com</a>&gt;<br>
&gt; *Sent: *19 December 2022 11:07<br>
&gt; *To: *openembedded-devel@lists.openembedded.org<br>
&gt; *Cc: *Polampalli, Archana &lt;<a href=3D"mailto:Archana.Polampalli@win=
driver.com" data-auth=3D"NotApplicable">mailto:Archana.Polampalli@windriver=
.com</a>&gt;; G<br>
&gt; Pillai, Hari &lt;<a href=3D"mailto:Hari.GPillai@windriver.com" data-au=
th=3D"NotApplicable">mailto:Hari.GPillai@windriver.com</a>&gt;; Mali, Narpa=
t<br>
&gt; &lt;<a href=3D"mailto:Narpat.Mali@windriver.com" data-auth=3D"NotAppli=
cable">mailto:Narpat.Mali@windriver.com</a>&gt;<br>
&gt; *Subject: *[oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc=
<br>
&gt; deprecation warning in downloadutils Warning appears as:<br>
&gt;<br>
&gt; tests/test_downloadutils.py::test_stream_response_to_specific_filename=
<br>
&gt;&nbsp;&nbsp; requests_toolbelt/downloadutils/stream.py:161: Deprecation=
Warning:<br>
&gt; Using or importing the ABCs from 'collections' instead of from<br>
&gt; 'collections.abc' is deprecated, and in 3.8 it will stop working<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; if path and isinstance(getattr(path, 'write', =
None),<br>
&gt; collections.Callable):<br>
&gt;<br>
&gt; Upstream-Status: Backport<br>
&gt; [<a href=3D"https://github.com/requests/toolbelt/commit/7188b06330e526=
0be20bce8cbcf0d5ae44e34eaf" data-auth=3D"NotApplicable">https://github.com/=
requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf</a>]<br>
&gt;<br>
&gt; Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...abc-deprecation-warning-in-downloadu.patch | 41 +++++++++++++=
++++++<br>
&gt;&nbsp; .../python/python3-requests-toolbelt_0.9.1.bb |&nbsp; 5 ++-<br>
&gt;&nbsp; 2 files changed, 44 insertions(+), 2 deletions(-)<br>
&gt;&nbsp; create mode 100644<br>
&gt; meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix=
-collections.abc-deprecation-warning-in-downloadu.patch<br>
&gt;<br>
&gt; diff --git<br>
&gt; a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-F=
ix-collections.abc-deprecation-warning-in-downloadu.patch<br>
&gt; b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-F=
ix-collections.abc-deprecation-warning-in-downloadu.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..baa833b6d<br>
&gt; --- /dev/null<br>
&gt; +++<br>
&gt; b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-F=
ix-collections.abc-deprecation-warning-in-downloadu.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jon Dufresne &lt;jon.dufresne@gmail.com&gt;<br>
&gt; +Date: Fri, 1 Feb 2019 16:30:01 -0800<br>
&gt; +Subject: [PATCH] Fix collections.abc deprecation warning in downloadu=
tils<br>
&gt; +<br>
&gt; +Warning appears as:<br>
&gt; +<br>
&gt; +tests/test_downloadutils.py::test_stream_response_to_specific_filenam=
e<br>
&gt; +&nbsp; requests_toolbelt/downloadutils/stream.py:161: DeprecationWarn=
ing:<br>
&gt; Using or importing the ABCs from 'collections' instead of from<br>
&gt; 'collections.abc' is deprecated, and in 3.8 it will stop working<br>
&gt; +&nbsp;&nbsp;&nbsp; if path and isinstance(getattr(path, 'write', None=
),<br>
&gt; collections.Callable):<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D"https://github.com/requests/toolbelt/commit/7188b06330e526=
0be20bce8cbcf0d5ae44e34eaf" data-auth=3D"NotApplicable">https://github.com/=
requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
&gt; +---<br>
&gt; + requests_toolbelt/downloadutils/stream.py | 3 +--<br>
&gt; + 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/requests_toolbelt/downloadutils/stream.py<br>
&gt; b/requests_toolbelt/downloadutils/stream.py<br>
&gt; +index eed60a7..1d1c31b 100644<br>
&gt; +--- a/requests_toolbelt/downloadutils/stream.py<br>
&gt; ++++ b/requests_toolbelt/downloadutils/stream.py<br>
&gt; +@@ -1,6 +1,5 @@<br>
&gt; + # -*- coding: utf-8 -*-<br>
&gt; + &quot;&quot;&quot;Utilities for dealing with streamed requests.&quot=
;&quot;&quot;<br>
&gt; +-import collections<br>
&gt; + import os.path<br>
&gt; + import re<br>
&gt; +<br>
&gt; +@@ -158,7 +157,7 @@ def stream_response_to_file(response, path=3DNone=
,<br>
&gt; chunksize=3D_DEFAULT_CHUNKSIZE):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; pre_opened =3D False<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fd =3D None<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; filename =3D None<br>
&gt; +-&nbsp;&nbsp;&nbsp; if path and isinstance(getattr(path, 'write', Non=
e),<br>
&gt; collections.Callable):<br>
&gt; ++&nbsp;&nbsp;&nbsp; if path and callable(getattr(path, 'write', None)=
):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pre_opened =3D True<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D path<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filename =3D getattr=
(fd, 'name', None)<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git<br>
&gt; a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.=
bb<br>
&gt; b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.=
bb<br>
&gt; index 366f41ca8..72ad7a618 100644<br>
&gt; ---<br>
&gt; a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.=
bb<br>
&gt; +++<br>
&gt; b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.=
bb<br>
&gt; @@ -6,7 +6,8 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE;md5=3D71760e0f1dda8cff91b0bc9246caf571<br>
&gt; &lt;[file://LICENSE;md5=3D71760e0f1dda8cff91b0bc9246caf571]file://LICE=
NSE;md5=3D71760e0f1dda8cff91b0bc9246caf571&gt;&quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI =3D &quot;file://run-ptest \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt; +<br>
&gt; <a href=3D"file://0001-Fix-collections.abc-deprecation-warning-in-down=
loadu.patch" data-auth=3D"NotApplicable" data-loopstyle=3D"link">
file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch</a><=
br>
&gt; &lt;<a href=3D"file://0001-Fix-collections.abc-deprecation-warning-in-=
downloadu.patch" data-auth=3D"NotApplicable" data-loopstyle=3D"link">file:/=
/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch</a>&gt; \<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&gt;<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;b1509735c4b4cf95df2619facbc3672e&quot;=
<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D<br>
&gt; &quot;968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0=
&quot;<br>
&gt; @@ -31,4 +32,4 @@ do_install_ptest() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # remove test te=
st_multipart_encoder.py as it fails,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # downloaded fil=
e is not supported<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -f ${D}${PTES=
T_PATH}/tests/test_multipart_encoder.py<br>
&gt; -}<br>
&gt; +}<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#101209): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/101209" data-auth=3D"NotApplicable">
https://lists.openembedded.org/g/openembedded-devel/message/101209</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95760086=
/3616698" data-auth=3D"NotApplicable">
https://lists.openembedded.org/mt/95760086/3616698</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" data-auth=3D"NotApplicable">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [akuster808@g=
mail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB55501C9B35850E4472447641E4AF9DM4PR11MB5550namp_--

