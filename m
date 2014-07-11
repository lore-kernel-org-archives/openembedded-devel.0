Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C86470362
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 09:54:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6B9sbFE028404
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 02:54:37 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.48]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Fri, 11 Jul 2014 02:54:37 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 1/2] syslog-ng: move back from nonworking
Thread-Index: AQHPnO1h/oF4iMiNpEeBULNzj7cCTJuaohOA
Date: Fri, 11 Jul 2014 09:54:36 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCA7B3D8@ALA-MBA.corp.ad.wrs.com>
References: <1405072156-8655-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1405072156-8655-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.252]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/2] syslog-ng: move back from nonworking
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
X-List-Received-Date: Fri, 11 Jul 2014 09:54:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I should use "-M" option for this, I will resend v2.

Thanks,
Jackie

> -----Original Message-----
> From: jackie.huang@windriver.com [mailto:jackie.huang@windriver.com]
> Sent: Friday, July 11, 2014 5:49 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Huang, Jie (Jackie)
> Subject: [meta-oe][PATCH 1/2] syslog-ng: move back from nonworking
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../nonworking/syslog-ng/files/initscript          |  45 ------
>  .../nonworking/syslog-ng/files/syslog-ng.conf      | 155 ---------------=
------
>  .../nonworking/syslog-ng/syslog-ng.inc             |  98 -------------
>  .../nonworking/syslog-ng/syslog-ng_3.2.5.bb        |  10 --
>  meta-oe/recipes-support/syslog-ng/files/initscript |  45 ++++++  .../rec=
ipes-support/syslog-
> ng/files/syslog-ng.conf | 155 +++++++++++++++++++++
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  98 +++++++++++++
>  .../recipes-support/syslog-ng/syslog-ng_3.2.5.bb   |  10 ++
>  8 files changed, 308 insertions(+), 308 deletions(-)  delete mode 100644=
 meta-oe/recipes-
> support/nonworking/syslog-ng/files/initscript
>  delete mode 100644 meta-oe/recipes-support/nonworking/syslog-ng/files/sy=
slog-ng.conf
>  delete mode 100644 meta-oe/recipes-support/nonworking/syslog-ng/syslog-n=
g.inc
>  delete mode 100644 meta-oe/recipes-support/nonworking/syslog-ng/syslog-n=
g_3.2.5.bb
>  create mode 100644 meta-oe/recipes-support/syslog-ng/files/initscript
>  create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng.con=
f
>  create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>  create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
>=20
> diff --git a/meta-oe/recipes-support/nonworking/syslog-ng/files/initscrip=
t b/meta-oe/recipes-
> support/nonworking/syslog-ng/files/initscript
> deleted file mode 100644
> index b95e8ad..0000000
> --- a/meta-oe/recipes-support/nonworking/syslog-ng/files/initscript
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -#! /bin/sh
> -#
> -# This is an init script for openembedded -# Copy it to /etc/init.d/sysl=
og-ng and type -# > update-rc.d
> syslog-ng defaults 5 -#
> -
> -
> -syslog_ng=3D/usr/sbin/syslog-ng
> -test -x "$syslog_ng" || exit 0
> -
> -case "$1" in
> -  start)
> -    echo -n "Starting syslog-ng:"
> -    start-stop-daemon --start --quiet --exec $syslog_ng
> -    echo "."
> -    ;;
> -  stop)
> -    echo -n "Stopping syslog-ng:"
> -    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
> -    echo "."
> -    ;;
> -  reload|force-reload)
> -    start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
> -    ;;
> -  restart)
> -    echo "Stopping syslog-ng:"
> -    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
> -    echo -n "Waiting for syslog-ng to die off"
> -    for i in 1 2 3 ;
> -    do
> -        sleep 1
> -        echo -n "."
> -    done
> -    echo ""
> -    echo -n "Starting syslog-ng:"
> -    start-stop-daemon --start --quiet --exec $syslog_ng
> -    echo "."
> -    ;;
> -  *)
> -    echo "Usage: /etc/init.d/syslog-ng {start|stop|reload|restart|force-=
reload}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/meta-oe/recipes-support/nonworking/syslog-ng/files/syslog-ng=
.conf b/meta-oe/recipes-
> support/nonworking/syslog-ng/files/syslog-ng.conf
> deleted file mode 100644
> index e760dfb..0000000
> --- a/meta-oe/recipes-support/nonworking/syslog-ng/files/syslog-ng.conf
> +++ /dev/null
> @@ -1,155 +0,0 @@
> -@version: 3.2
> -#
> -# Syslog-ng configuration file, compatible with default Debian syslogd -=
# installation. Originally written
> by anonymous (I can't find his name) -# Revised, and rewrited by me (SZAL=
AY Attila
> <sasa@debian.org>)
> -
> -# First, set some global options.
> -options { long_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no)=
;
> -	  owner("root"); group("adm"); perm(0640); stats_freq(0);
> -	  bad_hostname("^gconfd$");
> -};
> -
> -########################
> -# Sources
> -########################
> -# This is the default behavior of sysklogd package -# Logs may come from=
 unix stream, but not from
