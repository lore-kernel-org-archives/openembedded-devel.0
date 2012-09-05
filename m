Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T9Hvu-0002Mm-Lx
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 17:54:27 +0200
Received: by obblz20 with SMTP id lz20so483801obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 08:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=FU8Ep9fqkLB0/yHQGuKvShHfbF1yBR0UTdNKmWwtxac=;
	b=mk64IBbT6E9RvH1RqPVofmK7TZ9q4oH0/68HSQ0Z5Q5K7CukjQnumRUHyyUVQeif+p
	UcNd/kMn5E/q3fgyCKoRuBdBX4li3JaOE6CdfeiFa+TbndfeK7IVL6j2MNb4OB8cSuhU
	gLqsgKSrt4v9is0D8BvQhrubh38YTYZeSRYqA+pAIOBCEdenbefzRAgAou2MY5M375lg
	Y79PssFZEwEGIBAccSpJt2++BMzmniQBm5JvP1BSgaBzZnLHNx/fK9vWTQLP3QOzx2VO
	mgpBt4KyiAx5IW5YQOY0cBQ3qJOQ6EPY2i4DIDSrpe9RU+ByexzP6pwOCC9JDJCkbK8y
	Gzng==
Received: by 10.182.64.52 with SMTP id l20mr17343379obs.99.1346859722986; Wed,
	05 Sep 2012 08:42:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.93.35 with HTTP; Wed, 5 Sep 2012 08:41:42 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1346858494-4849-2-git-send-email-ml@communistcode.co.uk>
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
	<1346858494-4849-2-git-send-email-ml@communistcode.co.uk>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 5 Sep 2012 18:41:42 +0300
Message-ID: <CAK18fxG8PpuVYW0UXZwRKghn1duy2FwhL2RWt_cP82XX33srcA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQknZi1zRCZZg18XVE2JqbEWWNq/MKKGGhuJMMSSScamoC8kNnrfOuUggoQRldePDDS+HMdC
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCHv4 2/3] liblockdev: new recipe, new version of libcec requires it
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
X-List-Received-Date: Wed, 05 Sep 2012 15:54:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 5, 2012 at 6:21 PM, <ml@communistcode.co.uk> wrote:

> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> V4
>
> - Remove debian packaging patch, it is not needed
>
>
What means it is not needed anymore? Included in upstream? Fixed in yocto?


> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  .../liblockdev/liblockdev_1.0.3.bb                 | 26
> ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/liblockdev/
> liblockdev_1.0.3.bb
>
>
Where is the removed patch?


> diff --git a/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bbb/meta-oe/recipes-extended/liblockdev/
> liblockdev_1.0.3.bb
> new file mode 100644
> index 0000000..be5ce44
> --- /dev/null
> +++ b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Manage character and block device lockfiles."
> +HOMEPAGE = "
> http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
> +
> +PV = "1.0.3"
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
> +
> +FILES_{PN} = "${includedir}/* \
> +              ${libdir}/* \
> +"
> --
> 1.7.12
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

