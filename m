Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D699780AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:26:59 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k20so2301992wre.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 04:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=auumTXsNqCNvhi1XVzEuw+8HZmdRlc97UyhBx4/tUyA=;
	b=KfQXAFxA0urEuh6LM0qV9sQE4GyCQp5pzlZT4nWE88AeubcnyxmWUNwBuSKXH5p1bi
	YGrtbU9vUHkQsASB4TIjDvKoYXi3RfuuZSyORhh/xhg8rtbrxBp6g76tG//tUM+yQRH1
	EXavLeOK9bwB8MQN1MtkDPWO82KIrCfAjuV9c0hfsmRtEmoqFabF2rck+wY9wSb4ZsGb
	yeu5n2s86iJ5U1USZn/ELdC3ivN0AWEZOrR3WlFwsTxAWyHkB7ECn1FlnelZuuQCDG2x
	mpeiKSqDo+57oJ6KfFUpHP0LhguZiuUy1ICuMY65VIQ4lzsPwD0i4LnkV6/IldLT7eWi
	3JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=auumTXsNqCNvhi1XVzEuw+8HZmdRlc97UyhBx4/tUyA=;
	b=JpWA2wq6grJYq/lB0pkKwdkvM37X6R3f1S/2JyqBN8UJ/gabLUO8ETADDhn4iO84MC
	uumWL4G9Gire9rWI+DOYfise3/zhO+w9VaIDacAR1B4syCRwaKEq2r36X168Fo8qjk+Q
	Ijr99f9arT1ndCcWqeUUb821u/Fr3SqfU80ull4upx0Q7vpzi1FRLXbaHsyni8aOGu+M
	HAVXM+xYAwdtQ8yH0NIj7gMyRTPFp/lQwZoNNCpbizdT37k3JRISret35GyvDuILwg66
	n6dwWRAiya23irb3nLN76g+3emDll+AIxkMhwXxUv3hXFLCuPt+4gsUfb4pGz+v9+r/Z
	zJ5A==
X-Gm-Message-State: AHPjjUhBkqBx5BClkYETxxwpDShC7XDvZ6ih2uXDUVk7btIfzJDjnMPE
	t9ZbbkKiO5vwV+hGf/TgungZ3+y+gRpx2Azwhmbsvw==
X-Google-Smtp-Source: AOwi7QCp2Y04gElZjG9c7wKvOCBnxm2LDF2PR1qNMar6js3lbBgEvzb6uDxCiOK7DYD95g8FvzTFhYTQxShaUWTCgJY=
X-Received: by 10.46.92.71 with SMTP id q68mr4375418ljb.88.1506425220184; Tue,
	26 Sep 2017 04:27:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.83.83 with HTTP; Tue, 26 Sep 2017 04:26:39 -0700 (PDT)
In-Reply-To: <20170907092446.18244-1-ricardo.ribalda@gmail.com>
References: <20170907092446.18244-1-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 26 Sep 2017 13:26:39 +0200
Message-ID: <CAPybu_0BnpRC7h287BsuKeOOW_A2OPGU5jCzVzfTs+5OHKEQeQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8-common: Fix warning evaluating CFLAGS
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
X-List-Received-Date: Tue, 26 Sep 2017 11:27:00 -0000
Content-Type: text/plain; charset="UTF-8"

Ping?

On Thu, Sep 7, 2017 at 11:24 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Code is (on my opinion) simpler, making use of the dumpversion flag, instead of calling the pre-processor via a pipe.
>
> Flag has been tested on both clang gcc:
>
> ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-4.8 -dumpversion
> 4.8
> ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-4.9 -dumpversion
> 4.9.3
> ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-5 -dumpversion
> 5.4.1
> ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-6 -dumpversion
> 6.4.0
> ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ gcc-7 -dumpversion
> 7
> ricardo@neopili:~/curro/qt5022/build-qt5022-pyro/repo/java$ clang-4.0 -dumpversion
> 4.2.1
>
> Without this patch:
>
>  WARNING:
>  /home/ricardo/curro/qt5022/build-qt5022-pyro/repo/yocto/../java/recipes-core/openjdk/openjdk-8-native_102b14.bb:
>  Unable to export ${CXXFLAGS}: Failure expanding variable CXXFLAGS,
>  expression was
>  -isystem/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/openjdk-8-native/102b14-r0/recipe-sysroot-native/usr/include
>  -O2 -pipe -D_GLIBCXX_USE_CXX11_ABI=0 ${@version_specific_cflags(d)}
>  ${@jdk_cpp_options(d)} which triggered exception IndexError: string
>  index out of range
>  WARNING:
>  /home/ricardo/curro/qt5022/build-qt5022-pyro/repo/yocto/../java/recipes-core/openjdk/openjdk-8-native_102b14.bb:
>  Unable to export ${CFLAGS}: Failure expanding variable CFLAGS,
>  expression was
>  -isystem/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/openjdk-8-native/102b14-r0/recipe-sysroot-native/usr/include
>  -O2 -pipe -Wno-error=deprecated-declarations
>  ${@version_specific_cflags(d)} ${@jdk_cpp_options(d)} which triggered
>  exception IndexError: string index out of range
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index 0c5c2c3e3d2f..83828e156fb6 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -238,13 +238,9 @@ def version_specific_cflags(d):
>      if bb.data.inherits_class('native', d):
>          from subprocess import Popen, PIPE
>
> -        cmd = d.expand('${CPP} -P -').split()
> -        cc = Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=PIPE)
> -        # This check is GCC specific. Clang always returns 4. For Clang
> -        # __clang_major__ and __clang_minor__ need to be checked. Ideally
> -        # __GNUC_MINOR__ would be checked as well, but for this recipe
> -        # GCC major is all we care about.
> -        version = cc.communicate(b'__GNUC__')[0].decode('utf-8')[0]
> +        cmd = d.expand('${CC} -dumpversion').split()
> +        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
> +        version = cc.communicate()[0].decode('utf-8')[0]
>      else:
>          # in the cross case, trust that GCCVERSION is correct. This won't
>          # work if the native toolchain is Clang, but as of this writing that
> --
> 2.14.1
>



-- 
Ricardo Ribalda

