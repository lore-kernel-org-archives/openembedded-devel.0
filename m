Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA8B6ACB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:38:03 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id h11so6169881wiw.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=49CcXwO7iRYS4EBed5vwEI+xGUWtRZ1yVhKP8DOK000=;
	b=UIrET8f15mRiLdTY4em5YMQT29tOMb0soyqmrGSwha+MQw2MH+ZSavZTmWaM75scG3
	4dzP6fVCgBRFpFrJRqh36cM/HxYL8FTChZrM4uouBQ77tHCne+jLvxMfHrhJ2cWZ9Om6
	ZZkmUl/p11Hjnv4SxV6ktuVDz+ktuzGwKRmBjX3UnWLJsMN2fb2GhU+DmQGFOqX9KeLb
	yVOZKO6jbwU+miNpQC0TxTiqMpGHrYAXdSXj46IbxKl5uXCPgC+hdCGdge97Mer6hgDt
	fALFVAxmiOwB0CAr+UzZ+lzn5/7J1YmYldZ5g3RkOJ7npILF4j9QD7q9BH2kRKdb/tH/
	AwvA==
X-Received: by 10.194.3.2 with SMTP id 2mr2474583wjy.89.1413279483582;
	Tue, 14 Oct 2014 02:38:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pm6sm19518501wjb.36.2014.10.14.02.38.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 02:38:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Oct 2014 11:39:51 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141014093951.GJ3000@jama>
References: <1411978974-17996-1-git-send-email-Chong.Lu@windriver.com>
	<5436338B.10408@windriver.com> <543CD8B2.2010805@windriver.com>
MIME-Version: 1.0
In-Reply-To: <543CD8B2.2010805@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] samba: add systemd service file
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
X-List-Received-Date: Tue, 14 Oct 2014 09:38:08 -0000
X-Groupsio-MsgNum: 52490
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t5NgoZwlhlUmGr82"
Content-Disposition: inline

--t5NgoZwlhlUmGr82
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2014 at 04:02:58PM +0800, Chong Lu wrote:
> ping

added in master-next, thanks for ping

