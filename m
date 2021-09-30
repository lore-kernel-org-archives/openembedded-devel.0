Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F8DC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 15:23:34 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.14193.1633015413630304198
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 08:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SYHOaLnR;
 spf=pass (domain: konsulko.com, ip: 209.85.166.51,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-io1-f51.google.com with SMTP id d18so8019914iof.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=CbTzeZv6dXVLObGR2tAnahuOnvJ84nxzyIh742Mo9b8=;
        b=SYHOaLnRSDe8z29mRmwl7VFPx3ujnez4F2kLMADJKSdNgGGV30Xzp2+P9UD9HYiW36
         xiH1FwrQU+bGwcxt+yG7+53zl1Nz+9i+7fgRGokO42dtMXgDD0rAz88u8PLPy0BBaMFU
         r0K+8vWuWb6HEp41zNsIk5eGMmvgyaSJAI6/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=CbTzeZv6dXVLObGR2tAnahuOnvJ84nxzyIh742Mo9b8=;
        b=c2QUjegX0ujaEOxZMCuRWTDwbrwoejf3Iyn5gls+0NjAAL4+eSfPM/X1zAFHJKqR/v
         lgksKkkdMD8VaMNHJiqevzSc/XLvNEUGIJ5V0zw0rHD2P0pmCV8amiOP6FBxfFBk/smq
         Xqb2fUBDP9QCWJsLdoEeJOBvvrF36BSim3nWwJwyIf4bxGOejOtovawxVe8LL4ig9dZM
         OiZqqKn248mh9HI8zyd76ky1vZSikgdko0fmb7fA7N7fAey1JfWCyw7Wcv7WMMhyVCw6
         HBLjHWtLi3SjXnxBeLPvMVDtxhoFGM3kboVPAc8ugOHym5EWBmboSQFXyQDQabfib6E0
         It9A==
X-Gm-Message-State: AOAM533d7OcKL4dWKU+UYZ429aHXF76d5dUBWd6PqIlpUCmb38VfFc9T
	xvbOO412Gq1+UktFQiUuw6fxkg==
X-Google-Smtp-Source: 
 ABdhPJw6L7wjBIf74J0vQU7actV6tdm/ed4ch9+kyy5lSvpP/lI+ZJvMfBvVT+hoMMHFSdZzWUsyMw==
X-Received: by 2002:a5e:d618:: with SMTP id w24mr4366832iom.178.1633015413027;
        Thu, 30 Sep 2021 08:23:33 -0700 (PDT)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 f7sm1934785ilc.82.2021.09.30.08.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 08:23:32 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:23:31 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: LiweiSong <liwei.song@windriver.com>
cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH] chipsec: platform security assessment
 framework
In-Reply-To: <20210928092958.19196-1-liwei.song@windriver.com>
Message-ID: <5d1e1868-add6-a677-f179-8ab2756a95c@spiteful.org>
References: <20210928092958.19196-1-liwei.song@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Sep 2021 15:23:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93181

On Tue, 28 Sep 2021, LiweiSong wrote:

> Add chipsec, tools to dump or analyzing hardware, system firmware
> components, like PCH register, ioport or iomem configuration space.
>
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
[snip]

This sounds like something that might be a better fit in meta-security?

Scott

