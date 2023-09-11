Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0955EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 09:50:59 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.54808.1694425857660277900
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Sep 2023 02:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=l63C+VK8;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: samuli.piippo@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-44e3a4d0a6fso1627481137.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694425856; x=1695030656; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+YdGT/FMBIXtDI+e+BHTgTDrsxHatN6xyeUeRz1YxuY=;
        b=l63C+VK8Pw+HiNOAuSSxUf3K3UeTYSul3zBa/tcloI4Rr4Uqu01/eX3TYbIsrn0UqC
         bJYzNvKotCDXaoFgQvxc3Wtu9NNTtXGcCyP+bUK87IDrGFC+Z59zk654NHOtw116DV+3
         DEQSk9RcEnv68I2BDN4u98aMZCWfFmFACLTbGhPZaIvN0jEI1VaVN+0G8Ky7gfpoEzY7
         BLNTPHKqvZrICjHcIVSCR5WhdWM6t4yfhheV+mkoVfJT9IbpsvUfIPFZ3PTI+FOCPHWy
         qrOE0u7/pxSax+xsgocbZFPDLMBAponAZWrZfrFoYoA8ItFXjA/dLDG/hPHclb7/7Jcl
         XUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425856; x=1695030656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YdGT/FMBIXtDI+e+BHTgTDrsxHatN6xyeUeRz1YxuY=;
        b=AfxgpzOefE7jb3RDyEar7dAgiYHaaqfgHHvxxOvulCOHk0FHU+6LtWmWzK6+B8egkd
         AD/LlKWsAuEiwXADm8RIYuvLRRQLm9E04Jzc6rJ7KyugV/oWVnLspjf12rtwTy0TE+yT
         XEL6F7WEu0PmAM/9W7UgkaniYE6HybMnpjiKAA6yAr2HYI2WlnUdcgN9P0g2xYoUOGBd
         XNAG9x1iK76hKeZ4VNoBetL4wwzI6GgcJ9ZQXr5RMsV7uGaQlnAE79NuQd4X+yOJQhLO
         l+Jsim6SPAAa8xi8tdGjS8Teq1Zqmtpsus4bxwMhllsk/a6AZgN6D9aCcky2V19IeElE
         8v4w==
X-Gm-Message-State: AOJu0YxOPetALOQ44LbriiRYuqzEHEb1sjbAA1U8cxUJs+5BkfVoQh4I
	ki42XIZiPEVFWks1QufbXmHX4kq6XI0/YY7uKc0=
X-Google-Smtp-Source: AGHT+IHFNN8HXR4a8YszmIwf+i2YMjQ52NfIMO8lMI9KAxQzfzodQYdwGQlU1myAqGPwEZtIjnVVh1do/HqyMuYNjSc=
X-Received: by 2002:a67:f60b:0:b0:44d:50f0:f43e with SMTP id
 k11-20020a67f60b000000b0044d50f0f43emr7667363vso.30.1694425856473; Mon, 11
 Sep 2023 02:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230904161230.377450-1-ross.burton@arm.com>
In-Reply-To: <20230904161230.377450-1-ross.burton@arm.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Mon, 11 Sep 2023 12:50:45 +0300
Message-ID: <CABXoSoX+r1rb1g9shT-C7rSRps5EYZ-sywzEYhADi5PvBQhe8w@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, nd@arm.com
Content-Type: multipart/alternative; boundary="00000000000045fde7060512433a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 09:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104837

--00000000000045fde7060512433a
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

The binaries are surely not useful for execution, but unfortunately they
are needed for CMake.
With this revert, Qt is now again experiencing build failures with protobuf:

| CMake Error at
/home/qt/qt6/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtgrpc/6.7.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake:100
(message):

|   The imported target "protobuf::protoc" references the file

|

|
     "/home/qt/qt6/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qtgrpc/6.7.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.12.0"

|

|   but this file does not exist.  Possible reasons include:



and in mingw builds:

| CMake Error at
/home/qt/work/build/build/tmp/work/x86_64-nativesdk-mingw32-w64-mingw32/nativesdk-qtgrpc/6.5.3/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-w64-mingw32/usr/lib/cmake/protobuf/protobuf-targets.cmake:100
(message):
|   The imported target "protobuf::libprotobuf-lite" references the file
|
|      "/home/qt/work/build/build/tmp/work/x86_64-nativesdk-mingw32-w64-mingw32/nativesdk-qtgrpc/6.5.3/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-w64-mingw32/usr/bin/libprotobuf-lite.dll"
|
|   but this file does not exist.  Possible reasons include:



