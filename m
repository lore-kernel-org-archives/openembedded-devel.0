Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9379478888
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 08:50:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w668oI5h021179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Jul 2018 01:50:18 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 6 Jul 2018 01:50:17 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20180706084113.95133-1-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B3F2C1B.1050005@windriver.com>
Date: Fri, 6 Jul 2018 16:45:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20180706084113.95133-1-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [meta-oe][PATCH v2] mcelog: Upgrade to 159
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
X-List-Received-Date: Fri, 06 Jul 2018 08:50:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年07月06日 16:41, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Update LIC_FILES_CHKSUM as license file README.md
> updated as below:
>
> diff a.orig/README.md a/README.md
>
> < see [mcelog.org](http://www.mcelog.org).
> ---
>> see [mcelog.org](https://www.mcelog.org).
> 56a57,60
>>
>> By default mcelog reports its version as the git tag. This can be overridden
>> by setting up a .os_release file in the source directory. A build system
>> could write the OS version to this file to mark the binary.


The message as below, seems > behaves special in email.

     Update LIC_FILES_CHKSUM as license file README.md
     updated as below:

     diff a.orig/README.md a/README.md

     < see [mcelog.org](http://www.mcelog.org).
     ---
     > see [mcelog.org](https://www.mcelog.org).
     56a57,60
     >
     > By default mcelog reports its version as the git tag. This can be 
overridden
     > by setting up a .os_release file in the source directory. A build 
system
     > could write the OS version to this file to mark the binary.

     Signed-off-by: Mingli Yu <mingli.yu@windriver.com>

Thanks,

>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../recipes-support/mcelog/{mcelog_1.49.bb => mcelog_159.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-support/mcelog/{mcelog_1.49.bb => mcelog_159.bb} (89%)
>
> diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb b/meta-oe/recipes-support/mcelog/mcelog_159.bb
> similarity index 89%
> rename from meta-oe/recipes-support/mcelog/mcelog_1.49.bb
> rename to meta-oe/recipes-support/mcelog/mcelog_159.bb
> index 84633a76c..236ad7d00 100644
> --- a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb
> +++ b/meta-oe/recipes-support/mcelog/mcelog_159.bb
> @@ -9,10 +9,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;
>       file://run-ptest \
>   "
>
> -SRCREV = "2cfdf29b2ef98ccd5ed42cdde8bbe437e0d6412f"
> +SRCREV = "2ed5cc0489d20cbffdc6d2e08b1fe49973f0ee34"
>
>   LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://README.md;md5=279840fabb191e6cd9150492d31b0e20"
> +LIC_FILES_CHKSUM = "file://README.md;md5=74bb47b9a68850cb398665cf78b31de6"
>
>   S = "${WORKDIR}/git"
>
>

