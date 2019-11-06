Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8042571B1D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 18:23:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 477ZfM6YzNz9v;
	Wed,  6 Nov 2019 19:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573064604;
	bh=NR+kXRaaaamZTMJ8cbeXUmcoMk4vSAcvg8lYER1WM/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ap650WBEPDOesE1vPyFxY+ukyPp1u6kaPjCjtldV6xAUAn9k12fYKD4x+AIF6gSzL
	ktv004LWIvqvUWIC7lPwVgWuc1xGe8f1hbQo1dm7Le/Ia+oez9pat/i5lytXar/O2k
	boPNIxkNeDqW1gWI0nQT+hHTKN5YkVjwxAoQ877y68YTqf4McT75THZDaO0xQS4WS8
	MW+oKvUN/B1uRxb9wgmbJUPF5aa4eIcySs89JLKLw2IPposaOVgvTLnQoBbBiEBJyZ
	jkkd1bmxdcjmNqol+TXgygPlM3eZM6dsr1eMIyv8vpLQ9VhSiFp7i31GORC02b76XV
	CMq2OsdEAfS0ryS63GVtII0RD+Ryys3mezTp1ip2/vwb8qdZlTpDGbXV4Y1RiaoP0m
	7BG2jNczF+VCazxf2EnpP6ebcAhxgV0ZJ3QyBkLCDyBwERTjqBeEStrexHKE0FLXVK
	H8L22AABqoNzOlvX16KiuwIPO4TiDvJof/pD79Eu6Z1d+AbSNKtj+TnrwgB0AFf6NM
	w4JIcm7otMOrGwaJDYdcybJK/oTaXNx1CuJYSvgj/MyEKA2tfx8dYGQMQisL6IKDDe
	1HEWOtqAGM6qtKSYpzKe6jTAFMEuTZeX0vYj61XzUwKSYu5HM9xtwFC6qFBFS5WRvW
	e1tUJwX/8a6qx66AhCbNmc2c=
Date: Wed, 6 Nov 2019 20:23:20 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Martin Siegumfeldt <mns@gomspace.com>
Message-ID: <20191106182320.GA14721@localhost>
References: <20191105120031.6579-1-mns@gomspace.com>
	<20191105135512.GB20425@localhost>
	<20191105135746.GC20425@localhost>
	<ac4526ac0f8848e2b7984e032f11dc29@gomspace.com>
MIME-Version: 1.0
In-Reply-To: <ac4526ac0f8848e2b7984e032f11dc29@gomspace.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe,thud][PATCH 0/6] libiio: backports from master
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
X-List-Received-Date: Wed, 06 Nov 2019 18:23:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 06, 2019 at 09:14:46AM +0000, Martin Siegumfeldt wrote:
> Hi Adrian,

Hi Martin,

> I see - can you please confirm that this constraint applies to Zeus and Warrior (which is also stable according to https://wiki.yoctoproject.org/wiki/Releases)

I do not have any special authority on that, but [1] applies to all 
stable branches (including warrior and zeus).

> What I am trying to achieve (from the thud baseline) is to get libiio python3 bindings built. Now, most of the variables from libiio_git.bb can be overridden in an append file, except for the 'inherit pythonnative' statement that dictates python2 bindings to be packaged. AFAICS, this leaves me with the only option of, not appending, but to define my own (.bb) recipe in my layer taking precedence over the one from meta-openembedded - a suboptimal solution I guess.
> 
> Anything I am missing?

One main purpose of a stable branch is that a user upgrading on a
stable branch should get bugfixes and especially security fixes,
but no regressions.

When you create your distribution or upgrade to a different Yocto stable
branch you might get breaking changes and things you are using might break,
but this is not supposed to happen on a stable branch.

If you need to backport functionality from more recent series you can 
always backport this into your layer. I usually have a recipes-backport/ 
in my layer that contains functionality backported from more recent 
series, in this case I would have a recipes-backport/libiio/libiio_git.bb
with the recipe copied from the current master. Once you upgrade your 
layer to Yocto >= 3.1 you will be able to drop this backport.

This might sound like a suboptimal solution to you, but it avoids the 
risk of breaking anything for the many other users of this stable series.

> Thanks,
> Martin

cu
Adrian

[1] https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance#Policies

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


