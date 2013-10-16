Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38B906CCA3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 05:56:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9G5u8D4021253
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2013 22:56:08 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 15 Oct 2013 22:56:07 -0700
Message-ID: <525E2A76.6050702@windriver.com>
Date: Wed, 16 Oct 2013 13:56:06 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Emil Petersen <erp@movis.dk>
References: <1378223206-14183-1-git-send-email-erp@movis.dk>
In-Reply-To: <1378223206-14183-1-git-send-email-erp@movis.dk>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH] libhtml-parser-perl_3.71.bb: added
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
X-List-Received-Date: Wed, 16 Oct 2013 05:56:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2013 11:46 PM, Emil Petersen wrote:
> HTML::Parser and RPROVIDES added
>
> Signed-off-by: Emil Petersen <erp@movis.dk>
> ---
>   .../libhtml-parser-perl_3.71.bb                    | 29 ++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libhtml-parser-perl/libhtml-parser-perl_3.71.bb
>
> diff --git a/meta-perl/recipes-perl/libhtml-parser-perl/libhtml-parser-perl_3.71.bb b/meta-perl/recipes-perl/libhtml-parser-perl/libhtml-parser-perl_3.71.bb
> new file mode 100644
> index 0000000..ad8c57a
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libhtml-parser-perl/libhtml-parser-perl_3.71.bb
> @@ -0,0 +1,29 @@
> +SUMARRY = "This package contains the Parser.pm module with friends."
> +AUTHOR = "Gisle Aas <gisle@activestate.com>"
> +HOMEPAGE = "https://metacpan.org/release/HTML-Parser"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://README;md5=6c3dacf9f405c7483870ab5f148770c3"
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
> +SRC_URI[md5sum] = "9128a45893097dfa3bf03301b19c5efe"
> +SRC_URI[sha256sum] = "be918b3749d3ff93627f72ee4b825683332ecb4c81c67a3a8d72b0435ffbd802"
> +
> +RDEPENDS_${PN} += 'libhtml-tagset-perl libxsloader-perl'

Which recipe provoides libhtml-tagset-perl?

s/libxsloader-perl/perl-module-xsloader/

//Hongxu

> +
> +RPROVIDES_${PN} += "libhtml-entities-perl \
> +                    libhtml-filter-perl \
> +                    libhtml-headparser-perl \
> +                    libhtml-linkextor-perl \
> +                    libhtml-parser-perl \
> +                    libhtml-pullparser-perl \
> +                    libhtml-tokeparser-perl \
> +                    "
> +
> +S = "${WORKDIR}/HTML-Parser-${PV}"
> +
> +EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"


