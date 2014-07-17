Return-Path: <eduardo@monkey.io>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8606AC6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 17:06:29 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so3161705wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 10:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=IifGdG80GMjENzJXevYhajZvPGwjDFDOk9P/vrzmDzE=;
	b=HoBIr4Vb8p+r6XSGSD0Wg8zlLu2kDI682JDLeIXFWt7l9yYih/bWIzJ4f0Irw0vEjo
	cA+FtaQDXa1RS5G7WViDDKvWyliiC64sQxzjejLwS76Q0LqamwpztJtGrjrQxhOLsegD
	eAvTXICNdaG0ZkAK79iINd5X2FckrAAwHLSSzU/o4u3Rgj03jcOdVzk/e0JQZRCUrSr4
	CV1epXWO/9F3aF4VcICT8UKdh2PelD/JpFVfm4dRlOHCGwntQ2p+GEmBRyxlecVYnYkS
	34NV0bt/eNsFKMbe+fMWUuAI1gPjBQGwXu7M7nqsXRpodm9CyTD4F1CGqU+d73oVvsWp
	L8HQ==
X-Gm-Message-State: ALoCoQm5qPoz1m6fPTN8adYn9JqBMPul+LK0mQuX1JrMzizPCt6CP0B13qTCVcpaKE9O+Vao3+2D
MIME-Version: 1.0
X-Received: by 10.180.36.238 with SMTP id t14mr4740115wij.38.1405616788733;
	Thu, 17 Jul 2014 10:06:28 -0700 (PDT)
Received: by 10.194.88.135 with HTTP; Thu, 17 Jul 2014 10:06:28 -0700 (PDT)
In-Reply-To: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
Date: Thu, 17 Jul 2014 11:06:28 -0600
Message-ID: <CAEaCVQitMdMwCeoLnzrZGK65Qh9J_JtJqANGuKnRY=X2iL1-8g@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Thu, 17 Jul 2014 17:06:32 -0000
Content-Type: text/plain; charset=UTF-8

additional notes on this patch:

 - tested with Sato image with systemd
 - tested with Sato image with common init.d sript.



On Sat, Jul 12, 2014 at 12:37 AM, Eduardo Silva <eduardo@monkey.io> wrote:

> This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fixes
> some problems when switching user when started as root.
>
> monkey/yocto: 941ce3a55496d42164164877735db6c8def63265
>
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  .../recipes-httpd/monkey/files/monkey.init         | 34
> ++++++++++++++++++++++
>  .../recipes-httpd/monkey/files/monkey.service      | 12 ++++++++
>  .../monkey/{monkey_1.5.0.bb => monkey_1.5.1.bb}    | 25 ++++++++++++----
>  3 files changed, 65 insertions(+), 6 deletions(-)
>  create mode 100644 meta-webserver/recipes-httpd/monkey/files/monkey.init
>  create mode 100644
> meta-webserver/recipes-httpd/monkey/files/monkey.service
>  rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.0.bb =>
> monkey_1.5.1.bb} (59%)
>
> diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.init
> b/meta-webserver/recipes-httpd/monkey/files/monkey.init
> new file mode 100644
> index 0000000..40b2118
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/monkey/files/monkey.init
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +
> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
> +DAEMON=/usr/bin/monkey
> +NAME=monkey
> +DESC="Monkey HTTP Server"
> +OPTS="--daemon"
> +
> +case "$1" in
> +  start)
> +       echo -n "Starting $DESC: "
> +       start-stop-daemon --start -x "$DAEMON" -- $OPTS
> +       echo "$NAME."
> +       ;;
> +  stop)
> +       echo -n "Stopping $DESC: "
> +       start-stop-daemon --stop -x "$DAEMON"
> +       echo "$NAME."
> +       ;;
> +  restart|force-reload)
> +       echo -n "Restarting $DESC: "
> +       start-stop-daemon --stop -x "$DAEMON"
> +       sleep 1
> +       start-stop-daemon --start -x "$DAEMON" -- $OPTS
> +       echo "$NAME."
> +       ;;
> +  *)
> +       N=/etc/init.d/$NAME
> +       echo "Usage: $N {start|stop|restart|force-reload}" >&2
> +       exit 1
> +       ;;
> +esac
> +
> +exit 0
> diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.service
> b/meta-webserver/recipes-httpd/monkey/files/monkey.service
> new file mode 100644
> index 0000000..f9aa57f
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/monkey/files/monkey.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=Monkey HTTP Server
> +After=network.target remote-fs.target
> +
> +[Service]
> +Type=forking
> +ExecStart=/usr/bin/monkey --daemon
> +PIDFile=/var/run/monkey.pid.2001
> +TimeoutSec=10
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> similarity index 59%
> rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> index 6fa1b77..7d0239e 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> @@ -7,22 +7,24 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>
>  SECTION = "net"
>
> -SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
> -SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
> -SRC_URI[sha256sum] =
> "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7"
> +SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
> +           file://monkey.service \
> +           file://monkey.init"
> +
> +SRC_URI[md5sum] = "2fe04135728f5c3a86c3a412059e0da3"
> +SRC_URI[sha256sum] =
> "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757bfeb72edddf457e7"
>
>  EXTRA_OECONF = " \
>               --plugdir=${libdir}/monkey/ \
>               --logdir=${localstatedir}/log/monkey/ \
>               --pidfile=${localstatedir}/run/monkey.pid \
>               --default-user=www-data \
> -             --datadir= ${localstatedir}/www/monkey/ \
> +             --datadir=${localstatedir}/www/monkey/ \
>               --sysconfdir=${sysconfdir}/monkey/ \
>               --enable-plugins=* \
>               --disable-plugins=polarssl \
>               --debug \
> -             --malloc-libc \
> -"
> +             --malloc-libc"
>
>  inherit autotools-brokensep pkgconfig update-rc.d systemd
>
> @@ -34,3 +36,14 @@ SYSTEMD_SERVICE_${PN} = "monkey.service"
>  FILES_${PN} += "${localstatedir}/www/monkey/"
>
>  CONFFILES_${PN} = "${sysconfdir}/monkey/"
> +
> +do_install_append() {
> +
> +    mkdir -p ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/monkey.service
> ${D}/${systemd_unitdir}/system
> +    fi
> +}
> --
> 1.9.1
>
>


-- 
Eduardo Silva
Monkey Software

