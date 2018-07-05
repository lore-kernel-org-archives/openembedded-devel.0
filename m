Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9B46B7754B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 22:41:31 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id e10-v6so6635514pfn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2018 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Nxq845Xzvt2z4Vaone/tXQlhG3uDYAUhNBYuY+mn0/M=;
	b=rc7YjiLPYwQVmQmWc3zAoErxsbZTNlXlqJWdraRB5TSaqgBMhJWcog6hzsYCtoagjS
	zo/UKGPQtReRGRSzPzvnZMrdLwxEa6lX1BM5NrF4QfW+HkGM6fN2IApC5cUptHkMqiTU
	8aDjuz8bCncVRVpGPUJZxRQvpo2eynwXywRftvjwy8urayAq2hUsFLo98bERviZoUc98
	uLV+dEJgLdpHG5nFxewPoMK7MWqVtw9DO/8DugX2NhkApxfOg7BqAipMOPVY4JHW90tD
	3WihOc3MR6k18DPH/UTn5mXJToO0yPISYJQBgKKrbL2TPV/VuO3VTtksn56IQ7yQhXIg
	WWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Nxq845Xzvt2z4Vaone/tXQlhG3uDYAUhNBYuY+mn0/M=;
	b=b2asZRiVZzDwCXD0cWaI0EeGMXzKbIjuZHZe8QFpPbi4ahasxxBU0/FU0H6PyI75Vr
	ZoKFZzsi6BO96NPprfRww9/BXwRFwI5//HKfRUMBJmJqRyhqCwJyZXvle1+J1ocKCwvs
	7l0yKIroMRJNAEzdjL/+p+tAJVCg1oTibOlGpUxE6ySsSYs1Yf+gOKkdoWSwM+iVFBbJ
	0oR5vIjGMP1t6MqQJreUmrFGG+LyuhzuQjY51+8gV0EhJtbJchu0jEWkZBji/7plf/Px
	+zla+gE/6rVf6MicDpMDsjtHDV83luLeVtGVFqPAUhJi+F85L3reGZYcooDi/fkyWd6W
	FgrA==
X-Gm-Message-State: APt69E1EnGAd34rwNk6IyltRldpOL09JMZikpa1lcdwIUZWK9AyKV5E4
	MIDk/JIHkFNPITp8zXOS7b0=
X-Google-Smtp-Source: AAOMgpccUT8ogTcfWIi5qoBjJYAYhTw0KKzgsPR8639xZnN12BpeMesoSWTUcwXYiQipA5YFnUWoRA==
X-Received: by 2002:a62:93d4:: with SMTP id
	r81-v6mr8075961pfk.55.1530830492504; 
	Thu, 05 Jul 2018 15:41:32 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:b95e:f0e0:47b8:11a8?
	([2601:646:877f:9499:b95e:f0e0:47b8:11a8])
	by smtp.gmail.com with ESMTPSA id
	z10-v6sm13590657pgc.9.2018.07.05.15.41.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 15:41:31 -0700 (PDT)
To: Jonathan Haigh <Jonathan.Haigh@arm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"ptsneves@gmail.com" <ptsneves@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <DB5PR08MB0888F933BA080FF3A022792893400@DB5PR08MB0888.eurprd08.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <39ba35a4-462f-75e0-68d8-8d7cbc6937be@gmail.com>
Date: Thu, 5 Jul 2018 15:41:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <DB5PR08MB0888F933BA080FF3A022792893400@DB5PR08MB0888.eurprd08.prod.outlook.com>
Subject: Re: [oe-core] kernel-devicetree.bbclass: DTBs with path components
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
X-List-Received-Date: Thu, 05 Jul 2018 22:41:31 -0000
X-Groupsio-MsgNum: 73213
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Tn68pic8aCUGm8AsUyHInWu2fhYflxUyz"

--Tn68pic8aCUGm8AsUyHInWu2fhYflxUyz
Content-Type: multipart/mixed; boundary="2qu1UAxpFsFpmHFgcn1KEbRiCYEqBNdLe";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Jonathan Haigh <Jonathan.Haigh@arm.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
 "ptsneves@gmail.com" <ptsneves@gmail.com>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Message-ID: <39ba35a4-462f-75e0-68d8-8d7cbc6937be@gmail.com>
Subject: Re: [oe] [oe-core] kernel-devicetree.bbclass: DTBs with path
 components
References: <DB5PR08MB0888F933BA080FF3A022792893400@DB5PR08MB0888.eurprd08.prod.outlook.com>
In-Reply-To: <DB5PR08MB0888F933BA080FF3A022792893400@DB5PR08MB0888.eurprd08.prod.outlook.com>

--2qu1UAxpFsFpmHFgcn1KEbRiCYEqBNdLe
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/5/18 4:04 AM, Jonathan Haigh wrote:
> Hi,
>=20
>=20
> The recent oe-core commit https://github.com/openembedded/openembedded-=
core/commit/2e7f3b2b9318d1e5395ad58131eafb873f614326 altered the normaliz=
e_dtb() function to always apply basename to the DTB (or DTS) passed in t=
o convert a potentially full path to a DTB/DTS into a make target.
>=20
>=20
> If I understand correctly, that's not the correct thing to do because t=
he make targets can contain directory components - and some of the DTBs i=
n meta-raspberrypi's KERNEL_DEVICETREE do contain directory components ev=
en though they're not full paths to the DTBs (e.g. overlays/at86rf233.dtb=
o from meta-raspberrypi:conf/machine/include/rpi-base.inc).
>=20
>=20
> I think the normalize_dtb() function should just strip leading parts of=
 DTB/DTSs to make them relative to the 'dts' directory. I have a patch to=
 make this change that I will post shortly.
>=20


it has already been reverted today.
see
http://git.openembedded.org/openembedded-core/commit/?id=3D0d725c76c113de=
c441a7319a6ee997e4ae8c4c88

please update to latest master.

>=20
> Regards,
>=20
>=20
> Jonathan
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipi=
ent, please notify the sender immediately and do not disclose the content=
s to any other person, use it for any purpose, or store or copy the infor=
mation in any medium. Thank you.
>=20



--2qu1UAxpFsFpmHFgcn1KEbRiCYEqBNdLe--

--Tn68pic8aCUGm8AsUyHInWu2fhYflxUyz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWz6elgAKCRC7BTNVkZ0z
FORcAJjwmrJ4H0YlJGzU2oWKb420rma0AJ9ymb89VPEFQEjvyehyqq9vERkrCA==
=xVO6
-----END PGP SIGNATURE-----

--Tn68pic8aCUGm8AsUyHInWu2fhYflxUyz--
