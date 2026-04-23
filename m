Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21AFF99377
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:23:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17165.1776943424741292155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 04:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VcJOqui0;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso41669725e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 04:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776943423; x=1777548223; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJAvGNCZAQncC7KBIfexkCqPdl4U0BxLhpAXJ372xAU=;
        b=VcJOqui0Dzr/+WkixDl2Ad2G9q7Erho6v34/24Hu+NQXzgPu7trvUMWe3oJhYB08oc
         SrGOVJ9M1O3HfXYwZ3uZGwPT07oFmYzsE6SxJgUt9XuSYULy1vvirXD/y5+0/EoOm7i9
         vzW3QdQzEL3zFKX/kTRmxPSmCKYsT5bRVLwzOTFivKfmMemQ4i03xgmBAPEO2iY5UWN9
         Q23y68N8D3si7g5f709uhReA7CQHEZkXG2BFR65RyNJxJfxJunP32rdjokfkwQ4/6neO
         NN/GgUhuQNRQTTHtqPUh4YDH7JaoQzKXCUgs3tIo5mD7dR/WItHnQHk6qM4lp1f2Urki
         ZtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943423; x=1777548223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJAvGNCZAQncC7KBIfexkCqPdl4U0BxLhpAXJ372xAU=;
        b=CR7BIC3ivW/B/9vZtIqarqlag9y3kO7o7sD3/7DgNiNVD7zzAjwdrkPB5tR3H70ZmT
         +vJ+M62WOZE2ghGD9ySAzeKZX1AyG8rR9AfISPLYeqCe8B0Nqkk53hsP4G6qC6BlDGSy
         INao+64ErmQkqgs4TMADv819KCKwbgHsmHKYhE6yj0CoATpeuzNaYG+nxBwHCfZQfNvZ
         hjLz4DEjywQvoAHed2hpcNQs5Z4jJhCSbZgiTyM9JsUtMJoL2q80TAOGlxy1WfhH1qMG
         dqQVviNfqf9IwOEYwZqdj2kw8x5mf2xHP1o8kHDz8JpFBpAsn+HYrN/4m9p0TK9EBSOI
         yPhA==
X-Gm-Message-State: AOJu0Yy5YxuOdg/vsSGn93ht8MseQQs2K+PpfXjWUlstkfD5clTZZ6MG
	1ckNbfkttsMt+F0o+t0JEqYYQHZNGoCGF30cHReSHbukyANl4sCq3rQJ
X-Gm-Gg: AeBDieu1pQh1syvAc3PFVRgeA8h77WRFaPcY7MfFE/DB3dM4X3tK/JznSg0PP2OX+z2
	BoyGMZNQLDOPLQ3pAkPkvRchlXWpYHbeJ83WxdZ4xkhlg31i0LfeEKLJt/4SSxFnI50DqoVPfho
	+a+FSrrJmJh+HJ49Wc1hWAX8EIeFvhYr6dJHf0YYuG9+YwX0EPYXcemmg3i11PYuI/lyM8Aq2C2
	V6jO7IAbx7660e0Yuxe1lnEjllNoihzgF8PnNW2eiO6Y5tWyGOj0Q5VeoLnH9V4+//Fw/WV9cvf
	HiIRcHJuChDJbkByy1YwO5FdMKokl+w2V8qc479AjWo8x+myhSvka9c5sfxHWrGgmVnD/do0qIJ
	yTKSaf/sfMO3UEsvesSinOr+zCqQUfCEYFbCdrgsLN0pHd6LV1XoY7PK7xGelKnAHIMWgopZ9Z+
	ZuFcCpiFRp9L4bo/LYwPQooHlTttptHJvWc9iRHv+7nA==
X-Received: by 2002:a05:600c:4e14:b0:489:1f08:91b with SMTP id 5b1f17b1804b1-4891f080a7emr241323455e9.16.1776943422928;
        Thu, 23 Apr 2026 04:23:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2716sm162328075e9.30.2026.04.23.04.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:23:42 -0700 (PDT)
Message-ID: <0cc2e663-32f0-4ddf-8653-b756e4953963@gmail.com>
Date: Thu, 23 Apr 2026 13:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gphoto2: Fix build with clang-22
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Khem Raj <khem.raj@oss.qualcomm.com>
References: <20260422013925.1791148-1-khem.raj@oss.qualcomm.com>
 <ab02ec5f-3569-41d4-b846-93a51c8002db@gmail.com>
 <CAMKF1srSFo_+pWhhQXsoHykcZK7FTp-5LJ5QbGVewUvZhF0jbQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1srSFo_+pWhhQXsoHykcZK7FTp-5LJ5QbGVewUvZhF0jbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 11:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126575