>=20
> Best Regards
> Chong
>=20
> On 10/09/2014 03:04 PM, Chong Lu wrote:
> > ping
> >
> > //Chong
> >
> > On 09/29/2014 04:22 PM, Chong Lu wrote:
> >> Add systemd service for samba.
> >>
> >> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >> ---
> >>   meta-oe/recipes-connectivity/samba/samba.inc       | 32=20
> >> +++++++++++++++++++++-
> >>   .../recipes-connectivity/samba/samba/nmb.service   | 12 ++++++++
> >>   .../recipes-connectivity/samba/samba/smb.service   | 13 +++++++++
> >>   .../samba/samba/winbind.service                    | 12 ++++++++
> >>   4 files changed, 68 insertions(+), 1 deletion(-)
> >>   create mode 100644=20
> >> meta-oe/recipes-connectivity/samba/samba/nmb.service
> >>   create mode 100644=20
> >> meta-oe/recipes-connectivity/samba/samba/smb.service
> >>   create mode 100644=20
> >> meta-oe/recipes-connectivity/samba/samba/winbind.service
> >>
> >> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc=20
> >> b/meta-oe/recipes-connectivity/samba/samba.inc
> >> index 3da0562..4392821 100644
> >> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> >> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> >> @@ -8,11 +8,18 @@ SRC_URI =3D=20
> >> "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
> >>              file://init.samba \
> >>              file://init.winbind \
> >>              file://tdb.pc \
> >> +           file://nmb.service \
> >> +           file://smb.service \
> >> +           file://winbind.service \
> >>   "
> >>     S =3D "${WORKDIR}/samba-${PV}/source"
> >>   -inherit autotools-brokensep update-rc.d
> >> +inherit autotools-brokensep update-rc.d systemd
> >> +
> >> +SYSTEMD_PACKAGES =3D "${PN} winbind"
> >> +SYSTEMD_SERVICE_${PN} =3D "nmb.service smb.service"
> >> +SYSTEMD_SERVICE_winbind =3D "winbind.service"
> >>     SAMBAMMAP =3D "no"
> >>   SAMBAMMAP_libc-glibc =3D "yes"
> >> @@ -103,6 +110,29 @@ do_install_append() {
> >>         # usershare mount place
> >>       mkdir -p ${D}${localstatedir}/lib/samba/usershares
> >> +
> >> +    # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
> >> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false',=
=20
> >> 'true', d)}; then
> >> +        rm -rf ${D}${sysconfdir}/init.d/
> >> +    fi
> >> +
> >> +    install -d ${D}${systemd_unitdir}/system
> >> +    for i in nmb smb winbind; do
> >> +        install -m 0644 ${WORKDIR}/$i.service=20
> >> ${D}${systemd_unitdir}/system
> >> +    done
> >> +    sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
> >> +        -e 's,@SBINDIR@,${sbindir},g' \
> >> +        -i ${D}${systemd_unitdir}/system/*.service
> >> +}
> >> +
> >> +DEPENDS_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',=20
> >> 'systemd', 'systemd-systemctl-native', '', d)}"
> >> +pkg_postinst_${PN} () {
> >> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit',=20
> >> 'true', 'false', d)}; then
> >> +        if [ -n "$D" ]; then
> >> +            OPTS=3D"--root=3D$D"
> >> +        fi
> >> +        systemctl $OPTS mask samba.service
> >> +    fi
> >>   }
> >>     pkg_postinst_libnss-winbind () {
> >> diff --git a/meta-oe/recipes-connectivity/samba/samba/nmb.service=20
> >> b/meta-oe/recipes-connectivity/samba/samba/nmb.service
> >> new file mode 100644
> >> index 0000000..91b9975
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/samba/samba/nmb.service
> >> @@ -0,0 +1,12 @@
> >> +[Unit]
> >> +Description=3DSamba NMB Daemon
> >> +After=3Dsyslog.target network.target
> >> +
> >> +[Service]
> >> +Type=3Dforking
> >> +PIDFile=3D/var/run/nmbd.pid
> >> +ExecStart=3D@SBINDIR@/nmbd
> >> +ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID
> >> +
> >> +[Install]
> >> +WantedBy=3Dmulti-user.target
> >> diff --git a/meta-oe/recipes-connectivity/samba/samba/smb.service=20
> >> b/meta-oe/recipes-connectivity/samba/samba/smb.service
> >> new file mode 100644
> >> index 0000000..bc0707a
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/samba/samba/smb.service
> >> @@ -0,0 +1,13 @@
> >> +[Unit]
> >> +Description=3DSamba SMB Daemon
> >> +After=3Dsyslog.target network.target nmb.service winbind.service
> >> +
> >> +[Service]
> >> +Type=3Dforking
> >> +PIDFile=3D/var/run/smbd.pid
> >> +LimitNOFILE=3D16384
> >> +ExecStart=3D@SBINDIR@/smbd
> >> +ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID
> >> +
> >> +[Install]
> >> +WantedBy=3Dmulti-user.target
> >> diff --git a/meta-oe/recipes-connectivity/samba/samba/winbind.service=
=20
> >> b/meta-oe/recipes-connectivity/samba/samba/winbind.service
> >> new file mode 100644
> >> index 0000000..bff6fb8
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/samba/samba/winbind.service
> >> @@ -0,0 +1,12 @@
> >> +i[Unit]
> >> +Description=3DSamba Winbind Daemon
> >> +After=3Dsyslog.target network.target nmb.service
> >> +
> >> +[Service]
> >> +Type=3Dforking
> >> +PIDFile=3D/var/run/winbindd.pid
> >> +ExecStart=3D@SBINDIR@/winbindd
> >> +ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID
> >> +
> >> +[Install]
> >> +WantedBy=3Dmulti-user.target
> >
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t5NgoZwlhlUmGr82
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ872cACgkQN1Ujt2V2gByeEgCgg+v75wEFhV9GyZqYYJVhLIdC
k2cAn2IKpSD6VXJSr9QQo6n7aqirEw5Z
=E7BA
-----END PGP SIGNATURE-----

--t5NgoZwlhlUmGr82--
