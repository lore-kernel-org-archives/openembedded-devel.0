Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id C948D77A60
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 08:50:15 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id k23so2914251uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=imqyeu6TsyFZRZ0LxkPubBc86Sbu/gRCrRz8NYwcfNU=;
	b=JcVTDLOck7XjxYs2x0A83FnXLVyNHL211qDrvc9OCW9Eu3I5b/4jgb54zT65jHa6f4
	b4w8vzksnAJcdFkV5QXg4TOFmUAoj1KnxR+dbABgLaWZx5WoPN64dfNy5Yrvl9VSGXYf
	zuoQfxX1CpeXmqVseWQFPaKv3Oav7HWvBlmuof2fd2WE0LdR2MwEl73H4Y76EeKDctUf
	UG5gkBCLFrLHZr8zxJWI6YmA91LRERpe1X7+MLcknxuCuFx1Zq8QlGk1bJega9yXMdn9
	oftdRRsmd+HGqDrXKTNznDU3iAPtIVtcivBi7tUhJwf3sgrelDu4R4WLaomAXeOfcnsK
	fYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=imqyeu6TsyFZRZ0LxkPubBc86Sbu/gRCrRz8NYwcfNU=;
	b=XgqBlXJf2F9Xnbux/Cy3kMD9M/bJwCa7m5Vc4DjL9g2CPxI3BT4J7ATJKVKbtz228A
	sQz0AYR9hVxFd4J/qwg4VJMZ126J7MjYPbVWIuZOG94rDUpEnZYHt0um33kgXBZAFCu5
	6paX6nOiKjPl1i8h2udgx7lxXdsXy5L3KpMF1WorZWPHk8rB7tHacwAviIV3Hnsb3mG4
	n6jagYFB2vq/TGEXToXQNVj0QBwIaMJYcs4aS1eQZtpXUKKF7pBFQtGe7RMHBQvU8Cg9
	28aknsr0Mt3zRa2AzuTdWQFWsZNTSSzJnHuIqk6nIhpxz/L6e42haUQUsxu6j6ikphOo
	37Qw==
X-Gm-Message-State: AHPjjUjFig6Js9jtSUoysWURuj4gFan3ny/pbuWbYRxbS5ux6ZdECoIa
	R4iE/uoZwdv97tWkRf9+TyzKvwO/JA==
X-Google-Smtp-Source: ADKCNb7VBKpvwxa7GSa+QapjQXvwALaz5857sweHN5TMU0DOBDgx9vBZGR4t2NRpy3e7BLmOYidT6FhFO9vRNwtZQmM=
X-Received: by 10.176.75.25 with SMTP id h25mr1279315uaf.102.1504774216593;
	Thu, 07 Sep 2017 01:50:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Thu, 7 Sep 2017 01:50:16 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B8994A7@ALA-MBC.corp.ad.wrs.com>
References: <cover.1503998700.git.jackie.huang@windriver.com>
	<6286ca12b20fb1972ee77d1fc217eb7ebbf60080.1503998700.git.jackie.huang@windriver.com>
	<CA+chaQcm0g_6Di-h93_Kn=v6i+h+C1D6HtaVFFaZuwbgrsfkWQ@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B894A6D@ALA-MBC.corp.ad.wrs.com>
	<CAMKF1srJm5Y4UonABYcOmD7MP6ocnWnpoktNwCbr7oV6m5eA5w@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B8994A7@ALA-MBC.corp.ad.wrs.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Sep 2017 10:50:16 +0200
Message-ID: <CA+chaQc63u9yE2rU=WmcfuCk-vdwDAYh6vvJtdbqiBO_ncGd2A@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] corosync: add support for extra features
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
X-List-Received-Date: Thu, 07 Sep 2017 08:50:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Are you building for qemux86-64?

This issue is being reported since 2015, but always in qemux86-64 builds:
https://www.google.cz/search?q=3Dopenembedded+corosync+textrel&oq=3Dopenemb=
edded+corosync+textrel

On Thu, Sep 7, 2017 at 3:02 AM, Huang, Jie (Jackie) <
Jackie.Huang@windriver.com> wrote:

