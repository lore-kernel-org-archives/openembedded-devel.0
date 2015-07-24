Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5B860962
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:37:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6O8bK7b021787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 01:37:20 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 24 Jul 2015 01:37:09 -0700
Message-ID: <55B1F93E.5050707@windriver.com>
Date: Fri, 24 Jul 2015 16:37:18 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1436769783-20950-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1436769783-20950-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH v2] libxml-libxml-perl: update from 2.0116 to 2.0121
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
X-List-Received-Date: Fri, 24 Jul 2015 08:37:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...

On 07/13/2015 02:43 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> update to 2.0121 and clean unused logic:
>
>    - do_configure_prepend() {
>    -        rm -rf ${S}/.pc/*
>    - }
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   ...{libxml-libxml-perl_2.0116.bb => libxml-libxml-perl_2.0121.bb} | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>   rename meta-perl/recipes-perl/libxml/{libxml-libxml-perl_2.0116.bb => libxml-libxml-perl_2.0121.bb} (87%)
>
> diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
> similarity index 87%
> rename from meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
> rename to meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
> index 2a6dbc2..8997a04 100644
> --- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
> +++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
> @@ -26,8 +26,8 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.
>   "
>   LIC_FILES_CHKSUM = "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
>   			file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
> -SRC_URI[libxml.md5sum] = "a53a743bf053a0cb4afb41513fb8a684"
> -SRC_URI[libxml.sha256sum] = "b154f2dad3033b30d22ac81b8985b69ad35450b0c552db394cd03bb36845812a"
> +SRC_URI[libxml.md5sum] = "1544ab9ac110f5da296015346561ce02"
> +SRC_URI[libxml.sha256sum] = "ec431011cb37a04640fd2316f64d0405a274eece2c6f3847f7fbd336eb1c0dc9"
>
>   S = "${WORKDIR}/XML-LibXML-${PV}"
>
> @@ -40,8 +40,4 @@ BBCLASSEXTEND = "native"
>   CFLAGS += " -D_GNU_SOURCE "
>   BUILD_CFLAGS += " -D_GNU_SOURCE "
>
> -do_configure_prepend() {
> -	rm -rf ${S}/.pc/*
> -}
> -
>   FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
>

