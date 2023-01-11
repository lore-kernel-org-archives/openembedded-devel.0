Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9387CC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:34:11 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.28709.1673454847506850254
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gTHjqR40;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id e205so13129362oif.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 08:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eQMVWItIGgKWkN90bs8OoIZSy/AVsKt9iPbHdVoaa6s=;
        b=gTHjqR40hDqi+RXro4mu5TTOy3f091BhT0Z//wntszTmihP92McKvvGNlQnKILWYqB
         h7VGROyHKUzL7xEMSmj+If4VMSmTsPRNHJuXq5p9R5YvYpsYbRYlE0Uy4zRpLC62Y08O
         5edD+keD6i4uPokb6hE0iAlt6UsLAsWqRf/yvWSqYuqUhduiBVGzuQ9u57fPALjqTK7j
         cYnkjrUzz6XuKP3tqLciZHEEiwfADRbnkwV2J/rJLguorWd/yhA7rtxqRrI0QEq2MzRJ
         fD9dAjnFTSl7SQ8hZCyZAGsAmIkJWgRHOByvRV0Y+fAO2lweCFY1rE8D5376xO3GK4pk
         cDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQMVWItIGgKWkN90bs8OoIZSy/AVsKt9iPbHdVoaa6s=;
        b=5YL2DmFBBhhvyuVSLFR93Gz9Hvkw/kZs/s+QYAu1vNA6EazzhrBlLhs1Ix4j2UUaCt
         yJyZ0+LDWkIpHIv1dQowiQu9fr4VbkrATza6CbwKoVE1OHh5JPsJj6ha9iymCvDQegZw
         7UqmSDOTFu60LJ1NihNfrovKqRnoxDF3ZGDsQOlerRDxyUVkv27OooiSClmWe5B0J8GL
         JLqAc8nIh5AbcYTJoVKvlr24K7WUiCwWhPlWlX/smmIlkTls8KLq15dr3DafsyTI5K1/
         F8q+qtcVHXA5qncEwkmtCbVXAwtFu/9gGgRCq5ncgVWHvC7VTuM7IIqd5RAjjHASo2UP
         PTwQ==
X-Gm-Message-State: AFqh2koOjhjJ/pPKMftsFSxb4B8hcPQnfGuW3xSRkkHOYT7JY8MvAWXq
	y3ISiWef5h9y1yTzA2B6gfZ5+fT0vgX4NwKjr24=
X-Google-Smtp-Source: AMrXdXvzrbVq0P9/yq6EeEiRAoF4QGhsUeG5MwJGnuOaWiy2omS2qPnMZn5acR6DDHcf8sisOawUpEFC3eY4S042Gm0=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr4474689oia.262.1673454846637; Wed, 11
 Jan 2023 08:34:06 -0800 (PST)
MIME-Version: 1.0
References: <20230111122914.1175681-1-leon.anavi@konsulko.com> <20230111122914.1175681-2-leon.anavi@konsulko.com>
In-Reply-To: <20230111122914.1175681-2-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2023 08:33:40 -0800
Message-ID: <CAMKF1spRSEwoWS8NeDeTfa_Grg-XG0WXz3_MyoJ0AMho81SJuw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-astroid: Upgrade 2.12.13 -> 2.13.2
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 16:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100553

On Wed, Jan 11, 2023 at 4:29 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 2.13.2:
>
> - Removed version conditions on typing_extensions dependency.
> - Removed typing_extensions from our tests requirements as it was
>   preventing issues to appear in our continuous integration.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...astroid_2.12.13.bb => python3-astroid_2.13.2.bb} | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-astroid_2.12.13.bb => python3-astroid_2.13.2.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb b/meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb
> rename to meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
> index ca87ff013..fa22080d3 100644
> --- a/meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb
> +++ b/meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
> @@ -4,11 +4,18 @@ SECTION = "devel/python"
>  LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
>
> -SRC_URI[sha256sum] = "1493fe8bd3dfd73dc35bd53c9d5b6e49ead98497c47b2307662556a5692d29d7"
> +SRC_URI[sha256sum] = "3bc7834720e1a24ca797fd785d77efb14f7a28ee8e635ef040b6e2d80ccb3303"
>
> -inherit pypi setuptools3
> +SRC_URI += " \
> +    file://0001-pyproject.toml-Replace-with.patch \

this patch seems to be missing. Did you forget to add it ?

> +"
> +
> +inherit pypi python_setuptools_build_meta
>
> -DEPENDS += "${PYTHON_PN}-pytest-runner-native"
> +DEPENDS += "\
> +    ${PYTHON_PN}-pytest-runner-native \
> +    ${PYTHON_PN}-wheel-native \
> +"
>
>  PACKAGES =+ "${PN}-tests"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100547): https://lists.openembedded.org/g/openembedded-devel/message/100547
> Mute This Topic: https://lists.openembedded.org/mt/96198645/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

