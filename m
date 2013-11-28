Return-Path: <joe@deserted.net>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2F32F6D5B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 18:24:32 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id 1so7385743qee.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 10:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=/3td5b7CK0lelhZFxMcad/qUgI161tszRKy1F4Hq9dE=;
	b=g2nXv+wIm4uns7942JNaALKW2HAGjo/wtM7+DAnCBmE9OdnfrchmyfecYHg/8RFsa3
	z61bfnQwFt3iAUnWVNjAKR2bAO3U9K52/QWDUv5KsVIE38r2goRX4I46ZGz85Zk4Rn7i
	E/rPZTXABOOwgUoUKUIPP3muuXViO0jkfF5bYfojym1q9VlFume/aclUlLDPyVQdCXJG
	nktF3Lp25bvUsZAB2kgfPZ6kh99cv+lRodPR+9fktTJAetp97NRaHcEe4uj8Tvin95jS
	JwFAf1uwkAZ1HlJbWtqHJFMkptUy8kov7jo5KLsep8lCTolTIGUhVymX2zkQDJBQ8bko
	wpzg==
X-Gm-Message-State: ALoCoQkdAUBqrdy0OKLcnapClqQaZyUTO0pFK5HJElh/MUCGXQzn1R4Vb+sceb1r937bA1GmNndB
X-Received: by 10.229.49.8 with SMTP id t8mr78998446qcf.21.1385663068414;
	Thu, 28 Nov 2013 10:24:28 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id n7sm34235383qai.1.2013.11.28.10.24.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Nov 2013 10:24:27 -0800 (PST)
Date: Thu, 28 Nov 2013 13:24:25 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131128182423.GC3724@deserted.net>
References: <CAMCfZKEEYRnDP36tKtn=rqXEdY3VVucDMv0FdYntjYmaw3=fMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKEEYRnDP36tKtn=rqXEdY3VVucDMv0FdYntjYmaw3=fMg@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Change to vsftpd recipe
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
X-List-Received-Date: Thu, 28 Nov 2013 18:24:34 -0000
X-Groupsio-MsgNum: 47305
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline

--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Diego,

[[oe] Change to vsftpd recipe] On 13.11.28 (Thu 15:08) Diego Sueiro wrote:

> Folks,
>=20
> I realized that when trying to connect via ftp to a target system (which
> has vsftpd installed) I should had to create the /var/run/vsftpd/empty
> directory before.
>=20
> Bellow is the patch to create the folder on vsftpd install task:
>=20
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bbb/meta=
-networking/recipes-daemons/vsftpd/
> vsftpd_3.0.0.bb
> index 49d5d2a..82466d1 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> @@ -70,6 +70,8 @@ do_install() {
>          sed -i "s:/lib/security:${base_libdir}/security:"
> ${D}${sysconfdir}/pam.d/vsftpd
>          sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsf=
tpd
>      fi
> +
> +    install -d ${D}${localstatedir}/run/vsftpd/empty
>  }
>=20
>  INITSCRIPT_PACKAGES =3D "${PN}"

Interesting.  I just recently merge 1c4921817, which points vsftpd at
/var/run/vsftpd/empty, but I haven't actually used vstftp as a server
since then so I didn't notice this problem.  When I tried re-creating
your proposed change I got the expected QA issues:

------------------------------------------------------------------------
ERROR: QA Issue: vsftpd: Files/directories were installed but not shipped
  /run
  /run/vsftpd
  /run/vsftpd/empty
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /home/builds/yocto-mainline/builds/met=
a-networking-build/tmp/work/core2-poky-linux/vsftpd/3.0.0-r0/temp/log.do_pa=
ckage.26442
ERROR: Task 10 (/home/builds/yocto-mainline/builds/meta-networking-build/..=
/../meta-oe/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb, do_pack=
age) failed with exit code '1'
------------------------------------------------------------------------

Care to take a run at reverting 1c4921817 in your tree and see if that
clears things up for you?  I'd do it myself but I'm waist-deep in a
different investigation right now and it sounds like you might be able
to do a quick test.

-J.

>=20
>=20
>=20
> Regards,
>=20
> --
> *dS
> Diego Sueiro
>=20
> /*long live rock 'n roll*/
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKXilcACgkQwFvcllog0Xw/OACcCjymCn66ozEWIbeTFllA9sw6
zCkAnAqR52DQtmB+BDJJgN/P7XpEFCW9
=TtCj
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
