Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PfeNB-0007Uq-1y
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 21:11:17 +0100
Received: by ywi6 with SMTP id 6so543696ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 12:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=uSyrn/IqV4XQvgVJr9sGC1aiIYe5+o80ZIbP0byqysE=;
	b=JIhFAg3vXhWDtJcF2Pb7UohfIPXCqjGmA79iM0MgAvxW0ZV8/pkQIsciY0yLJh9nJN
	NQdlPX29s+9WJSgI4OEls3aOn1NSx1PSgJcTvPFaP2vkVnjjXIbBoDexFHis2uOxlO7c
	bZ02n+JAuVIxoPx9ozUZnISiYmvTUfv4SO7SQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=mjimh8whTCENLTlI0ACcTTjgqTN6TpEyK5FMbdsmLJgxqmS0lSbLOFTgwSSGjsi8UA
	geLJmsMVyIiYSQkgJt0BXK0YmGftGJpinAxwEgvsgtlpIzUjxFz7vD1yxJmYtE+p/fQ7
	ReDv5UT1neqEEudXnZZ5I2eWQYqV+/TrP2xDs=
MIME-Version: 1.0
Received: by 10.227.156.137 with SMTP id x9mr1356483wbw.55.1295467835562; Wed,
	19 Jan 2011 12:10:35 -0800 (PST)
Received: by 10.227.13.69 with HTTP; Wed, 19 Jan 2011 12:10:35 -0800 (PST)
In-Reply-To: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
References: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
Date: Wed, 19 Jan 2011 21:10:35 +0100
Message-ID: <AANLkTikYazjAUC3MpsKZt3xOJYHA=AoZGtfooLHgAe2R@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] busybox: move syslog config to /etc/default
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
X-List-Received-Date: Wed, 19 Jan 2011 20:11:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2011 at 2:43 AM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> The busybox syslog syslog.conf is parsed by the /etc/init.d script, not b=
y the
> syslog process itself, so it belongs in /etc/default. =A0In addition, the=
 file
> format is *completely* different from the standard sysklogd configuration=
, so
> while we should resolve the file conflict between busybox-syslog and sysk=
logd,
> we should not use update-alternatives for it, so this is a cleaner soluti=
on.
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>
> ---
> =A0recipes/busybox/busybox.inc =A0| =A0 13 +++++++++----
> =A0recipes/busybox/files/syslog | =A0 =A04 ++--
> =A02 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index a9d1e6e..1106910 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -11,7 +11,7 @@ LICENSE =3D "GPLv2"
> =A0SECTION =3D "base"
> =A0PRIORITY =3D "required"
>
> -INC_PR =3D "r38"
> +INC_PR =3D "r39"
>
> =A0SRC_URI =3D "\
> =A0 file://busybox-cron \
> @@ -47,7 +47,8 @@ RDEPENDS_${PN} +=3D "${PN}-mountall"
> =A0RRECOMMENDS_${PN} +=3D "libgcc ${PN}-syslog"
>
> =A0FILES_${PN}-httpd =3D "${sysconfdir}/init.d/busybox-httpd /srv/www"
> -FILES_${PN}-syslog =3D "${sysconfdir}/init.d/syslog.${PN} ${sysconfdir}/=
syslog.conf"
> +FILES_${PN}-syslog =3D "${sysconfdir}/init.d/syslog.${PN} \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${sysconfdir}/default/syslog=
"
> =A0FILES_${PN}-udhcpd =3D "${sysconfdir}/init.d/busybox-udhcpd"
>
> =A0FILES_${PN} +=3D "${datadir}/udhcpc"
> @@ -58,7 +59,7 @@ INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-udhcpd"
> =A0INITSCRIPT_NAME_${PN}-httpd =3D "busybox-httpd"
> =A0INITSCRIPT_NAME_${PN}-syslog =3D "syslog"
> =A0INITSCRIPT_NAME_${PN}-udhcpd =3D "busybox-udhcpd"
> -CONFFILES_${PN}-syslog =3D "${sysconfdir}/syslog.conf"
> +CONFFILES_${PN}-syslog =3D "${sysconfdir}/default/syslog"
>
> =A0# This disables the syslog startup links in slugos (see slugos-init)
> =A0INITSCRIPT_PARAMS_${PN}-syslog_slugos =3D "start 20 ."
> @@ -168,7 +169,11 @@ do_install () {
>
> =A0 =A0 =A0 =A0if grep -q "CONFIG_SYSLOGD=3Dy" ${WORKDIR}/defconfig; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/syslog ${D}${sy=
sconfdir}/init.d/syslog.${PN}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 644 ${WORKDIR}/syslog.conf ${D}$=
{sysconfdir}/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e 's,/etc/default/syslog,${sysconfd=
ir}/default/syslog,' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${D}${sysconfdir}/init.d/syslog.${P=
N}

Hi,

Here it's right but to OE you've pushed version of patch where it is
also renamed to
default/busybox-syslog, but that patern in sed call
's,/etc/default/busybox-syslog,' should still read
's,/etc/default/syslog,', otherwise nothing is replaced and
syslog.busybox is still trying to read /etc/default/syslog which does
not exist

or rename it to busybox-syslog in files/syslog file too
http://git.openembedded.org/cgit.cgi/openembedded/commit/recipes/busybox/fi=
les/syslog?id=3Da25c0750c7892990c59e8d6048b8c4d99410bcee

Regards,

+	        sed -i -e
's,/etc/default/busybox-syslog,${sysconfdir}/default/busybox-syslog,'
\
+	            ${D}${sysconfdir}/init.d/syslog.${PN}

> +


> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}${sysconfdir}/default
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 644 ${WORKDIR}/syslog.conf ${D}$=
{sysconfdir}/default/syslog
> =A0 =A0 =A0 =A0fi
> =A0 =A0 =A0 =A0if grep "CONFIG_CROND=3Dy" ${WORKDIR}/defconfig; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/busybox-cron ${=
D}${sysconfdir}/init.d/
> diff --git a/recipes/busybox/files/syslog b/recipes/busybox/files/syslog
> index 61d273b..6e86346 100644
> --- a/recipes/busybox/files/syslog
> +++ b/recipes/busybox/files/syslog
> @@ -5,8 +5,8 @@
> =A0# =A0 =A0 =A0 =A0 =A0 =A0 =A0 Configuration file added by <bruno.rando=
lf@4g-systems.biz>
> =A0set -e
>
> -if [ -f /etc/syslog.conf ]; then
> - =A0 =A0 =A0 . /etc/syslog.conf
> +if [ -f /etc/default/syslog ]; then
> + =A0 =A0 =A0 . /etc/default/syslog
> =A0 =A0 =A0 =A0LOG_LOCAL=3D0
> =A0 =A0 =A0 =A0LOG_REMOTE=3D0
> =A0 =A0 =A0 =A0for D in $DESTINATION; do
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


