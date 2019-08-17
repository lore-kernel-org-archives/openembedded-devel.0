Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D714E6BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 11:18:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 469d3S1TpRz3y;
	Sat, 17 Aug 2019 13:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566040708;
	bh=3x4imvgIA0+tvfB1LPyZhcvX+CvOV37bWJXHN+tlaaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSaHfpF1vWg0X/G+Txr73BL2Tnu1au+zhQf41IvHfpBksK8jMHo+cBjkiTOFEqCQs
	E09UzhcE2/a4dHbcasNp8tOYRxd1s2JF2Oa7iTVSRhBE63Mf6q+ADtnqnMG//ntK5B
	VIxpGJc4Hy9LP0xdf/kHRremph7+eAtbHSTCGa1iUCdL4TL7aOugmYELK/rVKIy0LC
	6+ad3fxRreYzDYRqY1CjjyX2MIfXmT8JNK1N9GAAi6RAKkFE+Dz3xBfTljuK0GjoH9
	zQ/LsZbVQjawMU2nEx+JewAxYvJmngIfNZwY6SKK210iwNS9OfHOuJTBH1JLFOTVZk
	gur1ByyxofgL6n9bFY1wNk3vbn4mDbAqIyquPZWFq3x3Lj7bwHJK5CqlZ0Tr4s5zpP
	AdVEsvJiJYa2aYEfpiesJuTApsSl3lbWdRc5Kp0O9x8a1r+2vicHh020Wof5/IRzZh
	qqpj61ij4MuSq89ql7QHAeeQbnwYFcZnhn+lR5HCtp9M2ndC79hRw3RY8XYBnPbpy0
	PnWvifZu5gjtnGDLXdPznXYQjQ8OKJHjWrT8faap5v9qWaoXu4ceGEzgV3xWdZL9l2
	kdtI0pzJP6CvlWgm55CJ044BMuF6LDyxcMETH9Sca9nINWw41jKqrrIwJg7E5JDDrp
	ucIzoAwJqntYAhr92nehN0qw=
Date: Sat, 17 Aug 2019 14:18:25 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190817111825.GA2828@localhost>
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190817081339.22253-1-schnitzeltony@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][PATCH 0/4] vlc adjustments
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
X-List-Received-Date: Sat, 17 Aug 2019 11:18:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Aug 17, 2019 at 10:13:35AM +0200, Andreas Müller wrote:
> Some cherry-picks for vlc
>...
> 2.- 4. Are good enhancements. It is upon warrior maintainers if they are
>    important enough to make it into stable branch.
> 
> Adrian Bunk (3):
>   vlc: Remove workaround and patches for problems fixed upstream
>   vlc: notify switched to GTK+3 some time ago
>   vlc: Remove the obsolete dependency on dbus-glib
>...

The notify change is an actual bugfix that should be added to warrior.

The other two changes are cleanup patches with no (intentional) changes
in the build result, I would recommend against backporting them since
there are no benfits compared to the small regression risk.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