On Mon, 4 Sept 2023 at 19:12, Ross Burton <ross.burton@arm.com> wrote:

> From: Ross Burton <ross.burton@arm.com>
>
> Putting the _target_ protoc into the sysroot for executation at _build_
> time isn't useful because even if it has the right architecture, the
> tune might be incompatible.  Recipes which want protoc should just depend
> on protobuf-native.
>
> This reverts commit d7f46fa816964e30edb2ccfecc57a26251cc351c.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> index 343933033b..d95e1c20f3 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> @@ -92,8 +92,6 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
>  FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
>  FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
>
> -SYSROOT_DIRS += "${bindir}"
> -
>  RDEPENDS:${PN}-compiler = "${PN}"
>  RDEPENDS:${PN}-dev += "${PN}-compiler"
>  RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG',
> 'python', 'python3-protobuf', '', d)}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104716):
> https://lists.openembedded.org/g/openembedded-devel/message/104716
> Mute This Topic: https://lists.openembedded.org/mt/101151552/3617605
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> samuli.piippo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000045fde7060512433a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBSb3NzLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhl
IGJpbmFyaWVzIGFyZSBzdXJlbHkgbm90IHVzZWZ1bCBmb3IgZXhlY3V0aW9uLCBidXQgdW5mb3J0
dW5hdGVseSB0aGV5IGFyZSBuZWVkZWQgZm9yIENNYWtlLjwvZGl2PjxkaXY+V2l0aCB0aGlzIHJl
dmVydCwgUXQgaXMgbm93IGFnYWluIGV4cGVyaWVuY2luZyBidWlsZCBmYWlsdXJlcyB3aXRoIHBy
b3RvYnVmOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
Om1vbm9zcGFjZSI+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigwLDAsMCk7YmFja2dyb3VuZC1jb2xv
cjpyZ2IoMjU1LDI1NSwyNTUpIj58IENNYWtlIEVycm9yIGF0IC9ob21lL3F0L3F0Ni9idWlsZC90
bXAvd29yay94ODZfNjQtbmF0aXZlc2RrLXBva3lzZGstbGludXgvbmF0aXZlc2RrLXF0Z3JwYy82
LjcuMC9yZWNpcGUtc3lzcm9vdC91c3IvbG9jYWwvb2Utc2RrLWhhcmRjb2RlZC1idWlsZHBhdGgv
c3lzcm9vdHMveDg2XzY0LXBva3lzZGstbGludXgvdXNyL2xpYi9jbWFrZS9wcm90b2J1Zi9wcm90
b2J1Zi10YXJnZXRzLmNtYWtlOjEwMCAobWVzc2FnZSk6IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oDwvc3Bhbj48YnI+fCDCoMKgVGhlIGltcG9ydGVkIHRhcmdldCAmcXVvdDtwcm90b2J1Zjo6cHJv
dG9jJnF1b3Q7IHJlZmVyZW5jZXMgdGhlIGZpbGUgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDxicj58IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDxicj58IMKgwqDCoMKgwqAmcXVvdDsv
aG9tZS9xdC9xdDYvYnVpbGQvdG1wL3dvcmsveDg2XzY0LW5hdGl2ZXNkay1wb2t5c2RrLWxpbnV4
L25hdGl2ZXNkay1xdGdycGMvNi43LjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2xvY2FsL29lLXNkay1o
YXJkY29kZWQtYnVpbGRwYXRoL3N5c3Jvb3RzL3g4Nl82NC1wb2t5c2RrLWxpbnV4L3Vzci9iaW4v
cHJvdG9jLTMuMjEuMTIuMCZxdW90OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgPGJyPnwgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPGJyPnwgwqDCoGJ1dCB0aGlzIGZpbGUgZG9l
cyBub3QgZXhpc3QuwqAgUG9zc2libGUgcmVhc29ucyBpbmNsdWRlOiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj48L3NwYW4+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5hbmQgaW4gbWluZ3cgYnVpbGRzOjxicj48L2Rpdj48ZGl2PjwvZGl2
PjxkaXY+PHByZT58IENNYWtlIEVycm9yIGF0IC9ob21lL3F0L3dvcmsvYnVpbGQvYnVpbGQvdG1w
L3dvcmsveDg2XzY0LW5hdGl2ZXNkay1taW5ndzMyLXc2NC1taW5ndzMyL25hdGl2ZXNkay1xdGdy
cGMvNi41LjMvcmVjaXBlLXN5c3Jvb3QvdXNyL2xvY2FsL29lLXNkay1oYXJkY29kZWQtYnVpbGRw
YXRoL3N5c3Jvb3RzL3g4Nl82NC13NjQtbWluZ3czMi91c3IvbGliL2NtYWtlL3Byb3RvYnVmL3By
b3RvYnVmLXRhcmdldHMuY21ha2U6MTAwIChtZXNzYWdlKToNCnwgICBUaGUgaW1wb3J0ZWQgdGFy
Z2V0ICZxdW90O3Byb3RvYnVmOjpsaWJwcm90b2J1Zi1saXRlJnF1b3Q7IHJlZmVyZW5jZXMgdGhl
IGZpbGUNCnwgDQp8ICAgICAgJnF1b3Q7L2hvbWUvcXQvd29yay9idWlsZC9idWlsZC90bXAvd29y
ay94ODZfNjQtbmF0aXZlc2RrLW1pbmd3MzItdzY0LW1pbmd3MzIvbmF0aXZlc2RrLXF0Z3JwYy82
LjUuMy9yZWNpcGUtc3lzcm9vdC91c3IvbG9jYWwvb2Utc2RrLWhhcmRjb2RlZC1idWlsZHBhdGgv
c3lzcm9vdHMveDg2XzY0LXc2NC1taW5ndzMyL3Vzci9iaW4vbGlicHJvdG9idWYtbGl0ZS5kbGwm
cXVvdDsNCnwgDQp8ICAgYnV0IHRoaXMgZmlsZSBkb2VzIG5vdCBleGlzdC4gIFBvc3NpYmxlIHJl
YXNvbnMgaW5jbHVkZTo8L3ByZT48L2Rpdj48ZGl2Pjxicj48L2Rpdj48L2Rpdj48YnI+PGRpdiBj
bGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBN
b24sIDQgU2VwdCAyMDIzIGF0IDE5OjEyLCBSb3NzIEJ1cnRvbiAmbHQ7PGEgaHJlZj0ibWFpbHRv
OnJvc3MuYnVydG9uQGFybS5jb20iPnJvc3MuYnVydG9uQGFybS5jb208L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPkZyb206IFJvc3MgQnVydG9uICZsdDs8YSBocmVmPSJtYWlsdG86cm9z
cy5idXJ0b25AYXJtLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJvc3MuYnVydG9uQGFybS5jb208L2E+
Jmd0Ozxicj4NCjxicj4NClB1dHRpbmcgdGhlIF90YXJnZXRfIHByb3RvYyBpbnRvIHRoZSBzeXNy
b290IGZvciBleGVjdXRhdGlvbiBhdCBfYnVpbGRfPGJyPg0KdGltZSBpc24mIzM5O3QgdXNlZnVs
IGJlY2F1c2UgZXZlbiBpZiBpdCBoYXMgdGhlIHJpZ2h0IGFyY2hpdGVjdHVyZSwgdGhlPGJyPg0K
dHVuZSBtaWdodCBiZSBpbmNvbXBhdGlibGUuwqAgUmVjaXBlcyB3aGljaCB3YW50IHByb3RvYyBz
aG91bGQganVzdCBkZXBlbmQ8YnI+DQpvbiBwcm90b2J1Zi1uYXRpdmUuPGJyPg0KPGJyPg0KVGhp
cyByZXZlcnRzIGNvbW1pdCBkN2Y0NmZhODE2OTY0ZTMwZWRiMmNjZmVjYzU3YTI2MjUxY2MzNTFj
Ljxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uICZsdDs8YSBocmVmPSJtYWls
dG86cm9zcy5idXJ0b25AYXJtLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJvc3MuYnVydG9uQGFybS5j
b208L2E+Jmd0Ozxicj4NCi0tLTxicj4NCsKgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3Rv
YnVmLzxhIGhyZWY9Imh0dHA6Ly9wcm90b2J1Zl8zLjIxLjEyLmJiIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5wcm90b2J1Zl8zLjIxLjEyLmJiPC9hPiB8IDIgLS08YnI+DQrCoDEg
ZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9tZXRh
LW9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvPGEgaHJlZj0iaHR0cDovL3Byb3RvYnVmXzMu
MjEuMTIuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnByb3RvYnVmXzMuMjEu
MTIuYmI8L2E+IGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmLzxhIGhyZWY9Imh0
dHA6Ly9wcm90b2J1Zl8zLjIxLjEyLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5wcm90b2J1Zl8zLjIxLjEyLmJiPC9hPjxicj4NCmluZGV4IDM0MzkzMzAzM2IuLmQ5NWUxYzIw
ZjMgMTAwNjQ0PGJyPg0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmLzxh
IGhyZWY9Imh0dHA6Ly9wcm90b2J1Zl8zLjIxLjEyLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5wcm90b2J1Zl8zLjIxLjEyLmJiPC9hPjxicj4NCisrKyBiL21ldGEtb2UvcmVj
aXBlcy1kZXZ0b29scy9wcm90b2J1Zi88YSBocmVmPSJodHRwOi8vcHJvdG9idWZfMy4yMS4xMi5i
YiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+cHJvdG9idWZfMy4yMS4xMi5iYjwv
YT48YnI+DQpAQCAtOTIsOCArOTIsNiBAQCBQQUNLQUdFX0JFRk9SRV9QTiA9ICZxdW90OyR7UE59
LWNvbXBpbGVyICR7UE59LWxpdGUmcXVvdDs8YnI+DQrCoEZJTEVTOiR7UE59LWNvbXBpbGVyID0g
JnF1b3Q7JHtiaW5kaXJ9ICR7bGliZGlyfS9saWJwcm90b2Mke1NPTElCU30mcXVvdDs8YnI+DQrC
oEZJTEVTOiR7UE59LWxpdGUgPSAmcXVvdDske2xpYmRpcn0vbGlicHJvdG9idWYtbGl0ZSR7U09M
SUJTfSZxdW90Ozxicj4NCjxicj4NCi1TWVNST09UX0RJUlMgKz0gJnF1b3Q7JHtiaW5kaXJ9JnF1
b3Q7PGJyPg0KLTxicj4NCsKgUkRFUEVORFM6JHtQTn0tY29tcGlsZXIgPSAmcXVvdDske1BOfSZx
dW90Ozxicj4NCsKgUkRFUEVORFM6JHtQTn0tZGV2ICs9ICZxdW90OyR7UE59LWNvbXBpbGVyJnF1
b3Q7PGJyPg0KwqBSREVQRU5EUzoke1BOfS1wdGVzdCA9ICZxdW90O2Jhc2ggJHtAYmIudXRpbHMu
Y29udGFpbnMoJiMzOTtQQUNLQUdFQ09ORklHJiMzOTssICYjMzk7cHl0aG9uJiMzOTssICYjMzk7
cHl0aG9uMy1wcm90b2J1ZiYjMzk7LCAmIzM5OyYjMzk7LCBkKX0mcXVvdDs8YnI+DQotLSA8YnI+
DQoyLjM0LjE8YnI+DQo8YnI+DQo8YnI+DQotPS09LT0tPS09LT0tPS09LT0tPS09LTxicj4NCkxp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLjxicj4NClZp
ZXcvUmVwbHkgT25saW5lICgjMTA0NzE2KTogPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTA0NzE2IiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMDQ3MTY8L2E+PGJyPg0KTXV0ZSBUaGlzIFRvcGlj
OiA8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAxMTUxNTUyLzM2
MTc2MDUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC8xMDExNTE1NTIvMzYxNzYwNTwvYT48YnI+DQpHcm91cCBPd25lcjog
PGEgaHJlZj0ibWFpbHRvOm9wZW5lbWJlZGRlZC1kZXZlbCUyQm93bmVyQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmciIHRhcmdldD0iX2JsYW5rIj5vcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZzwvYT48YnI+DQpVbnN1YnNjcmliZTogPGEgaHJlZj0iaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWI8L2E+IFs8YSBocmVmPSJtYWlsdG86c2FtdWxpLnBp
aXBwb0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5zYW11bGkucGlpcHBvQGdtYWlsLmNvbTwv
YT5dPGJyPg0KLT0tPS09LT0tPS09LT0tPS09LT0tPS08YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+
PC9kaXY+DQo=
--00000000000045fde7060512433a--

