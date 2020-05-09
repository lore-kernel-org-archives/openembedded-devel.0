Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.4053.1588992832620560816
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 19:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cz18TQnn;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id b1so2451935qtt.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 19:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9SymPGUJyDLRUgWjBW5A21OBi8dngqFUrOptzCofykk=;
        b=Cz18TQnns0u2Z6A+NuC91XqCao59GII5ttHalD4qJ/1B8Hrim5XriRLh/aGyujulSc
         nGuf5/fb7UQDDeGGZPKy31LJ7IK51UyQGbfZhVSOG5hj2w/0Kp8BFUnitMNa7kdjuM8A
         asBvU6WpQm7//zrGRJL/mVNRtRSX6YUp0d9+uaTEboci9INRkmYDBgDwsCWQU6WTViiw
         /0zpHYSwqvMczvkGwEwLrUgmaKJiUfbbw/GEj5SQLJGx5G75hWXCMK1CMW13U8lKKtdR
         i9SRWF712zbjli3fzDNILbKI/FSOI4Hkk5R1rKtl47NTLL/5vIiEXcd1PrCCG4IsJlIA
         POVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9SymPGUJyDLRUgWjBW5A21OBi8dngqFUrOptzCofykk=;
        b=e6FknJhSC+6Ji7EnrFkBY4IpppAfLyqxfHrVajQ0BwBxdHmIfYAByRJgO59VNVt1rh
         m8lyOmSPnbPjGpdsiC4DJBLidEvKbN1tAPWoIxjmxe7r7TBJX2zViXt6X0ukEv97ONGn
         DYqdsyO91zDIdb6ikk67MiPybNR4LdhKtrvRY/lb58Felsmpl67QVtfUwJmO3vFruOob
         gaDs7lOS39VImhs8xcut2LmGhFbw0Allf8nFSXbrO8yX9TLgDPOmEMlE4f8Sl+RDPU2T
         5KpFsWhSPpZQ08bNOfYK/tdOAzCSPw3xQrYqIYmEuj4wRrDCQH4uf2pWE/Tn2SjF9y9/
         7H/g==
X-Gm-Message-State: AGi0PuYQ3FbKhycBtIT6FFDLY9zQhGMHShdFaKnMgZ2tmrwkdc1OMLtG
	82Wf1JxD0DZ3UDqDRSQRbg0XSFj72m3FrrdmT0gKXjCmKCc=
X-Google-Smtp-Source: APiQypKCKTE951bCQCJCMqw0P77xGj0HmDpjlyFxOzgsRXTkdYZB9gyKRYexryri5nBAJA1wblXolWTwX0EyGqwYZ1g=
X-Received: by 2002:ac8:4311:: with SMTP id z17mr5757097qtm.316.1588992831332;
 Fri, 08 May 2020 19:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200507103712.3356068-1-beniaminsandu@gmail.com>
