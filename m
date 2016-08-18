Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 5658373216
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:17:12 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1baQ0E-0007mj-F6 for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2016 18:17:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 18 Aug 2016 18:17:03 +0200
Message-ID: <np4n1v$rvh$1@blaine.gmane.org>
References: <20160818160002.ydacjrbdyknjmcwa@jama>
	<20160818160939.4390-1-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
In-Reply-To: <20160818160939.4390-1-Martin.Jansa@gmail.com>
Subject: Re: [meta-webserver][PATCHv2 1/2] nginx: optimize systemd unit file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2016 16:17:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Op 18-08-16 om 18:09 schreef Martin Jansa:
> From: Szombathelyi György <gyurco@freemail.hu>
> 
> - Call the nginx binary directly, no need to wrap the SysV init file.
> - Create /var/log/nginx with tmpfiles, like volatiles without systemd.
> - Run nginx with ${NGINX_USER} (user ${NGINX_USER} in nginx.conf)
> 
> Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>

Thanks, this was next on my TODO after collectd, excellent timing :)

And a thank you to Martin for fixing up the patch and redoing the intendation.


> ---
>  meta-webserver/recipes-httpd/nginx/files/nginx.service | 9 ++++-----
>  meta-webserver/recipes-httpd/nginx/nginx.inc           | 5 +++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> index 9926a4b..ce99061 100644
> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> @@ -3,10 +3,9 @@ Description=Nginx Server
>  After=network.target
>  [Service]
>  Type=forking
> -PIDFile=@SYSCONFDIR@/nginx/run/nginx.pid
> -ExecStartPre=@BASEBINDIR@/mkdir -p @LOCALSTATEDIR@/log/nginx
> -ExecStart=@SYSCONFDIR@/init.d/nginx start
> -ExecStop=@SYSCONFDIR@/init.d/nginx stop
> +PIDFile=/run/nginx/nginx.pid
> +ExecStart=@SBINDIR@/nginx
> +ExecStop=@SBINDIR@/nginx -s stop
> +ExecReload=@SBINDIR@/nginx -s reload
>  [Install]
>  WantedBy=multi-user.target
> -
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index fe51ca0..334a6d8 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -73,8 +73,8 @@ do_install () {
>  	rm -fr ${D}${localstatedir}/run ${D}/run
>  	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>  		install -d ${D}${sysconfdir}/tmpfiles.d
> -		echo "d /run/${BPN} - - - -" \
> -		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> +		echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
> +			>> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
>  	fi
>  	install -d ${D}${sysconfdir}/${BPN}
>  	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> @@ -90,6 +90,7 @@ do_install () {
>  	install -d ${D}${sysconfdir}/nginx
>  	install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
>  	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
> +	sed -i 's/^user.*/user ${NGINX_USER};/g' ${D}${sysconfdir}/nginx/nginx.conf
>  	install -d ${D}${sysconfdir}/nginx/sites-enabled
>  
>  	install -d ${D}${sysconfdir}/default/volatiles
> 



