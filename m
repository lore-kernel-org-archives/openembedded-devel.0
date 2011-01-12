Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PcvDN-0005YU-LT
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:33:53 +0100
Received: by pwi8 with SMTP id 8so64188pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 23:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=irjbHLUOCKzM+N0unB+ZvEtuUnLST2Bz1PlRNkISh24=;
	b=UaXjO3n6UyGrFjVzge+ZvQFCUNNzDyZRYl9Sm3b1PL0x3XNBihq3rA1CXoqEAvIF50
	RiU6dC7s7eDg03V9HGc9Pea4fo8cEtThuCQigDDVab7KZR+ASY82p4WemPScrPH1JPvM
	FdaelBo2k/m49Xgcm1mLV8YaWTWJGXaP+hvdI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=fLj7JRFIKX3ZtR+SU1N7VDYwe90j0pPVuBOYAj/A+AEyDwSqD0FOcCTVlsc1ZprIaK
	pE93GtAGV/bDAR3+ym3o6TzjNric9RfagrwcJc4zpSA3Nu+VYlnpqkhQgUutvXWzxA4d
	N/JNi2HZuj1r9QAtzKDIS0CCuFzDuFuce9zEQ=
Received: by 10.142.112.12 with SMTP id k12mr621197wfc.188.1294817601134;
	Tue, 11 Jan 2011 23:33:21 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w42sm459215wfh.3.2011.01.11.23.33.19
	(version=SSLv3 cipher=RC4-MD5); Tue, 11 Jan 2011 23:33:20 -0800 (PST)
Message-ID: <4D2D593C.1010601@gmail.com>
Date: Tue, 11 Jan 2011 23:33:16 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
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
X-List-Received-Date: Wed, 12 Jan 2011 07:33:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/2011 5:43 PM, Chris Larson wrote:
> From: Chris Larson<chris_larson@mentor.com>
>
> The busybox syslog syslog.conf is parsed by the /etc/init.d script, not by the
> syslog process itself, so it belongs in /etc/default.  In addition, the file
> format is *completely* different from the standard sysklogd configuration, so
> while we should resolve the file conflict between busybox-syslog and sysklogd,
> we should not use update-alternatives for it, so this is a cleaner solution.
>
> Signed-off-by: Chris Larson<chris_larson@mentor.com>

looks ok will upgrade paths work ok after this change

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   recipes/busybox/busybox.inc  |   13 +++++++++----
>   recipes/busybox/files/syslog |    4 ++--
>   2 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index a9d1e6e..1106910 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
>   SECTION = "base"
>   PRIORITY = "required"
>
> -INC_PR = "r38"
> +INC_PR = "r39"
>
>   SRC_URI = "\
>     file://busybox-cron \
> @@ -47,7 +47,8 @@ RDEPENDS_${PN} += "${PN}-mountall"
>   RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
>
>   FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
> -FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} ${sysconfdir}/syslog.conf"
> +FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} \
> +                      ${sysconfdir}/default/syslog"
>   FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
>
>   FILES_${PN} += "${datadir}/udhcpc"
> @@ -58,7 +59,7 @@ INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-udhcpd"
>   INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
>   INITSCRIPT_NAME_${PN}-syslog = "syslog"
>   INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
> -CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf"
> +CONFFILES_${PN}-syslog = "${sysconfdir}/default/syslog"
>
>   # This disables the syslog startup links in slugos (see slugos-init)
>   INITSCRIPT_PARAMS_${PN}-syslog_slugos = "start 20 ."
> @@ -168,7 +169,11 @@ do_install () {
>
>   	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
>   		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${PN}
> -		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/
> +	        sed -i -e 's,/etc/default/syslog,${sysconfdir}/default/syslog,' \
> +	            ${D}${sysconfdir}/init.d/syslog.${PN}
> +
> +		install -d ${D}${sysconfdir}/default
> +		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/default/syslog
>   	fi
>   	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
>   		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
> diff --git a/recipes/busybox/files/syslog b/recipes/busybox/files/syslog
> index 61d273b..6e86346 100644
> --- a/recipes/busybox/files/syslog
> +++ b/recipes/busybox/files/syslog
> @@ -5,8 +5,8 @@
>   #               Configuration file added by<bruno.randolf@4g-systems.biz>
>   set -e
>
> -if [ -f /etc/syslog.conf ]; then
> -	. /etc/syslog.conf
> +if [ -f /etc/default/syslog ]; then
> +	. /etc/default/syslog
>   	LOG_LOCAL=0
>   	LOG_REMOTE=0
>   	for D in $DESTINATION; do



