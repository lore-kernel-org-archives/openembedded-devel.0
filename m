Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id E6DA960273
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 14:49:39 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id g2-v6so6873241plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=g6QOnXOwe9xJNjlbAE+kaWiQ7dZEU32XGhb9Ighzdcs=;
	b=mvbv1TbWl1pLIxUBtsdf6hgb8vtK9A74PYGrbjedZtK+mv0OOBviR0EctRh0AqNU7u
	4ymmf/rTBF6OuXCgBAwD9XO4xiemK0cbFhSbMCdVNj06/ibIzJ3DnNQnti/PL4fhVaFJ
	qZHsW2xVSu4C9J46bIDC2qU9EMJ5mXkrZL20S+vJd+gXhIsKT5rfx0z3e4KqJhpwjjjS
	G4/3J0tDJMQkW1TMj4wvjcA0F94nyqcoEZQTtjTNo+aMGfUWPmYexfZ6RCYJcvmS7agD
	FKKg6EUQ4rpQk4R9k0DDuKkRrk7x3zNpx1Xz6QBi0hnjEYcFRyN5zhV1zpdG87EjQp8+
	W7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=g6QOnXOwe9xJNjlbAE+kaWiQ7dZEU32XGhb9Ighzdcs=;
	b=fubf1qCj/3EciEW4Jfkkyc9PyiT1sW51RUEl3QQcsPdhl6qu/cltcxNM4qTpxNQdZ2
	xz2P49ZEXfBxaug4YSKfAEvprbzHfeIaSZ0Zr3aaFYfzKNUNzGRjqIBBblSFoE4keDg1
	IP/w1JcP+N1OE/JVihcgmE8/FP66ROhE/MMcLZGSdNppPtcM1LLaOFjfFl156c0PSoS8
	VPbP4QSAsgc3BQC2/OP3PqysMJQdecdADbtWeJoVovOL5uNd5PbtiQ7wQzGCASmTwojz
	gaPoja+AmyfTG8771seBnCiAleF3vW9HYmG2mNXwXvZ/6cjaOooRh3fWh5DrcmfP4mK0
	vqWw==
X-Gm-Message-State: APzg51ChD9S1Zse8ewl3q9mGHsJunQyFJpxIhPzASvsVpZYOSnTpIuLk
	gtB1uabKYmo3h2JLjlvVoFg=
X-Google-Smtp-Source: ANB0Vda59yHVEFMymvW+0Jx+LBiAn1Ki1FV3QOQEUakXE5p0jrV4OHN5uuj2Vt/EBpnICD5aX2bOmg==
X-Received: by 2002:a17:902:9a83:: with SMTP id
	w3-v6mr13447994plp.75.1536418180408; 
	Sat, 08 Sep 2018 07:49:40 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:94e5:bda:811c:5d24])
	by smtp.gmail.com with ESMTPSA id
	c20-v6sm27090499pfh.143.2018.09.08.07.49.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Sep 2018 07:49:39 -0700 (PDT)
To: Bartosz Golaszewski <brgl@bgdev.pl>
References: <20180907105515.18840-1-brgl@bgdev.pl>
	<CAMKF1srQXEdRrnfN2L=zsJmZwCV545Epwdd5nwo9MWZfGfYNQQ@mail.gmail.com>
	<CAMRc=Mf1kZzJrdJ781PK3RKfbXWe4GpgypbvLSC2=sqBuDPcsA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
	Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
	miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
	/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
	4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
	ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
	jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
	6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
	PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQoAIAIbAwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
	BQJTBC0aAAoJELsFM1WRnTMUul4An282FaN7oYXM2A8JzQt1ZWeUTlJZAJ0eOgup2Eqxx6gZ
	FOQE7EkRmOb6iM7DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
	DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
	2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
	I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
	RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
	6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
	584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
	HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
	KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
	seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
	3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
	9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
	EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
	X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
	3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
	jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
	UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
	mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
	suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
	XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
	VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Organization: HIMVIS LLC
Message-ID: <10179944-546e-fe85-b58f-47ed31e109da@gmail.com>
Date: Sat, 8 Sep 2018 07:49:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=Mf1kZzJrdJ781PK3RKfbXWe4GpgypbvLSC2=sqBuDPcsA@mail.gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] networkd-dispatcher: new package
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
X-List-Received-Date: Sat, 08 Sep 2018 14:49:40 -0000
X-Groupsio-MsgNum: 74444
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="98zny4xghN2fKC8HS7HkBo9yN8br9Qcu4"

--98zny4xghN2fKC8HS7HkBo9yN8br9Qcu4
Content-Type: multipart/mixed; boundary="jt6z04mXOD2tedoJOiMLZd3pTSM6CsVYT";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Joe MacDonald <joe_macdonald@mentor.com>, Armin Kuster
 <akuster808@gmail.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Message-ID: <10179944-546e-fe85-b58f-47ed31e109da@gmail.com>
