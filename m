Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1NUfXt-0002qg-Rg
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 13:08:28 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id D552C140C1; Tue, 12 Jan 2010 13:06:16 +0100 (CET)
Date: Tue, 12 Jan 2010 13:06:16 +0100
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100112120616.GA19826@zlo.nu>
References: <4AF1A5E2.3020002@dresearch.de>
	<alpine.LFD.2.00.0911050322460.17459@localhost>
	<4AF29AFC.8030804@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4AF29AFC.8030804@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qemu again :(
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
X-List-Received-Date: Tue, 12 Jan 2010 12:08:29 -0000
X-Groupsio-MsgNum: 15591
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2009 at 10:29:32AM +0100, Steffen Sledz wrote:
> >> Yesterday i tried to use OE at my new notebook for the first time. But
> >> i hit a qemu problem again:
> >> ...
> >> | mmap: Permission denied
> >>
> >> All solutions for this problem i found see the cause in a wrong
> >> setting of mmap_min_addr (see e.g.
> >> <http://www.bugcommunity.com/wiki/index.php/Kernel_and_Rootfs_Build_Sy=
stem#Potential_Problems_.26_Their_Solutions:>).
> >>
> >> But this setting is correct at my notebook:
> >>
> >> # cat /proc/sys/vm/mmap_min_addr
> >> 0
>=20
> > ...
> > and if you read carefully, you'll notice that even if that value is
> > correctly set to zero, you might still get an SELinux violation.  it's
> > just a suggestion.
>=20
> Thanx for the hint, but there's no SELinux (and no Apparmor) running.

I have the same problem on Ubuntu 9.10 (karmic).
When I pass -r 2.6.18 or lower to qemu though, the qemu hangs itself and
will never finish. With -r 2.6.19 and up, it gives me the "mmap: No such
device or address" message.

Did you find a solution in the mean time ?

Marc

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktMZbgACgkQezjnobFOgrGlogCgoNxotN2nykSrz3K7l/G8UCi6
+rEAoMKvsCtVdL1i9tRV0JxBn1DTk8/x
=wITY
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
