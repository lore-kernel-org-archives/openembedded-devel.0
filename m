Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id B317F65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 01:36:41 +0000 (UTC)
Received: by pablk4 with SMTP id lk4so37524684pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Oct 2015 18:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=F66mzts8fQjpl7+xbVc0/Ymgc0ndk3cjHod/7jgWAvM=;
	b=bjnxab4V2mZG234RNgB8Gd+lvUNKWaQZtNc+NnF2heHNlf9vJxCKpjKAfObvCqUIje
	GKhQBER1hB5QESF09K3JrsLch4Ux6dfLHPzk4FjodryF1h5IH7tjEfyVoC0vIRu2demn
	ysu5KXosz0aEa1S6eZw5/91d6Zerweui6Cm89adJs37EHvNcns11d/pCyh/DE2eFHKif
	fcrKtkKF8zxnB9dVXlRCjRpI1Ebslu+gbOKbq5aT7U5mDFBGfYg00zSqyy3SWd5sFbEy
	w9xwB1W8WereaChcjcM/0cBnm/cEiBrcQ5LDEoRsPaOyQzmxkoEmFZYYCu/CVJhfCCss
	V1EA==
X-Received: by 10.66.65.228 with SMTP id a4mr4756304pat.19.1444268201699;
	Wed, 07 Oct 2015 18:36:41 -0700 (PDT)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	ja4sm41862774pbb.19.2015.10.07.18.36.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Oct 2015 18:36:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3095\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20151006222919.GC2383@jama>
Date: Wed, 7 Oct 2015 18:36:41 -0700
Message-Id: <33DC3C44-62D2-4C8E-A7FE-FCCB11A83AFA@gmail.com>
References: <1443950022-18541-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAP9ODKo0weXR60NYM_SUMDd-jZTxTVyq4ki90V5PDoBNdVihdg@mail.gmail.com>
	<20151006222919.GC2383@jama>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3095)
Subject: Re: [PATCH][meta-oe] freerdp: get out of "nonworking", fix build, improve
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
X-List-Received-Date: Thu, 08 Oct 2015 01:36:41 -0000
X-Groupsio-MsgNum: 57707
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3CB81519-D332-4F98-B18A-40A95F3396C1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3CB81519-D332-4F98-B18A-40A95F3396C1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 6, 2015, at 3:29 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Tue, Oct 06, 2015 at 06:58:25PM -0300, Otavio Salvador wrote:
>> On Sun, Oct 4, 2015 at 6:13 AM, Manuel Bachmann =
<manuel.bachmann@iot.bzh> wrote:
>>> We make the "freerdp" recipe active again, fix the build
>>> by pulling a more recent version (the "stable" branches are
>>> buggy and useless), and fix ARM runtime with -fPIC.
>>>=20
>>> We can then :
>>> - make X11 non-mandatory ;
>>> - add support for Wayland ("wlfreerdp" client) ;
>>> - add support for DirectFB ("dfreerdp" client) ;
>>> - add support for GStreamer 1.0 ;
>>> - make "heavy" features such as pulseaudio, cups...
>>> non-mandatory.
>>>=20
>>> We really want to install the "winpr-makecert" tool to have
>>> TLS, but CMake does not position its RPATH cleanly, so let
>>> us have a custom patch for that until it gets sorted out.
>>>=20
>>> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
>>=20
>> I fully agree with the changes and those are very welcome. However, =
it
>> would be good if you could move from nonworking in one patch and do
>> the changes here in another patch.
>=20
> I wanted to get rid of all nonworking directories, I'm sending patch
> series which reverts the recipe moves and replaces it with =
PNBLACKLIST.

PNBLACKLIST still causes parsing overhead. I would suggest to move it to =
a layer under meta-openembedded
like meta-trash or some such, if someone gets it to work move it back to =
the appropriate layer.

>=20
>> Do you mind to rework it?
>=20
> Please rebase it on top of current master-next which already has such
> reverts.
>=20
>>=20
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_3CB81519-D332-4F98-B18A-40A95F3396C1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYVyKkACgkQuwUzVZGdMxSuRACcDklVYNcxpGNsYXfAOiPdhyWJ
vkYAoJP76ThFlXXa0XGU/stIorbo5ftG
=M/4Z
-----END PGP SIGNATURE-----

--Apple-Mail=_3CB81519-D332-4F98-B18A-40A95F3396C1--
