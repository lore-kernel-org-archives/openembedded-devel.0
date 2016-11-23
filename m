Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 096D565CBA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 22:57:48 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id f188so10691327pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 14:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=nhefJU6JzyyglurqnbE0Vj66HXlGLAMRxHxIMv7qsHE=;
	b=eVGCv6a3KQ6/GeuZ6Zb4jrRjtZswj27dYHkaUaC+uj4WeRXQm/J7K9glh8wZkU+oxC
	yyP/5yALH3IEdibosLFuN2PjjciCVJPCH/RrbYzpIhMEP+PRShT6ub3SYGIvQIiibHxS
	5JaD2DGOtjI9C2C/W9IP1BIfZzD7PA96yJsHDTqNdsRo2/ro1EbPqtUC86JQ2ASH839f
	NCJMlfe/FDVgJSoNHxCEJ++ZtMu24gLega5R8SZCGy8BOcppDLmDzHMiEF/+lC0XHO2j
	HUUawYokmChWV26qKi2zr6MradZapti1jk+qZJE/PZwFgSPJrwpwqQ6PlmRGzqTZCd6U
	0I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=nhefJU6JzyyglurqnbE0Vj66HXlGLAMRxHxIMv7qsHE=;
	b=UBDTkG5FcTrrcIcClR0sFCuy4JZbnSDWRAtYQU2C25gQR0qz+ECPwyl7UrLb+KhhHY
	klKNAKlsG/fO/Pu3gtaBVxHlI5pkn6KQmV7sPNY5nL17hdcvxvt2ukqlp27b+aMZQicS
	SebsVjF0G2jfZwjF8gLRGHOsnjH006J1xaNUFGkdtlPW/mN96W4MIxB/xiSueaDh+Vni
	sjn2g7Kv+wsGd1Z+mGm5CGstu2+l7kj1oM8pOVfc0bUW1gq8fskeNMEj3aWz3n2jQ7T2
	FNNsBcy5BJhK6A5EkJBcvNsefug0zkAf2nOHwglZpfb4E9bywgLcTglvefhfrpnstQP3
	fkyQ==
X-Gm-Message-State: AKaTC00WgYUvmoXyQ/DApBCiz/akIqHuuGr4oVy6mRGLtOMppINJDmCFohpl+SVYbMUerQ==
X-Received: by 10.84.215.142 with SMTP id l14mr11485667pli.99.1479941869364;
	Wed, 23 Nov 2016 14:57:49 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:5159:9909:3ede:f0af?
	([2601:646:8882:b8c:5159:9909:3ede:f0af])
	by smtp.gmail.com with ESMTPSA id
	c22sm37164902pgn.12.2016.11.23.14.57.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 14:57:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Wed, 23 Nov 2016 14:57:47 -0800
References: <alpine.LFD.2.20.1611231326510.15876@localhost.localdomain>
	<5E80B6DC-66EC-499B-84D0-41A5D4F1A1BC@gmail.com>
	<alpine.LFD.2.20.1611231624420.18557@localhost.localdomain>
	<04A98AEA-497D-4919-B83E-27C442F24FB9@gmail.com>
	<alpine.LFD.2.20.1611231725430.20812@localhost.localdomain>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.20.1611231725430.20812@localhost.localdomain>
Message-Id: <B0BDB8C7-A743-409A-BF59-AF7AFDB18061@gmail.com>
X-Mailer: Apple Mail (2.3251)
Subject: Re: mozjs/unhandled signal 11/64k page patch/__powerpc64__ ???
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
X-List-Received-Date: Wed, 23 Nov 2016 22:57:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 23, 2016, at 2:26 PM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
> On Wed, 23 Nov 2016, Khem Raj wrote:
>=20
>>=20
>>> On Nov 23, 2016, at 1:26 PM, Robert P. J. Day =
<rpjday@crashcourse.ca> wrote:
>>>=20
>>> On Wed, 23 Nov 2016, Khem Raj wrote:
>>>=20
>>>> can you reproduce it on version 24 as well ?
>>>=20
>>> not sure what you mean ... this is running on a qemuppc image. i
>>> haven't tried running this on fedora 24 itself. what exactly do you
>>> want me to try?
>>>=20
>>=20
>> I meant version of mozjs
>=20
>  this is version 17.

OK, I think 24 has such issues taken care of. I am not near code right =
now.
but it will be good to check if something is already fixed there for =
this

>=20
> rday
>=20
> --=20
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


