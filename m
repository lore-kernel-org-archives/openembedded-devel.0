Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA2417E684
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:12:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6M9C6n9004073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Jul 2019 02:12:06 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 22 Jul 2019 02:12:05 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20190720051418.15137-1-raj.khem@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <eddb2c23-cf07-8a70-d763-1200e8f129d5@windriver.com>
Date: Mon, 22 Jul 2019 17:12:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190720051418.15137-1-raj.khem@gmail.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [meta-oe][PATCH] librelp: Pass Wno-error to compiler
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
X-List-Received-Date: Mon, 22 Jul 2019 09:12:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thanks, it works for me.

// Robert

On 7/20/19 1:14 PM, Khem Raj wrote:
> After autoconf-archive was upgraded to 2019.01.06 it started to add
> extra warning flags via WARN_CFLAGS along with -Werror which means that
> now compiler could be stricter and break the build if any of the new
> warnings are flagged
> 
> The difference is
> 
> old
> 
> WARN_CFLAGS='-fno-strict-aliasing  -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Werror -Wno-suggest-attribute=format -Wunused-parameter -Wmissing-field-initializers'
> 
> new
> 
> WARN_CFLAGS='-fno-strict-aliasing  -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -pedantic -Wunused-parameter -Wmissing-field-initializers -Werror -Wno-suggest-attribute=format -Wunused-parameter -Wmissing-field-initializers'
> 
> Hence we started seing build failure like https://errors.yoctoproject.org/Errors/Details/252684/
> 
> This fix just turns off warnings-as-errors so build can still go on, if
> we need to fix the warnings they still are present in log.do_compile
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> Cc: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
> index 9e57dd520d..16c63a7523 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
> @@ -14,3 +14,5 @@ SRCREV = "e96443dda3c080fa991decec26bc4ac98d24b9a2"
>   S = "${WORKDIR}/git"
>   
>   inherit autotools pkgconfig
> +
> +CPPFLAGS += "-Wno-error"
> 

