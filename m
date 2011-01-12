Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PcvF4-0005cb-GQ for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:35:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PcvEY-0002UM-0x for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:35:06 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 08:35:06 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 08:35:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 12 Jan 2011 08:32:32 +0100
Message-ID: <igjleg$pps$1@dough.gmane.org>
References: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
X-Enigmail-Version: 1.0.1
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
X-List-Received-Date: Wed, 12 Jan 2011 07:35:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-01-11 02:43, Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> The busybox syslog syslog.conf is parsed by the /etc/init.d script, not by the
> syslog process itself, so it belongs in /etc/default.  In addition, the file
> format is *completely* different from the standard sysklogd configuration, so
> while we should resolve the file conflict between busybox-syslog and sysklogd,
> we should not use update-alternatives for it, so this is a cleaner solution.
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>  recipes/busybox/busybox.inc  |   13 +++++++++----
>  recipes/busybox/files/syslog |    4 ++--
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index a9d1e6e..1106910 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
>  SECTION = "base"
>  PRIORITY = "required"
>  
> -INC_PR = "r38"
> +INC_PR = "r39"
>  
>  SRC_URI = "\
>    file://busybox-cron \
> @@ -47,7 +47,8 @@ RDEPENDS_${PN} += "${PN}-mountall"
>  RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
>  
>  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
> -FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} ${sysconfdir}/syslog.conf"
> +FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} \
> +                      ${sysconfdir}/default/syslog"
>  FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
>  
>  FILES_${PN} += "${datadir}/udhcpc"
> @@ -58,7 +59,7 @@ INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-udhcpd"
>  INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
>  INITSCRIPT_NAME_${PN}-syslog = "syslog"
>  INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
> -CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf"
> +CONFFILES_${PN}-syslog = "${sysconfdir}/default/syslog"
>  
>  # This disables the syslog startup links in slugos (see slugos-init)
>  INITSCRIPT_PARAMS_${PN}-syslog_slugos = "start 20 ."
> @@ -168,7 +169,11 @@ do_install () {
>  
>  	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
>  		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${PN}
> -		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/
> +	        sed -i -e 's,/etc/default/syslog,${sysconfdir}/default/syslog,' \
> +	            ${D}${sysconfdir}/init.d/syslog.${PN}
> +
> +		install -d ${D}${sysconfdir}/default
> +		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/default/syslog
>  	fi
>  	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
>  		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
> diff --git a/recipes/busybox/files/syslog b/recipes/busybox/files/syslog
> index 61d273b..6e86346 100644
> --- a/recipes/busybox/files/syslog
> +++ b/recipes/busybox/files/syslog
> @@ -5,8 +5,8 @@
>  #               Configuration file added by <bruno.randolf@4g-systems.biz>
>  set -e
>  
> -if [ -f /etc/syslog.conf ]; then
> -	. /etc/syslog.conf
> +if [ -f /etc/default/syslog ]; then
> +	. /etc/default/syslog
>  	LOG_LOCAL=0
>  	LOG_REMOTE=0
>  	for D in $DESTINATION; do

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNLVkQMkyGM64RGpERAsvJAJ9WbhU0dw3A3KhaBElGnWOD7kR00ACgjCOC
XnbydKbwxeyr+YooJQoOYpg=
=evbp
-----END PGP SIGNATURE-----



