Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LaRr6-0006mU-SI
	for openembedded-devel@openembedded.org; Fri, 20 Feb 2009 10:39:37 +0100
Received: (qmail 31160 invoked by uid 813007); 20 Feb 2009 09:37:11 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Feb 2009 09:37:11 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Feb 2009 10:36:55 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc2; KDE/4.2.0; x86_64; ; )
References: <1235074713.6859.210.camel@alap> <gnkieu$k8b$1@ger.gmane.org>
In-Reply-To: <gnkieu$k8b$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902201037.06166.openembedded@haerwu.biz>
Subject: Re: [PATCH] add autostart PACKAGE to paroli recipe
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
X-List-Received-Date: Fri, 20 Feb 2009 09:39:37 -0000
X-Groupsio-MsgNum: 7859
Content-Type: multipart/signed; boundary="nextPart2496684.olcr4Asldp";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2496684.olcr4Asldp
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline



On Thursday 19 of February 2009 22:20:29 Koen Kooi wrote:
> On 19-02-09 21:18, Angus Ainslie wrote:
> > +       mkdir -p ${D}/home/root/.e/e/config/illume/
> > +       install ${S}/data/module.illume.cfg
> > ${D}/home/root/.e/e/config/illume/
> > +       install ${S}/data/e.cfg ${D}/home/root/.e/e/config/illume/
> > +       mkdir -p ${D}/home/root/.e/e/themes
> > +       install ${S}/data/illume.edj ${D}/home/root/.e/e/themes
>
> NACK, a package is NEVER EVER allowed to touch /home/*, NEVER. Caps
> used to get the point accross.

Agreed with Koen - $HOME can be on unavailable disc or on other place=20
then /home/root/ (or other user can be used).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart2496684.olcr4Asldp
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmeebkACgkQeQ6MlGH/2qs87wCdFxw02+fne2V79l2uncDaO73Z
XM0Amwc9bdwrsxhPVn6GzvuG3dk2IGz8
=aPRL
-----END PGP SIGNATURE-----

--nextPart2496684.olcr4Asldp--
