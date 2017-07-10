Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE0077D71
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:00:41 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u62so14057970pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 14:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=hUtH0qQUGeUc/qRmvpC2sD2APzbpJ+soP3fq+8onEAs=;
	b=fBW8VxnUFZbjLsfzFlQu0Ck+HLZR/V2kpMuKPyvcUIN8XLys8sU5tFW9q7SZz4Kq7E
	HDgXNmjrP20U4uAYGXUgpWwvHs6Lr26FZoWn3sTPssBP3D8jypg53ZHbThVWoV25Xl5e
	ixTwf7zxZBxfDJELBZJA0a6Mf4oRO13L5I4HKA2ZKZEY7D8VhTd3PkwlP1ka8zSoWfxX
	+R134o6lfhayNNJtzWP2/UgIUhnrWKNxspFC+3HzIGF0AnfICbQq/wFiM8IbLWv+eWc1
	JUmaxoJS3DEzEHbwqMWjhtaVtz5ccMZdVh4HxvrpzOyxz8ZerTSZUkUUEwzPalnAqzWg
	ucXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=hUtH0qQUGeUc/qRmvpC2sD2APzbpJ+soP3fq+8onEAs=;
	b=qfOF4wFtgeFic6JXYSs6x6RJIhxab0ynbMb/HShiywye5NyDUjQt+lLbJqnImaMChQ
	zqJAmVGxFCOyYm3Yf5yenE+rdDd5uh5AoB6iWQ1ZWj9AgsLKc7X49ZjfOJKGCXA2ahJw
	l4pxm9/hOydBWElOJozZCSl6ZtIJQqBlO7lAK03+9cSVu6ItNKWwreBAbNnxIiNiI7DI
	TJw3b5b95Xgv9lPvbsUqpVKI3gr4WfCMaRy6yLnvTY6EZhpwK0HjT5xIJCqa7Dol3f8M
	euh1rjembYbJoXzSbtSRKV8Agu4YuAbzCesPbcNkbUly4/my9mS3W7yc+6qPLbMoAGC5
	DA2Q==
X-Gm-Message-State: AIVw111VsRytfkuMH5RcXq5kF2aML6QnFYZLv700P92UbpWe+vMVaPQa
	Qpfbep1xWfKEcsAZRWA=
X-Received: by 10.84.211.73 with SMTP id b67mr126441pli.230.1499720443120;
	Mon, 10 Jul 2017 14:00:43 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:916c:598f:a4d5:4c49?
	([2601:646:8882:b8c:916c:598f:a4d5:4c49])
	by smtp.gmail.com with ESMTPSA id
	k73sm20724880pge.13.2017.07.10.14.00.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 14:00:41 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-devel@lists.openembedded.org
References: <20170710203642.GB26405@denix.org>
	<20170710204751.GC26405@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <598b8f59-0d75-314e-6f18-7f5daa24fa07@gmail.com>
Date: Mon, 10 Jul 2017 14:00:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <20170710204751.GC26405@denix.org>
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
X-List-Received-Date: Mon, 10 Jul 2017 21:00:42 -0000
X-Groupsio-MsgNum: 67536
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="9sVmVAI9lt3cbRxq0Hd3u0mVCVUVGm2wq"

--9sVmVAI9lt3cbRxq0Hd3u0mVCVUVGm2wq
Content-Type: multipart/mixed; boundary="KiFpFR48jGq6HwC4c7Aci0IErO0wRpPK0";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>,
 openembedded-devel@lists.openembedded.org
Message-ID: <598b8f59-0d75-314e-6f18-7f5daa24fa07@gmail.com>
Subject: Re: [oe] [meta-browser] Chromium and gold linker
References: <20170710203642.GB26405@denix.org>
 <20170710204751.GC26405@denix.org>
In-Reply-To: <20170710204751.GC26405@denix.org>

