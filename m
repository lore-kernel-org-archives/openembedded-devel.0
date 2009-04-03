Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LpbSG-0006ce-Hl
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 06:56:38 +0200
Received: by wa-out-1112.google.com with SMTP id n7so497129wag.12
	for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 21:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=wwxl77dtvZ4pcX5MBqEF8xXjKlUaS/wic7MBZGdStVo=;
	b=Ma82YB3IYBFsywvu7/cG4tNawjISKytWCU7PMOF9KLEB6VZKGCIjEPA0PJi+xKSBQv
	zCJ7lK4UXPxXGuQtBeKeWZn1eyhhSBfA4Vtc7MJmuDVTQqLFAPJTM77UXBu1mqHglJk2
	pnw+ELBViXWtoWh3wX0kaRnvute1Xp7R1ysPI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=VgbhwZXag0rlErrL97KrYpoPYsEZvV4q5ow3bzM3w2rjOa15ZSc4ALD7R0omWAJQGq
	zjUrPFrnNH/XTDblFtAu7Lyug7qx9Yte9t9kU5DBfPFiZZwu/Iq2SwasnI7jI6pPsPcF
	shOQkCFcWisUuKksRF6bbvaVZwss7Vq5lZkUY=
Received: by 10.114.137.16 with SMTP id k16mr379537wad.189.1238734446960;
	Thu, 02 Apr 2009 21:54:06 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-4-184.dsl.pltn13.sbcglobal.net
	[71.146.4.184])
	by mx.google.com with ESMTPS id g25sm1819299wag.8.2009.04.02.21.54.05
	(version=SSLv3 cipher=RC4-MD5); Thu, 02 Apr 2009 21:54:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Apr 2009 21:53:59 -0700
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <1238532011-2963-1-git-send-email-k.kooi@student.utwente.nl>
	<19c1b8a90903311458k56ee153fkb6977ce7349b78fc@mail.gmail.com>
	<gr2vdb$k2v$2@ger.gmane.org>
In-Reply-To: <gr2vdb$k2v$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200904022154.03611.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.146.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] gcc 4.3.x: disable thumb mode for now, glibc builds don't like it
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
X-List-Received-Date: Fri, 03 Apr 2009 04:56:38 -0000
X-Groupsio-MsgNum: 9033
Content-Type: multipart/signed; boundary="nextPart2240583.pgZKM0l93d";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2240583.pgZKM0l93d
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 02 April 2009 11:16:10 Koen Kooi wrote:
> On 31-03-09 23:58, Khem Raj wrote:
> > can you post the error message and commandline or better preprocessed
> > file of the error thats happening when compiling libgcc in thumb mode
> > plz.
> >
> > We could try to fix the libgcc problem.
>=20
> Any objections to this going into the stable branch till the real bug is=
=20
> fixed?

Not from me.=20

Acked-by: Khem Raj  <raj.khem@gmail.com>

>=20
> regards,
>=20
> Koen
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20

=2D-=20
Khem Raj

--nextPart2240583.pgZKM0l93d
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknVlmcACgkQHnJKy6V6em6HvQCfc9OzVAqKeTmzp4j1iYKW74l9
0+8An3Cx0miC+aM3amZK/y90WSVcF5lA
=cTFc
-----END PGP SIGNATURE-----

--nextPart2240583.pgZKM0l93d--
