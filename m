Return-Path: <joe@deserted.net>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 473226185E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2013 13:41:40 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so1597575eaj.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2013 06:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=/89Yqz4EGm7JD3JeWy7Evx5TgIfIsn23XocSQ2tQoK0=;
	b=EfVQUHGEN92V6pLlRTz72GfQb+7eDWAPG1XrYS+TqH7NTZ6e0ATGTLtLFaRR+kfPg3
	L5Ex0l3gEJUHbtHpLfelv+QZzVcwGGmM6WuRKl1TSURrWT9NaGKdjYPdmIzw6FPDznCx
	dGYQJkS8pr6UYToFtIwGynGQ4aGQBlVttUoWC5RfwcQkHP9e0XQdzkLMqmTDPw3eIQSS
	HhjR4gvOctS7GlLOQdJ6ypfbi3bwJncYSTpJqLK5dzElAuM/NjZDzg2rqAsqCbBnCMWq
	zG0hAb0MXWcErwW5I1fig0yd06dgA7QwWWNb7WTQMgBl6voxKHPt9/tisRXe+khXLVnC
	lHDQ==
X-Gm-Message-State: ALoCoQmve0zASQ9B+UOqdGV/mjoD08nSys2V385VBbXeEhZNv22fA/+hZxsRqJw0RzTDhhUPlD5S
X-Received: by 10.14.103.69 with SMTP id e45mr4190281eeg.51.1378474901515;
	Fri, 06 Sep 2013 06:41:41 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id f49sm1068381eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 06:41:40 -0700 (PDT)
Date: Fri, 6 Sep 2013 09:41:36 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130906134133.GA8719@deserted.net>
References: <1378414975-13587-1-git-send-email-raj.khem@gmail.com>
	<20130905211839.GM11500@jama>
	<CAMKF1soaQ1cgSR2-BG6su07+2EvgwW0qP==EBy5ttPXX_7eQtQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soaQ1cgSR2-BG6su07+2EvgwW0qP==EBy5ttPXX_7eQtQ@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] inetutils: Remove empty usr/lib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2013 13:41:40 -0000
X-Groupsio-MsgNum: 46119
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] inetutils: Remove empty usr/lib] On 13.0=
9.05 (Thu 15:32) Khem Raj wrote:

> On Thu, Sep 5, 2013 at 2:18 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Thu, Sep 05, 2013 at 02:02:55PM -0700, Khem Raj wrote:
> >> This directory is empty and is flagged by QA checker
> >>
> >> ERROR: QA Issue: inetutils: Files/directories were installed but not
> >> shipped
> >>   /usr/lib
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb | 2=
 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_=
1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> >> index 7c7343e..e371ae5 100644
> >> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> >> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> >> @@ -70,6 +70,8 @@ do_install_append () {
> >>      cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.=
d/telnet
> >>      cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d=
/tftpd
> >>      rm -rf ${D}${libexecdir}/
> >> +    # remove usr/lib if empty
> >> +    rmdir ${D}${libdir}
> >
> > The comment suggests missing --ignore-fail-on-non-empty
>=20
> hmmm,I would add it when that happens and also then take opportunity
> to make sure that they are packaged
> into right packages, so far I have not found a case where its populated.

Yep, I'm sold.

Merged.

-J.

>=20
> >
> >>  }
> >>
> >>  PACKAGES =3D+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
> >> --
> >> 1.8.4
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIp230ACgkQwFvcllog0XwCHQCfaq2BIBM3n0AeNSW5o11RY6XI
6x4AnRWwmb8mYEDR3WSmZjPZXKkFlljR
=BC1U
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
