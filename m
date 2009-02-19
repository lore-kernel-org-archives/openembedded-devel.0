Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1La6fZ-0006Uh-1T
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Feb 2009 12:02:17 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 6CEBC16DEFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 12:13:01 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id BA4DE2A4238
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 12:00:00 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 19 Feb 2009 12:00:27 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF689@hiob.intern.dresearch.de>
In-Reply-To: <gnjcun$429$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [RFC] removing DISTRO_* vars from task-boot
Thread-Index: AcmSf0q/H4KqwnLjTW6Lf5V9uUhHTwAASs3Q
References: <20090218192246.GM11815@smtp.west.cox.net>
	<gnjcun$429$1@ger.gmane.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC] removing DISTRO_* vars from task-boot
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
X-List-Received-Date: Thu, 19 Feb 2009 11:02:17 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> >>>> Lately I have been wondering how to change the /dev=20
> manager on a per
> >>>> image base, since I want udev for most images and=20
> busybox-mdev for
> >>>> special-purpose stuff. The catch is that I want to keep=20
> using task-boot
> >>>> for both.
> >>>>
> >>>> Currently we have:
> >>>>
> >>>> DISTRO_DEV_MANAGER ?=3D=20
> "${@base_contains("MACHINE_FEATURES", "kernel26",
> >>>> "udev","",d)}"
> >>>> DISTRO_INIT_MANAGER ?=3D "sysvinit sysvinit-pidof"
> >>>> DISTRO_INITSCRIPTS ?=3D "initscripts"
> >>>> DISTRO_LOGIN_MANAGER ?=3D "tinylogin"
> >>>>
> >>>> in task-boot.bb
> >>>>
> >>>> There are various ways we could attack this:
> >>>>
> >>>> 1) The image.bbclass way:
> >>>>
> >>>>     Put the following in image.bbclass:
> >>>>
> >>>>     IMAGE_DEV_MANAGER ?=3D=20
> "${@base_contains("MACHINE_FEATURES", "kernel26",
> >>>> "udev","",d)}"
> >>>>     IMAGE_INIT_MANAGER ?=3D "sysvinit sysvinit-pidof"
> >>>>     IMAGE_INITSCRIPTS ?=3D "initscripts"
> >>>>     IMAGE_LOGIN_MANAGER ?=3D "tinylogin"
> >>>>
> >>>>     Pros:
> >>>>     * Takes immediate effect
> >>>>     * Can have distro defaults, overridable per image
> >>>>
> >>>>     Cons:
> >>>>     * marks them as 'user installed'
> >>>>     * you can't 'debootstrap' from tasks anymore, you=20
> need to encode
> >>>> knowledge about the above vars into the debootstrap script
> >>> I really like this one as for our uses there's times=20
> where I'd rather
> >>> let busybox handle INIT_MANAGER and LOGIN_MANAGER too.
> >> Philip C. agrees with you. Should be move everything over=20
> or start with
> >> IMAGE_DEV_MANAGER?
> >
> > I say do it all now.  Flexibility is good, lets get it done.
>=20
> The patch should appear on this ml right about now.

This is a good (or bad?) example for the wish a uttered some days =
before. In the official OE manual there is nothing to read about =
DISTRO_* and/or IMAGE_* vars.

It would be really helpful for other developers which are not that =
familiar with all the variable stuff and do not memorize the complete =
mailing list if you could start to document such things in the wiki.

Thx,
Steffen


