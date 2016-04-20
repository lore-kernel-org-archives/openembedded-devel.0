Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 460986FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 19:09:16 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1asxUz-0001z6-Ns from Joe_MacDonald@mentor.com ;
	Wed, 20 Apr 2016 12:09:17 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Apr 2016 12:09:16 -0700
Received: by burninator (Postfix, from userid 1000)	id 15C595804EA; Wed, 20
	Apr 2016 15:09:16 -0400 (EDT)
Date: Wed, 20 Apr 2016 15:09:16 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <mark.asselstine@windriver.com>, <rehsack@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20160420190915.GC5528@mentor.com>
References: <20160419142059.GB5970@mentor.com>
	<1461080229-23859-1-git-send-email-joe_macdonald@mentor.com>
	<20160420082429.GB3520@ad.chargestorm.se>
	<20160420082917.GC3520@ad.chargestorm.se>
	<20160420185624.GB5528@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20160420185624.GB5528@mentor.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH v3] dnsmasq: get systemd only working again
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
X-List-Received-Date: Wed, 20 Apr 2016 19:09:17 -0000
X-Groupsio-MsgNum: 61087
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline

--C94crkcyjafcjHxo
Content-Type: multipart/mixed; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v3] dnsmasq: get systemd only working aga=
in] On 16.04.20 (Wed 14:56) Joe MacDonald wrote:

> Wow this one is kind of thorny, huh?
>=20
> How about the attached patch?  I hope it strikes the right balance
> between not duplicating too much and not making things too complex to
> maintain later on.

Or, rather, this one.  :-)

-J.

>=20
> -J.
>=20
> [Re: [meta-networking][PATCH v3] dnsmasq: get systemd only working again]=
 On 16.04.20 (Wed 10:29) Anders Darander wrote:
