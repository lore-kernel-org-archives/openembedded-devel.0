Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E43C83F27
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 04:03:03 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.4653.1752897776496874395
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 21:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ejd6jehl;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e740a09eb00so2292940276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 21:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752897775; x=1753502575; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bVIvZjiCY+cFhYRAesp8PC2pLhpzOTY8mJxSaO3BvY=;
        b=Ejd6jehlH6JZiotY/XZ3twuyfybMImBFQadgSuUWllyZVHaWcddCAOJifJmyxPCQn5
         4QT7usikzpA2BMWKTUV4PsvnkE3JZ4Y3KYoTbELVGT6AhjmmmkFz8dIEqeXixEJEV1qY
         CaaP7aw6EmhXZBq9TRr37DndX10khok4WHg0Sw8VMcEzFcGvmGbC1V5o25gXJNSyFODi
         3bhbzYo+cYl0RSuIxRZfj3d0iIsfNJsvjbo3kAgjnC4Yu5kEorvu9VHHoK7Sz7Y7GrO+
         Gwu3ba/035Fs8mgX5Cvc8P/JYwKxsQWLX9R0y9MqyQ+1ID96aTFLAH0Q62WmDkw00yFU
         7j0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752897775; x=1753502575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bVIvZjiCY+cFhYRAesp8PC2pLhpzOTY8mJxSaO3BvY=;
        b=ZhNh8DTYyglf5F2OoRhwBRY+FUFlr3HZjQSgUYXxlbIfLhSQTuTNXC2Sm2G9ok3j7o
         UuniX8jfzXmcR4iE/62CZOakTwjuRYIeUNKVKjcAt4khRGRjBRDnrnpCHg/ghEBXUsCp
         styz3veL2BbDSAhx15ww6jAtZ7kifSl+I4jioJYUFL7LYuhi9UpjNr2VhY3UYo01mx6n
         f/Kyci+oOcInd57tDK6bCYAd6vB7p0TLN1xvwKG4KSRmNykUT3W4KygvyWaFMV4ZKvZn
         +CRQNmu5/qIKCK/HuI4+deHJ3UIC46h3RjUjazDF3GO+wJ5ODnsWX5UI7N8/c0IOBIdU
         1WSA==
X-Gm-Message-State: AOJu0YzS6LJwd7nIde3QtjDc7TxgSnVSYaIRB3JYHphxOttUFm1LgWdb
	ANPC7vGLc2loolZ2hfi/Acytysxx0UrTguukP0DGp5eQGxKKrVz+IAVwhujn5w3TgkO7S6vFjWd
	IufLwU4FB9teIBumpLQHS79PQ5zdmWbI=
X-Gm-Gg: ASbGnct4L4hKJU+XOsvUIxewTbue8ZDXAEhY4VMFNlqXprZO8JoUJfVUgvlkfdrayf5
	f6i8uC6KyAIBkWW2nJ3YFNP9iSOmKNq3XUfpvximyuewjy6AlN5Rf+OetZEuwY+Smg1fKf6N5mh
	B57R/HICwcP8rps1e2715Rqd2KDYVar2hfo09wkmsy7dVIFgTATnYy6TlIX+JZQQjkKufRWD0wf
	7Br6A==
X-Google-Smtp-Source: AGHT+IGTs3Q2hk9to+hc1nHa3lMPA0wfTACEbQ5XWW47lBnn5CRosgpasDQhtPW/G6oUaxfe290EviRpRikDF0oLLf4=
X-Received: by 2002:a05:690c:4d83:b0:714:115:712f with SMTP id
 00721157ae682-718370ee8a7mr168009877b3.6.1752897775309; Fri, 18 Jul 2025
 21:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250718150316.2579996-1-a-christidis@ti.com> <20250718150316.2579996-2-a-christidis@ti.com>
In-Reply-To: <20250718150316.2579996-2-a-christidis@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jul 2025 21:02:29 -0700
X-Gm-Features: Ac12FXyQkUUS0sPs9E3HNHhkD2i5DQdU8WgRx9-gYdQvkXQEgCLM3V7Hus4w9rE
Message-ID: <CAMKF1so06rNF2V_P09ir1L85DNiqd90pfF=GnWyMLShJtJvB4Q@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH v2 1/2] ktx-software: Add recipe v4.4.0
To: a-christidis@ti.com
Cc: openembedded-devel@lists.openembedded.org, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Jul 2025 04:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118634

It fails to fetch on yocto AB I guess you might have to disable lfs in SRC_=
URI

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3013066/raw_inlin=
e

On Fri, Jul 18, 2025 at 8:03=E2=80=AFAM <a-christidis@ti.com> wrote:
>
> From: Antonios Christidis <a-christidis@ti.com>
>
> Introduce recipe for ktx-software, version 4.4.0.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>
> v2:
> - Removed individual LIC_FILES_CHKSUMs of all the LICENSE files. Instead
>   now the recipe has 1 LIC_FILES_CHKSUM to REUSE.toml which states which
>   parts of the project have what licenses attached to them. If licenses
>   change/new ones get added, REUSE.toml should change.
>
>  .../ktx-software/ktx-software_4.4.0.bb           | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ktx-software/ktx-software_4.=
4.0.bb
>
> diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb =
b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> new file mode 100644
> index 0000000000..dda72e5237
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "KTX (Khronos Texture) Library and Tools "
> +DESCRIPTION =3D "KTX (Khronos Texture) is a lightweight container for te=
xtures for OpenGL, Vulkan and other GPU APIs."
> +HOMEPAGE =3D "https://github.com/KhronosGroup/KTX-Software"
> +
> +LICENSE =3D "Apache-2.0 & BSD-1-Clause & BSD-2-Clause & BSD-3-Clause & B=
SL-1.0 \
> +          & CC-BY-3.0 & CC-BY-4.0 & CC0-1.0 & Zlib & MIT & HI-Trademark =
& fmt & \
> +          Kodak & PNGSuite & ETCSLA & Cesium-Trademark-Terms"
> +
> +LIC_FILES_CHKSUM =3D "file://REUSE.toml;md5=3D45910de791d599e6ba472f6fa5=
06f391"
> +
> +SRC_URI =3D "git://github.com/KhronosGroup/KTX-Software.git;protocol=3Dh=
ttps;branch=3Dmain"
> +SRCREV =3D "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
> +
> +inherit cmake
> +
> +PACKAGECONFIG[ocl_backend] =3D "-DBASISU_SUPPORT_OPENCL=3DON, -DBASISU_S=
UPPORT_OPENCL=3DOFF, virtual/opencl-icd"
> --
> 2.34.1
>

