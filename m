Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id B9C436D284
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 01:43:23 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id as1so12917913iec.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 18:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Tsf8y6NdMwNc3o/n06WRCS+ZGk6/sgqurTK+XI0Hx7o=;
	b=vDmUGxTQ+jwz83vy+hdboUAtn7NuL8wm1VBKJq6AsSm4quELSkaT4I2kKoZJgeNl+J
	j8MX/e1Lu+Yj3VXqvVkPb/RqoomvlYX22wL3FXTrBzC7teeDj96sVki26aN7C1FePqxy
	A1KVTCx887IV2o0TOwC1kBoJpw57zC2Oq9nDlGsYVSbGqvo5hfY/v5FIZS1WLH5bjxqz
	5yG0X47LwDcJIjAw5dtWMqspI0q4Ht6KxagruQN9aFlXWiBjRItUmUkGDeO45vADFp9A
	+PHvdJhHiny0S6VwSo2zMBDoEpVqIj7koIKIlGFB7fl+RB60DooVDeZyVuwgLYdZIuls
	brkw==
X-Received: by 10.50.23.103 with SMTP id l7mr10699411igf.3.1383011005252; Mon,
	28 Oct 2013 18:43:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Mon, 28 Oct 2013 18:42:55 -0700 (PDT)
In-Reply-To: <1382105347-27538-1-git-send-email-anders.roxell@linaro.org>
References: <1382105347-27538-1-git-send-email-anders.roxell@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2013 18:42:55 -0700
Message-ID: <CAMKF1sp9WfTh6qdmNc9noCq24cf=R52OOdvtqEjZU7h10Vun-A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: linaro-networking@linaro.org, "patches@linaro.org" <patches@linaro.org>
Subject: Re: [PATCH] libhugetlbfs: add support for armv7a
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
X-List-Received-Date: Tue, 29 Oct 2013 01:43:25 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 18, 2013 at 7:09 AM, Anders Roxell <anders.roxell@linaro.org> wrote:
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 24480c3..4f1bfa4 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -20,10 +20,16 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
>
>  S = "${WORKDIR}/git"
>
> -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
> +COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
>
> +python __anonymous() {
> +    if base_contains('TARGET_ARCH', 'arm', True, False, d):
> +        d.setVar('ARCH', 'armv7l')
> +    else:
> +        d.setVar('ARCH', d.getVar('TARGET_ARCH'))
> +}

instead of this fugly anon python you could do

ARCH_arm = "armv7l"
ARCH ?=  "${TARGET_ARCH}"

and btw. we support ARM v4,v5,v6 architectures as well. It seems your
patch only cares about armv7,
and if this recipe only works for armv7+ then dont open the floodgates
for all kind of arm architectures.

>
> -EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
> +EXTRA_OEMAKE = "'ARCH=${ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
>  CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
>
>  TARGET_CC_ARCH += "${LDFLAGS}"
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

