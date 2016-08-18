Return-Path: <gyurco@freemail.hu>
Received: from mail-outd.mail.t-online.hu (mail-outd.mail.t-online.hu
	[195.228.240.69])
	by mail.openembedded.org (Postfix) with ESMTP id 581EF76EBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:41:53 +0000 (UTC)
Received: from fsmeopfe.local (51B6146C.dsl.pool.telekom.hu [81.182.20.108])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail00k.mail.t-online.hu (Postfix) with ESMTPSA id 3sFX1X6G4szDl9;
	Thu, 18 Aug 2016 18:41:52 +0200 (CEST)
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Aug 2016 18:41:52 +0200
Message-ID: <86563065.BT55Dkadr2@gyurco.localdomain>
User-Agent: KMail/5.2.3 (Linux/4.6.6-300.fc24.x86_64; KDE/5.25.0; x86_64; ; )
In-Reply-To: <20160818160939.4390-1-Martin.Jansa@gmail.com>
References: <20160818160002.ydacjrbdyknjmcwa@jama>
	<20160818160939.4390-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
X-DCC--Metrics: mail00k.mail.t-online.hu 1308; Body=2 Fuz1=2 Fuz2=2
X-Spam-Probability: 5.55111512313e-17
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 18 Aug 2016 16:41:56 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Sorry for the wrong patch, but this has also some problems (inlined):

On Thursday, August 18, 2016 6:09:38 PM CEST Martin Jansa wrote:
> From: Szombathelyi Gy=F6rgy <gyurco@freemail.hu>
>=20
> - Call the nginx binary directly, no need to wrap the SysV init file.
> - Create /var/log/nginx with tmpfiles, like volatiles without systemd.
> - Run nginx with ${NGINX_USER} (user ${NGINX_USER} in nginx.conf)
>=20
> Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
> ---
>  meta-webserver/recipes-httpd/nginx/files/nginx.service | 9 ++++-----
>  meta-webserver/recipes-httpd/nginx/nginx.inc           | 5 +++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service
> b/meta-webserver/recipes-httpd/nginx/files/nginx.service index
> 9926a4b..ce99061 100644
> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> @@ -3,10 +3,9 @@ Description=3DNginx Server
>  After=3Dnetwork.target
>  [Service]
>  Type=3Dforking
> -PIDFile=3D@SYSCONFDIR@/nginx/run/nginx.pid
> -ExecStartPre=3D@BASEBINDIR@/mkdir -p @LOCALSTATEDIR@/log/nginx
> -ExecStart=3D@SYSCONFDIR@/init.d/nginx start
> -ExecStop=3D@SYSCONFDIR@/init.d/nginx stop
> +PIDFile=3D/run/nginx/nginx.pid
> +ExecStart=3D@SBINDIR@/nginx
> +ExecStop=3D@SBINDIR@/nginx -s stop
> +ExecReload=3D@SBINDIR@/nginx -s reload
>  [Install]
>  WantedBy=3Dmulti-user.target
> -
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> b/meta-webserver/recipes-httpd/nginx/nginx.inc index fe51ca0..334a6d8
> 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -73,8 +73,8 @@ do_install () {
>  	rm -fr ${D}${localstatedir}/run ${D}/run
>  	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',
> d)}; then install -d ${D}${sysconfdir}/tmpfiles.d
> -		echo "d /run/${BPN} - - - -" \
> -		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
Don't remove the /run/nginx directory, please

> +		echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
> +			>> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
>  	fi
>  	install -d ${D}${sysconfdir}/${BPN}
>  	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> @@ -90,6 +90,7 @@ do_install () {
>  	install -d ${D}${sysconfdir}/nginx
>  	install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
>  	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
> +	sed -i 's/^user.*/user ${NGINX_USER};/g'
> ${D}${sysconfdir}/nginx/nginx.conf install -d
> ${D}${sysconfdir}/nginx/sites-enabled
>=20
>  	install -d ${D}${sysconfdir}/default/volatiles
This is missing from the end, since the unit file refers to SBINDIR now, an=
d=20
no BASE_SBINDIR.

@@ -101,7 +104,7 @@ do_install () {
             install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir=
}/
system/
             sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
                     -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
=2D                    -e 's,@BASEBINDIR@,${base_bindir},g' \
+                    -e 's,@SBINDIR@,${sbindir},g' \
                     ${D}${systemd_unitdir}/system/nginx.service
         fi
 }



