Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C3DC02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 06:58:57 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.82522.1738565932061612757
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 22:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W5UncoF2;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-29fc424237bso2665611fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 22:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738565931; x=1739170731; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbXdkKsFk7C+4PXTfEAUQPaeBAjL1bp3d4rQCbY70yE=;
        b=W5UncoF2h9ZX2bmKw/hB6zDMFqMgUeWZUCbX8gy2CTbswicjP3/imC6m25DvYO5g70
         vl9baxCrXixFXhDLguaXAnW2yCndapPQmNntz1CLYVuAOrKu5o/DbusU//6K5M/WqWDm
         /WXYCJmugY2G7zAzVDtaxDaMZOz5Ufy85mVh+30UQZancJzR0Ww+Vuzrmpw7JgBld/si
         aKbvxfJlMRFzWex17C8ecxFKxXXEQZ5tzW3uyp4oMuCaq9h90nzDQ7eWqZeyFfQ1Pdms
         gXoygbJTc8Q77c5tiKrFpa1ab1BC4/r1HHeHIShRC+gqALbbahT+ZJmw/ulpjn25IR/w
         1LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565931; x=1739170731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbXdkKsFk7C+4PXTfEAUQPaeBAjL1bp3d4rQCbY70yE=;
        b=l3CmCL2HiYlr0Xhwf3TYlr7TavjdlIDL2c5+CGiXSHqgm90+3EmwjIsp8gO01y+rL6
         zbz+qyDy9fEJYnjR57PzqhTjbv3SzMXctP0VJwbeSfELBDgcq0o1F7tEbk+OXs3QOAcO
         +gDqmB5v94oa/nSTsUTaL3veXN+T+AhHaL3rtxNvuh1jlnu2b3HPuKmOVoOysNacPuNQ
         bCyj0Ke/ovdLpImaLvfIYJ1vvj/9QNmLxp0Mjv5uWY8bhLuHMC+lJT6tManRm5Lz+WmX
         RpCHyN2ftBmDqTUWpu/5FZE79v7Ff61JtzcRJ6jgkq30g/59MGFWjo2H7l8WxEXAWbl3
         Tgjg==
X-Gm-Message-State: AOJu0Yw6mn9KHALtlrAgsMqVPmL8+MFpZtXtDAYJQ+wutdpGT4CKC1xA
	17ihmv8VXaPE+yZnON9YnsAWRfeTttMhRoC5MvqE9PPgioxIwlPCH228Eg4XjsggAv/4jlsBExq
	mttIoz/Zu/C/81BA0gGt7aRMRIrY=
X-Gm-Gg: ASbGncvwwBGkTNEZgOzOl3+BFZx6Dgp6drwVBiW6tbng7vCKwkjK/oYTRkghhYylkSl
	kwlcTbnmIhoZMtmvBNGba2HoaaUz9TQvleDFZY44qXB52rgjRbjjTSOuIA6+6nvlqqcOAcMlq
X-Google-Smtp-Source: AGHT+IE6vGLJGwgf1S0ty3rcaVr0syH4W+1j3jvfUjTH+LkN0eX9trSaiGjXOwItFXvDVnz0FfqevWiEOUttMA8tCjk=
X-Received: by 2002:a05:6870:d38f:b0:29e:60c9:9dd8 with SMTP id
 586e51a60fabf-2b32f2642c5mr15464426fac.29.1738565931246; Sun, 02 Feb 2025
 22:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20250202213910.284312-1-peter.marko@siemens.com> <20250202213910.284312-3-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-3-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Feb 2025 22:58:25 -0800
X-Gm-Features: AWEUYZnixw-nHhNC-xCjcE9om1lxnZ1dihGsb_H1haWQfMLm0g-IeYfYFcU1xeQ
Message-ID: <CAMKF1squvrD1YQsFv3jJRJgbfEArPSm-5KcG-SKMBruLHdLs0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/8] protobuf: use system jsoncpp
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 06:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115233

ERROR: Nothing PROVIDES 'nativesdk-jsoncpp' (but
virtual:nativesdk:/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recip=
es-devtools/protobuf/protobuf_4.25.5.bb
DEPENDS on or otherwise requires it). Close matches:
  nativesdk-cjson
  nativesdk-json-c
  nativesdk-ncp

On Sun, Feb 2, 2025 at 1:40=E2=80=AFPM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> We should not use additional vendored jsoncpp unless required due to
> compatibility issues.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> index c7e9408870..470c368cf3 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> @@ -7,7 +7,7 @@ SECTION =3D "console/tools"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bda42=
66b"
>
> -DEPENDS =3D "zlib abseil-cpp"
> +DEPENDS =3D "zlib abseil-cpp jsoncpp"
>  DEPENDS:append:class-target =3D " protobuf-native"
>
>  SRCREV =3D "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
> @@ -37,6 +37,7 @@ EXTRA_OECMAKE +=3D "\
>      -Dprotobuf_BUILD_TESTS=3DOFF \
>      -Dprotobuf_BUILD_EXAMPLES=3DOFF \
>      -Dprotobuf_ABSL_PROVIDER=3D"package" \
> +    -Dprotobuf_JSONCPP_PROVIDER=3D"package" \
>  "
>
>  TEST_SRC_DIR =3D "examples"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115222): https://lists.openembedded.org/g/openembedde=
d-devel/message/115222
> Mute This Topic: https://lists.openembedded.org/mt/110959919/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

