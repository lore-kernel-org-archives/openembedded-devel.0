Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6481.1585947295941772874
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 13:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A9AA40BAC;
	Fri,  3 Apr 2020 20:54:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhytTRCTMVlF; Fri,  3 Apr 2020 20:54:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 27E4C400E7;
	Fri,  3 Apr 2020 20:54:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7BD861718F5; Fri,  3 Apr 2020 16:54:53 -0400 (EDT)
Date: Fri, 3 Apr 2020 16:54:53 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: pjtexier@koncepto.io
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH 1/5] python-pyroute2: consolidate into a single file
Message-ID: <20200403205453.GW1578@denix.org>
References: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>
MIME-Version: 1.0
In-Reply-To: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2020 at 09:42:39PM +0200, Pierre-Jean Texier via lists.openembedded.org wrote:
> For details see [1]
> 
> [1] - https://lists.openembedded.org/g/openembedded-devel/topic/72718415
> 
> Suggested-by: Tim Orling <ticotimo@gmail.com>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  .../recipes-devtools/python/python-pyroute2.inc    | 25 ----------------------
>  .../python/python3-pyroute2_0.5.9.bb               | 25 ++++++++++++++++++++--

Any chance to pass -C -M so the diff is more readable?


>  2 files changed, 23 insertions(+), 27 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-pyroute2.inc
> 
> diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
> deleted file mode 100644
> index add7b7b..0000000
> --- a/meta-python/recipes-devtools/python/python-pyroute2.inc
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -SUMMARY = "A pure Python netlink and Linux network configuration library"
> -LICENSE = "GPLv2 & Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
> -
> -SRC_URI[md5sum] = "4ee568832c98c39253230293a2ca3d59"
> -SRC_URI[sha256sum] = "240ed116fabef02c284cc40d27986e629f02aa788311a8059905b8988752d5b7"
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-ctypes \
> -    ${PYTHON_PN}-distutils \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-logging \
> -    ${PYTHON_PN}-multiprocessing \
> -    ${PYTHON_PN}-pickle \
> -    ${PYTHON_PN}-pkgutil \
> -    ${PYTHON_PN}-pprint \
> -    ${PYTHON_PN}-shell \
> -    ${PYTHON_PN}-unixadmin \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb
> index a23e72c..90d9486 100644
> --- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb
> @@ -1,2 +1,23 @@
> -require python-pyroute2.inc
> -inherit setuptools3
> +SUMMARY = "A pure Python netlink and Linux network configuration library"
> +LICENSE = "GPLv2 & Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
> +
> +SRC_URI[md5sum] = "4ee568832c98c39253230293a2ca3d59"
> +SRC_URI[sha256sum] = "240ed116fabef02c284cc40d27986e629f02aa788311a8059905b8988752d5b7"
> +
> +inherit setuptools3 pypi
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-ctypes \
> +    ${PYTHON_PN}-distutils \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-multiprocessing \
> +    ${PYTHON_PN}-pickle \
> +    ${PYTHON_PN}-pkgutil \
> +    ${PYTHON_PN}-pprint \
> +    ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-unixadmin \
> +"
> -- 
> 2.7.4
> 

> 

