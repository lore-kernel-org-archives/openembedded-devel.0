Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D67C747D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 02:18:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3A2ILWk027164
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Apr 2018 19:18:21 -0700
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 9 Apr 2018 19:18:19 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20171002160657.39576-1-raj.khem@gmail.com>
	<20171002160657.39576-5-raj.khem@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <d64e6c1e-1b5b-8747-6aa2-a0ca14f3d133@windriver.com>
Date: Tue, 10 Apr 2018 10:19:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20171002160657.39576-5-raj.khem@gmail.com>
X-Originating-IP: [128.224.162.197]
Subject: Re: [meta-oe][PATCH 5/5] gperftools: Enable on mips
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
X-List-Received-Date: Tue, 10 Apr 2018 02:18:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2017 12:06 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
> index 23284670b..8ce376c91 100644
> --- a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
> +++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
> @@ -18,10 +18,6 @@ inherit autotools
>   
>   S = "${WORKDIR}/git"
>   
> -# On mips, we have the following error.
> -#   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
> -#   Segmentation fault (core dumped)
> -COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
>   # Disable thumb1
>   # {standard input}: Assembler messages:
>   # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'

Hi Khem,

On qemumips, I still get the error.

                root@qemumips:~# LD_PRELOAD=libtcmalloc.so ls /
             [  407.636947] do_page_fault(): sending SIGSEGV to ls for 
invalid read access from 00000008
             [  407.646240] epc = 77e1ae08 in 
libunwind.so.8.0.1[77e18000+c000]
             [  407.651497] ra  = 77e1b3ac in 
libunwind.so.8.0.1[77e18000+c000]
             Segmentation fault (core dumped)

The libc is glibc. I didn't test for musl.

I guess you've tested mips for musl. So how about we add this setting 
back but limit it to glibc?
Something like:
COMPATIBLE_HOST_libc-glibc = 
"(i.86|x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"

Best Regards,
Chen Qi