On 4/23/26 09:01, Khem Raj wrote:
> 
> 
> On Wed, Apr 22, 2026 at 12:57 AM Gyorgy Sarvari <skandigraun@gmail.com
> <mailto:skandigraun@gmail.com>> wrote:
> 
>     On 4/22/26 03:39, Khem Raj via lists.openembedded.org <http://
>     lists.openembedded.org> wrote:
>     > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com
>     <mailto:khem.raj@oss.qualcomm.com>>
>     > ---
>     >  ...hoto2-fix-const-qualifier-violations.patch | 73 ++++++++++++++
>     +++++
>     >  .../gphoto2/gphoto2_2.5.32.bb <http://gphoto2_2.5.32.bb>         
>            |  1 +
>     >  2 files changed, 74 insertions(+)
>     >  create mode 100644 meta-oe/recipes-graphics/gphoto2/gphoto2/0001-
>     gphoto2-fix-const-qualifier-violations.patch
>     >
>     > diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-
>     gphoto2-fix-const-qualifier-violations.patch b/meta-oe/recipes-
>     graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier-
>     violations.patch
>     > new file mode 100644
>     > index 0000000000..a8f85d034c
>     > --- /dev/null
>     > +++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-
>     const-qualifier-violations.patch
>     > @@ -0,0 +1,73 @@
>     > +From 55edc241e9b61b14153c61fd0baaefac927ad89f Mon Sep 17 00:00:00
>     2001
>     > +From: Khem Raj <khem.raj@oss.qualcomm.com
>     <mailto:khem.raj@oss.qualcomm.com>>
>     > +Date: Tue, 21 Apr 2026 17:39:43 -0700
>     > +Subject: [PATCH] gphoto2: fix const qualifier violations
>     > +MIME-Version: 1.0
>     > +Content-Type: text/plain; charset=UTF-8
>     > +Content-Transfer-Encoding: 8bit
>     > +
>     > +No logic is changed. The patch is a pure
>     > +type-correctness fix that makes the variable
>     > +declarations match the actual semantics —
>     > +const char * for pointers into string literals
>     > +or function parameters that must not be mutated,
>     > +and char * only for owned heap memory. This
>     > +satisfies Clang's strict qualifier checking without
>     > +needing any casts or warning suppressions.
>     > +
>     > +Fixes errors seen on clang with
>     > +  -Werror,-Wincompatible-pointer-types-discards-qualifiers
>     > +
>     > +Upstream-Status: Pending
>     > +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com
>     <mailto:khem.raj@oss.qualcomm.com>>
>     > +---
>     > + gphoto2/main.c | 14 ++++++++------
>     > + 1 file changed, 8 insertions(+), 6 deletions(-)
>     > +
>     > +diff --git a/gphoto2/main.c b/gphoto2/main.c
>     > +index 5a3c5c1..086f9df 100644
>     > +--- a/gphoto2/main.c
>     > ++++ b/gphoto2/main.c
>     > +@@ -146,7 +146,8 @@ static int
>     > + get_path_for_file (const char *folder, const char *name,
>     CameraFileType type, CameraFile *file, char **path)
>     > + {
>     > +     unsigned int i, l;
>     > +-    char *s = NULL, b[1024];
>     > ++    const char *s = NULL;
>     > ++    char *p = NULL; char b[1024];
>     > +     time_t t = 0;
>     > +     struct tm *tm;
>     > +     int hour12;
>     > +@@ -339,18 +340,18 @@ get_path_for_file (const char *folder,
>     const char *name, CameraFileType type, Ca
>     > +                     b[1] = '\0';
>     > +             }
>     > +
>     > +-            s = *path ? realloc (*path, strlen (*path) + strlen
>     (b) + 1) :
>     > ++            p = *path ? realloc (*path, strlen (*path) + strlen
>     (b) + 1) :
>     > +                         malloc (strlen (b) + 1);
>     > +-            if (!s) {
>     > ++            if (!p) {
>     > +                     free (*path);
>     > +                     *path = NULL;
>     > +                     return (GP_ERROR_NO_MEMORY);
>     > +             }
>     > +             if (*path) {
>     > +-                    *path = s;
>     > ++                    *path = p;
>     > +                     strcat (*path, b);
>     > +             } else {
>     > +-                    *path = s;
>     > ++                    *path = p;
>     > +                     strcpy (*path, b);
>     > +             }
>     > +     }
> 
> 
>     Is this enough? Variable s is still used a few lines later as an input
>     parameter, but now it has a different value than before this patch.
>     (Admittedly haven't looked deep enough to check if the difference is
>     significant)
> 
> 
> I think p should be used instead of s in that function call
> 
> return gp_file_get_name_by_type (file, s, type, path);
> 
>  


Yeah, that statement caught my eye too




