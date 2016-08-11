Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7283E7723C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:56:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q128so1238542wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eZvur74h320uDsFWhQEajc2XrncSt4MzuxOG4MkVww8=;
	b=LjNRbjCNMuC/oJYHiswpgPPMZjvQ4PxXsC/M0Fyq4ff5xveXBeTPkHtmM7cXbWRn2d
	8K5Fa1/s2dT4InKqsgoH1yxHqIkcLWWKif9xLMhw7n3ETvfRx+2+KFtYHq2J/FtF4Fdr
	1znAp7nHG5Q4pEfe86ecswjfv4n1+LgGgaaS05plwBwKu64avIGXsGK/QXvOmiYiEROd
	zE8Hu1w9zdvwILKf5XRk+6KNuDnpQWeqxTVBc5VJjl7jEE9waUgrdVtrQEvFPf/owJ6F
	WRoYPqrMEH82T9nC88m/xof0/wuJTqu3oUnxQOp+h3CRwXAoMEukS8QHFZ1g5XL/KIhP
	qY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eZvur74h320uDsFWhQEajc2XrncSt4MzuxOG4MkVww8=;
	b=aE5tDpIDqSKWmClzMJPIOrcbHxsZSiZ9yfwr3BTPGbN4EjFacNiRpNX3mfZESGtKbT
	NF4ssR0aN25ZPSOk5ocRYof/jxXnF70WJMwxFHDYjgI0gO+iew6xSN0aIhMstsnFfbdn
	ifdUUzdukI5WPTZDQKUCE0CpsEtr+OJ0Sw1tR99gef9VWUvUZeFBp/wD9t32ZjlTW0yf
	9243WndTlbBV3hVYH2+z9LggsUE1MuP37IxI99sKkTBtsljxK+Qv0DNN5aTxQj8qHNEp
	8zdKvFGXA89yoRcE2Iv3VXiDILzyPCzt8LfMExhmqM3c236LzpS2dtRg6qMO+uMdfZnS
	G0qA==
X-Gm-Message-State: AEkoousEf5ARDqOT4g22Y+gUAexwFoctRoW0AUEf5WFe9HbDjatF7rE/aAa79a++Wb+SNQ==
X-Received: by 10.194.87.194 with SMTP id ba2mr10764043wjb.100.1470920170096; 
	Thu, 11 Aug 2016 05:56:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id n2sm2632972wjd.1.2016.08.11.05.56.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Aug 2016 05:56:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Aug 2016 14:56:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160811125609.ytopxjesfdaoxgla@jama>
References: <1470914045-8059-1-git-send-email-ricardo.ribalda@gmail.com>
	<20160811114602.moixzrw6p73hm2lo@jama>
	<CAPybu_0MYrOyBT=fDcNCqZTYKZMq0fbZ_LVKEaEv-4HCxSY0GQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPybu_0MYrOyBT=fDcNCqZTYKZMq0fbZ_LVKEaEv-4HCxSY0GQ@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH v2] glog: Update to version 0.3.4
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
X-List-Received-Date: Thu, 11 Aug 2016 12:56:11 -0000
X-Groupsio-MsgNum: 62555
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fmm7zn3e76nyfoxg"
Content-Disposition: inline

--fmm7zn3e76nyfoxg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 02:50:44PM +0200, Ricardo Ribalda Delgado wrote:
> Hi Martin
>=20
> On Thu, Aug 11, 2016 at 1:46 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>  +        "
> >
> > Please see show we normally indent multiline variables (4 spaces,
> > closing quote as first character on separate line.
> >
> > I'll update this for now, but next time please follow this.
>=20
> Do you have a readme with this? Or something like checkpatch from the ker=
nel?

http://www.openembedded.org/wiki/Styleguide

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fmm7zn3e76nyfoxg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlesdekACgkQN1Ujt2V2gByGdwCfTJk8DVXOnS8qB+CBTWjWaLjo
XCYAoJH67m4hmcz3IuDHJyVVSk1A7EHZ
=a2AU
-----END PGP SIGNATURE-----

--fmm7zn3e76nyfoxg--
