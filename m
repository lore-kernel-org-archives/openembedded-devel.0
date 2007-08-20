Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IN7Yq-0004qs-Eg
	for openembedded-devel@openembedded.org; Mon, 20 Aug 2007 15:44:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7KDhkEO028001
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Aug 2007 14:43:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27704-06 for <openembedded-devel@openembedded.org>;
	Mon, 20 Aug 2007 14:43:42 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7KDheXx027995
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Aug 2007 14:43:40 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200708201332.29985.openembedded@hrw.one.pl>
References: <E1IIPXa-0005bT-C3@linuxtogo.org>
	<1186499800.5653.62.camel@localhost.localdomain>
	<200708201332.29985.openembedded@hrw.one.pl>
Date: Mon, 20 Aug 2007 14:43:39 +0100
Message-Id: <1187617419.5744.13.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	l7KDhkEO028001
Subject: Re: [oe-commits] org.oe.dev linux 2.6.22: Alix boards use	bzImage	kernels
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
X-List-Received-Date: Mon, 20 Aug 2007 13:44:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2007-08-20 at 13:32 +0200, Marcin Juszkiewicz wrote:
> Dnia wtorek, 7 sierpnia 2007, Richard Purdie napisa=C5=82:
> > On Tue, 2007-08-07 at 15:56 +0200, hrw commit wrote:
> > > packages/linux/linux.inc	86d436757b3b9cb61a1a381d76950ef21596b40c
> > > +++ packages/linux/linux.inc	a948d889b8d420c7a04eb140caaa353601fa77=
22
> > > @@ -11,6 +11,7 @@ inherit kernel
> > >
> > >  inherit kernel
> > >
> > > +KERNEL_IMAGETYPE_alix =3D "bzImage"
> > >  KERNEL_IMAGETYPE_progear =3D "bzImage"
> > >  KERNEL_IMAGETYPE_simpad =3D "zImage"
> > >  KERNEL_IMAGETYPE_kb9202 =3D "uImage"
> >
> > Should these not really go into the machine.conf files?
>=20
> Right - I looked at it and prepared patch. It removes=20
> KERNEL_IMAGETYPE =3D "zImage" entries from kernel recipes and also sets
> this variable into bzImage for x86 machines which already use that type
> of kernels. Rest of machines are untouched (yet) - I can convert them i=
f
> we reach consensus about it.

Looks like a good start to me :)

Cheers,

Richard



