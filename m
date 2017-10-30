Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BBD5605BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 23:21:30 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v78so12989465pgb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 16:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TXHHkGs+E153NoI8MnFbXbkIqHWxCrC8vRRtonHnSxo=;
	b=F7xBqitfYMs3+izFd/Cdb6AVAq1JyGceN8f3mNF6w2y8Bn1g7B9CuA4kMk+4jYG6tU
	OYLzjNC4dLDgNkNmuMH05kAnvRYwjtQeldTUtHQGSwtzAYCsn3qLKFcw7eVKD/wW8ZHJ
	VziGXmUly3kdksw7taLiDknXgKvFdC4Niz7EPIbxRPfx+VunNbxLLcNIvbDGOPR0kl7s
	Twtmlc8tbxbpgZxIb+oCU+tM4KSAIPAqrfWw6a+OKcfhvvJZ4r4CtLrWpFxHDN58WYFu
	XPdWo4V2xv84MQS2QwzLVZi/fSZt6VTEgf+XsIeCvSEdnGQ18iGsUFATKtTDpqIv0bxk
	6pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TXHHkGs+E153NoI8MnFbXbkIqHWxCrC8vRRtonHnSxo=;
	b=E7w1tvKRC09xX9oG6I//ctdIHzyeSWntdRWGftiYqWWeEG50ZYiGd0GiuU9vIiiXsy
	7vNIrOc6ge4VQLI+14hqF8LNUANolgrsip/BQVZSAO6CHSptU5D64rUFa599j88ZKxLL
	QPdlqHLwouAPeFCDcrx5MgqClAvNm5me22RCuO4EQdlKFjcfe6Xkuu/SW71P25rZN3ST
	rh7yCU20Wc+gtMtPPYzjV6yeQnK4Ul8pjLiA7NjkxnP41tBdQaAfhXS9hTprR5Sl5C3g
	bLGifLfHMq9Gltm4HrQ6OYpomhX6gMr+yf2Ka51clcHx50TcnXVjUKND1248lJSOvMQs
	vnnw==
X-Gm-Message-State: AMCzsaUuiV3cCHe7s4flUtl3IjMmakgVxioRIX/Bf1FE31ySEnkJxG96
	pqsm+YWXpTmiZIO9/hMWuYuszV3ROZk8uXqpAvA=
X-Google-Smtp-Source: ABhQp+QfyH4QpXoaHeNlBW03/LC1ILthLVVt9QfIS45QGpQk9uXPrmGNSOinKb8d/e+QpXc9CuY1EWeFY8vF5blcBns=
X-Received: by 10.84.184.12 with SMTP id l12mr14510plc.404.1509405692065; Mon,
	30 Oct 2017 16:21:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 30 Oct 2017 16:21:01 -0700 (PDT)
In-Reply-To: <1509387073-21934-3-git-send-email-joe_macdonald@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
	<1509387073-21934-3-git-send-email-joe_macdonald@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Oct 2017 16:21:01 -0700
Message-ID: <CAMKF1sqR75pr0HCO93hmyzRffDPJcDUECvvQLSUih0AUbsh1SA@mail.gmail.com>
To: Joe MacDonald <joe_macdonald@mentor.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/6] lksctp-tools: update and remove from blacklist
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
X-List-Received-Date: Mon, 30 Oct 2017 23:21:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2017 at 11:11 AM, Joe MacDonald
<joe_macdonald@mentor.com> wrote:
> Switching lksctp-tools to build from the upstream git repository rather
> than a source tarball.  At the same time we'll un-blacklist it since it
> appears the gold-as-ld issue has been resolved underneath us, probably
> related to a Debian bug of the same form that was also resolved with a
> binutils update.
>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  .../recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb  | 16 +++++-----=
------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.17.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.=
bb
> index 11c43ff..9166aa5 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
> @@ -8,22 +8,16 @@ LIC_FILES_CHKSUM =3D " \
>      file://COPYING;md5=3D0c56db0143f4f80c369ee3af7425af6e \
>  "
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
> +SRCREV =3D "736b91d340e3f2519714f2930ed63b164d363511"
> +

perhaps we need to reflect it in PV as well.

PV .=3D "+git${SRCPV}"

> +SRC_URI =3D " \
> +    git://github.com/sctp/lksctp-tools.git \
>      file://run-ptest \
>      file://v4test.sh \
>      file://v6test.sh \
>  "
>
> -SRC_URI[md5sum] =3D "68e9b8fa4d4e331029b247b72d46d7a5"
> -SRC_URI[sha256sum] =3D "1aeb204cdb2befc94d9eb3037d1609c9d1d2cd5379d6dd2c=
0a8ca9b10533aa15"
> -
> -#| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc  -march=
=3Darmv5te -marm -mthumb-interwork --sysroot=3D/home/jenkins/oe/world/shr-c=
ore/tmp-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/bindx.o .libs/c=
onnectx.o .libs/peeloff.o .libs/opt_info.o .libs/addrs.o .libs/sendmsg.o .l=
ibs/recvmsg.o    -march=3Darmv5te -marm -mthumb-interwork --sysroot=3D/home=
/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -O2 -Wl,--version-sc=
ript=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnu=
eabi/lksctp-tools/1.0.16-r0/lksctp-tools-1.0.16/src/lib/Versions.map -Wl,-O=
1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname -Wl,libsctp.so.1 -o =
.libs/libsctp.so.1.0.16
> -#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symb=
ol sctp_connectx has undefined version
> -#| collect2: error: ld returned 1 exit status
> -#| make[4]: *** [libsctp.la] Error 1
> -PNBLACKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}=
"
> -
> -S =3D "${WORKDIR}/${BP}"
> +S =3D "${WORKDIR}/git"
>
>  BBCLASSEXTEND =3D "native"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

