Return-Path: <joe@deserted.net>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id E3B816D8D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 19:02:25 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k4so1047267qaq.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 11:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=xPqSTCCBl53zzO+AhQdK6WqkttYMQ7dfkt2YHhBZpqg=;
	b=d+ISE8VCA2gIR9Cen0Nyw1wuTnxIxHVLp+X+FZ7U13Sg0Erfa/L5bidmEi1zrnNphI
	mGKtHv8EWmSkuBO7Qeoj6eM3pZO6sOnyUpk2l8/M08FV82jM5iRiTEtSbJn9sGje11IO
	e45nQmQs2ru2WhH7QZWexYDXeCw3xEdikJ7enSk5IKnlYaHw+6WvSRaJ5JEUrZt5PY8C
	ySBFeduZiSa6Z/h993K3dEnbt7ZVjkpwBX3kgk6uvE82A1HC8xBee/he9VcT89ipXhIC
	olhVt5G0uo3a5RBpIkLnz443d4m8k/mRLvjhvdDv6ya02TDjpt8F5PUpzpQEKPk7fu46
	iogw==
X-Gm-Message-State: ALoCoQkWkRTXUC7iXRNgJq004AtixpX7bBj3z1oPaDMidOjtvPhteeeVKr5K+18S2MQH951ZdRUo
X-Received: by 10.49.76.7 with SMTP id g7mr49821844qew.25.1385665344969;
	Thu, 28 Nov 2013 11:02:24 -0800 (PST)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	p20sm108082200qay.0.2013.11.28.11.02.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Nov 2013 11:02:24 -0800 (PST)
Date: Thu, 28 Nov 2013 14:02:22 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131128190221.GD3724@deserted.net>
References: <CAMCfZKEEYRnDP36tKtn=rqXEdY3VVucDMv0FdYntjYmaw3=fMg@mail.gmail.com>
	<20131128182423.GC3724@deserted.net>
	<CAMCfZKFLW-FzmEDdquj2+H8ePnOOAZDGpoRPV+CPhD_VvzDW7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFLW-FzmEDdquj2+H8ePnOOAZDGpoRPV+CPhD_VvzDW7Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Nov 2013 19:02:26 -0000
X-Groupsio-MsgNum: 47307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Content-Disposition: inline

--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] Change to vsftpd recipe] On 13.11.28 (Thu 16:52) Diego Sueiro wro=
te:

> On Thu, Nov 28, 2013 at 4:24 PM, Joe MacDonald <joe@deserted.net> wrote:
>=20
> > Care to take a run at reverting 1c4921817 in your tree and see if that
> > clears things up for you?  I'd do it myself but I'm waist-deep in a
> > different investigation right now and it sounds like you might be able
> > to do a quick test.
> >
>=20
> Joe,
>=20
> I did not get this QA error.
> The installed directory should be "/var/run/vsftpd/empty" and not
> "/run/vsftpd/empty" as pointed on error message.
> Did you added "install -d ${D}${localstatedir}/run/vsftpd/empty" on
> do_install function?

Yep, here's the modified do_install in its entirety:

------------------------------------------------------------------------
do_install() {
    install -d ${D}${sbindir}
    install -d ${D}${mandir}/man8
    install -d ${D}${mandir}/man5
    oe_runmake 'DESTDIR=3D${D}' install
    install -d ${D}${sysconfdir}
    install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
    install -d ${D}${sysconfdir}/init.d/
    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
    install -d ${D}/${sysconfdir}/default/volatiles
    install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/defaul=
t/volatiles/99_vsftpd

    install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
    install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
    if ! test -z "${PAMLIB}" ; then
        install -d ${D}${sysconfdir}/pam.d/
        cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
        sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}=
/pam.d/vsftpd
        sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
    fi
    install -d ${D}${localstatedir}/run/vsftpd/empty
}
------------------------------------------------------------------------

-J.

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

--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKXkz0ACgkQwFvcllog0Xy0CQCgsb99ZVv2jSG2iBEiDP3V0elt
4QUAmgJ3ep8hxDZYRc8Hvyzt7Pnzpdps
=Mh49
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--
