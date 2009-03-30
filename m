Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LoBSQ-0001Vm-IL
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 08:58:58 +0200
Received: by wa-out-1112.google.com with SMTP id n7so1111035wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 23:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=6QPWranzHIdQNYrA36tEN9vZgMiA6kpyUPGhOqip0c8=;
	b=f1NsL6rmqkqbV/ieaTKJ3u0JcNM0CMDFXpZShrT9DKr05Gj5+y3l1lJq9lGkiZtQnh
	DNuEx0md+EbMBLMXNXwRFT/Yll+dOAm+ke0lM3ymmNr0csiTuX37mb/HIJ1izIaw5LG6
	LE15wWerqqjV07n7fDrIcY5jfKJKDCxYBov30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=UQ7oQqcnP1qsnKeJEcAikw4GaE2QvQD7X+R+zOEXdOUu9IUdZxVhwm1wlS8/UUnGFA
	PcfZYyI+z7Ir4fDNQSiaFFJ/pO6P6TCkgF6mkUjZ03Fzxkac2IMhlzvnHjqQlpCquWyQ
	SRvhKpfNhMIRWWwI5tOZMRz8kSUnHH/x2Ue1E=
Received: by 10.114.37.1 with SMTP id k1mr3391673wak.28.1238396209457;
	Sun, 29 Mar 2009 23:56:49 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-12-154.dsl.pltn13.sbcglobal.net
	[71.146.12.154])
	by mx.google.com with ESMTPS id j28sm4245254waf.39.2009.03.29.23.56.48
	(version=SSLv3 cipher=RC4-MD5); Sun, 29 Mar 2009 23:56:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Mar 2009 23:56:41 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-11-generic; KDE/4.2.1; x86_64; ; )
References: <ef4946070903292210t3ce4885cj1298cdaa0253ffdf@mail.gmail.com>
	<ef4946070903292211k78cec1faq4b66a9d1e80b4d15@mail.gmail.com>
In-Reply-To: <ef4946070903292211k78cec1faq4b66a9d1e80b4d15@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200903292356.46899.raj.khem@gmail.com>
Subject: Re: Addition of the Coyote Linux distro and HAProxy
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
X-List-Received-Date: Mon, 30 Mar 2009 06:59:00 -0000
X-Groupsio-MsgNum: 8810
Content-Type: multipart/signed; boundary="nextPart1778581.1esocLVcoe";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1778581.1esocLVcoe
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 29 March 2009 22:11:33 Joshua Jackson wrote:
> Helps if I actually attach a patch file...
> --
> Joshua Jackson
> Vortech Consulting, LLC
>=20

You do not chose binutils and gcc in conf file. So it will pick whatever bi=
tbake decides. IMO you should
use a preferred version

=46or glibc=20

+PREFERRED_VERSION_glibc =3D "2.5"
+PREFERRED_VERSION_glibc-cross =3D "2.5"
+PREFERRED_VERSION_glibc-cross-sdk =3D "2.5"
+PREFERRED_VERSION_glibc-cross-initial =3D "2.5"
+PREFERRED_VERSION_glibc-cross-intermediate =3D "2.5"

I think you only need PREFERRED_VERSION_glibc and PREFERRED_VERSION_glibc-i=
nitial=20

=2D-=20
Khem Raj

--nextPart1778581.1esocLVcoe
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknQbSoACgkQHnJKy6V6em5o3gCcD3yd886uEr33pJNHY8ORJrPp
rQ0AnjOmZLOC+iX+LU+XYRxztXaauM/r
=BUPY
-----END PGP SIGNATURE-----

--nextPart1778581.1esocLVcoe--
