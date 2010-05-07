Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OAOvZ-0006BT-MZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 16:53:23 +0200
Received: by fxm11 with SMTP id 11so865395fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=hZv70ZDStfHSkqTArb+vKJf/YiekIgFQcJxu7EvlFxA=;
	b=lxhyjpWykQt3rpw52h7dmHgjwhU0Qo/N2yc8WfZ41aV5ly8gbb2tIYWzsPFLMFp11V
	+hPL5LaNSdxagXCeGxcB8/j5D0xhx4RLvKxRum/mGLqx+tlsmG9ZOcsZGN2cHSNntcej
	snVjgQar5MO5Ieitk6EzQSdOL+K81LfnrPeR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KMThekDOmy09/7kZX1JuQBjfTSkS7wnH008vwBz1cspdxkgcPdr5pD0P/b0rp4Rlsp
	HmeMQM9Pbl8+WYjQ6buX2dNajKPZhgVksfm9HG+OJ25nafucia0zphbQbXom9o2Wza/W
	2gESw5qc7Wj2hB84u41fphb8kbmzmV9DAupi8=
Received: by 10.223.24.85 with SMTP id u21mr212461fab.8.1273243771947;
	Fri, 07 May 2010 07:49:31 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r12sm6973753fah.20.2010.05.07.07.49.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 May 2010 07:49:30 -0700 (PDT)
