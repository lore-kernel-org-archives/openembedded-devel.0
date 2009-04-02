Received: from [209.85.198.244] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LpGok-00019M-6F
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 08:54:28 +0200
Received: by rv-out-0506.google.com with SMTP id l33so2548316rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2009 23:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=goneqjeWCDeTnRR9T2KquNuoKbdYqPOs3hkMdF1AYOY=;
	b=MMG3NhZD25ptYXIqpZ9jBBS/Br+MLS4iC2GdR9l9YZqN+c+sVAOsDBIIuArKVgVafM
	zqd20yXhs5U/CrB+fax64WieUINPaHGNfko6WWZu+VjjHATj8a4gGnlMprW8NaVytOHn
	O8CSx32jJkU0d3hM8XrZNVFzT0Xj/Lo6bpIoo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=v0LfmIcgJhl9vAMSDBGtvTHcv+YdstZLDpsXNG6HXqe/+4lfvhvYZpbUeeM9Pm0+Qm
	20roCDj6YfLGjVNv2mgzf52vEaJzvc6Ymxc9TM7XsBt3fES+4MlPh7sMGfdOFAjHTg5i
	HT1KcX+Mb1IQEgXudckDk5jR1EuTrjZDgs1lo=
Received: by 10.114.180.1 with SMTP id c1mr5714026waf.206.1238655122262;
	Wed, 01 Apr 2009 23:52:02 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-4-184.dsl.pltn13.sbcglobal.net
	[71.146.4.184])
	by mx.google.com with ESMTPS id g25sm821315wag.8.2009.04.01.23.52.01
	(version=SSLv3 cipher=RC4-MD5); Wed, 01 Apr 2009 23:52:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 1 Apr 2009 23:51:59 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <SNT105-W5667C19202F0CB199F6AF6908A0@phx.gbl>
	<49D394A5.2060805@gmx.net> <200904012230.12120.joerg@hakker.de>
In-Reply-To: <200904012230.12120.joerg@hakker.de>
MIME-Version: 1.0
Message-Id: <200904012351.59855.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.198.244
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Does your own system matter
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
X-List-Received-Date: Thu, 02 Apr 2009 06:54:28 -0000
X-Groupsio-MsgNum: 8962
Content-Type: multipart/signed; boundary="nextPart1659771.M5c6c0qunT";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1659771.M5c6c0qunT
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 01 April 2009 13:30:11 J=F6rg Bakker wrote:
> Here's another one using Ubuntu 8.10. Currently building basic bootstrap=
=20
> images with and w/o X, distro is angstrom, branch is org.openembedded.dev=
, all =20
> glibc. The stable branches bumped out very early (think it was the shasum=
=20
> package), so I stayed with org.openembedded.dev.
>=20
> So far, two patches were needed (gcc-cross-kernel and kernel).

using newer distributions to compile old compilers will often cause trouble=
 because
new distributions have recent gcc versions. e.g. if you compile gcc 3.4 wit=
h gcc 4.x you will end up
in some compilation issues. It is generally preferred that you use gcc 3.4 =
or less to compile gcc 3.4

> I also had one=20
> issue with intltool:
>=20
> | checking for XML::Parser... configure: error: XML::Parser perl module i=
s=20
> required for intltool
> | FATAL: oe_runconf failed
> NOTE: Task failed: /home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-
> angstrom-linux/intltool-0.40.3-r2/temp/log.do_configure.21467
> NOTE: package intltool-0.40.3-r2: task do_configure: failed
>=20
> and fixed this by running:
> bitbake libxml-parser-perl-native

I think you should add DEPENDS for libxml-parser-perl in intltool recipe an=
d retry. Depending on native package may
not be required.

>=20
> Hope that gets you further down the road ...
> Joerg
>=20
> Am Mittwoch 01 April 2009 18:21:57 schrieb Robert Schuster:
> > Hi,
> >
> > Mauri Sandberg schrieb:
> > > ----------------------------------------
> > >
> > >> Date: Wed, 1 Apr 2009 15:10:41 +0200
> > >> From: theBohemian@gmx.net
> > >>
> > >> I am using Ubuntu 8.10 (x86) and Debian squeeze (amd64) for OE
> > >> development. Works like a charm.
> > >
> > > That sounds reassuring. Are you building uclibc at all? Also,
> > > does it matter what versions of gcc and g++ packages you have
> > > installed locally? I am using what ever is the latests, 4.x.
> >
> > I've not build uclibc for some time. Will try again to build a current
> > image for a AVR32-based NGW when I at that machine.
> >
> > Regards
> > Robert
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20

=2D-=20
Khem Raj

--nextPart1659771.M5c6c0qunT
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknUYI8ACgkQHnJKy6V6em6okACaA5JfvfOcYKPiZSRoWItd3dEa
5w8AmgLa2JfR+hUHq2HkGezkjEZieeKC
=VHHJ
-----END PGP SIGNATURE-----

--nextPart1659771.M5c6c0qunT--
