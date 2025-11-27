Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD5BD111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 22:10:15 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4457.1764281410570771084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 14:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eZu2/sLc;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: danismostlikely@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2ed01b95dso124502885a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 14:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764281409; x=1764886209; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcpEc9YECp9LHpI2389Aq0Vbx9C4qK1Tfg5si1i9wjU=;
        b=eZu2/sLcZ/rrSCLN+dajuE5wMT4av0Qmm+ZbZCWbiqEpKN6XdEACGDrM27ZT2E1N+I
         ZkwwVKJTyIg5Gcw0ZINrBiSPKnkPQ7/6CrcigP47uSZWALWEm0XON3s+Im52DrPwd3f3
         aFjlZ6AwWd2kW+SXU4ZEPAUu2921ggvpvk4/4t2lN28M32MtQ5nxke8r6aTVCrtzkB79
         hrOjUrLGi42+Lgz/yMVtGEhV5dm7IndT1A7IDRtJ8Fl+TBFLXNSzW0oRjypWHYiNCu2B
         mboYoAzy4aftCRWZs2NYov/scs6fSiPluqd2B3o9HnE2+KYmiaqxSglYX/ePfaXVAFqd
         GAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764281409; x=1764886209;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcpEc9YECp9LHpI2389Aq0Vbx9C4qK1Tfg5si1i9wjU=;
        b=aNEK0u026gCUMkSYEbd8i7Oo6ul6C8bfAB3KE/qkQPwkPcbQ6ftIvSi7u4l944qIJ/
         RHp1iw2g+sDVrSgfixE8+n/FJ4vEjD+oSel8rApLfrl3dpqlNmQezzYpIhLhG95uXxp9
         JUwdYWX+DVhr9FM+cbePO/fCqP4cDT8O1CzXFUOqZe3hwG8aIunbFD3niRseqk/hX+Ea
         Uk8xpUYEoztODudxf0Pgz18JW9FnBCcvCa9YRpH5H4Pb1PbhUzUW1NG35w1xovpAcgF7
         QCgQYbW7BM12Us4Qz3rQg9cpNfjbgIhIzDjsdxc5G3Xm+cQD2zg6cB16MQ8c6SywtC/M
         7edg==
X-Gm-Message-State: AOJu0Yz5waziLKyM8pcfNfiLZzSAjJdd/zk6Ol3Ab2zrmP+4l10vjWeA
	Pqcpw8+ZXHB0ZtUYQTnwnAgwZWOs55LTYVoz/WqDv+LP14JyTuZ0s1rS/hCavVHY7L+Vi9Y31ET
	1VZVLwUyn+z88mwhfECtnqYKK73AxgwQ+tg==
X-Gm-Gg: ASbGnctqHI/zQzhjCZF4+D3H1b1VVy1BylRGK3+ohUQGu11wk5R8y0PusBJvJzQOKBP
	L4ka4HEpNVEfcRBAzdS2vjtLXze7c+OY0AedylAiKWZE/BLDu8TGCzBcitNzTW+BPUnWUqRDzuA
	+FLrOXF8c6h1hfAfOUQm6g444+jEsDOHBBwBH15yROez2KRMCkGQxKMtFGiJ4am4c6O3uMLIudx
	FrGB58yucHYvh/3EbGhIcv8mqjsx/KlcD53taeQ4yZ0q5BAEoOzhIIbnFWd+2RufTSlIjv4
X-Google-Smtp-Source: AGHT+IEbi8ku211EqV3MHubriRZcF1YDgCZdafMlYcSpMN9myjOnNbupPqEedYfs/aIiQ6r8a/47yquRBHvTW6IpG7Q=
X-Received: by 2002:a05:620a:2902:b0:8b2:9aba:e88f with SMTP id
 af79cd13be357-8b33d1d1000mr3434654685a.35.1764281409299; Thu, 27 Nov 2025
 14:10:09 -0800 (PST)
MIME-Version: 1.0
References: <187BF47DBA4F18BC.286755@lists.openembedded.org>
In-Reply-To: <187BF47DBA4F18BC.286755@lists.openembedded.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 27 Nov 2025 16:09:58 -0600
X-Gm-Features: AWmQ_bnmxq-p-Poy5WnmZn5LRFQKwOldDTs5QXP2QiNHG6-6HHXiKGSVFVOtWVI
Message-ID: <CACS+7ZQTVqjMRCis21nPa2Xikfg_cRWGp5hUg+cnD6EYJus20g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-requests-unixsocket: Update to 0.4.1
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 22:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122116

On Thu, 27 Nov 2025 at 13:41, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:

This is my mess up, but the author field is wrong here. Should be
Anthony's email, not mine. I'll send a v2 with the correct
information.

>
> python3-requests broke the http+unix url scheme with version 2.32.
> Their position is that it's the responsibility of consuming libraries
> to adopt their new interface. requests-unixsocket 0.4 adapts to the
> new interface.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> ---
>  ...ket_0.3.0.bb => python3-requests-unixsocket_0.4.1.bb} | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-requests-unixsocket_0.3.0.bb => python3-requests-unixsocket_0.4.1.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4.1.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4.1.bb
> index 94497b609bd..4485b89de7d 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4.1.bb
> @@ -3,12 +3,11 @@ HOMEPAGE = "https://pypi.org/project/requests-unixsocket/"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>
> -SRC_URI[sha256sum] = "28304283ea9357d45fff58ad5b11e47708cfbf5806817aa59b2a363228ee971e"
> +SRC_URI[sha256sum] = "b2596158c356ecee68d27ba469a52211230ac6fb0cde8b66afb19f0ed47a1995"
>
> -PYPI_PACKAGE = "requests-unixsocket"
> +PYPI_PACKAGE = "requests_unixsocket"
>
> -inherit pypi
> -inherit setuptools3
> +inherit pypi python_setuptools_build_meta
>
> -DEPENDS += "python3-pbr-native"
> +DEPENDS += "python3-pbr-native python3-setuptools-scm-native"
>  RDEPENDS:${PN} = "python3-requests python3-urllib3"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122114): https://lists.openembedded.org/g/openembedded-devel/message/122114
> Mute This Topic: https://lists.openembedded.org/mt/116505505/3617261
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

