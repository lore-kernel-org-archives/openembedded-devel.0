Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D65EF7EE93
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 15:32:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45s7yr2pwJz56;
	Sun, 21 Jul 2019 17:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563723140;
	bh=PeKPK/Ka3/Y2AcerjKchmfQTXSOibWgo3+JbUou0sPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWfTv0xvLM9IjlYhXlkvP7qdQv+znT1VcWOnmY02nNpO3i+l+W9bd2PFCQTXEpUAp
	FZo+KXMrgxQh2nZa+2xCeIwZSI62U62ZR2EWwWW2Hou6Q235rABYpt8piqa4loHAoH
	N5m3EuPH4p9AsGFRvVX98kV1yu+GHpN2dtbtwdCBXpZz3qjx7HrcdMV4lq+i5iX8Ea
	iCZ9s8uP7pBkaq0zP8nCJmDRYid9w0DL4Ojf15DMbWj7R55Z5GYKh4FtV0GrC1tOGM
	A6puFpDtYXyuyYclF+xGc19PiAte//VQ3Ut9E5BF/zyoDRTNX6skFhEAyZB8QzyeCl
	0pOzbzvr1C/8i8At2ordFVh7/3XzMbLm8hW2nRbubeGg7IuGqCVXx3zJ+Wqiad+WNY
	VDto7EKhrVaCXt5Rlorp908v8df9SIexJ/k0M7Atui5QGRYhD981ZVroJMuDfDP0W4
	rAHiJQK2KzsgHRh71clxz4J2gTUkWRUKX9AO7U3bYMJqMS6hhtFpV7o+/j5RLdkMVB
	b5ziw8nbLFzQyeA3+dtF+REYDr29rX2BhH4lkGNuLy4zHNM+OkB4bqjuSNYVGP4c18
	yxtEpLHmEsWBFQew0+nm39qSPFxf5uby1yIVK1lLTFvHoFabIPmFuqXMp1heniiebE
	3pcXPcwLva6QGShqHYtKW65w=
Date: Sun, 21 Jul 2019 18:32:18 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190721153218.GE5886@localhost>
References: <cover.1563719996.git.akuster808@gmail.com>
	<f18acea25953f5e0b2d5ebe5aa95c970c26f2ffc.1563719997.git.akuster808@gmail.com>
	<20190721152855.GC5886@localhost>
MIME-Version: 1.0
In-Reply-To: <20190721152855.GC5886@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior] 3/8] ndctl: make MACHINE_ARCH and ignore from libblockdev
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
X-List-Received-Date: Sun, 21 Jul 2019 15:32:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jul 21, 2019 at 06:28:55PM +0300, Adrian Bunk wrote:
> In master the commit
>   ndctl: Remove the unnecessary dependency on virtual/kernel
> reverted this change and did the correct fix instead.
> 
> You could cherry-pick the part of that patch that applies to warrior 
> instead of this patch.

Please ignore this comment and the oprofile one, I see you picked both 
patches which gives the correct result in the end.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


