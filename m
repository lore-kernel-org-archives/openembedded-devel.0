Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 30C89771CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 17:12:59 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id z193so6366234vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=EgcpjjWsbL+BIzKD2v/vtGi4QvPxkwEx2ug0P5/R51A=;
	b=PiMMby1Uwg1P74sEgLbj4cZORtT5sLWNref1PwKaku/rf5/jW8GEHqzN6sCPuU/TE0
	Ad1mfTBnmR8WmGHV2jan9WsTt1z6A/jvZi7mqHMsVCsd4SJ8wGAUHv9l8Z8ARPfI8wdf
	68FrNXAkU5Uph+L4e1kPiqFOXusRTMiSMOOr66/ZuLM6KfTugVwvjF/CIdUGixcIDrmo
	XLcFaMl2EVWDV0w53rTGV9jnzf8lhUXsCOXqCAe2am59D4oVRmlIE7/1tkufswEA67ya
	CF3tJTS1kKvwV7UYUm7lXDZiZWb678iSHVoRGacoYc6IhhIf8uy/X/pdaPVmgraOBytN
	SOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=EgcpjjWsbL+BIzKD2v/vtGi4QvPxkwEx2ug0P5/R51A=;
	b=hGrUU/kQ3oSMzK5kt8wN0EkGFQhzat07XR5oWmKbUtQXKuJER6sWccPwMwffGfhGim
	ZufTd7ZpMmZUk0XzpSa0mA2rjbRWA9BvWCw9Pb7GuerKjA/hONMGsQDSUkFrYT9cITNn
	gTJZdZGqpcV9fLCuCY5x1ib6qJUHJrUnXnT931iO+oNgMZMvikMfIxgGz3b8qaVMOSqH
	NselmZlqPzEc+GlSbdJtt/+7JoXyV24G8o0KHUy1IQ7qztC9pYhpoJjw+aPsfBFqtgmt
	uPrM3ENOsicfhuL/xaqv1UV5k2wecKhDNAuqDBeoFXFxVC9uutnrzPj+q3DO8pbRLPhP
	7cgw==
X-Gm-Message-State: AE9vXwNgv0cQAKNDusySXRf7GmWK0jALAhcxDZE2T3HAeno2oXgfkpgws7g529dBgH6NMb8y8NJP1FOgZeOLKQ==
X-Received: by 10.31.11.149 with SMTP id 143mr13615091vkl.132.1473700380249;
	Mon, 12 Sep 2016 10:13:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.120 with HTTP; Mon, 12 Sep 2016 10:12:59 -0700 (PDT)
Received: by 10.159.34.120 with HTTP; Mon, 12 Sep 2016 10:12:59 -0700 (PDT)
In-Reply-To: <20160912170647.14289-1-Martin.Jansa@gmail.com>
References: <20160912170647.14289-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Sep 2016 10:12:59 -0700
Message-ID: <CAMKF1sqY8tOj5y0kMNkVESWfZcddU3p9Lw2ZrxFOETGMC6rY8Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][meta-networking][PATCH] iscsitarget, netmap-moduls, vboxguestdrivers: Blacklist, not compatible with default kernel version 4.8
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
X-List-Received-Date: Mon, 12 Sep 2016 17:13:00 -0000
Content-Type: text/plain; charset=UTF-8

4.8 isnt released yet. So I would suggest to wait merging this until its
released

On Sep 12, 2016 10:07 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb        |
> 3 +++
>  meta-networking/recipes-kernel/netmap/netmap-modules_git.bb            |
> 3 +++
>  meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb     |
> 3 +++
>  3 files changed, 9 insertions(+)
>
> diff --git a/meta-networking/recipes-extended/iscsitarget/
> iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-
> extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
> index ba51c25..4b5622b 100644
> --- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> @@ -56,3 +56,6 @@ FILES_${PN} += "${sbindir} \
>
>  RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
>  RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
> +
> +# http://errors.yoctoproject.org/Errors/Details/83334/
> +PNBLACKLIST[iscsitarget] ?= "BROKEN: not compatible with default kernel
> version 4.8"
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index 6544bb5..e9eea56 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -87,3 +87,6 @@ do_install () {
>      cd ${S}/LINUX
>      oe_runmake install
>  }
> +
> +# http://errors.yoctoproject.org/Errors/Details/83335/
> +PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default
> kernel version 4.8"
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
> ers_5.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
> ers_5.1.4.bb
> index 66068d1..1d1b1d8 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
> @@ -63,3 +63,6 @@ FILES_${PN} = "${base_sbindir}"
>
>  # autoload if installed
>  KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
> +
> +# http://errors.yoctoproject.org/Errors/Details/83333/
> +PNBLACKLIST[vboxguestdrivers] ?= "BROKEN: not compatible with default
> kernel version 4.8"
> --
> 2.10.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

