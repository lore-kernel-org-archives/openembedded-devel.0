Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB5A2719E2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 03:51:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g13so820185pfm.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 20:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zPu0fpG1ODli3EobILpRQbTaMkuih66sy3RVbjXvoUE=;
	b=ss72/4eIzHK7MQJ7embx9tdoORKWNWRPtG2mbduWCmCrzdkc/pG9fe+dblgc9SecRx
	8xc/s3z7CoL5urkiuwPiYxIY3svE14kW61sduHUr1qwXmZ0hALIjcxLO9dyWvHU7Uatj
	bp4TBZjVmLa5dg5HaBhu4UFaXc/ryKOhBkWfBrzUx1Lma0oiqj9J/XQw7YcbTQCDkDlo
	qCPMzfuwlECdQBh/FN7vdG0iIicrI304DgNEC0MarIsb1o8LdqHF/Uqfmg6nj8Ezlp7R
	qfZcUKMivMghO0UbSFUoXQQDvbbhzG6oO+cC4M03sF8UaWrxAL2sFJyj49SumQQgNTld
	xb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zPu0fpG1ODli3EobILpRQbTaMkuih66sy3RVbjXvoUE=;
	b=QVxd2WRk3mOd/wA8HRy3s1ZUiyfQCVn3MgZFA1oRFrNMBhgRn1mDZKQ+0CzXkcznYr
	Poqev9M/iAVyeHoG1mKBCjY3lNq+9eoFEhsvPyOPWu9r+t99eRUzkFEoepzGElTdL2t7
	sYrpAAD96W6ZMGwmJ0xTGgPP3Lt5vJ5JMiQffP87yvC+NqxLNunGkYQdIJeh6BRlOpcL
	SRCQyVQBtF8Wr+ijyMfJPJpkWn/GBEX4eyS29Ou5ZzsjTbh6nHXAav4eHcPHpxzv3PQ5
	kklCVbqgkndrwA2/rjFR4m1xlyLktF4wbndAWefTBXkUy26dk426rDzM5vLbChnVGeqN
	cxfw==
X-Gm-Message-State: AHPjjUj4aOULLdHZ7WivDByuD4EEqGiBlxtr6UIVMh8oyIr2vtppNRIX
	zVYb1q0j667yk4xhKl2+vTktiUsprlVud7Qaumw=
X-Google-Smtp-Source: ADKCNb5VLeBMyMfZjhCytNNycwyASNPRhlEo8/liSUtyOMCevo+bYlrUxaKNAki6W6hlCG0BpPKi6nuOXm18LQtClrc=
X-Received: by 10.99.44.86 with SMTP id s83mr1673033pgs.341.1504842673892;
	Thu, 07 Sep 2017 20:51:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Thu, 7 Sep 2017 20:50:43 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B89BE74@ALA-MBC.corp.ad.wrs.com>
References: <cover.1503998700.git.jackie.huang@windriver.com>
	<6286ca12b20fb1972ee77d1fc217eb7ebbf60080.1503998700.git.jackie.huang@windriver.com>
	<CA+chaQcm0g_6Di-h93_Kn=v6i+h+C1D6HtaVFFaZuwbgrsfkWQ@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B894A6D@ALA-MBC.corp.ad.wrs.com>
	<CAMKF1srJm5Y4UonABYcOmD7MP6ocnWnpoktNwCbr7oV6m5eA5w@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B8994A7@ALA-MBC.corp.ad.wrs.com>
	<CA+chaQc63u9yE2rU=WmcfuCk-vdwDAYh6vvJtdbqiBO_ncGd2A@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B89BE74@ALA-MBC.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2017 20:50:43 -0700
Message-ID: <CAMKF1sry2E+H9DkzhhcAzq4LAmQB1xodYLkMFpP3iOsUmg7Lng@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 03:51:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you set

LDFLAGS +=3D "-fuse-ld=3Dgold"

and see if that reproduces it