Subject: Re: [meta-networking][PATCH v2] networkd-dispatcher: new package
References: <20180907105515.18840-1-brgl@bgdev.pl>
 <CAMKF1srQXEdRrnfN2L=zsJmZwCV545Epwdd5nwo9MWZfGfYNQQ@mail.gmail.com>
 <CAMRc=Mf1kZzJrdJ781PK3RKfbXWe4GpgypbvLSC2=sqBuDPcsA@mail.gmail.com>
In-Reply-To: <CAMRc=Mf1kZzJrdJ781PK3RKfbXWe4GpgypbvLSC2=sqBuDPcsA@mail.gmail.com>

--jt6z04mXOD2tedoJOiMLZd3pTSM6CsVYT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/8/18 2:52 AM, Bartosz Golaszewski wrote:
> 2018-09-08 2:50 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>> http://errors.yoctoproject.org/Errors/Details/192034/
>=20
> Can I somehow retrieve the bblayers.conf and local.conf for this
> build? I don't see this problem locally.
>=20

if you use poky master + systemd you should be similar

https://github.com/kraj/oe-build/blob/master/conf/local.conf
https://github.com/cbrake/meta-bec/blob/master/conf/distro/bec.conf
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.201=
80906_223200.log/auto.conf

> Best regards,
> Bartosz Golaszewski
>=20
>> On Fri, Sep 7, 2018 at 3:55 AM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
>>>
>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>
>>> This adds a recipe for networkd-dispatcher.
>>>
>>> It's a simple package containing a python script that needs to be
>>> installed together with a systemd service and an example config
>>> file. There's nothing to build.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>> ---
>>> NOTE: resending with a proper tag
>>>
>>> v1 -> v2:
>>> - skip the package if systemd is not in DISTRO_FEATURES
>>> - use -D in install for new directories
>>> - use deltask instead of an empty do_compile() function
>>> - define PV in the recipe as <version>+git${SRCPV}
>>>
>>>  .../networkd-dispatcher.bb                    | 33 +++++++++++++++++=
++
>>>  1 file changed, 33 insertions(+)
>>>  create mode 100644 meta-networking/recipes-daemons/networkd-dispatch=
er/networkd-dispatcher.bb
>>>
>>> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/netw=
orkd-dispatcher.bb b/meta-networking/recipes-daemons/networkd-dispatcher/=
networkd-dispatcher.bb
>>> new file mode 100644
>>> index 000000000..7bb2347a8
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-di=
spatcher.bb
>>> @@ -0,0 +1,33 @@
>>> +python __anonymous() {
>>> +    features =3D d.getVar('DISTRO_FEATURES')
>>> +    if not features or 'systemd' not in features:
>>> +        raise bb.parse.SkipPackage('networkd-dispatcher needs system=
d in DISTRO_FEATURES')
>>> +}
>>> +
>>> +SUMMARY =3D "Dispatcher service for systemd-networkd connection stat=
us changes"
>>> +DESCRIPTION =3D "This daemon is similar to NetworkManager-dispatcher=
, but is much \
>>> +more limited in the types of events it supports due to the limited n=
ature of \
>>> +systemd-networkd(8)."
>>> +AUTHOR =3D "Clayton Craft and others"
>>> +
>>> +LICENSE =3D "GPLv3"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84dcc94da3adb52b53ae4fa38=
fe49e5d"
>>> +
>>> +RDEPENDS_${PN} =3D "systemd python3 python3-pygobject python3-dbus"
>>> +
>>> +SRC_URI =3D "git://gitlab.com/craftyguy/networkd-dispatcher.git;prot=
ocol=3Dhttps"
>>> +SRCREV =3D "c7e25623a161b64618ea778541c064d2a1df086b"
>>> +PV =3D "1.7+git${SRCPV}"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +# Nothing to build, just a python script to install
>>> +deltask do_compile
>>> +
>>> +do_install() {
>>> +    install -D -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/netwo=
rkd-dispatcher
>>> +    install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${syste=
md_system_unitdir}/networkd-dispatcher.service
>>> +    install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfd=
ir}/conf.d/networkd-dispatcher.conf
>>> +}
>>> +
>>> +FILES_${PN} +=3D "${systemd_system_unitdir}/networkd-dispatcher.serv=
ice"
>>> --
>>> 2.18.0
>>>


--jt6z04mXOD2tedoJOiMLZd3pTSM6CsVYT--

--98zny4xghN2fKC8HS7HkBo9yN8br9Qcu4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW5PheQAKCRC7BTNVkZ0z
FIh1AJ0Q6LA45FYVSLeQ7enDT65v/zNnCgCfbpjTRvVv4Nx7euMXDiYhU5rGvrE=
=fqcM
-----END PGP SIGNATURE-----

--98zny4xghN2fKC8HS7HkBo9yN8br9Qcu4--