>
>
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Wednesday, September 06, 2017 09:09
> > To: Huang, Jie (Jackie)
> > Cc: Martin Jansa; openembedded-devel
> > Subject: Re: [oe] [meta-oe][PATCH 2/2] corosync: add support for extra
> > features
> >
> > include security-flags.inc file in distro config. if you use poky for
> > distro then set DISTRO=3Dpoky-lsb and you will be able to reproduce it
>
> Unfortunately I still can't reproduce it with DISTRO=3Dpoky-lsb, do I mis=
s
> anything else?
>
> Thanks,
> Jackie
>
> >
> > On Tue, Sep 5, 2017 at 6:01 PM, Huang, Jie (Jackie)
> > <Jackie.Huang@windriver.com> wrote:
> > > Yes, sure, but I can=E2=80=99t reproduce this, could you show me the =
config
> that had
> > this issue? Thanks!
> > >
> > > Thanks,
> > > Jackie
> > >
> > > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > > Sent: Tuesday, September 05, 2017 20:30
> > > To: Huang, Jie (Jackie)
> > > Cc: openembedded-devel
> > > Subject: Re: [oe] [meta-oe][PATCH 2/2] corosync: add support for extr=
a
> > features
> > >
> > > Can you please also fix:
> > > corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/
> corosync/2.4.2-
> > r0/packages-split/corosync/usr/sbin/corosync' has relocations in .text
> [textrel]
> > >
> > > it's been there for long time.
> > >
> > > On Tue, Aug 29, 2017 at 11:27 AM,
> > <jackie.huang@windriver.com<mailto:jackie.huang@windriver.com>> wrote:
> > > From: Jackie Huang
> > <jackie.huang@windriver.com<mailto:jackie.huang@windriver.com>>
> > >
> > > * Add support for features: dbus qdevice qnetd snmp
> > > * Add related PACKAGECONFIG
> > > * inherit useradd to add proper user for qnetd service
> > >
> > > Signed-off-by: Jackie Huang
> > <jackie.huang@windriver.com<mailto:jackie.huang@windriver.com>>
> > > ---
> > >  .../recipes-extended/corosync/corosync_2.4.2.bb<http://
> corosync_2.4.2.bb>
> > | 30 +++++++++++++++++++---
> > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-
> > extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.bb> b/meta-
> > oe/recipes-extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.bb=
>
> > > index 2f3aef299..7d5a87e4c 100644
> > > --- a/meta-oe/recipes-
> > extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.bb>
> > > +++ b/meta-oe/recipes-
> > extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.bb>
> > > @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://corosync.github.io/corosync/"
> > >
> > >  SECTION =3D "base"
> > >
> > > -inherit autotools pkgconfig systemd
> > > +inherit autotools pkgconfig systemd useradd
> > >
> > >  SRC_URI =3D
> > "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz<
> http://build.cluster
> > labs.org/corosync/releases/$%7bBP%7d.tar.gz>"
> > >  SRC_URI[md5sum] =3D "547fa78704da53aa35912be58d31035f"
> > > @@ -16,13 +16,23 @@ LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Da85eb4ce24033adb6088dd1d6ffc5e5d<file:///\\LICENS=
E;m
> > d5=3Da85eb4ce24033adb6088dd1d6ffc5e5d>"
> > >
> > >  DEPENDS =3D "groff-native nss libqb"
> > >
> > > -SYSTEMD_SERVICE_${PN} =3D "corosync.service corosync-notifyd.service=
"
> > > +SYSTEMD_SERVICE_${PN} =3D "corosync.service corosync-notifyd.service=
 \
> > > +
> > ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.contains('PACK=
A
> > GECONFIG>', 'qdevice', 'corosync-qdevice.service', '', d)} \
> > > +
> > ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.contains('PACK=
A
> > GECONFIG>', 'qnetd', 'corosync-qnetd.service', '', d)} \
> > > +"
> > >  SYSTEMD_AUTO_ENABLE =3D "enable"
> > >
> > >  INITSCRIPT_NAME =3D "corosync-daemon"
> > >
> > > -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd'=
,
> > d)}<mailto:$%7b@bb.utils.filter('DISTRO_FEATURES',%20'
> systemd',%20d)%7d>"
> > > +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd'=
,
> d)} \
> > > +                   dbus qdevice qnetd snmp \
> > >
> > +<mailto:$%7b@bb.utils.filter('DISTRO_FEATURES',%20'systemd',%20d)%7d%2=
0
> > \%0b+ %20 %20 %20 %20 %20 %20 %20 %20 %20
> > dbus%20qdevice%20qnetd%20snmp%20\%0b+>"
> > >
> > > +PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
> > > +PACKAGECONFIG[qdevice] =3D "--enable-qdevices,--disable-qdevices"
> > > +PACKAGECONFIG[qnetd] =3D "--enable-qnetd,--disable-qnetd"
> > > +PACKAGECONFIG[rdma] =3D "--enable-rdma,--disable-rdma"
> > > +PACKAGECONFIG[snmp] =3D "--enable-snmp,--disable-snmp,net-snmp"
> > >  PACKAGECONFIG[systemd] =3D "--enable-systemd --with-
> > systemddir=3D${systemd_system_unitdir},--disable-systemd --without-
> > systemddir,systemd"
> > >
> > >  EXTRA_OECONF =3D "ac_cv_path_BASHPATH=3D${base_bindir}/bash"
> > > @@ -43,12 +53,26 @@ do_install_append() {
> > >      install -d ${D}${sysconfdir}/default/volatiles
> > >      echo "d root root 0755 ${localstatedir}/log/cluster none" >
> > ${D}${sysconfdir}/default/volatiles/05_corosync
> > >
> > > +    if
> > ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.contains('PACK=
A
> > GECONFIG>', 'qnetd', 'true', 'false', d)}; then
> > > +        chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
> > > +        echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd
> none" >>
> > ${D}${sysconfdir}/default/volatiles/05_corosync
> > > +    fi
> > > +
> > >      if
> > ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','
> false',d)}<mailto:$%7
> > b@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)%7d>;
> then
> > >          install -d ${D}${sysconfdir}/tmpfiles.d
> > >          echo "d ${localstatedir}/log/cluster - - - -" >
> > ${D}${sysconfdir}/tmpfiles.d/corosync.conf
> > > +
> > > +        if
> > ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.contains('PACK=
A
> > GECONFIG>', 'qnetd', 'true', 'false', d)}; then
> > > +            install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf
> > ${D}${sysconfdir}/tmpfiles.d
> > > +        fi
> > >      fi
> > >  }
> > >
> > >  RDEPENDS_${PN} +=3D "bash"
> > >
> > >  FILES_${PN}-dbg +=3D "${libexecdir}/lcrso/.debug"
> > > +FILES_${PN}-doc +=3D "${datadir}/snmp/mibs/COROSYNC-MIB.txt"
> > > +
> > > +USERADD_PACKAGES =3D "${PN}"
> > > +GROUPADD_PARAM_${PN} =3D "--system coroqnetd"
> > > +USERADD_PARAM_${PN} =3D "--system -d / -M -s /bin/nologin -c 'User f=
or
> > corosync-qnetd' -g coroqnetd coroqnetd"
> > > --
> > > 2.11.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org<mailto:Openembedded-
> > devel@lists.openembedded.org>
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

