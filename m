Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LhwMm-0003iC-6S
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 02:39:16 +0100
Received: by wa-out-1112.google.com with SMTP id n7so717628wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 18:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=yz0Icwo7RlLy8uO20Fjp1of++upNCzZ9DkvFCrIu7L0=;
	b=vsdOObSGx4W6Inf+7393ewAefC6Jvv/lv2KJeHEDx/eYOuM8qwMtA5fbr8NgUdnZk2
	aWeQCQ5y7jWDKt85Ar18WmscOvOaDja4ElsYsr3cGqHtE7bOcV/e8O5c2AJVM5qbUdvF
	gFMa9JOG3wMlUPx/7FWpcT56/wTxr6LG9NeRg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=aIpIwfTL/A64aK25zuKcREICFgCUN+TSFpYEHzecpa0TAt/nRR4FalaE6RICj87X7S
	zUy8sPiz07W3CXVirCuct+jKE42Rhe83DIay704XnpL4bkvnv8dapT93KQS5k+aped2Y
	mnkHIHgbPWhXlz6qrHq7bqep+TEpPhXdg1AmQ=
Received: by 10.115.16.14 with SMTP id t14mr448060wai.185.1236908339750;
	Thu, 12 Mar 2009 18:38:59 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id j28sm1146025waf.39.2009.03.12.18.38.59
	(version=SSLv3 cipher=RC4-MD5); Thu, 12 Mar 2009 18:38:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2009 18:38:54 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-9-generic; KDE/4.2.1; x86_64; ; )
References: <1236900736.26901.8.camel@grond.atmel.com>
In-Reply-To: <1236900736.26901.8.camel@grond.atmel.com>
MIME-Version: 1.0
Message-Id: <200903121838.58470.raj.khem@gmail.com>
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 01:39:16 -0000
X-Groupsio-MsgNum: 8395
Content-Type: multipart/signed; boundary="nextPart1311915.yv0UPo5Mpq";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1311915.yv0UPo5Mpq
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 12 March 2009 16:32:16 Ulf Samuelsson wrote:
> Is there any activity to make this more useful?
> Just managed to install a Core i7 machine, which speeded
> up my Buildroot build from about 4 hours to less than 1 hour.
> (There was an error in the build right at the end,
> so it could have been downto 40 minutes or so)
> Building the cross compiler took 10 minutes with "make -j 16"
> compared to 1-2 hours on a P4 @ 3GHz.
>
> Openembedded does not seem to use PARALLEL_MAKE extensively.
> I have the frequency meter activated for all 8 CPUs in the Core i7,
> and most of the time the CPUs seems to idle at 1.6 GHz,
> with one CPU (or rarely 2) are running at the full 2.67 GHz.
>
> Last time I built OE on a P4@ 3 GHz it took ~40 hours
> for the SAM9263, so some speedup would be nice.
> Maybe we should make an effort?

I use=20

PARALLEL_MAKE =3D "-j4"=20
BB_NUMBER_THREADS =3D "2"

in my local.conf. I see my core 2 duo machine spawning parallel tasks.

=2D-=20
Khem Raj

--nextPart1311915.yv0UPo5Mpq
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm5uS8ACgkQHnJKy6V6em79hwCggwLES6T2eGhmd5hdHhkY+qAS
h8UAoIeU/qekS+EAbzdB1eIHy6PlQdpe
=F8Y5
-----END PGP SIGNATURE-----

--nextPart1311915.yv0UPo5Mpq--
