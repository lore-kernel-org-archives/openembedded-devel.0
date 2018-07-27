Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 63E5C78D24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 14:18:19 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id a5-v6so5174213qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NRSSaKp4IAMcG0YvvqzQ1m8/3t6cOC0kj8Tm2MtiQ1M=;
	b=iN+Hk8FtiV4diCha+uzgm+du8vdggYN6eGJRMsTjNz+9ea/za0bs1DZStLawTqM0un
	7uvW4D/KDVeikpkNlOIoYYHK8s7bmszoBZvzxqa32FiE8J7LAExes3hptOoB1AhoKVdY
	csqyp0C/EWq6IjCbGs3JoNxY6QiuPV7Vp7OxPbUBFJgSMxvMi9uxNnoUqB1LGqsWet3h
	PSH7c49QcR4xMli07est1Z6xGRb13TWpLd8u0SDiPo/My+US/ekrUOWE3ZFM9BwI0cF8
	UvQTMFyzb2ddyAxk38Pk95a4Ayh2nEFZ/OuHbm1t4SCwJdzZ+5qSlUMrvsWyoL6ytwzs
	xClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NRSSaKp4IAMcG0YvvqzQ1m8/3t6cOC0kj8Tm2MtiQ1M=;
	b=pb2zzSuDSOYJwChCli01qFYjGGbXM2UgTth2ErnTogDwV1SV9E88MURuCLHj6PZzLY
	VRs+bcZzBsNRpPN0uxXUdjAkbZmJ8C+CjWfdS8KGQB3zZsTs85fyHVsQoaeQ+0uGbzcd
	s3BfeAoprehjitKyZqsmp9nsaDRZ14Anx4icuuoC2lwyYhZ1a6d8Rbfn8/bFd7xWG8Xw
	mW2hZ0gw2+SBH46wes/GmYQ4obC10vsimQ0VWuBMYIkChSwhTkkS9Gw4up1qbG0o2lyO
	dfSKFdRg4IkZskx/gsMLBny7sIQHeAjUcyimG06FS2SVzfUFre3MFrmu6+y56oqdenxs
	TiNw==
X-Gm-Message-State: AOUpUlEwXy22B9RGllhqUtMrin8JTZi5TutQhCfYUW6zHSoKjXcktLDC
	fUtuRupOrMo7W/h+MeHKTmmtAoNOus0KKIHpeyg=
X-Google-Smtp-Source: AAOMgpc5/pxgSQpWn5LJEzpj1E+awVvBqWZ41+S2JK236dz0pup/GPRJvX8krNvRbtauBXbOjSINr6Q7Bxb3lEuHInY=
X-Received: by 2002:ac8:91d:: with SMTP id
	t29-v6mr6246252qth.188.1532701100042; 
	Fri, 27 Jul 2018 07:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180724093854.17201-1-mingli.yu@windriver.com>
In-Reply-To: <20180724093854.17201-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Jul 2018 07:17:54 -0700
Message-ID: <CAMKF1so9XxBM8_QdOR73kpME0u8HfLhBZyDaLL_LR_F2WnQhuQ@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] librelp: Upgrade to 1.2.16
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
X-List-Received-Date: Fri, 27 Jul 2018 14:18:19 -0000
Content-Type: text/plain; charset="UTF-8"

fails with security_flags turned on

