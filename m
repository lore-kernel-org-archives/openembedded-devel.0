Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BAABA731B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 19:31:19 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b187so4580237wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YJtK7sRxdaEj+oolc4o8W4czB980WfzuBwBY6orUsBs=;
	b=gB1wVBhn+zwxnVeNaK0KmJ2PmNw//2r1bHZIT8DDRzhQxOTpie/NaazMQZes2PY/aR
	T5joOnbKyBvebhP/eBpaRb0kN58q6m8iWHExcbvgIHTwfGat9C3ImiPxkNnkvcJOcClb
	MblrLAgEOoSMtDDbE3xT7suG9WOlqQmPWVAz/KvckAdK2nIh9HAhneAOrdFsy+0uYPPN
	ABS2+Q0niIIn0i+qniKrRcXNiDiGfkQYwjOGAmlroT6ozQrYyEfotzOW6/55Ylesg/cp
	+VYnzpbsNkvS63WncPO9bH6ShR/cSm8fFPCEua7PYcKCssw7klvIn/6NYEJwndD7iQ56
	yQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YJtK7sRxdaEj+oolc4o8W4czB980WfzuBwBY6orUsBs=;
	b=ki5F/VMSjvlGofRfL/BTElzffCjo5kDfzlxu0T9X/sNZgMOG2ff5gv2j9Nd+xUeslG
	lPdF54hCDBlv5si1lqu35XU9SpUTa5cJG0VyxIhMquY/ytddqgroxWO8lFnnfxSFTiV7
	Vc4j1gFZ862VUjQ5GEOe2n62o6IpEfQXib9xYs91ojP7e0bVQDX6A7HtmWdbdiqLyjuj
	MrUVvhTX2pg4bwjJbLtKACgeKfluo+gG+j+mkJrNmbhxyw5lFy2xYYT6RrBZ7riYjeHO
	edZEDRzDtPbmklMVKmgEMfTFm1NTAeKYTohl0D0U2mt8r2/Y2KaVHGClVpRug/jaa6x5
	a+OQ==
X-Gm-Message-State: AE9vXwOB+18ver+N/QUSu47eV2H5LAIV1zV0DF2G6ctiXdEyz/leGS07ZQC8Srs9Wx/mVg==
X-Received: by 10.194.84.67 with SMTP id w3mr10740773wjy.148.1473967879864;
	Thu, 15 Sep 2016 12:31:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	z17sm3812851wmz.23.2016.09.15.12.31.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Sep 2016 12:31:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Sep 2016 21:31:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160915193118.GE2641@jama>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
	<CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
	<CALbNGRQ92cGVmUY5Af5qGBFCzsi_kLsKB6cYgVzhtMhyxjV4kQ@mail.gmail.com>
	<CA+chaQc1ts6XJvoCUeyDQt37_C9Bk62e6-3vXXioqm6n0UL-_A@mail.gmail.com>
	<CA+chaQf+VabfADqTaP0N5ZqwZ9xiP1rP9bj7k4HL2KE62wkgPQ@mail.gmail.com>
	<CALbNGRQV1ttB8zyX+MPp4eLOKE4nezA9cQ4Js5rPjfVgRQ4nGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQV1ttB8zyX+MPp4eLOKE4nezA9cQ4Js5rPjfVgRQ4nGA@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [PATCH] samba: unblacklist and link with bfd on arm only
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
X-List-Received-Date: Thu, 15 Sep 2016 19:31:21 -0000
X-Groupsio-MsgNum: 63137
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xJK8B5Wah2CMJs8h"
Content-Disposition: inline

--xJK8B5Wah2CMJs8h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 09:25:08PM +0200, Andreas M=FCller wrote:
> On Thu, Sep 15, 2016 at 7:39 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > and
> > http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/1=
06661.html
> >
> > On Thu, Sep 15, 2016 at 7:38 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> >> Does your log.do_package show that it was actually linked with libpam?
> >>
> I think I got it now: Problem does not occur to me as I have pam in
> DISTRO_FEATURE -> pam in PACKAGECONFIG -> libpam in DEPENDS. To get
> 'your' problem, I have to remove pam from PACKAGECONFIG explicitly.

Right, that's what I meant by "and it might be always detected when you hav=
e pam in DISTRO_FEATURES."

Sorry that I wasn't clear.

> Will report...

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xJK8B5Wah2CMJs8h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfa9wUACgkQN1Ujt2V2gBwsRQCeL4ybz0htYRmyuCCIDrfZCUkv
1NQAn318gxX80pgXSzgIVPF+6bP3GuBq
=aKMD
-----END PGP SIGNATURE-----

--xJK8B5Wah2CMJs8h--
