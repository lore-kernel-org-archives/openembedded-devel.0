Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4171073D46
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 02:57:48 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so29629156pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 18:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=k1Rd9R7hlwVut85XTy4x1w5uLefi5xihLw3L8e9O5NA=;
	b=T6lAxcYmVT0VBLSy41iiYMzrRMJ7489XjQXxtW3OnNUrXKA9bAnkE2S6V+xCgX6sLx
	q1dWSrMWgKf/OgqkLc78LR53UHrNHAp2sRO2glFruSHjfwOhhZmcJn35cE2/+TkchpgC
	S6yugiKYvp7ovRb/y4HCVbq4bYNfz2eDGPC8NM2Gv+1bG9u6QaleifUzLfuzSgbKoucw
	UWYFvDzXSwnro4f1Motnzpq42KRn4xaLyAjicMP0YRQNG0CSmCAzMl3+NufVy5YBEvEc
	QMOAX5K83JZQ0T7G4e5HIX1ctFkIA+AogKlGRS+cSJDaqpu4vgvrviOTfxocAABVtT1T
	PwmQ==
X-Received: by 10.67.8.101 with SMTP id dj5mr37552373pad.127.1446605868674;
	Tue, 03 Nov 2015 18:57:48 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:a12d:1fd7:dae:dd5c?
	([2601:646:8601:4580:a12d:1fd7:dae:dd5c])
	by smtp.gmail.com with ESMTPSA id
	qv5sm32006494pbc.71.2015.11.03.18.57.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 18:57:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADseiPmKUNX8ta-6kJ-eAbopx=NOCF0sGcVH5oQz7g9mk=071g@mail.gmail.com>
Date: Tue, 3 Nov 2015 18:57:43 -0800
Message-Id: <89D24DC2-264C-4882-A739-FC5A68C6E3C6@gmail.com>
References: <CADseiPkMQaDUwMWP5V67XW0=0sW3i5TfYk72eZ8OafdM2dO9Ww@mail.gmail.com>
	<A3B887A5-3F5D-4B23-AAC2-A2F1EF8D3D6C@gmail.com>
	<CADseiPmmHNMRaYwFR7k7PDQpgTJQ5x+5HxKignZq-c0FygPS9g@mail.gmail.com>
	<E72BA3F9-5A08-424D-AF04-13BDAD9CD089@gmail.com>
	<CADseiPmKUNX8ta-6kJ-eAbopx=NOCF0sGcVH5oQz7g9mk=071g@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Nov 2015 02:57:49 -0000
X-Groupsio-MsgNum: 58278
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A4334C32-E530-487B-9D13-5239ADB850EF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A4334C32-E530-487B-9D13-5239ADB850EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 3, 2015, at 6:17 PM, Ian Coolidge <ian@boundarydevices.com> =
wrote:
>=20
> I actually tried that already. Didn't work.
>=20
> Passing LD_LIBRARY_PATH=3D/usr/lib/chromium doesn't work either.


hmmm, so if it moves to same folder as chromium itself I should look at =
if we could change

>=20
> On Tue, Nov 3, 2015 at 6:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>>=20
>>> On Nov 3, 2015, at 5:50 PM, Ian Coolidge <ian@boundarydevices.com>
>> wrote:
>>>=20
>>> It looks like it is statically set within the code in the function
>>> InitializeMediaLibrary(module_dir)
>>>=20
>>> Doing a `grep -r -B 5 -A 5 "initializeMediaLibrary" *` of the =
chromium
>> code
>>> shows a few places looking in DIR_EXE for the library instead of
>> DIR_MODULE.
>>>=20
>>> In particular, I see webmediaplayer_factory.cc initializing the =
media
>>> library and looking in DIR_EXE. Is this what would play videos from =
an
>> html
>>> <video> tag?
>>>=20
>>> I'm finding chromium looking in DIR_EXE for libffmpegsumo.so when
>> chromium
>>> is launched with this script:
>>=20
>> for tests can you put library in  /usr/lib/chromium-browser and see =
if it
>> finds it
>>=20
>>>=20
>>> #!/bin/sh
>>>> export DISPLAY=3D:0
>>>> export HOME=3D/tmp/chromium
>>>> export GOOGLE_API_KEY=3DZZZZ
>>>> export GOOGLE_DEFAULT_CLIENT_ID=3DXXXX
>>>> export GOOGLE_DEFAULT_CLIENT_SECRET=3DYYYY
>>>> export CHROME_DEVEL_SANDBOX=3D/usr/sbin/chrome-devel-sandbox
>>>> export CHROME_EXTRA_ARGS=3D" \
>>>>       --user-data-dir=3D/tmp/chromium \
>>>>       --data-path=3D/tmp/chromium \
>>>>       --disk-cache-dir=3D/tmp/chromium \
>>>>       --disk-cache-size=3D16777216 \
>>>>       --use-gl=3Degl \
>>>>       --gpu-no-context-lost \
>>>>       --start-fullscreen \
>>>>       --enable-logging=3Dstderr \
>>>>       --no-first-run \
>>>>       --disable-touch-drag-drop \
>>>>       --enable-file-cookies \
>>>> "
>>>> /usr/bin/chromium/chrome ${CHROME_EXTRA_ARGS} $@
>>>=20
>>>=20
>>> and with this simple vid.html as the page source:
>>>=20
>>> <html>
>>>> <div id=3D"showvideo" style=3D"display: none">
>>>>         <video id=3D"myVideo" height=3D"240" autoplay loop>
>>>>              <source src=3D"/app/test.mp4" type=3D"video/mp4">
>>>>         </video>
>>>> </div>
>>>> </html>
>>>>=20
>>>=20
>>> Thoughts?
>>> Thanks!
>>> -Ian
>>>=20
>>>=20
>>>=20
>>>=20
>>> On Tue, Nov 3, 2015 at 5:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>=20
>>>>=20
>>>>> On Nov 3, 2015, at 5:12 PM, Ian Coolidge <ian@boundarydevices.com>
>>>> wrote:
>>>>>=20
>>>>> Hello,
>>>>>=20
>>>>> In the chromium recipe, there is a package chromium-codecs-ffmpeg =
which
>>>>> puts libffmpegsumo.so in /usr/lib/chromium/. However, it only =
seems to
>>>> work
>>>>> when placed in /usr/bin/chromium/.
>>>>>=20
>>>>> Is there a flag I can pass to chromium to look in =
/usr/lib/chromium/
>> for
>>>>> that library? What step am I missing here?
>>>>>=20
>>>>=20
>>>> can you check the chromium script and see if it needs the lib path =
to be
>>>> specified there ?
>>>>=20
>>>>> Thanks!
>>>>> -Ian Coolidge
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>=20
>>>>=20
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>=20
>>>>=20
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


--Apple-Mail=_A4334C32-E530-487B-9D13-5239ADB850EF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY5dCoACgkQuwUzVZGdMxR2PwCdGBzU+bdTiisHFSfWrbIF0XSM
vaEAnj3s93Mka2suWP6XppOhfN9v5bzK
=46ns
-----END PGP SIGNATURE-----

--Apple-Mail=_A4334C32-E530-487B-9D13-5239ADB850EF--
