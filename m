Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 632CC71B32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 01:27:49 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i85so4048783pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 18:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=c0qb9ZXE6efURm7a+7lhhMrhiXo0m1O+8Lj/Q4oBJT8=;
	b=KB2cR3AZtNNp5VorZvdQ4Pe+FnyrbCkiUgFWciXrPNJT3tDGwJvqam+BkKCe7OvohJ
	KFK40MXi46WZI2Ht96pNLtaT1Y9trEt33bu7tAXyRI0obVSakk/bHhf+JbDBnvTfxrOP
	4hbjFsbCtN/48rY8rcCYKYD58XTjxQUe/XzP+J7/Sgt9N9GBbp+WlZC8hYVy/KfnNtfL
	mhP5zb5wr1Z9olH7ITb8uFwnqx0psQ63GjLyxUvphfmRZckgJ2OyzmLKcE/6obPJj3Sb
	xCr5Nz69YqmSWri6v18PJJDp7NsJT68SmVeBL2WSTJ8lKWbR0Qfh5f+v4bti0iFm5b+N
	P3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=c0qb9ZXE6efURm7a+7lhhMrhiXo0m1O+8Lj/Q4oBJT8=;
	b=B2xiKUPxTiu2rWmYb9xPfdjkFTH7oG6/7mZ2c9uERCyO41neodlngfQU4fNSVJ9/1w
	9vjbKjV9t2LbU7xWvLJbNz4DHIvLaF28Qyma9TCA2YeBb+l75Z4Q7exwevU09aPgFjLS
	Io//s+Hi9oABnlm7zKzAvRa0NHa+ldZ6ifQeIcvn6sjY7H4KMmeSibOEBuUO0lMwLDtL
	GU3tBgioDy4L5RoOVFzHSMy1jHHnOjxGvyHx4rMg7EdKNJ9xXAaLENg+hamhTkdROCbW
	6QFgnaBh2vRgEbEWLSxNekhYRh384+iSc4jFt8L2rpOtgLFHtIdDsWby/XCfVFWUaLr9
	cqnw==
X-Gm-Message-State: ABUngvd/6NY94ZaIPUY+Ha/Qs8MrvAF+EBVJh2uVwjVN9ZbvESn/hh05xS8UR9wYENI7vA==
X-Received: by 10.99.168.78 with SMTP id i14mr16610602pgp.162.1477618071525;
	Thu, 27 Oct 2016 18:27:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:98cf:ea9b:f72:6b74?
	([2601:646:8882:b8c:98cf:ea9b:f72:6b74])
	by smtp.gmail.com with ESMTPSA id
	z11sm14362464pfd.49.2016.10.27.18.27.50
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Oct 2016 18:27:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20161027200430.GJ2494@denix.org>
Date: Thu, 27 Oct 2016 18:27:44 -0700
Message-Id: <51A395DD-6A69-4C9A-929B-B1998A74BCD8@gmail.com>
References: <1477587755-24666-1-git-send-email-denis@denix.org>
	<64B593B9-ABC1-4FAA-975D-144F46C7B134@gmail.com>
	<20161027200430.GJ2494@denix.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Ian Ray <ian.ray@ge.com>
Subject: Re: [meta-oe][krogoth][PATCH] syslog-ng: expand service file @variables@ earlier
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
X-List-Received-Date: Fri, 28 Oct 2016 01:27:50 -0000
X-Groupsio-MsgNum: 63623
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CDAF69FB-D4CD-41E9-992B-040B68430CB3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CDAF69FB-D4CD-41E9-992B-040B68430CB3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 27, 2016, at 1:04 PM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> On Thu, Oct 27, 2016 at 12:55:33PM -0700, Khem Raj wrote:
>>=20
>>> On Oct 27, 2016, at 10:02 AM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>>>=20
>>> From: Ian Ray <ian.ray@ge.com>
>>>=20
>>> Move variable expansion of @SBINDIR@, @LOCALSTATEDIR@, and =
@BASEBINDIR@
>>> earlier during install, to before the systemd service file is =
installed
>>> by an automake rule.
>>>=20
>>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>> meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 9 ++++++---
>>> 1 file changed, 6 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc =
b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>>> index 4e0f697..898e9c2 100644
>>> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>>> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>>> @@ -60,6 +60,12 @@ do_configure_prepend() {
>>>    eval "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', =
'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=3D64//" =
${S}/configure.in', d)}"
>>> }
>>>=20
>>> +do_install_prepend() {
>>> +    sed -i -e 's,@SBINDIR@,${sbindir},g' =
${S}/contrib/systemd/*.service
>>> +    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' =
${S}/contrib/systemd/*.service
>>> +    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' =
${S}/contrib/systemd/*.service
>>> +}
>>=20
>> perhaps, its better to sed the installed artifacts in staging area =
under ${D}
>> it can be done during post install and then ${S} is not edited as it =
is doing
>> right now.
>=20
> That would probably be a better solution... for master. This is just a =
mere
> backport of the commit already in master.

I guess then we need to do it once again via master.

--Apple-Mail=_CDAF69FB-D4CD-41E9-992B-040B68430CB3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgSqZUACgkQuwUzVZGdMxSLzgCdH6pzq7YiMcExc5hMDD/izh3g
SegAoINzaKbi/1ldlbsgk/nCefIDEotQ
=Ddth
-----END PGP SIGNATURE-----

--Apple-Mail=_CDAF69FB-D4CD-41E9-992B-040B68430CB3--
