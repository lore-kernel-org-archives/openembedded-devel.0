Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 94140746B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 16:57:27 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id y89-v6so3233537qtd.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 09:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9QURzxA/kPpIY1fUCmSosIMbhY1gYTpAuPQnEqjD4sE=;
	b=uWUqRkm8sp7JT9r0DQ4yhJBsfwT/RbctH6FWLq2Q+GbGGHRqCYLA1DuGaja+sxn10P
	/6/889KH75vtKXNPgxWlvDvTOqeZlw9j3cq9XnNOfAOWCSn6zfj1gRERE4C38FOpLCnj
	V/CV/D+NYFSZfMRAyXsh4YewoMuw8GPuEBH6fFKwjnKF28T2X9izfY1JaCmy70P29qS5
	1YMUAgmCFGFG9AbhR1AD6z7I1Ijh/KeLnzM31J+TqDzwbI+C6ZiJAqLLbQNdclcrOjKK
	2qFA/pAaVsMGJrE2TRkm3XFJpIGvQqCRwLuiH8N9Nnrg0B8d4R0DKaC60JqfHxszQwRO
	McOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9QURzxA/kPpIY1fUCmSosIMbhY1gYTpAuPQnEqjD4sE=;
	b=DNiuPEQ0sz7A7qYzJY92NcOGH819WWjyb+55FuNumdzDm+MttOkaLUivqpaG5emVD/
	ZE7Wq+2aCsAQfntVMMG0lHP+8FnilAg09rboUJywpsTj/miP/iEPMV8xmZJnKAg644Y8
	RJC6s2Env31eJdm73SLQRRrLCIKGapJOPYTIRyHhcsmDYU/+BB8kkNB5Ghz+cjb5phNC
	NGfRjSdj5LWL1ZwMqHDHwn50Xe36zo7dZ0eY6HbG6uu6jjhnjhXVvcXh1AzB+53WDOi8
	e/j680Eokbzb6YJ0Ch8CWHnaP6V9XFroHnihbJ74L+I+DkQmhEiMcHGY+2MIRWzpDS5i
	VoCA==
X-Gm-Message-State: APt69E2b/NiRlUxkB1xXUibOXRPEu4XsIdmi80tgvf2LY7a4OqhbOykS
	UtpIRglz1n+lh+7rET1dQSi24DbDfgI1PPMjbmK6ow==
X-Google-Smtp-Source: ADUXVKK7DKtLfOsILhGkpCkIObDnoPlVcb8OG8NkuQJf9GKrYnWz0uFUONVq9Lh3XAt8ONIq0n9/fYzBQZ6FN8SwpT4=
X-Received: by 2002:ac8:26ea:: with SMTP id
	39-v6mr7751720qtp.128.1527785848127; 
	Thu, 31 May 2018 09:57:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Thu, 31 May 2018 09:56:57
	-0700 (PDT)
In-Reply-To: <20180524182659.19986-10-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
	<20180524182659.19986-10-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2018 09:56:57 -0700
Message-ID: <CAMKF1soPo0SPtmh3MLLeDrxoB5E2YtRf=siNDcsmtOFe0ok4rA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master-next][PATCH 09/11] json-spirit: variable cleanup
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
X-List-Received-Date: Thu, 31 May 2018 16:57:27 -0000
Content-Type: text/plain; charset="UTF-8"

I know this is unrelated however I see a gcc crash on mips

| /mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/json-spirit/4.08-r0/recipe-sysroot-native/usr/bin/mips-bec-linux/mips-bec-linux-g++
  -I/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/json-spirit/4.08-r0/json_spirit_v4.08/json_spirit
-I/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/json-spirit/4.08-r0/recipe-sysroot/usr/include
-meb -mabi=32 -mhard-float -march=mips32r2 -fstack-protector-strong
-D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
 --sysroot=/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/json-spirit/4.08-r0/recipe-sysroot
 -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/json-spirit/4.08-r0=/usr/src/debug/json-spirit/4.08-r0
-fdebug-prefix-map=/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/json-spirit/4.08-r0/recipe-sysroot=
-fdebug-prefix-map=/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/json-spirit/4.08-r0/recipe-sysroot-native=
 -fvisibility-inlines-hidden  -meb -mabi=32 -mhard-float
-march=mips32r2 -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/json-spirit/4.08-r0/recipe-sysroot
-MD -MT json_spirit/CMakeFiles/json_spirit_static.dir/json_spirit_reader.cpp.o
-MF json_spirit/CMakeFiles/json_spirit_static.dir/json_spirit_reader.cpp.o.d
-o json_spirit/CMakeFiles/json_spirit_static.dir/json_spirit_reader.cpp.o
-c /mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/json-spirit/4.08-r0/json_spirit_v4.08/json_spirit/json_spirit_reader.cpp
| {standard input}: Assembler messages:
| {standard input}:732931: Warning: end of file not at end of a line;
newline inserted
| mips-bec-linux-g++: internal compiler error: Killed (program cc1plus)
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <https://gcc.gnu.org/bugs/> for instructions.

I wonder if someone else is seeing similar issue ?
it might be related to system load etc. at the time it was being built but
interested in seeing if this is common enough trouble


On Thu, May 24, 2018 at 11:26 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> Reorder recipe variables according to:
>
>         https://www.openembedded.org/wiki/Styleguide
>
> Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> index 3c1d8a9959..d6e42c81d5 100644
> --- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> +++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> @@ -9,6 +9,8 @@ PRIORITY = "optional"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=278ef6183dec4aae1524fccc4b0113c9"
>
> +DEPENDS = "boost"
> +
>  SRC_URI = "file://json_spirit_v${PV}.zip \
>             file://0001-Adjust-the-cmake-files.patch \
>             file://0001-Link-to-libatomic.patch \
> @@ -16,8 +18,6 @@ SRC_URI = "file://json_spirit_v${PV}.zip \
>
>  S = "${WORKDIR}/json_spirit_v${PV}"
>
> -DEPENDS = "boost"
> -
>  inherit cmake
>
>  BBCLASSEXTEND = "nativesdk"
> --
> 2.17.0.582.gccdcbd54c
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

