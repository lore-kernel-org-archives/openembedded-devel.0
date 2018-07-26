Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DF4F77550F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 11:21:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o18-v6so1642786wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 04:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2XEXF/oTfJpvB1boJhtTI/kl29F2Ue4P6e7ycdGJM9A=;
	b=SQ4m8wCFU1IgjgyX4wf9ROfRWEF5JZ/F0VCjpvkUkYLHdeGhDF6KpO0FgFbBaVwHFE
	f2V0KdzhMEeO2dTFk/FkeS0CTwbRkpJX2Qnaq/LsUJqUcE4+Nu3Gc/Hzk0hsbCH2f4+I
	bp3ukPMPTamUfT0KLtUFPWJrnYMBuf/JV0tUvjNO1Zjqn9QyX7DX0A7xvf5Z6PkRbaB4
	PaS1+9dcaaiOCSCg2RZbNUq5nzjdGUpZJ/YjaNEVhINGzSLoFkzMHKuGObkBPneauJ5f
	alNEPVNQ+CDSvL4C+Tfh4QBsUoBhryOCp1MtAjjVdZET/qZ4UzH8u4T1VzUb0A5F07jr
	8Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2XEXF/oTfJpvB1boJhtTI/kl29F2Ue4P6e7ycdGJM9A=;
	b=DYivsd0FuhIeLKRngFgrg64vjYX6GcTGjDDNxvdzoWY0yNbtBe1IPorMrr/w6UJqsO
	yuq+LHnRoMODVxNEFrswAq0oSvBaI2uZqMz9De0CaNl31/wZtTQkVpeyvH31/2r5ng5x
	wQBCtG9rg2RV625vLj/euK1mCXdsp7xTJF0SlCLXI63ngr3Gyf1thjhMHQcfKaj8tv/C
	Krg3lycsiVnfhbIehncJFIF8HBDY3YGW+3daVQ8VMrIKobzHmpxp09o/7jOxdQy453nz
	LbESwI2kdativw+pw3cN399VDsDNNg+0nzX/DKIfAxulZwvz4U0hqeSgtHCyMGGdhqNN
	X7Kg==
X-Gm-Message-State: AOUpUlHcuU/7hZUQskm2J66cUZWnOLkDgeKoAWYXusKlkhlq3VVVb5B1
	pRi1oeO9Zr9UgOkbMJoNqAVuPyZIZUqWQDZaADE=
X-Google-Smtp-Source: AAOMgpek9eoXJVu3NcHcOZJLHmLEzlBiur7Adlb8zf+v4d39kHYdshxhY5JwkySVxDIyJApCFRTOdb4nOa265aeWuZo=
X-Received: by 2002:a1c:9807:: with SMTP id a7-v6mr1237407wme.32.1532604079562;
	Thu, 26 Jul 2018 04:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180601045815.15819-1-raj.khem@gmail.com>
	<20180601045815.15819-3-raj.khem@gmail.com>
In-Reply-To: <20180601045815.15819-3-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Jul 2018 13:21:10 +0200
Message-ID: <CA+chaQe10kmj=fpbQ58brd1G8UfOjPB9dW8XKs1e+gYqOWCM9A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] openocd: Upgrade to latest tip of master
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
X-List-Received-Date: Thu, 26 Jul 2018 11:21:19 -0000
Content-Type: text/plain; charset="UTF-8"

It probably isn't caused by this upgrade, but openocd is using git
submodules which are checked out during do_configure:

http://repo.or.cz/openocd.git/blob/refs/heads/master:/bootstrap#l37

Would it make sense to call bootstrap with nosubmodule?

It seems to be used by internal_jimtcl
http://repo.or.cz/openocd.git/blob/refs/heads/master:/configure.ac#l574
and internal_libjaylink
http://repo.or.cz/openocd.git/blob/refs/heads/master:/configure.ac#l679

I don't use openocd, I've just noticed random build failure:

Makefile.am:23: installing './texinfo.tex'
Setting up submodules
Submodule 'jimtcl' (http://repo.or.cz/r/jimtcl.git) registered for path
'jimtcl'
Submodule 'src/jtag/drivers/libjaylink' (http://repo.or.cz/r/libjaylink.git)
registered for path 'src/jtag/drivers/libjaylink'
Submodule 'tools/git2cl' (http://repo.or.cz/r/git2cl.git) registered for
path 'tools/git2cl'
Cloning into 'jimtcl'...
fatal: unable to access 'http://repo.or.cz/r/jimtcl.git/': Could not
resolve host: repo.or.cz
Clone of 'http://repo.or.cz/r/jimtcl.git' into submodule path 'jimtcl'
failed
WARNING: exit code 1 from a shell command.

On Fri, Jun 1, 2018 at 6:58 AM Khem Raj <raj.khem@gmail.com> wrote:

> Fix build with new libusb and gcc8
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...2-deprecated-libusb_set_debug-with-l.patch | 39 +++++++++++++++++++
>  .../recipes-devtools/openocd/openocd_git.bb   |  5 ++-
>  2 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
>
> diff --git
> a/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
> b/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
> new file mode 100644
> index 0000000000..c5b9083dca
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
> @@ -0,0 +1,39 @@
> +From b95a996bfb281104b68ec66f32ebb79db519a4a8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 31 May 2018 21:06:46 -0700
> +Subject: [PATCH] Fix libusb-1.0.22 deprecated libusb_set_debug with
> + libusb_set_option
> +
> +libusb_set_debug is deprecated in libusb >= 1.0.22 therefore replace
> +with equivalent libusb_set_option()  API
> +
> +see libusb commit for more details
> +
> +
> https://github.com/libusb/libusb/commit/539f22e2fd916558d11ab9a66f10f461c5593168
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Submitted [http://openocd.zylin.com/#/c/4540/]
> + src/jtag/drivers/xds110.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/jtag/drivers/xds110.c b/src/jtag/drivers/xds110.c
> +index 90b699027..9bfe02ea8 100644
> +--- a/src/jtag/drivers/xds110.c
> ++++ b/src/jtag/drivers/xds110.c
> +@@ -367,8 +367,11 @@ static bool usb_connect(void)
> +
> +               /* Set libusb to auto detach kernel and disable debug
> messages */
> +               (void)libusb_set_auto_detach_kernel_driver(dev, 1);
> ++#if LIBUSB_API_VERSION >= 0x01000106
> ++              libusb_set_option(ctx, LIBUSB_OPTION_LOG_LEVEL,
> LIBUSB_LOG_LEVEL_NONE);
> ++#else
> +               libusb_set_debug(ctx, LIBUSB_LOG_LEVEL_NONE);
> +-
> ++#endif
> +               /* Claim the debug interface on the XDS110 */
> +               result = libusb_claim_interface(dev, INTERFACE_DEBUG);
> +       } else {
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> index 67abeede93..84727bf970 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -5,8 +5,9 @@ DEPENDS = "libusb-compat libftdi"
>  RDEPENDS_${PN} = "libusb1"
>
>  SRC_URI = "git://repo.or.cz/openocd.git \
> -"
> -SRCREV = "3737dd69e73816d186ba418d7b833462a8041079"
> +
>  file://0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch \
> +          "
> +SRCREV = "cdf1e826eb23c29de1019ce64125f644f01b0afe"
>
>  PV = "0.10+gitr${SRCPV}"
>  S = "${WORKDIR}/git"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

