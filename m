Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3135.1792747842267922843
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 02:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Guew1ybz;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6f8a519e215so512820eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 02:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792747841; cv=none;
        d=google.com; s=arc-20260327;
        b=Y52N3WkcUcRgYzLLk9wbmUBxjRdlNK2qkZrkgXmF1a5ROBIQn8NZReOT5ZYnWftCdV
         TQgBWVk+xZAmT4FmR069NSeI+8iv/lX/1K4MdKrR0q1M+rU3sOD+mWHih2oXHhaoll5i
         qxSyiTQ2pgE5PCCHt82LJO/fzYAM5DEDI+6MOIH/U+wFsjvd9xEMMH1NSlmZsdHp04G0
         r+Z1TDMOm4zTq6RVf0Q+fGv0KYrnZtHEU5Gpxq3I57gIjtDJWrL3xF59bOoYPn3ojIj/
         vhTRZsTIlSpDU1v+5P3AhAzj0nWFA/3oMJt00KysDeQtOFAl2/lFKwlEXy8+hFsf/w6I
         A2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=npvdyU+c/l67qYZTwzoCZ84JX/1Rzv7GzDSxn4OPOog=;
        fh=9eiHR+gwHVKKOADNdiXnRHqBGK98oRERJst3A2DNj5c=;
        b=RKrBVoWmwTyCEX/oubbwdzT4Z5W+s02u6gYWqC+0axoM52AzjcGqXvJXtw0bRKGLvu
         6V7c1JUhLbX3e+Ak2ZKHHx1KTvNZH6WHeE6iQkRUywZBB1V6VZODEAjg0Y3YhSoyQOv6
         1Jiw4pKTyrouUTDvuhoNLM9/boeduUWldyX5uFQ3jaMiYhfk7/PgQvjDZGYShWKLg3So
         1lwPRojfGesbn8vBIyf0DJYCtbqauGoqD1T2AJOMN9WTQPdMggHkVJSN4ztlIrluIdvJ
         429t47P6tJoBl1HDJbJClSm3ZMKf5tWCGZl5jOI+NsRE5aPQlW2vXRJm5Ih9osEqO5Yx
         DDsA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792747841; x=1793352641; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=npvdyU+c/l67qYZTwzoCZ84JX/1Rzv7GzDSxn4OPOog=;
        b=Guew1ybz7Wj/X0M451uiW928zxAKq2P62loluSg+9ZUgPbLxcSFh6C5AYa7hGxxGiY
         jwR0nGLeV2Nfr15D2nb5OR6WEfpTlnTNJ8chNsNm8rwNy7smCQkVly1Ce5z745ESiSXs
         SHmEW5ghIiNInkqzf1VOO83dN7DY6BqaDqCLTKy2PSMraAilmgsq5Fu/uHwzT6T1am+W
         j++Di+5eSwpiRG6jtZkZFgR1in8BW9ClhT3DN1hVG+jDyEplm1h7wZ1NdsQq9Y7xQVct
         N8i0EVh0rScrpNMQnkdu2nvofWCl0nxiUYisTHZugyYhc0ObhaUxPGZL3oIl7GxGGhXS
         PJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747841; x=1793352641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npvdyU+c/l67qYZTwzoCZ84JX/1Rzv7GzDSxn4OPOog=;
        b=l9Y/E/IehuSS8zMxVxsaw3OfDrlur/qhrZ1y9eFdB4jtg2LLC080uxXfitq57yVB1Z
         Cr+N4P8iaW1BAtqMBZkpj4S1CYs9jmH2RRmWE+EsO/WxlTwqMHpSePfbN7b5QgF9M9nj
         SBLsi8kXXCgy9eKXYQqtBeSwf0mUKhKxW5Ywp70urRmjZbkn/5M7Q83c+hzKnckS8bZ7
         zZnc4TcBD0VZSJjRBFyreE16139bmoJd4YhUlDWnJLP4cR8f8QN4emwmCofJtMPec8Y6
         flmb5jNDvEC6pKT14rQE6H6K48/EfNvdfuJOZOJUKB0aep9U5UAaNcC6uMQkzrFobIRb
         hYzQ==
X-Gm-Message-State: AFq9FYLj0CFLYHFuZ6cMrFhwH+tp5JpPYvqLMue/T4uSay5s6EdQF1Ns
	8wE9jgax1RYaW0EMojLo5caCU21V23nLkqxXv60O7rwFSmm/UqCA+aJDMePMcAZJEFw8KuDgTsD
	N5aHjGy7kF31birK9UuePFQiEiDYsVc2sXkVo