> another machine.
> -#
> -source s_src { unix-dgram("/dev/log"); internal();
> -       	     file("/proc/kmsg" program_override("kernel"));
> -};
> -
> -# If you wish to get logs from remote machine you should uncomment -# th=
is and comment the
> above source line.
> -#
> -#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required) en=
crypt(allow)); };
> -
> -########################
> -# Destinations
> -########################
> -# First some standard logfile
> -#
> -destination d_auth { file("/var/log/auth.log"); }; -destination d_cron {=
 file("/var/log/cron.log"); }; -
> destination d_daemon { file("/var/log/daemon.log"); }; -destination d_ker=
n
> { file("/var/log/kern.log"); }; -destination d_lpr { file("/var/log/lpr.l=
og"); }; -destination d_mail
> { file("/var/log/mail.log"); }; -destination d_syslog { file("/var/log/sy=
slog"); }; -destination d_user
> { file("/var/log/user.log"); }; -destination d_uucp { file("/var/log/uucp=
.log"); };
> -
> -# This files are the log come from the mail subsystem.
> -#
> -destination d_mailinfo { file("/var/log/mail/mail.info"); }; -destinatio=
n d_mailwarn
> { file("/var/log/mail/mail.warn"); }; -destination d_mailerr { file("/var=
/log/mail/mail.err"); };
> -
> -# Logging for INN news system
> -#
> -destination d_newscrit { file("/var/log/news/news.crit"); }; -destinatio=
n d_newserr
> { file("/var/log/news/news.err"); }; -destination d_newsnotice { file("/v=
ar/log/news/news.notice"); };
> -
> -# Some `catch-all' logfiles.
> -#
> -destination d_debug { file("/var/log/debug"); }; -destination d_error { =
file("/var/log/error"); }; -
> destination d_messages { file("/var/log/messages"); };
> -
> -# The root's console.
> -#
> -destination d_console { usertty("root"); };
> -
> -# Virtual console.
> -#
> -destination d_console_all { file("/dev/tty10"); };
> -
> -# The named pipe /dev/xconsole is for the nsole' utility.  To use it, -#=
 you must invoke nsole' with the
> -file' option:
> -#
> -#    $ xconsole -file /dev/xconsole [...]
> -#
> -destination d_xconsole { pipe("/dev/xconsole"); };
> -
> -# Send the messages to an other host
> -#
> -#destination d_net { tcp("127.0.0.1" port(1000) authentication(on) encry=
pt(on) log_fifo_size(1000)); };
> -
> -# Debian only
> -destination d_ppp { file("/var/log/ppp.log"); };
> -
> -########################
> -# Filters
> -########################
> -# Here's come the filter options. With this rules, we can set which -# m=
essage go where.
> -
> -filter f_dbg { level(debug); };
> -filter f_info { level(info); };
> -filter f_notice { level(notice); };
> -filter f_warn { level(warn); };
> -filter f_err { level(err); };
> -filter f_crit { level(crit .. emerg); };
> -
> -filter f_debug { level(debug) and not facility(auth, authpriv, news, mai=
l); }; -filter f_error { level(err ..
> emerg) ; }; -filter f_messages { level(info,notice,warn) and
> -                    not facility(auth,authpriv,cron,daemon,mail,news); }=
;
> -
> -filter f_auth { facility(auth, authpriv) and not filter(f_debug); }; -fi=
lter f_cron { facility(cron) and not
> filter(f_debug); }; -filter f_daemon { facility(daemon) and not filter(f_=
debug); }; -filter f_kern
> { facility(kern) and not filter(f_debug); }; -filter f_lpr { facility(lpr=
) and not filter(f_debug); }; -filter
> f_local { facility(local0, local1, local3, local4, local5,
> -                        local6, local7) and not filter(f_debug); };
> -filter f_mail { facility(mail) and not filter(f_debug); }; -filter f_new=
s { facility(news) and not
> filter(f_debug); }; -filter f_syslog3 { not facility(auth, authpriv, mail=
) and not filter(f_debug); }; -filter
> f_user { facility(user) and not filter(f_debug); }; -filter f_uucp { faci=
lity(uucp) and not filter(f_debug); };
> -
> -filter f_cnews { level(notice, err, crit) and facility(news); }; -filter=
 f_cother { level(debug, info, notice,
> warn) or facility(daemon, mail); };
> -
> -filter f_ppp { facility(local2) and not filter(f_debug); }; -filter f_co=
nsole { level(warn .. emerg); };
> -
> -########################
> -# Log paths
> -########################
> -log { source(s_src); filter(f_auth); destination(d_auth); }; -log { sour=
ce(s_src); filter(f_cron);
> destination(d_cron); }; -log { source(s_src); filter(f_daemon); destinati=
on(d_daemon); }; -log
> { source(s_src); filter(f_kern); destination(d_kern); }; -log { source(s_=
src); filter(f_lpr);
> destination(d_lpr); }; -log { source(s_src); filter(f_syslog3); destinati=
on(d_syslog); }; -log { source(s_src);
> filter(f_user); destination(d_user); }; -log { source(s_src); filter(f_uu=
cp); destination(d_uucp); };
> -
> -log { source(s_src); filter(f_mail); destination(d_mail); }; -#log { sou=
rce(s_src); filter(f_mail);
> filter(f_info); destination(d_mailinfo); }; -#log { source(s_src); filter=
(f_mail); filter(f_warn);
> destination(d_mailwarn); }; -#log { source(s_src); filter(f_mail); filter=
(f_err); destination(d_mailerr); };
> -
> -log { source(s_src); filter(f_news); filter(f_crit); destination(d_newsc=
rit); }; -log { source(s_src);
> filter(f_news); filter(f_err); destination(d_newserr); }; -log { source(s=
_src); filter(f_news);
> filter(f_notice); destination(d_newsnotice); }; -#log { source(s_src); fi=
lter(f_cnews);
> destination(d_console_all); }; -#log { source(s_src); filter(f_cother); d=
estination(d_console_all); };
> -
> -#log { source(s_src); filter(f_ppp); destination(d_ppp); };
> -
> -log { source(s_src); filter(f_debug); destination(d_debug); }; -log { so=
urce(s_src); filter(f_error);
> destination(d_error); }; -log { source(s_src); filter(f_messages); destin=
ation(d_messages); };
> -
> -log { source(s_src); filter(f_console); destination(d_console_all);
> -				    destination(d_xconsole); };
> -log { source(s_src); filter(f_crit); destination(d_console); };
> -
> -# All messages send to a remote site
> -#
> -#log { source(s_src); destination(d_net); }; diff --git a/meta-oe/recipe=
s-support/nonworking/syslog-
> ng/syslog-ng.inc b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng=
.inc
> deleted file mode 100644
> index 8484658..0000000
> --- a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -DESCRIPTION =3D "Alternative system logger daemon"
> -DEPENDS =3D "libol flex eventlog glib-2.0"
> -LICENSE =3D "GPL LGPL"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7ec1bcc46f28b11f4722e20d9b7dd=
4d5"
> -
> -# syslog initscript is handled explicitly because order of -# update-rc.=
d and update-alternatives is
> important -RDEPENDS_${PN} +=3D " ${@base_conditional("ONLINE_PACKAGE_MANA=
GEMENT", "none",
> "", "update-rc.d", d)}"
> -
> -INC_PR =3D "r12"
> -
> -inherit autotools systemd
> -
> -SRC_URI =3D "http://www.balabit.com/downloads/files/syslog-
> ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
> -
> -noipv6 =3D "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-i=
pv6', d)}"
> -
> -EXTRA_OECONF =3D " \
> -    --with-libnet=3D${STAGING_BINDIR_CROSS} \
> -    --enable-dynamic-linking \
> -    ${noipv6} \
> -    --enable-ssl \
> -    --disable-sub-streams \
> -    --disable-pacct \
> -    --disable-linux-caps \
> -    --disable-pcre \
> -    --disable-sql \
> -"
> -
> -EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', '--wit=
h-
> systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-systemdsys=
temunitdir', d)}"
> -EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', '--ena=
ble-systemd', '--
> disable-systemd', d)}"
> -
> -do_configure_prepend() {
> -    eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -=
e "s/-D_LARGEFILE_SOURCE//" -e
> "s/-D_FILE_OFFSET_BITS=3D64//" ${S}/configure.in', d)}"
> -}
> -
> -# rename modules.conf because it breaks update-modules -# see
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/0355=
37.html
> -do_install_append() {
> -    mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.co=
nf
> -    sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" ${D=
}/${sysconfdir}/scl.conf
> -    install -d ${D}/${sysconfdir}/${PN}
> -    install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
> -    install -d ${D}/${sysconfdir}/init.d
> -    install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslo=
g.${PN}
> -}
> -
> -FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*=
${SOLIBS} \
> -    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> -    ${base_bindir}/* ${base_sbindir}/* \
> -    ${base_libdir}/*${SOLIBS} \
> -    ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
> -    ${datadir}/include/scl/ ${datadir}/xsd"
> -FILES_${PN}-dev +=3D "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIB=
SDEV}"
> -CONFFILES_${PN} =3D "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${s=
ysconfdir}/scl-modules.conf"
> -
> -RPROVIDES_${PN} +=3D "${PN}-systemd"
> -RREPLACES_${PN} +=3D "${PN}-systemd"
> -RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "${PN}.service"
> -
> -pkg_postinst_${PN} () {
> -    /etc/init.d/syslog stop
> -    update-alternatives --install ${sysconfdir}/init.d/syslog syslog-ini=
t syslog.${PN} 200
> -
> -    if test "x$D" !=3D "x"; then
> -        OPT=3D"-r $D"
> -    else
> -        OPT=3D"-s"
> -    fi
> -    # remove all rc.d-links potentially created from alternative
> -    # syslog packages before creating new ones
> -    update-rc.d $OPT -f syslog remove
> -    update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
> -}
> -
> -pkg_prerm_${PN} () {
> -    if test "x$D" =3D "x"; then
> -        if test "$1" =3D "upgrade" -o "$1" =3D "remove"; then
> -            /etc/init.d/syslog stop
> -        fi
> -    fi
> -
> -    update-alternatives --remove syslog-init syslog.${PN}
> -}
> -
> -pkg_postrm_${PN} () {
> -    if test "x$D" !=3D "x"; then
> -        OPT=3D"-r $D"
> -    else
> -        OPT=3D""
> -    fi
> -    if test "$1" =3D "remove" -o "$1" =3D "purge"; then
> -        if ! test -e "/etc/init.d/syslog"; then
> -            update-rc.d $OPT syslog remove
> -        fi
> -    fi
> -}
> diff --git a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5=
.bb b/meta-oe/recipes-
> support/nonworking/syslog-ng/syslog-ng_3.2.5.bb
> deleted file mode 100644
> index 6d1fee7..0000000
> --- a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require syslog-ng.inc
> -PR =3D "${INC_PR}.1"
> -
> -SRC_URI +=3D " \
> -    file://syslog-ng.conf \
> -    file://initscript \
> -"
> -
> -SRC_URI[md5sum] =3D "60737452ce898f9dc7170dfdc9bfd732"
> -SRC_URI[sha256sum] =3D "ffc9f3a0ebea836c1c737b1ff49efe731d885af1d8aacf9e=
ca79d9144eeefa89"
> diff --git a/meta-oe/recipes-support/syslog-ng/files/initscript b/meta-oe=
/recipes-support/syslog-
> ng/files/initscript
> new file mode 100644
> index 0000000..b95e8ad
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/initscript
> @@ -0,0 +1,45 @@
> +#! /bin/sh
> +#
> +# This is an init script for openembedded # Copy it to
> +/etc/init.d/syslog-ng and type # > update-rc.d syslog-ng defaults 5 #
> +
> +
> +syslog_ng=3D/usr/sbin/syslog-ng
> +test -x "$syslog_ng" || exit 0
> +
> +case "$1" in
> +  start)
> +    echo -n "Starting syslog-ng:"
> +    start-stop-daemon --start --quiet --exec $syslog_ng
> +    echo "."
> +    ;;
> +  stop)
> +    echo -n "Stopping syslog-ng:"
> +    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
> +    echo "."
> +    ;;
> +  reload|force-reload)
> +    start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
> +    ;;
> +  restart)
> +    echo "Stopping syslog-ng:"
> +    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
> +    echo -n "Waiting for syslog-ng to die off"
> +    for i in 1 2 3 ;
> +    do
> +        sleep 1
> +        echo -n "."
> +    done
> +    echo ""
> +    echo -n "Starting syslog-ng:"
> +    start-stop-daemon --start --quiet --exec $syslog_ng
> +    echo "."
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/syslog-ng {start|stop|reload|restart|force-=
reload}"
> +    exit 1
> +esac
> +
> +exit 0
> diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/met=
a-oe/recipes-
> support/syslog-ng/files/syslog-ng.conf
> new file mode 100644
> index 0000000..e760dfb
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
> @@ -0,0 +1,155 @@
> +@version: 3.2
> +#
> +# Syslog-ng configuration file, compatible with default Debian syslogd
> +# installation. Originally written by anonymous (I can't find his name)
> +# Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
> +
> +# First, set some global options.
> +options { long_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no)=
;
> +	  owner("root"); group("adm"); perm(0640); stats_freq(0);
> +	  bad_hostname("^gconfd$");
> +};
> +
> +########################
> +# Sources
> +########################
> +# This is the default behavior of sysklogd package # Logs may come from
> +unix stream, but not from another machine.
> +#
> +source s_src { unix-dgram("/dev/log"); internal();
> +       	     file("/proc/kmsg" program_override("kernel")); };
> +
> +# If you wish to get logs from remote machine you should uncomment #
> +this and comment the above source line.
> +#
> +#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required)
> +encrypt(allow)); };
> +
> +########################
> +# Destinations
> +########################
> +# First some standard logfile
> +#
> +destination d_auth { file("/var/log/auth.log"); }; destination d_cron {
> +file("/var/log/cron.log"); }; destination d_daemon {
> +file("/var/log/daemon.log"); }; destination d_kern {
> +file("/var/log/kern.log"); }; destination d_lpr {
> +file("/var/log/lpr.log"); }; destination d_mail {
> +file("/var/log/mail.log"); }; destination d_syslog {
> +file("/var/log/syslog"); }; destination d_user {
> +file("/var/log/user.log"); }; destination d_uucp {
> +file("/var/log/uucp.log"); };
> +
> +# This files are the log come from the mail subsystem.
> +#
> +destination d_mailinfo { file("/var/log/mail/mail.info"); };
> +destination d_mailwarn { file("/var/log/mail/mail.warn"); };
> +destination d_mailerr { file("/var/log/mail/mail.err"); };
> +
> +# Logging for INN news system
> +#
> +destination d_newscrit { file("/var/log/news/news.crit"); };
> +destination d_newserr { file("/var/log/news/news.err"); }; destination
> +d_newsnotice { file("/var/log/news/news.notice"); };
> +
> +# Some `catch-all' logfiles.
> +#
> +destination d_debug { file("/var/log/debug"); }; destination d_error {
> +file("/var/log/error"); }; destination d_messages {
> +file("/var/log/messages"); };
> +
> +# The root's console.
> +#
> +destination d_console { usertty("root"); };
> +
> +# Virtual console.
> +#
> +destination d_console_all { file("/dev/tty10"); };
> +
> +# The named pipe /dev/xconsole is for the nsole' utility.  To use it, #
> +you must invoke nsole' with the -file' option:
> +#
> +#    $ xconsole -file /dev/xconsole [...]
> +#
> +destination d_xconsole { pipe("/dev/xconsole"); };
> +
> +# Send the messages to an other host
> +#
> +#destination d_net { tcp("127.0.0.1" port(1000) authentication(on)
> +encrypt(on) log_fifo_size(1000)); };
> +
> +# Debian only
> +destination d_ppp { file("/var/log/ppp.log"); };
> +
> +########################
> +# Filters
> +########################
> +# Here's come the filter options. With this rules, we can set which #
> +message go where.
> +
> +filter f_dbg { level(debug); };
> +filter f_info { level(info); };
> +filter f_notice { level(notice); };
> +filter f_warn { level(warn); };
> +filter f_err { level(err); };
> +filter f_crit { level(crit .. emerg); };
> +
> +filter f_debug { level(debug) and not facility(auth, authpriv, news,
> +mail); }; filter f_error { level(err .. emerg) ; }; filter f_messages {
> +level(info,notice,warn) and
> +                    not facility(auth,authpriv,cron,daemon,mail,news);
> +};
> +
> +filter f_auth { facility(auth, authpriv) and not filter(f_debug); };
> +filter f_cron { facility(cron) and not filter(f_debug); }; filter
> +f_daemon { facility(daemon) and not filter(f_debug); }; filter f_kern {
> +facility(kern) and not filter(f_debug); }; filter f_lpr { facility(lpr)
> +and not filter(f_debug); }; filter f_local { facility(local0, local1,
> +local3, local4, local5,
> +                        local6, local7) and not filter(f_debug); };
> +filter f_mail { facility(mail) and not filter(f_debug); }; filter
> +f_news { facility(news) and not filter(f_debug); }; filter f_syslog3 {
> +not facility(auth, authpriv, mail) and not filter(f_debug); }; filter
> +f_user { facility(user) and not filter(f_debug); }; filter f_uucp {
> +facility(uucp) and not filter(f_debug); };
> +
> +filter f_cnews { level(notice, err, crit) and facility(news); }; filter
> +f_cother { level(debug, info, notice, warn) or facility(daemon, mail);
> +};
> +
> +filter f_ppp { facility(local2) and not filter(f_debug); }; filter
> +f_console { level(warn .. emerg); };
> +
> +########################
> +# Log paths
> +########################
> +log { source(s_src); filter(f_auth); destination(d_auth); }; log {
> +source(s_src); filter(f_cron); destination(d_cron); }; log {
> +source(s_src); filter(f_daemon); destination(d_daemon); }; log {
> +source(s_src); filter(f_kern); destination(d_kern); }; log {
> +source(s_src); filter(f_lpr); destination(d_lpr); }; log {
> +source(s_src); filter(f_syslog3); destination(d_syslog); }; log {
> +source(s_src); filter(f_user); destination(d_user); }; log {
> +source(s_src); filter(f_uucp); destination(d_uucp); };
> +
> +log { source(s_src); filter(f_mail); destination(d_mail); }; #log {
> +source(s_src); filter(f_mail); filter(f_info); destination(d_mailinfo);
> +}; #log { source(s_src); filter(f_mail); filter(f_warn);
> +destination(d_mailwarn); }; #log { source(s_src); filter(f_mail);
> +filter(f_err); destination(d_mailerr); };
> +
> +log { source(s_src); filter(f_news); filter(f_crit);
> +destination(d_newscrit); }; log { source(s_src); filter(f_news);
> +filter(f_err); destination(d_newserr); }; log { source(s_src);
> +filter(f_news); filter(f_notice); destination(d_newsnotice); }; #log {
> +source(s_src); filter(f_cnews); destination(d_console_all); }; #log {
> +source(s_src); filter(f_cother); destination(d_console_all); };
> +
> +#log { source(s_src); filter(f_ppp); destination(d_ppp); };
> +
> +log { source(s_src); filter(f_debug); destination(d_debug); }; log {
> +source(s_src); filter(f_error); destination(d_error); }; log {
> +source(s_src); filter(f_messages); destination(d_messages); };
> +
> +log { source(s_src); filter(f_console); destination(d_console_all);
> +				    destination(d_xconsole); };
> +log { source(s_src); filter(f_crit); destination(d_console); };
> +
> +# All messages send to a remote site
> +#
> +#log { source(s_src); destination(d_net); };
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/re=
cipes-support/syslog-
> ng/syslog-ng.inc
> new file mode 100644
> index 0000000..8484658
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -0,0 +1,98 @@
> +DESCRIPTION =3D "Alternative system logger daemon"
> +DEPENDS =3D "libol flex eventlog glib-2.0"
> +LICENSE =3D "GPL LGPL"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7ec1bcc46f28b11f4722e20d9b7dd=
4d5"
> +
> +# syslog initscript is handled explicitly because order of #
> +update-rc.d and update-alternatives is important RDEPENDS_${PN} +=3D "
> +${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.=
d", d)}"
> +
> +INC_PR =3D "r12"
> +
> +inherit autotools systemd
> +
> +SRC_URI =3D "http://www.balabit.com/downloads/files/syslog-
> ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
> +
> +noipv6 =3D "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-i=
pv6', d)}"
> +
> +EXTRA_OECONF =3D " \
> +    --with-libnet=3D${STAGING_BINDIR_CROSS} \
> +    --enable-dynamic-linking \
> +    ${noipv6} \
> +    --enable-ssl \
> +    --disable-sub-streams \
> +    --disable-pacct \
> +    --disable-linux-caps \
> +    --disable-pcre \
> +    --disable-sql \
> +"
> +
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', '--wit=
h-
> systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-systemdsys=
temunitdir', d)}"
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', '--ena=
ble-systemd', '--
> disable-systemd', d)}"
> +
> +do_configure_prepend() {
> +    eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -=
e "s/-D_LARGEFILE_SOURCE//" -
> e "s/-D_FILE_OFFSET_BITS=3D64//" ${S}/configure.in', d)}"
> +}
> +
> +# rename modules.conf because it breaks update-modules # see
> +http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/03
> +5537.html
> +do_install_append() {
> +    mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.co=
nf
> +    sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" ${D=
}/${sysconfdir}/scl.conf
> +    install -d ${D}/${sysconfdir}/${PN}
> +    install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
> +    install -d ${D}/${sysconfdir}/init.d
> +    install -m 755 ${WORKDIR}/initscript
> +${D}/${sysconfdir}/init.d/syslog.${PN}
> +}
> +
> +FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*=
${SOLIBS} \
> +    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> +    ${base_bindir}/* ${base_sbindir}/* \
> +    ${base_libdir}/*${SOLIBS} \
> +    ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
> +    ${datadir}/include/scl/ ${datadir}/xsd"
> +FILES_${PN}-dev +=3D "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIB=
SDEV}"
> +CONFFILES_${PN} =3D "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${s=
ysconfdir}/scl-modules.conf"
> +
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +RREPLACES_${PN} +=3D "${PN}-systemd"
> +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "${PN}.service"
> +
> +pkg_postinst_${PN} () {
> +    /etc/init.d/syslog stop
> +    update-alternatives --install ${sysconfdir}/init.d/syslog
> +syslog-init syslog.${PN} 200
> +
> +    if test "x$D" !=3D "x"; then
> +        OPT=3D"-r $D"
> +    else
> +        OPT=3D"-s"
> +    fi
> +    # remove all rc.d-links potentially created from alternative
> +    # syslog packages before creating new ones
> +    update-rc.d $OPT -f syslog remove
> +    update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
> +}
> +
> +pkg_prerm_${PN} () {
> +    if test "x$D" =3D "x"; then
> +        if test "$1" =3D "upgrade" -o "$1" =3D "remove"; then
> +            /etc/init.d/syslog stop
> +        fi
> +    fi
> +
> +    update-alternatives --remove syslog-init syslog.${PN} }
> +
> +pkg_postrm_${PN} () {
> +    if test "x$D" !=3D "x"; then
> +        OPT=3D"-r $D"
> +    else
> +        OPT=3D""
> +    fi
> +    if test "$1" =3D "remove" -o "$1" =3D "purge"; then
> +        if ! test -e "/etc/init.d/syslog"; then
> +            update-rc.d $OPT syslog remove
> +        fi
> +    fi
> +}
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb b/meta-=
oe/recipes-
> support/syslog-ng/syslog-ng_3.2.5.bb
> new file mode 100644
> index 0000000..6d1fee7
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
> @@ -0,0 +1,10 @@
> +require syslog-ng.inc
> +PR =3D "${INC_PR}.1"
> +
> +SRC_URI +=3D " \
> +    file://syslog-ng.conf \
> +    file://initscript \
> +"
> +
> +SRC_URI[md5sum] =3D "60737452ce898f9dc7170dfdc9bfd732"
> +SRC_URI[sha256sum] =3D "ffc9f3a0ebea836c1c737b1ff49efe731d885af1d8aacf9e=
ca79d9144eeefa89"
> --
> 2.0.0


