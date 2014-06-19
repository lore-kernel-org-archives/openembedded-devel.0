Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2563C6FE9E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 07:34:44 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id b13so1878917wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 00:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Y4Wl5boiYGFA6fkLq3VPSsVyHKy1b4ImgNW72fGkvp0=;
	b=NC0tTY5Y2Oxc46dCzzyZ6j08SsHp/WmIzlXn49XgluienLk/eKVTQbr4BQ3Tdgze8K
	IO6iEIolyoW9KLIcHqlt/dMgfkE6toaxqstUqyONcfGaQu45oOsxJP/tsAgC0+Gj46ZZ
	GccrZOfO5H0tmemO80XzypHwnXQnsjVgtECIVbFtVEsAIxIWbTC7RfxB41cqquVqpXcT
	U6dx2BiYjPeC/6obzuQeyRlT6U18bOHLS6DmXPfBtfgxFkt9ca6MEplIQUq8XlG2xCFN
	M+AlGIkDuBO8gIXNFTiFCva8M8gqFfnchiySWzjolKoxKYoDl0pAz2sOq40Zn1y1DauH
	GPZA==
X-Gm-Message-State: ALoCoQm2hQRhoszqs64CuzeA8fOA/8BDhU46qk3OdtoUoUNMxrQsaBclnoBcnavlh/4o7Q1oFBbY
X-Received: by 10.180.105.72 with SMTP id gk8mr4058305wib.32.1403163284702;
	Thu, 19 Jun 2014 00:34:44 -0700 (PDT)
Received: from iMac.local (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id o12sm30830913wiw.5.2014.06.19.00.34.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Jun 2014 00:34:43 -0700 (PDT)
Message-ID: <53A29291.1010700@dominion.thruhere.net>
Date: Thu, 19 Jun 2014 09:34:41 +0200
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1403153175-10707-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1403153175-10707-1-git-send-email-rongqing.li@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH][meta-oe] dialog: use pkg-config to detect ncurses
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jun 2014 07:34:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rongqing.li@windriver.com schreef op 19-06-14 06:46:
> From: Roy Li <rongqing.li@windriver.com>
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com> --- 
> meta-oe/recipes-extended/dialog/dialog.inc         |    6 ++- 
> .../use-pkg-config-for-ncurses-detection.patch     |   40
> ++++++++++++++++++++ 2 files changed, 44 insertions(+), 2 deletions(-) 
> create mode 100644
> meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
>
>  diff --git a/meta-oe/recipes-extended/dialog/dialog.inc
> b/meta-oe/recipes-extended/dialog/dialog.inc index c1c28fd..995d6c0
> 100644 --- a/meta-oe/recipes-extended/dialog/dialog.inc +++
> b/meta-oe/recipes-extended/dialog/dialog.inc @@ -8,12 +8,14 @@ DEPENDS =
> "ncurses" LICENSE = "LGPL-2.1" LIC_FILES_CHKSUM =
> "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
> 
> -SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz" +SRC_URI
> = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \ +
> file://use-pkg-config-for-ncurses-detection.patch \ +          "
> 
> # hardcoded here for use in dialog-static recipe S =
> "${WORKDIR}/dialog-${PV}"
> 
> -inherit autotools +inherit autotools-brokensep pkgconfig
> 
> EXTRA_OECONF = "--with-ncurses \ --disable-rpath-hack" diff --git
> a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
> b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
>
> 
new file mode 100644
> index 0000000..b5b4b3c --- /dev/null +++
> b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
>
> 
@@ -0,0 +1,40 @@
> +Subject: [PATCH] use pkg-config for ncurses detection. + 
> +Upstream-Status: Inappropriate [configuration]

Why is it inappropriate?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTopKRMkyGM64RGpERApAeAKCLeZIGfWL4weiMzenWA91aQFuqqwCgoRxq
xO5IYoi3T4N5J8UU8s834Po=
=fy9z
-----END PGP SIGNATURE-----

