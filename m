Return-Path: <trini@konsulko.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id 231787C6F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 16:36:43 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id v139so10178694qkb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 08:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SiadB6d6dXZx4Y+aBTGr0SUBjT6Plg6NQTRDtlkkKco=;
	b=X71B4zVEIx76rWSh1pEeo02nnXL6hZlJOJKjIrWIDDx8hf2xplCzNvrdUCWr2CCUMI
	40Iyxx1xxf+cxgXrDWMtD9dNxJxOOmt+2ZOtf2orZwsUYu+k1naHr+dFnWWg84Kw0yUA
	S8gJrnpqiK/QwRnHknIyl8XT+P+3udTOwwSqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SiadB6d6dXZx4Y+aBTGr0SUBjT6Plg6NQTRDtlkkKco=;
	b=CW2QLxBzFY8sENCDONutBe30zFBa2bvsTZJo5lO6zk2rtScus9pnauVUKrR2gaqUmU
	RyyCg1mcBpoWB74qo4y8UR3EenoOh+n/dc+jlKJ2X5vX4KLilHc1QplzcFdK0YKd0uVO
	sZIC2/rQbbG8hLz4tpIPFEMYIfXbAXeK4v9QA8yuUymK6UsVAZ+6fMm95oF6qrKNusFy
	aWvmQuQNVK+Gsgj+O1hS7veGbTjJHUiK5EBb5ewUwKe95OURxB0QL/Usfw/vx8mHp0pb
	xqMXwye/GcJ3jzTc4XTMfP0rJFAXd4dl3UrpGkBGR+K8OcjEQZuP2mMjEZ0amI/GrOiq
	haVw==
X-Gm-Message-State: APjAAAVtNcYdRSmaF5jjAdZONrTx+EdRBTrwXr6x4qU8imjdHLpiRTNZ
	sif/P0J5lZI4GClY/SkDymqx+A==
X-Google-Smtp-Source: AHgI3IYcOfJM19BX8SFSaRxea3vr4hWVmHD8HyB8BdKLWeqhcEe69R935mJkC5rENPqzf5f97mKGQg==
X-Received: by 2002:a37:a4c1:: with SMTP id n184mr2884005qke.229.1551285404049;
	Wed, 27 Feb 2019 08:36:44 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-84B8-DE84-7E3B-D376.dyn6.twc.com.
	[2606:a000:1401:880d:84b8:de84:7e3b:d376])
	by smtp.gmail.com with ESMTPSA id i6sm2432608qkf.3.2019.02.27.08.36.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 08:36:43 -0800 (PST)
Date: Wed, 27 Feb 2019 11:36:40 -0500
From: Tom Rini <trini@konsulko.com>
To: changqing.li@windriver.com
Message-ID: <20190227163640.GS12046@bill-the-cat>
References: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/4] Add PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 Feb 2019 16:36:43 -0000
X-Groupsio-MsgNum: 76525
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uX2tiToO0oGq+LKk"
Content-Disposition: inline

--uX2tiToO0oGq+LKk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2019 at 04:41:46PM +0800, changqing.li@windriver.com wrote:

> From: Changqing Li <changqing.li@windriver.com>
>=20
> Add PACKAGECONFIG for 4 recipes
>=20
> Changqing Li (4):
>   net-snmp: add PACKAGECONFIG disable-des
>   krb5: add PACKAGECONFIG disable-pkinit
>   openhpi: add PACKAGECONFIG disable-snmpbc
>   freeradius: add PACKAGECONFIGs
>=20
>  meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb | 3=
 +++
>  meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb             | 1=
 +
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb           | 1=
 +
>  meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb                     | 1=
 +

I put this in my comment on 4/4, but I don't see any current examples of
disable- or no-.  We should make these be positive options and include
them in the default PACKAGECONFIG if we already have them on.  Thanks!

--=20
Tom

--uX2tiToO0oGq+LKk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcdryYAAoJEIf59jXTHXZSLFEQALZKVvuFnPOiHGCBeQ/Q1EPC
Sx+ojyFCrf+UaVBzig0ZXvCXomfPUrJSBKTodRQpxfd0pv+NUShDgxondKgJwKmu
GeCxf7M5UveW+zPFidMcX6zauBZ4l4yU6/CK22DsVkTnG+/tP2kMbitgt/GrYEsz
qJyGc03Kikaq1y5h3IuG5kR7xuGaiFRwuiz7EQrndzTM5OmqJStXFYnKkdhSDnKg
0qXlseI3qJSh7MPhQ/dgSSHtnSI6gQSX+KPNKv1bdL7kRbIE5ljtlTX8tntDojYM
19lDJsCIwB/3RS1DWrKisXIkx4zmUFu1C6A0A8cBHayNnNxFVBKoR7jisdckt/+I
tW7HUTHlzKmBU/EYBlHcKWbTeqbWsXBuXrJFf9llulAROdVSXfm6DyV0kCqhvK23
IB8hZmyrejLdWQzob/MYMDzuBqGTTo6Apvv8mdhfD+S5AYEpYCnB6ClozCd76A5C
oUxcvhl0Ez/4iClPvlw2EMthN0EMc9ONLOY/GIwmSHjFCZUsk4Ts7vUTp9hCcAcP
hCwEHmRxI+UzUnU+CxMPtV1UXaJOEByrxqLco6tlmg+5qK5Fxa79fwRuh2ZQA0tp
DswjCrFmPHjZuhbABUU5tScNb4fGd2Rqurt1txx/55b0XKlJUQbz8osOjPXmApGn
CtiKh2YDKuDQNmZcDbQR
=2cwX
-----END PGP SIGNATURE-----

--uX2tiToO0oGq+LKk--
