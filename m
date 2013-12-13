Return-Path: <joe@deserted.net>
Received: from mail-qe0-f54.google.com (mail-qe0-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id BF595610D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:34:41 +0000 (UTC)
Received: by mail-qe0-f54.google.com with SMTP id cy11so1601281qeb.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=8k7wSmi2/ysIpEgCVqFn/4ChSCpYRZkdbC6xuxtSPnI=;
	b=ckAupzcXoC2A8rkksZ2+Bh2crJXAWXLHVlmPp6+mEz6CX0aIRWxT9jkrCSgOFulezb
	ZDI7b3KUUPLpUeEbp759U86pYXM/KQAqAiMCe+uAmnqznLycNTjbgLnJM/2eg5NNrt0b
	z+69EkMaNVHKGuNRTyAB6itgSZA8l8BYqcdr6opQiGKyA6U8iVZBF90us2QoQkH0cJLi
	xspRueG9dtmyhb7uuQlVNRm5j8ReXJs5q2VmvtS4CZYVrjWwcUjLFbM+JPS/5XCn0R4g
	liQI2cslrjydn6QHv1bur91FMcx8GqZKcrVWluQCpvkMnEqIysggRtU8kG4Ier8+oCRt
	40KQ==
X-Gm-Message-State: ALoCoQnIxz/adKojJTWtLtV20KLXDsWo0PqPIFaR5O/CzicrGVNpiATPU76MEjhU+hJkb5MwH8ew
X-Received: by 10.49.25.16 with SMTP id y16mr5337067qef.20.1386945280918;
	Fri, 13 Dec 2013 06:34:40 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id a5sm7795792qae.2.2013.12.13.06.34.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 06:34:39 -0800 (PST)
Date: Fri, 13 Dec 2013 09:34:36 -0500
From: Joe MacDonald <joe@deserted.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131213143433.GB4683@deserted.net>
References: <1386874857-8596-1-git-send-email-joe@deserted.net>
	<27197377.bBKUcS7Jmv@helios>
MIME-Version: 1.0
In-Reply-To: <27197377.bBKUcS7Jmv@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] vsftpd: install volatiles file based on init system
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
X-List-Received-Date: Fri, 13 Dec 2013 14:34:42 -0000
X-Groupsio-MsgNum: 47454
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline

--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] vsftpd: install volatiles file based on =
init system] On 13.12.13 (Fri 10:33) Paul Eggleton wrote:

> Hi Joe,
>=20
> On Thursday 12 December 2013 14:00:57 Joe MacDonald wrote:
> > The sysvinit populate-volatile.sh scans for volatiles in
> > /etc/default/volatiles.  systemd expects the same format files to live =
in
> > /etc/tmpfiles.d.  Depedning on the DISTRO_FEATURE list, install vsftpd's
> > volatiles file to the expected location.  While we're here, drop the
> > creation of the empty ${localstatedir}/run/ hierarchy since they should=
 be
> > created by the volatiles processing.
> >=20
> > Signed-off-by: Joe MacDonald <joe@deserted.net>
> > ---
> >  meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb |   10 +++++++-=
--
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> > b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb index
> > 0698a63..9d82fd7 100644
> > --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> > +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> > @@ -59,8 +59,13 @@ do_install() {
> >      install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
> >      install -d ${D}${sysconfdir}/init.d/
> >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
> > -    install -d ${D}/${sysconfdir}/default/volatiles
> > -    install -m 644 ${WORKDIR}/volatiles.99_vsftpd
> > ${D}/${sysconfdir}/default/volatiles/99_vsftpd +    if
> > ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; th=
en +
> >        install -d ${D}/${sysconfdir}/tmpfiles.d
> > +        install -m 644 ${WORKDIR}/volatiles.99_vsftpd
> > ${D}/${sysconfdir}/tmpfiles.d/99_vsftpd +    else
> > +        install -d ${D}/${sysconfdir}/default/volatiles
> > +        install -m 644 ${WORKDIR}/volatiles.99_vsftpd
> > ${D}/${sysconfdir}/default/volatiles/99_vsftpd +    fi
> >=20
> >      install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
> >      install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
> > @@ -70,7 +75,6 @@ do_install() {
> >          sed -i "s:/lib/security:${base_libdir}/security:"
> > ${D}${sysconfdir}/pam.d/vsftpd sed -i "s:ftpusers:vsftpd.ftpusers:"
> > ${D}${sysconfdir}/pam.d/vsftpd fi
> > -    install -d ${D}${localstatedir}/run/vsftpd/empty
> >  }
> >=20
> >  INITSCRIPT_PACKAGES =3D "${PN}"
>=20
> I think there might be a problem with this: the DISTRO_FEATURES options a=
ren't=20
> mutually exclusive - both can be enabled at the same time (usually where =
you=20
> want sysvinit for some rescue/initramfs image and systemd for the main im=
age).

Hey Paul,

That's a good point and I probably should've at least made mention of it
in my email.  I'd thought about it (thought I try to only have either
sysvinit or systemd enabled in a configuration at a time, multiple init
systems running concurrently make my teeth itch) but I had thought that
in this case vsftpd would only be relying on one of them (preferring
systemd if available) to create the volatiles.  Since I try very hard
not to be in the scenario where I include both, though, I could be
overlooking a case here.  Do you think I should be doing something more
like this:

 62    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d=
)}; then
 63        install -d ${D}/${sysconfdir}/tmpfiles.d
 64        install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}=
/tmpfiles.d/99_vsftpd
 65    fi
 66    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', =
d)}; then
 67        install -d ${D}/${sysconfdir}/default/volatiles
 68        install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}=
/default/volatiles/99_vsftpd
 69    fi

--=20
-Joe MacDonald.
:wq

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKrGvkACgkQwFvcllog0XyFUgCfchCd6Rq2NMm3hQby0nIR9pQL
WU4An3DruKgFe7sr9JE2fIvtlHgUnpRz
=7upX
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