--KiFpFR48jGq6HwC4c7Aci0IErO0wRpPK0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/10/17 1:47 PM, Denys Dmytriyenko wrote:
> On Mon, Jul 10, 2017 at 04:36:42PM -0400, Denys Dmytriyenko wrote:
>> Khem, et al,
>>
>> I couldn't find below patch being discussed on this mailing list befor=
e it got=20
>> merged:
>>
>> https://github.com/OSSystems/meta-browser/commit/62e323848f569c4cdea55=
67b1917ce006d7705af
>=20
> https://github.com/OSSystems/meta-browser/commit/55a74501bc65c90c86e323=
6b51ec2dc2fc0145fb
>=20
> "ld-is-gold just means that my default linker is gold, however we build=

> both linkers, so one should be able to enable gold just for linking
> chromium even if default ld is bfd linker."
>=20
> I strongly disagree with such interpretation - this would mean there's =
NO way=20
> to disable gold linker completely, e.g. for when external toolchain doe=
sn't=20
> support it.
>=20

it is not just interpretation but how it is designed if you look closely
to code in oe-core and as a matter of fact, there are certain packages
where we enforce one linker or other. mere presence or absence of
ld-is-gold in distro features does not mean that other linker will not
be available. If your distro is making that assumption please correct tha=
t.

I however agree, that using gold as default linker should have a knob
and it so does which is USEGOLD, if a distro or toolchain layer does not
want to use gold then they could set this variable to be off.

USEGOLD =3D "" or USEGOLD =3D "-Dlinux_use_gold_flags=3D0"


I think its better to use gold linker for linking chromium since it
reduced the link time for chrome quite significantly (8 mins to 2min) on
my experiments. But I am fine if other users think that we should not
make gold as default.  I can send a patch to toggle the USEGOLD switch

>=20
>> According to the layer README, openembedded-devel is the official mail=
ing list=20
>> to submit patches. I understand that github pull request is a nice sho=
rtcut,=20
>> but it prevents others from seeing and commenting on the patches...
>>
>>
>> My issue with this change is that it makes an assumption of using OE-b=
uilt=20
>> toolchain. It now breaks external toolchains like this:

No it does not make assumption. See above.

>>
>> | [17/20569] LINK genmacro
>> | FAILED: genmacro
>> | gcc  -L/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-rpath-link,/=
opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -f=
use-ld=3Dgold -Wl,--disable-new-dtags -Wl,-O1 -Wl,--as-needed -Wl,--gc-se=
ctions -Wl,--no-as-needed -lpthread -Wl,--as-needed -o genmacro -Wl,--sta=
rt-group obj.host/third_party/yasm/source/patched-yasm/tools/genmacro/gen=
macro.genmacro.o -Wl,--end-group
>> | /usr/bin/ld.gold: fatal error: /opt/linaro-2016.11/arm-linux-gnueabi=
hf/lib/libgcc_s.so.1: unsupported ELF machine number 40
>> | collect2: error: ld returned 1 exit status
>> | [18/20569] LINK genstring
>> | FAILED: genstring
>> | gcc  -L/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-rpath-link,/=
opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -f=
use-ld=3Dgold -Wl,--disable-new-dtags -Wl,-O1 -Wl,--as-needed -Wl,--gc-se=
ctions -Wl,--no-as-needed -lpthread -Wl,--as-needed -o genstring -Wl,--st=
art-group obj.host/third_party/yasm/source/patched-yasm/genstring.genstri=
ng.o -Wl,--end-group
>> | /usr/bin/ld.gold: fatal error: /opt/linaro-2016.11/arm-linux-gnueabi=
hf/lib/libgcc_s.so.1: unsupported ELF machine number 40
>> | collect2: error: ld returned 1 exit status
>>
>> --=20
>> Denys
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--KiFpFR48jGq6HwC4c7Aci0IErO0wRpPK0--

--9sVmVAI9lt3cbRxq0Hd3u0mVCVUVGm2wq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAllj6vgACgkQuwUzVZGdMxSPrwCePg4F2k2L45hNJCj2xDTs2m1L
2WAAnRd0lV8mncJS4O2Tbacos3YaH3wi
=N4Zj
-----END PGP SIGNATURE-----

--9sVmVAI9lt3cbRxq0Hd3u0mVCVUVGm2wq--