>=20
> > * Anders Darander <anders@chargestorm.se> [160420 10:24]:
> >=20
> > > * Joe MacDonald <joe_macdonald@mentor.com> [160419 17:36]:
> >=20
> > > > From: Mark Asselstine <mark.asselstine@windriver.com>
> >=20
> > > > The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
> > > > [dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
> > > > dnsmasq runtime. No sysvinit scripts are included in systemd only
> > > > builds (and should not be) and the dnsmasq executable has not moved=
 to
> > > > /usr/sbin.
> >=20
> > > > Reverting to the previous version of the systemd service file. If
> > > > folks want the local dnsmasq instance to be queried before going to
> > > > an external DNS they should add 'nameserver 127.0.0.1' to
> > > > /etc/resolv.conf. Or submit a change which will work with systemd.
> >=20
> > > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > > > ---
> >=20
> > > > The previous one should've been v2, so I've named this one v3 expli=
citly.
> > > > After reading more of the systemd documentation I think this approa=
ch in
> > > > the service file is the current best option available.  It would ce=
rtainly
> > > > be cleaner to store the pidfile name in an environment variable but=
 it
> > > > turns out on further inspection that if you pass a varaible to PIDF=
ile,
> > > > you get errors (that you only see when the service is stopped, not =
while
> > > > it is running) indicating essentially that it is falling back to the
> > > > "guess the MAINPID value" behaviour.  So this seems to be the way w=
e're
> > > > supposed to do this type of thing now.
> >=20
> > > > -J.
> >=20
> > > >  .../recipes-support/dnsmasq/dnsmasq.inc            |  9 ++--
> > > >  .../dnsmasq/files/dnsmasq-resolvconf-helper        | 62 ++++++++++=
++++++++++++
> >=20
> > > This file, dnsmasq-resolvconf-helper, isn't include in SRC_URI, neith=
er
> > > in do_install(). However it is referenced in the dnsmasq.service, whi=
ch
> > > leads to:
> >=20
> > > Apr 08 11:07:27 ccu dnsmasq[384]: started, version 2.75 cachesize 150
> > > Apr 08 11:07:27 ccu dnsmasq[384]: compile time options: IPv6 GNU-geto=
pt no-DBus no-i18n no-IDN DHCP DHCPv6 no-Lua TFTP no-conntrack ipset auth n=
o-DNSSEC loop- detect inotify
> > > Apr 08 11:07:27 ccu dnsmasq-dhcp[384]: DHCP, IP range 192.168.7.1 -- =
192.168.7.1, lease time 2m
> > > Apr 08 11:07:27 ccu dnsmasq[384]: [[0;1;39mno servers found in /etc/r=
esolv.conf, will retry[[0m
> > > Apr 08 11:07:27 ccu dnsmasq[384]: read /etc/hosts - 2 addresses Apr 0=
8 11:07:27 ccu systemd[386]: [[0;1;31mdnsmasq.service: Failed at
> > > step EXEC spawning /usr/bin/dnsmasq-resolvconf-helper: No such file o=
r directory[[0m
> >=20
> > This is the actual issue, the dnsmasq.service file will unconditionally
> > execute dnsmasq-resolvconf-helper, while it's only installed if the
> > PACKAGECONFIG resolved is set.
> >=20
> > Could you add the line=20
> >=20
> > ExecStartPost=3D/usr/bin/dnsmasq-resolvconf-helper start
> >=20
> > to dnsmasq.service conditionally on the PACKAGECONFIG resolved? (Using =
sed
> >  is an option).
> >=20
> > > Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Control pro=
cess exited, code=3Dexited status=3D203[[0m
> > > Apr 08 11:07:27 ccu systemd[1]: [[0;1;31mFailed to start DNS forwarde=
r and DHCP server.[[0m
> > > Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Unit entere=
d failed state.[[0m
> > > Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Failed with=
 result 'exit-code'.[[0m
> >=20
> >=20
> > > Thus, with the following patch amended, I'm happy with this patch!
> >=20
> > No, I was slightly wrong...
> >=20
> > > Cheers,
> > > Anders
> >=20
> > > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > index df58e5c..db54658 100644
> > > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > @@ -11,6 +11,7 @@ SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/$=
{@['archive/', ''][float(d.getV
> > >             file://init \
> > >             file://dnsmasq.conf \
> > >             file://dnsmasq.service \
> > > +           file://dnsmasq-resolvconf-helper \
> > >  "
> >=20
> > >  inherit pkgconfig update-rc.d systemd
> > > @@ -54,7 +55,7 @@ do_install () {
> > >      install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir=
}/system
> >=20
> > >      install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
> > > -
> > > +    install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindi=
r}/dnsmasq-resolvconf-helper
> >=20
> > This line should obviously not be here, as you're actually installing
> > dnsmasq-resolvconf-helper, if the PACKAGECONFIG resolved is set.
> >=20
> > >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}"=
 !=3D "" ]; then
> > >          install -d ${D}${sysconfdir}/dbus-1/system.d
> > >          install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/sy=
stem.d/
> --=20
> -Joe MacDonald.
> :wq

> From 8247d6d515be338aeef58978f5d52ce08f637adf Mon Sep 17 00:00:00 2001
> From: Mark Asselstine <mark.asselstine@windriver.com>
> Date: Mon, 18 Apr 2016 16:34:36 -0400
> Subject: [PATCH 01/10] dnsmasq: get systemd only working again
>=20
> The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
> [dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
> dnsmasq runtime. No sysvinit scripts are included in systemd only
> builds (and should not be) and the dnsmasq executable has not moved to
> /usr/sbin.
>=20
> Reverting to the previous version of the systemd service file. If
> folks want the local dnsmasq instance to be queried before going to
> an external DNS they should add 'nameserver 127.0.0.1' to
> /etc/resolv.conf. Or submit a change which will work with systemd.
>=20
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> Acked-by: Anders Darander <anders@chargestorm.se>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  .../recipes-support/dnsmasq/dnsmasq.inc            | 18 ++++---
>  ...nsmasq.service =3D> dnsmasq-noresolvconf.service} |  7 ++-
>  .../dnsmasq/files/dnsmasq-resolvconf-helper        | 62 ++++++++++++++++=
++++++
>  .../dnsmasq/files/dnsmasq-resolvconf.service       | 17 ++++++
>  4 files changed, 94 insertions(+), 10 deletions(-)
>  rename meta-networking/recipes-support/dnsmasq/files/{dnsmasq.service =
=3D> dnsmasq-noresolvconf.service} (49%)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq=
-resolvconf-helper
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq=
-resolvconf.service
>=20
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-n=
etworking/recipes-support/dnsmasq/dnsmasq.inc
> index 622e630..1f74156 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -33,7 +33,7 @@ EXTRA_OEMAKE =3D "\
>      'LDFLAGS=3D${LDFLAGS}' \
>  "
> =20
> -SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file:=
//dnsmasq.resolvconf file://99_dnsmasq', '', d)}"
> +SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file:=
//dnsmasq.resolvconf file://99_dnsmasq file://dnsmasq-resolvconf-helper', '=
', d)}"
> =20
>  do_compile_append() {
>      # build dhcp_release
> @@ -51,7 +51,12 @@ do_install () {
>      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> =20
>      install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/sy=
stem
> +
> +    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', =
'', d)}" !=3D "" ]; then
> +        install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${syst=
emd_unitdir}/system/dnsmasq.service
> +    else
> +        install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${sy=
stemd_unitdir}/system/dnsmasq.service
> +    fi
> =20
>      install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
> =20
> @@ -60,11 +65,12 @@ do_install () {
>          install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system=
=2Ed/
>      fi
>      if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', =
'', d)}" !=3D "" ]; then
> -	install -d ${D}${sysconfdir}/resolvconf/update.d/
> -	install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvc=
onf/update.d/dnsmasq
> +        install -d ${D}${sysconfdir}/resolvconf/update.d/
> +        install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/=
resolvconf/update.d/dnsmasq
> =20
> -	install -d ${D}${sysconfdir}/default/volatiles
> -	install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatil=
es
> +        install -d ${D}${sysconfdir}/default/volatiles
> +        install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/=
volatiles
> +        install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindi=
r}
>      fi
>  }
> =20
> diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.servic=
e b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.serv=
ice
> similarity index 49%
> rename from meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
> rename to meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvc=
onf.service
> index c3637e1..cde2244 100644
> --- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
> +++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.=
service
> @@ -5,10 +5,9 @@ After=3Dnetwork.target
>  [Service]
>  Type=3Dforking
>  PIDFile=3D/run/dnsmasq.pid
> -ExecStartPre=3D/usr/sbin/dnsmasq --test
> -ExecStart=3D/etc/init.d/dnsmasq systemd-exec
> -ExecStartPost=3D/etc/init.d/dnsmasq systemd-start-resolvconf
> -ExecStopPre=3D/etc/init.d/dnsmasq systemd-stop-resolvconf
> +ExecStartPre=3D/usr/bin/dnsmasq --test
> +ExecStart=3D/usr/bin/dnsmasq -x /run/dnsmasq.pid
> +ExecStop=3D/bin/kill $MAINPID
>  ExecReload=3D/bin/kill -HUP $MAINPID
> =20
>  [Install]
> diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolv=
conf-helper b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvc=
onf-helper
> new file mode 100644
> index 0000000..db54d46
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-he=
lper
> @@ -0,0 +1,62 @@
> +#!/bin/bash
> +#
> +# Borrowing heavily from the dnsmasq initscript's version of support for
> +# resolvconf, intended for use in systemd-only configurations.
> +#
> +PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
> +DAEMON=3D/usr/sbin/dnsmasq
> +NAME=3Ddnsmasq
> +
> +# Most configuration options in /etc/default/dnsmasq are deprecated
> +# but still honoured.
> +if [ -r /etc/default/$NAME ]; then
> +   . /etc/default/$NAME
> +fi
> +
> +start_resolvconf()
> +{
> +   # If interface "lo" is explicitly disabled in /etc/default/dnsmasq
> +   # Then dnsmasq won't be providing local DNS, so don't add it to
> +   # the resolvconf server set.
> +   for interface in $DNSMASQ_EXCEPT
> +   do
> +      [ $interface =3D lo ] && return
> +   done
> +
> +   if [ -x /sbin/resolvconf ] ; then
> +      echo "nameserver 127.0.0.1" |
> +      /sbin/resolvconf -a lo.$NAME
> +   fi
> +   return 0
> +}
> +
> +stop_resolvconf()
> +{
> +   if [ -x /sbin/resolvconf ] ; then
> +      /sbin/resolvconf -d lo.$NAME
> +   fi
> +   return 0
> +}
> +
> +case "$1" in
> +   start)
> +      start_resolvconf
> +      exit 0
> +      ;;
> +   stop)
> +      stop_resolvconf
> +      exit 0
> +      ;;
> +   restart)
> +      stop_resolvconf
> +      start_resolvconf
> +      exit 0
> +      ;;
> +   *)
> +      echo "Usage: /etc/init.d/$NAME {start|stop|restart}" >&2
> +      exit 3
> +      ;;
> +esac
> +
> +exit 0
> +
> diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolv=
conf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolv=
conf.service
> new file mode 100644
> index 0000000..68b175c
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.se=
rvice
> @@ -0,0 +1,17 @@
> +[Unit]
> +Description=3DDNS forwarder and DHCP server
> +After=3Dnetwork.target
> +
> +[Service]
> +Type=3Dforking
> +PIDFile=3D/run/dnsmasq.pid
> +ExecStartPre=3D/usr/bin/dnsmasq --test
> +ExecStart=3D/usr/bin/dnsmasq -x /run/dnsmasq.pid
> +ExecStartPost=3D/usr/bin/dnsmasq-resolvconf-helper start
> +ExecStopPre=3D/usr/bin/dnsmasq-resolvconf-helper stop
> +ExecStop=3D/bin/kill $MAINPID
> +ExecReload=3D/bin/kill -HUP $MAINPID
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> +
> --=20
> 1.9.1
>=20




--=20
-Joe MacDonald.
:wq

--zS7rBR6csb6tI2e1
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-dnsmasq-get-systemd-only-working-again.patch"
Content-Transfer-Encoding: quoted-printable

From 237ade5065aee5290288febfbbae90145c2c7764 Mon Sep 17 00:00:00 2001
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Apr 2016 16:34:36 -0400
Subject: [PATCH] dnsmasq: get systemd only working again

The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
[dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
dnsmasq runtime. No sysvinit scripts are included in systemd only
builds (and should not be) and the dnsmasq executable has not moved to
/usr/sbin.

Reverting to the previous version of the systemd service file. If
folks want the local dnsmasq instance to be queried before going to
an external DNS they should add 'nameserver 127.0.0.1' to
/etc/resolv.conf. Or submit a change which will work with systemd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Acked-by: Anders Darander <anders@chargestorm.se>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-support/dnsmasq/dnsmasq.inc            | 21 +++++---
 ...nsmasq.service =3D> dnsmasq-noresolvconf.service} |  7 ++-
 .../dnsmasq/files/dnsmasq-resolvconf-helper        | 62 ++++++++++++++++++=
++++
 .../dnsmasq/files/dnsmasq-resolvconf.service       | 17 ++++++
 4 files changed, 96 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/dnsmasq/files/{dnsmasq.service =3D>=
 dnsmasq-noresolvconf.service} (49%)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq-r=
esolvconf-helper
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq-r=
esolvconf.service

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-net=
working/recipes-support/dnsmasq/dnsmasq.inc
index 622e630..cc7f9e3 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e=
8d672dc4c32c317bb3 \
 SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][floa=
t(d.getVar('PV',1).split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=3Ddnsmasq=
-${PV} \
            file://init \
            file://dnsmasq.conf \
-           file://dnsmasq.service \
+           file://dnsmasq-resolvconf.service \
+           file://dnsmasq-noresolvconf.service \
 "
=20
 inherit pkgconfig update-rc.d systemd
@@ -33,7 +34,7 @@ EXTRA_OEMAKE =3D "\
     'LDFLAGS=3D${LDFLAGS}' \
 "
=20
-SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file://=
dnsmasq.resolvconf file://99_dnsmasq', '', d)}"
+SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file://=
dnsmasq.resolvconf file://99_dnsmasq file://dnsmasq-resolvconf-helper', '',=
 d)}"
=20
 do_compile_append() {
     # build dhcp_release
@@ -51,7 +52,12 @@ do_install () {
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
=20
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/syst=
em
+
+    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', ''=
, d)}" !=3D "" ]; then
+        install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${system=
d_unitdir}/system/dnsmasq.service
+    else
+        install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${syst=
emd_unitdir}/system/dnsmasq.service
+    fi
=20
     install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
=20
@@ -60,11 +66,12 @@ do_install () {
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d=
/
     fi
     if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', ''=
, d)}" !=3D "" ]; then
-	install -d ${D}${sysconfdir}/resolvconf/update.d/
-	install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvcon=
f/update.d/dnsmasq
+        install -d ${D}${sysconfdir}/resolvconf/update.d/
+        install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/re=
solvconf/update.d/dnsmasq
=20
-	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/vo=
latiles
+        install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindir}
     fi
 }
=20
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service =
b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.servic=
e
similarity index 49%
rename from meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
rename to meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvcon=
f.service
index c3637e1..cde2244 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.se=
rvice
@@ -5,10 +5,9 @@ After=3Dnetwork.target
 [Service]
 Type=3Dforking
 PIDFile=3D/run/dnsmasq.pid
-ExecStartPre=3D/usr/sbin/dnsmasq --test
-ExecStart=3D/etc/init.d/dnsmasq systemd-exec
-ExecStartPost=3D/etc/init.d/dnsmasq systemd-start-resolvconf
-ExecStopPre=3D/etc/init.d/dnsmasq systemd-stop-resolvconf
+ExecStartPre=3D/usr/bin/dnsmasq --test
+ExecStart=3D/usr/bin/dnsmasq -x /run/dnsmasq.pid
+ExecStop=3D/bin/kill $MAINPID
 ExecReload=3D/bin/kill -HUP $MAINPID
=20
 [Install]
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvco=
nf-helper b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvcon=
f-helper
new file mode 100644
index 0000000..db54d46
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-help=
er
@@ -0,0 +1,62 @@
+#!/bin/bash
+#
+# Borrowing heavily from the dnsmasq initscript's version of support for
+# resolvconf, intended for use in systemd-only configurations.
+#
+PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=3D/usr/sbin/dnsmasq
+NAME=3Ddnsmasq
+
+# Most configuration options in /etc/default/dnsmasq are deprecated
+# but still honoured.
+if [ -r /etc/default/$NAME ]; then
+   . /etc/default/$NAME
+fi
+
+start_resolvconf()
+{
+   # If interface "lo" is explicitly disabled in /etc/default/dnsmasq
+   # Then dnsmasq won't be providing local DNS, so don't add it to
+   # the resolvconf server set.
+   for interface in $DNSMASQ_EXCEPT
+   do
+      [ $interface =3D lo ] && return
+   done
+
+   if [ -x /sbin/resolvconf ] ; then
+      echo "nameserver 127.0.0.1" |
+      /sbin/resolvconf -a lo.$NAME
+   fi
+   return 0
+}
+
+stop_resolvconf()
+{
+   if [ -x /sbin/resolvconf ] ; then
+      /sbin/resolvconf -d lo.$NAME
+   fi
+   return 0
+}
+
+case "$1" in
+   start)
+      start_resolvconf
+      exit 0
+      ;;
+   stop)
+      stop_resolvconf
+      exit 0
+      ;;
+   restart)
+      stop_resolvconf
+      start_resolvconf
+      exit 0
+      ;;
+   *)
+      echo "Usage: /etc/init.d/$NAME {start|stop|restart}" >&2
+      exit 3
+      ;;
+esac
+
+exit 0
+
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvco=
nf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvco=
nf.service
new file mode 100644
index 0000000..68b175c
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.serv=
ice
@@ -0,0 +1,17 @@
+[Unit]
+Description=3DDNS forwarder and DHCP server
+After=3Dnetwork.target
+
+[Service]
+Type=3Dforking
+PIDFile=3D/run/dnsmasq.pid
+ExecStartPre=3D/usr/bin/dnsmasq --test
+ExecStart=3D/usr/bin/dnsmasq -x /run/dnsmasq.pid
+ExecStartPost=3D/usr/bin/dnsmasq-resolvconf-helper start
+ExecStopPre=3D/usr/bin/dnsmasq-resolvconf-helper stop
+ExecStop=3D/bin/kill $MAINPID
+ExecReload=3D/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=3Dmulti-user.target
+
--=20
1.9.1


--zS7rBR6csb6tI2e1--

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXF9PbAAoJEEn8ffcsOfaWTfQIAMl2xF+TwdezyfG1vGGpWh+5
F5JVmdJzt+qy4A24T4maWLPcEBu4QZrL6ChlEOWPRkT1kg8Az7PL/vXZKrOz+ift
sAxNmvTKY6qKGp86ZBF14EU8Y6wX7iM9zS2ucla9ZA0pdGHR+uleDq1JJ4ni1ReH
V96c/56H7fFou9swsZKK+HAKhmW6FP8tcLhff08PGAaGsifNRp4BFn46VYRYk1wi
VFvtBuVPtBKmb/nhQxmvBu/8DAXbZUeskkmKgZMowyxWz2v35yTpHwYvL9LWpkmt
K8HNO7o4ynGNs76hVtFc8qaHBNvH1p/Xefru1aVget7oc61bTcDdpCAG8GwcWcw=
=NgWw
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
