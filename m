Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E7CC433F5
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 06:59:08 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.3339.1653116339029970728
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 May 2022 23:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o2GdGxpN;
 spf=pass (domain: konsulko.com, ip: 209.85.219.52,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f52.google.com with SMTP id p3so8768448qvi.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 May 2022 23:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=RhgFLlCtTZktfig/uBzbLZM2SxAYDO7UZ99G9E2htGs=;
        b=o2GdGxpNMspjb8z7vZvvPXg9pSS9EtVQKkO9XVzQ+xVLLcFa8XRVNEuFLCrQQdkqT7
         VA8RtYAhEO3L8ls7iSW/LopF+zAz+1ZfMbf0iAnhVu2dRPJ1n/0BYvf2dJgDxQPOABrW
         6EnYM8HnKVD7d/Gn0IPcp8m+lCSuEVqUkYpY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=RhgFLlCtTZktfig/uBzbLZM2SxAYDO7UZ99G9E2htGs=;
        b=R8TYaxaBlOqu7shPU+2LWFKshywFS91kRMIkQJ1qsDxF1u+ApGuriyP6CehvnPrEYa
         g5Ap+Dzeta7i9EyO11CU0Q+FdMSSdzEFafvqnR++KHeufprPnNEeFpq0VJRDsHJHUcPz
         Qi8NSe2W4H8PLZK+sPRV5Mv8R1dkUvplI9VgX7RV8y8DfqOR93j/NK2/l5sUOOe9taT1
         ZdZNb5eUPoXAlPTgyNTMHycFtwFvUt6+4mfTWT91dNP1Bk0SWC9smcttQuaOv5zu4/eg
         HZoYEhxqpVfzL71jXTkecmV1Evq2XuwKZO6GE0lHGK4Iw5zuIfYDnlVwjqGtGZIv9d2S
         u3eA==
X-Gm-Message-State: AOAM533zoSE4XU/ogSqoY7InzUVEz6aaMIbKFnqSjge3wRJBla7HPLSE
	bXDugbelHV68UVqB48QizpnqIg==
X-Google-Smtp-Source: 
 ABdhPJzHRkhXsSNPqn5ibxNFcnIG75RpOP0FSAAK1G/okFBUVTqTx1izIPAYpVpAz9lfRgxuNSF92Q==
X-Received: by 2002:ad4:4e86:0:b0:461:c6f7:fc5b with SMTP id
 dy6-20020ad44e86000000b00461c6f7fc5bmr10524487qvb.31.1653116338025;
        Fri, 20 May 2022 23:58:58 -0700 (PDT)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 k17-20020a05620a139100b006a367e8d954sm619819qki.118.2022.05.20.23.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 23:58:57 -0700 (PDT)
Date: Sat, 21 May 2022 02:58:56 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Markus Volk <f_l_k@t-online.de>
cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [oe-core][RFC PATCH 1/2] pipewire: fix build
In-Reply-To: <20220520125313.4115361-1-f_l_k@t-online.de>
Message-ID: <56b79fce-6f91-8b1a-8d6a-49c176b136@spiteful.org>
References: <20220520125313.4115361-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 May 2022 06:59:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97216

On Fri, 20 May 2022, Markus Volk wrote:

> -after updating to poky master i get issues picking the right udev provider
> -add a backport patch to fix libsdl2 build with pipewire enabled
> -allow native/nativesdk build
[snip]

I'm curious what your usecase is for native/nativesdk?  There's no
preprocessor or similiar tools in pipewire that I'm aware of.

Scott


