Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id BA8437706E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 00:47:42 +0000 (UTC)
Received: by pablk4 with SMTP id lk4so55353911pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 17:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=hvyuMFxFdJezpakIVXepXuoUHT88sEViN2CehyMpUtQ=;
	b=EWKQSwPM1NtRkdFK3srMet6kO8UAcu/wCq79WyZmay0WIa+vbM0wnqlpvuEKVKPD5u
	nQufh9yN0h08JPlFWhDQbOsjI6CKOOCFOrvWstIpwgHa+2sr68WUb9vdFZLy+9v0nhA9
	Hhuk3QFpK+bgmBP6QlQlVoUdAHdVXb4AKk7AAI0zkup/kOKlayI6XlTCDA1w9BzDdrFH
	Fwplz0HYKtkF049Nm2tuwWElrojbOEHmj4sCCpP+41iOixRoX2s/I5QQFNcSmcwgTyAu
	kNNIR+uGMA+ktT90L16WqnDWRcs3tV+ZZ01REgsEe/pI3I6Qrh/5g/lvmBQveI7Ynq+p
	bsrA==
X-Received: by 10.67.30.136 with SMTP id ke8mr8597489pad.16.1443660462583;
	Wed, 30 Sep 2015 17:47:42 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1ca0:7049:bf0:dc37?
	([2601:646:8601:4580:1ca0:7049:bf0:dc37])
	by smtp.gmail.com with ESMTPSA id b7sm2950117pbu.20.2015.09.30.17.47.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Sep 2015 17:47:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443646235-9298-1-git-send-email-jkv@unixcluster.dk>
Date: Wed, 30 Sep 2015 17:47:40 -0700
Message-Id: <0AA02CFA-A654-4D19-8194-2CDCAF6BD560@gmail.com>
References: <1443646235-9298-1-git-send-email-jkv@unixcluster.dk>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3094)
Subject: Re: [meta-oe][PATCH] mongodb: receipe fixed, removed from blacklist and now cross compiles to arm.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Oct 2015 00:47:46 -0000
X-Groupsio-MsgNum: 57610
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EBC1B746-C215-432F-A6EB-3CCEE9FEF466";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EBC1B746-C215-432F-A6EB-3CCEE9FEF466
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 30, 2015, at 1:50 PM, Johnny Vestergaard <jkv@unixcluster.dk> =
wrote:
>=20
> -DEPENDS =3D "openssl libpcre boost libpcap"
> +DEPENDS =3D "glibc openssl libpcre boost libpcap"

hard dep on glibc seems to be not right thing. Infact you should not =
need to add
a dep on system C library at all. If the package is intended for glibc =
only then express it using COMPATIBLE_HOST


--Apple-Mail=_EBC1B746-C215-432F-A6EB-3CCEE9FEF466
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYMgq0ACgkQuwUzVZGdMxTcEgCbBlBxJ/gpqDb6bKf7LHoBxD2e
aCoAn11/OXGmREGIga2hr57cj/xSdQV2
=y+IH
-----END PGP SIGNATURE-----

--Apple-Mail=_EBC1B746-C215-432F-A6EB-3CCEE9FEF466--
