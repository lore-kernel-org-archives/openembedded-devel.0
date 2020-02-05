Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 41D1360572
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:02:39 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id v195so3647654qkb.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BamsPVscb3FfdIhcQ5/Ju/gHKT68rIGTJuZt2cr6esI=;
	b=qgB4Qs5plCes+xca58zs5q7qbncTKWNlKcRb2pN4jqmE+N9y70N+m2PYKgx5KJzAY1
	la9MvelEMgknt9Sgu8PKs722AmVc8WbfT+luBeVn2IirubINF7KDWhwysO3MKbgkURu6
	OGMbf0GoPzK8zN5mx16eibFxfXjLNOmMHgzMKWH0KIqVoyruWHicxzF0sOBLbGlqupf4
	f5mOBEdAG/8X3xxhs9RnPITfjytGqxojdHs+L+GQ4C4Xb3DqSHozRpfrdEHUgX2i9n3O
	O66C+prWX/7iFYAgikT4omtCQ7AMHEPl7+4S8Th77bSflkSMTsgCAlB7dp6dLMZC+FnU
	Pu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BamsPVscb3FfdIhcQ5/Ju/gHKT68rIGTJuZt2cr6esI=;
	b=kZ3OdldiGlp1pVHEiNfiaWTqPfKiLVNw1BPl9UZ+g7ZeLaXZwp8o77Z47VGUPCF6fx
	rU9JU6OVMUPX09hS5CF/Xtn/BC1HCD2iig5nRVmY6pRhLXm2WAh1yd3b2gWNvxYBtXtS
	2olweqN975ed5epngSiGGrgbFjDe3HCWqYWxTJfBQYVOr9Nlj0gcy+7jdqmuepuiLoHF
	ibg/25BGPrUWJUt/gB8bhLGe/xhSwWiEe9vVo+/z4DMgwDSn0EL7/qfxzUPg3pE3IC++
	vwCeXV3KvfY2AhJ9WTbRdK/0onmFA6kEuNTNYOaYtx5Yompxyd7ySAJXCVX0huI4uJtT
	w8Rw==
X-Gm-Message-State: APjAAAUfRuDVFcVIi76ls7iyo0DIhDNYCP7ygDp0uT7BKy9GW7a6F0Df
	N9YHwky9lOdT+Z/EvbvtTak=
X-Google-Smtp-Source: APXvYqyeKspGbkw5NylQ3rFpX1GdfA/v1cwDQWw9TohostjafifSGHxJTH6kjx/JenkUtO2DiamRmw==
X-Received: by 2002:a37:7bc7:: with SMTP id w190mr77401qkc.193.1580943760097; 
	Wed, 05 Feb 2020 15:02:40 -0800 (PST)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id a22sm644500qtd.48.2020.02.05.15.02.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Feb 2020 15:02:39 -0800 (PST)
Date: Wed, 5 Feb 2020 18:02:36 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20200205230236.GA18868@linux-uys3>
References: <20200205203053.6742-1-twoerner@gmail.com>
	<20200205210707.c4eqrvbyl7tl3knt@jama>
MIME-Version: 1.0
In-Reply-To: <20200205210707.c4eqrvbyl7tl3knt@jama>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mpv: 0.26.0 -> 0.32.0
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
X-List-Received-Date: Wed, 05 Feb 2020 23:02:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2020-02-05 @ 10:07:07 PM, Martin Jansa wrote:
> Thanks,
> 
> would you mind undoing:
> http://git.openembedded.org/meta-openembedded/commit/?id=0c182e58775966699c303c1e2561c273197bf445
> in the same commit?

Sure, no problem.
v2 on the way

> Also was this sent with -M?

haha, I know exactly what you mean! I did the format-patch twice just to
convince myself I had used the -M (and I had, twice). I don't understand why
there's no similarity :-(

