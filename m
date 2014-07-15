Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDEE8704B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 01:43:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6F1hBfQ022496
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 18:43:11 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 14 Jul 2014 18:43:10 -0700
Message-ID: <53C48728.8050407@windriver.com>
Date: Tue, 15 Jul 2014 09:43:04 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1405318330-20493-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1405318330-20493-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-perl] libxml-sax-writer-perl: add recipe
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
X-List-Received-Date: Tue, 15 Jul 2014 01:43:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Hongxu Jia <hongxu.jia@windriver.com>

//Hongxu


On 07/14/2014 02:12 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../libxml/libxml-sax-writer-perl_0.54.bb          |   27 ++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
>
> diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
> new file mode 100644
> index 0000000..c7a24fc
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "XML::SAX::Writer - SAX2 Writer"
> +DESCRIPTION = "\
> +XML::SAX::Writer helps to serialize SAX2 representations of XML documents to \
> +strings, files, and other flat representations. It handles charset encodings, \
> +XML escaping conventions, and so forth. It is still considered alpha, \
> +although it has been put to limited use in settings such as XML::LibXML and \
> +the AxKit XML Application Server. \
> +"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPLv1+"
> +HOMEPAGE = "http://search.cpan.org/dist/XML-SAX-Writer/"
> +DEPENDS += "libxml-filter-buffertext-perl-native"
> +RDEPENDS_${PN} += "libxml-filter-buffertext-perl"
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
> +SRC_URI[md5sum] = "383139d76418a82b9800dc4f8b568891"
> +SRC_URI[sha256sum] = "a1b4d959aed8f8337523c4cef4b431e56e619c795dc6f99a868548952101cf3d"
> +
> +LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
> +
> +S = "${WORKDIR}/XML-SAX-Writer-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"
> +
> +PACKAGE_ARCH = "all"


