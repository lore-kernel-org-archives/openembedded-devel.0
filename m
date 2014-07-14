Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8FE56AC83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 01:50:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6E1o23g020478
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 13 Jul 2014 18:50:02 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 13 Jul 2014 18:50:02 -0700
Message-ID: <53C33744.9010508@windriver.com>
Date: Mon, 14 Jul 2014 09:49:56 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <1405058901-12126-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1405058901-12126-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH 1/3][meta-perl] libtext-iconv-perl: add recipe
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
X-List-Received-Date: Mon, 14 Jul 2014 01:50:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Hongxu Jia <hongxu.jia@windriver.com>

//Hongxu

On 07/11/2014 02:08 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../recipes-perl/libtext/libtext-iconv-perl_1.7.bb |   24 ++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
>
> diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> new file mode 100644
> index 0000000..fb4182d
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Perl interface to iconv() codeset conversion function"
> +DESCRIPTION = "\
> +The Text::Iconv module provides a Perl interface to the iconv() \
> +function as defined by the Single UNIX Specification. The convert() \
> +method converts the encoding of characters in the input string from \
> +the fromcode codeset to the tocode codeset, and returns the result. \
> +Settings of fromcode and tocode and their permitted combinations are \
> +implementation-dependent. Valid values are specified in the system \
> +documentation."
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://README;beginline=3;endline=6;md5=fadf2919c7128e887d26b4d905f90649"
> +RRECOMMENDS_${PN} += "eglibc-gconvs"
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "81b26e069eaebb084e91ea3c009b67ae"
> +SRC_URI[sha256sum] = "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4bcee383d029e7d2d5c3"
> +
> +S = "${WORKDIR}/Text-Iconv-${PV}"
> +
> +inherit cpan
> +
> +FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/Text/Iconv/.debug/"


