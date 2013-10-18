Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8550B6C76F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 07:29:08 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VX4Ub-0000Pe-FX for openembedded-devel@lists.openembedded.org;
	Fri, 18 Oct 2013 09:29:05 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:29:05 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:29:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 18 Oct 2013 09:28:55 +0200
Message-ID: <l3qnv9$82h$1@ger.gmane.org>
References: <1382062414-13387-1-git-send-email-stephen.arnold42@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
In-Reply-To: <1382062414-13387-1-git-send-email-stephen.arnold42@gmail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-webserver][PATCH] nginx: new recipe
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
X-List-Received-Date: Fri, 18 Oct 2013 07:29:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

stephen.arnold42 schreef op 18-10-13 04:13:
> From: "stephen.arnold42" <stephen.arnold42@gmail.com>
> 
> Initial recipe created by Steve Arnold.  Original build patch and 1.0.10 
> recipe graciously contributed by bencoh (in #oe on irc.freenode.net). New
> recipe and init script contributed by this author.  Built and tested on
> master branches using author's fork of meta-raspberrypi.
> 
> https://github.com/sarnold/meta-raspberrypi
> 
> Upstream-Status: Inappropriate [embedded specific]
> 
> Signed-off-by: stephen.arnold42 <stephen.arnold42@gmail.com> --- 
> .../nginx/files/nginx-cross_1.4.0.diff             | 229
> +++++++++++++++++++++ .../recipes-httpd/nginx/files/nginx.conf
> | 118 +++++++++++ .../recipes-httpd/nginx/files/nginx.init           |
> 52 +++++ meta-webserver/recipes-httpd/nginx/nginx_1.4.0.bb  |  91
> ++++++++ 4 files changed, 490 insertions(+) create mode 100644
> meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.0.diff create
> mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx.conf create
> mode 100755 meta-webserver/recipes-httpd/nginx/files/nginx.init create
> mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.4.0.bb
> 

> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf
> b/meta-webserver/recipes-httpd/nginx/files/nginx.conf new file mode
> 100644 index 0000000..589de41 --- /dev/null +++
> b/meta-webserver/recipes-httpd/nginx/files/nginx.conf @@ -0,0 +1,118 @@ 
> + +user  www-data; +worker_processes  1; + +error_log
> /var/log/nginx/error.log; +#error_log  logs/error.log  notice; 
> +#error_log  logs/error.log  info; + +pid
> /var/run/nginx//nginx.pid;

Double // and isn't that /run nowadays?

> + + +events { +    worker_connections  1024; +} + + +http { +    include
> mime.types; +    default_type  application/octet-stream; + +
> log_format  main  '$remote_addr - $remote_user [$time_local] "$request"
> ' +                      '$status $body_bytes_sent "$http_referer" ' +
> '"$http_user_agent" "$http_x_forwarded_for"'; + +    access_log
> /var/log/nginx/access.log  main; + +    sendfile        on; +
> #tcp_nopush     on; + +    #keepalive_timeout  0; +    keepalive_timeout
> 65; + +    #gzip  on; + +    server { +        listen       80; +
> server_name  localhost; + +        #charset koi8-r; + +
> #access_log  logs/host.access.log  main; + +        location / { +
> root   /var/www//localhost/html;

double //



> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.init
> b/meta-webserver/recipes-httpd/nginx/files/nginx.init new file mode
> 100755 index 0000000..0f38b9c --- /dev/null +++
> b/meta-webserver/recipes-httpd/nginx/files/nginx.init @@ -0,0 +1,52 @@ 
> +#! /bin/sh +PATH=/sbin:/bin:/usr/sbin:/usr/bin +DAEMON=/usr/sbin/nginx

hardcode ${sbindir}, more hardcoded paths in the rest of the file
> index 0000000..185fd22 --- /dev/null +++
> b/meta-webserver/recipes-httpd/nginx/nginx_1.4.0.bb @@ -0,0 +1,91 @@ 
> +SUMMARY = "HTTP and reverse proxy server for embedded environments" 
> +HOMEPAGE = "http://nginx.org/" +LICENSE = "BSD-2-Clause" +SECTION =
> "net" + +DEPENDS = "libpcre gzip openssl" + +PR = "r0"

default, drop it

> + +SRC_URI = " \ +	http://nginx.org/download/nginx-${PV}.tar.gz \ +
> file://nginx-cross_${PV}.diff;name=crosspatch \ +	file://nginx.conf \ +
> file://nginx.init \ +" + +inherit update-rc.d useradd siteinfo + 
> +SRC_URI[md5sum] = "d496e58864ab10ed56278b7655b0d0b2" +SRC_URI[sha256sum]
> = "84aeb7a131fccff036dc80283dd98c989d2844eb84359cfe7c4863475de923a9" 
> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=917bfdf005ffb6fd025550414ff05a9f"

LIC_FILES_CHKSUM should go next to the LICENSE field

> + +CONFFILES_${PN} = "${sysconfdir}/nginx/nginx.conf \ +
> ${sysconfdir}/nginx/fastcgi.conf\ +		${sysconfdir}/nginx/fastcgi_params
> \ +		${sysconfdir}/nginx/koi-utf \ +		${sysconfdir}/nginx/koi-win \ +
> ${sysconfdir}/nginx/mime.types \ +		${sysconfdir}/nginx/scgi_params \ +
> ${sysconfdir}/nginx/uwsgi_params \ +		${sysconfdir}/nginx/win-utf \ +"

Packaging variables go below do_install

> + +INITSCRIPT_NAME = "nginx" +INITSCRIPT_PARAMS = "defaults 92 20"

Below do_install

> + +do_configure() { +    PTRSIZE=$(expr ${SITEINFO_BITS} / 8) + +    echo
> $PTRSIZE +    echo $CFLAGS +    echo $LDFLAGS + +    ./configure \ +
> --crossbuild=Linux:${TUNE_ARCH} \ +
> --with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little',
> 'big', d)} \ +        --with-int=4 \ +        --with-long=${PTRSIZE} \ +
> --with-long-long=8 \ +        --with-ptr-size=${PTRSIZE} \ +
> --with-sig-atomic-t=${PTRSIZE} \ +        --with-size-t=${PTRSIZE} \ +
> --with-off-t=${PTRSIZE} \ +        --with-time-t=${PTRSIZE} \ +
> --with-sys-nerr=132 \ +        --conf-path=/etc/nginx/nginx.conf \

${sysconfdir}

> +        --http-log-path=/var/log/nginx/access.log \ +
> --error-log-path=/var/log/nginx/error.log \

${localstatedir}

> +        --pid-path=/var/run/nginx/nginx.pid \

/run ?

> +        --prefix=/usr \

${prefix}


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSYOM3MkyGM64RGpERAlAeAKC1AM8Kw/cfhJDZ6R4OdTpssx+x4QCbBddK
C297WXI/v1+hG98PIepQ6qc=
=YdkH
-----END PGP SIGNATURE-----


