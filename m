Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 618177C3A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2019 18:10:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43r7Zc6r5JzMs;
	Thu, 31 Jan 2019 19:10:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548958250;
	bh=hwNTD8wbRW1YdwYFR6YfOVTOTdk1o1UkHgrU773iGss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BA/4/oGPSqRZBNyu7GCYfNOjm+34Xnw2lBvc7Hlce0q3G34D+HXexuVh/W6d9Lnt6
	p1bGaRU9r6nyC8Ak8eZRO5b5zFL90901HwllIL9re5kiZaxgXtiIgKwVpkSge3SHv7
	8VLp5j3vyKS6Iz9GVpcaN0nRv5l76CABiAycUoJkE97wRR+yTXAWgDQ0b1U0BSdG0w
	zOYXh1UmePorDJXO/iv+miyZgN1LYYofIipSbVFxwTwePZdkF6+ONDQIHZvUlOTauv
	SEjVbPI5OXAdiJAwsonkdebh06R3IKxKTrcGj606oludMTavcSlqq6172ADJtCNu54
	zWOX8CzKM94d0BRjp8aQaPRZ38Ok86G42lIeP3fdMIMWesK3zAjeKDQnrFHUgEZxt3
	8d9GMEJcFmLwlb/69oDUebNRO2JfiJ3BCNKzTFU6GIyOZvXrc1bTBbjPITG0O/wzet
	n8PjXdsuuAyCww8ZcEuL4tmXpXP7sJ7eEHrw9cFVU/KzXxojEmpVfdl67xyafT18DQ
	dHPrJaHh8wqUes9VUmyvRX/cWohxFG0yxW6TZ5vAEZH6Tz7uUEjGsHPtx5DFwBGQK6
	Y69CgFCAyxUqlvqJxVe3Mwl6BdmWGaLn3zcQGaNJyNb52UWh+5fDPWIIAx0JKVM59P
	3H9WDzdb5zqC3D++WZRN23Q4=
Date: Thu, 31 Jan 2019 20:10:47 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190131181047.GA28875@localhost>
References: <20190130095201.11965-2-bunk@stusta.de>
	<CALbNGRQTaFFC1P1zQvjwO=-Kr1s61UPTGBv1w0+5YcCaXsnzFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQTaFFC1P1zQvjwO=-Kr1s61UPTGBv1w0+5YcCaXsnzFA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] Fix the libnm* packages
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
X-List-Received-Date: Thu, 31 Jan 2019 18:10:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jan 30, 2019 at 11:31:52PM +0100, Andreas Müller wrote:
> On Wed, Jan 30, 2019 at 10:52 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > - libnmutil, libnmglib and libnmglib-vpn no longer exist
> >   after the 1.10.10 -> 1.14.4 upgrade
> Checked (OK am on thud environment) but it is 1.14.4. All packages you
> want to remove contain files on my build! Are you sure that you have
> the required PACKAGECONFIGS set (please set all and test) and the
> nasty new 'polkit' in your distro features?
>...

Thanks for spotting my mistake.

The problem is actually not related to polkit, my mistake was due to the 
glib PACKAGECONFIG: I misremembered that it was removed in NM 1.12, but
it is actually only strongly deprecated (and no longer shipped in 
distributions like Debian/Ubuntu).

> Andreas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


