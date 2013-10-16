Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F011615A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 03:07:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9G371oK008774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2013 20:07:02 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 15 Oct 2013 20:07:00 -0700
Message-ID: <525E02D3.5040900@windriver.com>
Date: Wed, 16 Oct 2013 11:06:59 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Emil Petersen <erp@movis.dk>
References: <1378222982-14097-1-git-send-email-erp@movis.dk>
In-Reply-To: <1378222982-14097-1-git-send-email-erp@movis.dk>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH] libfile-listing-perl_6.04: added
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
X-List-Received-Date: Wed, 16 Oct 2013 03:07:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2013 11:43 PM, Emil Petersen wrote:
> File::Listing added
>
> Signed-off-by: Emil Petersen <erp@movis.dk>
> ---
>   .../libfile-listing-perl_6.04.bb                   | 26 ++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libfile-listing-perl/libfile-listing-perl_6.04.bb
>
> diff --git a/meta-perl/recipes-perl/libfile-listing-perl/libfile-listing-perl_6.04.bb b/meta-perl/recipes-perl/libfile-listing-perl/libfile-listing-perl_6.04.bb
> new file mode 100644
> index 0000000..991de44
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libfile-listing-perl/libfile-listing-perl_6.04.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "File::Listing - parse directory listing"
> +AUTHOR = "Gisle Aas <gisle@activestate.com>"
> +HOMEPAGE = "https://metacpan.org/module/File::Listing"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://README;md5=b797097ead2abb910a9b40c0393742c3"
> +
> +SRC_URI = "http://cpan.metacpan.org/authors/id/G/GA/GAAS/File-Listing-${PV}.tar.gz"
> +SRC_URI[md5sum] = "83f636b477741f3a014585bb9cc079a6"
> +SRC_URI[sha256sum] = "1e0050fcd6789a2179ec0db282bf1e90fb92be35d1171588bd9c47d52d959cf5"
> +
> +RDEPENDS_${PN} += 'libhttp-date-perl'

Which recipe provides libhttp-date-perl?

//Hongxu

> +
> +RPROVIDES_${PN} += "libfile-listing-perl \
> +                    libfile-listing-apache-perl \
> +                    libfile-listing-dosftp-perl \
> +                    libfile-listing-netware-perl \
> +                    libfile-listing-unix-perl \
> +                    libfile-listing-vms-perl \
> +                    "
> +
> +S = "${WORKDIR}/File-Listing-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"


