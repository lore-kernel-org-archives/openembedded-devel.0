Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4F76C71981
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 20:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E0D7420A36
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 20:17:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id AJN9IG7EKKDu
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 20:17:33 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8B0520A33
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 20:17:33 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 4AEB916215F; Thu,  6 Oct 2016 16:17:32 -0400 (EDT)
Date: Thu, 6 Oct 2016 16:17:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161006201732.GF2494@denix.org>
References: <1475783887-20739-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1475783887-20739-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-python][PATCH] python-pybind11: add pybind11 for operability between C++11 and Python
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
X-List-Received-Date: Thu, 06 Oct 2016 20:17:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BTW, this is more of a WIP and needs few cleanups based on master, as I was 
testing it in krogoth for now...


On Thu, Oct 06, 2016 at 03:58:07PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-python/recipes-devtools/python/python-pybind11.inc       | 9 +++++++++
>  meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb  | 2 ++
>  meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb | 2 ++
>  3 files changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-pybind11.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
> new file mode 100644
> index 0000000..e13f6a5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pybind11.inc
> @@ -0,0 +1,9 @@
> +SUMMARY = "Seamless operability between C++11 and Python"
> +HOMEPAGE = "https://github.com/wjakob/pybind11"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1e9383cd3e97753d7dd6067d079519ea"
> +PR = "r0"
> +
> +SRC_URI = "https://pypi.python.org/packages/89/0b/f3a25633e49be5fae17ed2c7751c8106a08199db70e3c82e8cc043388ba9/pybind11-1.8.1.tar.gz"
> +SRC_URI[md5sum] = "67845d8fd89a1c400dc7c61ccdee14d6"
> +SRC_URI[sha256sum] = "358d4b7d8c38cd1dde66064178c6bbaaa2c479a44e67e642820fe0f329a4fff8"
> diff --git a/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
> new file mode 100644
> index 0000000..e567430
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools
> +require python-pybind11.inc
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
> new file mode 100644
> index 0000000..355e284
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools3
> +require python-pybind11.inc
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

