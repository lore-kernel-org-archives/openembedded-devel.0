Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 51CDF60125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 02:13:38 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so36380385pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 18:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=Djb7YLImSBfuJ5HBCOlGXACoDsVi92pm25+m1uNrJ6I=;
	b=SkvP8UYIQ7Yf/YxrMXtG+iONVHarTV8HLKbvWq1f4+UPk/IfQwmCJrDZqbKlpM2OTW
	qSjMo0b84s5a17hEA036oWxKmD4VCuqTDT0ulX1QmcEvXpNH065UwLyuUmGbG9Ycau1S
	0Z1JcsJ/eSyaOQGtjAMuw2qQE4+R30EeK3LlE9os+kF+kxNSYFqyAmLAvfep/2iBns6l
	hZvBvBKfZJ5oc18W5HJQlfcn2P16gIJBAU6pY2+e6iEr5nI0yrk4QhFmzRnzGGPmqTKC
	MF+y9TzhQ8mIz/trpHWfcG0aJdNnN7ImDDSjNugqqiToqgdKW27gURFABNYTLZTWWwbh
	Sy1g==
X-Received: by 10.68.69.35 with SMTP id b3mr38337096pbu.22.1446603218976;
	Tue, 03 Nov 2015 18:13:38 -0800 (PST)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	bh4sm11684394pbb.17.2015.11.03.18.13.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 18:13:37 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADseiPmmHNMRaYwFR7k7PDQpgTJQ5x+5HxKignZq-c0FygPS9g@mail.gmail.com>
Date: Tue, 3 Nov 2015 18:13:33 -0800
Message-Id: <E72BA3F9-5A08-424D-AF04-13BDAD9CD089@gmail.com>
References: <CADseiPkMQaDUwMWP5V67XW0=0sW3i5TfYk72eZ8OafdM2dO9Ww@mail.gmail.com>
	<A3B887A5-3F5D-4B23-AAC2-A2F1EF8D3D6C@gmail.com>
	<CADseiPmmHNMRaYwFR7k7PDQpgTJQ5x+5HxKignZq-c0FygPS9g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3106)
Subject: Re: [meta-browser] chromium libffmpeg
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
X-List-Received-Date: Wed, 04 Nov 2015 02:13:39 -0000
X-Groupsio-MsgNum: 58276
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0B4B65D1-EEEF-4668-9C9C-13738DD77114";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0B4B65D1-EEEF-4668-9C9C-13738DD77114
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 3, 2015, at 5:50 PM, Ian Coolidge <ian@boundarydevices.com> =
wrote:
>=20
> It looks like it is statically set within the code in the function
> InitializeMediaLibrary(module_dir)
>=20
> Doing a `grep -r -B 5 -A 5 "initializeMediaLibrary" *` of the chromium =
code
> shows a few places looking in DIR_EXE for the library instead of =
DIR_MODULE.
>=20
> In particular, I see webmediaplayer_factory.cc initializing the media
> library and looking in DIR_EXE. Is this what would play videos from an =
html
> <video> tag?
>=20
> I'm finding chromium looking in DIR_EXE for libffmpegsumo.so when =
chromium
> is launched with this script:

for tests can you put library in  /usr/lib/chromium-browser and see if =
it finds it

>=20
> #!/bin/sh
>> export DISPLAY=3D:0
>> export HOME=3D/tmp/chromium
>> export GOOGLE_API_KEY=3DZZZZ
>> export GOOGLE_DEFAULT_CLIENT_ID=3DXXXX
>> export GOOGLE_DEFAULT_CLIENT_SECRET=3DYYYY
>> export CHROME_DEVEL_SANDBOX=3D/usr/sbin/chrome-devel-sandbox
>> export CHROME_EXTRA_ARGS=3D" \
>>        --user-data-dir=3D/tmp/chromium \
>>        --data-path=3D/tmp/chromium \
>>        --disk-cache-dir=3D/tmp/chromium \
>>        --disk-cache-size=3D16777216 \
>>        --use-gl=3Degl \
>>        --gpu-no-context-lost \
>>        --start-fullscreen \
>>        --enable-logging=3Dstderr \
>>        --no-first-run \
>>        --disable-touch-drag-drop \
>>        --enable-file-cookies \
>> "
>> /usr/bin/chromium/chrome ${CHROME_EXTRA_ARGS} $@
>=20
>=20
> and with this simple vid.html as the page source:
>=20
> <html>
>> <div id=3D"showvideo" style=3D"display: none">
>>          <video id=3D"myVideo" height=3D"240" autoplay loop>
>>               <source src=3D"/app/test.mp4" type=3D"video/mp4">
>>          </video>
>> </div>
>> </html>
>>=20
>=20
> Thoughts?
> Thanks!
> -Ian
>=20
>=20
>=20
>=20
> On Tue, Nov 3, 2015 at 5:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>>=20
>>> On Nov 3, 2015, at 5:12 PM, Ian Coolidge <ian@boundarydevices.com>
>> wrote:
>>>=20
>>> Hello,
>>>=20
>>> In the chromium recipe, there is a package chromium-codecs-ffmpeg =
which
>>> puts libffmpegsumo.so in /usr/lib/chromium/. However, it only seems =
to
>> work
>>> when placed in /usr/bin/chromium/.
>>>=20
>>> Is there a flag I can pass to chromium to look in /usr/lib/chromium/ =
for
>>> that library? What step am I missing here?
>>>=20
>>=20
>> can you check the chromium script and see if it needs the lib path to =
be
>> specified there ?
>>=20
>>> Thanks!
>>> -Ian Coolidge
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
>>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_0B4B65D1-EEEF-4668-9C9C-13738DD77114
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY5adAACgkQuwUzVZGdMxSnSgCbBJ99ybyysvTJjclGsO1M9+Y7
zhMAn1l2afldTyDtGs7FQ4LDJkeOdmjA
=kmee
-----END PGP SIGNATURE-----

--Apple-Mail=_0B4B65D1-EEEF-4668-9C9C-13738DD77114--
