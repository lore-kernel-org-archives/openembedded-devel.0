Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OAP4c-00072Q-BS
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 17:02:46 +0200
Received: by fxm11 with SMTP id 11so873537fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=hYzEy4hOQ6xCvqyXy824XhclvDycMVdX3WtMPth7mJY=;
	b=KcNVTZLEudtsdK7iy17GjoFAGSI9iqUdvaZE+hjJmVs4TNOROL70348ZLxFqsMnKCf
	0oo9ReQNwsbWZrsf0gORQm0wshFczVUOJIT7LMrHCsZL27QOCpJkdhC1EOs6ecNM+t5H
	ZjoxKSLyxqDzZA+F8/EXtYwuV9NDyI1pFo+JY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=s6kLrM+Pn2A4xnEVCUNqkgErAn+5iFmpjb5UIvfcqbA3gt/7vDCbwYpWZXnqQrFdTo
	qTwzTnnDywCCbKKuHPazfvPzHqeSslFqVnhMqsd045eYd4SbgJf6QWfV5W06TOeLQQYx
	tD9wvfEldPUgFzH3Kdb70R0xKWyfQeAhjpbXY=
Received: by 10.223.92.136 with SMTP id r8mr159871fam.40.1273244332805;
	Fri, 07 May 2010 07:58:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r25sm7008014fai.23.2010.05.07.07.58.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 May 2010 07:58:52 -0700 (PDT)
Date: Fri, 7 May 2010 16:58:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507145850.GJ3204@jama>
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
X-List-Received-Date: Fri, 07 May 2010 15:02:47 -0000
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

One more issue with this part, partialy explaining what went wrong in
that log. You're not creating syslog.busybox, so real /etc/init.d/syslog
is not packaged and after u-a /etc/init.d/syslog points to non-existing
/etc/init.d/syslog.busybox and that's why update-rc.d says it doesn't
exist.

Regards,