X-Gm-Gg: AYBFou0FODtLlQEOKxtilxLBiYk5VE/ewRCQxN8BTlkwVLqRrBo8+hIWs69kdD+FHQR
	eiN0/Ab9fAums0/jDU2HaVaSKocuQvYERvEOkLowrGkSj1BpPtchJPUb8l+b2jsinQFh2HioWew
	2mSlEUHq6g0ffUgTJnvB2dK9e/Aoqsv3ev7518/77iKCHsUwl8eGPjKK8Dd+Q0UQxNOgppdZbGS
	gfwjD8mIcNkjOJ3vNN8Y/GQOaDg4ChxxqjyjifrRZ4RqeFK6L76dl7rn+p8VZaRz12D7zdwZYau
	qvg5V3M3+Wq8d3ooWzG17MjtJLOtkk7AHCRbwCzhlNlB0B4q/LsACIPeTvhwEEO6AT3spnGq3zP
	IL2HADJoxBWV2fY3LzmUqMqvkkDVXmJV029eTmgbmFZXtPATNjldm5YipiPOZDw==
X-Received: by 2002:a05:6820:4b81:b0:6d9:c309:6479 with SMTP id
 006d021491bc7-70a81809a6bmr2717518eaf.58.1792747841126; Fri, 23 Oct 2026
 02:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20261023085051.1417202-1-Ghanshyam.BanaitSanjay@windriver.com>
In-Reply-To: <20261023085051.1417202-1-Ghanshyam.BanaitSanjay@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 23 Oct 2026 22:30:29 +1300
X-Gm-Features: AclHuK8WZNX2E-GRLVkd25rLpFvKBhoJSqVN74oaR98uUBqJBThEf3VhDxC8IiU
Message-ID: <CADySD0H1jAfM0QyCD=wbHVK9JrxZ2HNJwpGWof+OSepCu_7xAw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: upgrade 8.5.11 -> 8.5.12
To: Ghanshyam.BanaitSanjay@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 09:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131358

Already sent earlier
https://lists.openembedded.org/g/openembedded-devel/message/131301

On Fri, Oct 23, 2026 at 9:52=E2=80=AFPM Ghanshyam Banait via
lists.openembedded.org
<Ghanshyam.BanaitSanjay=3Dwindriver.com@lists.openembedded.org> wrote:
>
> - CVE-2026-109618 (GHSA-w8hw-w9fx-j79w): RCE via OOM corruption.
>   longjmp() on out-of-memory could exit a context where request
>   memory was only partially initialized; request shutdown then
>   processed the invalid state.
>
> - CVE-2026-109619 (GHSA-6wmf-4rv5-p3rp): RCE via stale global state.
>   Request-owned global state could survive after its backing request
>   heap was freed and be consumed by a later request on the same
>   worker before normal initialization reset it.
>
> Upstream advisory: https://www.php.net/archive/2026.php#2026-10-21-5
>
> Changelog: https://www.php.net/ChangeLog-8.php#8.5.12
>
> Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
> ---
>  meta-oe/recipes-devtools/php/{php_8.5.11.bb =3D> php_8.5.12.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/php/{php_8.5.11.bb =3D> php_8.5.12.bb} (=
99%)
>
> diff --git a/meta-oe/recipes-devtools/php/php_8.5.11.bb b/meta-oe/recipes=
-devtools/php/php_8.5.12.bb
> similarity index 99%
> rename from meta-oe/recipes-devtools/php/php_8.5.11.bb
> rename to meta-oe/recipes-devtools/php/php_8.5.12.bb
> index 831e926880..f9759cf7a5 100644
> --- a/meta-oe/recipes-devtools/php/php_8.5.11.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.5.12.bb
> @@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX =3D "releases/tag/php-(?P<pver>\d+=
(\.\d+)+)"
>
>  S =3D "${UNPACKDIR}/php-${PV}"
>
> -SRC_URI[sha256sum] =3D "dc940716a8c73e531c0078eecb955d595d321ec2cc9d4714=
9cf0089ea6e18f64"
> +SRC_URI[sha256sum] =3D "ffb60edc437ced63b5137e4984db379a8111c50049c71151=
0d8b958277efc1a8"
>
>  CVE_PRODUCT =3D "php:php php_group:php"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131357): https://lists.openembedded.org/g/openembedde=
d-devel/message/131357
> Mute This Topic: https://lists.openembedded.org/mt/121867758/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
