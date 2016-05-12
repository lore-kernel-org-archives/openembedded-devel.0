Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 000C36FF3D;
	Thu, 12 May 2016 02:51:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4C2prj7016790
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 May 2016 19:51:53 -0700 (PDT)
Received: from [128.224.163.143] (128.224.163.143) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 11 May 2016 19:51:52 -0700
To: <openembedded-devel@lists.openembedded.org>,
	<openembedded-commits@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <20160511104036.3411.45382@opal.openembedded.org>
	<20160511104038.95B3C501E3@opal.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <5733EFD0.1060400@windriver.com>
Date: Thu, 12 May 2016 10:52:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20160511104038.95B3C501E3@opal.openembedded.org>
X-Originating-IP: [128.224.163.143]
Subject: Re: [oe-commits] [meta-openembedded] 03/19: openconnect: add dependency to fix Makefile.am
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
X-List-Received-Date: Thu, 12 May 2016 02:51:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

I just realized that this patch is wrong. It actually creates circular 
dependency between main.c and version.c.
Please drop it.
Sorry.

Best Regards,
Chen Qi

On 05/11/2016 06:40 PM, git@opal.openembedded.org wrote:
> martin_jansa pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit efadf2fce5a3bbf4b7d6f8ee80f2fdfbadc86b06
> Author: Qi.Chen@windriver.com <Qi.Chen@windriver.com>
> AuthorDate: Fri May 6 17:02:17 2016 +0800
>
>      openconnect: add dependency to fix Makefile.am
>      
>      main.c needs version.c which is generated at build time.
>      Add this dependency to avoid the following error.
>      
>        ../git/main.c:78:21: fatal error: version.c: No such file or directory
>      
>      Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   .../0001-Makefile.am-add-missing-dependency.patch  | 28 ++++++++++++++++++++++
>   .../openconnect/openconnect_git.bb                 |  3 ++-
>   2 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/openconnect/files/0001-Makefile.am-add-missing-dependency.patch b/meta-networking/recipes-connectivity/openconnect/files/0001-Makefile.am-add-missing-dependency.patch
> new file mode 100644
> index 0000000..c465bf1
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openconnect/files/0001-Makefile.am-add-missing-dependency.patch
> @@ -0,0 +1,28 @@
> +Upstream-Status: Pending
> +
> +Subject: Makefile.am: add missing dependency
> +
> +Add missing dependency to avoid the following error.
> +
> +  ../git/main.c:78:21: fatal error: version.c: No such file or directory
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index d823e01..ea48ec1 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -112,6 +112,7 @@ EXTRA_DIST += $(shell cd "$(top_srcdir)" && \
> +
> + DISTCLEANFILES = $(pkgconfig_DATA)
> +
> ++main.c: version.c
> + main.o: version.c
> + version.c: $(library_srcs) $(lib_openssl_srcs) $(lib_gnutls_srcs) \
> + 	   $(openconnect_SOURCES) Makefile.am configure.ac \
> +--
> +2.8.1
> +
> diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> index 6d3c252..d8fe439 100644
> --- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> @@ -8,7 +8,8 @@ RDEPENDS_${PN} = "vpnc"
>   PV = "7.06"
>   
>   SRCREV = "35542d52202672b8c12ecc63867432128244013a"
> -SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git"
> +SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git \
> +           file://0001-Makefile.am-add-missing-dependency.patch"
>   
>   S = "${WORKDIR}/git"
>   
>


