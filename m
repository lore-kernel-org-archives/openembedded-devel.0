Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83152CD3424
	for <webhook@archiver.kernel.org>; Sun,  3 May 2026 17:49:56 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.675.1777830589962216605
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2026 10:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jnWGKdS2;
 spf=pass (domain: konsulko.com, ip: 209.85.128.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7982c3b7dfcso31926767b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 May 2026 10:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777830589; cv=none;
        d=google.com; s=arc-20240605;
        b=TJYAIEMIHSnWb7j/718bWm2Fxip2eaasDJiD2CsurIvYeZaMjd7juySSFu7mp4vlxe
         uBdW5A3/d/JZcECYzN8CI5EOXrqkLfeFXaVl1NbVz1NjJ6nSajXuyjSgn5Pq0MnKnQyR
         b2POUkQpIfKGH0ZAekiqQoOruP0BfoLUJz25nyWzd2Skbkmk5akmoO557338uCXaSObZ
         s9Reaa1nqtRctJGeJWTuWY7/zYx6V7V20mnRWSw7ivleqpXwiRBhbWOPoo8tBTJID+HF
         42ddmP509mn2VLFw8KOs2qCaY8xq1g014cYf0SAZ79ReZ2Dduulv8c/XWvKzVVs9d/ju
         ue5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=EBmCgnvKcuX/PJMbeE1+OyVa1S4vwoCbmzQD6Kq/fwA=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=IpZRYsQs9I/q4JNRZDT/aB9gmSbCrIc9Ba/S6yQHtsSpxhDUMMZHoaBK3iM3sZqfni
         BD6nH7/3ZBDNKvBfZ/U7aQimGmA9XDGBzkp/SuiMAKZKrL9K3GrkxEq5E1p7LWxGtRWD
         D1beZEXpYyurQVEmmf6th+IpjAF+uovAu9QBvoucE4w9a8siw0iXwHE38sUVgTi+xFL5
         3lnECwIXmWEiitAPTmj72hi0eXbRSjkmeyH3b+xjl1XJnhAif/ywOFu3YSzmfuf4ilTi
         Y9sX/m0qeRF358srtXKrywb9LUG2fRx2Q9u9XXM2jPawvP4nunz5MUu+5cGZ9HI/Y/Tm
         enmg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777830589; x=1778435389; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBmCgnvKcuX/PJMbeE1+OyVa1S4vwoCbmzQD6Kq/fwA=;
        b=jnWGKdS2bX2sidvqhHeZ/JXiEvZSFBh4Hs3iuOW9UgJSNZZAgCnl3JgVkhmic26DfR
         kXYygVAVHc2OEpgAuXrMaXUail45rKBn1EoUyN2Hj8jkgpCpnkNcrv59HBsRn31x+DdM
         7Aby2pjMyvEWZO+Eq5sXNoX5bE5AiKL+LaOEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777830589; x=1778435389;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBmCgnvKcuX/PJMbeE1+OyVa1S4vwoCbmzQD6Kq/fwA=;
        b=HuBB04Wkv62Nw3hsGqOPErPJp6lczSV8vSYXNcKYzFlB2zJd1pkui+E6ykm62aBUBn
         qFwFhI9MLRH9z/dJUkvlQ+QiaOwuCMtbMXnt5W7fiajoQZzZGOpvfx0HwL4u8e3BY9f/
         41QX3fcWMHJXLgw7e576xrmNFOOhr7Udw3J/AzJ3ybo5GQ88xirmzja4o200L/BvBz+7
         xyM48kO9iUBh2Z9+HLrPcb8aj+zLQj4bBkBy5jSg6uK1PQXK/L+Uu8to6rI/XXmosN78
         UAqvaTC/MLiOqVYf7yaaA4hBebjCH+/dVV0OMlwPRE1GCP/hnV6H10w7ia0V+RPRt3Q4
         ilsA==
X-Gm-Message-State: AOJu0YyknnJ7ClWoiGvOJWHNHOEgGA7YdCth+8GRCdDOSUooj8NblaKn
	YsXWw09lo+2yszC+MJLkACDImSlEBL8LiKlqMeujD2UD7FK4KJNineE9yPHLd9ubaKdGSNkWVV1
	jQ2C+4BV1U6r+IMjv4eox3NQDkbptASmM4fXNtOf0ludbx1R0QkYh
X-Gm-Gg: AeBDiesbcJF6FvHJyGjLfuj1r2awuNIY9J/9oGcUloPEqK0W4le5hmbHivJaHeAGvbz
	mKR14CLohEjOpCrst9ayd3lVy/wYuFK63GVadKdM2ak2LVnWsFnymb/wT0oXKzoXLg308O8u5me
	r+HWcD5fs0Gogex+41hiAnghIk5M0PakKXALYHwWrW+fYLo8/j9nIquaeM/OvAb4JBV97k6ou1t
	1Z18hbLOrVBo/0qdFB5cv9xxyFvQUAnLL37HUlkWMiryS6Q+nR67TVW8n0rMc81K1BaaA9piD7x
	3D3erFypuUWBSUUb8A==
X-Received: by 2002:a05:690c:660d:b0:7b2:6b19:df2b with SMTP id
 00721157ae682-7bd76fbd8e4mr74203787b3.17.1777830588725; Sun, 03 May 2026
 10:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260502205501.185550-1-tim.orling@konsulko.com> <20260502205501.185550-2-tim.orling@konsulko.com>
In-Reply-To: <20260502205501.185550-2-tim.orling@konsulko.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Sun, 3 May 2026 10:49:37 -0700
X-Gm-Features: AVHnY4LFAgk2Oo1ZgyhIuKr9S-SJecZ9t_te6ZcD3hnwgzu0tWiGQhQbIm_jM3w
Message-ID: <CAOyo-876E0xjiJu8EJYGr4S13eUvJBGEOe6aAK=_8QU8_cvueA@mail.gmail.com>
Subject: Re: [meta-webserver][PATCH 2/3] nginx: log error_log at notice level
 by default
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b6478b0650ed7088"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 May 2026 17:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126771

--000000000000b6478b0650ed7088
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please hold off on this. It did not clearly fix the container use case and
might otherwise be undesired expansion of resource use in embedded targets.

On Sat, May 2, 2026 at 1:55=E2=80=AFPM <tim.orling@konsulko.com> wrote:

> From: Tim Orling <tim.orling@konsulko.com>
>
> When the error_log directive omits a severity (as in our shipped
> nginx.conf), nginx defaults to 'error' level, which filters out the
> entire notice-level startup banner: 'using the "epoll" event method',
> the version line, 'start worker process N', and the corresponding
> exit/reload events. The result is an nginx that appears completely
> silent on stdout/stderr in foreground or container deployments =E2=80=94 =
a
> common confusion for anyone running 'nginx -g "daemon off;"' as a
> container entrypoint and wondering why no logs appear.
>
> Set the level to 'notice' in the default nginx.conf to surface those
> events. This matches what upstream Debian and the official nginx
> Docker image ship for the same reason. The change is essentially
> free for traditional service deployments: notice-level events are
> infrequent (master start/stop, config reload, worker recycling) and
> remain useful diagnostic output rather than noise.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta-webserver/recipes-httpd/nginx/files/nginx.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf
> b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
> index 6d219422b3..afbd79f9ac 100644
> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.conf
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
> @@ -29,7 +29,7 @@ http {
>
>      ## Logging
>      access_log /var/log/nginx/access.log;
> -    error_log /var/log/nginx/error.log;
> +    error_log /var/log/nginx/error.log notice;
>
>      ## Gzip settings
>      gzip  on;
> --
> 2.47.3
>
>

--000000000000b6478b0650ed7088
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please hold off on this. It did not clearly fix the contai=
ner use case and might otherwise be undesired expansion of resource use in =
embedded targets.</div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 2, 2026 at 1:55=E2=80=AF=
PM &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@konsulko.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_bl=
ank">tim.orling@konsulko.com</a>&gt;<br>
<br>
When the error_log directive omits a severity (as in our shipped<br>
nginx.conf), nginx defaults to &#39;error&#39; level, which filters out the=
<br>
entire notice-level startup banner: &#39;using the &quot;epoll&quot; event =
method&#39;,<br>
the version line, &#39;start worker process N&#39;, and the corresponding<b=
r>
exit/reload events. The result is an nginx that appears completely<br>
silent on stdout/stderr in foreground or container deployments =E2=80=94 a<=
br>
common confusion for anyone running &#39;nginx -g &quot;daemon off;&quot;&#=
39; as a<br>
container entrypoint and wondering why no logs appear.<br>
<br>
Set the level to &#39;notice&#39; in the default nginx.conf to surface thos=
e<br>
events. This matches what upstream Debian and the official nginx<br>
Docker image ship for the same reason. The change is essentially<br>
free for traditional service deployments: notice-level events are<br>
infrequent (master start/stop, config reload, worker recycling) and<br>
remain useful diagnostic output rather than noise.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0meta-webserver/recipes-httpd/nginx/files/nginx.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf b/meta-web=
server/recipes-httpd/nginx/files/nginx.conf<br>
index 6d219422b3..afbd79f9ac 100644<br>
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.conf<br>
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.conf<br>
@@ -29,7 +29,7 @@ http {<br>
<br>
=C2=A0 =C2=A0 =C2=A0## Logging<br>
=C2=A0 =C2=A0 =C2=A0access_log /var/log/nginx/access.log;<br>
-=C2=A0 =C2=A0 error_log /var/log/nginx/error.log;<br>
+=C2=A0 =C2=A0 error_log /var/log/nginx/error.log notice;<br>
<br>
=C2=A0 =C2=A0 =C2=A0## Gzip settings<br>
=C2=A0 =C2=A0 =C2=A0gzip=C2=A0 on;<br>
-- <br>
2.47.3<br>
<br>
</blockquote></div>

--000000000000b6478b0650ed7088--

