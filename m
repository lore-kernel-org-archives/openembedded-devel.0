Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE57CD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 23:03:04 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15233.1777762978810339819
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2026 16:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X82rzikM;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7dcd17e19b6so1728515a34.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 16:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777762978; cv=none;
        d=google.com; s=arc-20240605;
        b=lZxVsJAFy7WRAc+gXeNLpesCoUWrvy2U9zOA5v4+MlNvwyPxLLPkAW8XRbrmGMUf/4
         npc8YEVLWdEWdiAuBFefd9Vrurw3JNPoIY6YwzD42zD533yXPAEgXjta0qRYVgSnZvJh
         AkyntyPTUgdlpMKrP5lccGxMv+Lr8ytrDhSGeErx+aFMEvFdyd3OFwuILIA8Jc3+wr/2
         eMFR37BWpOVn51UA+n7HgRbVAFp8KOFDDVF83vQLKcuewQ0qvS5SsxWX5h1Yu7egsnAK
         X+6iJXTAOUtYPNLRvrYmyxdOeukufwVGn1nhgYm6eFOXhchJ9VDDhY4uiy+4GF7pbuVo
         Kkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+8A8tQgK9gy51WErAQ7ppTXX7j2G/ACWNiWJUIKpcFw=;
        fh=iuPgE0vqCia+ULEOAROykHtInCWNdKWkXhHUfxtB2n4=;
        b=g1/jhR1uGWNngB8wHmRD5FBL7mhv1G4U4/S+aXr+zUUSDepq+td2iAOklCDWzj/6ro
         J4SwOHG9tHKYECf4VYLaxSiiBPdNz1Qnrqxr5hdiBZAl2IMXTncmVgh0wwpJBOlOvZlf
         BoE0h0kKVET3XPs/PZS14kgVCzrOStmMf9jFjHBYCVOAeDUXD/GqOeBKv22rwGyEi0Mb
         mPCdsnynOiLpp3N7H5+YjfyomC0wHrChOm3+CS+xlsqGlkywpTaM7Sblt3DHf8fQg58u
         x+8N5Z5yq4THattq1I10EDv1apss9zQ4hxS4csGIGXDYG+RtH1RK844tI8wkug6kE+y8
         7U/Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777762978; x=1778367778; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8A8tQgK9gy51WErAQ7ppTXX7j2G/ACWNiWJUIKpcFw=;
        b=X82rzikMzQo0xlwiup4qcqV+1HYN9Zk8WmYOtEm+XFJieeUkRUdbhUAqx1BF5XAE7h
         z9RfINT0Hm8ZMsAsy3zO8QqdvtrUp5H2LvWrUZo4BTExRs+YnWITsAlzYpDjZeXFs9eV
         Pkd7NLOJank1Qqpcug/S184CrH8AIrMNySL9D4qfCt5V0x8Wpe+idCeTwxEXeqVsmR8A
         7Khn5BhQ8NsEZvGn0udTQFegyUyEW9pj71B/YNjNGLQjOzC6z1ChLnxgyeeIOOy8LXfN
         LJx2HqO0S6UbACoaQf4RHaQdwWZJxgDll101oa529MqRvG1Hfr2jWqyeGJjHvk1aWoTn
         vGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777762978; x=1778367778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+8A8tQgK9gy51WErAQ7ppTXX7j2G/ACWNiWJUIKpcFw=;
        b=E01FAA3L9tQNPFJj2Qbu5CpKqm+eMDYyHRGGoH0EdZW7O00mpYSXdB2cN7RNmYaH4S
         AnvaGW6KWUUD3pLmuN0hiVMEy0NsxWg6T0H9vRRWpCMhR/YkT0lOcP8641qJ3H2V8qal
         8xjM3k66y8HTnb2q9zGLHOd3NORXgeA9/bIeS7E1ZRrGTn48+0cZRvapFtmwlBDMnC9k
         +A0UALlYZGJhQCUfxULbLHm2fDhIC+p174v+J2N+EVdYE1Lo5jLkYIGYFPRZQpDQ1k/H
         u57xdJIum1tvBCWBV+Zs/igOGKp/zJwRiPdEHWkJ9KPx1sqJp1hGsEm727o+Q7FVrb9U
         /mpA==
X-Gm-Message-State: AOJu0YzqDpZLl5Pnn8kd5Y6u5A6RxVQH92fyAsP+TwmWlm0zKFb826KV
	n2uFewZ9ic6XtI/DVdv+xJC14d9i4E4Le4nor9t5LHfn2ifWMXFwVJdygWv0CSjNBbTs4FG8w2v
	ECbAm7p+1KnouxPPJDutQ3TU7ZP1Itjk=
