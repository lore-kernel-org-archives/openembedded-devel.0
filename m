Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 670167E75D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2019 08:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45W7mS1f2qz3Q;
	Sat, 22 Jun 2019 10:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561191656;
	bh=5HM3sqavvrlBSf7/0oOtmLg2DecR3rKqYW5xBXQZtUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gy4RlvbYTBodTzD5mAGn4XF4LgG7geyhmwgb4Cpt4CNyBYtzNX+QE8psPu9fwfI5U
	duCCcSVMn6PMfFsX9PQ1sIHZiMGWGiQv44hTCm/LU4w9ahgNEegcETLI5qTpQGRQp7
	MKYhAoygJ3UhCtOTrAcYevznAWVuhrsXrYG3w4yhW+lsf8RB/aW5pg4KjczPgnTqAK
	vulnzIp8QjGzSPr791WNwHWUp0RxnuLjRu5Va4eAIqKrHSNMG+8xoEiFf4AyApuqbX
	9vm9U4j2r+Ac+EXVl3JkxRjqmRWpfgQBltLybdN9QQT/Pl2SBBZvURvrN6eOynCOF3
	twfVuYNIedEKWuSkyFH4K6S2tHm22+OyMWhXYfiog01v9tpfeM7WhFcP2taozD1Den
	D5LcLSpxPJfh+xHBWKx3SfJH7QcTqDiPnCie9j7k0OybokUZ/kf5a3KliE7L8KZoep
	vuBQuPIvu6rfEV3sWnPauI1+UK4um/Wk9lbvLFV9VUAVFGjZf5VnV2zVAulStwHn+h
	lWNp7a5LTnJx9t18Lh184BSMBsRG+PIiqo6BP1B0DhL+3eciirRFwHRwXaxo1HgQAW
	9/vYzS3r87iY5QmZt9yqkd7TlVqHUa21s3UIwiOQqdMruMOwCGv5K5VNgF4MNPDwLp
	mtiW2Bi8bGhMsYlliex28sI0=
Date: Sat, 22 Jun 2019 11:20:52 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20190622082052.GA9472@localhost>
References: <20190622014747.8719-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
In-Reply-To: <20190622014747.8719-1-open.source@oleksandr-kravchuk.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Sat, 22 Jun 2019 08:20:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jun 22, 2019 at 03:47:47AM +0200, Oleksandr Kravchuk wrote:
> udev is now explicitly requested.
>...

What do you mean?

If udev can no longer be disabled it should no longer be a PACKAGECONFIG.
Otherwise I do not understand what you actually want to change.

> -PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> +PACKAGECONFIG += "udev"
>...

Why is ipv6 support no longer enabled?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


