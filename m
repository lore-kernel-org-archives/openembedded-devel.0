Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TBAZF-0002ZN-SU
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 22:26:50 +0200
Received: by iaky10 with SMTP id y10so2274312iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2012 13:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=kAbetaoCYej/Zq2RqZ+GYaCXaS1ocv1Vqx3Od4JBjuI=;
	b=FodY6CNf5YaHk1BCMcJkrJFLTNJ3qo1Wm73wFaEQhe02+A4QQyZi4g2dxwMatwvrxt
	4xuSCe/jJso+gTzN7/LmAGZ+B0GrfJMXZGbxi+I7p8poCYtPa/CzwNptWBZY8JUyNlUv
	BwDNEJnQ0xreJM737u5VHjW9F1/HuP8Q+73z+wwRoX6sGCDddoxBFRdIj9qISUBjcC0h
	HqwN0JZ4pHW+kZjwxAVbeGX/kPCB75cPNwm37mBWLtG6X4jBJPlpfH5EULO7XHrfDONd
	bgMJqmyt1VodexE5sV+9lp0QQc+HR6DSbnbchRjqkqDDVDxq+B+OScgwMU/tJUkcndCX
	nLiw==
Received: by 10.50.41.129 with SMTP id f1mr12275931igl.57.1347308058873; Mon,
	10 Sep 2012 13:14:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.129.232 with HTTP; Mon, 10 Sep 2012 13:13:58 -0700 (PDT)
X-Originating-IP: [79.118.163.23]
In-Reply-To: <1346931347-8672-1-git-send-email-ml@communistcode.co.uk>
References: <1346931347-8672-1-git-send-email-ml@communistcode.co.uk>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 10 Sep 2012 23:13:58 +0300
Message-ID: <CAK18fxE277_zyJF=Xv955KusWwAcyD=ve09w3Cj35Xm0tU-5tw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlHMe02FqOrHgZO08YmMZZrKyWEn85cYtwjCLxoSWha94V/hGq0HOPn3hUUsBcJ+1+z/Ics
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCHv5][meta-oe 1/2] liblockdev: new recipe, new version of libcec requires it
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
X-List-Received-Date: Mon, 10 Sep 2012 20:26:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 6, 2012 at 2:35 PM, <ml@communistcode.co.uk> wrote:

> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> V5
>
> - FILES_{PN} no loger required now libdir and includedir are passed to
> oe_runmake
>
> V4
>
> - Remove debian packaging patch, it is not needed
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  .../recipes-extended/liblockdev/liblockdev_1.0.3.bb  | 20
> ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/liblockdev/
> liblockdev_1.0.3.bb
>
> diff --git a/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bbb/meta-oe/recipes-extended/liblockdev/
> liblockdev_1.0.3.bb
> new file mode 100644
> index 0000000..210a47b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Manage character and block device lockfiles."
> +HOMEPAGE = "
> http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
> +
> +SRC_URI = "
> http://ftp.de.debian.org/debian/pool/main/l/lockdev/lockdev_${PV}.orig.tar.gz
> "
> +
> +SRC_URI[md5sum] = "64b9c1b87b125fc348e892e24625524a"
> +SRC_URI[sha256sum] =
> "ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82"
> +
> +S = "${WORKDIR}/lockdev-${PV}"
> +
> +do_compile() {
> +  oe_runmake CC="${CC}" LD="${LD}" shared
> +}
> +
> +do_install() {
> +  oe_runmake basedir="${D}" incdir="${D}${includedir}"
> libdir="${D}${libdir}" install_dev
> +}
>

Why install only _dev? Why don't you use make install? It makes no sense to
compile shared and not install it... I just tested your recipe.

ag

