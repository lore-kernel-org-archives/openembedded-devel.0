Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFEED2A527
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 15:19:27 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.25592.1729091958095802271
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 08:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C8qLU5Wp;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so45063901fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729091956; x=1729696756; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpZNiHRZRji9K9aA70Oe7pJAYSyfxuu2ES8rfobbFGc=;
        b=C8qLU5WpbihXRrgeIBbe2HFpr2CaVzlkR1hwlDMESr3X8YZbs+tyXbr+bUZbprq6tS
         gqeidWEHZHywXknCxjZemOxyk3doKqBHFSFGffLlqo7Sm9ylYitzHuaNEnXRPn5qmPaV
         C71ltlq5KGF4aa2uxYxZxU76DyrS8jX+5AJLeMklknpIubxkFqfQvfO0dxIPQjwJtN5a
         SkMEXzBLOCuljZOq5s7Z80uigq+glNbNCocMH+OHvzhXA/SpcNuxcwbm02/enSZBn/Rr
         K7Fr8txZOSXzgHfQI+HxkKAXFotGqyvww6UgMCp2IxB7nWHr76thA3qlciZnY+YABZuc
         KR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729091956; x=1729696756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpZNiHRZRji9K9aA70Oe7pJAYSyfxuu2ES8rfobbFGc=;
        b=Poq6XwcwETx6PFdqCsIwerMk9BnrMEvmfQtMAhFOQB8gH4cx2Wimm5SrVGcsOcp4Vq
         UtFe8RVLmf9hgKsDoMDac6QOAZhFC3OLFpr9enuG3Avaa8Fupc8LRTaBWcyySJdTgg0O
         4n/p7owjp7kktSkho3lhpdIo21Ck0dEpgfLtfm8FuuqvHwnHx+nMgeuD81KUb+KZzmV+
         Xie2TOLneFa+sQFt66aUrjxBBxwWx+Cx+5erk6iKTokff9AGfTlwiKohuqJXzkjhHi9x
         WGw1eH+yf/r8+VZDfJ4IojMNs6riO2KJDTz7EpRn1EPUF3Traww9e2FVJFOyE/WiP3MH
         E2/Q==
X-Gm-Message-State: AOJu0YwYDFL76ngT0gmtZUdr+Nyx32y6bGXnD2KQtYeCYbTImyG7IstT
	10gZ6kj4VKVCJNp5MPmDU7Aexl6LEmSzz1wrbXAKQBRIlyUo6ZXzlsMAqlohTduS/DPEmBjG3Dz
	laSwvmRB5KcaD/mKBwuyGT0cHOsA=
X-Google-Smtp-Source: AGHT+IF2MzxKDggQRFc94gzsAoEIMtW76eWRUlU/xb9ZfdvPPci+U1xR+byKtvtymXtwnUBdYfLMWIfdzsDgjDSyoqI=
X-Received: by 2002:a05:6512:31c5:b0:539:ec87:bc7f with SMTP id
 2adb3069b0e04-539ec87be63mr6503708e87.19.1729091955761; Wed, 16 Oct 2024
 08:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241008075235.349939-1-kai.kang@windriver.com>
In-Reply-To: <20241008075235.349939-1-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Oct 2024 17:19:03 +0200
Message-ID: <CA+chaQeshT35SaqOVfZhpA5qkaj3Hi3rGroFmBbwcJ9zP4nXQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: 1.59.01 -> 1.60.03
To: kai.kang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 15:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112939

This seems to cause random build failure in some builds:

rm -f libxmlrpc_util.so.4
rm -f libxmlrpc_util.so.4
ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
rm -f libxmlrpc_util.so
ln: failed to create symbolic link 'libxmlrpc_util.so.4': File exists

On Tue, Oct 8, 2024 at 9:52=E2=80=AFAM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update xmlrpc-c from 1.59.01 to latest stable version 1.60.03. The
> SRCREV is one more fix commit after release 1.60.03 in the stable
> series. And remove 0002-fix-formatting-issues.patch which has been fixed
> in upstream.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../xmlrpc-c/0002-fix-formatting-issues.patch | 34 -------------------
>  ...mlrpc-c_1.59.01.bb =3D> xmlrpc-c_1.60.03.bb} |  5 ++-
>  2 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-f=
ormatting-issues.patch
>  rename meta-oe/recipes-devtools/xmlrpc-c/{xmlrpc-c_1.59.01.bb =3D> xmlrp=
c-c_1.60.03.bb} (92%)
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-formatti=
ng-issues.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-forma=
tting-issues.patch
> deleted file mode 100644
> index 9d92e4712..000000000
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-formatting-issu=
es.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 14f15cb0f03defa8efb4c8e2fece58e50655be6b Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Sun, 23 Jul 2017 22:20:29 -0400
> -Subject: [PATCH] src/xmlrpc_server_abyss.c: fix formatting issues
> -
> -Fixed when compile with "-Wformat -Wformat-security -Werror=3Dformat-sec=
urity":
> -|src/xmlrpc_server_abyss.c:771:13: error: format not a string literal
> -and no format arguments [-Werror=3Dformat-security]
> -|             xmlrpc_faultf(envP, error);
> -|             ^~~~~~~~~~~~~
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - src/xmlrpc_server_abyss.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/xmlrpc_server_abyss.c b/src/xmlrpc_server_abyss.c
> -index 2388652..3843f10 100644
> ---- a/src/xmlrpc_server_abyss.c
> -+++ b/src/xmlrpc_server_abyss.c
> -@@ -768,7 +768,7 @@ createServer(xmlrpc_env *                      const=
 envP,
> -         ServerInit2(abyssServerP, &error);
> -
> -         if (error) {
> --            xmlrpc_faultf(envP, error);
> -+            xmlrpc_faultf(envP, "%s", error);
> -             xmlrpc_strfree(error);
> -         }
> -     }
> ---
> -2.8.1
> -
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb b/meta=
-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> similarity index 92%
> rename from meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
> rename to meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> index 5d5152b83..a34256c27 100644
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> @@ -7,10 +7,9 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Daefbf81ba=
0750f02176b6f86752ea951"
>
>  SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branch=3Dmaster;protoc=
ol=3Dhttps \
>             file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.p=
atch \
> -           file://0002-fix-formatting-issues.patch \
>             "
> -#Release 1.59.01
> -SRCREV =3D "352aeaa9ae49e90e55187cbda839f2113df06278"
> +# one more commit after Release 1.60.03 in the Stable series
> +SRCREV =3D "a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e"
>
>  S =3D "${WORKDIR}/git/stable"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112706): https://lists.openembedded.org/g/openembedde=
d-devel/message/112706
> Mute This Topic: https://lists.openembedded.org/mt/108885171/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

