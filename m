Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2453770E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 12:00:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA487D8v006051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Nov 2015 00:08:13 -0800 (PST)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 4 Nov 2015 00:07:12 -0800
Message-ID: <5639BCB0.9020204@windriver.com>
Date: Wed, 4 Nov 2015 16:07:12 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1446622578-21255-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1446622578-21255-1-git-send-email-Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.211]
Subject: Re: [meta-oe][PATCH V3 1/4] rrdtool: fix useless-rpath QA issue
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
X-List-Received-Date: Wed, 04 Nov 2015 12:00:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore these patches.
I'll send out patches based on the latest master.

// Qi

On 11/04/2015 03:36 PM, Chen Qi wrote:
> When building rrdtool, we would meet the following error.
>
>    ERROR: QA Issue: rrdtool-python: work/core2-64-poky-linux/rrdtool
>    /1.5.4-r0/packages-split/rrdtool-python/usr/lib/python2.7/site-packages
>    /rrdtool.so contains probably-redundant RPATH /usr/lib [useless-rpaths]
>
> Fix this issue by removing 'LD_RUN_PATH=$(libdir)' when compiling rrdtool.so.
>
> As we use '--disable-rpath' in EXTRA_OECONF, we don't need to the to remove
> '--rpath=$(libdir)' in Makefile.am.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...1-bindings-Makefile.am-remove-LD_RUN_PATH.patch | 24 ++++++++++++++++++++++
>   meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb  |  3 +--
>   2 files changed, 25 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-extended/rrdtool/files/0001-bindings-Makefile.am-remove-LD_RUN_PATH.patch
>
> diff --git a/meta-oe/recipes-extended/rrdtool/files/0001-bindings-Makefile.am-remove-LD_RUN_PATH.patch b/meta-oe/recipes-extended/rrdtool/files/0001-bindings-Makefile.am-remove-LD_RUN_PATH.patch
> new file mode 100644
> index 0000000..539caa5
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rrdtool/files/0001-bindings-Makefile.am-remove-LD_RUN_PATH.patch
> @@ -0,0 +1,24 @@
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Subject: bindings/Makefile.am: remove LD_RUN_PATH
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + bindings/Makefile.am | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/bindings/Makefile.am b/bindings/Makefile.am
> +index 54f5c23..8ea16b7 100644
> +--- a/bindings/Makefile.am
> ++++ b/bindings/Makefile.am
> +@@ -67,7 +67,6 @@ python:
> +           && env \
> +                ABS_TOP_SRCDIR=${abs_top_srcdir} \
> +                ABS_TOP_BUILDDIR=${abs_top_builddir} \
> +-               LD_RUN_PATH=$(libdir) \
> +                $(PYTHON) ${abs_srcdir}/$@/setup.py build_ext $(PYTHON_RPATH) \
> +           && env \
> +                ABS_TOP_SRCDIR=${abs_top_srcdir} \
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> index 91a30cf..2cf2dab 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> @@ -11,6 +11,7 @@ PV = "1.5.4"
>   
>   SRC_URI = "\
>       git://github.com/oetiker/rrdtool-1.x.git;branch=1.5 \
> +    file://0001-bindings-Makefile.am-remove-LD_RUN_PATH.patch \
>   "
>   
>   S = "${WORKDIR}/git"
> @@ -70,8 +71,6 @@ do_configure() {
>       sed -i -e '/PYTHON_INCLUDES="-I${/c \
>       PYTHON_INCLUDES="-I=/usr/include/python${PYTHON_BASEVERSION}"' \
>           ${S}/m4/acinclude.m4
> -    #remove the hardcoded $(libdir) rpath
> -    sed -i -e 's|--rpath=$(libdir)||g' ${S}/bindings/Makefile.am
>   
>       autotools_do_configure
>   


