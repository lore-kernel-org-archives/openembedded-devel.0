Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43C237547F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:56:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8J2uM32025787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Sep 2018 19:56:32 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 19:56:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
References: <cover.1537324153.git.hongxu.jia@windriver.com>
	<7ff6a7aef33e79e3b5aa392be7e9b9be18eca613.1537324153.git.hongxu.jia@windriver.com>
Message-ID: <67e262f7-b4ef-a3f4-d203-ef20a37e52bf@windriver.com>
Date: Wed, 19 Sep 2018 10:56:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7ff6a7aef33e79e3b5aa392be7e9b9be18eca613.1537324153.git.hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 12/19] xerces-c: split one dpg package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2018 02:56:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I've update git repository

   git://git.openembedded.org/openembedded-core-contrib hongxu/dbg-split
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/dbg-split

//Hongxu

On 2018年09月19日 10:31, Hongxu Jia wrote:
> Multiple -dbg packages per recipe is not encouraged, and only one is
> recommended and the code only works properly in some cases for one.
>
> Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
> requiring.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> index 9bc4ea3..0951307 100644
> --- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> +++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> @@ -24,24 +24,21 @@ do_install_prepend () {
>   }
>   
>   PACKAGES = "libxerces-c \
> -    libxerces-c-dbg \
>       libxerces-c-dev \
>       xerces-c-samples \
> -    xerces-c-samples-dbg \
>       libxerces-c-staticdev \
> +    ${PN}-dbg \
>   "
>   
> +RPROVIDES_${PN}-dbg += "libxerces-c-dbg xerces-c-samples-dbg"
> +
>   FILES_libxerces-c = "${libdir}/libxerces-c-3.1.so"
> -FILES_libxerces-c-dbg = "${libdir}/.debug \
> -    ${prefix}/src/debug \
> -"
>   FILES_libxerces-c-dev = "${libdir}/lib*.la \
>       ${libdir}/libxerces-c.so \
>       ${libdir}/pkgconfig/xerces-c.pc \
>       ${includedir}/xercesc \
>   "
>   FILES_xerces-c-samples = "${bindir}/*"
> -FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
>   FILES_libxerces-c-staticdev = "${libdir}/lib*.a"
>   
>   BBCLASSEXTEND = "native"



