Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id C803174579
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 20:16:20 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f18-v6so3275904pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=easEL6lbbQ4KpaLDl9qWSn+k+Zvb9DfR7QfLeVToRkc=;
	b=rY8xmd2JoDSxKHons9cy2lKEVrkas+OW06+6CY8GuQwfHoN32FIKF8tGuW5zlYs7m8
	vdL+LBiS2cUsAsGhK8glamlbx/shQfDUnA5WuYFVlR9TRnu4zZUEAjn9lF+9LY6GOuQF
	jw07nVQK0fh5AB4IY3GsyH1Y7o1Hzz80U597L2vciNFU3nwBVOrjvo9EM50iJaaAu08R
	zLK4KDU2jeZiI6S4t/ot6jhvL+OxDzGYIUWPIxSdHZ9iggRFrvFKAeKSRT4oPWhjPbjw
	sKbrq2h2nIMEObm7RkUKlkiwuC9hb4rugS4NZPa462hcV7eEy6nPWpKYFGUMEjvnlCUB
	sgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=easEL6lbbQ4KpaLDl9qWSn+k+Zvb9DfR7QfLeVToRkc=;
	b=LZeEQrTnjtmozWXNn7LpTEVIQdgW1ocSo1FBeIkHtuqhnMaEWp0qHa/dTYLvTtHt1w
	YuvjD4LiZNCZUqOnRRIOpFi7sQEDc+BPWWpaAUHMiLr6+paudgeW6G4ImaBW4023/Hkq
	QdFvttFqDqaH/C9DcSP9/ZRSgsqcr4smI9z8TGOKqQo80roF6N+nxlUiQjXZW+jVEbjQ
	BsaqiwWieRFS5ERhK7VSv58tq2dG9mL/k02oHY+VyUqebGBrvVlfQ4JiOvnJhMiOHCv0
	dHk4djmauq4e7coKLe8uQdc+JN8tw/83it+w0Gnsb9l1eU2ZY35k5a+VtplZl8S8s1VA
	aaeQ==
X-Gm-Message-State: ABuFfogXJoagdlnIide3TOqHUxQC8TljnVTb0vdlq1RMJ5Mw5vFJTuML
	Vgt9k/DZlCd4JVVjTftFOVyS4Cy6
X-Google-Smtp-Source: ACcGV62yDh3RHCdKpGOZTFqAuH+AwazHjtPIWXmrEBr1uKEth05eBWtUwSE9vJPnThgu9oJDvn7/Mg==
X-Received: by 2002:a63:cd45:: with SMTP id a5-v6mr4105882pgj.43.1538252181473;
	Sat, 29 Sep 2018 13:16:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d58e:d32:beb0:c4a3?
	([2601:202:4180:c33:d58e:d32:beb0:c4a3])
	by smtp.gmail.com with ESMTPSA id
	z25-v6sm13573202pfl.58.2018.09.29.13.16.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 13:16:20 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180929193105.25864-1-akuster808@gmail.com>
	<20180929194635.GC1449@jama>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ba8e6994-685c-2ef8-40fc-7c6acc4f4b61@gmail.com>
Date: Sat, 29 Sep 2018 13:16:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180929194635.GC1449@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] mpd: fix yocto-check-layer issue with mulitmedia
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
X-List-Received-Date: Sat, 29 Sep 2018 20:16:21 -0000
X-Groupsio-MsgNum: 74795
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BnoP8FejHeCVsGNSriuBBvusET2ozG7jh"

--BnoP8FejHeCVsGNSriuBBvusET2ozG7jh
Content-Type: multipart/mixed; boundary="oMoI5V1uEv85K6baVH4B6XTaUpHFIyip4";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-ID: <ba8e6994-685c-2ef8-40fc-7c6acc4f4b61@gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] mpd: fix yocto-check-layer issue
 with mulitmedia
References: <20180929193105.25864-1-akuster808@gmail.com>
 <20180929194635.GC1449@jama>
In-Reply-To: <20180929194635.GC1449@jama>

--oMoI5V1uEv85K6baVH4B6XTaUpHFIyip4
Content-Type: multipart/alternative;
 boundary="------------4AD4263E16D9FDDAF5BC1A25"
