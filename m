Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1CF72548
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 01:35:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBG1ZiEs025593
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 15 Dec 2014 17:35:44 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Dec 2014 17:35:44 -0800
Message-ID: <548F8C66.5080005@windriver.com>
Date: Tue, 16 Dec 2014 09:35:34 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-perl][PATCH 1/4] lib-perl: move package from meta-security to meta-perl
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
X-List-Received-Date: Tue, 16 Dec 2014 01:35:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2014 12:55 AM, Armin Kuster wrote:
> please consider this common package for meta-perl.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta-perl/recipes-perl/libperl/lib-perl_0.63.bb | 28 +++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libperl/lib-perl_0.63.bb

We have a another lib-perl in oe-core 
(meta/recipes-devtools/perl/perl_5.20.0.bb),
Are they the same? If not, how about rename the recipe?
Others is fine to me.

//Hongxu

>
> diff --git a/meta-perl/recipes-perl/libperl/lib-perl_0.63.bb b/meta-perl/recipes-perl/libperl/lib-perl_0.63.bb
> new file mode 100644
> index 0000000..7895864
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libperl/lib-perl_0.63.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "This is a small simple module which simplifies the \
> +manipulation of @INC at compile time. It is typically used to add extra \
> +directories to Perl's search path so that later 'use' or 'require' statements \
> +will find modules which are not located in the default search path."
> +
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=94b119f1a7b8d611efc89b5d562a1a50"
> +
> +DEPENDS += "perl"
> +
> +SRC_URI = "http://www.cpan.org/authors/id/S/SM/SMUELLER/lib-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "8607ac4e0d9d43585ec28312f52df67c"
> +SRC_URI[sha256sum] = "72f63db9220098e834d7a38231626bd0c9b802c1ec54a628e2df35f3818e5a00"
> +
> +S = "${WORKDIR}/lib-${PV}"
> +
> +EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
> +
> +inherit cpan
> +
> +do_compile() {
> +	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
> +	cpan_do_compile
> +}


