Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FFFC3601E
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:36:06 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.14018.1744331765887754853
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W1CSr/6N;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c13802133so414649a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744331765; x=1744936565; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EyNA6nD7i9UKsf+VcXHoc7xiCnAfh924xz27INqKEA=;
        b=W1CSr/6NtYHjIudoLx75KQsHZDT57NySI70WQIFbkxUSMlyTXWYbAFnzv9xSsl1R1a
         ZJdH5SmYQsU75DOxXQwWdRrJKYlLY19d43SJJNlbUuF2fAMsF5pvEJvRQ2FZizt+76/Q
         P6ejNJ5WLPJdRtzL6dcf5Peqm/RlQgjgBIMJq069bTR0VOnmk6ml3IyRp99RrmPva4jp
         x/dlxmKs8OOf9NxCRt3iSlICIlOiYMeALz1HlPFqrET9EIOlmr3EDMoVg5RC0jD+Wolc
         fGG3OlHfLlx+mnYPFFsG8r8kzoZq7IA88XYkAkCZMz/Dur8VgFWRtV514QlToiX3ETiY
         rguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331765; x=1744936565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EyNA6nD7i9UKsf+VcXHoc7xiCnAfh924xz27INqKEA=;
        b=pbaI9GRKEg10/b2w+zFQ3Ke92Hohy8wppaQChwl+eAPnxWZVbr6y8QlfRnrJtQF/Jk
         ev6gRoNXebyMgeg81ex6fenzQi7iJKICQYkGM0ZRjJ5YQklE7Js1XwseWGxU7pCULdwN
         aUAKWXR/tD6tbPtXj5Z7xQ/EzQyTUsjS6ZMARPBs3SR1LY9JKke7cCuqtX0aCsv76vSI
         CL/dDyeGylj0b9LSZftM5yVbR/4rhSEO37dWFvcY3wV/8+qEI2xTxUfH05Z1QhEq0nc7
         AVjjPvljV6bhRWUA93xUiSRde4hYYe9ddfpYThtUwrqjm5YINlJ2AJnyCbtGJpi8LUso
         oH7w==
X-Gm-Message-State: AOJu0YzVvuENIAQFy6M2/JMERpg3QzXlsr8U5JojU9pzkT2KaF0vAjc/
	ZzK7kYEzk9CVY3eKw9Z17y+C/Axe0mL3Ig8BtAraG4zE09tjbjsCGEeEo6K0nHt4Rb3L1GFtzpA
	4tMEbVYRYsjDTQlIv09nlC2WYaC0=
X-Gm-Gg: ASbGncvOSL17B7IJ79nqR/2n/Vc5kFTKsnk8JiLOoAateMsvRQUGvM3ELP1XKBlhydr
	jm5Hu4yWXi0jlenyHVUD3iaESposuo3eOnsKTp69CY44QZSXggRVMqqSmQuaqgauQTFyko2F9vO
	rRoF0mBuM2+ZQKHL6gdfCkeg==
X-Google-Smtp-Source: AGHT+IHwBBlEeF915u/SJ5cicvYO5LuYOfj2edmKno5qW5XaTFOFI0MD8g82s8ImBgury1uOuYfuvtksiNUaTPcCd0E=
X-Received: by 2002:a05:6830:6587:b0:72b:93df:9213 with SMTP id
 46e09a7af769-72e86307e08mr700239a34.10.1744331765008; Thu, 10 Apr 2025
 17:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com> <vcqsx7hy5jlmcwwpq5vbydou6k2yehxjxv7nsnqm2iartl7kn7@tshogi7vdy5b>
In-Reply-To: <vcqsx7hy5jlmcwwpq5vbydou6k2yehxjxv7nsnqm2iartl7kn7@tshogi7vdy5b>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Apr 2025 17:35:38 -0700
X-Gm-Features: ATxdqUHcjUbXu0Ku4mW1g9ilYy3XDblvXRxJ_upKjtWCM2pFhLXnM6lE_aFVpGg
Message-ID: <CAMKF1so7xdVHgWo6sPZ+GwZgrAL-c+a2Ws0LO4saYT3a6c09+A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/5] opencl-headers: upgrade to 2024.10.24
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116774

On Thu, Apr 10, 2025 at 3:05=E2=80=AFPM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> On Tue, Apr 08, 2025 at 01:20:54PM +0300, Dmitry Baryshkov wrote:
> > Upgrade OpenCL-Headers to the latest release. Upgrade opencl-clhpp with
> > the same commit so that they stay in sync, otherwise projects using
> > clhpp might fail to build.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../{opencl-clhpp_2024.05.08.bb =3D> opencl-clhpp_2024.10.24.bb}  | 2 =
+-
> >  ...pencl-headers_2024.05.08.bb =3D> opencl-headers_2024.10.24.bb} | 2 =
+-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-core/opencl/{opencl-clhpp_2024.05.08.bb =3D> op=
encl-clhpp_2024.10.24.bb} (91%)
> >  rename meta-oe/recipes-core/opencl/{opencl-headers_2024.05.08.bb =3D> =
opencl-headers_2024.10.24.bb} (89%)
>
> Khem, gracious ping for v2.

Thanks, it will be in master-next tonight, I was holding up some
patches for clearing up walnascar
>
> --
> With best wishes
> Dmitry
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116773): https://lists.openembedded.org/g/openembedde=
d-devel/message/116773
> Mute This Topic: https://lists.openembedded.org/mt/112150276/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

