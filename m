Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NZnlp-00058b-O5
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 16:56:04 +0100
Received: (qmail 20385 invoked by uid 813007); 26 Jan 2010 15:53:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 26 Jan 2010 15:53:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jan 2010 16:53:37 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc5-00011-gf6760aa; KDE/4.3.4; x86_64; ;
	)
References: <1263938187-20935-1-git-send-email-clarson@mvista.com>
In-Reply-To: <1263938187-20935-1-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
Message-Id: <201001261653.38397.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] image, rootfs_ipk: implement IMAGE_FEATURES
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
X-List-Received-Date: Tue, 26 Jan 2010 15:56:05 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 19 stycznia 2010 o 22:56:27 Chris Larson napisa=C5=82(a):
> This adds the ability to include groups of packages in an image.  It is
> similar in concept to the IMAGE_FEATURES used in Poky, but here we use
> IMAGE_FEATURE_<feature> and IMAGE_FEATURE_<feature>_OPTIONAL, rather than
> base_contains calls.
>=20
> Initially defined groups:
> base - the packages requested via IMAGE_INSTALL & IMAGE_VARS
> dbg - debug packages
> dev - development packages
> doc - documentation packages (of limited use at the moment due to
>  task.bbclass) vmlinux - kernel debugging packages (just kernel-vmlinux at
>  the moment)
>=20
> To add one of these to an image, you can either append to IMAGE_FEATURES =
or
>  override IMAGE_FEATURES.
>=20
> Examples:
> IMAGE_FEATURES_append =3D " dbg"
>=20
> IMAGE_FEATURES =3D "base dbg vmlinux"
>=20
> To add a new package group:
> IMAGE_FEATURE_myfeature =3D "gstreamer python pulseaudio"

I like idea of that. Few days ago one developer asked me how to prepare roo=
tfs=20
with all debug symbols so he could use gdb-cross/gdbserver combo to debug=20
something on device. With this code I can just generate normal + debug root=
fs=20
in one go (bitbake bug-image-production bug-image-production-debug).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




