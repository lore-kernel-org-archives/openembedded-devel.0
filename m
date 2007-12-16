Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1J40Tt-0003Ne-Fz
	for openembedded-devel@openembedded.org; Sun, 16 Dec 2007 21:53:01 +0100
Received: (qmail 5234 invoked by uid 813007); 16 Dec 2007 20:48:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 16 Dec 2007 20:48:16 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2007 21:48:13 +0100
User-Agent: KMail/1.9.7
References: <164348748.20071215043923@gmail.com>
In-Reply-To: <164348748.20071215043923@gmail.com>
MIME-Version: 1.0
Message-Id: <200712162148.14183.openembedded@haerwu.biz>
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Dec 2007 20:53:01 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia sobota, 15 grudnia 2007, Paul Sokolovsky napisa=B3:

>    ANGSTROM_MODE config variable has proven to be very useful and
> successful feature during the Angstrom evolution. IMHO, it is worth
> generalization of its meaning and naming to become a generic
> additional OE distro configuration parameter. So, I'd like to propose
> it to be renamed to SYSTYPE, with the description "Select particular
> system variant of a distribution which supports such feature, e.g.,
> underlying libc type."

Basically I like idea of unifing this. In Poky we have POKYLIBC for it.=20
But it should be in DISTRO_ namespace as this makes distro change.

>   Obviously, it wouldn't be limited to libc type, but intended to be a
> generic sub-parameter of a distro,=20

DISTRO_LIBC

> it could be debug/release type,=20

DISTRO_TYPE

> size type (minimal/standard/extended),=20

This is handled by distro overrides when it comes to configurations=20
(busybox, uclibc, kernel configs) and images content.

> whatever.=20

DISTRO_* can be added at any time as long as they have sense.

> The usage idea is to have standard name for such generic parameter, plus
> semantically it should be expected that a distro allows to build
> different SYSTYPE's side-by-side in the same build dir (like Angstrom
> does for libc variants).

> And nothing really precludes SYSTYPE to be not just "libc", but
> "libc,release", or "libc,release,wm=3Dxfce", or
> "libc,release,wm=3Dxfce,weird_user_config=3Dsome_file.conf".

This is *SICK* as this really should be set in local.conf. Imagine how to=20
handle something like this:

DISTRO=3Dumbaumba-18.7 MACHINE=3Dspitz SYSTYPE=3D"uclibc=20
uclibc_config=3Dtweaks/uclibc.config release,wm=3Dopenbox=20
openbox_config=3Dtweaks/openbox.onfig kernel=3Dtweaks/linux-rp-umbaumba=20
kernel_config=3Dtweaks/kernel/spitz.defconfig" bitbake=20
umbaumba-default-image

All what this command do is possible with auto/local.conf files.


+1 from me for DISTRO_LIBC and good thought other DISTRO_ vars
=2D2 for me for SYSTYPE variable
=2Doo for SYSTYPE usage like command above

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 We are the Knights who say: MOVE.L USP,A1




