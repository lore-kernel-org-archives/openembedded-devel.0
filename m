Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41882719BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 01:11:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7S1BoY6007974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Aug 2017 18:11:50 -0700 (PDT)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 27 Aug 2017 18:11:49 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1503645565-147503-1-git-send-email-hongxu.jia@windriver.com>
	<CA+chaQchXQomKxrTVbDMyqi38ZQO+89DJXtNu5PLg9xdLLw04g@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <75ac2045-4b87-d385-967e-4b77cc7c2113@windriver.com>
Date: Mon, 28 Aug 2017 09:12:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQchXQomKxrTVbDMyqi38ZQO+89DJXtNu5PLg9xdLLw04g@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libreport: fix typo of SRC_URI
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
X-List-Received-Date: Mon, 28 Aug 2017 01:11:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年08月25日 22:58, Martin Jansa wrote:
> Please change it to git fetcher, github archives can be regenerated 
> from time to time with different checksums.
>

OK, I will update it.

//Hongxu

> On Fri, Aug 25, 2017 at 9:19 AM, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
>     <http://libreport_2.9.1.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
>     <http://libreport_2.9.1.bb>
>     b/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
>     <http://libreport_2.9.1.bb>
>     index 459f0f2..ee9a84c 100644
>     --- a/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
>     <http://libreport_2.9.1.bb>
>     +++ b/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
>     <http://libreport_2.9.1.bb>
>     @@ -11,7 +11,7 @@ DEPENDS = "xmlrpc-c xmlrpc-c-native
>     intltool-native \
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
>
>     -SRC_URI =
>     "https://github.com/abrt/${BPN}/archive/${PV}/${BPN}}-%{PV}.tar.gz
>     <https://github.com/abrt/$%7BBPN%7D/archive/$%7BPV%7D/$%7BBPN%7D%7D-%%7BPV%7D.tar.gz>"
>     +SRC_URI =
>     "https://github.com/abrt/${BPN}/archive/${PV}/${BPN}-${PV}.tar.gz
>     <https://github.com/abrt/$%7BBPN%7D/archive/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz>"
>      SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
>                
>      file://0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
>     \
>                  file://0003-without-build-plugins.patch \
>     --
>     2.8.1
>
>


