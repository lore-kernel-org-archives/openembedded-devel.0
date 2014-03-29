Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31A1660D71
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Mar 2014 06:45:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2T6ixhK018726
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 23:45:00 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 28 Mar 2014 23:44:59 -0700
Message-ID: <53366BDE.4030900@windriver.com>
Date: Sat, 29 Mar 2014 14:44:46 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Tim Orling <ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
	<1391410275-31251-2-git-send-email-ticotimo@gmail.com>
In-Reply-To: <1391410275-31251-2-git-send-email-ticotimo@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH v2 01/10] libmodule-metadata-perl: add 1.000019
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
X-List-Received-Date: Sat, 29 Mar 2014 06:45:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tim,

The 'Metadata.pm' in libmodule-metadata-perl-native conflicted
with the one in perl-native, is that ok?

$ bitbake libmodule-metadata-perl-native

WARNING: The recipe libmodule-metadata-perl-native is trying to install 
files into a shared area when those files already exist. Those files and 
their manifest location are:
/home/jiahongxu/yocto/build-20140329-meta-perl/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/Module/Metadata.pm
    Matched in manifest-x86_64-perl-native.populate_sysroot
Please verify which package should provide the above files.

//Hongxu

On 02/03/2014 02:51 PM, Tim Orling wrote:
> [Description from CPAN]
> This module provides a standard way to gather metadata about a .pm file through (mostly) static analysis and (some) code execution. When determining the version of a module, the $VERSION assignment is "eval"ed, as is traditional in the CPAN toolchain.
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>   .../libmodule/libmodule-metadata-perl_1.000019.bb  |   33 ++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb
>
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb b/meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb
> new file mode 100644
> index 0000000..668f0c4
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "Module::Metadata - Gather package and POD information from perl module files"
> +DESCRIPTION = "This module provides a standard way to gather metadata about \
> +a .pm files through (mostly) static analysis and (some) code execution. When \
> +determining the version of a module, the $VERSION assignment is eval-ed, as \
> +is traditional in the CPAN toolchain."
> +SECTION = "libs"
> +
> +HOMEPAGE = "http://search.cpan.org/~ether/Module-Metadata/"
> +
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://README;beginline=185;endline=190;md5=e1b24eebe5d819b40bb68ad06b72d3ee"
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Module-Metadata-${PV}.tar.gz"
> +SRC_URI[md5sum] = "838ecf97f7daff79e0f81e104a6be823"
> +SRC_URI[sha256sum] = "5afca94dc0213608101ad519eb1b25133cdc9e44c2a053a45a5a59422c2ee554"
> +
> +S = "${WORKDIR}/Module-Metadata-${PV}"
> +
> +inherit cpan
> +
> +RDEPENDS_${PN} = " perl-module-io-file \
> +                   perl-module-data-dumper \
> +                   perl-module-extutils-makemaker \
> +                   perl-module-file-spec \
> +                   perl-module-version \
> +                   perl-module-exporter \
> +                   perl-module-carp \
> +                   perl-module-test-more \
> +                   perl-module-file-temp \
> +                   perl-module-file-path \
> +"
> +
> +BBCLASSEXTEND = "native"


