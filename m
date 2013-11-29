Return-Path: <joe@deserted.net>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 129DB6B5D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 16:06:55 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id x13so16810950ief.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 08:06:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=IZ4HK4Bk/zpWE5GrvMPM/3qDBJuH7VU27QPJ5bonV4I=;
	b=VbntaX053Cq4f7HoUIONV6o/zG60EDp2PjqWKo1vKq0q3ZOzk99r2iwqpLHd6vx0S1
	PWxqJPMSdeTW0aen8lSxr0mBVE5EOEnMTb7/pdX5djme01ahvoUVoEJz0ikZjIk3IwDo
	D5SIFO2XbTgLcQgtF/tOCVR9Rb9u0aGLFMnm4EdZIfh34oLNaeHSRFrs1zv144WkMd7U
	26DhAbnRJkOYbuyy96Zbp6RhJBuEwQzj3g5hgPWHRCPTL5PYNyju6dmbaKwkNvMfi/wu
	3od2fhM0ZsPKzKXvESi87/sflP4xTH8ItNCp8wXTy3EIFXuSNQPUM0wrCFhabFNMn/fq
	rklw==
X-Gm-Message-State: ALoCoQmyveWARPgHwdUcN2IHuZ+zz+5FVKBzrFFiW+cZ8tO+GnPfLz5Jt+ikzNKoYnEsaLcEB5+w
X-Received: by 10.50.41.70 with SMTP id d6mr7033476igl.1.1385741214724;
	Fri, 29 Nov 2013 08:06:54 -0800 (PST)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	v2sm51579677igz.3.2013.11.29.08.06.53 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Nov 2013 08:06:53 -0800 (PST)
Date: Fri, 29 Nov 2013 11:06:51 -0500
From: Joe MacDonald <joe@deserted.net>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20131129160650.GB3940@deserted.net>
References: <CAMCfZKEEYRnDP36tKtn=rqXEdY3VVucDMv0FdYntjYmaw3=fMg@mail.gmail.com>
	<20131128182423.GC3724@deserted.net>
	<CAMCfZKFLW-FzmEDdquj2+H8ePnOOAZDGpoRPV+CPhD_VvzDW7Q@mail.gmail.com>
	<20131128190221.GD3724@deserted.net>
	<CAMCfZKGaTKreSQmLcmNMbUD0TeGWhCbFidBwUKq0SAPEAskeeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKGaTKreSQmLcmNMbUD0TeGWhCbFidBwUKq0SAPEAskeeA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 29 Nov 2013 16:06:55 -0000
X-Groupsio-MsgNum: 47315
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline

--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] Change to vsftpd recipe] On 13.11.28 (Thu 20:02) Diego Sueiro wro=
te:

> Joe,
>=20
> Looking at your commit, you are populating "/var/run/vsftpd/empty" using
> the file "/etc/default/volatiles/99_vsftpd". This file is used in a
> sysVinit system.
>=20
> Since I'm using systemd, I believe that "/etc/default/volatiles/" is not
> scanned by Yocto as you can see here:
> http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-core/initscr=
ipts/initscripts-1.0/populate-volatile.sh
>=20
> So, I think we need an universal solution.

Good point, and now that you mention it, I don't think this is the first
time this has come up.  Though last time around I think it was relating
to automatically cleaning up systemd's service directories on systems
that do not use systemd.

I'm still engaged in a bit of other debug stuff right now, so if you've
got a proposal for this one, please feel free.  Otherwise I'll ping you
when I get back to look at this.

Thanks,
-J.

>=20
> Regards,
>=20
> --
> *dS
> Diego Sueiro
>=20
> /*long live rock 'n roll*/
>=20
>=20
> On Thu, Nov 28, 2013 at 5:02 PM, Joe MacDonald <joe@deserted.net> wrote:
>=20
> > [Re: [oe] Change to vsftpd recipe] On 13.11.28 (Thu 16:52) Diego Sueiro
> > wrote:
> >
> > > On Thu, Nov 28, 2013 at 4:24 PM, Joe MacDonald <joe@deserted.net> wro=
te:
> > >
> > > > Care to take a run at reverting 1c4921817 in your tree and see if t=
hat
> > > > clears things up for you?  I'd do it myself but I'm waist-deep in a
> > > > different investigation right now and it sounds like you might be a=
ble
> > > > to do a quick test.
> > > >
> > >
> > > Joe,
> > >
> > > I did not get this QA error.
> > > The installed directory should be "/var/run/vsftpd/empty" and not
> > > "/run/vsftpd/empty" as pointed on error message.
> > > Did you added "install -d ${D}${localstatedir}/run/vsftpd/empty" on
> > > do_install function?
> >
> > Yep, here's the modified do_install in its entirety:
> >
> > ------------------------------------------------------------------------
> > do_install() {
> >     install -d ${D}${sbindir}
> >     install -d ${D}${mandir}/man8
> >     install -d ${D}${mandir}/man5
> >     oe_runmake 'DESTDIR=3D${D}' install
> >     install -d ${D}${sysconfdir}
> >     install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
> >     install -d ${D}${sysconfdir}/init.d/
> >     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
> >     install -d ${D}/${sysconfdir}/default/volatiles
> >     install -m 644 ${WORKDIR}/volatiles.99_vsftpd
> > ${D}/${sysconfdir}/default/volatiles/99_vsftpd
> >
> >     install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
> >     install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
> >     if ! test -z "${PAMLIB}" ; then
> >         install -d ${D}${sysconfdir}/pam.d/
> >         cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
> >         sed -i "s:/lib/security:${base_libdir}/security:"
> > ${D}${sysconfdir}/pam.d/vsftpd
> >         sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vs=
ftpd
> >     fi
> >     install -d ${D}${localstatedir}/run/vsftpd/empty
> > }
> > ------------------------------------------------------------------------
> >
> > -J.
> >
> > >
> > > Regards,
> > >
> > > --
> > > *dS
> > > Diego Sueiro
> > >
> > > /*long live rock 'n roll*/
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > -Joe MacDonald.
> > :wq
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKYu48ACgkQwFvcllog0XxUkwCfaJF3YNaIzUTt72v+BXdCdm6S
WdkAoJyUh6Ztnqlc6vd0e+avhS5GTsZL
=kwbV
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
