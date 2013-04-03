Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNS8U-0002Zf-By
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 20:10:14 +0200
Received: by mail-pb0-f49.google.com with SMTP id um15so970425pbc.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=nvdD368US0yOBmWrIZjHxDvAAGWFvVyiD1jN4qGPhQo=;
	b=MRbn2vOaGoNu/oSjltDPu89ccyWCl7nT8QLCsp7FhINZYPO/HnsbYWpLTzdtdbiQV2
	aF5rLfBXEopcjVtEKud+erqjSrz7VvpUToZBhX2krS+A6b+hiO42cOYxirt2ai/ya3M+
	BU1942mpvbWkdUryNx3LK9BJ6MM5brZVjvfOU3P8HCoUshYAHMxNQU/+bpsnxkvYy7aO
	72dZxvT0emRjqR28lZuJASdu3hqwFTa9U9lZ3eYsm4SFNWGd+nhaT6UnBTEjcepc7X5C
	wZVCcnozNhPNbi37mf8oeLPyhR5r4dlpAw134ZLjRPn+mhH30iNeytL5ozc9VOLffLm5
	Z+Kw==
X-Received: by 10.68.143.167 with SMTP id sf7mr4009986pbb.21.1365011582054;
	Wed, 03 Apr 2013 10:53:02 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id qd8sm6802171pbc.29.2013.04.03.10.53.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 10:53:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <515C5DE6.6040702@pseudoterminal.org>
Date: Wed, 3 Apr 2013 10:52:59 -0700
Message-Id: <35A30735-BA00-4711-8C20-453733BB9353@gmail.com>
References: <515C5DE6.6040702@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: New meta-cubox layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 18:10:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 3, 2013, at 9:50 AM, Carlos Rafael Giani <dv@pseudoterminal.org> =
wrote:

> Hello,
>=20
> I have created a BSP layer for the SolidRun Cubox platform. =
Informations about this device can be found athttp://solid-run.com/cubox =
 .
> The layer itself is hosted athttps://github.com/dv1/meta-cubox  .
>=20
> This layer introduces a new machine, new tunes for the CuBox' Marvell =
PJ4 processor, in addition to the platform specific recipes for hardware =
video acceleration and EGL,OpenGL ES,OpenVG support. Both hardfp and =
softfp are supported.
> The 3D accelerator and the hardware accelerated video engine (called =
vMeta) require some closed source components. The recipes pick the right =
ones depending on whether softpfp or hardfp is used.
>=20
> It also copies the generated uImage into the rootfs (as expected by =
the bootloader), and autogenerates a boot.scr out of an included boot =
script using uboot-mkimage.
> The resulting tarball is extracted on an SD card, and the device can =
be booted.
>=20
> A new xorg driver and a customized xorg.conf are included.
>=20
> I'm open to feedback, patches, suggestions.


Carlos

Thanks for doing this. Please add this to layer index here =
http://layers.openembedded.org/layerindex/

>=20
> Thanks
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