Content-Language: en-US

--------------4AD4263E16D9FDDAF5BC1A25
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 09/29/2018 12:46 PM, Martin Jansa wrote:
> On Sat, Sep 29, 2018 at 12:31:05PM -0700, Armin Kuster wrote:
>> ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-opene=
mbedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS o=
n or otherwise requires it)
>>
>> enable aac only if LICENSE_FLAGS is commercial
>>
>> [v2]
>> fix typo in commit message
>> rebase on latest master
> This belongs to cover later or under ---.
I failed to have a [V2] in the subject.=A0 I guess a V3 is inorder for tha=
t.

Can you point me to the doc that says where a [v2] comments in a git
header should be. I can not find it. I seem to be reminded that when I
do revisions I am doing them wrong.

I don't see reference to this policy:
https://www.openembedded.org/wiki/Styleguide#Patches
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

per kernel process:
"The |---| marker line serves the essential purpose of marking for patch
handling tools where the changelog message ends."
Are you saying I should violate that?

is there somewhere else I should be looking?

- armin

>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb =
b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
>> index 9123673fb..f91ce4d62 100644
>> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
>> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
>> @@ -26,7 +26,8 @@ S =3D "${WORKDIR}/git"
>>  EXTRA_OECONF =3D "enable_bzip2=3Dyes"
>>  EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'--with-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-syst=
emdsystemunitdir', d)}"
>>  
>> -PACKAGECONFIG ??=3D "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsy=
nth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upn=
p openal opus oss recorder vorbis wavpack zlib"
>> +PACKAGECONFIG ??=3D "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack=
 libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack z=
lib"
>> +PACKAGECONFIG +=3D "${@bb.utils.contains('LICENSE_FLAGS', 'commercial'=
, 'aac', '', d)}"
> This removes much more than just aac now.
>
> Why did you remove daemon, fifo, libwrap, httpd, oss, recorder, vorbis?
>
>>  
>>  PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,faad2"
>>  PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
>> --=20
>> 2.17.1
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--------------4AD4263E16D9FDDAF5BC1A25--

--oMoI5V1uEv85K6baVH4B6XTaUpHFIyip4--

--BnoP8FejHeCVsGNSriuBBvusET2ozG7jh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbr92TAAoJEO6LtJn0Vuf5EtAQAMy9H1Gzu49yvPYVAl8zf/XZ
+XucG5O5Cqs0XMmFlbZgES7nAcOQg210ZOmypvZi3OyAhg6pQ+KVTHTzMfIZPVRB
orKnnBUoPqjnEL5j2u+EfQbVUGUulHkshojH2a9gQCUyTVi4taIF7P77zA2Z/4Rx
mzo6th3Y6O6bd/1ZqAJyg/hLomj6XeemP9iWl2RHXVqXDBTT7iemO8PRrTRRTgOF
TeKT/hocOOqKP93fZUfpBUC79gsHA28fhf8QQVAzUN1Q6pBOe0hGt+TNFnxhO/7s
nm6VSdtj6csYiXwMfxACmIQDYnVdZ6iusKcDWIDhG8iXSeiMuyc2Wa5Vhq3Q7P+g
RxDmLfIAPGCyKigtylDNfBAdnhhNKzFwkypjxvFpP0559CtuvS0m8IElQv7LErgi
nKDoZMsnND6tUBFrBXHur5Y8+8Cp0v8CD+drJyxySPdNK8lJ1UxqW0zdrO6Q+gk8
cBOsmH7wqilZ9jzewH7HU2Sufq5A2jycdbsXygsgkcGxw/fzdUFgbmNiCkT7srn5
dm35bW15megh0k389nAEQA2rMXNgQTafmJrTyem5wccxcpgcEPwhPHbTn28TxwMb
u+LhI1KNDXCsZp1ABEPDEPq+TO0BXUth0fWkQlu/fVGWMZZqQHXAlL4WD7SEI8F4
Zq/bjtQXkEdJ5K4VXfBT
=wPmQ
-----END PGP SIGNATURE-----

--BnoP8FejHeCVsGNSriuBBvusET2ozG7jh--
