Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163CDC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 12:44:21 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.6806.1668084256888256620
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 04:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mCjhCKw3;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668084257;
  x=1699620257;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=O1NxSuVN8rEBuHIxmFsrxxopjx2IA50ZdHMSmCbAVI0=;
  b=mCjhCKw3zjiHTLIGZO0iNeXs94mOLieX6V2mWsANfDSRTmnE2eDfwinN
   RQ5djalBwQQ+/w47zoJN0XqrMhcdnKGuCT9DD/7khUBW019T032Ns0sPK
   Dnmt5clK9kvusQH1HWATV2gyks3mYLMbNVPCnXSmWZNUyNyDG0dK5ZFvv
   iOTwaEOA13VXOP/a3V242/CH4XmFM2fJN18FdGom1Cdk9uzBgOpF8ddnZ
   hRW6tMvvkO/PrunVBBLBAwv/ymkfkrun/IAnOJEF96V74tD5z+7RpYchW
   OLKvQF5KGmtd1YBd4RD4pvceW3ue4MbU59doBoV4bw9lYagx5pltPQs9t
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] hwdata: add patch to use sysroot prefix for
 pkgdatadir
Thread-Topic: [oe] [meta-oe][PATCH] hwdata: add patch to use sysroot prefix
 for pkgdatadir
Thread-Index: AQHY9NWdPc+F4+XneUmN+e+/dDDxMK44Gfjg
Date: Thu, 10 Nov 2022 12:44:14 +0000
Message-ID: <2537e681d5fb4b979b323578ecfede6e@axis.com>
References: <20221110072509.13944-1-f_l_k@t-online.de>
In-Reply-To: <20221110072509.13944-1-f_l_k@t-online.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 12:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99548

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Markus Volk
> Sent: den 10 november 2022 08:25
> To: openembedded-devel@lists.openembedded.org
> Cc: Markus Volk <f_l_k@t-online.de>
> Subject: [oe] [meta-oe][PATCH] hwdata: add patch to use sysroot prefix fo=
r pkgdatadir
>=20
> This patch has been submitted upstream here:
> https://github.com/vcrhonek/hwdata/pull/19/commits/d3325fd72bd45ba74e709b=
4083521104193b224e
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-sysroot-prefix-for-pkgdatadir-varia.patch | 31 +++++++++++++++++++
>  .../recipes-support/hwdata/hwdata_0.364.bb    |  6 +++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.=
in-use-sysroot-prefix-for-pkgdatadir-varia.patch
>=20
> diff --git a/meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-=
sysroot-prefix-for-pkgdatadir-varia.patch b/meta-oe/recipes-support/hwdata/=
hwdata/0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.patch
> new file mode 100644
> index 000000000..2ee63bc32
> --- /dev/null
> +++ b/meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-sysroot=
-prefix-for-pkgdatadir-varia.patch
> @@ -0,0 +1,31 @@
> +From f5311fb8519c6360333934537abeb64198e2c212 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Wed, 9 Nov 2022 18:37:41 +0100
> +Subject: [PATCH] hwdata.pc.in: use sysroot prefix for pkgdatadir variabl=
e
> +
> +The pc_sysroot is automatically added to cflags and libs but not
> +to 'pkg-config --variable'. This matches what wayland-protocols does.
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Patch-Status: Submitted
> +https://github.com/vcrhonek/hwdata/pull/19/commits/d3325fd72bd45ba74e709=
b4083521104193b224e

That should be on one line, i.e.:

Patch-Status: Submitted [https://github.com/vcrhonek/hwdata/pull/19/commits=
/d3325fd72bd45ba74e709b4083521104193b224e]

Makes it a lot easier for tools like grep...

//Peter


