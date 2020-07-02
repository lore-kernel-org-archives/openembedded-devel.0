Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.1210.1593672922472758678
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 23:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=WI2F0r/p;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=445b5c427=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1593672920; x=1625208920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=skBsvmm/8qSloaR+DVvArfNRggeebIV+2pVai0ocgk4=;
  b=WI2F0r/pbFUgGKBBv00oP7qsFaiH6n6DDD1JAeE4luzf/UrHS+r/lMXt
   HQJsxa6AjYkKi1sme4NRJzeTDyvL4q5kRSqMzlcOZ8aBisMFoZfsXAWqj
   LiJZtGI6as1x0qF4hYIJKS+sMIep8e4o7M3GmmgB4mJtu2Z/MArCorKRm
   yHT+TqB4FmMl58Wgtb8r3kwzA43o1ex+mBu/qsk4n40gQC7I9xKL6FsdH
   b/3RNeQTGgFpF4TB4g/JBNw8/YefEStq2nJVQybK1I/Rgu/OcJcBGz18r
   Ggalsxpy104Rs/xEEuidHN077CpyqjbxrA1k3q/J8C5iu3P2/6i24jdSJ
   g==;
IronPort-SDR: wcKYc8uJrlKeK/6JmPp3+zqg7HR2lXYTQqxB/b48a/OCzjYmW/uGda/hHYnz/AhlCsnGmdQsmh
 UuUgP+0u5IjKH/24G6PpAs9404m+Ac377EFB7R2l2YJlVwg9YJzGhoqUuQ+X51gWZ86hm+WdMQ
 /EQqj3b/fAMZ7obLZrenqEIOEkTUE+JA+kOrVnkDR8ftEWEd7AJfugI15zmGlyu8r5j7arRDYy
 j/tGqwujNFMtWQiXXbkjbczW6MwZmmXtwoP6XLVarQuwydq6z2uX3/2r6uUNXlOe9gEiyNHFww
 S3U=
X-IronPort-AV: E=Sophos;i="5.75,303,1589234400"; 
   d="scan'208";a="25253471"
Date: Thu, 2 Jul 2020 08:55:18 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, Vyacheslav Yurkov
	<Vyacheslav.Yurkov@bruker.com>
Subject: Re: [oe] [meta-java][PATCH v2] icedtea7-native: set unique download file names
Message-ID: <20200702065518.GB308462@pcleri>
References: <20200629071400.200683-1-uvv.mail@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200629071400.200683-1-uvv.mail@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
thank you for your patch!

This is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;rl

