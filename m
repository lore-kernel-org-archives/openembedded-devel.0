Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id CB985719F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:15:25 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id he10so2997439wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 01:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SXDP1mNs/M0n/l+1r5HE0HFGf0INssHKlwank83zhLs=;
	b=l5Hzv1IOBGObJeSVNG4BZrIRDXH6nB/eavpgXXehIoy5vTjRVANJ0jV2b1jFezE7yv
	5dJ0R/tohJ8cSfRpA1WtfI9Wz4q1tUAsq/V9etV5lq2FYvgJ+hVMKLj0/bvCzuHpkCmE
	zhsaLBRrX9qaPW6UW6Z9wl67e2KYFB4pJdaMQqyydF18VSeIATD9Pwmqfg/FDczuxHbY
	yxSHb6+vdqKwOs4go/4Gs8pljDqKvxQE9UegvTkBDklTUkENaFjehzQ6QIylhDYyHR2p
	5W3KrGExXLztpgkv5p94VptA9rj37/xA1OU0hkPfz5CVpBHcHOzTBiy8UjL3v5gnXQKS
	9jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SXDP1mNs/M0n/l+1r5HE0HFGf0INssHKlwank83zhLs=;
	b=YAO27uEnjfff5jIwWoGtaHVnB7CK6KXpgl8FtLr+Ky9kP2ok56q8GQJHq8hhZZSea0
	LNNEuBPD3wQpfvFYj6/cC8JbHYQ8xJme/udnJcNK9BjXlEXW+BRmZs3fn4gSGdU8kZhS
	yvN+kGSs+OZQuKfTLNvzRDTd3ew9fNIljN0JCfl/UxpHK0K4RCf1vxtJoa7oTH0YCD9L
	equsM8I87ONKQ5SuO4hKmQ1YIbO/xMk6ROq8Uir9PAA68GMB+vzEpEaRV9qPLVdtrwak
	KKG1uNGN9Mj33OrnkD+zJm7Kh0uU9z9mkDNYzrr9CxTi7yFWOAPUNS5ypa3SaqNMkjAc
	MWDA==
X-Gm-Message-State: AKaTC00Kt2yPkWekGreKOuJOUviQzS/raNwO1cySSTRBKc0y4T3bynEb4j1SEYoIFgHO4Q==
X-Received: by 10.194.95.35 with SMTP id dh3mr22766133wjb.141.1480410926631;
	Tue, 29 Nov 2016 01:15:26 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	d85sm1721892wmd.17.2016.11.29.01.15.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Nov 2016 01:15:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Nov 2016 10:15:28 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161129091528.GC2700@jama>
References: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
MIME-Version: 1.0
In-Reply-To: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: Re: [meta-oe][PATCH 0/5] Improve the redis recipe with a focus on systemd support
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
X-List-Received-Date: Tue, 29 Nov 2016 09:15:26 -0000
X-Groupsio-MsgNum: 64092
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 05:59:43PM +0100, Frank Meerkoetter wrote:
> Improve the redis recipe with a focus on systemd support.
>=20
> Frank Meerkoetter (5):
>   Add a systemd service file for redis
>   Do not expose the redis service to the network by default
>   Log to syslog
>   Do not run redis as root
>   Increase the max number of fds to match the concfig in redis.conf

Please follow:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

and start the commit messages with
"redis: "

>=20
>  meta-oe/recipes-extended/redis/redis/redis.conf    |  8 ++++----
>  meta-oe/recipes-extended/redis/redis/redis.service | 15 +++++++++++++++
>  meta-oe/recipes-extended/redis/redis_3.0.2.bb      | 21 ++++++++++++++++=
++++-
>  3 files changed, 39 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/redis/redis/redis.service
>=20
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWD1HLwAKCRA3VSO3ZXaA
HFs3AJ9PyiRlV6z21JTRu1Q2ILNRRAAmvACgiMtp0AHMqPdY4Y7/j6LJCfKYFqg=
=b7tW
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
