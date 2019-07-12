Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 92D7E7F0E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 16:38:10 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id h21so8671415qtn.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v72RLFktEsg5i9danIrZUJvyvCzIBJu4gyKitNNtXw4=;
	b=I+8uhJCNEsQ2lV3vT/F4DhPQKmA4gRa1w5B8/X0EKT/QKsiX86tX4KIL6OTDE2+RSl
	lzwzhAypatQuFs2Jb+niQ0Dz1DTIyfqddi2zaShDzXp8sUX1i/dpmOf9QKJxQ2+dL5Ze
	SCiT+cKQGuFMVaxQibe9qnhK+UDRrxxTaKSir/kn/mZ7Wna5hzqMHunxorn+MTQS+kN/
	cptI1eEXIV8XkVVF/HO2V+sVgwI3LqJoAVWyKLVscegimDRtXvCz2sWF6c1z8hsCGexx
	61Ilc1PTqeucMlsMWF4Li51ctcZSLeUd8ynVIW99rPWCcX4sAqnJ/1sYLj9V1z7RIXQC
	9q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v72RLFktEsg5i9danIrZUJvyvCzIBJu4gyKitNNtXw4=;
	b=LdpSKAEGWVlprdZLobbmqMQKl+NmV0YjTlZm1YFFUnQi3YdHzFBKNbQM8fOQTMuhJ7
	ZZveRuZbpnQWgSKWEwbmUFRTkbNGKzO6r7N5VC9d8tnW0Upzi5/k9lKNqSA3tPEF+v8A
	v69YTKceookwSWSNh32wDuyHi0wel2nWvtkv9oM0cszQSpDfPM7tuahTYoIxoOIhrg85
	bu0CkYIZo4Junnz6y/Bodi6/c/HXf6g243xZvV8HbYb3Q4Uc2LJP6z3FroaX3iFLPGfm
	wuLMLrjXuoAAbEeNd2oAzjq7oXC625cdEah3+WI6G4d1wFcf98vOzRDVkGeqQFQxyhQI
	rOww==
X-Gm-Message-State: APjAAAVUgyK+haRZehoB+kOhJRmcX4QxcnHXuQO7Mlv2pKfIEF9mz9Qx
	tSVyWmSZcgtBTFfMvKgoEZ+EycCbcAPhGbZ0sMA=
X-Google-Smtp-Source: APXvYqyy7ORAvHDWgQU7SIxS0hwqA8jy3dvc3pmeGTXR4FZDzL0AU8VVvwWBdhqIGCFSXJY8uVhlfO9j2iwDdPPLLaE=
X-Received: by 2002:aed:3644:: with SMTP id e62mr6999098qtb.80.1562949491296; 
	Fri, 12 Jul 2019 09:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190625205516.16072-1-open.source@oleksandr-kravchuk.com>
	<D55698ECEC159B488D62A508E18D7FEC124BEEAB@ATNETS9912WMSX.ww300.siemens.net>
	<CAMKF1sruh5+Uy1f8useibqbossecsftyG7Bk-Gf4B2SOCnJJqw@mail.gmail.com>
	<66a42934-83cb-56ef-72c2-71b3377a6c38@siemens.com>
In-Reply-To: <66a42934-83cb-56ef-72c2-71b3377a6c38@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jul 2019 09:37:45 -0700
Message-ID: <CAMKF1spFA8atd93-bUGvfE1Px6eQvcxea5ixxBy1EZVekTF_ig@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Fri, 12 Jul 2019 16:38:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 12, 2019 at 1:03 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Hi Khem!
>
> We have identified the problem. There was missing inheriting pkgconfig.
> Fix is here
> http://lists.openembedded.org/pipermail/openembedded-devel/2019-July/200609.html
> .
>

thanks for taking care of this quickly.

> Regards,
> Andrej
>
> On 7/12/19 8:13 AM, Khem Raj wrote:
> > Hi Oleksandr
> >
> > It fails to build on mips see
> > https://errors.yoctoproject.org/Errors/Details/251424/
> >
> > I wonder if udev has something to do here
> >
> > On Tue, Jun 25, 2019 at 11:30 PM Valek, Andrej <andrej.valek@siemens.com> wrote:
> >>
> >> Hi Oleksandr!
> >>
> >> You have removed udev from default configuration. Because if udev is not in PACKAGECONFIG anymore, '--without-udev' will be passed as parameter in configure step.
> >>
> >> There are multiple options how to do that.
> >> 1. put 'udev' into DEPENDS, RDEPENDS and put '--with-udev' into EXTRA_OECONF
> >>  - missing option to disable it
> >> 2. keep 'udev' in PACKAGECONFIG
> >>  - will be enabled automatically while is not explicitly overridden by another PACKAGECONFIG
> >>
> >> I prefer an option 2. . Udev will be enabled by default with option to disable it.
> >>
> >> Regards,
> >> Andrej
> >>
> >> -----Original Message-----
> >> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel-bounces@lists.openembedded.org> On Behalf Of Oleksandr Kravchuk
> >> Sent: Tuesday, June 25, 2019 10:55 PM
> >> To: openembedded-devel@lists.openembedded.org
> >> Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> Subject: [oe] [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
> >>
> >> udev is now enabled by default and is always requested.
> >>
> >> License checksum changed due to modified copyright year.
> >>
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>  .../dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb}        | 10 ++++------
> >>  1 file changed, 4 insertions(+), 6 deletions(-)  rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb} (70%)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
> >> similarity index 70%
> >> rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
> >> rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
> >> index 84c3db7a5..e2759f47a 100644
> >> --- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
> >> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
> >> @@ -5,18 +5,16 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer  HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
> >>
> >>  LICENSE = "BSD-2-Clause"
> >> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1e8f17e4edcccc38152ccf60374e0f89"
> >> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
> >>
> >>  SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
> >> -
> >> -SRC_URI[md5sum] = "77bbb1d73b6f30d6ddcc8b0fd3eae266"
> >> -SRC_URI[sha256sum] = "96968e883369ab4afd11eba9dfd9bb109f5dfff65b2814ce6c432f36362dc9b5"
> >> -
> >>  SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
> >> +SRC_URI[md5sum] = "2f17034432ea10415ee84a97ef131128"
> >> +SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e"
> >>
> >>  inherit autotools-brokensep
> >>
> >> -PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> >> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> >>
> >>  PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
> >>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

