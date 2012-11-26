Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Tcw62-00087d-Cn
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:39:26 +0100
Received: from localhost ([127.0.0.1]:60307 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TcvsI-0007pM-Al
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 10:25:14 +0000
Received: from [195.171.99.130] (port=1457 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TcvsI-0007pJ-7F
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 10:25:14 +0000
Message-ID: <50B3440E.9080600@communistcode.co.uk>
Date: Mon, 26 Nov 2012 10:27:26 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
	<1353864310-20097-7-git-send-email-eric@eukrea.com>
In-Reply-To: <1353864310-20097-7-git-send-email-eric@eukrea.com>
Subject: Re: [meta-webserver][PATCH 7/7] hiawatha: add CONFFILES and a php example
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
X-List-Received-Date: Mon, 26 Nov 2012 10:39:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/11/12 17:25, Eric Bénard wrote:
> - add CONFFILES so that configuration files don't get overwritten
> during upgrade
> - add an example on how to launch php-cgi using php-fcgi
>
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>   meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
> index 2e6955e..7dcbe9e 100644
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
> @@ -4,6 +4,8 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>   DEPENDS = "libxml2 libxslt"
>   
> +PR = "r1"
> +
>   SECTION = "net"
>   
>   SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
> @@ -36,10 +38,20 @@ EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
>                     -DWORK_DIR=/var/lib/hiawatha "
>   
>   do_install_append() {
> -
>       # Copy over init script and sed in the correct sbin path
>       sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
>       mkdir -p ${D}${sysconfdir}/init.d
>       install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha
>   
> +    # configure php-fcgi to have a working configuration
> +    # by default if php is installed
> +    echo "Server = ${bindir}/php-cgi ; 2 ; 127.0.0.1:2005 ; nobody:nobody ; ${sysconfdir}/php/hiawatha-php5/php.ini" >> ${D}${sysconfdir}/hiawatha/php-fcgi.conf
>   }
> +
> +CONFFILES_${PN} = " \
> +    ${sysconfdir}/hiawatha/cgi-wrapper.conf \
> +    ${sysconfdir}/hiawatha/hiawatha.conf \
> +    ${sysconfdir}/hiawatha/index.xslt \
> +    ${sysconfdir}/hiawatha/mimetype.conf \
> +    ${sysconfdir}/hiawatha/php-fcgi.conf \
> +    "

Looks good to me, thanks for the improvements Eric!

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



