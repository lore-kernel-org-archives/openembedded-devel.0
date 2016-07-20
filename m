Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id DFA7A606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 16:04:42 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x130so4584692vkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pz2yQq5I3s6aVbYEw23TevXCtTNHxq5MUmUhaBYCuQ4=;
	b=BiRVEVijjm+J6m5wsu/E1tJCN//dxKbxVbh107tLYw71fBwRGUsEEDhLJIm/1Ye528
	380P9iZ7KkaOVUC9RUqsQRQOeYyrLv+DKR8hgws9kSB5JZMtK7s2vcCrCMY+zGZhOE9+
	WgR7U8iWhppVzb53CrY9hTE4szu/SbslrMkRlzuuh/CQbOwkRsCGpGgHmOpLd9GEUqgC
	EQ2+zpefuM2UpIdat10z3sf+HIUHM4fkJPIDtT+8au2mMzyRXqR09MiLnKuWnA2fqpgU
	bZzo+VTKYaavILesrwUvO6hCMFWTIn8ZFsnXuRj9bUSMruRY8I1r9QQLQtY/os17zcyz
	7qDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pz2yQq5I3s6aVbYEw23TevXCtTNHxq5MUmUhaBYCuQ4=;
	b=a4WifpgwC+2R3gKBqCcB/D6RIHZYWggH6xGyb4jQarrNNQ4hpsMUwoxcQres9+6Z8D
	tYKKYUwZMdwnqOjQQiz5A88r+41TdQFmBHCMaBUxHcKp4BY/zgaeb6ZrImzoUbZWEvRq
	tuIEAHxNedNQO+/JH+G7znreNWPVZ8p8J2Sz4L6yVSQ4gElNXDFD5n0sWglSBi3wKdW4
	VJb8jC7oHwdQ7QkTaa1sCKB4/NdhuldevvDQaafrSJxaSqcHoAdQ+uZqpeWLDPii+BYa
	6URuXJWbeiOQoWCez+YZm+8NG4wuXQBdm/z7qxJ7Btg7q0QrMwVYLJFhDkWpdX9ZEYjr
	U1ng==
X-Gm-Message-State: ALyK8tJBP7uVz8gJrJWpl6TjNhOMrxLVF/qqAJBnlPoSDaVm0qjahjxSngMXHdwAfplXRipx17Kj5gs5BB22sg==
X-Received: by 10.31.107.29 with SMTP id g29mr24143035vkc.56.1469030682876;
	Wed, 20 Jul 2016 09:04:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.51.77 with HTTP; Wed, 20 Jul 2016 09:04:42 -0700 (PDT)
In-Reply-To: <1469008088-11976-1-git-send-email-patrick.ohly@intel.com>
References: <loom.20160719T113248-200@post.gmane.org>
	<1469008088-11976-1-git-send-email-patrick.ohly@intel.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 20 Jul 2016 10:04:42 -0600
Message-ID: <CACS+7ZRpCKTox_5wEWo_R0kvANKwm8jDOST4vvzNxkemRVgAag@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Patrick Ohly <patrick.ohly@intel.com>
Subject: Re: [meta-java][PATCH] openjdk-8: fix compiler detection
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
X-List-Received-Date: Wed, 20 Jul 2016 16:04:43 -0000
Content-Type: text/plain; charset=UTF-8

On 20 July 2016 at 03:48, Patrick Ohly <patrick.ohly@intel.com> wrote:
> When GCC is at version 4 or 5, parsing the recipe fails with:
>
> ERROR: ExpansionError during parsing
> .../ostro-os/meta-java/recipes-core/openjdk/openjdk-8_72b05.bb
> ...
> bb.data_smart.ExpansionError: Failure expanding variable CFLAGS,
> expression was  -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=.../ostro-os/build/tmp-glibc/work/corei7-64-ostro-
> linux/openjdk-8/72b05-r0=/usr/src/debug/openjdk-8/72b05-r0
> -fdebug-prefix-map=.../ostro-os/build/tmp-glibc/sysroots/x86_64-linux=
> -fdebug-prefix-map=.../ostro-os/build/tmp-glibc/sysroots/intel-corei7-64=
>  -fstack-protector-strong -D_FORTIFY_SOURCE=2
> ${ <at> version_specific_cflags(d)} -Wno-error=deprecated-declarations which
> triggered exception TypeError: can only join an iterable
>
> That's because FLAGS_GCC<version> may be unset, thus leading to
> d.getVar() returning None and ''.join(extraflags) failing.
>
> The join() is also redundant: extraflags already is a string. It
> happened to work because Python treats a string as sequence of
> single-character strings, and thus ''.join() re-created the original
> string.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index 089f907..7ad802a 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -271,10 +271,8 @@ def version_specific_cflags(d):
>          # doesn't work anyway.
>          version = d.getVar('GCCVERSION', expand=True)[0]
>
> -    if int(version) >= 4:
> -        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True)
> -
> -    return ''.join(extraflags)
> +    extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
> +    return extraflags
>
>  CFLAGS_append = " ${@version_specific_cflags(d)}"
>  CXXFLAGS_append = " ${@version_specific_cflags(d)}"
> --
> 2.1.4

This looks good to me. I have a patch up that does substantially
similar, but this one beat me to it. It's also better python.

I'm still going to check out icedtea 3's OpenJDK. Their build system
does this automatically, but going from the past cross-compiling it
may be an issue.

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

