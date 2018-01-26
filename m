Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE8D78355
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 14:59:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1516978761; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=xO8gtIJRWhpO48OpfHJxPxRbfjhfmTuvVQbbp8qzUvA=;
	b=D7b+Id6nc+VeTPqjEtanz7rlUIMpfBX9IEuC4aHRfZFFF/36kioNntcq2Sq/D6C2ExDeEyhj
	IFX5tP0ZFOCSiakvfPpRw6bOVJly/tMMVIaLxZYHAcKVC1taeHaKAOY6HyyzUIVO/ZYGPl3X
	FC7NOi3e74aNLMnNi3rc4OwGjOg=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mxa.mailgun.org with ESMTP id 5a6b4249.7fc5f86c5ef0-smtp-out-n03;
	Fri, 26 Jan 2018 14:59:21 -0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id z11so1915849qtm.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 06:59:20 -0800 (PST)
X-Gm-Message-State: AKwxytcN9Ci/CTm61bNzinqzG2dtlb4duiQ7QJosmZZUBrh2vYWujSkN
	gOPvdtcxjKCoLuVBrKAWBLdsuAT6DH5kQiKtUVI=
X-Google-Smtp-Source: AH8x224oSJTqNPqBn5feap1PWP9vwTkvZ9w41iaEw2ijzYYfQs9oaxU8eyfCyR99yX4q60jGZexlIlAcv55UWKHIPWI=
X-Received: by 10.55.51.12 with SMTP id z12mr20734454qkz.152.1516978760249;
	Fri, 26 Jan 2018 06:59:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.71 with HTTP; Fri, 26 Jan 2018 06:59:19 -0800 (PST)
In-Reply-To: <MMXP123MB1182908875FBCB83FB09F53085E00@MMXP123MB1182.GBRP123.PROD.OUTLOOK.COM>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
	<1516551637-32255-6-git-send-email-derek@asterius.io>
	<MMXP123MB1182908875FBCB83FB09F53085E00@MMXP123MB1182.GBRP123.PROD.OUTLOOK.COM>
From: Derek Straka <derek@asterius.io>
Date: Fri, 26 Jan 2018 09:59:19 -0500
X-Gmail-Original-Message-ID: <CADNbA1rif25QE6h07AWW4tH61qDgJEWFk3163eyebG=BQewd5g@mail.gmail.com>
Message-ID: <CADNbA1rif25QE6h07AWW4tH61qDgJEWFk3163eyebG=BQewd5g@mail.gmail.com>
To: Andrew Goodbody <andrew.goodbody@cambrionix.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 05/10] Remove deprecated ${PYTHON_PN}-importlib from the RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 14:59:21 -0000
Content-Type: text/plain; charset="UTF-8"

It is in the staging area for master-next (
http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stagging/master-next).
It should be merged into master once the next world build cycle completes.

On Fri, Jan 26, 2018 at 5:08 AM, Andrew Goodbody <
andrew.goodbody@cambrionix.com> wrote:

