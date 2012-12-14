Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjSTM-0001Lg-NX
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 11:26:29 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2046648pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 02:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g2y+BURQ0qB4pxdwouUSjB2s8otDzA3vOByRQfKAF2k=;
	b=bl9l/9wtvfcL5exvkCc37yAXh1TmWO4WQjEctFvjOAcDH8lFDCei+1W1Sl2zixESfX
	V5P7ONl2J0hjU30Sd9xIVdLBMTMYopOzQzDD7EgfiFQzkVRRZhF8X7YRlPLb8M4BcRkX
	u//M/7QM38MorpIVxWt/VH4wH6XIiPsJAww5LmKkTbDaf5lttg9cUXGO5Ji2NB6Wx/mm
	7kas6GT4y2oh6Ws41wnGfIcqG+2oVTBSCRqMoTq5+pp7xGNDjtgHwiC5RKCWBhc4JCXk
	6cRqUTfdnWif0OX9CPcT0X0OBqT+zTcutNtGHrJHOe8+7VQIelfgWSK3+BUSEwmGdawc
	wEFQ==
Received: by 10.69.0.40 with SMTP id av8mr14256436pbd.117.1355479911868;
	Fri, 14 Dec 2012 02:11:51 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id n11sm2691728pby.67.2012.12.14.02.11.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 02:11:49 -0800 (PST)
Date: Fri, 14 Dec 2012 11:12:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121214101201.GA8699@jama.jama.net>
References: <1355213543-3535-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1355213543-3535-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][meta-systemd][PATCH] systemd: update to v196
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 10:26:29 -0000
X-Groupsio-MsgNum: 42163
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2012 at 09:12:23AM +0100, Koen Kooi wrote:
> Systemd-analyze has 2 reverts to keep it working with the python currentl=
y present in OE-core
>=20
> The LGPLv2.1 was update to the latest text from gnu.org, so match checksu=
m to that.
>=20
> Runtime tested on beaglebone/angstrom and soekris-net6501/angstrom

It does not apply after my python changes, can you rebase and resend?

