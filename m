Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9C6C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 14:25:15 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.22241.1756391109479793437
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Aug 2025 07:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ig7Cr2dW;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d6051afbfso7376767b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756391108; x=1756995908; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTBoGj5gShUeHY/XBn75fe45+uDLjgkv0Fq724ioflQ=;
        b=Ig7Cr2dW8bJQ5pxSWbenYF7HYfNhxeBvlm39acYnFmkj3GXPw+v6vJT7uagEPGUIzE
         C520C22eQE0a6qi6zfqZupbzqiMrmDHrhIlA8UlzO219SGgOmUleLfQjnPjXM6qFq+6T
         Z5SI1zuMddI500at1B86XaBi7msWtbSvFHM+OeXAyM/onWfkY7r+fK5wJ0HIS5ixuQTh
         tNgvO3j3w5iF3q/9tvt/4y3nbvs1i13Ez73yTxloW6zhVIjlBhqTupVyDiyqtn58+JdJ
         uTfZZVGXd2JirsiTNpwUIp4SNTU7RbrA73dBxuW+oBKVteXGdpY6fGZJDcnUnpqDdcuP
         4A6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756391108; x=1756995908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTBoGj5gShUeHY/XBn75fe45+uDLjgkv0Fq724ioflQ=;
        b=w6pdHCkzQ9IAq03SmhQ0YrPPH8+WHVhNcpN14XF1lyje2h8puytLkIIyYtY9RVChS3
         V4tQR4Y+ifHpC5+SvGh/FZZHHZ4OOH8mgS+XJWgfXlULV6tF0hKNWCP9BcKPDnTUESau
         avcWNP63DCyWbEqrHeh4VQ96uP+fTjyys8l1pf/bcx8cgQnZ2fUsX+WV3+5pvnkIua1A
         Vn992fkvZi3U7M/ASC3CqAntPaEeoIAB8/6fZ3OVl5Ijv8hZcAL5AMJCMT0rB26UySM+
         ulgefMMJOfotXA4O+pX0KB07wY4Gwrw8qTGfn1pmkztftFKKJTxiK58HjiMgfR9ChnML
         J88Q==
X-Gm-Message-State: AOJu0YzxVyxwxD7tKq0/XdSh6JLQ7AHcoFJsfgQ26mK/5WPhUwiVjWLs
	IL62R72pMRtvKNE7fRMo9XAX3NlSNpbyi+6GiIorK2C4uQzJRxK36UkWFz/rBG7y8lzXgcgP/H+
	QcI0/9DJqKNUVjOyx/PHBCwPK19F+03o=
X-Gm-Gg: ASbGncuw/Wsw8pIezK4VtbFu1zFYVxHlo8JahIrTdSox+9tmQsXCogtYy58vPhqMFK9
	2pCa1eeI9uaidpSA211MCDTd3IcUxaVlGKpLSTlH3/8ulm1V3piqa4xHFSf1mWJcjNZUO4sGFzE
	qgwiJh5e8PHd5AVlwPIQO4Z2L+GVn5vhC/2JRqAPoscMEY7JLUXRe0qDDUPUWmG/4vb65uFtSYu
	VHgLZKwvPn1l8kdSIUIjzDh3N5pTazA2KmXXb0H1xYgBwxb84ICzuONCOHvZE0s8KHhJNwxbLwM
	M9FaJPiRNtUCCk1+zRwR+4nI
X-Google-Smtp-Source: AGHT+IFz+8F2f0Cx9N6OYOXXN3nPfeRxZOkiowyiiO5OHb/5q2JDK7TF7fJ49p7TMcHc6L7ly+UnNOTz3N2MWkqtdMA=
X-Received: by 2002:a05:690c:6286:b0:71e:727d:7dc5 with SMTP id
 00721157ae682-71fdc406db2mr292016917b3.36.1756391108396; Thu, 28 Aug 2025
 07:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250828064523.114335-1-changqing.li@windriver.com>
In-Reply-To: <20250828064523.114335-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Aug 2025 07:24:42 -0700
X-Gm-Features: Ac12FXzu6FhhkjPLyKQEA_uBpbGzLBU4NEbhvPLge4LxsXXRjEtbslxjjw7RnG4
Message-ID: <CAMKF1spT8fpahqJ98FPE5H+GQ4FFd=P3f3PM1__ygrUnj7tdfg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-frozenlist: disable the support
 of ccache
To: changqing.li@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119131

On Wed, Aug 27, 2025 at 11:45=E2=80=AFPM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> With ccache enable, python3-fronzenlist do_package_qa failed:
> ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib=
64/python3.13/site-packages/frozenlist/.debug/_frozenlist.cpython-313-x86_6=
4-linux-gnu.so in package python3-frozenlist-dbg contains reference to TMPD=
IR [buildpaths]
> ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib=
64/python3.13/site-packages/frozenlist/_frozenlist.cpython-313-x86_64-linux=
-gnu.so in package python3-frozenlist contains reference to TMPDIR [buildpa=
ths]
>
> Although we have set -ffile-prefix-map, the buildpaths is not replaced.
>

Its not clear why this is happening. Can. you try doing a rebuild
after cleaning sstate and ccache for this package alone ?

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0=
.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> index 7d813a026c..363dab969e 100644
> --- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> @@ -11,4 +11,6 @@ DEPENDS +=3D " \
>      python3-expandvars-native \
>  "
>
> +CCACHE_DISABLE =3D "1"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119127): https://lists.openembedded.org/g/openembedde=
d-devel/message/119127
> Mute This Topic: https://lists.openembedded.org/mt/114930913/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

