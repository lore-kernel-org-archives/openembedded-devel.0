Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UK74M-0005PS-BU
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 14:04:14 +0100
Received: by mail-ve0-f179.google.com with SMTP id da11so5019154veb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=ttMdtsjuYaENn7vu2/rVWiY2REiafGiDHLGNC2PhsZY=;
	b=O02vMfA4vq5ZFg9oyhRUGklvLH6chGgalxzKNuv/F43Zwdq+zdKmssltbFt7v78buo
	UecKYM388wOunE4xVJEfkn94efmsqRnVxlxve8gEhkrqEGqDHs44r80gz67guSTzycxb
	UEbekSMq/ShIz3bS3miafCkjSQx2DPmgKRQ/RYCoM3yL/YFepd0oQAzc7ngN2Xm4RR/g
	StKok+QB/DkLPJ2ALYFS5pte/Cldp1yDJWtCfVikhNK+7nEhmvowNpO69TipkjyH+2Fi
	c8VUiOL54kHWvNJJveoc7+Pi7JrUxGpvSyhOeiS4j8F6rNelVfkbx13wvFlryFBrs561
	uK/A==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr13177631vds.27.1364215631601;
	Mon, 25 Mar 2013 05:47:11 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Mon, 25 Mar 2013 05:47:11 -0700 (PDT)
In-Reply-To: <9ef1ee1552757f3cf5cb979a9df7cf45f38b2f7a.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
	<9ef1ee1552757f3cf5cb979a9df7cf45f38b2f7a.1363973088.git.ross.burton@intel.com>
Date: Mon, 25 Mar 2013 13:47:11 +0100
Message-ID: <CALbNGRQ7B6x55wvuwSkZy6TwMV73VLAMbKJFS+f1D-dr6Rkfpg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/22] busybox: enable systemd integration for syslogd
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
X-List-Received-Date: Mon, 25 Mar 2013 13:04:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2013 at 6:38 PM, Ross Burton <ross.burton@intel.com> wrote:
> From: Radu Moisan <radu.moisan@intel.com>
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/busybox/busybox.inc                |   18 ++++++++++++=
++++--
>  meta/recipes-core/busybox/busybox_1.20.2.bb          |    2 ++
>  .../busybox/files/busybox-klogd.service.in           |    8 ++++++++
>  .../busybox/files/busybox-syslog.service.in          |   13 ++++++++++++=
+
>  4 files changed, 39 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service=
.in
>  create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.servic=
e.in
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index fc6ca91..e936e59 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -18,7 +18,7 @@ export EXTRA_LDFLAGS =3D "${LDFLAGS}"
>  PACKAGES =3D+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-=
mdev ${PN}-hwclock"
>
>  FILES_${PN}-httpd =3D "${sysconfdir}/init.d/busybox-httpd /srv/www"
> -FILES_${PN}-syslog =3D "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslo=
g-startup.conf*"
> +FILES_${PN}-syslog =3D "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslo=
g-startup.conf* ${systemd_unitdir}/system/syslog.service"
>  FILES_${PN}-mdev =3D "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
>  FILES_${PN}-udhcpd =3D "${sysconfdir}/init.d/busybox-udhcpd"
>  FILES_${PN}-udhcpc =3D "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
> @@ -32,12 +32,16 @@ INITSCRIPT_NAME_${PN}-mdev =3D "mdev"
>  INITSCRIPT_NAME_${PN}-hwclock =3D "hwclock.sh"
>  INITSCRIPT_PARAMS_${PN}-mdev =3D "start 06 S ."
>  INITSCRIPT_NAME_${PN}-udhcpd =3D "busybox-udhcpd"
> +
> +SYSTEMD_PACKAGES =3D "${PN}-syslog"
> +SYSTEMD_SERVICE_${PN}-syslog =3D "${PN}-syslog.service"
> +
>  CONFFILES_${PN}-syslog =3D "${sysconfdir}/syslog-startup.conf.${BPN}"
>  CONFFILES_${PN}-mdev =3D "${sysconfdir}/mdev.conf"
>
>  RRECOMMENDS_${PN} =3D "${PN}-syslog ${PN}-udhcpc"
>
> -inherit cml1 update-rc.d
> +inherit cml1 systemd update-rc.d
>
>  # internal helper
>  def busybox_cfg(feature, features, tokens, cnf, rem):
> @@ -213,6 +217,16 @@ do_install () {
>                 fi
>         fi
>         install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-sy=
slog.service.in \
> +            > ${D}${systemd_unitdir}/system/busybox-syslog.service
> +        sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-kl=
ogd.service.in \
> +            > ${D}${systemd_unitdir}/system/busybox-klogd.service
> +
> +        ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
> +    fi
>  }
>
>  inherit update-alternatives
> diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-c=
ore/busybox/busybox_1.20.2.bb
> index 783261e..a02cd38 100644
> --- a/meta/recipes-core/busybox/busybox_1.20.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
> @@ -28,6 +28,8 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-$=
{PV}.tar.bz2;name=3Dtarball \
>             file://fix-for-spurious-testsuite-failure.patch \
>             file://busybox-1.20.2-kernel_ver.patch \
>             file://stat-usr-bin.patch \
> +           file://busybox-syslog.service.in \
> +           file://busybox-klogd.service.in \
>             file://testsuite-du-du-k-works-fix-false-positive.patch"
>
>  SRC_URI[tarball.md5sum] =3D "e025414bc6cd79579cc7a32a45d3ae1c"
> diff --git a/meta/recipes-core/busybox/files/busybox-klogd.service.in b/m=
eta/recipes-core/busybox/files/busybox-klogd.service.in
> new file mode 100644
> index 0000000..d7c7755
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/busybox-klogd.service.in
> @@ -0,0 +1,8 @@
> +[Unit]
> +Description=3DKernel Logging Service
> +
> +[Service]
> +ExecStart=3D@base_sbindir@/klogd -n
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta/recipes-core/busybox/files/busybox-syslog.service.in b/=
meta/recipes-core/busybox/files/busybox-syslog.service.in
> new file mode 100644
> index 0000000..2e04321
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/busybox-syslog.service.in
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DSystem Logging Service
> +Wants=3Dbusybox-klogd.service
> +
> +[Service]
> +EnvironmentFile=3D-/etc/default/busybox-syslog
> +ExecStart=3D@base_sbindir@/syslogd -n $OPTIONS
> +Sockets=3Dsyslog.socket
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> +Also=3Dbusybox-klogd.service
> +Alias=3Dsyslog.service
> --
> 1.7.10.4
>
>
Wanted to give patches 01 & 02 a test - to fix tmp.mount issue. patch
01 does not appear in patchwork and in gmail 'Show original' I see
only binary data garbage. Did something go wrong on transmission?

Andreas


