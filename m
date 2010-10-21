Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1P8s3a-00026o-EL
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:07:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 03D3F309C044
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:59:58 +0200 (CEST)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id p9VhM3n9c+4v
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:59:42 +0200 (CEST)
Received: from tomboy.localnet (pD9E14808.dip.t-dialin.net [217.225.72.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTPSA id D0084309C03F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:59:42 +0200 (CEST)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 11:59:41 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.36-0.slh.1-aptosid-amd64; KDE/4.5.2; x86_64;
	; )
References: <4CBECD95.1050700@dresearch.de>
	<1287573007-24350-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1287573007-24350-1-git-send-email-sledz@dresearch.de>
MIME-Version: 1.0
Message-Id: <201010211159.41352.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] ca-certificates: unbreak do_configure of packages depending on ca-bundle.pem
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
X-List-Received-Date: Thu, 21 Oct 2010 10:07:35 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Mittwoch 20 Oktober 2010, 13:10:06 schrieb Steffen Sledz:
> just create an empty ca-bundle file to satisfy build time
> dependencies in do_configure of other packages (e.g. epiphany),
> content is updated later in postinst
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

Acked-by: Thomas Zimmermann <ml@vdm-design.de>

> ---
>  .../ca-certificates_20090814+nmu2.bb               |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/ca-certificates/ca-certificates_20090814+nmu2.bb
> b/recipes/ca-certificates/ca-certificates_20090814+nmu2.bb index
> c8e4dbd..a37b01a 100644
> --- a/recipes/ca-certificates/ca-certificates_20090814+nmu2.bb
> +++ b/recipes/ca-certificates/ca-certificates_20090814+nmu2.bb
> @@ -3,6 +3,7 @@ HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
>  SECTION = "misc"
>  PRIORITY = "optional"
>  LICENSE = "GPL"
> +PR = "r1"
> 
>  SRC_URI =
> "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
> file://remove-c-rehash.patch"
> @@ -27,13 +28,21 @@ do_install_append() {
>                  crt=$(echo $crt | sed -e 's/\.\///')
>                  echo $crt >> ${D}/etc/ca-certificates.conf
>          done
> +
> +	# update-ca-certificates is not able to deal with pathes,
> +	# so just create an empty ca-bundle file to satisfy build time
> +	# dependencies in do_configure of other packages (e.g. epiphany),
> +	# content is updated later (see pkg_postinst)
> +	touch ${D}/etc/ssl/ca-bundle.pem
>  }
> 
>  PACKAGE_ARCH = "all"
>  PACKAGES = "${PN}"
> 
>  pkg_postinst_${PN} () {
> +if test -z "$D"; then
>          /usr/sbin/update-ca-certificates
> +fi
>  }
> 
>  CONFFILES_${PN} = "/etc/ca-certificates.conf"



