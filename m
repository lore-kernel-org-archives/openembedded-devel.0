Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBC8D70671
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 10:57:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6NAv4Z3012493
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 03:57:04 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 23 Jul 2014 03:57:03 -0700
Message-ID: <53CF94F0.5030809@windriver.com>
Date: Wed, 23 Jul 2014 18:56:48 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1406012826-21276-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1406012826-21276-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH v2][meta-perl] libxml-filter-buffertext-perl: add recipe
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
X-List-Received-Date: Wed, 23 Jul 2014 10:57:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Hongxu Jia <hongxu.jia@windriver.com>

//Hongxu

On 07/22/2014 03:07 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../libxml/libxml-filter-buffertext-perl_1.01.bb   |   25 ++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
>
> diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> new file mode 100644
> index 0000000..755a7c4
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "XML::Filter::BufferText - Filter to put all characters() in one event"
> +DESCRIPTION = "\
> +The XML::Filter::BufferText module is a very simple filter.  One common \
> +cause of grief (and programmer error) is that XML parsers aren't required \
> +to provide character events in one chunk.  They can, but are not forced \
> +to, and most don't.  This filter does the trivial but oft-repeated task \
> +of putting all characters into a single event. \
> +"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPLv1+"
> +HOMEPAGE = "http://search.cpan.org/dist/XML-Filter-BufferText/"
> +DEPENDS += "libxml-sax-perl-native"
> +RDEPENDS_${PN} += "libxml-sax-perl"
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RB/RBERJON/XML-Filter-BufferText-${PV}.tar.gz"
> +SRC_URI[md5sum] = "2992c0387632583b966ab9c965b25512"
> +SRC_URI[sha256sum] = "8fd2126d3beec554df852919f4739e689202cbba6a17506e9b66ea165841a75c"
> +
> +LIC_FILES_CHKSUM = "file://BufferText.pm;beginline=88;endline=90;md5=497aa6d79cc84c3d769a2a0016bee928"
> +
> +S = "${WORKDIR}/XML-Filter-BufferText-${PV}"
> +
> +inherit cpan allarch
> +
> +BBCLASSEXTEND = "native"


