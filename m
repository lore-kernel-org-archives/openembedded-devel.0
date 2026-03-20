Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054C810987BB
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:01:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18015.1774026103729159945
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+oNT1B7;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so7871825e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026102; x=1774630902; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lsjhw8XdpEg4vTEZOrTsTajqiW6XHQ/Q70A77gYqMTw=;
        b=A+oNT1B77cDOtBW01LGYfpYIJRnxdKwkCAaFzrWdO1c5aOLUdWgPHwfpR/DeOMlQrD
         ckorUpN/77QMGhfGcLKHG+E9D+/+uiwwYQMDY+VTK08mu8Qic6OZrKW9g0aMcPvI6cS8
         luRVjOfosvJXVWrHIg1RiHPteZ7dfkFFCdpbzvN/Ewgj4VVTLrsON0l3grU7O795voCd
         opG0RUB1SGG/rBvRwX6rSFuH1VUaW3z55fL9AyJWkjfvIg8g5SVxoY07zfx0kVnBy51c
         IsAn6XJHHgIpqrx88jjfHvkfCgrPIzdgUy7yr8EBtG3Mkn1z/z9jFdl2KXfos/Wj2CMn
         e6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026102; x=1774630902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lsjhw8XdpEg4vTEZOrTsTajqiW6XHQ/Q70A77gYqMTw=;
        b=KwzFzLnd+OHgpVxLPd/+EEBDA8kcnRczFngWwOiNkLtldEqhEZWNPIQfKV3zrMhxlV
         2386I3zL11coxAV/9eykD3eANNssmgPH7xOPepUuNsRwvOpmpamZxlGquJyzRBAy6qdd
         zYkKj7lEbxLcGzOuGVVKe9OMjsM2nl/ooCeMoeiF7IdaBXFxHmWKRZNIHg7izdcjW2kV
         I3lTBb3UaoeJC8yUKquF8IRYlPwj6HXKeehaX+76rlq9HCrf6UCg44feDT8VfUFMYR+e
         o0JWEqmr1MIzXORsZLk7WmhaKIBECKaf1YDZVWD2FbcTmuPIt1a4Kq72GVeI5oDDhcnp
         wEAw==
X-Gm-Message-State: AOJu0YzaO2IVrKeX2yZIGiEdgV+tTRD04hbuYkfcuGYwgR3Jrphbf1uS
	jaXLjjL9AH8pxBq6arfpHoQTGY0QnHfQNixvfhnSPlqGHQhdWsHw/CI9
X-Gm-Gg: ATEYQzxrMn7aVqbZrXa83KsMS4bxDUgFGoPDyapCAY6e1UYlJwbIMx014mSiQKJQekq
	z495Wt8kTe5YzcXVxB3cRZft25o2Bxr2IHNpyU51gelKzIeSvL/pXxqZj38NLjihnnSYTp1oLsV
	pBmFvRPy59UfYNyrfLeGl0eGjvODhJ1nf4J2kg5wzE0C9PMAjDxQG1AjrN9OfWq6mcUAa6CiWzc
	jDA4/6Hju9Hg1Cuq/PLaiOLcpfo8OMcaQvS7YvJPJP9nLcO5C5UFIPe688X3b5zT7S9h6JfSPJb
	SWAfrkB4Z4M8iHKnwxhi5HHES28Llr+o3fUCqa9ORmDs6HdR/EDGxjT+vVjsJU1xjK3gpOkvDld
	Az/09bs6PA9hviBwtSJfjSUJk1i0kn9GjW6PSmYEZixO57ooF64xLcmRKHbbU0sr2TU0OQZoV/o
	Uh/DHhfAov0hPYjYvq3sYWwoQH3jt5nzk=
X-Received: by 2002:a05:600c:828d:b0:485:481c:e7bb with SMTP id 5b1f17b1804b1-486ff027c3emr57398695e9.20.1774026101731;
        Fri, 20 Mar 2026 10:01:41 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7d6c54sm181180465e9.4.2026.03.20.10.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:01:41 -0700 (PDT)
Message-ID: <4efbf53d-8e2a-4494-afd8-8c73300326f9@gmail.com>
Date: Fri, 20 Mar 2026 18:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH v2] samba: upgrade 4.19.9 -> 4.23.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260320083033.2703890-1-skandigraun@gmail.com>
 <CAMKF1spZyOr-=86hia5ittUnTXXXuxV8rRiyEeT5r67w0pPtuA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1spZyOr-=86hia5ittUnTXXXuxV8rRiyEeT5r67w0pPtuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125440



On 3/20/26 15:50, Khem Raj wrote:

>      SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>                 file://smb.conf \
>                 file://volatiles.03_samba \
>     @@ -24,11 +28,11 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-
>     ${PV}.tar.gz \
>                 file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
>                 file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
>                 file://0007-Deleted-settiong-of-python-to-fix-the-
>     install-confli.patch \
>     -           file://9aa5c43315d83c19514251a11c4fba5a137f2821.patch \
>                 file://0001-lib-replace-Implement-memset_explicit.patch \
>                 file://0002-lib-replace-Add-test-for-memset_explicit.patch \
>                 file://0003-Replace-memset_s-with-memset_explicit.patch \
>                 file://0004-lib-replace-Remove-memset_s.patch \
>     +           file://use-xslt-replace-function-when-
>     available.patch;rev=need-to-be-applied-manually \
> 
> 
> use apply=no if you want patch to be created in build area but not applied.
> however, this patch should be applied to oe-core docbook-xsl-stylesheets
> recipe
> the recipe should perhaps also swtich to using https://github.com/
> docbook/xslt10-stylesheets <https://github.com/docbook/xslt10-stylesheets>
>  for sources as there seems to be newer releases there 1.79.1 was
> released in 2015
> 
>                 "
> 

Thanks, deep down I had a feeling that there is a better way to avoid
do_patch, but couldn't find in the docs.
The oe-core submission will be left for someone else, however.

