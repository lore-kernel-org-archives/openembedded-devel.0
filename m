Return-Path: <hughsient@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A999EC4167B
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 11:32:01 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.146533.1698665515727940661
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 04:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AChqoNJc;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: hughsient@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-77891670417so106605885a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 04:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698665515; x=1699270315; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqm2TQbuRJsIqxPnAE1OXKqWSmyT0uaNa1EJWA0ShJM=;
        b=AChqoNJc24/R2WuVi46qhgcnnVjfA7Gs80BUZpuNDKw60Y4q49XjEpW6nNjb4Ee+hi
         +SMTrXv20ebIpKSJKVqCTulYLb9uhjCrsZsC++4cOcsBBQu9xl8677wc7V1394TroCeW
         asxUB4NsSaHI0ezSowvObDTt798vYzQCKUPc0YyEuaTsuUhcuUhGUFgleiUPEVHC1Qgk
         OJ9CvLjsjykjE9DrTkruCFkEJmDDeMIcdfWwY/cO/55EkKCCDcX3H4xULiat7h0R4lOn
         hDSXwPGUShziNy624EkS5rY7oEhaVKsSa3l3EA71ARpm18vyfMIfZHlruOG1k5FqcpY0
         txBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698665515; x=1699270315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fqm2TQbuRJsIqxPnAE1OXKqWSmyT0uaNa1EJWA0ShJM=;
        b=iAUQof/sYkJE0oOgehHg9MNY+eqdBqwKaaFREw+dhWJ+FOB92933JKvyJAtfyE0tiJ
         60RHqIrz1sibkKKN55Jctt1LGMkB0Xf/W7BPtEw0ncV96osGyqFAWChbVtMfjIeXH3p2
         1sL1odRfvbQ9vJVrRX4e0ObwiB13f0G8eVGn7wL8oPMXXvn/C9CXG8ESPvFP0H7lTnpe
         Trjund7E6xo4dGjmMzHu10VisGhoFtt7+mMQNQoRuDSdVMQl+fLVhf1xMnu2UlYDHVN6
         qJ3sEk5kQXvKax8u/+k5BF7wagTg4QmRCv4hif8RPKbDdpbOJ62UiFArVuCrGkIgNi2O
         WgMg==
X-Gm-Message-State: AOJu0Yz1WFbiExPMnYiYa56a5jWvekUK/aDXfNNm6tw7XSu+PRAP5t2p
	b7lu1vDTNwHG/rwLDvkXslyjku+jhcaA5Jc3t6E=
X-Google-Smtp-Source: AGHT+IG1hgwLXCupNv+r9e1ay2LxGRnvlROEojYvkcG564u3vQ9k6eVneRxpgtem/ybN6HCtg/TNNjhktkhiJN6qXdQ=
X-Received: by 2002:ad4:448b:0:b0:66d:1b9b:1964 with SMTP id
 m11-20020ad4448b000000b0066d1b9b1964mr10225569qvt.2.1698665514736; Mon, 30
 Oct 2023 04:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230507163305.3261044-1-akuster808@gmail.com> <20230507163305.3261044-8-akuster808@gmail.com>
In-Reply-To: <20230507163305.3261044-8-akuster808@gmail.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Mon, 30 Oct 2023 11:31:42 +0000
Message-ID: <CAD2FfiEvMk+zQSK0db+nP4wNNp74igf3fP861w-oY-R-UH+oGA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][mickledore][PATCH 08/29] fwupd: Do not emit build
 time paths into generated headers
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 11:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105791

On Sun, 7 May 2023 at 17:33, Armin Kuster <akuster808@gmail.com> wrote:
> Fixes
> WARNING: fwupd-1.8.9-r0 do_package_qa: QA Issue: File /usr/src/debug/fwupd/1.8.9-r0/src/fu-plugin-builtin.h in package fwupd-src contains reference to TMPDIR [buildpaths]
> +Upstream-Status: Pending

Pending? Did anyone send this to upstream, either as a pull request or
as a fire-and-forget email? Someone pointed me to this patch today and
it's the first time I've even seen it. I've created a PR here:
https://github.com/fwupd/fwupd/pull/6297

Richard