In-Reply-To: <20200507103712.3356068-1-beniaminsandu@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 8 May 2020 19:53:25 -0700
Message-ID: <CAMKF1soGerMVWqAbYS6Qwz7+RPGa9CgbRrtspHN9=awrS7KeEQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] rasdaemon: create recipe for version 0.6.5
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 7, 2020 at 3:37 AM Beni <beniaminsandu@gmail.com> wrote:
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  meta-oe/recipes-support/rasdaemon/files/init  | 43 ++++++++++++++++
>  .../rasdaemon/files/rasdaemon.service         | 12 +++++
>  .../rasdaemon/rasdaemon_0.6.5.bb              | 51 +++++++++++++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 meta-oe/recipes-support/rasdaemon/files/init
>  create mode 100644 meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
>  create mode 100644 meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
>
> diff --git a/meta-oe/recipes-support/rasdaemon/files/init b/meta-oe/recipes-support/rasdaemon/files/init
> new file mode 100644
> index 000000000..216677e73
> --- /dev/null
> +++ b/meta-oe/recipes-support/rasdaemon/files/init
> @@ -0,0 +1,43 @@
> +#! /bin/sh
> +# /etc/init.d/rasdaemon: start rasdaemon service
> +
> +. /etc/init.d/functions
> +
> +# Defaults
> +PIDFILE=/var/run/rasdaemon.pid
> +BINFILE=/usr/sbin/rasdaemon
> +SCRIPTNAME=/etc/init.d/rasdaemon
> +
> +[ -x $BINFILE ] || exit 0
> +
> +case "$1" in
> +       start)
> +               echo -n "Starting RASdaemon services: "
> +               if [ ! -f "$PIDFILE" ]; then
> +                       start-stop-daemon --start --quiet --exec $BINFILE -- --enable &> /dev/null
> +                       start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $BINFILE -- --record
> +                       pidof $BINFILE > $PIDFILE
> +               fi
> +               [ -f $PIDFILE ] && echo "done." || echo "fail."
> +               ;;
> +       stop)
> +               echo -n "Stopping RASdaemon services: "
> +               if [ -f  "$PIDFILE" ] ; then
> +                       start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $BINFILE -- --disable &> /dev/null
> +                       killproc $BINFILE
> +                       rm $PIDFILE
> +               fi
> +               [ ! -f $PIDFILE ] && echo "done." || echo "fail."
> +               ;;
> +       restart)
> +               $0 stop
> +               sleep 1
> +               $0 start
> +               ;;
> +       status)
> +               status $BINFILE
> +               ;;
> +       *)
> +               echo "Usage: $SCRIPTNAME {start|stop|restart|status}"
> +               exit 1
> +esac
> diff --git a/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service b/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
> new file mode 100644
> index 000000000..4fbf23142
> --- /dev/null
> +++ b/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=RAS daemon to log the RAS events
> +After=syslog.target
> +
> +[Service]
> +ExecStart=/usr/sbin/rasdaemon -f -r
> +ExecStartPost=/usr/sbin/rasdaemon --enable
> +ExecStop=/usr/sbin/rasdaemon --disable
> +Restart=on-abort
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb b/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
> new file mode 100644
> index 000000000..c1b9fdbaa
> --- /dev/null
> +++ b/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
> @@ -0,0 +1,51 @@
> +DESCRIPTION = "Tools to provide a way to get Platform Reliability, Availability and Serviceability (RAS) reports made via the Kernel tracing events"
> +HOMEPAGE = "http://git.infradead.org/users/mchehab/rasdaemon.git"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
> +
> +SRC_URI = "git://git.infradead.org/users/mchehab/rasdaemon.git;branch=master \
> +       file://rasdaemon.service \
> +       file://init"
> +
> +SRCREV = "25533c0c55426eeb2ad25dcbdb2b5e4ba4e83d80"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${BPN} = "perl perl-module-file-basename perl-module-file-find perl-module-file-spec perl-module-getopt-long \
> +       perl-module-posix perl-module-file-glob libdbi-perl libdbd-sqlite-perl"
> +

depending on libdbd-sqlite-perl will make meta-oe depend on meta-perl, so far
we have avoided this dependency, is there a way to make this configurable ?

> +inherit autotools pkgconfig update-rc.d systemd
> +
> +PACKAGECONFIG ??= "sqlite3 mce aer extlog devlink diskerror"
> +PACKAGECONFIG[sqlite3] = "--enable-sqlite3,--disable-sqlite3,sqlite3"
> +PACKAGECONFIG[mce] = "--enable-mce,--disable-mce"
> +PACKAGECONFIG[aer] = "--enable-aer,--disable-aer"
> +PACKAGECONFIG[extlog] = "--enable-extlog,--disable-extlog"
> +PACKAGECONFIG[devlink] = "--enable-devlink,--disable-devlink"
> +PACKAGECONFIG[diskerror] = "--enable-diskerror,--disable-diskerror"
> +PACKAGECONFIG[arm] = "--enable-arm,--disable-arm"
> +PACKAGECONFIG[hisi-ns-decode] = "--enable-hisi-ns-decode,--disable-hisi-ns-decode"
> +PACKAGECONFIG[non-standard] = "--enable-non-standard,--disable-non-standard"
> +PACKAGECONFIG[abrt-report] = "--enable-abrt-report,--disable-abrt-report"
> +
> +do_configure_prepend () {
> +       ( cd ${S}; autoreconf -vfi )
> +}
> +
> +do_install_append() {
> +       install -d ${D}${sysconfdir}/init.d
> +       install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rasdaemon
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 0644 ${WORKDIR}/rasdaemon.service ${D}${systemd_unitdir}/system
> +}
> +
> +FILES_${PN} += "${sbindir}/rasdaemon \
> +               ${sysconfdir}/init.d \
> +               ${systemd_unitdir}/system/rasdaemon.service"
> +
> +SYSTEMD_SERVICE_${PN} = "rasdaemon.service"
> +SYSTEMD_AUTO_ENABLE = "enable"
> +
> +INITSCRIPT_PACKAGES = "${PN}"
> +INITSCRIPT_NAME_${PN} = "rasdaemon"
> +INITSCRIPT_PARAMS_${PN} = "defaults 89"
> --
> 2.25.1
>
> 
