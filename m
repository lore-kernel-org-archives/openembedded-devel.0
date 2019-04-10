Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6707D831
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:20:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44fPsF1zcNz4b;
	Wed, 10 Apr 2019 15:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554902401;
	bh=bBGL87jHO7U2knJXoAykJ0CLon+/bcLQtOMbtWA9nNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOoYydmkaLmNwBOs4o5NjS4PTVhzTc6Q9pYG9v6X7yKJiwalccLkvAAK1OckyA3J7
	97uZXQqLUFjltdXWEQnxBhaS61hUxgHgnR6OyI28nlqBjuKS8L2IQNVekPsAwAMNwR
	tkuBh3CWiNanIqlLaCgHwgU0Whf3J9dHAWjtlMrBxbMYXLmXBSHh7S5MLi9j948pQm
	CMPe8H/wv97qnGR6xLbM6n23YH/mD0+hUeL+R95XWR4bYBOAh4yzeRMNRTqTtLb+ak
	4kGB9wi09NdMQ229wE7ct5NjuTDYnEo6jL2ZeebHpxfS7wcGeiev7lsVPrruFvVSQO
	EBGzwlGcswbkPTPueXsg3+Z5UPG/n1p5yC7cGqlM4cwAGa44R/ugUgp7THI8BtvEQc
	Rh+Suyc5ksDGnPEkbNZW5emksmEpdeEd2CUoHxQBZmr34K3yNoGODSaDJltQbAGw2b
	9S0H+WofK0UtYfR6ZblScIYjtvwt+oAB2eAOCt2KggIJsmu5m2SURTohIcEGu6ejzv
	eXk2Z/TABaEQJMjRLWK52reLwTYSNS/Mr9kSogdW3lqaWrqQ9H9xTbWR9K5AcYg25K
	iNdthK+EcNh/GLS85Cc6tjF0kVb5MBkqMZXu/i2kRuYI8s84KkAY90kDEkfZXg9RrT
	UXR+J0p4muG9GNdN4W8PF8BM=
Date: Wed, 10 Apr 2019 16:19:59 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Nathan Rossi <nathan@nathanrossi.com>
Message-ID: <20190410131959.GA9487@localhost>
References: <20190410123743.28863-1-nathan@nathanrossi.com>
MIME-Version: 1.0
In-Reply-To: <20190410123743.28863-1-nathan@nathanrossi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-filesystems][PATCH] fatresize_1.0.2.bb: Add recipe for fatresize command line tool
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
X-List-Received-Date: Wed, 10 Apr 2019 13:20:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 10, 2019 at 12:37:43PM +0000, Nathan Rossi wrote:
>...
> The Debian version of the source is used as the original upstream on
> SourceForge is no longer actively maintained.
>...
> +SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https"
> +SRCREV = "3f80afc76ad82d4a1b852a6c8dea24cd9f5e7a24"
> +
> +PV = "1.0.2-11-git+${SRCPV}"
>...

Please drop the -git+${SRCPV}, this commit is exactly 1.0.2-11

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


