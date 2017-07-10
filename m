Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 99C8677D16;
	Mon, 10 Jul 2017 21:25:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u36so14103771pgn.3;
	Mon, 10 Jul 2017 14:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=0Z+Jz7CiJcc91MrvL8Jn2sPM5GH5p2l/JNjWgRyuLWY=;
	b=BSyOVYR6yOwI5KiDbtp47tT5S/ALKsGtwsb3q668KXGk37jp9V2FF+PocSyVZgwvke
	pLoztIkdNkDQd4ZypPoUSWI9S26NtAoj6IhEwr4/tH7xO7DrPYgDSJAVzB27Ze8ixNoA
	kU0rq0voT6NtxQ8PRpErl7b/Q52ikVLF8REvel2yi7c6SDG7Q+7GDkqnAQHDtKztTCZw
	mDTw5g+TAjRntCPSr4ScMQwVqPQnh5Bpz8oWyoInL0pr4yEc9KlBble0yXbv+QvMtsOw
	pDbE1eFBemxfltkvW0KOnIOtikxGzoWrxfsml0tGIDcBXiRocPfwsOP+LofMRk7zDVNs
	qpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=0Z+Jz7CiJcc91MrvL8Jn2sPM5GH5p2l/JNjWgRyuLWY=;
	b=dGLMATMxM2mez//kTVL+pYRg4lfcrJMVSvnyW/2KGWhhDSg0vDEJ0y3PPgSVIUZrzl
	RGkThSvK42SMntSHH2gyOZwgEzqotTj5q8qTReXnTMUUY0Pc2hYyZd8IjFG/Xn3APsmh
	9wclJrUcMO0D27Wdwi75HObdjtDhYFlccYu+SirT4IkGYE4jCR3gTm8/Y8dXBxnp9uQf
	nIYUakzlyN1+yghzvR1HC2e+ZF6/obfw4wEJ2IsqBq7rEsWBJiiS3ESpP+btEOPvhdqa
	RzUv6VSn/Z7pHLe1JKoy4ph5D1zs7v83hohHGwtngKbdJ8Nmn6jMLO+T6pqRLrpn8HeT
	DZcA==
X-Gm-Message-State: AIVw111T8lExbnzV1PFMbwzNcEX1QPLr3/+rsG/DzTj5lG0JAWlZ0DMJ
	wdBwpay6uONdpT81V1Q=
X-Received: by 10.84.229.6 with SMTP id b6mr19607225plk.247.1499721931226;
	Mon, 10 Jul 2017 14:25:31 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:916c:598f:a4d5:4c49?
	([2601:646:8882:b8c:916c:598f:a4d5:4c49])
	by smtp.gmail.com with ESMTPSA id
	z6sm24045334pff.46.2017.07.10.14.25.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 14:25:30 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>
References: <20170710203642.GB26405@denix.org>
	<20170710204751.GC26405@denix.org>
	<598b8f59-0d75-314e-6f18-7f5daa24fa07@gmail.com>
	<20170710210903.GD26405@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <eb50d0a7-dac2-d120-6103-a999c477369c@gmail.com>
Date: Mon, 10 Jul 2017 14:25:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <20170710210903.GD26405@denix.org>
Cc: openembedded-architecture@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser] Chromium and gold linker
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
X-List-Received-Date: Mon, 10 Jul 2017 21:25:31 -0000
X-Groupsio-MsgNum: 67541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="9GUQqJtCDrqtVbQLCD9peRQ7b7q8SBNBL"

--9GUQqJtCDrqtVbQLCD9peRQ7b7q8SBNBL
Content-Type: multipart/mixed; boundary="KnN7BWup2rjWvf9nI92ppkKS33RoqhqEw";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-devel@lists.openembedded.org,
 openembedded-architecture@lists.openembedded.org
Message-ID: <eb50d0a7-dac2-d120-6103-a999c477369c@gmail.com>
Subject: Re: [oe] [meta-browser] Chromium and gold linker
References: <20170710203642.GB26405@denix.org>
 <20170710204751.GC26405@denix.org>
 <598b8f59-0d75-314e-6f18-7f5daa24fa07@gmail.com>
 <20170710210903.GD26405@denix.org>
In-Reply-To: <20170710210903.GD26405@denix.org>

