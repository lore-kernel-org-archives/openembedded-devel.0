Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9427C934
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 17:15:42 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id f19so8248024eds.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 09:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Xx/RZRKtvxDir0uyLXhTL1u3xyOa9XiLyswtJzz+wvg=;
	b=WWFF/sPhniOcdrs+nhbCwCH0bB3k8AnugO56Y2l92iQAr1MJtv2tsAf2xjB85/a8fm
	emRrRi0VPxFUrLVoCk0zuYAPRQ4u1vH/PnG4LUp2ZblUcG11ciyEDVWq9qwAz/en4ckI
	v/CpzwBSXZh84L+E2taLD14Zj9FyLhERrWg3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Xx/RZRKtvxDir0uyLXhTL1u3xyOa9XiLyswtJzz+wvg=;
	b=t1zFxMFUmDGWn9+QVMXeCJf+ukyEbgFP5M+3oOB1xHWGLdyoNhMe32r2dU1udrm/sw
	5ZTtD8MhHJkcLVscTJ3Jz0GUSUBbTfOkm6J04CxQI3pdzEGKYRuCSDN32mfNXbegDl19
	AP51OsLayTCwPtjy2scgp+KdM1+2EVZzLYymUr4zWdycb0+p0BAGQ7n/iNGXYqvDfzEx
	QAgifVWda1Bh2f9A1prRD7WkRbLAoXESJdOQDYHQm6KSA8Qm+dF3g6GyjZdP6FAp5tTl
	wAD55Pl9PYCkXTtDiapIsjJZeTo072frtT6wJg8RZM0tC+OQSIWDIhOLn4J3OyKa1AJ+
	69bQ==
X-Gm-Message-State: APjAAAWVxqIOzOHRqcziaCOAkCAn+g8Uvz1zEAa+RsslyqU2s/C7UG7W
	2nN6CWCqLFamgJdltlTgMRImlA==
X-Google-Smtp-Source: APXvYqzyy2JYvihThaHpyafjXkn1WWKVrhmpCkKZAAQ7NVgn3tqyjU3ymvSLCjM87CoLN0YYhYOZAA==
X-Received: by 2002:a50:890f:: with SMTP id e15mr569368ede.174.1551374142834; 
	Thu, 28 Feb 2019 09:15:42 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-344A-8475-F632-B81B.dyn6.twc.com.
	[2606:a000:1401:880d:344a:8475:f632:b81b])
	by smtp.gmail.com with ESMTPSA id
	z23sm5261535edz.50.2019.02.28.09.15.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 09:15:41 -0800 (PST)
Date: Thu, 28 Feb 2019 12:15:36 -0500
From: Tom Rini <trini@konsulko.com>
To: changqing.li@windriver.com
Message-ID: <20190228171536.GN12046@bill-the-cat>
References: <CAMKF1srJuJQ8UHr1AAGgNYXi24MrfgTZA3KOfnoOjbWXVVq2JA@mail.gmail.com>
	<1551332535-158589-1-git-send-email-changqing.li@windriver.com>
	<1551332535-158589-2-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1551332535-158589-2-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/4 V2] freeradius: Add PACKAGECONFIG openssl/rlm-eap-fast/rlm-eap-pwd
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
X-List-Received-Date: Thu, 28 Feb 2019 17:15:42 -0000
X-Groupsio-MsgNum: 76548
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="95sqq/H8MHju+kJM"
Content-Disposition: inline

--95sqq/H8MHju+kJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 01:42:12PM +0800, changqing.li@windriver.com wrote:

> From: Changqing Li <changqing.li@windriver.com>
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

Thanks!

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--95sqq/H8MHju+kJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJceBc4AAoJEIf59jXTHXZS9m0P/0s6CcrfaaV9Rp0siRmHa5bd
6enDxdEYg3ryLDX5CD+RQw2vUMrpXJmvwsUyznIShoDkf+nZ+Puxzjb5K0dflBeS
iGvCvH9u4XWxJbptIn/kK3i8OV00JDN9FG3QGGTPvstdsFD1JphAqVLujkIxhIo0
Q1Dw6oEcx67ktZ3hmeOypqstK1c6/I8UbHhS29OmG/aWTo6ScCz09unciscjCfF0
ZF5VN6nz/VuT9/hU1N/QLg9WckZYCXfdakyTYCLkkpa1ki6T52GT6cSKZ9i8aMx+
CquqivFNGva7Oh+NKrV8kkV8S8rUBRy8GXmNf+euwcI2Ai//sEFfB35al5M9sWRl
8K3TMPws4ssGDzEWr2OeJ55qiIrCRsWRE0L2sNjvGk6OiJ/uU/t7omftHGBKUv0v
9m7iTe5Lv6hp1XTMMw8U+BOvRWt6oGA6mbE7cjWrE/jGNKUuxVIdBJIevxnuYo6/
JD4MtV3HOPd3jeOovA2loHNQKNqYBNuD7pTnSEEq0BjkRFbLuGV66bC84TxpoRpu
EgRJKlcyZ2fNVS1k5VHCs4EJ+rixFRt5sCC3E/gjl7hMuHIx1jq/iVGU7rHL9fgi
acbkxzciDvVxWc2u3eT2saxgClMWusTBEGlcyZ+L3iK5U6MUVA6D0ozkp6jQ8yC4
ev5gjobXK5SfGKOXTer/
=slTR
-----END PGP SIGNATURE-----

--95sqq/H8MHju+kJM--