On Thu, Sep 7, 2017 at 7:37 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
> Yes, I built for qemux86-64, but never see this issue.
>
>
>
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Thursday, September 07, 2017 16:50
> To: Huang, Jie (Jackie)
> Cc: Khem Raj; openembedded-devel
>
>
> Subject: Re: [oe] [meta-oe][PATCH 2/2] corosync: add support for extra
> features
>
>
>
> Are you building for qemux86-64?
>
>
>
> This issue is being reported since 2015, but always in qemux86-64 builds:
>
> https://www.google.cz/search?q=3Dopenembedded+corosync+textrel&oq=3Dopene=
mbedded+corosync+textrel
>
>
>
> On Thu, Sep 7, 2017 at 3:02 AM, Huang, Jie (Jackie)
> <Jackie.Huang@windriver.com> wrote:
>
>
>
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Wednesday, September 06, 2017 09:09
>> To: Huang, Jie (Jackie)
>> Cc: Martin Jansa; openembedded-devel
>> Subject: Re: [oe] [meta-oe][PATCH 2/2] corosync: add support for extra
>> features
>>
>> include security-flags.inc file in distro config. if you use poky for
>> distro then set DISTRO=3Dpoky-lsb and you will be able to reproduce it
>
> Unfortunately I still can't reproduce it with DISTRO=3Dpoky-lsb, do I mis=
s
> anything else?
>
> Thanks,
> Jackie
>
>
>>
>> On Tue, Sep 5, 2017 at 6:01 PM, Huang, Jie (Jackie)
>> <Jackie.Huang@windriver.com> wrote:
>> > Yes, sure, but I can=E2=80=99t reproduce this, could you show me the c=
onfig that
>> > had
>> this issue? Thanks!
>> >
>> > Thanks,
>> > Jackie
>> >
>> > From: Martin Jansa [mailto:martin.jansa@gmail.com]
>> > Sent: Tuesday, September 05, 2017 20:30
>> > To: Huang, Jie (Jackie)
>> > Cc: openembedded-devel
>> > Subject: Re: [oe] [meta-oe][PATCH 2/2] corosync: add support for extra
>> features
>> >
>> > Can you please also fix:
>> > corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2=
-
>> r0/packages-split/corosync/usr/sbin/corosync' has relocations in .text
>> [textrel]
>> >
>> > it's been there for long time.
>> >
>> > On Tue, Aug 29, 2017 at 11:27 AM,
>> <jackie.huang@windriver.com<mailto:jackie.huang@windriver.com>> wrote:
>> > From: Jackie Huang
>> <jackie.huang@windriver.com<mailto:jackie.huang@windriver.com>>
>> >
>> > * Add support for features: dbus qdevice qnetd snmp
>> > * Add related PACKAGECONFIG
>> > * inherit useradd to add proper user for qnetd service
>> >
>> > Signed-off-by: Jackie Huang
>> <jackie.huang@windriver.com<mailto:jackie.huang@windriver.com>>
>> > ---
>> >
>> > .../recipes-extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.=
bb>
>> | 30 +++++++++++++++++++---
>> >  1 file changed, 27 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/meta-oe/recipes-
>> extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.bb> b/meta-
>> oe/recipes-extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.bb>
>> > index 2f3aef299..7d5a87e4c 100644
>> > --- a/meta-oe/recipes-
>> extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.bb>
>> > +++ b/meta-oe/recipes-
>> extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.bb>
>> > @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://corosync.github.io/corosync/"
>> >
>> >  SECTION =3D "base"
>> >
>> > -inherit autotools pkgconfig systemd
>> > +inherit autotools pkgconfig systemd useradd
>> >
>> >  SRC_URI =3D
>>
>> "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz<http://buil=
d.cluster
>> labs.org/corosync/releases/$%7bBP%7d.tar.gz>"
>> >  SRC_URI[md5sum] =3D "547fa78704da53aa35912be58d31035f"
>> > @@ -16,13 +16,23 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Da85eb4ce24033adb6088dd1d6ffc5e5d<file:///\\LICENSE=
;m
>> d5=3Da85eb4ce24033adb6088dd1d6ffc5e5d>"
>> >
>> >  DEPENDS =3D "groff-native nss libqb"
>> >
>> > -SYSTEMD_SERVICE_${PN} =3D "corosync.service corosync-notifyd.service"
>> > +SYSTEMD_SERVICE_${PN} =3D "corosync.service corosync-notifyd.service =
\
>> > +
>> ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.contains('PACKA
>> GECONFIG>', 'qdevice', 'corosync-qdevice.service', '', d)} \
>> > +
>> ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.contains('PACKA
>> GECONFIG>', 'qnetd', 'corosync-qnetd.service', '', d)} \
>> > +"
>> >  SYSTEMD_AUTO_ENABLE =3D "enable"
>> >
>> >  INITSCRIPT_NAME =3D "corosync-daemon"
>> >
>> > -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd',
>> d)}<mailto:$%7b@bb.utils.filter('DISTRO_FEATURES',%20'systemd',%20d)%7d>=
"
>> > +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd',=
 d)}