--KnN7BWup2rjWvf9nI92ppkKS33RoqhqEw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/10/17 2:09 PM, Denys Dmytriyenko wrote:
> On Mon, Jul 10, 2017 at 02:00:35PM -0700, Khem Raj wrote:
>> On 7/10/17 1:47 PM, Denys Dmytriyenko wrote:
>>> On Mon, Jul 10, 2017 at 04:36:42PM -0400, Denys Dmytriyenko wrote:
>>>> Khem, et al,
>>>>
>>>> I couldn't find below patch being discussed on this mailing list bef=
ore it got=20
>>>> merged:
>>>>
>>>> https://github.com/OSSystems/meta-browser/commit/62e323848f569c4cdea=
5567b1917ce006d7705af
>>>
>>> https://github.com/OSSystems/meta-browser/commit/55a74501bc65c90c86e3=
236b51ec2dc2fc0145fb
>>>
>>> "ld-is-gold just means that my default linker is gold, however we bui=
ld
>>> both linkers, so one should be able to enable gold just for linking
>>> chromium even if default ld is bfd linker."
>>>
>>> I strongly disagree with such interpretation - this would mean there'=
s NO way=20
>>> to disable gold linker completely, e.g. for when external toolchain d=
oesn't=20
>>> support it.
>=20
> Copying OE architecture list for further discussion of "ld-is-gold" mea=
ning.
>=20
>=20
>> it is not just interpretation but how it is designed if you look close=
ly
>> to code in oe-core and as a matter of fact, there are certain packages=

>> where we enforce one linker or other.
>=20
> So far I only seen forcing bfd, as a legacy linker, not the other way a=
round.
>=20
>=20
>> mere presence or absence of
>> ld-is-gold in distro features does not mean that other linker will not=

>> be available. If your distro is making that assumption please correct =
that.
>>
>> I however agree, that using gold as default linker should have a knob
>> and it so does which is USEGOLD, if a distro or toolchain layer does n=
ot
>> want to use gold then they could set this variable to be off.
>>
>> USEGOLD =3D "" or USEGOLD =3D "-Dlinux_use_gold_flags=3D0"
>=20
> Yes, I saw this variable and already added it to my bbappend. But the i=
ssue is=20
> that it's per-recipe, not global. Do we need a separate distro-level fl=
ag to=20
> avoid any and all gold linker references?

Leave aside the meaning for a moment, I think its convenient to use it
this way, I am not too hell bent for enforcing gold as default, so I
will send a patch to not default to gold. The flag is useful only when
bfd linker is system default and one just want to link chromium with
gold for various
reasons, they can set it explicitly in their own setups. We however will
have the mechanism to do so without making gold the system linker.

>=20
>=20
>> I think its better to use gold linker for linking chromium since it
>> reduced the link time for chrome quite significantly (8 mins to 2min) =
on
>> my experiments. But I am fine if other users think that we should not
>> make gold as default.  I can send a patch to toggle the USEGOLD switch=

>>
>>>
>>>> According to the layer README, openembedded-devel is the official ma=
iling list=20
>>>> to submit patches. I understand that github pull request is a nice s=
hortcut,=20
>>>> but it prevents others from seeing and commenting on the patches...
>>>>
>>>>
>>>> My issue with this change is that it makes an assumption of using OE=
-built=20
>>>> toolchain. It now breaks external toolchains like this:
>>
>> No it does not make assumption. See above.
>>
>>>>
>>>> | [17/20569] LINK genmacro
>>>> | FAILED: genmacro
>>>> | gcc  -L/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-rpath-link=
,/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC =
-fuse-ld=3Dgold -Wl,--disable-new-dtags -Wl,-O1 -Wl,--as-needed -Wl,--gc-=
sections -Wl,--no-as-needed -lpthread -Wl,--as-needed -o genmacro -Wl,--s=
tart-group obj.host/third_party/yasm/source/patched-yasm/tools/genmacro/g=
enmacro.genmacro.o -Wl,--end-group
>>>> | /usr/bin/ld.gold: fatal error: /opt/linaro-2016.11/arm-linux-gnuea=
bihf/lib/libgcc_s.so.1: unsupported ELF machine number 40
>>>> | collect2: error: ld returned 1 exit status
>>>> | [18/20569] LINK genstring
>>>> | FAILED: genstring
>>>> | gcc  -L/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-rpath-link=
,/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC =
-fuse-ld=3Dgold -Wl,--disable-new-dtags -Wl,-O1 -Wl,--as-needed -Wl,--gc-=
sections -Wl,--no-as-needed -lpthread -Wl,--as-needed -o genstring -Wl,--=
start-group obj.host/third_party/yasm/source/patched-yasm/genstring.genst=
ring.o -Wl,--end-group
>>>> | /usr/bin/ld.gold: fatal error: /opt/linaro-2016.11/arm-linux-gnuea=
bihf/lib/libgcc_s.so.1: unsupported ELF machine number 40
>>>> | collect2: error: ld returned 1 exit status
>>>>
>>>> --=20
>>>> Denys
>>>> --=20
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>=20
>=20
>=20



--KnN7BWup2rjWvf9nI92ppkKS33RoqhqEw--

--9GUQqJtCDrqtVbQLCD9peRQ7b7q8SBNBL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAllj8MkACgkQuwUzVZGdMxQeUACfbtfmG73HUX6QG7M67t3tu7Um
KKoAn2F0sE4flmoOV4kyiFwJU886Cycf
=fZwY
-----END PGP SIGNATURE-----

--9GUQqJtCDrqtVbQLCD9peRQ7b7q8SBNBL--
