Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C29A7146D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 09:42:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8G9gKle000857
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 02:42:20 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 16 Sep 2014 02:42:20 -0700
Message-ID: <541805F9.8000705@windriver.com>
Date: Tue, 16 Sep 2014 17:42:17 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1410860196-30191-1-git-send-email-Chong.Lu@windriver.com>
	<1410860196-30191-2-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1410860196-30191-2-git-send-email-Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 2/2] postgresql: add systemd unit file
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
X-List-Received-Date: Tue, 16 Sep 2014 09:42:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

For meta-oe layer. Thanks

//Chong

On 09/16/2014 05:36 PM, Chong Lu wrote:
> Add systemd unit file for postgresql.
> When 'sysvinit' and 'systemd' are both in DISTRO_FEATURES, we need to prevent
> the init script from running via systemd.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   .../postgresql/files/postgresql.service            | 27 ++++++++++++++++++++++
>   meta-oe/recipes-support/postgresql/postgresql.inc  | 22 +++++++++++++++++-
>   2 files changed, 48 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql.service
>
> diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.service b/meta-oe/recipes-support/postgresql/files/postgresql.service
> new file mode 100644
> index 0000000..4ec959e
> --- /dev/null
> +++ b/meta-oe/recipes-support/postgresql/files/postgresql.service
> @@ -0,0 +1,27 @@
> +[Unit]
> +Description=PostgreSQL database server
> +After=network.target
> +
> +[Service]
> +Type=forking
> +User=postgres
> +Group=postgres
> +
> +# Port number for server to listen on
> +Environment=PGPORT=5432
> +
> +# Location of database directory
> +Environment=PGDATA=/var/lib/postgresql/data
> +
> +# Disable OOM kill on the postmaster
> +OOMScoreAdjust=-17
> +
> +ExecStart=@BINDIR@/pg_ctl start -D ${PGDATA} -s -o "-p ${PGPORT}" -w -t 300
> +ExecStop=@BINDIR@/pg_ctl stop -D ${PGDATA} -s -m fast
> +ExecReload=@BINDIR@/pg_ctl reload -D ${PGDATA} -s
> +
> +# Give a reasonable amount of time for the server to start up/shut down
> +TimeoutSec=300
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
> index 774c8fd..d45f4b5 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -30,6 +30,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
>              file://postgresql.pam \
>              file://0001-Use-pkg-config-for-libxml2-detection.patch \
>              file://postgresql-setup \
> +           file://postgresql.service \
>   "
>   
>   LEAD_SONAME = "libpq.so"
> @@ -37,7 +38,20 @@ LEAD_SONAME = "libpq.so"
>   # LDFLAGS for shared libraries
>   export LDFLAGS_SL = "${LDFLAGS}"
>   
> -inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d
> +inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd
> +
> +SYSTEMD_SERVICE_${PN} = "postgresql.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> +
> +DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
> +pkg_postinst_${PN} () {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit', 'true', 'false', d)}; then
> +        if [ -n "$D" ]; then
> +            OPTS="--root=$D"
> +        fi
> +        systemctl $OPTS mask postgresql-server.service
> +    fi
> +}
>   
>   enable_pam = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
>   PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
> @@ -184,6 +198,12 @@ do_install_append() {
>           install -d ${D}${sysconfdir}/pam.d
>           install -m 644 ${WORKDIR}/postgresql.pam ${D}${sysconfdir}/pam.d/postgresql
>       fi
> +
> +    # Install systemd unit files
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/postgresql.service ${D}${systemd_unitdir}/system
> +    sed -i -e 's,@BINDIR@,${bindir},g' \
> +        ${D}${systemd_unitdir}/system/postgresql.service
>   }
>   
>   SSTATE_SCAN_FILES += "Makefile.global"