Date: Fri, 7 May 2010 16:49:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507144927.GH3204@jama>
References: <4BE41DF5.7040805@dresearch.de>
	<1273242036-7529-1-git-send-email-sledz@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <1273242036-7529-1-git-send-email-sledz@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox/syslogs: use update-alternatives for syslog selection
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
X-List-Received-Date: Fri, 07 May 2010 14:53:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 07, 2010 at 04:20:36PM +0200, Steffen Sledz wrote:
> * u-a for init scripts of busybox-syslog, sysklogd, and rsyslog
> * syslog-ng needs to be integrated too!
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/busybox/busybox.inc        |   18 ++++++++++++++++--
>  recipes/rsyslog/rsyslog.inc        |   22 +++++++++++++---------
>  recipes/sysklogd/sysklogd.inc      |   19 +++++++++++++++----
>  recipes/sysklogd/sysklogd_1.4.1.bb |    2 +-
>  recipes/sysklogd/sysklogd_1.5.bb   |    2 +-
>  5 files changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index 17d8d14..31651d6 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
>  SECTION = "base"
>  PRIORITY = "required"
>  
> -INC_PR = "r27"
> +INC_PR = "r28"
>  
>  SRC_URI = "\
>    file://busybox-cron \
> @@ -46,7 +46,7 @@ RDEPENDS_${PN} += "${PN}-mountall"
>  RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
>  
>  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
> -FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog ${sysconfdir}/syslog.conf"
> +FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} ${sysconfdir}/syslog.conf"
>  FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
>  
>  FILES_${PN} += "${datadir}/udhcpc"
> @@ -154,6 +154,20 @@ pkg_prerm_${PN}-mountall () {
>  	update-alternatives --remove default_mountall mountall.${PN}
>  }
>  
> +pkg_preinst_${PN}-syslog () {
> +    # this is needed to avoid sysmlink errors,
> +    # because update-rc.d runs before pkg_postinst :(
> +    touch {sysconfdir}/init.d/syslog

missing $
touch: cannot touch `{sysconfdir}/init.d/syslog': No such file or directory

but even when I add $ here it should fail like
update-alternatives: Error: not linking //usr/bin/time to ../../bin/busybox since //usr/bin/time exists and is not a link

but fails a bit different

Configuring busybox-syslog.
update-rc.d: /etc/init.d/syslog: file does not exist
update-alternatives: Linking //etc/init.d/syslog to syslog.busybox

Removing package busybox-syslog from root...
update-alternatives: removing //etc/init.d/syslog as no more
alternatives exist for it
//usr/lib/opkg/info/busybox-syslog.prerm: line 6: /etc/init.d/syslog:
//not found

ie prerm has same problem as postinst.., genarated fuctions:
postinst
#!/bin/sh
if test "x$D" != "x"; then
        OPT="-r $D"
else
        OPT="-s"
fi
update-rc.d $OPT syslog defaults
    update-alternatives --install /etc/init.d/syslog syslog-init
syslog.busybox 50

postrm
#!/bin/sh
if test "x$D" != "x"; then
        OPT="-r $D"
else
        OPT=""
fi
if test "$1" = "remove" -o "$1" = "purge"; then
        if ! test -e "/etc/init.d/syslog"; then
                update-rc.d $OPT syslog remove
        fi
fi

preinst
# this is needed to avoid sysmlink errors,
    # because update-rc.d runs before pkg_postinst :(
    touch /etc/init.d/syslog

prerm
update-alternatives --remove syslog-init syslog.busybox
if test "x$D" = "x"; then
        if test "$1" = "upgrade" -o "$1" = "remove"; then
                /etc/init.d/syslog stop
        fi
fi



> +}
> +
> +pkg_postinst_${PN}-syslog () {
> +    update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 50
> +}
> +
> +pkg_prerm_${PN}-syslog () {
> +    update-alternatives --remove syslog-init syslog.${PN}
> +}
> +
>  pkg_prerm_${PN} () {
>  	# This is so you can make busybox commit suicide - removing busybox with no other packages
>  	# providing its files, this will make update-alternatives work, but the update-rc.d part
> diff --git a/recipes/rsyslog/rsyslog.inc b/recipes/rsyslog/rsyslog.inc
> index 3e39ba0..6471724 100644
> --- a/recipes/rsyslog/rsyslog.inc
> +++ b/recipes/rsyslog/rsyslog.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
>  DEPENDS = "zlib"
>  HOMEPAGE = "http://www.rsyslog.com/"
>  LICENSE = "GPLv3"
> -INC_PR = "r0"
> +INC_PR = "r1"
>  
>  SRC_URI = "http://download.rsyslog.com/rsyslog/${PN}-${PV}.tar.gz \
>            file://rsyslog.conf \
> @@ -14,19 +14,23 @@ do_install_append() {
>          install -d ${D}/${sysconfdir}/${PN}
>          install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
>          install -d ${D}/${sysconfdir}/init.d
> -        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/rsyslog
> +        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
>  }
>  
> -pkg_postinst() {
> -        update-rc.d -f syslog remove
> +pkg_preinst_${PN} () {
> +    # this is needed to avoid sysmlink errors,
> +    # because update-rc.d runs before pkg_postinst :(
> +    touch {sysconfdir}/init.d/syslog
>  }
>  
> -pkg_postrm() {
> -        update-rc.d syslog add 5
> +pkg_postinst_${PN} () {
> +    update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 300
> +}
> +
> +pkg_prerm_${PN} () {
> +    update-alternatives --remove syslog-init syslog.${PN}
>  }
>  
>  CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
>  
> -INITSCRIPT_NAME = "rsyslog"
> -#INITSCRIPT_PARAMS = "defaults 05"
> -INITSCRIPT_PARAMS = "remove"
> +INITSCRIPT_NAME = "syslog"
> diff --git a/recipes/sysklogd/sysklogd.inc b/recipes/sysklogd/sysklogd.inc
> index 65da86d..f6b6aab 100644
> --- a/recipes/sysklogd/sysklogd.inc
> +++ b/recipes/sysklogd/sysklogd.inc
> @@ -1,16 +1,17 @@
>  LICENSE = "GPL"
>  SECTION = "base"
>  DESCRIPTION = "The sysklogd package implements two system log daemons."
> +INC_PR = "r3"
>  
>  SRC_URI = "http://www.ibiblio.org/pub/Linux/system/daemons/sysklogd-${PV}.tar.gz \
>  	       file://nonrootinstall.patch;patch=1 \
>             file://sysklogd"
>  
>  inherit update-rc.d
> -INITSCRIPT_NAME = "sysklogd"
> -INITSCRIPT_PARAMS = "start 39 S 1 2 3 . stop 99 0 6 ."

params not needed anymore?

> +
> +INITSCRIPT_NAME = "syslog"
> +
>  CFLAGS_append = " -DSYSV"
> -RCONFLICTS = "busybox-syslog"

Regards,


