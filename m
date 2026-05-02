Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5DECD3424
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 21:25:53 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13966.1777757151504590584
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2026 14:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j6OQxrYO;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dcd17e19b6so1703494a34.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 14:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777757151; cv=none;
        d=google.com; s=arc-20240605;
        b=SK7joX4QOvvt2/PJO/yrX9r8VHImIT5sItCaLn8cTzMIoXyV2Y7peQR+7ZF6Xp1J+V
         sHSoOtTCVF1Y5NEpKzCZ7QAWHnfpmnBnq/2aU83PM4sh5/ji3U10wo8KcVV7+nLjCo8V
         ldzn/oJ8f2fzJ+IA0/vhXa5iWQ9LWDTXgTbF0eOCBWXuKy/XXxQdYZzPEK6kV9r7uYKJ
         Bty0HHzZpSmgvmEB7cWT/ExJ70MezDVvSMfTTcmNiu3IEU/IshE6izgk+HbGS8hIjUI/
         02jmb+ZQYytJ0BqCNdPoD+eVP8pW/s5o0N6Ru0YJq7ZA9wyfh3J34IjNphWr72F2NtAW
         6mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QK1/bOyHrQZ/KXMzKRw+oMy/jWv6bOfT2l3IfciXUt8=;
        fh=/Zfoi4o9G9NEfOtGJ0LSUrfiVhZcuLLzOVZQmzCL8qM=;
        b=hjVjCwXvq122K8IlQsMI4DSivlxytdLctreNlTARzFpZ7FgMzjDqBRx01E1dnOjWYk
         kvjfI2JQP1avaWyz7IYUHASmcbrvdETAPsTuX/cDaYSYdcfS6gOzoDA+XauLlQBhi0Lz
         pzSEYYb9S6duzZ1aar3loLhS7TR3pvC2fksccTQk0YNULiFvjoRvekPyynskEqJoAzv6
         6IQ+DPzTbWIEK2XY0SuBZxONufMsM6iNgovJwtq8YRdi4Tbhy9d2MtZg/+ODneffhMG5
         ckV3PhsDI7Z9kI1cyR3rk6NG3B4tUVdafKLiTkdl/I2VT0G9etPabJQqVa5m1W6LBUh8
         hALw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777757151; x=1778361951; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QK1/bOyHrQZ/KXMzKRw+oMy/jWv6bOfT2l3IfciXUt8=;
        b=j6OQxrYOyvxpAnGfLD1RYlr7+vUedhEkmNtNwsjsYMQfYINtSurZqpkQ7iV6mdpevm
         QPAvccMDkCEWIxkSevntuGUDBXsNemqXwX1bWTgQEVQkLPtUWeEfc2v67fQ2sk6X8Lbe
         TbDfvsHF49FcEjFo5nbYSInP2pLd5F+FAOjc5qaAWspYNC/ukt5rVh/pfBEZgPPuTHy6
         1rQcZi7QAUT1ucFSjDsPgliTvgncU3YpdjL8SvxLnH/g+ycT86gqt5tdZDDvr3AMVLIH
         /mvmIJah+LDpZS/Gd/KYDC9NdKv0tg3OBc8Jyp84vb6koEusikUUsiagujAKzHSClDD4
         18Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777757151; x=1778361951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QK1/bOyHrQZ/KXMzKRw+oMy/jWv6bOfT2l3IfciXUt8=;
        b=mKiv9e4geQDpboIru7hfGZ3Bp0k0KPqPZClhYT8EVtHjCmIsat07eyKbesFU9O8qAl
         Tg0GDPfGvNaFseDtkRtMU6UZ7uBsFIqvcpPSW0hVJWE5BgjfzhXOBCmL8Br65/3/6TR+
         QxPddyfjIN9xtUURqLijiM3uSddGR8ibDUuKC6Z852OtO3hyLybN8yFbTH7yTD4Z3XRK
         bemyrovI4XjYFYgI9NFXu+EWyQsrUUo69Y5uB0DakuzBrEljmgK3po+u3gak7EU3s6u3
         ZN+AAytUaqU1pUfiuDhPuj2qCiEmv0jJ487cIlQD3clngzNq4sDRG2Py8f7Ui5cWARaN
         kPag==
X-Gm-Message-State: AOJu0Yw/f9dtoMQidczlI9LQucrRZ8anNKiIPCkQpvaCUqtpI5gSjT/c
	LPqMO9lQ7W6FvwzA5IDC4g09FrW3h9rNsS24YwpaKM1by844o06aTsLE30fCQuKhLaOloqIIQNN
	BvYx1q82CmT/AAkD98suavPnaPtFz0Eg=