X-Gm-Gg: AeBDieukWtb/s4PD9eZ6B1J3UC9eyb0SXGUpjLV1Uy5Ie4GGsNRl+WErKiL07f3U4R4
	atU819oh6EO9+T43scTp4VAOBPQGFMqo2p1ihosLWfBDzU9etp4VNwcYsHW26ML1KIS0QU0Q+bz
	tIm3B5tNGlfuC+3f4zhz7nGmsQKDeiEpIwZGxUGe4iQZARLUVpf1qEKq/oSbyzI8/fGd1EcXrII
	A/8sPy1EefGkhMhvsTKHWWpeqyNX51qXhCxkDKstENSfW6UNGbkfW/+Vq7ZYgKwDnOwH/v2YDBY
	qsxOa2GpJktxlw0jkNy7
X-Received: by 2002:a05:6820:2214:b0:696:1450:ff14 with SMTP id
 006d021491bc7-69697c64d5fmr2058310eaf.37.1777762977805; Sat, 02 May 2026
 16:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260502205501.185550-1-tim.orling@konsulko.com> <20260502205501.185550-3-tim.orling@konsulko.com>
In-Reply-To: <20260502205501.185550-3-tim.orling@konsulko.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 3 May 2026 11:02:46 +1200
X-Gm-Features: AVHnY4JzqCcn2AZwWzIRcAI7LLA95PN-uSJ2aMQiqhCZkVuxtuWU6Vi8iV4vUcA
Message-ID: <CADySD0F5+T_eiLstknJfbOfkBuoUu3fMoE=Xd91PQHrtL8U4Mw@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH 3/3] nginx: upgrade mainline 1.29.7
 -> 1.29.8
To: tim.orling@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 23:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126768

On Sun, May 3, 2026 at 8:55=E2=80=AFAM Tim Orling via lists.openembedded.or=
g
<tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> From: Tim Orling <tim.orling@konsulko.com>
>
> 2026-04-07
> nginx 1.29.8 is the final release of the 1.29.x mainline branch,
> published a week before the 1.30.0 stable cut on 2026-04-14. After
> this point the 1.29.x branch is closed; new development will continue
> on a future 1.31.x mainline.

There isn't any difference between 1.30.0 and 1.29.8 except[1].
Don't see benefit in adding both versions.

There is a discussion already going around this[2], will be good to
hear your thoughts.

[1]https://github.com/nginx/nginx/commit/654367cb11b08b0a5a67b08d5e1ff058de=
8b13c3
[2]https://lists.openembedded.org/g/openembedded-devel/message/126762

cheers
Ankur

>
> Notable changes in 1.29.8:
>
>   * New 'max_headers' directive that bounds the number of HTTP headers
>     accepted per request, mitigating header-based DoS exposure.
>   * OpenSSL 4.0 build compatibility.
>   * The 'include' directive inside a 'geo' block now accepts wildcard
>     patterns, matching behaviour in other contexts.
>   * Bug fix: handling of HTTP 103 (Early Hints) responses received
>     from a proxied backend.
>   * Bug fix: $request_port and $is_request_port are now available in
>     subrequests (previously only in the originating request).
>
> Also refreshes the recipe header comment to reflect 1.30.x being the
> current stable branch (it had previously identified 1.28.x as stable).
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 10 ----------
>  meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb | 11 +++++++++++
>  2 files changed, 11 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.29.7.bb
> deleted file mode 100644
> index 4d884fcbb3..0000000000
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require nginx.inc
> -
> -# 1.28.x branch is the current stable branch, the recommended default
> -# 1.29.x is the current mainline branches containing all new features
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79da1c70d587d3a199af9255ad393=
f99"
> -
> -SRC_URI[sha256sum] =3D "673f8fb8c0961c44fbd9410d6161831453609b44063d3f29=
48253fc2b5692139"
> -
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.29.8.bb
> new file mode 100644
> index 0000000000..f810ac219d
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb
> @@ -0,0 +1,11 @@
> +require nginx.inc
> +
> +# 1.30.x branch is the current stable branch, the recommended default
> +# 1.29.x is the most recent mainline branch (final release before the
> +# 1.30.x stable cut on 2026-04-14)
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79da1c70d587d3a199af9255ad393=
f99"
> +
> +SRC_URI[sha256sum] =3D "7f1b985dace8fe706dfc288b83927c928f0ae60bcb7507c2=
d4e0025eca7280c3"
> +
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126766): https://lists.openembedded.org/g/openembedde=
d-devel/message/126766
> Mute This Topic: https://lists.openembedded.org/mt/119120498/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

