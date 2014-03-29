Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 952C660577
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Mar 2014 06:24:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2T6OSCm014985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 23:24:28 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 28 Mar 2014 23:24:27 -0700
Message-ID: <5336670E.4050808@windriver.com>
Date: Sat, 29 Mar 2014 14:24:14 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Tim Orling <ticotimo@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
	<1391410275-31251-9-git-send-email-ticotimo@gmail.com>
In-Reply-To: <1391410275-31251-9-git-send-email-ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH v2 08/10] libmodule-build-tiny-perl: add 0.030
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
X-List-Received-Date: Sat, 29 Mar 2014 06:24:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2014 02:51 PM, Tim Orling wrote:
> [Description from CPAN]
> Many Perl distributions use a Build.PL file instead of a
> Makefile.PL file to drive distribution configuration, build, test and
> installation. Traditionally, Build.PL uses Module::Build as the underlying
> build system. This module provides a simple, lightweight, drop-in replacement.
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>   .../libmodule/libmodule-build-tiny-perl_0.030.bb   |   54 ++++++++++++++++++++
>   1 file changed, 54 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb
>
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb
> new file mode 100644
> index 0000000..fadd9c7
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb
> @@ -0,0 +1,54 @@
> +SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
> +DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
> +Makefile.PL file to drive distribution configuration, build, test and \
> +installation. Traditionally, Build.PL uses Module::Build as the underlying \
> +build system. This module provides a simple, lightweight, drop-in replacement. \
> +Whereas Module::Build has over 6,700 lines of code; this module has less than \
> +120, yet supports the features needed by most distributions."
> +SECTION = "libs"
> +
> +HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
> +
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=aaca61412962cf972aec0cdad99d0a84"
> +
> +DEPENDS = "libextutils-config-native libextutils-helpers-native libextutils-installpaths-native"
> +
Hi Tim,

Not found '"libextutils-config-native libextutils-helpers-native 
libextutils-installpaths-native"',

Is '*-perl-*' missing ?

$ bitbake libmodule-build-tiny-perl
Loading cache: 100% 
|#########################################################################################################| 
ETA:  00:00:00
Loaded 1243 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'libextutils-config-native' (but 
/home/jiahongxu/yocto/meta-openembedded/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb 
DEPENDS on or otherwise requires it). Close matches:
   libextutils-config-perl-native
   libextutils-config-perl
   libextutils-cppguess-perl-native
ERROR: Required build target 'libmodule-build-tiny-perl' has no 
buildable providers.
Missing or unbuildable dependency chain was: 
['libmodule-build-tiny-perl', 'libextutils-config-native']

Hi Paul & Tim,

Sorry for the late reply, the inaccurate email fillter
rules caused me missing the meta-perl mail, I have fixed it,
and put them as prior.

//Hongxu

> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
> +SRC_URI[md5sum] = "1c54bf4c602eec87f98950314699402e"
> +SRC_URI[sha256sum] = "dfd418ad0e8290cf645ab11be209a1bf6865e5a562c5a1592da99d5fd24718a8"
> +
> +S = "${WORKDIR}/Module-Build-Tiny-${PV}"
> +
> +inherit cpan_build
> +
> +do_install () {
> +        cpan_build_do_install
> +}
> +
> +RDEPENDS_${PN} = " libextutils-config-perl \
> +                   libextutils-helpers-perl \
> +                   libextutils-installpaths-perl \
> +                   perl-module-xsloader \
> +                   perl-module-file-spec \
> +                   perl-module-io-handle \
> +                   perl-module-tap-harness-env \
> +                   perl-module-ipc-open3 \
> +                   perl-module-file-path \
> +                   perl-module-cpan-meta \
> +                   perl-module-extutils-cbuilder \
> +                   perl-module-getopt-long \
> +                   perl-module-extutils-makemaker \
> +                   perl-module-exporter \
> +                   perl-module-carp \
> +                   perl-module-test-more \
> +                   perl-module-text-parsewords \
> +                   perl-module-module-load \
> +                   perl-module-file-temp \
> +                   perl-module-data-dumper \
> +                   perl-module-extutils-parsexs \
> +                   perl-module-pod-man \
> +                   perl-module-json-pp \
> +"
> +
> +BBCLASSEXTEND = "native"


