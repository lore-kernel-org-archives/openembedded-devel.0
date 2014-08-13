Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7325362252
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 05:48:13 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id hr17so8812802lab.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 22:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Bt+yX38Y1LXkIOiApKdcBSxR+aVB9X8HksaOebrDJhw=;
	b=jvMOo/xl8uDMLxDtdm3j0vTVuFeml1cSoOdaC1khzb9aNM9JuLDLXWfLoF5pO9AAlg
	283bBANF2o6+oXAly+8dgktsC2pdHL04n6h5Af8zzBy+TNCnT+2xZLM0/okWwWGmo2g+
	c9Vw8pRdATROXybfueRiGti4Ehutx//ssoSY2H6aseifIqkvb6X90yMMW+OOTjSJlhRB
	w9OKwfq6wB7f0V98v8Fm7yRq3EWocq7sdYeb1jxMCvCu1GnZ0DNe5zC4j4BGbaCu8awB
	4o7bUJBqpxOsNwOT/GPwPvh5D+K/B4GZa4AAMJEGRBS6YAm/gUt9fu7zg7rGuktajY0x
	wERw==
MIME-Version: 1.0
X-Received: by 10.112.167.170 with SMTP id zp10mr2175306lbb.2.1407908893484;
	Tue, 12 Aug 2014 22:48:13 -0700 (PDT)
Received: by 10.114.161.116 with HTTP; Tue, 12 Aug 2014 22:48:13 -0700 (PDT)
In-Reply-To: <1407852110-26705-1-git-send-email-sujith.h@gmail.com>
References: <1407852110-26705-1-git-send-email-sujith.h@gmail.com>
Date: Tue, 12 Aug 2014 22:48:13 -0700
Message-ID: <CANx9H-BU8vM-EAOPZgfmbSZtxze9t=fiywO4n=BtLb+oqut_wQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-python][PATCH] pyparted: Add recipe
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
X-List-Received-Date: Wed, 13 Aug 2014 05:48:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 12, 2014 at 7:01 AM, Sujith H <sujith.h@gmail.com> wrote:

> From: Sujith H <Sujith_Haridasan@mentor.com>
>
> This recipe will provide a set of Python modules that
> provide Python programmers an interface to libparted,
> the GNU parted library for disk partitioning and filesystem
> manipulation.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>  meta-python/recipes-extended/pyparted/pyparted_3.9.bb | 19
> +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-extended/pyparted/pyparted_3.9.bb
>

You should be following Debian naming policy (see
http://www.debian.org/doc/packaging-manuals/python-policy/ch-module_packages.html
section 3.3), which means the name should be python-pyparted_3.9.bb ... the
ONLY recipe that breaks this naming scheme in oe-core or meta-oe is
pyrtm...and that is only because of legacy. I came >< this close to
changing it during the layer creation.

>
> diff --git a/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> new file mode 100644
> index 0000000..79ebe02
> --- /dev/null
> +++ b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "pyparted is a set of Python modules that provide Python
> programmers \
> +an interface to libparted, the GNU parted library for disk partitioning
> and \
> +filesystem manipulation."
> +SUMMARY = "Python bindings for libparted"
> +HOMEPAGE = "https://fedorahosted.org/pyparted/"
> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> +
>  file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571a9f08ea46
> \
> +"
> +DEPENDS += "parted"
>
During testing on qemuarm with core-image-sato, import fails for "string" ,
"locale", "math"... You need:
RDEPENDS_${PN} += " python-stringold python-codecs python-math"

I stopped testing at that point and went to bed :)


> +
> +SRC_URI = "
> https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
> +SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
> +SRC_URI[sha256sum] =
> "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
> +
> +inherit distutils
> +
> +BBCLASSEXTEND += "native"
> --
> 1.8.4
>


Regards,

--Tim

>
>