| ../../git/src/tcp.c:352:57: error: '%s' directive output may be
truncated writing up to 1024 bytes into a region of size 1011
[-Werror=format-truncation=]
|      snprintf((char*)szHname, NI_MAXHOST, "[MALICIOUS:IP=%s]", szIP);
|                                                          ^~    ~~~~
| In file included from
/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/librelp/1.2.16-r0/recipe-sysroot/usr/include/stdio.h:862,
|                  from ../../git/src/tcp.c:38:
| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/librelp/1.2.16-r0/recipe-sysroot/usr/include/bits/stdio2.h:64:10:
note: '__builtin___snprintf_chk' output between 16 and 1040 bytes into
a destination of size 1025
|    return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|         __bos (__s), __fmt, __va_arg_pack ());
|         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| cc1: all warnings being treated as errors
| make[2]: *** [Makefile:536: librelp_la-tcp.lo] Error 1
On Tue, Jul 24, 2018 at 2:39 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add 0001-src-tcp.c-fix-jump-misses-init-error.patch
> to fix -Werror=jump-misses-init error
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...src-tcp.c-fix-jump-misses-init-error.patch | 71 +++++++++++++++++++
>  .../{librelp_1.2.14.bb => librelp_1.2.16.bb}  |  6 +-
>  2 files changed, 75 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
>  rename meta-oe/recipes-extended/rsyslog/{librelp_1.2.14.bb => librelp_1.2.16.bb} (59%)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
> new file mode 100644
> index 000000000..68b686346
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
> @@ -0,0 +1,71 @@
> +From 3e5a0cb440c788e2383e40ab23ac1cf01d96961b Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Tue, 24 Jul 2018 01:30:25 -0700
> +Subject: [PATCH] src/tcp.c: fix jump-misses-init error
> +
> +Fix below jump-misses-init error
> +
> +| In file included from ../../git/src/tcp.c:51:
> +| ../../git/src/tcp.c: In function 'relpTcpConnect':
> +| ../../git/src/relp.h:220:3: error: jump skips variable initialization [-Werror=jump-misses-init]
> +|    goto finalize_it;  \
> +|    ^~~~
> +| ../../git/src/tcp.c:1951:3: note: in expansion of macro 'ABORT_FINALIZE'
> +|    ABORT_FINALIZE(RELP_RET_IO_ERR);
> +|    ^~~~~~~~~~~~~~
> +| ../../git/src/tcp.c:2005:1: note: label 'finalize_it' defined here
> +|  finalize_it:
> +|  ^~~~~~~~~~~
> +| ../../git/src/tcp.c:1991:6: note: 'r' declared here
> +|   int r = getsockopt(pThis->sock, SOL_SOCKET, SO_ERROR, &so_error, &len);
> +|       ^
> +| In file included from ../../git/src/tcp.c:51:
> +| ../../git/src/relp.h:220:3: error: jump skips variable initialization [-Werror=jump-misses-init]
> +|    goto finalize_it;  \
> +|    ^~~~
> +| ../../git/src/tcp.c:1951:3: note: in expansion of macro 'ABORT_FINALIZE'
> +|    ABORT_FINALIZE(RELP_RET_IO_ERR);
> +|    ^~~~~~~~~~~~~~
> +| ../../git/src/tcp.c:2005:1: note: label 'finalize_it' defined here
> +|  finalize_it:
> +|  ^~~~~~~~~~~
> +| ../../git/src/tcp.c:1989:12: note: 'len' declared here
> +|   socklen_t len = sizeof so_error;
> +|             ^~~
> +
> +Upstream-Status: Submitted[https://github.com/rsyslog/librelp/pull/117]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + src/tcp.c | 7 ++++---
> + 1 file changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/tcp.c b/src/tcp.c
> +index f35eb84..fb34dc7 100644
> +--- a/src/tcp.c
> ++++ b/src/tcp.c
> +@@ -1936,6 +1936,9 @@ relpTcpConnect(relpTcp_t *const pThis,
> +       struct addrinfo hints;
> +       struct addrinfo *reslocal = NULL;
> +       struct pollfd pfd;
> ++      int so_error;
> ++      socklen_t len = sizeof so_error;
> ++      int r;
> +
> +       ENTER_RELPFUNC;
> +       RELPOBJ_assert(pThis, Tcp);
> +@@ -1985,10 +1988,8 @@ relpTcpConnect(relpTcp_t *const pThis,
> +               ABORT_FINALIZE(RELP_RET_TIMED_OUT);
> +       }
> +
> +-      int so_error;
> +-      socklen_t len = sizeof so_error;
> +
> +-      int r = getsockopt(pThis->sock, SOL_SOCKET, SO_ERROR, &so_error, &len);
> ++      r = getsockopt(pThis->sock, SOL_SOCKET, SO_ERROR, &so_error, &len);
> +       if (r == -1 || so_error != 0) {
> +               pThis->pEngine->dbgprint("socket has an error %d\n", so_error);
> +               ABORT_FINALIZE(RELP_RET_IO_ERR);
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
> similarity index 59%
> rename from meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb
> rename to meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
> index 28047eb54..6c68f6040 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
> @@ -6,9 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
>
>  DEPENDS = "gmp nettle libidn zlib gnutls"
>
> -SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https"
> +SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https \
> +           file://0001-src-tcp.c-fix-jump-misses-init-error.patch \
> +"
>
> -SRCREV = "fc512e337bfc7c92770246dbff5f482b879498b9"
> +SRCREV = "5e849ff060be0c7dce972e194c54fdacfee0adc2"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

