Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15130C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 14:06:53 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.8949.1750946810619732144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 07:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xG+GyvyZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.54, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2efc0ed41efso353608fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750946810; x=1751551610; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HggG+ylnZL0/2Ahk3gaumDXxJiwL7DXWy9Y6zto2UY0=;
        b=xG+GyvyZU0kCZ692npVaL6uCoabB/cmXQuea+iGitpDe5ChW4UAhuLD48lXEz0IaCK
         8KJoYZDysbLu+N/hGP7rIUnYlEz41/XjsoHegSMKKg+c4nxhgS3WsFPwszFHKeOrsKzQ
         ggn6i6AulaaFmLE3NLOnhSkIs0Iy1IzvWwjuBN0jsgd/xlr7FjDMVwTmTaS5k8PQe+RU
         a5+aRAsaoY+OdxEKjiMsSNRQOLUpl35r3Hk0zWHLuMVV0KKic7S5M/NfylFyCk3umqqK
         pyBlFU/PwcQzL9gHl5hTsHbeh0cVEhjehi5JHaB/6ko9ZWvSMFSxIOmJC9smNbsinMLJ
         zbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946810; x=1751551610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HggG+ylnZL0/2Ahk3gaumDXxJiwL7DXWy9Y6zto2UY0=;
        b=t8i/i5Iwfb/OGLwXitNDjJ6CSt9IZdJQhKptqhX7CmRBqij1ElTU6ssyOgpH/90YAr
         +AkCl4bWlqlcMYYMMf/jbhfkVmhm/n+P0yWxPp7RXjVyhVFjJLZu5MDhMP4iB++3no+O
         boDXk8DKyW21NJLXy/d6DENEK6xkGeqrGqaMrXrf5szE4mLWVdbsSTg0yKBDyY2vtthX
         XHt7Fv25b9vK07HMdAEt9eJzUp5cTkljC5DbtHHGPajfmpe3E3g4yFdL7IrCxjqfDjvf
         HWG21K9v4270rO2rZLvINtt8IIsrMYk5IUYcjxEVgpVW+60sW/nuw/oIrGguRtLsEAkP
         4prw==
X-Forwarded-Encrypted: i=1; AJvYcCXFcFC1ceLlN8MtrZiNPgtf1ZQ9gym4w4hVdAlF9UxMzBsJ2O/bqRCTtdxFCEbibCMYKuvj0W7SJ1glIet7pMVecN0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwC0AcQT7wtmB9Z2TYKOSAcB+eLxgm45oiMhR/SuoRHQt7YnKre
	jCf47pGX0/XbxeDGaGWzBYIX3vkOfe647jvcDNTwDG6KFeH93GGumdda29JgD/LLdTsGM45x9Lx
	D2ueQ9n9Nsu+kEbNi3h6fIangycPb39ngt5UQcWow
X-Gm-Gg: ASbGncvZ3yX3FwLJU4iFedWkVnuXaQ+MqkbrJMX5l7uIQ5lPxif1dowpNEUs/eed5WZ
	9gZSQuq0pI5FzK9UPX/tVrtpKsD/hU3C6nIwQVgutmQGCt0dO3EmZlsKRJUUwJ0gsFkvObo9tah
	Bzhc0Bs2XZ7DIPb3JFuHku+xKRHnVwZQfEFxw8esq4bkI=
X-Google-Smtp-Source: AGHT+IG/fJrE17pj0gzBT2+VI/JNTtj9wb4jae5xGOXmRTgjlivYRPMIn5Me9ZNMJu3YpfOOGTQHf2/FUF8In1uv8sQ=
X-Received: by 2002:a05:6870:ad08:b0:2e9:973c:98c3 with SMTP id
 586e51a60fabf-2efb21a3f75mr5198726fac.10.1750946809605; Thu, 26 Jun 2025
 07:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <184C6E7578662DE2.823@lists.openembedded.org> <cf6b6313-bae2-4a87-b2ca-c5f076507109@ti.com>
 <DB5PR02MB1021308634340DFD241895C3AEF7AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021308634340DFD241895C3AEF7AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 26 Jun 2025 10:06:39 -0400
X-Gm-Features: Ac12FXwwkeF0PQ23QwwqEQMcIKHCQIHlmgLga3CL7yBCEm7TzMjCL3r_pHdzlZQ
Message-ID: <CAPoiz9wQpwu7vCC7FPPT5_3W2WEzrjdxtrV5JYF6iGCz8354uQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: 5.29.5 -> 6.31.1
To: peter.kjellerstedt@axis.com
Cc: "reatmon@ti.com" <reatmon@ti.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 14:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118123

On Wed, Jun 25, 2025 at 9:19=E2=80=AFPM Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of Ryan Eatmon via lists.openembedded.org
> > Sent: den 26 juni 2025 01:57
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: 5.29.5 -> 6.31.1
> >
> > Not sure why it says 1/2.  Ignore that.
>
> You probably subconsciously knew that you should update python3-protobuf
> as well. ;)
>
> //Peter

Confirmed

| Failed to import nanopb_pb2.py: Detected mismatched Protobuf
Gencode/Runtime major versions when loading nanopb.proto: gencode
6.31.1 runtime 5.29.5. Same major version is required. See Protobuf
version guarantees at
https://protobuf.dev/support/cross-version-runtime-guarantee.

git mv ./meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
./meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
and
SRC_URI[sha256sum] =3D
"d8cac4c982f0b957a4dc73a80e2ea24fab08e679c0de9deb835f4a12d69aca9a"

Seem to have addressed the issue

Thanks,
Jon


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118115): https://lists.openembedded.org/g/openembedde=
d-devel/message/118115
> Mute This Topic: https://lists.openembedded.org/mt/113835772/3616920
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
dmason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