>> > \
>> > +                   dbus qdevice qnetd snmp \
>> >
>> +<mailto:$%7b@bb.utils.filter('DISTRO_FEATURES',%20'systemd',%20d)%7d%20
>> \%0b+ %20 %20 %20 %20 %20 %20 %20 %20 %20
>> dbus%20qdevice%20qnetd%20snmp%20\%0b+>"
>> >
>> > +PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
>> > +PACKAGECONFIG[qdevice] =3D "--enable-qdevices,--disable-qdevices"
>> > +PACKAGECONFIG[qnetd] =3D "--enable-qnetd,--disable-qnetd"
>> > +PACKAGECONFIG[rdma] =3D "--enable-rdma,--disable-rdma"
>> > +PACKAGECONFIG[snmp] =3D "--enable-snmp,--disable-snmp,net-snmp"
>> >  PACKAGECONFIG[systemd] =3D "--enable-systemd --with-
>> systemddir=3D${systemd_system_unitdir},--disable-systemd --without-
>> systemddir,systemd"
>> >
>> >  EXTRA_OECONF =3D "ac_cv_path_BASHPATH=3D${base_bindir}/bash"
>> > @@ -43,12 +53,26 @@ do_install_append() {
>> >      install -d ${D}${sysconfdir}/default/volatiles
>> >      echo "d root root 0755 ${localstatedir}/log/cluster none" >
>> ${D}${sysconfdir}/default/volatiles/05_corosync
>> >
>> > +    if
>> ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.contains('PACKA
>> GECONFIG>', 'qnetd', 'true', 'false', d)}; then
>> > +        chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
>> > +        echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd none=
"
>> > >>
>> ${D}${sysconfdir}/default/volatiles/05_corosync
>> > +    fi
>> > +
>> >      if
>>
>> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}<mail=
to:$%7
>> b@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)%7d>;
>> then
>> >          install -d ${D}${sysconfdir}/tmpfiles.d
>> >          echo "d ${localstatedir}/log/cluster - - - -" >
>> ${D}${sysconfdir}/tmpfiles.d/corosync.conf
>> > +
>> > +        if
>> ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.contains('PACKA
>> GECONFIG>', 'qnetd', 'true', 'false', d)}; then
>> > +            install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf
>> ${D}${sysconfdir}/tmpfiles.d
>> > +        fi
>> >      fi
>> >  }
>> >
>> >  RDEPENDS_${PN} +=3D "bash"
>> >
>> >  FILES_${PN}-dbg +=3D "${libexecdir}/lcrso/.debug"
>> > +FILES_${PN}-doc +=3D "${datadir}/snmp/mibs/COROSYNC-MIB.txt"
>> > +
>> > +USERADD_PACKAGES =3D "${PN}"
>> > +GROUPADD_PARAM_${PN} =3D "--system coroqnetd"
>> > +USERADD_PARAM_${PN} =3D "--system -d / -M -s /bin/nologin -c 'User fo=
r
>> corosync-qnetd' -g coroqnetd coroqnetd"
>> > --
>> > 2.11.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org<mailto:Openembedded-
>> devel@lists.openembedded.org>
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