Thanks

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++++++++++=
+++++
>  ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++++++++++=
+++
>  .../systemd/systemd/use-rootlibdir.patch           |  107 --------------=
------
>  meta-systemd/recipes-core/systemd/systemd_git.bb   |   12 ++-
>  4 files changed, 201 insertions(+), 112 deletions(-)
>  create mode 100644 meta-systemd/recipes-core/systemd/systemd/0001-Revert=
-systemd-analyze-use-argparse-instead-of-getop.patch
>  create mode 100644 meta-systemd/recipes-core/systemd/systemd/0002-Revert=
-analyze-use-GDBus-instead-of-dbus-python.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/use-rootlib=
dir.patch
>=20
> diff --git a/meta-systemd/recipes-core/systemd/systemd/0001-Revert-system=
d-analyze-use-argparse-instead-of-getop.patch b/meta-systemd/recipes-core/s=
ystemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.pa=
tch
> new file mode 100644
> index 0000000..7de2705
> --- /dev/null
> +++ b/meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analy=
ze-use-argparse-instead-of-getop.patch
> @@ -0,0 +1,103 @@
> +From 2003e63f48cee2f497de7b90b66284f98c1c9919 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Mon, 10 Dec 2012 12:24:32 +0100
> +Subject: [PATCH 1/2] Revert "systemd-analyze: use argparse instead of ge=
topt"
> +
> +This reverts commit 0c0271841ab45595f71528c50bcf1904d4b841d5.
> +
> +Argparse is broken in current OE python
> +---
> + src/analyze/systemd-analyze |   60 ++++++++++++++++++++++++++++--------=
-------
> + 1 files changed, 39 insertions(+), 21 deletions(-)
> +
> +diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
> +index 88699d6..87a83dd 100755
> +--- a/src/analyze/systemd-analyze
> ++++ b/src/analyze/systemd-analyze
> +@@ -1,7 +1,6 @@
> + #!/usr/bin/python
> +=20
> +-import sys, os
> +-import argparse
> ++import getopt, sys, os
> + from gi.repository import Gio
> + try:
> +         import cairo
> +@@ -76,6 +75,20 @@ def draw_text(context, x, y, text, size =3D 12, r =3D=
 0, g =3D 0, b =3D 0, vcenter =3D 0.5
> +=20
> +         context.restore()
> +=20
> ++def usage():
> ++        sys.stdout.write("""systemd-analyze [--user] time
> ++systemd-analyze [--user] blame
> ++systemd-analyze [--user] plot
> ++
> ++Process systemd profiling information
> ++
> ++  -h --help         Show this help
> ++""")
> ++
> ++def help():
> ++        usage()
> ++        sys.exit()
> ++
> + def time():
> +=20
> +         initrd_time, start_time, finish_time =3D acquire_start_time()
> +@@ -266,29 +279,34 @@ def plot():
> +=20
> +         surface.finish()
> +=20
> +-parser =3D argparse.ArgumentParser(formatter_class=3Dargparse.RawDescri=
ptionHelpFormatter,
> +-                                 description=3D'Process systemd profili=
ng information',
> +-                                 epilog=3D'''\
> +-time - print time spent in the kernel before reaching userspace
> +-blame - print list of running units ordered by time to init
> +-plot - output SVG graphic showing service initialization
> +-''')
> +-
> +-parser.add_argument('action', choices=3D('time', 'blame', 'plot'),
> +-                    default=3D'time', nargs=3D'?',
> +-                    help=3D'action to perform (default: time)')
> +-parser.add_argument('--user', action=3D'store_true',
> +-                    help=3D'use the session bus')
> ++def unknown_verb():
> ++        sys.stderr.write("Unknown verb '%s'.\n" % args[0])
> ++        usage()
> ++        sys.exit(1)
> +=20
> +-args =3D parser.parse_args()
> ++bus =3D Gio.BusType.SYSTEM
> +=20
> +-if args.user:
> +-        bus =3D Gio.BusType.SESSION
> +-else:
> +-        bus =3D Gio.BusType.SYSTEM
> ++try:
> ++        opts, args =3D getopt.gnu_getopt(sys.argv[1:], "h", ["help", "u=
ser"])
> ++except getopt.GetoptError as err:
> ++        sys.stdout.write(str(err) + "\n")
> ++        usage()
> ++        sys.exit(2)
> ++for o, a in opts:
> ++        if o in ("-h", "--help"):
> ++                help()
> ++        elif o =3D=3D '--user':
> ++                bus =3D Gio.BusType.SESSION
> ++        else:
> ++                assert False, "unhandled option"
> +=20
> + verb =3D {'time' : time,
> + 	'blame': blame,
> + 	'plot' : plot,
> ++	'help' : help,
> + 	}
> +-verb.get(args.action)()
> ++
> ++if len(args) =3D=3D 0:
> ++        time()
> ++else:
> ++        verb.get(args[0], unknown_verb)()
> +--=20
> +1.7.7.6
> +
> diff --git a/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyz=
e-use-GDBus-instead-of-dbus-python.patch b/meta-systemd/recipes-core/system=
d/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
> new file mode 100644
> index 0000000..e5e8d7d
> --- /dev/null
> +++ b/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-G=
DBus-instead-of-dbus-python.patch
> @@ -0,0 +1,91 @@
> +From 8079db861b8ffdce69fa10a9ab9ef4740045187f Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Mon, 10 Dec 2012 12:25:00 +0100
> +Subject: [PATCH 2/2] Revert "analyze: use GDBus instead of dbus-python"
> +
> +This reverts commit 4940c64240541e91411620b7dc0963e012aa6b91.
> +
> +Python-gobject is too old in current OE
> +---
> + src/analyze/systemd-analyze |   31 ++++++++++++++-----------------
> + 1 files changed, 14 insertions(+), 17 deletions(-)
> +
> +diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
> +index 87a83dd..636fd74 100755
> +--- a/src/analyze/systemd-analyze
> ++++ b/src/analyze/systemd-analyze
> +@@ -1,15 +1,14 @@
> + #!/usr/bin/python
> +=20
> +-import getopt, sys, os
> +-from gi.repository import Gio
> ++import getopt, dbus, sys, os
> + try:
> +         import cairo
> + except ImportError:
> +         cairo =3D None
> +=20
> + def acquire_time_data():
> +-        manager =3D Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFl=
ags.NONE,
> +-                None, 'org.freedesktop.systemd1', '/org/freedesktop/sys=
temd1', 'org.freedesktop.systemd1.Manager', None)
> ++
> ++        manager =3D dbus.Interface(bus.get_object('org.freedesktop.syst=
emd1', '/org/freedesktop/systemd1'), 'org.freedesktop.systemd1.Manager')
> +         units =3D manager.ListUnits()
> +=20
> +         l =3D []
> +@@ -18,25 +17,23 @@ def acquire_time_data():
> +                 if i[5] !=3D "":
> +                         continue
> +=20
> +-                properties =3D Gio.DBusProxy.new_for_bus_sync(bus, Gio.=
DBusProxyFlags.NONE,
> +-                        None, 'org.freedesktop.systemd1', i[6], 'org.fr=
eedesktop.DBus.Properties', None)
> ++                properties =3D dbus.Interface(bus.get_object('org.freed=
esktop.systemd1', i[6]), 'org.freedesktop.DBus.Properties')
> +=20
> +-                ixt =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'InactiveExitTimestampMonotonic')
> +-                aet =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'ActiveEnterTimestampMonotonic')
> +-                axt =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'ActiveExitTimestampMonotonic')
> +-                iet =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'InactiveEnterTimestampMonotonic')
> ++                ixt =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'InactiveExitTimestampMonotonic'))
> ++                aet =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'ActiveEnterTimestampMonotonic'))
> ++                axt =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'ActiveExitTimestampMonotonic'))
> ++                iet =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'InactiveEnterTimestampMonotonic'))
> +=20
> +                 l.append((str(i[0]), ixt, aet, axt, iet))
> +=20
> +         return l
> +=20
> + def acquire_start_time():
> +-        properties =3D Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProx=
yFlags.NONE,
> +-                None, 'org.freedesktop.systemd1', '/org/freedesktop/sys=
temd1', 'org.freedesktop.DBus.Properties', None)
> ++        properties =3D dbus.Interface(bus.get_object('org.freedesktop.s=
ystemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.DBus.Properties')
> +=20
> +-        initrd_time =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Manager', 'InitRDTimestampMonotonic')
> +-        userspace_time =3D properties.Get('(ss)', 'org.freedesktop.syst=
emd1.Manager', 'UserspaceTimestampMonotonic')
> +-        finish_time =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Manager', 'FinishTimestampMonotonic')
> ++        initrd_time =3D int(properties.Get('org.freedesktop.systemd1.Ma=
nager', 'InitRDTimestampMonotonic'))
> ++        userspace_time =3D int(properties.Get('org.freedesktop.systemd1=
=2EManager', 'UserspaceTimestampMonotonic'))
> ++        finish_time =3D int(properties.Get('org.freedesktop.systemd1.Ma=
nager', 'FinishTimestampMonotonic'))
> +=20
> +         if finish_time =3D=3D 0:
> +                 sys.stderr.write("Bootup is not yet finished. Please tr=
y again later.\n")
> +@@ -284,7 +281,7 @@ def unknown_verb():
> +         usage()
> +         sys.exit(1)
> +=20
> +-bus =3D Gio.BusType.SYSTEM
> ++bus =3D dbus.SystemBus()
> +=20
> + try:
> +         opts, args =3D getopt.gnu_getopt(sys.argv[1:], "h", ["help", "u=
ser"])
> +@@ -296,7 +293,7 @@ for o, a in opts:
> +         if o in ("-h", "--help"):
> +                 help()
> +         elif o =3D=3D '--user':
> +-                bus =3D Gio.BusType.SESSION
> ++                bus =3D dbus.SessionBus()
> +         else:
> +                 assert False, "unhandled option"
> +=20
> +--=20
> +1.7.7.6
> +
> diff --git a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.pat=
ch b/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
> deleted file mode 100644
> index 4c471b6..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -Upstream-Status: Undecided
> -
> -This patch removes some of hardcoded references to /lib
> -and /usr/lib since on some architectures it should be
> -/lib64 and /usr/lib64 atleast in OE
> -
> -I am not sure about the intention of hardcoded values
> -thats why status is undecided
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: git/Makefile.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/Makefile.am	2012-09-22 11:07:58.811981199 -0700
> -+++ git/Makefile.am	2012-09-22 11:09:11.267983956 -0700
> -@@ -64,25 +64,25 @@
> -=20
> - # Our own, non-special dirs
> - pkgsysconfdir=3D$(sysconfdir)/systemd
> --userunitdir=3D$(prefix)/lib/systemd/user
> --userpresetdir=3D$(prefix)/lib/systemd/user-preset
> --tmpfilesdir=3D$(prefix)/lib/tmpfiles.d
> --sysctldir=3D$(prefix)/lib/sysctl.d
> --usergeneratordir=3D$(prefix)/lib/systemd/user-generators
> -+userunitdir=3D$(prefix)/$(rootlibdir)/systemd/user
> -+userpresetdir=3D$(prefix)/$(rootlibdir)/systemd/user-preset
> -+tmpfilesdir=3D$(prefix)/$(rootlibdir)/tmpfiles.d
> -+sysctldir=3D$(prefix)/$(rootlibdir)/sysctl.d
> -+usergeneratordir=3D$(prefix)/$(rootlibdir)/systemd/user-generators
> - pkgincludedir=3D$(includedir)/systemd
> - systemgeneratordir=3D$(rootlibexecdir)/system-generators
> - systemshutdowndir=3D$(rootlibexecdir)/system-shutdown
> - systemsleepdir=3D$(rootlibexecdir)/system-sleep
> --systemunitdir=3D$(rootprefix)/lib/systemd/system
> --systempresetdir=3D$(rootprefix)/lib/systemd/system-preset
> --udevlibexecdir=3D$(rootprefix)/lib/udev
> -+systemunitdir=3D$(rootprefix)/$(rootlibdir)/systemd/system
> -+systempresetdir=3D$(rootprefix)/$(rootlibdir)/systemd/system-preset
> -+udevlibexecdir=3D$(rootprefix)/$(rootlibdir)/udev
> - udevhomedir =3D $(udevlibexecdir)
> - udevrulesdir =3D $(udevlibexecdir)/rules.d
> -=20
> - # And these are the special ones for /
> - rootprefix=3D@rootprefix@
> - rootbindir=3D$(rootprefix)/bin
> --rootlibexecdir=3D$(rootprefix)/lib/systemd
> -+rootlibexecdir=3D$(rootprefix)/$(rootlibdir)/systemd
> -=20
> - CLEANFILES =3D $(BUILT_SOURCES)
> - EXTRA_DIST =3D
> -@@ -132,7 +132,7 @@
> - 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=3D\"$(bindir)/systemd-stdio-bridge\=
" \
> - 	-DROOTPREFIX=3D\"$(rootprefix)\" \
> - 	-DRUNTIME_DIR=3D\"/run\" \
> --	-DRANDOM_SEED=3D\"$(localstatedir)/lib/random-seed\" \
> -+	-DRANDOM_SEED=3D\"$(localstatedir)/$(rootlibdir)/random-seed\" \
> - 	-DSYSTEMD_CRYPTSETUP_PATH=3D\"$(rootlibexecdir)/systemd-cryptsetup\" \
> - 	-DSYSTEM_GENERATOR_PATH=3D\"$(systemgeneratordir)\" \
> - 	-DUSER_GENERATOR_PATH=3D\"$(usergeneratordir)\" \
> -@@ -2692,7 +2692,7 @@
> -=20
> - binfmt-install-data-hook:
> - 	$(MKDIR_P) -m 0755 \
> --		$(DESTDIR)$(prefix)/lib/binfmt.d \
> -+		$(DESTDIR)$(prefix)/$(rootlibdir)/binfmt.d \
> - 		$(DESTDIR)$(sysconfdir)/binfmt.d \
> - 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
> - 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
> -@@ -3107,7 +3107,7 @@
> -=20
> - timedated-install-data-hook:
> - 	$(MKDIR_P) -m 0755 \
> --		$(DESTDIR)$(prefix)/lib/systemd/ntp-units.d \
> -+		$(DESTDIR)$(prefix)/$(rootlibdir)/systemd/ntp-units.d \
> - 		$(DESTDIR)$(sysconfdir)/systemd/ntp-units.d
> - 	( cd $(DESTDIR)$(systemunitdir) && \
> - 		rm -f dbus-org.freedesktop.timedate1.service  && \
> -@@ -3337,7 +3337,7 @@
> - logind-install-data-hook:
> - 	$(MKDIR_P) -m 0755 \
> - 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
> --		$(DESTDIR)$(localstatedir)/lib/systemd
> -+		$(DESTDIR)$(localstatedir)/$(rootlibdir)/systemd
> - 	( cd $(DESTDIR)$(systemunitdir) && \
> - 		rm -f dbus-org.freedesktop.login1.service && \
> - 		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
> -@@ -3494,7 +3494,7 @@
> - 		-e 's,@PACKAGE_VERSION\@,$(PACKAGE_VERSION),g' \
> - 		-e 's,@PACKAGE_NAME\@,$(PACKAGE_NAME),g' \
> - 		-e 's,@PACKAGE_URL\@,$(PACKAGE_URL),g' \
> --		-e 's,@RANDOM_SEED\@,$(localstatedir)/lib/random-seed,g' \
> -+		-e 's,@RANDOM_SEED\@,$(localstatedir)/$(rootlibdir)/random-seed,g' \
> - 		-e 's,@prefix\@,$(prefix),g' \
> - 		-e 's,@exec_prefix\@,$(exec_prefix),g' \
> - 		-e 's,@libdir\@,$(libdir),g' \
> -@@ -3619,9 +3619,9 @@
> - 	$(MKDIR_P) -m 0755 \
> - 		$(DESTDIR)$(tmpfilesdir) \
> - 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
> --		$(DESTDIR)$(prefix)/lib/modules-load.d \
> -+		$(DESTDIR)$(prefix)/$(rootlibdir)/modules-load.d \
> - 		$(DESTDIR)$(sysconfdir)/modules-load.d \
> --		$(DESTDIR)$(prefix)/lib/sysctl.d \
> -+		$(DESTDIR)$(prefix)/$(rootlibdir)/sysctl.d \
> - 		$(DESTDIR)$(sysconfdir)/sysctl.d \
> - 		$(DESTDIR)$(systemshutdowndir) \
> - 		$(DESTDIR)$(systemsleepdir) \
> diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-syst=
emd/recipes-core/systemd/systemd_git.bb
> index bfd1b30..cfee2a3 100644
> --- a/meta-systemd/recipes-core/systemd/systemd_git.bb
> +++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/sy=
stemd"
> =20
>  LICENSE =3D "GPLv2 & LGPLv2.1 & MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
> -                    file://LICENSE.LGPL2.1;md5=3Dfb919cc88dbe06ec0b0bd50=
e001ccf1f \
> +                    file://LICENSE.LGPL2.1;md5=3Df0df8fd67dfa1db3cc0bd43=
1837f0b89 \
>                      file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8=
868ed"
> =20
>  PROVIDES =3D "udev"
> @@ -19,13 +19,14 @@ inherit gitpkgv
>  PKGV =3D "v${GITPKGVTAG}"
> =20
>  PV =3D "git"
> -PR =3D "r10"
> +PR =3D "r11"
> =20
>  inherit useradd pkgconfig autotools perlnative
> =20
> -SRCREV =3D "4d92e078e9d7e9a9d346065ea5e4afbafbdadb48"
> +SRCREV =3D "decd634e801bee2c554edb35383cc9d43417a850"
>  SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;protocol=3Dgi=
t \
> -           file://use-rootlibdir.patch \
> +           file://0001-Revert-systemd-analyze-use-argparse-instead-of-ge=
top.patch \
> +           file://0002-Revert-analyze-use-GDBus-instead-of-dbus-python.p=
atch \
>             file://gtk-doc.make \
>             file://touchscreen.rules \
>             file://modprobe.rules \
> @@ -112,7 +113,7 @@ USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "-r lock"
> =20
>  FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
> -RDEPENDS_${PN}-analyze =3D "python-dbus"
> +RDEPENDS_${PN}-analyze =3D "python-dbus python-argparse python-textutils"
>  RRECOMMENDS_${PN}-analyze =3D "python-pycairo"
> =20
>  FILES_${PN}-initramfs =3D "/init"
> @@ -216,6 +217,7 @@ FILES_udev +=3D "${base_libdir}/udev/udevd \
>                 ${base_libdir}/udev/rules.d/78*.rules \
>                 ${base_libdir}/udev/rules.d/8*.rules \
>                 ${base_libdir}/udev/rules.d/95*.rules \
> +               ${base_libdir}/udev/hwdb.d \
>                 ${sysconfdir}/udev \
>                "
> =20
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDK+3EACgkQN1Ujt2V2gByKxwCggJdJBGN8UynAXw+sKNgN4ZTm
mqQAoKAkgltAqyuBm7TzF0kM4flZ4wPI
=DQhY
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
