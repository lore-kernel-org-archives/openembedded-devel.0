Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA3460169
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 05:21:37 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id fp1so19533819pdb.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qcysXXD+htgyRm70hVCN/oSPnWEQpfpOVFWnlmEdpZU=;
	b=a12neoQ/JKkJabnP6ftbrTSvxJQFutOrg2ToO0FIt1zRKKxptED92wDcs2j0i5UBge
	OoBWB0vzrZ/eNtLz1/8oz0Dv6jQ1TEOG+/x5/sN6i3wFZUutmjjkBChvSSKQmxEZHom+
	enI9tW2eb8tA9dEs4oLTEFZz4a+CoFjJZTbZNs/KY8QumWBiVA3qjyZeXoAR5uI2VqEK
	/5Uk9jWchhI32Reg9tySCdtBapMofzQbZiNmQkpD8eNV/gA4UBKSN//xwa8nqtRmliq8
	HJqr7bDcBt22+EX1kkhESLq2qBfLCfYJEOh/2ogzaFAFMTxUpODiQXxvJyExJxEc5PQu
	CDYQ==
X-Received: by 10.70.19.166 with SMTP id g6mr25000901pde.99.1408944098879;
	Sun, 24 Aug 2014 22:21:38 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	wc3sm131732298pac.18.2014.08.24.22.21.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 22:21:38 -0700 (PDT)
Date: Sun, 24 Aug 2014 22:25:26 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140825052525.GC1014@haswell>
References: <1408675054-4549-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1408675054-4549-1-git-send-email-Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/2] mariadb: add systemd unit file
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
X-List-Received-Date: Mon, 25 Aug 2014 05:21:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-22 10:37:33, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The service file mainly comes from Fedora20.
> 
> This patch also adds a configuration file under /etc/tmpfiles.d so
> that mysqld could start correctly.

the next patch for apache does the execdir replacement on install. Why
not here too ?
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../recipes-support/mysql/mariadb/mysqld.service   |   15 +++++++++++++++
>  meta-oe/recipes-support/mysql/mariadb_5.5.38.inc   |   19 +++++++++++++++++--
>  2 files changed, 32 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/mysql/mariadb/mysqld.service
> 
> diff --git a/meta-oe/recipes-support/mysql/mariadb/mysqld.service b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
> new file mode 100644
> index 0000000..698e52d
> --- /dev/null
> +++ b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
> @@ -0,0 +1,15 @@
> +[Unit]
> +Description=MariaDB database server
> +After=syslog.target
> +After=network.target
> +
> +[Service]
> +Type=simple
> +User=mysql
> +Group=mysql
> +ExecStart=/usr/bin/mysqld_safe --basedir=/usr
> +TimeoutSec=300
> +PrivateTmp=true
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
> index 8a73833..83f2a92 100644
> --- a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
> @@ -9,6 +9,7 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
>             file://remove-bad-path.patch \
>             file://fix-mysqlclient-r-version.patch \
>             file://my.cnf \
> +           file://mysqld.service \
>            "
>  
>  SRC_URI[md5sum] = "fa9ba00b084b95a45fab70860c412f10"
> @@ -18,7 +19,7 @@ S = "${WORKDIR}/mariadb-${PV}"
>  
>  BINCONFIG_GLOB = "mysql_config"
>  
> -inherit cmake gettext binconfig update-rc.d useradd
> +inherit cmake gettext binconfig update-rc.d useradd systemd
>  
>  INITSCRIPT_PACKAGES = "${PN}-server"
>  INITSCRIPT_NAME = "mysqld"
> @@ -28,6 +29,10 @@ USERADD_PACKAGES = "${PN}-server"
>  USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
>  GROUPADD_PARAM_${PN}-server = "--system mysql"
>  
> +SYSTEMD_PACKAGES = "mariadb-server"
> +SYSTEMD_SERVICE_mariadb-server = "mysqld.service"
> +SYSTEMD_AUTO_ENABLE_mariadb-server = "disable"
> +
>  EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
>  
>  python __anonymous() {
> @@ -112,6 +117,15 @@ do_install() {
>      install -d ${D}/${sysconfdir}/init.d
>      install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdir}/
>      mv ${D}/${sysconfdir}/init.d/mysql ${D}/${sysconfdir}/init.d/mysqld
> +
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/mysqld.service ${D}${systemd_unitdir}/system
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +	install -d ${D}${sysconfdir}/tmpfiles.d
> +	echo "f /var/log/mysqld.err 0640 mysql mysql -" \
> +            > ${D}${sysconfdir}/tmpfiles.d/99-mysqld.conf
> +    fi
>  }
>  
>  pkg_postinst_${PN}-server () {
> @@ -247,7 +261,8 @@ FILES_${PN}-server = "\
>      ${datadir}/mysql/ \
>      ${localstatedir}/mysql/ \
>      ${sysconfdir}/init.d \
> -    ${sysconfdir}/my.cnf"
> +    ${sysconfdir}/my.cnf \
> +    ${sysconfdir}/tmpfiles.d"
>  
>  DESCRIPTION_${PN}-leftovers = "unpackaged and probably unneeded files for ${PN}"
>  FILES_${PN}-leftovers = "/"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

