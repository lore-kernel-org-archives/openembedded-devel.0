Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O1Yna-0005hp-KB
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 07:36:35 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O1YkF-0004cj-Vd
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 09:33:09 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Apr 2010 09:29:39 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <s2ud2a86f8e1004122027pf357420tc3cc7d0aea062740@mail.gmail.com>
In-Reply-To: <s2ud2a86f8e1004122027pf357420tc3cc7d0aea062740@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201004130929.43327.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE failed at task 8045 of 8046
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
X-List-Received-Date: Tue, 13 Apr 2010 05:36:36 -0000
X-Groupsio-MsgNum: 18573
Content-Type: multipart/signed; boundary="nextPart1725210.kaytrp3IJ3";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1725210.kaytrp3IJ3
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 13 =D0=B0=D0=BF=D1=80=D0=B5=D0=
=BB=D1=8F 2010 07:27:38 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 ttk rpink =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>        update-rc.d [-n] <basename> defaults [NN | SS KK]
>        update-rc.d [-n] <basename> start|stop NN runlvl [runlvl] [...] .
>        update-rc.d [-n] <basename> disable|enable [S|2|3|4|5]
>                 -n: not really
>                 -f: force

Well, that's

f62adac0e rootfs_ipk.bbclass: run preinst/postinst scripts with "-e"

that made it fail. But I think it's absolutely appropriate in this case. Yo=
u=20
can try this one:

http://patchwork.openembedded.org/patch/1909/

ACK if it works and I'll commit it then.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1725210.kaytrp3IJ3
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvEAUcACgkQXJ70z+XgVcOQlQCfW/7skyAHsOJmL2JEReV2MdzA
hgcAniX4lzsVJtxojWY/Hiy+Z9QmyUnm
=0W5M
-----END PGP SIGNATURE-----

--nextPart1725210.kaytrp3IJ3--
