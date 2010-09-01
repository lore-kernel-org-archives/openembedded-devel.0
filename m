Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OqoYD-0005SV-14
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 16:45:11 +0200
Received: by wwe15 with SMTP id 15so1366385wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=2pKEBNU3zuFqm40fDnHJRSvGTRCi+WloX2jeiMywL7s=;
	b=B8nEuNvnijO51sbcfGbkwe1u4Bfpqwmj63UQD2Su0SJ5nPKutsQG4QmPiaV3Hkcu6J
	w3g/zhCNP4utMPo28P1mXt1UPs6H8r4qCu4Oo7yJBBMgLUbD1Zv6VhwfWvzj6kFKM/dw
	gyoBn9jENNf89bq62tXaoOkfEQZLJBCyc+82M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=gCgncFZvwg5/Zxel0cJJlJZWbJUPzJmJmBm8M7sQyVmu1ny88VWBVIGcxlREk3oNdL
	pVkH8ZiJXqaJ3fbJHEdxY+iWWhy1jwqjlngE+UwxdjhXLEj3A3J395j8e9nheROwFERG
	wYRKth7PVxrUu74dpcpDL3q0Ml7+s1ji6Y7sw=
Received: by 10.216.162.78 with SMTP id x56mr7916649wek.80.1283352238532; Wed,
	01 Sep 2010 07:43:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Wed, 1 Sep 2010 07:43:38 -0700 (PDT)
In-Reply-To: <10034543.559431283349469680.JavaMail.defaultUser@defaultHost>
References: <10034543.559431283349469680.JavaMail.defaultUser@defaultHost>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Sep 2010 07:43:38 -0700
X-Google-Sender-Auth: qU1--J2LtdI0dOVURBctvl55YN8
Message-ID: <AANLkTi=U33a2xMK4SWWmF8c6hPi18vnedSaoTARuMwPn@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: opkg vs dpkg/rpm
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
X-List-Received-Date: Wed, 01 Sep 2010 14:45:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In addition to package writing, there's the IMAGE_PKGTYPE varaible which
controls which of the rootfs_<pkgtype> bbclasses is used to construct the
root filesystem.  You can inherit multiple packaging formats, resulting in
multiple formats being emitted, but one has to be selected specifically for
the filesystem.  If you only inherit one packaging class (i.e. package_ipk)
it will automatically set the image packaging type to match.  So, to switch=
:

1) INHERIT +=3D "package_rpm"
2) IMAGE_PKGTYPE =3D "rpm"

On Wed, Sep 1, 2010 at 6:57 AM, l.bolognini@tiscali.it <
l.bolognini@tiscali.it> wrote:

> Hi all,
> I'm working on a beagleboard.
> I'm wondering if there is a
> quick
> way to change package manager from opkg to dpkg or to rpm, both
> on the
> host and on the target.
> I think that including dpkg package in,
> for
> example, arago-console-image is not enough because all packages
> are
> built with ipkg/opkg.
> Moreover the directory /usr/lib/opkg/info
> with
> all postinst/prerm scripts could not be used anymore.
>
> I report a
> small
> extract from openembedded manual:
> "The package_write task is
>
> responsible for taking each packages subdirectory and creating any
>
> actual
> installation package, such as .ipk, .deb or .rpm. Currently .
> ipk
> is the only fully supported packing
> format although .deb packages
> are
> being actively worked on."
>
> Has anyone tried a .deb or .rpm based
>
> rootfs (built with oe/bitbake) on beagleboard or in another target?
>
>
>
> Thanks for your attention,
> best regards,
> Luca
>
>
> Risparmia con Tutto Incluso Light: telefono + adsl 8 mega a soli 19,95 =
=E2=82=AC al
> mese per un anno!  SCONTO DI 120 EURO!
> http://abbonati.tiscali.it/telefono-adsl/prodotti/tc/tuttoincluso_light/?=
WT.mc_id=3D01fw
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