On Mon, Jun 29, 2020 at 09:14:00AM +0200, Vyacheslav Yurkov wrote:
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> 
> Add package names to download file names. This allows to avoid name
> collisions in case PREMIRRORS are used and all source archives reside in
> the same directory. Fixed mixed indentation.
> 
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc      | 47 +++++++++----------
>  .../icedtea/openjdk-7-release-03b147.inc      | 40 +++++++++-------
>  2 files changed, 46 insertions(+), 41 deletions(-)
> 
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index b0b9419..f117f4a 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -67,31 +67,28 @@ export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
>  INSANE_SKIP_${PN} = "already-stripped"
>  
>  EXTRA_OECONF = "\
> -	--with-parallel-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
> -	\
> -        --disable-tests \
> -        --disable-hotspot-tests \
> -        --disable-langtools-tests \
> -        --disable-jdk-tests \
> -        --disable-pulse-java \
> -        --disable-docs \
> -        --disable-nss \
> -        --disable-system-lcms \
> -	--disable-system-gtk \
> -	\
> -	--with-jdk-home=${WORKDIR}/fake-jdk \
> -	--with-javac=${STAGING_BINDIR_NATIVE}/javac \
> -	--with-rhino=${STAGING_DATADIR_NATIVE}/java/rhino.jar \
> -	\
> -	--with-openjdk-src-zip=${DL_DIR}/${OPENJDK_FILE} \
> -        --with-hotspot-src-zip=${DL_DIR}/${HOTSPOT_FILE} \
> -        --with-corba-src-zip=${DL_DIR}/${CORBA_FILE} \
> -        --with-jaxp-src-zip=${DL_DIR}/${JAXP_FILE} \
> -        --with-jaxws-src-zip=${DL_DIR}/${JAXWS_FILE} \
> -        --with-jdk-src-zip=${DL_DIR}/${JDK_FILE} \
> -        --with-langtools-src-zip=${DL_DIR}/${LANGTOOLS_FILE} \
> -        ac_cv_path_UNZIP_BIN="${STAGING_BINDIR_NATIVE}/unzip" \
> -  "
> +    --with-parallel-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
> +    --disable-tests \
> +    --disable-hotspot-tests \
> +    --disable-langtools-tests \
> +    --disable-jdk-tests \
> +    --disable-pulse-java \
> +    --disable-docs \
> +    --disable-nss \
> +    --disable-system-lcms \
> +    --disable-system-gtk \
> +    --with-jdk-home=${WORKDIR}/fake-jdk \
> +    --with-javac=${STAGING_BINDIR_NATIVE}/javac \
> +    --with-rhino=${STAGING_DATADIR_NATIVE}/java/rhino.jar \
> +    --with-openjdk-src-zip=${DL_DIR}/${OPENJDK_FILE_DOWNLOAD} \
> +    --with-hotspot-src-zip=${DL_DIR}/${HOTSPOT_FILE_DOWNLOAD} \
> +    --with-corba-src-zip=${DL_DIR}/${CORBA_FILE_DOWNLOAD} \
> +    --with-jaxp-src-zip=${DL_DIR}/${JAXP_FILE_DOWNLOAD} \
> +    --with-jaxws-src-zip=${DL_DIR}/${JAXWS_FILE_DOWNLOAD} \
> +    --with-jdk-src-zip=${DL_DIR}/${JDK_FILE_DOWNLOAD} \
> +    --with-langtools-src-zip=${DL_DIR}/${LANGTOOLS_FILE_DOWNLOAD} \
> +    ac_cv_path_UNZIP_BIN="${STAGING_BINDIR_NATIVE}/unzip" \
> +"
>  
>  JDK_DIR = "icedtea7-native"
>  
> diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> index 9816c0c..b504667 100644
> --- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
> +++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> @@ -13,50 +13,58 @@ ICEDTEA_PREFIX = "icedtea7-forest-2.1"
>  ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
>  
>  OPENJDK_CHANGESET = "22cc03983e20"
> -OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
> -OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
> +OPENJDK_FILE_UPSTREAM = "${OPENJDK_CHANGESET}.tar.bz2"
> +OPENJDK_FILE_DOWNLOAD = "openjdk-${OPENJDK_CHANGESET}.tar.bz2"
> +OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE_UPSTREAM};name=openjdk;unpack=false;downloadfilename=${OPENJDK_FILE_DOWNLOAD}"
>  SRC_URI[openjdk.md5sum] = "f98b0f7a69f9427a5b3775dddddc89cb"
>  SRC_URI[openjdk.sha256sum] = "758227833982371e3a94def84226a947f8dbbd176517f313b8cb96840bdea41e"
>  
>  HOTSPOT_CHANGESET = "8b7c4c5f6ba9"
> -HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.gz"
> -HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
> +HOTSPOT_FILE_UPSTREAM = "${HOTSPOT_CHANGESET}.tar.gz"
> +HOTSPOT_FILE_DOWNLOAD = "hotspot-${HOTSPOT_CHANGESET}.tar.gz"
> +HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE_UPSTREAM};name=hotspot;unpack=false;downloadfilename=${HOTSPOT_FILE_DOWNLOAD}"
>  SRC_URI[hotspot.md5sum] = "cb45a8f19d77acc1f4f48e75e36a27fe"
>  SRC_URI[hotspot.sha256sum] = "22866990d143e76ced94b76defa3051e5e5d9a51fd272d63daa0df272d6406a2"
>  
>  CORBA_CHANGESET = "5617f6c5cc94"
> -CORBA_FILE = "${CORBA_CHANGESET}.tar.gz"
> -CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
> +CORBA_FILE_UPSTREAM = "${CORBA_CHANGESET}.tar.gz"
> +CORBA_FILE_DOWNLOAD = "corba-${CORBA_CHANGESET}.tar.gz"
> +CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE_UPSTREAM};name=corba;unpack=false;downloadfilename=${CORBA_FILE_DOWNLOAD}"
>  SRC_URI[corba.md5sum] = "920f1a788a7fdef29a5cd70892331251"
>  SRC_URI[corba.sha256sum] = "963915483530f311ff313635f79ed11ea7ce5a1c0dbee5d1acb1994132857fa3"
>  
>  JAXP_CHANGESET = "7a8825b15df6"
> -JAXP_FILE = "${JAXP_CHANGESET}.tar.gz"
> -JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
> +JAXP_FILE_UPSTREAM = "${JAXP_CHANGESET}.tar.gz"
> +JAXP_FILE_DOWNLOAD = "jaxp-${JAXP_CHANGESET}.tar.gz"
> +JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE_UPSTREAM};name=jaxp;unpack=false;downloadfilename=${JAXP_FILE_DOWNLOAD}"
>  SRC_URI[jaxp.md5sum] = "a0982b6df79739127871e355a40ca5a6"
>  SRC_URI[jaxp.sha256sum] = "297c8dbeed5afa5395b6be06b17282d53f8a888c2909074dfc1605afc0daf1c2"
>  
>  JAXWS_CHANGESET = "7edfbfe974f2"
> -JAXWS_FILE = "${JAXWS_CHANGESET}.tar.gz"
> -JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
> +JAXWS_FILE_UPSTREAM = "${JAXWS_CHANGESET}.tar.gz"
> +JAXWS_FILE_DOWNLOAD = "jaxws-${JAXWS_CHANGESET}.tar.gz"
> +JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE_UPSTREAM};name=jaxws;unpack=false;downloadfilename=${JAXWS_FILE_DOWNLOAD}"
>  SRC_URI[jaxws.md5sum] = "2deecec809ea8e38835678889c2bc3ac"
>  SRC_URI[jaxws.sha256sum] = "823ca6b8fd780bf1b1565a90cfc8ec6f0ee422a5d25ffb20b1ce0272dc4955aa"
>  
>  JDK_CHANGESET = "d5ddeffc4651"
> -JDK_FILE = "${JDK_CHANGESET}.tar.gz"
> -JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
> +JDK_FILE_UPSTREAM = "${JDK_CHANGESET}.tar.gz"
> +JDK_FILE_DOWNLOAD = "jdk-${JDK_CHANGESET}.tar.gz"
> +JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE_UPSTREAM};name=jdk;unpack=false;downloadfilename=${JDK_FILE_DOWNLOAD}"
>  SRC_URI[jdk.md5sum] = "27c28d6be213df818490e69f12efe475"
>  SRC_URI[jdk.sha256sum] = "e83e6234842376147a4c32451f23d629ba107e908ebdb0f367657f9cc6c1be98"
>  
>  LANGTOOLS_CHANGESET = "b534c4c6cd9b"
> -LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.gz"
> -LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
> +LANGTOOLS_FILE_UPSTREAM = "${LANGTOOLS_CHANGESET}.tar.gz"
> +LANGTOOLS_FILE_DOWNLOAD = "langtools-${LANGTOOLS_CHANGESET}.tar.gz"
> +LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE_UPSTREAM};name=langtools;unpack=false;downloadfilename=${LANGTOOLS_FILE_DOWNLOAD}"
>  SRC_URI[langtools.md5sum] = "16b72f3fea8ac4e5b50de693e87f9c53"
>  SRC_URI[langtools.sha256sum] = "c77dd42d83f06d18fa8aa65c93d137608a2e02cf24b68fc10d7b1c0bcc12a93c"
>  
>  CACAO_VERSION = "a567bcb7f589"
> -CACAO_FILE = "${CACAO_VERSION}.tar.gz"
> -CACAO_URI = "http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_FILE};name=cacao;unpack=false"
> +CACAO_FILE_UPSTREAM = "${CACAO_VERSION}.tar.gz"
> +CACAO_FILE_DOWNLOAD = "cacao-${CACAO_VERSION}.tar.gz"
> +CACAO_URI = "http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_FILE_UPSTREAM};name=cacao;unpack=false;downloadfilename=${CACAO_FILE_DOWNLOAD}"
>  SRC_URI[cacao.md5sum] = "ec1def7f0d3d25e9e7da47c480f26a73"
>  SRC_URI[cacao.sha256sum] = "d49f79debc131a5694cae6ab3ba2864e7f3249ee8d9dc09aae8afdd4dc6b09f9"
>  
> -- 
> 2.25.1
> 
