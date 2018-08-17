Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 31383792B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 00:46:52 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id b11-v6so2762044pfo.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 17:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kXRUbr8MqfSr+/vbsPqJcQB8AL9MgjoZ8JfNfXjQhZE=;
	b=M7zX/niCN36+rKpI/diiUtTl/rzbVU2ZbCcRHguqRAhIBFqJK8KX8Fa9HyJSU8T5iY
	NtRwm+PrlG9naLjBuvpS5GvKHilzV0EPahtVnSveNn3p2pwr0xwphjAjIuv6EL8ScEuB
	Jm2udlp5LVDQkfjcaquC3IfiYjwh2hV3HPkKU6Sd+1vszVHeiow4zUyO30FgU0g/Wjh/
	QgS/8j95UiBF/mOSJD5+hZheZj1vwA71JFysrm67zYKwDzp3W5eIfJMgM/Cb9KzwH+nO
	JJJ5Oyy7Mvs7hZIy7+k8GeepS2aoYbrpobbfSJ1VNv36C6nSjSB3D4Qgi7nls9MmASH9
	oTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kXRUbr8MqfSr+/vbsPqJcQB8AL9MgjoZ8JfNfXjQhZE=;
	b=qF2e21nZvikXugovumNvhwImughHkqb+BV5aOuPzfq/ADa4qsZmmfDp3hH/53B4Hfe
	gWWsPqv2Rxxs9o5HGVgzz+XVWT6aPT6BImOh5Iui+/AkSjeYafE/U/U/9L/AQFBxLhPg
	M3QBJCD77lMoaWg4F2+nn6XlzWdYcNRlMS/D3v4JxsLmjcL1w0FE7XDwalJJMIiKEODf
	A3pJY6bder/jjfj3CbQwh3Is7KVH98jM+kEpMDS45aTNzhtzWBm79jBRnziCVMjekfTz
	cSOSncyGrdmUpwrePSSI2KDavoAXLSIStcuy9tRtXA/G+5R8wC+OQlB7fwStHTBj6Miw
	sWTg==
X-Gm-Message-State: AOUpUlGl1WEX1ro49phcYoYDd6tQvnLDlYDNA3gjxRGhThblM9jK85ZV
	oJ0NsIUsSHGjslkEZd3hD+bHKtvy
X-Google-Smtp-Source: AA+uWPxZ786SdIrtJ4E0Y+0a2JYTzN6cUJDboe2XaK/XhfXqcMcjc3Db8hSEpZgyG/Qh0RMaCUzirw==
X-Received: by 2002:a62:ca0d:: with SMTP id
	n13-v6mr34296870pfg.69.1534466812739; 
	Thu, 16 Aug 2018 17:46:52 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:2490:104c:b925:26c4])
	by smtp.gmail.com with ESMTPSA id
	q25-v6sm602826pfk.96.2018.08.16.17.46.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 17:46:52 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
	<CALbNGRQXs=QAmobAa+XoKP15-EiQ806eL7Dbs-BC=CTh6r_yww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <6ba3f748-843d-a7ba-9cce-420796f938bc@gmail.com>
Date: Thu, 16 Aug 2018 17:46:46 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQXs=QAmobAa+XoKP15-EiQ806eL7Dbs-BC=CTh6r_yww@mail.gmail.com>
Subject: Re: [PATCH 00/16] updates & minor cleanups
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
X-List-Received-Date: Fri, 17 Aug 2018 00:46:52 -0000
X-Groupsio-MsgNum: 74011
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="JrnMlH2wpcL2SBYgv8u5bGzyL9vrWg5R7"

--JrnMlH2wpcL2SBYgv8u5bGzyL9vrWg5R7
Content-Type: multipart/mixed; boundary="BkY3hbHD11NDwPjHWs8FdIIs07Qe3rmU9";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <6ba3f748-843d-a7ba-9cce-420796f938bc@gmail.com>
Subject: Re: [oe] [PATCH 00/16] updates & minor cleanups
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
 <CALbNGRQXs=QAmobAa+XoKP15-EiQ806eL7Dbs-BC=CTh6r_yww@mail.gmail.com>
In-Reply-To: <CALbNGRQXs=QAmobAa+XoKP15-EiQ806eL7Dbs-BC=CTh6r_yww@mail.gmail.com>

--BkY3hbHD11NDwPjHWs8FdIIs07Qe3rmU9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/16/18 2:28 PM, Andreas M=C3=BCller wrote:
> On Thu, Aug 16, 2018 at 8:27 PM, Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
>> Some of them I carry along for a while. Patches were tested with glibc=
 2.28. In
>> case of trouble I'll take care.
> OOps: I meant they were not yet tested with glibc 2.28 - sorry

ugh, thats good to know, regardless I have staged them in my queue for
master-next, now since glibc 2.28 is available in oe-core/master, I will
wait for your test results on the series.

>=20
> Andreas
>=20


--BkY3hbHD11NDwPjHWs8FdIIs07Qe3rmU9--

--JrnMlH2wpcL2SBYgv8u5bGzyL9vrWg5R7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW3Ya9gAKCRC7BTNVkZ0z
FJamAJ9l7l2K38p0CAKaYip5Ng1750mThQCgkZYRL+GCF2rFyFjX9ndLFeHIQh4=
=ODf9
-----END PGP SIGNATURE-----

--JrnMlH2wpcL2SBYgv8u5bGzyL9vrWg5R7--
