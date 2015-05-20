Return-Path: <josep.puigdemont@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 95A20601E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 13:00:41 +0000 (UTC)
Received: from iapetus.enea.se (172.16.141.154) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 May 2015 15:00:41 +0200
Date: Wed, 20 May 2015 15:00:41 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150520130041.GA9161@iapetus.enea.se>
References: <1429646102-11227-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
In-Reply-To: <1429646102-11227-1-git-send-email-josep.puigdemont@enea.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: Re: [meta-python][PATCH] psutil: update to newer version (2.2.1)
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
X-List-Received-Date: Wed, 20 May 2015 13:00:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

kind reminder

On Tue, Apr 21, 2015 at 09:55:02PM +0200, Josep Puigdemont wrote:
> Convert to pypi recipe.
> Account for dependency on python-subprocess.
> 
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  meta-python/recipes-devtools/python/python-psutil_0.6.1.bb | 14 --------------
>  meta-python/recipes-devtools/python/python-psutil_2.2.1.bb | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 14 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb b/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
> deleted file mode 100644
> index ff113d0..0000000
> --- a/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "A cross-platform process and system utilities module for Python"
> -SECTION = "devel/python"
> -HOMEPAGE = "http://code.google.com/p/psutil"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
> -
> -SRC_URI = "http://psutil.googlecode.com/files/psutil-${PV}.tar.gz"
> -SRC_URI[md5sum] = "3cfcbfb8525f6e4c70110e44a85e907e"
> -SRC_URI[sha256sum] = "d665a4cc58c9a5d207fb0dc9869fc0ee10f4f66ad885e84886ef6339ccce0a6f"
> -
> -S = "${WORKDIR}/psutil-${PV}"
> -
> -inherit setuptools
> -
> diff --git a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
> new file mode 100644
> index 0000000..326d668
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "A cross-platform process and system utilities module for Python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
> +
> +SRC_URI[md5sum] = "1a2b58cd9e3a53528bb6148f0c4d5244"
> +SRC_URI[sha256sum] = "a0e9b96f1946975064724e242ac159f3260db24ffa591c3da0a355361a3a337f"
> +
> +RDEPENDS_${PN} += " \
> +    python-subprocess \
> +    "
> +
> +inherit pypi
> -- 
> 2.1.0
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

