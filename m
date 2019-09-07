Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 065E87F357
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 00:12:25 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d3so3973452plr.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 17:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=f4nQXAkctXW6NfhC2fM4QmJW35aa7cKLXToVDLkegzo=;
	b=dpOLomzA2RbkXP1tFCXXa6GaG7CwzMbsF+xuL8OlMuE3g6ebzjuYktiKJc5WBdrfs1
	OIoAPatHjGAu83bXU0s+sF6FZ3FLpY7pgEpyolWnttCbw5rCYzKZoC40vpRbpnNthdKc
	8PJZ/U21A9JobxXqq/4udxSvWdUfIgEL1ZlWMhGPMgkgmkO3Nf8LZFzIekzTjFDw/Guv
	TcGiToCFDJznRHwuppPm8oerV+NCEuGpetGIrU+E9gT6xmTvU0PHgwH7KIl+x3yJqA67
	L1+B28hpIpqUZVU5j51MmLSdA7uXtRz79UjXdsXZSIhBWseSxuGTk+eas9z9FLSW2mjV
	Mlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=f4nQXAkctXW6NfhC2fM4QmJW35aa7cKLXToVDLkegzo=;
	b=LxuTl7LWdpU8Ut0KNFG0bGR2cEK0Qs1hq+KfpxwseJm+9Fu0slonJsv8d37lfcflF/
	7PNw9aI206sptMVATjhousGA+FmJ70W93kgQugyNdO/LXn95oouPCSEECVCfCNNRlCu6
	k4/etUyoO4hEIN5Cq/I6WWssx1sjfGvAmWOfYTFxfgOFKQUVJ+FqLyUOxacrSxbhlv7X
	E6Sv8C8YXxzs6gfPYVWiXkXtOq+ZQFsm0vp/Sq/A/A+7gdY3cDhkn2uPhS7Tsdvw2i3h
	AyzaDMnByzrPpmcceFz0lv6kjQbCMuypuQQUopp4gICMF/TqPOf2y3WZlQ0i8iKxLuoX
	Luwg==
X-Gm-Message-State: APjAAAVbYGdQhIZ0Au3PuFE1Bi7t2emr8leOPS1Or/rDMs3fkjMn/Hus
	qPT/BqAuBEiJig8/mQpY3ZVjWL5V
X-Google-Smtp-Source: APXvYqxM0aNcwdZ0LiSjROh9tBhvwW29NggNmXu6kymqcI4oRFp6lBASWPnGtRrUIkYqN0yv5tLnuQ==
X-Received: by 2002:a17:902:7147:: with SMTP id
	u7mr12022057plm.260.1567815146822; 
	Fri, 06 Sep 2019 17:12:26 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1428:d184:917c:1fd5?
	([2601:202:4180:c33:1428:d184:917c:1fd5])
	by smtp.gmail.com with ESMTPSA id
	q204sm9971858pfc.11.2019.09.06.17.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Sep 2019 17:12:26 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20190906212513.16415-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c74a44cc-b085-e526-eabb-bb56441a5362@gmail.com>
Date: Fri, 6 Sep 2019 17:12:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906212513.16415-1-raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH] ltrace: Fix build on mips
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
X-List-Received-Date: Sat, 07 Sep 2019 00:12:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/6/19 2:25 PM, Khem Raj wrote:
> Newer kernel UAPI headers for mips have moved these needed defines
> around
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

warrior too?
> ---
>  .../ltrace/ltrace/include_unistd_nr.patch     | 30 +++++++++++++++++++
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
>
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch b/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
> new file mode 100644
> index 0000000000..e4490bbb9e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
> @@ -0,0 +1,30 @@
> +kernel headers have restructured mips syscall generation in kernel
> +in recent versions, however, ltrace still has logic to define the
> +syscall numbers based on old logic, this patch includes the legacy
> +UAPI headers to get these defines
> +
> +Fixes errors e.g.
> +../../../../git/sysdeps/linux-gnu/mips/trace.c:138:29: error: '__NR_O32_Linux' undeclared (first use in this function)
> +  const int syscallbase[] = {__NR_O32_Linux, __NR_N32_Linux,
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/sysdeps/linux-gnu/mips/trace.c
> ++++ b/sysdeps/linux-gnu/mips/trace.c
> +@@ -34,6 +34,16 @@
> + #include <assert.h>
> + #include <asm/unistd.h>
> + 
> ++#ifndef __NR_O32_Linux
> ++#include <asm/unistd_nr_o32.h>
> ++#endif
> ++#ifndef __NR_N32_Linux
> ++#include <asm/unistd_nr_n64.h>
> ++#endif
> ++#ifndef __NR_N64_Linux
> ++#include <asm/unistd_nr_n32.h>
> ++#endif
> ++
> + #include "backend.h"
> + #include "common.h"
> + #include "debug.h"
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> index 3dc269c80e..ead637cb7e 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -27,6 +27,7 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http
>             file://0001-mips-plt.c-Delete-include-error.h.patch \
>             file://0001-move-fprintf-into-same-block-where-modname-and-symna.patch \
>             file://0001-hook-Do-not-append-int-to-std-string.patch \
> +           file://include_unistd_nr.patch \
>             "
>  S = "${WORKDIR}/git"
>  


