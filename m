Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqLn-0002jm-Vq
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:00:01 +0100
Received: by iyj8 with SMTP id 8so1737879iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=+FDxcnNR4jt8QWKKGtM073PoOpYMpOHbx+18FvugGpU=;
	b=iFZXmnZrL6mXAt1sWAt0LsUkjlVCVSouVnWs8/FHWI2VaxxG0ZOP3jNwXdxrcXc0Fc
	ztuzqNV8bocfZ6gs3ZY2Ru4Zpy5Wcmoi1HOnuVciCsFN4Vc3sPtCrNf7hzsrXsCqzEbo
	mCNDv6H5flWiBd/E+etemtJrB2AQOEIZmrWE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=Cx9GFQCmNvFsGgYeRW2HCK6XRcjTOAqQFu91NCWwj32j9bhQp58hHXNRK9aMgNnWCW
	oDr5QT+hCCRqllcFTivDvTEM11rhYq+qA1yGGJIAjfpYmoBN6i7qwpXhosDXuxVkL3nU
	SEVQemMmPsNB+rDGbFMyBrqBJex5gczEFJ7eI=
Received: by 10.42.227.3 with SMTP id iy3mr1730844icb.435.1297897127037;
	Wed, 16 Feb 2011 14:58:47 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i16sm178579ibl.6.2011.02.16.14.58.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:58:45 -0800 (PST)
Date: Wed, 16 Feb 2011 14:58:48 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216225848.GL14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
	<1297852433-31160-6-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1297852433-31160-6-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 06/10] busybox: add group to -passwd package
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
X-List-Received-Date: Wed, 16 Feb 2011 23:00:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/02/11 11:33), Eric Bénard wrote:
> From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Acked-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/busybox/busybox.inc      |    6 +++++-
>  recipes/busybox/busybox_1.1x.inc |    1 +
>  recipes/busybox/files/group      |   12 ++++++++++++
>  recipes/busybox/files/passwd     |    3 ---
>  recipes/busybox/files/shadow     |    3 ---
>  5 files changed, 18 insertions(+), 7 deletions(-)
>  create mode 100644 recipes/busybox/files/group
> 
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index 9c0bddc..dc97c5f 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -19,6 +19,7 @@ SRC_URI = "\
>    file://busybox-udhcpd \
>    file://default.script file://simple.script \
>    file://dhcp-hostname.patch \
> +  file://group \
>    file://hwclock.sh \
>    file://hwclock-default \
>    file://ifupdown-spurious-environ.patch \
> @@ -56,7 +57,7 @@ RPROVIDES_${PN}-inetd = "inetd"
>  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>  FILES_${PN}-inetd = "${sysconfdir}/init.d/inetd.${PN} \
>                       ${sysconfdir}/inetd.conf"
> -FILES_${PN}-passwd = "${sysconfdir}/passwd.${PN}"
> +FILES_${PN}-passwd = "${sysconfdir}/passwd.${PN} ${sysconfdir}/group.${PN}"
>  FILES_${PN}-shadow = "${sysconfdir}/shadow.${PN}"
>  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} \
>                        ${sysconfdir}/default/busybox-syslog"
> @@ -196,6 +197,7 @@ do_install () {
>  
>  	if grep -q "CONFIG_PASSWD=y" ${WORKDIR}/defconfig; then
>  	    install -m 0644 ${WORKDIR}/passwd ${D}${sysconfdir}/passwd.${PN}
> +	    install -m 0644 ${WORKDIR}/group ${D}${sysconfdir}/group.${PN}
>  	    if grep -q "CONFIG_FEATURE_SHADOWPASSWDS=y" ${WORKDIR}/defconfig; then
>  	        install -m 0640 ${WORKDIR}/shadow ${D}${sysconfdir}/shadow.${PN}
>              fi
> @@ -293,9 +295,11 @@ pkg_prerm_${PN}-mountall () {
>  
>  pkg_postinst_${PN}-passwd () {
>  	update-alternatives --install ${sysconfdir}/passwd default_passwd passwd.${PN} 50
> +	update-alternatives --install ${sysconfdir}/group default_group group.${PN} 50
>  }
>  pkg_prerm_${PN}-passwd () {
>  	update-alternatives --remove default_passwd passwd.${PN}
> +	update-alternatives --remove default_group group.${PN}
>  }
>  
>  pkg_postinst_${PN}-shadow () {
> diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
> index 763b324..7623944 100644
> --- a/recipes/busybox/busybox_1.1x.inc
> +++ b/recipes/busybox/busybox_1.1x.inc
> @@ -13,6 +13,7 @@ SRC_URI = "\
>    file://busybox-httpd \
>    file://busybox-udhcpd \
>    file://default.script file://simple.script \
> +  file://group \
>    file://hwclock.sh \
>    file://hwclock-default \
>    file://inetd \
> diff --git a/recipes/busybox/files/group b/recipes/busybox/files/group
> new file mode 100644
> index 0000000..3dd8cdd
> --- /dev/null
> +++ b/recipes/busybox/files/group
> @@ -0,0 +1,12 @@
> +root:x:0:
> +daemon:x:1:
> +bin:x:2:
> +sys:x:3:
> +tty:x:5:
> +disk:x:6:
> +mail:x:8:
> +man:x:12:
> +www-data:x:33:
> +utmp:x:43:
> +nogroup:x:65534:
> +users:x:100:
> diff --git a/recipes/busybox/files/passwd b/recipes/busybox/files/passwd
> index 64c9ab6..34921c3 100644
> --- a/recipes/busybox/files/passwd
> +++ b/recipes/busybox/files/passwd
> @@ -2,10 +2,7 @@ root:x:0:0:root:/root:/bin/sh
>  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
>  bin:x:2:2:bin:/bin:/bin/sh
>  sys:x:3:3:sys:/dev:/bin/sh
> -sync:x:4:65534:sync:/bin:/bin/sync
>  man:x:6:12:man:/var/cache/man:/bin/sh
>  mail:x:8:8:mail:/var/mail:/bin/sh
>  www-data:x:33:33:www-data:/var/www:/bin/sh
> -backup:x:34:34:backup:/var/backups:/bin/sh
> -irc:x:39:39:ircd:/var/run/ircd:/bin/sh
>  nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
> diff --git a/recipes/busybox/files/shadow b/recipes/busybox/files/shadow
> index 25df693..e64a964 100644
> --- a/recipes/busybox/files/shadow
> +++ b/recipes/busybox/files/shadow
> @@ -2,10 +2,7 @@ root::14741:0:99999:7:::
>  daemon:*:14741:0:99999:7:::
>  bin:*:14741:0:99999:7:::
>  sys:*:14741:0:99999:7:::
> -sync:*:14741:0:99999:7:::
>  man:*:14741:0:99999:7:::
>  mail:*:14741:0:99999:7:::
>  www-data:*:14741:0:99999:7:::
> -backup:*:14741:0:99999:7:::
> -irc:*:14741:0:99999:7:::
>  nobody:*:14741:0:99999:7:::
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


