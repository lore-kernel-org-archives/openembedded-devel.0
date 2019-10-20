Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5727CE27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2019 01:24:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9K1O9Zi014083
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 19 Oct 2019 18:24:09 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 19 Oct 2019 18:24:08 -0700
To: "William A. Kennington III" <wak@google.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191018234515.15676-1-wak@google.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c2d22c89-83f1-0bb4-7031-730fdf3869c7@windriver.com>
Date: Sat, 19 Oct 2019 21:24:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018234515.15676-1-wak@google.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [meta-oe][PATCH] span-lite: Init at 0.6.0
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
X-List-Received-Date: Sun, 20 Oct 2019 01:24:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/18/19 7:45 PM, William A. Kennington III via Openembedded-devel wrote:
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>   meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb
> 
> diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb b/meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb
> new file mode 100644
> index 000000000..0ea2dcc8d
> --- /dev/null
> +++ b/meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "single-file header-only version of a C++20-like span for C++98, C++11 and later"
> +HOMEPAGE = "https://github.com/martinmoene/span-lite"

Could you add a description for people who are not familiar with
the package?

Copying the "In a nutshell" intro from github:

DESCRIPTION = "span-lite is a single-file header-only library to \
provide a bounds-safe view for sequences of objects. The \
library provides a C++20-like span for use with C++98 and later. \
If available, std::span is used, unless configured otherwise. \
span-lite can detect the presence of byte-lite and if present, \
it provides as_bytes() and as_writeable_bytes() also for C++14 \
and earlier."

would be fine.

Thanks,
../Randy

> +LICENSE = "BSL-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
> +
> +SRC_URI += "git://github.com/martinmoene/span-lite"
> +SRCREV = "34118d2df7976f635c8fd35b5959f86cb52ba93c"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +inherit ptest
> 


-- 
# Randy MacLeod
# Wind River Linux

