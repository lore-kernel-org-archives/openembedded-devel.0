Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.4355.1621567182061246065
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 20:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.178.232, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6FCDE200002;
	Fri, 21 May 2021 03:19:39 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [oe] [meta-oe][PATCH] ctags: Recipe cleanup
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
In-Reply-To: <CAMKF1sqgn11fpRWTmJrHX+okNSx=-4Ay1Us=gb=F-_OcPT73ag@mail.gmail.com>
Date: Thu, 20 May 2021 20:19:36 -0700
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-Id: <7A70D5A5-893A-4894-BF7C-4FDB07580879@redrectangle.org>
References: <20210521012342.2205595-1-robert.joslyn@redrectangle.org>
 <CAMKF1sqgn11fpRWTmJrHX+okNSx=-4Ay1Us=gb=F-_OcPT73ag@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On May 20, 2021, at 6:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> On Thu, May 20, 2021 at 6:25 PM Robert Joslyn
> <robert.joslyn@redrectangle.org> wrote:
>>=20
>> The configure script does not have a manpages option, resulting in a
>> warning:
>>        ctags-5.9.20210502.0-r0 do_configure: QA Issue: ctags: invalid =
PACKAGECONFIG: manpages [invalid-packageconfig]
>>=20
>> Since there does not seem to be any man pages or documentation =
related
>> configuration options, remove the manpages class.
>>=20
>=20
> so it seems it will be using python-docutils for generating manpages ?

Yes, it uses rst2man.py, which is part of python3-docutils. It looks =
like the configure script checks for a few rst2man varieties to =
determine if it should generate the man pages or not.

Perhaps a better way to do this is to add the manpages class back, and =
pull in the dependency with:

PACKAGECONFIG[manpages] =3D =E2=80=9C,,python3-docutils-native"

Thanks,
Robert=
