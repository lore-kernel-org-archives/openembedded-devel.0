Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TVikl-0005AX-Ci
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2012 13:59:42 +0100
Received: by mail-vc0-f175.google.com with SMTP id p1so302042vcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Nov 2012 04:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=aKTEnwBUCKtwCjjVZHm9dAsEr57Z6NYHfQ5Izz81E/I=;
	b=lOs6DYuCCkC0D119lJlW80EhbsR5+gXhw4IFu6601KmE8cH/E7UA9n/QCOWe8ADf2f
	Ap6v6y9yGIYlHHtg/xZqKpG1F9h/2Z8ffNXPzso4cTjXIhDk3EP7NvlCHeq9olVRhKVA
	ZtHTtzCFCAeQI1LuJNitsTeuq1V3SgDEgUeYXVXvcPMsMKa6+ponRrPblj5S5fsQ4Lfp
	Ey9rmsenPEmhS1A3iperXmFPTObv6Z7HjOTr/4bgw3RmE8E41hjtCnfUdgidMfZ+3Bxo
	WqHDMJez3F1yWpcLNeuAlveZad4VZyJhgNbVEgS5KTQVsVmhOFYCdDGTx94boT06mSQL
	PrJw==
Received: by 10.58.74.196 with SMTP id w4mr774741vev.7.1352205954297; Tue, 06
	Nov 2012 04:45:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.59.0.10 with HTTP; Tue, 6 Nov 2012 04:45:34 -0800 (PST)
X-Originating-IP: [88.2.49.78]
In-Reply-To: <1352202451-5869-1-git-send-email-ml@communistcode.co.uk>
References: <1352202451-5869-1-git-send-email-ml@communistcode.co.uk>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 6 Nov 2012 12:45:34 +0000
Message-ID: <CAK18fxGmPnL_Qec5w+6xNx2c8ToAG5td4enyoH0maf7zF7frOg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmY9ttlJgljKgns3tpiv/8V/2yp1bh0DR3Yttn8lEelIE33qJ6JQnU2FhbXFtd6REaqd835
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [meta-webserver][PATCH] hiawatha: update to 8.6 and disable caching by default
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
X-List-Received-Date: Tue, 06 Nov 2012 12:59:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 6, 2012 at 11:47 AM, <ml@communistcode.co.uk> wrote:

> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  .../recipes-httpd/hiawatha/hiawatha_8.5.bb         | 45
> ----------------------
>  .../recipes-httpd/hiawatha/hiawatha_8.6.bb         | 45
> ++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 45 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
>  create mode 100644 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
>
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bbb/meta-webserver/recipes-httpd/hiawatha/
> hiawatha_8.5.bb
> deleted file mode 100644
> index 71cc885..0000000
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -DESCRIPTION = "Lightweight secure web server"
> -HOMEPAGE = "http://www.hiawatha-webserver.org"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> -DEPENDS = "libxml2 libxslt"
> -
> -SECTION = "net"
> -
> -SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
> -           file://hiawatha-init"
> -
> -SRC_URI[md5sum] = "71d3903657953c93fc930758d158097d"
> -SRC_URI[sha256sum] =
> "2567e6b4b4c6666388087b586238e6e91a4afd80e10a879920020a097fcdc946"
> -
> -inherit cmake update-rc.d
> -
> -INITSCRIPT_NAME = "hiawatha"
> -INITSCRIPT_PARAMS = "defaults 70"
> -
> -EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
> -                  -DENABLE_CACHE=ON \
> -                  -DENABLE_DEBUG=OFF \
> -                  -DENABLE_SSL=OFF \
> -                  -DENABLE_TOOLKIT=OFF \
> -                  -DENABLE_CHROOT=OFF \
> -                  -DENABLE_XSLT=ON \
> -                  -DENABLE_TOMAHAWK=OFF \
> -                  -DCMAKE_INSTALL_MANDIR=${mandir} \
> -                  -DCMAKE_INSTALL_BINDIR=${bindir} \
> -                  -DCMAKE_INSTALL_SBINDIR=${sbindir} \
> -                  -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
> -                  -DCMAKE_INSTALL_LIBDIR=${libdir} \
> -                  -DLOG_DIR=/var/log/hiawatha \
> -                  -DPID_DIR=/var/run \
> -                  -DWEBROOT_DIR=/var/www/hiawatha \
> -                  -DWORK_DIR=/var/lib/hiawatha "
> -
> -do_install_append() {
> -
> -    # Copy over init script and sed in the correct sbin path
> -    sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
> -    mkdir -p ${D}${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/hiawatha-init
> ${D}${sysconfdir}/init.d/hiawatha
> -
> -}
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bbb/meta-webserver/recipes-httpd/hiawatha/
> hiawatha_8.6.bb
> new file mode 100644
> index 0000000..2e6955e
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
> @@ -0,0 +1,45 @@
> +DESCRIPTION = "Lightweight secure web server"
> +HOMEPAGE = "http://www.hiawatha-webserver.org"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> +DEPENDS = "libxml2 libxslt"
> +
> +SECTION = "net"
> +
> +SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
> +           file://hiawatha-init"
> +
> +SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
> +SRC_URI[sha256sum] =
> "1a7fa98ce66beb54fc8490cc787461d719a98cb0e4a81caedfa18ac8b5ba3b3b"
> +
> +inherit cmake update-rc.d
> +
> +INITSCRIPT_NAME = "hiawatha"
> +INITSCRIPT_PARAMS = "defaults 70"
> +
> +EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
> +                  -DENABLE_CACHE=OFF \
>

I would like to see this in a separate commit. One for update and for for
disabling caching.


> +                  -DENABLE_DEBUG=OFF \
> +                  -DENABLE_SSL=OFF \
> +                  -DENABLE_TOOLKIT=OFF \
> +                  -DENABLE_CHROOT=OFF \
> +                  -DENABLE_XSLT=ON \
> +                  -DENABLE_TOMAHAWK=OFF \
> +                  -DCMAKE_INSTALL_MANDIR=${mandir} \
> +                  -DCMAKE_INSTALL_BINDIR=${bindir} \
> +                  -DCMAKE_INSTALL_SBINDIR=${sbindir} \
> +                  -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
> +                  -DCMAKE_INSTALL_LIBDIR=${libdir} \
> +                  -DLOG_DIR=/var/log/hiawatha \
> +                  -DPID_DIR=/var/run \
> +                  -DWEBROOT_DIR=/var/www/hiawatha \
> +                  -DWORK_DIR=/var/lib/hiawatha "
> +
> +do_install_append() {
> +
> +    # Copy over init script and sed in the correct sbin path
> +    sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
> +    mkdir -p ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/hiawatha-init
> ${D}${sysconfdir}/init.d/hiawatha
> +
> +}
> --
> 1.8.0
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

