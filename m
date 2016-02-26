Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0EE76E2E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 19:20:08 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id ho8so57044974pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 11:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=Khrc+xfxR/oKHkhiyPAmUuOCrwOWWNHbymtAvnSaMYI=;
	b=EBun/NIOOHtomamxki5PjEqPfBk6Qtyb/bHty8n4kUmiElMHTbJ2tPNZDAfSOwa4vd
	w2To3tfY7Z/1OryLiSNuLEdh74mnbRPSXKVjbVBD0ZF+5sHd7aIdxlhMLI31CXhshqHk
	GdF/IsNNJsmfm5BxDlhOgyEbzjqyuLFfr7ROymKPdYf+pRtAUa89ABrFSMEfKiVOUAN3
	aT4A7a744iW0OdNUNEVWqW93uqStSKcE0EBFy02vmEG6ObQ+2hbyJOQKEne7UTjpy2tl
	+QAsXVpuJr4pLySuKdlRzmMXmN7CBvJ5pH0WdbC3SFfr4JAj7IwYgtdJVPd7WN9SZwqw
	GNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=Khrc+xfxR/oKHkhiyPAmUuOCrwOWWNHbymtAvnSaMYI=;
	b=Y67twd+avRCn6+q7jQEpMSJuJ/2047okJ621xbIJQnT2y/CiG3DKKAh7Q3ApdB9zFB
	ZEQu5rVjUC5Asrq7IEiWitEHf91UZqG0B4YWUXtemfI2jlmTRwAOW0sH+K5qOa7TMOSA
	5WHsFsv5fm9GbEvwmzD8k/HgMLPUW8w8ylMtOUIXx27UpDF10jcXOXEbNF2mHukl04Qu
	RSpKgFjkU1/ciKL14FsPbrtqvn+mHVULRMNeUgvAzCbLwPaGqxQKXbJXJEVay6bAwGu8
	VYiWuPkPgyhauFftlQNHA+7uNgiFVym54znybrC1s0p6WULpjMdFzreJUr8IbaPzasqI
	sxXg==
X-Gm-Message-State: AD7BkJIb4qnCcCLM9PDwdv8aWMRfChnuWoUYAoNzlpxLD0i6jWOhWgNbglnkOpGtIGGqRw==
X-Received: by 10.66.124.226 with SMTP id ml2mr4404515pab.90.1456514409168;
	Fri, 26 Feb 2016 11:20:09 -0800 (PST)
Received: from ?IPv6:2601:646:8800:5a9a:f513:7c04:a5e5:bb1c?
	([2601:646:8800:5a9a:f513:7c04:a5e5:bb1c])
	by smtp.gmail.com with ESMTPSA id
	h85sm6979341pfj.52.2016.02.26.11.20.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Feb 2016 11:20:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1456509790-23305-2-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 26 Feb 2016 11:20:04 -0800
Message-Id: <2C567B48-8897-4E40-B513-FE5E009691F5@gmail.com>
References: <1456509790-23305-1-git-send-email-Martin.Jansa@gmail.com>
	<1456509790-23305-2-git-send-email-Martin.Jansa@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3112)
Subject: Re: [PATCHv2][meta-browser 2/2] recipes: Replace "mv" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Fri, 26 Feb 2016 19:20:09 -0000
X-Groupsio-MsgNum: 60229
Content-Type: multipart/signed;
	boundary="Apple-Mail=_38AA269A-8FF1-4A7C-ABD1-C0370BC1FB2D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_38AA269A-8FF1-4A7C-ABD1-C0370BC1FB2D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 26, 2016, at 10:03 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> * Using "cp -a" leaks UID of user running the builds, causing
>  many QA warnings.
> * See this thread for details:
>  =
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/11=
2904.html
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> recipes-mozilla/firefox-addon/firefox-addon.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-mozilla/firefox-addon/firefox-addon.inc =
b/recipes-mozilla/firefox-addon/firefox-addon.inc
> index a886201..88dd5aa 100644
> --- a/recipes-mozilla/firefox-addon/firefox-addon.inc
> +++ b/recipes-mozilla/firefox-addon/firefox-addon.inc
> @@ -30,7 +30,7 @@ do_install() {
>         [ -z "$EXTENSION" ] && exit 1
>=20
>         mkdir -p ${D}${libdir}/firefox/extensions/
> -        mv $e ${D}${libdir}/firefox/extensions/${EXTENSION}
> +        cp -R --no-dereference --preserve=3Dmode,links -v $e =
${D}${libdir}/firefox/extensions/${EXTENSION}

can we use install utility to have better control over perms

>     done
> }
>=20
> --
> 2.7.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_38AA269A-8FF1-4A7C-ABD1-C0370BC1FB2D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbQpWcACgkQuwUzVZGdMxQqmgCcCe42tQ5D9444lxqVsaU4aDQH
0dkAnA6nzbkBxEXK4//b1xldRJCMt/pT
=b6t2
-----END PGP SIGNATURE-----

--Apple-Mail=_38AA269A-8FF1-4A7C-ABD1-C0370BC1FB2D--
