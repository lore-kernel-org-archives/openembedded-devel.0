Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PwsFH-0005gu-JB
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 09:26:19 +0100
Received: by bwz10 with SMTP id 10so4186625bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 00:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=nd68qW3n0QpPiA8xp3/wryT2VG6aZt8V/0ESn12QM40=;
	b=MiYAL3etLOjOd9jSYiCbthoLh5/tQRpt70CJSRtoz/xFNFMsZU48XEPmRYrbQyXCYK
	J9DLXBPz3E6zT77KEtocvFc6JS9Lb5prmFlp5hVNwWC1Lpm+JVsf77iKyUF2JzENTyUx
	dJ5SBhTk//yNLpYJxdDr4DRzywLpa/A4lv6+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=U9Es9pos6eG7TYU2uea0Q1WatkpY9ILEuomVzUg1AzDAatCQG/ucrw3x+E5aFL1TEr
	kZ5oq6tpJWGFihlqq8St+84CsbaLfIb4xmMhALrHzgZI4U8KI2O1g/aanNOmu64jUUbw
	8dhDbYoJwRo8wdmfpzQ3CE9Pd3GOkk9dxpk60=
Received: by 10.204.164.2 with SMTP id c2mr315388bky.85.1299572682498;
	Tue, 08 Mar 2011 00:24:42 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm296530bkb.18.2011.03.08.00.24.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Mar 2011 00:24:41 -0800 (PST)
Date: Tue, 8 Mar 2011 09:24:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110308082434.GC3547@jama.jama.net>
References: <4D75D1A7.9040103@gmx.net>
 <4D75E0CF.1040209@gmx.net>
MIME-Version: 1.0
In-Reply-To: <4D75E0CF.1040209@gmx.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: libffi-native 3.0.9 fails to build on at least x86_64 [solved, problem on my side]
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
X-List-Received-Date: Tue, 08 Mar 2011 08:26:19 -0000
X-Groupsio-MsgNum: 29980
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline

--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2011 at 08:54:55AM +0100, Robert Schuster wrote:
> Hi,
> I moved the whole OE directory (bitbake, oe, configdir) to a new
> location and made it available through the same path using a symlink. As
> it looks OE does not like that at all.

Hi,

that's why I use mount --bind instead of symlinks/hardlinks (ie tmp/work po=
inting
to different partition/md).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1158IACgkQN1Ujt2V2gBwRjwCgsCbICmTRBHmVedNKM20AwFh2
vQgAn0XVppib1u32bhAITLn3hgO3Qt9y
=wxNb
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