X-Gm-Gg: AeBDiev/mz3Cs1/vsL0sDQXl2wfO0w0/gAP4GJxGcUx39ldeCKU4jVH5hhLDKlJG8tm
	IaP2bvSpY6UqFzZPpnLGFbxPbHLoaluWNQWS0OcWSgTQydstkgNRD9/TjWqkYgP4aYccfg1lvdP
	paPXZNmcwleuh1xI2vTYAoQD6qUG7oZuMS4u/xEDsUU8DQOPVD/ZHTlrLDEUs20VZQRDAHGn+nQ
	S9mrHejOPEzkdz5rK6MazgYVcU/kDnNhw9lSN+qxeejWtLBGnR+MYAt9NERKnpVbT3xNjl/Qwot
	GTJKja/RwIzNzi73gbsB
X-Received: by 2002:a05:6830:3703:b0:7de:495a:cf80 with SMTP id
 46e09a7af769-7dee13b0dd0mr2984364a34.16.1777757150661; Sat, 02 May 2026
 14:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260502075925.1861299-1-ankur.tyagi85@gmail.com> <c7d17e42-e8bd-4152-a0c2-91b38cb52399@gmail.com>
In-Reply-To: <c7d17e42-e8bd-4152-a0c2-91b38cb52399@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 3 May 2026 09:25:39 +1200
X-Gm-Features: AVHnY4IuRLaDQKvcG8xLVr6e8cpSkPvo9kY0AIWE-JFO7FBDa4hCdxdRJpmSvSQ
Message-ID: <CADySD0EpRMD709L5uFQf+72ULcokCHWOcJoMtjL4k7Z8BjNjKQ@mail.gmail.com>
Subject: Re: [oe][meta-webserver][PATCH 1/1] nginx: upgrade 1.29.7 -> 1.30.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 21:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126767

On Sat, May 2, 2026 at 8:17=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:
>
> On 5/2/26 09:59, Ankur Tyagi via lists.openembedded.org wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > 1.30.0 stable version has been released, incorporating new features and=
 bug
> > fixes from the 1.29.x mainline branch (https://nginx.org/en/CHANGES-1.3=
0)
> >
> > Set v1.30.0 branch as default preference.
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb |  5 +++++
> >  meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 10 ----------
> >  meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb |  6 ++++++
>
>
>
> I think rather the 1.28 recipe should be deleted with this patch. Odd
> versions are mainline/bleeding edge releases, and even versions are
> stable ones. AFAIK 1.28 isn't supported anymore with the release of
> 1.30. (I'd expect that there will be a 1.31 release in a week or two, as
> a continuation of the 1.29 series)

Since 1.28 was the last stable branch, I suspect the majority of the
users will be using it.
Until 1.31 is released, I wanted to keep both stable versions to allow
time for the transition.

Once we add 1.31 support, then IMO it will be appropriate to drop
1.28. Thoughts ?
>
>
>
> >  3 files changed, 11 insertions(+), 10 deletions(-)
> >  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-=
webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> > index 9872a6de3b..f2b10a5c69 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> > @@ -5,3 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3dc49537b08b=
14c8b66ad247bb4c4593"
> >  SRC_URI[sha256sum] =3D "2c96a946bfb0882a21744ed429770a2123ae1828c7c486=
65092993ddee91a918"
> >
> >  CVE_STATUS[CVE-2025-53859] =3D "cpe-stable-backport: Fix is included i=
n 1.28.1"
> > +
> > +# Set DEFAULT_PREFERENCE so that the 1.30.x stable version is built by
> > +# default. To build the 1.28.x branch,
> > +# PREFERRED_VERSION_nginx =3D "1.28.%" can be added to local.conf
> > +DEFAULT_PREFERENCE =3D "-1"
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-=
webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> > deleted file mode 100644
> > index 4d884fcbb3..0000000000
> > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -require nginx.inc
> > -
> > -# 1.28.x branch is the current stable branch, the recommended default
> > -# 1.29.x is the current mainline branches containing all new features
> > -DEFAULT_PREFERENCE =3D "-1"
> > -
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79da1c70d587d3a199af9255ad3=
93f99"
> > -
> > -SRC_URI[sha256sum] =3D "673f8fb8c0961c44fbd9410d6161831453609b44063d3f=
2948253fc2b5692139"
> > -
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb b/meta-=
webserver/recipes-httpd/nginx/nginx_1.30.0.bb
> > new file mode 100644
> > index 0000000000..139fe24dcd
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
> > @@ -0,0 +1,6 @@
> > +require nginx.inc
> > +
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79da1c70d587d3a199af9255ad3=
93f99"
> > +
> > +SRC_URI[sha256sum] =3D "058188c64bf22baecaa72b809a6318a4f9ba623889c554=
feab03f7cb853ab31b"
> > +
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#126762): https://lists.openembedded.org/g/openembed=
ded-devel/message/126762
> > Mute This Topic: https://lists.openembedded.org/mt/119112437/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

