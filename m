Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C48DC6CCA3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 05:46:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9G5kEjN020562
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2013 22:46:14 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 15 Oct 2013 22:46:13 -0700
Message-ID: <525E2824.3070303@windriver.com>
Date: Wed, 16 Oct 2013 13:46:12 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Emil Petersen <erp@movis.dk>
References: <1378222415-13643-1-git-send-email-erp@movis.dk>
In-Reply-To: <1378222415-13643-1-git-send-email-erp@movis.dk>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl] libwww-perl_5.834: added
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
X-List-Received-Date: Wed, 16 Oct 2013 05:46:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2013 11:33 PM, Emil Petersen wrote:
> libwww which provides most of LWP::* added
>
> Signed-off-by: Emil Petersen <erp@movis.dk>
> ---
>   .../recipes-perl/libwww-perl/libwww-perl_5.834.bb  | 68 ++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libwww-perl/libwww-perl_5.834.bb
>
> diff --git a/meta-perl/recipes-perl/libwww-perl/libwww-perl_5.834.bb b/meta-perl/recipes-perl/libwww-perl/libwww-perl_5.834.bb
> new file mode 100644
> index 0000000..f1a77d5
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libwww-perl/libwww-perl_5.834.bb
> @@ -0,0 +1,68 @@
> +SUMMARY = "libwww-perl provides a simple and consistent API to the World Wide Web"
> +AUTHOR = "Gisle Aas <gisle@activestate.com>"
> +HOMEPAGE = "https://metacpan.org/release/libwww-perl"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://README;md5=b7d978c7767cb9fb392f80103af8ca0a"
> +
> +RDEPENDS_${PN} += "libdigest-md5-perl \
> +                   libencode-perl \
> +                   libencode-locale-perl \
> +                   libfile-listing-perl \
> +                   libhtml-entities-perl \
> +                   libhtml-headparser-perl \
> +                   libhttp-date-perl \
> +                   libhttp-cookies-perl \
> +                   libhttp-daemon-perl \
> +                   libhttp-negotiate-perl \
> +                   libhttp-request-perl \
> +                   libhttp-request-common-perl \
> +                   libhttp-response-perl \
> +                   libhttp-status-perl \

Which recipe provides the 'libhttp-*' ?

> +                   libio-select-perl \

s/libio-select-perl/perl-module-io-select/

> +                   libio-socket-perl \

s/libio-socket-perl/perl-module-io-socket/

> +                   liblwp-mediatypes-perl \

Which recipe provides the liblwp-mediatypes-perl?

> +                   libmime-base64-perl \

s/libmime-base64-perl/perl-module-mime-base64/

> +                   libnet-ftp-perl \

s/libnet-ftp-perl/perl-module-net-ftp/

> +                   libnet-http-perl \

Which recipe provides the libnet-http-perl?

> +                   liburi-perl \

Which recipe provides the liburi-perl?

> +                   liburi-escape-perl \

Which recipe provides the liburi-escape-perl?

> +                   libwww-robotrules-perl \

Which recipe provides the libwww-robotrules-perl?

//Hongxu

> +                   "
> +
> +RPROVIDES_${PN} += "liblwp-perl \
> +                    liblwp-authen-ntlm-perl \
> +                    liblwp-conncache-perl \
> +                    liblwp-debug-perl \
> +                    liblwp-membermixin-perl \
> +                    liblwp-protocol-perl \
> +                    liblwp-robotua-perl \
> +                    liblwp-simple-perl \
> +                    liblwp-useragent-perl \
> +                    liblwp-authen-basic-perl \
> +                    liblwp-authen-digest-perl \
> +                    liblwp-protocol-cpan-perl \
> +                    liblwp-protocol-data-perl \
> +                    liblwp-protocol-file-perl \
> +                    liblwp-protocol-ftp-perl \
> +                    liblwp-protocol-ghttp-perl \
> +                    liblwp-protocol-gopher-perl \
> +                    liblwp-protocol-http-perl \
> +                    liblwp-protocol-http-socket-perl \
> +                    liblwp-protocol-http-socketmethods-perl \
> +                    liblwp-protocol-loopback-perl \
> +                    liblwp-protocol-mailto-perl \
> +                    liblwp-protocol-myftp-perl \
> +                    liblwp-protocol-nntp-perl \
> +                    liblwp-protocol-nogo-perl \
> +                    "
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/libwww-perl-${PV}.tar.gz;name=libwww-perl-${PV}"
> +SRC_URI[libwww-perl-5.834.md5sum] = "f2ed8a461f76556c9caed9087f47c86c"
> +SRC_URI[libwww-perl-5.834.sha256sum] = "1a50eb91d1deeca3be10982e129e786809ad6f0f8049b156e91e889e5a7288ff"
> +
> +S = "${WORKDIR}/libwww-perl-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"


