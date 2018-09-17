Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 62F1379481
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:10:46 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id g197-v6so9157166qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 08:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pCVlRyhIbXZvSB8lsrYHTGOPA8fMUfpWNm/ZprhxeKE=;
	b=fFtgp0GvFzfkryn2h/HAsD6YUWJndWXxD6h4jmCK6Cq2ck4zP3DN+b47R1dWvrg+Xh
	zicr55oMbaxxpsyZ7KWyB4ezwBaWiXZdgv0Il5JHCBdld1UayOCMAjaaeHzbeEdX++ix
	IoZd0ZPrSPFEECt+RVFm7i4mXdkxytLHCxVa34aTsrgdaCDIGKDW14nMVXdhiDekxdYJ
	xAE+Q4zeSQZ1onDfhnBA+YIYdtZ4fofTmYdCRUlCu8nAJmQXJdpRBnq5pQdS0s3lpfPx
	ag/l26wB9UZaDjGQM1L7kBnWjZOW+PyiimTrhwfXVmCze9MPXvdjq/YpVrn+/vmPP0RJ
	vkzQ==
X-Gm-Message-State: APzg51BbBEfP7AJEoDWDcGuLRpF2zkYNALroALr3+qGEaBSIdE4A6L9j
	XXyo1NmSlRAVqm4xR5PQ51T4MJ7n
X-Google-Smtp-Source: ANB0VdYOivKFGP4EkyeMOL4fZXWvUYooVO1jOupn81+5Ee94xaNTRoNLLuSVKb7YrPpOyxO7t7Xuqg==
X-Received: by 2002:a37:146a:: with SMTP id
	e103-v6mr17038783qkh.295.1537197047115; 
	Mon, 17 Sep 2018 08:10:47 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	c79-v6sm8909011qkg.21.2018.09.17.08.10.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Sep 2018 08:10:46 -0700 (PDT)
Message-ID: <0a5a90088e8a12ec2a3f3083544c545c60edbf94.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2018 16:10:44 +0100
In-Reply-To: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 0/3] ca-certificates-java: Fix usage as a native tool, do_rootfs failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2018 15:10:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
> This series fixes several issues with ca-certificates-java:
> * when used as a native tool
> * failure on do_rootfs

Can you share complete logs? I'd like to understand the do_rootfs issues you
are seeing (I don't see any).

> This doesn't fix all the issues and there is definitely a room for
> improvement.

What other issues?

> I presume that running it on the target doesn't work - at least
> ${sysconfdir} is
> not expanded in the hook.

True.

> I also think that will be best to drop create-ca-certificates-java usage
> in
> the postinst and let it be called as a hook of ca-certificates. This will
> allow
> us to remove some code and simplify both script and recipe.

You can't do that, because ca-certificates could be installed before ca-
certificates-java. In which case the hook will not be run.

> 
> It would be great if others could test their use cases;
> and clarify them - is create-ca-certificates-java really needed?.

As per above.

Cheers,
Andre'

> 
> Yevgeny Popovych (3):
>   ca-certificates-java: Fix sysconfdir for -native recipe
>   ca-certificates-java: Don't fail when called via hook on do_rootfs
>   ca-certificates-java: Distinguish between SYSROOT and D
> 
>  .../ca-certificates-java.hook.in                   | 23 +++++++++++----
> -------
>  .../ca-certificates-java_20180516.bb               | 11 ++++++++---
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 
> -- 
> 2.7.4
> 


