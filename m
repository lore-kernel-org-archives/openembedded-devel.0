Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7B560EE0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 02:24:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9G2OGHF005593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2013 19:24:16 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 15 Oct 2013 19:24:15 -0700
Message-ID: <525DF8CE.8010108@windriver.com>
Date: Wed, 16 Oct 2013 10:24:14 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Emil Petersen <erp@movis.dk>
References: <1376914598-18054-1-git-send-email-erp@movis.dk>
In-Reply-To: <1376914598-18054-1-git-send-email-erp@movis.dk>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] perl-module-common-sense: added, perl-module-json-xs: added
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
X-List-Received-Date: Wed, 16 Oct 2013 02:24:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2013 08:16 PM, Emil Petersen wrote:
> Added JSON::XS and it's dependency common::sense

If JSON::XS depends common::sense, we should add
DEPENS = "perl-module-json-xs" in perl-module-json-xs.

> My apologies for any previous malformatted commits.

This should not be in the comments.

//Hongxu

>
> Signed-off-by: Emil Petersen <erp@movis.dk>
> ---
>   .../perl-module-common-sense_3.6.bb                   |   17 +++++++++++++++++
>   .../perl-module-json-xs/perl-module-json-xs_2.34.bb   |   17 +++++++++++++++++
>   2 files changed, 34 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/perl-module-common-sense/perl-module-common-sense_3.6.bb
>   create mode 100644 meta-perl/recipes-perl/perl-module-json-xs/perl-module-json-xs_2.34.bb
>
> diff --git a/meta-perl/recipes-perl/perl-module-common-sense/perl-module-common-sense_3.6.bb b/meta-perl/recipes-perl/perl-module-common-sense/perl-module-common-sense_3.6.bb
> new file mode 100644
> index 0000000..4373cfc
> --- /dev/null
> +++ b/meta-perl/recipes-perl/perl-module-common-sense/perl-module-common-sense_3.6.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "common::sense - save a tree AND a kitten, use common::sense!"
> +AUTHOR = "Marc Lehmann"
> +HOMEPAGE = "http://search.cpan.org/~mlehmann/common-sense-3.6/sense.pm.PL"
> +SECTION = "cpan"
> +LICENSE = "GPLv1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=043dba8b278e1db1b0ef93f30140b02b"
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/common-sense-3.6.tar.gz"
> +SRC_URI[md5sum] = "9332e9fe85b0bce8c287a0429d164809"
> +SRC_URI[sha256sum] = "86e2c2e109a7dd4bc5441757e729d7d622da125c6e14607a78fb56e057b86b5a"
> +
> +S = "${WORKDIR}/common-sense-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"
> +
> diff --git a/meta-perl/recipes-perl/perl-module-json-xs/perl-module-json-xs_2.34.bb b/meta-perl/recipes-perl/perl-module-json-xs/perl-module-json-xs_2.34.bb
> new file mode 100644
> index 0000000..cb69e8c
> --- /dev/null
> +++ b/meta-perl/recipes-perl/perl-module-json-xs/perl-module-json-xs_2.34.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "JSON::XS - JSON serialising/deserialising, done correctly and fast"
> +AUTHOR = "Marc Lehmann <schmorp@schmorp.de>"
> +HOMEPAGE = "https://metacpan.org/module/JSON::XS"
> +SECTION = "cpan"
> +LICENSE = "GPLv1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=043dba8b278e1db1b0ef93f30140b02b"
> +
> +SRC_URI = "http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/JSON-XS-2.34.tar.gz"
> +SRC_URI[md5sum] = "dda3c03335665cdeff91c37a269b833b"
> +SRC_URI[sha256sum] = "a62fdf2777b9ae206aef382dbb62c9a126ce2ceef0229edacee3f6a9c78900ea"
> +
> +S = "${WORKDIR}/JSON-XS-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"
> +


