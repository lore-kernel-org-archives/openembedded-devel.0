Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LuLpy-0000hw-EN
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 09:20:09 +0200
Received: by wf-out-1314.google.com with SMTP id 25so273061wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2009 00:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=RVfp7t7+C4KVgCaeaU1SQwfPkb1sjnDrBLWUhWiYJxo=;
	b=jTEGEWegf4+vfgAesMiDbUVM+maWhxsjMboavpK3Z4f7hJmYgTtufOOgwUnxn7Iar7
	S6OMLGPQwnE1FPvPevKwkYYigYfQVdiNMDytbKXkIBUKOQEmn9dQnVxqHurdrvWrBlbQ
	NRQiEWfjRjsy7L9ZZ6MYjUIUY2nQrsgIWq/qE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=vGGzImy4eflbng8dCLModCFlZysZfOJWoAFCPbZQXnBRoK0ob3p/C2RTDmnJRnTop1
	WW6rHzKSY8s7fevGkmas4qZ3rsX2cl7LyAmmYBfabGsp4Sbg92nbzVbV9WmPDVAPQ1n/
	Gz5c7IoDn0pg91T/9xF0bdO99sYGvNx/eUGq0=
Received: by 10.142.172.12 with SMTP id u12mr1713702wfe.288.1239865969982;
	Thu, 16 Apr 2009 00:12:49 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id 24sm2834556wfc.17.2009.04.16.00.12.47
	(version=SSLv3 cipher=RC4-MD5); Thu, 16 Apr 2009 00:12:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2009 00:12:41 -0700
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <200904151633.49146.khimov@altell.ru>
	<20090415190913.GA29623@gmail.com>
	<200904152325.47053.khimov@altell.ru>
In-Reply-To: <200904152325.47053.khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200904160012.46743.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.200.172
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_05,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 03/11] linux-libc-headers 2.6.23: fix amd64 headers
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
X-List-Received-Date: Thu, 16 Apr 2009 07:20:35 -0000
X-Groupsio-MsgNum: 9421
Content-Type: multipart/signed; boundary="nextPart2378005.xchOPfrTZM";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2378005.xchOPfrTZM
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 15 April 2009 12:25:46 pm Roman I Khimov wrote:
> On Wednesday 15 April 2009 23:09:13 Khem Raj wrote:
> > On (15/04/09 16:35), Roman I Khimov wrote:
> > > --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> > > +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> > > @@ -63,4 +63,16 @@ do_stage () {
> >
> > is there any reason not to use sanitized header like we do in do_install
> > even for do_stage
>=20
> I think this is the way to go for newer kernels and it can be generalized=
 in=20
> some .inc for future. This approach is used now in=20
> linux-libc-headers_2.6.29.bb, but 2.6.23 historically uses this kind of=20
> do_stage and I don't think we should change that now.

OK. On that note can you test if your stuff works with 2.6.29 kernel header=
s ?
>=20
> BTW, we have locally a patch modifying kernel.bbclass to also use=20
> headers_install in kernel_do_stage for newer kernels. One of many things =
I=20
> still need to prepare and push.

yeah I have always wanted something like that. However its required pretty =
early=20
in the build phase thats why we have linux-libc-headers

>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20

=2D-=20
Khem Raj

--nextPart2378005.xchOPfrTZM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknm2msACgkQHnJKy6V6em5ZLgCfYbF0DaIOjiavzPEGu6Ou1GRd
cwAAn2Cl+O6c8LiVO/X0BP3Yc3sKl5cg
=N6jH
-----END PGP SIGNATURE-----

--nextPart2378005.xchOPfrTZM--
