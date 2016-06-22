Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 617F060125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 20:08:26 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id hl6so19751857pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=gHRV5WsankWgINbhLCI+1evlhDfhAjysCHKB0XsV0/A=;
	b=aHg03UAsokmE+v/FAkdjzLvnEMBT7S1ebcM0aqiJTMLWg3G3WXll6587jMBOWm7opq
	UYAHRYcbfGMmUZtcFx29AFicxQ4Ii6zQpGnXOz7nl69Epd8snap1YnKeZDHwrr7nREaE
	KrB2wkfWUnBTaZJslUfQAeUDBH2d3R0lmYqcPgNNHRoKV7eYqIoJkkGnBnsi4Mxho2XB
	d4POcFORFUSNBew8Sqot8YDV13PuOdZc5HUQQI2kWOIy2GG3BkkkQ5PmPfVTcL8SqDEd
	EkkasB7N0JU4f/GPzm0bacGwAk2AUWXzEpBftS1eVQw0sjxGmWh4mNWmevRaIjz4KiqM
	O6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=gHRV5WsankWgINbhLCI+1evlhDfhAjysCHKB0XsV0/A=;
	b=LStaz5iUKjuzXGb0OF+ViAYxYL0c00T76j16kqIZaMYLp512djfmPDLqTOi5jbdR5J
	2vmIthhI+5x2tt2lUz1EYAfIs2v0mMt7GSLnNmwxbWOipLTlZANA3rjqzHExfDxY43hS
	4+SKvSX00IhSuOu9wilGiLJBiDhKW5TUO6Sipe2G7++nf50swXPHsC/K3O4nJ4KfrAQY
	8iEf/TYwaMtfmXYN70cxJQZC7jUwTCr9YNx+AbSfdCg5Yq4mzWHXkHNBflseZwGqHOii
	kMMzXG3jajnV4W6u04yD5s4VEotTyW1WBt9OYE7oAnAXmA9eptPapavj3y6buNzypsMd
	EHOg==
X-Gm-Message-State: ALyK8tK78I1BBAaggQjdAPioN44G5P49/xMGiKvz5wyWM2afp5OZZjOq8Dcr1vaB38B0+A==
X-Received: by 10.67.15.72 with SMTP id fm8mr37174085pad.50.1466626107403;
	Wed, 22 Jun 2016 13:08:27 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:115c:c15d:825f:58bc:113e?
	([2601:647:4c00:115c:c15d:825f:58bc:113e])
	by smtp.gmail.com with ESMTPSA id 77sm1655290pfp.66.2016.06.22.13.08.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 13:08:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <8c01a78d-fd75-d1ce-aa0e-c618f12da265@embed.me.uk>
Date: Wed, 22 Jun 2016 13:08:22 -0700
Message-Id: <B36836F6-ADFA-4EAC-9789-A4E51DBE6E9B@gmail.com>
References: <8c01a78d-fd75-d1ce-aa0e-c618f12da265@embed.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: opencv 3.1 gcc 6 compile errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2016 20:08:28 -0000
X-Groupsio-MsgNum: 61939
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6A666655-7417-48B0-A6FD-478251ABE601";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6A666655-7417-48B0-A6FD-478251ABE601
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 3, 2016, at 3:37 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>=20
> I'm hitting compile errors with opencv 3.1 and gcc6. I've been playing =
with disabling/enabling different options to try get round the issues =
but it's too widespread.
>=20
> There is a patch upstream [1] which says it fixes the issues but it =
doesn't seem to help.
>=20
> I've attached the build log without the patch, and the build log with =
the patch, if anyone has ideas then please shout up.
>=20

Such errors usually means that package is violating gcc include =
hierarchy. either by using -isystem and trying to sneak some headers in =
the middle of the supposed hierarchy. So you should look into getting =
rid of any -system that the package might
be specifying in its build system.

> Cheers,
> Jack.
>=20
> [1] =
https://github.com/Itseez/opencv/pull/6541/commits/a0fdc91a14f07de25d85803=
7940fcd3ba859b4e2
> <opencv.log><opencv-gcc6patch.log>--
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_6A666655-7417-48B0-A6FD-478251ABE601
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldq8DoACgkQuwUzVZGdMxQVSgCfUYGFHi8rKIPcPtBrTGbGlyPt
tnEAn0ECydghkQzf6ZGtaVVYOyj7QWMK
=2XHv
-----END PGP SIGNATURE-----

--Apple-Mail=_6A666655-7417-48B0-A6FD-478251ABE601--
