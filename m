Received: from relay1.mail.masterhost.ru ([83.222.23.61])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Nex4b-0000iQ-39
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 21:52:44 +0100
Received: from [UNAVAILABLE] ([93.100.16.104] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <roman@khimov.ru> authenticated with rik@osrc.info
	message id 1Nev9r-00069i-Sp
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 21:50:01 +0300
To: openembedded-devel@lists.openembedded.org
From: Roman I Khimov <roman@khimov.ru>
Date: Tue, 9 Feb 2010 21:48:48 +0300
MIME-Version: 1.0
Message-Id: <201002092148.55115.roman@khimov.ru>
X-SpamTest-Envelope-From: roman@khimov.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 12102 [Feb 9 2010]
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 20
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: roman@khimov.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: initramfs image with secondary cramfs inside
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
X-List-Received-Date: Tue, 09 Feb 2010 20:52:44 -0000
X-Groupsio-MsgNum: 16609
Content-Type: multipart/signed; boundary="nextPart16025061.0JSXXxAOtz";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart16025061.0JSXXxAOtz
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 09 =D1=84=D0=B5=D0=B2=D1=80=D0=
=B0=D0=BB=D1=8F 2010 03:37:21 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 John Van Horne=
 (vanhorj)=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> My approach to this was to have a recipe for the cramfs image and
> a recipe for the initramfs image, and to list the cramfs image as a
> dependency of the initramfs recipe. Both of these recipes inherit the
> image class. However, running bitbake on the initramfs recipe fails
> because the cramfs do_rootfs and do_deploy_to tasks have not run.=20

See this:
http://article.gmane.org/gmane.comp.handhelds.openembedded/22164

and this (starting with "23 Jul 00:24 Richard Purdie"):
http://thread.gmane.org/gmane.comp.handhelds.openembedded/25382

the first one was reverted after discussion in second thread so, in short, =
you=20
have to do something like this in your initramfs:

do_rootfs[depends] +=3D "cramfs_image:do_rootfs"

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart16025061.0JSXXxAOtz
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAktxrhcACgkQXJ70z+XgVcPA3gCgz8VpamndlvCQsteyZfDlM4LU
SNoAoJQRuj9EiziU96HRBZZqKnKuep/M
=lAxB
-----END PGP SIGNATURE-----

--nextPart16025061.0JSXXxAOtz--
