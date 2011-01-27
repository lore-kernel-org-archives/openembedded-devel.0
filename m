Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PiN4H-0006sJ-Ci
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 09:19:01 +0100
Received: by bwz10 with SMTP id 10so2103105bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 00:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CuyYSBX0R1TJKPeBy3JCK5KEObJAqh9vkspVMolAepM=;
	b=i4xAufHWBkuD16zfVF9VroN85NHUXaYEMyzuxsWuiGgyuVBaCx539kCXwy6jtpw6W4
	Nn7xq04ZgB6BqDJINA1D4SXbWjz/5NEZa/3SvOylUD0cjvLN9MCK4d06WVoJ3uUt4Dba
	N4KkMikefjz67M97+XKR/fl2DGycsI40XzhCM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=snO5SwVoOQzGf7QxbOMILRtXmJrzR9WjK/JTnRveZyL6C+dlIfY8hi50Z++BLAZ8Qe
	ZzjWuRo0J//Jcl5uZFm17u8bKxFmmmhSo+02Hlqb/N8kE8RS8QpH9yjUAXOdhNrUWWO0
	cSknmE/q28FQWEMgkwU2+VoKoOIOeva72V3b4=
Received: by 10.204.116.79 with SMTP id l15mr1224063bkq.122.1296116291210;
	Thu, 27 Jan 2011 00:18:11 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v1sm7938839bkt.17.2011.01.27.00.18.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 27 Jan 2011 00:18:09 -0800 (PST)
Date: Thu, 27 Jan 2011 09:18:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110127081833.GJ3616@jama>
References: <AANLkTinEdQ4zqc4vPZpRAh0LebKQJbrAjOmfWZY0HUYd@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinEdQ4zqc4vPZpRAh0LebKQJbrAjOmfWZY0HUYd@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: staging_packager failing, anyone any idea
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
X-List-Received-Date: Thu, 27 Jan 2011 08:19:01 -0000
X-Groupsio-MsgNum: 28523
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fU0UwhtRbpo05rnG"
Content-Disposition: inline

--fU0UwhtRbpo05rnG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2011 at 10:48:54AM +0100, Frans Meulenbroeks wrote:
> Kicked off a build on our autobuilder (git head, minimal, 64bit ubuntu
> host) and I get the following error (and similar ones at other
> places).
> At least some of the failing recipes did build for me yesterday at
> home (32 bit opensuse host)
>=20
> NOTE: package pixman-0.21.4-r5.0: task do_package_stage: Started
> ERROR: Logfile of failure stored in: /dev/null
> Log data follows:
> NOTE: package pixman-0.21.4-r5.0: task staging_packager: Failed
> ERROR: Function 'staging_packager' failed (see /dev/null for further
> information)
> ERROR: Task 7024
> (/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/xorg-lib/pixman=
_0.21.4.bb,
> do_package_stage) failed with exit code '1'
>=20
> Anyone an idea on what is wrong?

rebuilding stagemanager-native helped here

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fU0UwhtRbpo05rnG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1BKlkACgkQN1Ujt2V2gBygeQCggT+wFBVBBlD5w1MMuJNBGmRD
/GEAoKuDQ3IMQcDKb3rBINXX2MWqBQwL
=Y4X2
-----END PGP SIGNATURE-----

--fU0UwhtRbpo05rnG--
