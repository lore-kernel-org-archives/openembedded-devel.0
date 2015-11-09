Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87BC176E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 03:30:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA93UaZC017022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Nov 2015 19:30:36 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.247]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Sun, 8 Nov 2015 19:30:35 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] samba: fix the incorrect tmpfiles
	installed directory
Thread-Index: AQHRGLVdUSivVbCGhUKHFd8ycVkVw56TDHGg
Date: Mon, 9 Nov 2015 03:30:34 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C719AB0@ALA-MBA.corp.ad.wrs.com>
References: <1446464931-351-1-git-send-email-jackie.huang@windriver.com>
	<20151106170546.GE2550@jama>
In-Reply-To: <20151106170546.GE2550@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] samba: fix the incorrect tmpfiles installed directory
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
X-List-Received-Date: Mon, 09 Nov 2015 03:30:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Saturday, November 07, 2015 1:06 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] samba: fix the incorrect tmpfiles inst=
alled directory
>=20
> On Mon, Nov 02, 2015 at 07:48:51PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > - The tmpfiles are always installed in /usr/lib
> >   even for multilib.
> > - It makes no sense to have two tmpfiles in both
> >   /usr/lib/tmpfiles.d and /etc/tmpfiles.d, install
> >   it as one in /etc/tmpfiles.d.
>=20
> Please rebase on latest master and resend.

Rebased and resent.

Thanks,
Jackie

>=20
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb b/meta-=
oe/recipes-
> connectivity/samba/samba_4.1.12.bb
> > index 22c2bb4..45fdaa7 100644
> > --- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
> > +++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
> > @@ -94,18 +94,16 @@ do_install_append() {
> >              -e 's,@SBINDIR@,${sbindir},g' \
> >              -i ${D}${systemd_unitdir}/system/*.service
> >
> > -	install -d ${D}${sysconfdir}/tmpfiles.d
> > -	echo "d ${localstatedir}/log/samba 0755 root root -" \
> > -            > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
> > +        install -d ${D}${sysconfdir}/tmpfiles.d
> > +        install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdi=
r}/tmpfiles.d/samba.conf
> > +        echo "d ${localstatedir}/log/samba 0755 root root -" \
> > +            >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
> >      fi
> >
> >      install -d ${D}${sysconfdir}/samba
> >      echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
> >      install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.c=
onf
> >
> > -    install -d ${D}${libdir}/tmpfiles.d
> > -    install -m644 packaging/systemd/samba.conf.tmp ${D}${libdir}/tmpfi=
les.d/samba.conf
> > -
> >      install -d ${D}${sysconfdir}/sysconfig/
> >      install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/=
sysconfig/samba
> >  }
> > @@ -114,7 +112,6 @@ PACKAGES +=3D "${PN}-python ${PN}-python-dbg ${PN}-=
pidl libwinbind
> libwinbind-dbg
> >
> >  FILES_${PN} +=3D "/run \
> >                  ${libdir}/security/pam_smbpass.so \
> > -                ${libdir}/tmpfiles.d/* \
> >                 "
> >
> >  SMB_SERVICE=3D"${systemd_unitdir}/system/nmb.service ${systemd_unitdir=
}/system/smb.service"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