> Just wondering what is happening with this patch?
>
> I have a broken build until it is fixed.
>
> Thanks,
> Andrew
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Derek
> Straka
> Sent: 21 January 2018 16:21
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-python][PATCH 05/10] Remove deprecated
> ${PYTHON_PN}-importlib from the RDEPENDS
>
> The ${PYTHON_PN}-importlib package was removed as part of the migration to
> the json manifest file.  The functionality is now part of core
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb    | 2 +-
>  meta-python/recipes-devtools/python/python-astroid_1.6.0.bb   | 1 -
>  meta-python/recipes-devtools/python/python-behave_1.2.5.bb    | 2 +-
>  meta-python/recipes-devtools/python/python-can.inc            | 1 -
>  meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb | 1 -
>  meta-python/recipes-devtools/python/python-django.inc         | 1 -
>  meta-python/recipes-devtools/python/python-pandas_0.22.0.bb   | 1 -
>  meta-python/recipes-devtools/python/python-pyroute2.inc       | 1 -
>  meta-python/recipes-devtools/python/python-pyserial_3.4.bb    | 2 +-
>  9 files changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
> b/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
> index 9d2e165..7ddf4e5 100644
> --- a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
> +++ b/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
> @@ -26,7 +26,7 @@ BBCLASSEXTEND = "native"
>
>  EXTRA_OECONF = "--disable-cairo --with-python=${PYTHON}"
>
> -RDEPENDS_${PN} += "python-setuptools python-importlib"
> +RDEPENDS_${PN} += "python-setuptools"
>  RDEPENDS_${PN}_class-native = ""
>
>  do_install_append() {
> diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
> b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
> index 42208bc..fd98630 100644
> --- a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
> @@ -4,7 +4,6 @@ require python-astroid.inc  RDEPENDS_${PN}_class-target +=
> " \
>      ${PYTHON_PN}-enum34 \
>      ${PYTHON_PN}-backports-functools-lru-cache \
> -    ${PYTHON_PN}-importlib \
>      ${PYTHON_PN}-re \
>      ${PYTHON_PN}-singledispatch \
>  "
> diff --git a/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
> b/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
> index 541a79d..3db2016 100644
> --- a/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
> +++ b/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
> @@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> d950439e8ea6ed233e4288f5e1a49c06"
>  SRC_URI[md5sum] = "3af4bc2886d2be982e41bfaba61da3bc"
>  SRC_URI[sha256sum] = "81b731ac5187e31e4aad2594944fa9
> 14943683a9818320846d037c5ebd6d5d0b"
>
> -RDEPENDS_${PN} += "python-difflib python-setuptools python-pkgutil
> python-misc python-argparse python-xml python-importlib python-enum34
> python-parse python-parse-type python-six"
> +RDEPENDS_${PN} += "python-difflib python-setuptools python-pkgutil
> python-misc python-argparse python-xml python-enum34 python-parse
> python-parse-type python-six"
>
>  inherit pypi setuptools
> diff --git a/meta-python/recipes-devtools/python/python-can.inc
> b/meta-python/recipes-devtools/python/python-can.inc
> index 8cdd4d3..2b15af4 100644
> --- a/meta-python/recipes-devtools/python/python-can.inc
> +++ b/meta-python/recipes-devtools/python/python-can.inc
> @@ -10,7 +10,6 @@ PYPI_PACKAGE="python-can"
>
>  RDEPENDS_${PN}_class-target += "\
>      ${PYTHON_PN}-ctypes \
> -    ${PYTHON_PN}-importlib \
>      ${PYTHON_PN}-logging \
>      ${PYTHON_PN}-misc \
>      ${PYTHON_PN}-netserver \
> diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
> b/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
> index fb8c0aa..ec8c54a 100644
> --- a/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
> +++ b/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
> @@ -20,7 +20,6 @@ inherit pypi setuptools
>
>  RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-dbus \
> -    ${PYTHON_PN}-importlib \
>      ${PYTHON_PN}-pygobject \
>      ${PYTHON_PN}-xml \
>      "
> diff --git a/meta-python/recipes-devtools/python/python-django.inc
> b/meta-python/recipes-devtools/python/python-django.inc
> index 9287715..3602a74 100644
> --- a/meta-python/recipes-devtools/python/python-django.inc
> +++ b/meta-python/recipes-devtools/python/python-django.inc
> @@ -19,7 +19,6 @@ RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-datetime \
>      ${PYTHON_PN}-email \
>      ${PYTHON_PN}-html \
> -    ${PYTHON_PN}-importlib \
>      ${PYTHON_PN}-json \
>      ${PYTHON_PN}-multiprocessing \
>      ${PYTHON_PN}-netserver \
> diff --git a/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
> b/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
> index 355074c..b3bfab9 100644
> --- a/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
> +++ b/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
> @@ -4,5 +4,4 @@ require python-pandas.inc  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-future \
>      ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-importlib \
>  "
> diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc
> b/meta-python/recipes-devtools/python/python-pyroute2.inc
> index f63ccbd..24e3555 100644
> --- a/meta-python/recipes-devtools/python/python-pyroute2.inc
> +++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
> @@ -13,7 +13,6 @@ inherit pypi
>  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-ctypes \
>      ${PYTHON_PN}-distutils \
> -    ${PYTHON_PN}-importlib \
>      ${PYTHON_PN}-json \
>      ${PYTHON_PN}-logging \
>      ${PYTHON_PN}-multiprocessing \
> diff --git a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
> b/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
> index 0497087..fd852a2 100644
> --- a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
> +++ b/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
> @@ -1,4 +1,4 @@
>  inherit setuptools
>  require python-pyserial.inc
>
> -RDEPENDS_${PN} += "${PYTHON_PN}-argparse ${PYTHON_PN}-importlib"
> +RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

