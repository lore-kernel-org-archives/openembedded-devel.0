Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D17A875876
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:38:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6O8c1Pb021793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 01:38:01 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 24 Jul 2015 01:37:50 -0700
Message-ID: <55B1F967.7040904@windriver.com>
Date: Fri, 24 Jul 2015 16:37:59 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1433486098-9766-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1433486098-9766-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH][meta-oe] mercurial-native: update from 3.0.1 to 3.4.1
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
X-List-Received-Date: Fri, 24 Jul 2015 08:38:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...

On 06/05/2015 02:34 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Update mercurial to fix CVE-2014-9462:
>    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-9462
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   .../mercurial/mercurial-native_3.0.1.bb            | 26 ----------------------
>   .../mercurial/mercurial-native_3.4.1.bb            | 26 ++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 26 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/mercurial/mercurial-native_3.0.1.bb
>   create mode 100644 meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb
>
> diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.0.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_3.0.1.bb
> deleted file mode 100644
> index 9a5eebe..0000000
> --- a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.0.1.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -SUMMARY = "The Mercurial distributed SCM"
> -HOMEPAGE = "http://mercurial.selenic.com/"
> -SECTION = "console/utils"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -DEPENDS = "python-native"
> -
> -SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz"
> -SRC_URI[md5sum] = "15de301a673b77f839325dba10ed4fc0"
> -SRC_URI[sha256sum] = "36e48b59a84ef5a222d06596971e955ac8217e56b076dfb94c8ce5a0c29fd705"
> -
> -S = "${WORKDIR}/mercurial-${PV}"
> -
> -inherit native
> -
> -EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
> -    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} PREFIX=${prefix}"
> -
> -do_configure_append () {
> -    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
> -}
> -
> -do_install () {
> -    oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
> -}
> -
> diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb
> new file mode 100644
> index 0000000..303a032
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "The Mercurial distributed SCM"
> +HOMEPAGE = "http://mercurial.selenic.com/"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +DEPENDS = "python-native"
> +
> +SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz"
> +SRC_URI[md5sum] = "65783a60aefb46a11296b587e9403537"
> +SRC_URI[sha256sum] = "7a8acf7329beda38ceea29c689212574d9a6bfffe24cf565015ea0066f7cee3f"
> +
> +S = "${WORKDIR}/mercurial-${PV}"
> +
> +inherit native
> +
> +EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
> +    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} PREFIX=${prefix}"
> +
> +do_configure_append () {
> +    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
> +}
> +
> +do_install () {
> +    oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
> +}
> +
>

