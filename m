Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C03C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 16:49:33 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.1674.1645030171535368051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 08:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Wzs+OBoX;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645030172;
  x=1676566172;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d3b9zzC3COucXXvUQ1Gk5g5dnIiIU90I9ihgbjqz9gg=;
  b=Wzs+OBoXS3yfKji/w8yd6he746Inz/kUwR2OBikTnKjNqsF01O1tgkEG
   /oGx0S+Jf+105ovBGIIppSLERLjp/QCsp/L2K/lBPaa6+dpeSNR9Dckie
   u06y7OTuYvCy/Y8Ud1YWO0biqGmbBNguaYWkj+IbuGd8KsjQRxoFKWHZV
   KPw5OGdO4BTwRkMC3v/13rnyQN5RVGyUhEuoltQhbV7TNFYcuDINZ1Q/9
   zMRptspihdeE5WAxdVUiKV5K7FEzr8hcPokMFa7b+P8c41WgHovJ7ywM7
   8lTiMiADt1jTJAjpDpdPO0oEO7Q5YQmwYiHDZXc3YPyZpFMAFKS0lYav/
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Fabio Estevam <festevam@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>, Fabio Estevam
	<festevam@denx.de>
Subject: RE: [oe] [PATCH] rtc-tools: Bump the recipe
Thread-Topic: [oe] [PATCH] rtc-tools: Bump the recipe
Thread-Index: AQHYIz+AaBZ6pf03nU6jvFHuda3QN6yWYrCQ
Date: Wed, 16 Feb 2022 16:49:28 +0000
Message-ID: <3afa37cabd804575ba26cb3918ca19f9@axis.com>
References: <20220216141405.2315276-1-festevam@gmail.com>
In-Reply-To: <20220216141405.2315276-1-festevam@gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 16:49:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95338

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Fabio Estevam
> Sent: den 16 februari 2022 15:14
> To: openembedded-devel@lists.openembedded.org
> Cc: raj.khem@gmail.com; Fabio Estevam <festevam@denx.de>
> Subject: [oe] [PATCH] rtc-tools: Bump the recipe

I suggest changing the Git subject to:

rtc-tools: Update to 2022.02

as that is what the change is tagged as (also see below).

>=20
> From: Fabio Estevam <festevam@denx.de>
>=20
> The patch that adds the rtc-tools Makefile has been accepted
> upstream, so bump to the latest version and remove the local
> Makefile patch.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../0001-rtc-tools-Add-a-Makefile.patch       | 39 -------------------
>  .../rtc-tools/rtc-tools_1.0.0.bb              |  6 +--
>  2 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-=
tools-Add-a-Makefile.patch
>=20
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-A=
dd-a-Makefile.patch b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-=
tools-Add-a-Makefile.patch
> deleted file mode 100644
> index 1d16a66088e8..000000000000
> --- a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Ma=
kefile.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 3e9dfc0f21191bdb3ab719479e9c1997a61c5044 Mon Sep 17 00:00:00 2001
> -From: Fabio Estevam <festevam@denx.de>
> -Date: Fri, 28 Jan 2022 13:34:45 -0300
> -Subject: [PATCH] rtc-tools: Add a Makefile
> -
> -Add a Makefile to make installation and uninstallation
> -process easier.
> -
> -Upstream-Status: Submitted [https://marc.info/?l=3Dlinux-
> rtc&m=3D164332426030004&w=3D2]
> -Signed-off-by: Fabio Estevam <festevam@denx.de>
> ----
> - Makefile | 16 ++++++++++++++++
> - 1 file changed, 16 insertions(+)
> - create mode 100644 Makefile
> -
> -diff --git a/Makefile b/Makefile
> -new file mode 100644
> -index 0000000..71a4c9c
> ---- /dev/null
> -+++ b/Makefile
> -@@ -0,0 +1,16 @@
> -+prefix ?=3D /usr
> -+bindir ?=3D $(prefix)/bin
> -+
> -+EXEC =3D rtc-range rtc rtc-sync
> -+
> -+all: $(EXEC)
> -+
> -+clean:
> -+	$(RM) $(EXEC)
> -+
> -+install:
> -+	install -d $(DESTDIR)$(bindir)
> -+	install $(EXEC) $(DESTDIR)$(bindir)
> -+
> -+uninstall:
> -+	$(RM) -r $(addprefix $(DESTDIR)$(bindir)/,$(EXEC))
> ---
> -2.25.1
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-=
oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
> index 303585a6591d..d65f5da859af 100644
> --- a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
> +++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb

It seems this was tagged as "2022.02" so the recipe should be=20
renamed to "rtc-tools_2022.02.bb" to match.

> @@ -2,10 +2,8 @@ SUMMARY =3D "Useful programs to test rtc drivers"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74274e8a218423e49eefdea80bc55=
038"
>=20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BP=
N}.git;protocol=3Dhttps;branch=3Dmaster \
> -           file://0001-rtc-tools-Add-a-Makefile.patch \
> -           "
> -SRCREV =3D "acc442e7af4e1e783432a43d37f1a7938c692659"
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BP=
N}.git;protocol=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "61839777afedcc7bdb68ea4628c5ce5ca72c2ac8"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> --
> 2.25.1


