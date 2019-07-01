Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 691507E830
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 12:48:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45cnH03z8tz3t;
	Mon,  1 Jul 2019 14:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561985309;
	bh=RkzMTqAmPMFwnb8OGn6Q8Vk/UJX5mAvlkvZNBaxrG0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDS6HJ7DRD36LnKd9oKfGh7s5pWKPkHluzkb3V7rE0gyzm9xCS9iUkBnq7Q8LzrPy
	U8rl7hLft379gT6mV2PBpp3pgdIFNWPgRkCaaF0iBQG9ZtHBIBgI9zQj5t7kKxG7iW
	2L0V4tsDPSVTrbssU++jKgFLQ8btM3R7mguU9PIGwYOU9gcmKc3B5kOukUUeBGfiXu
	V13LiufkMSGA36o4o1stTPovNUWuwvVI9zqcYn4snaM7/hKRt6DWwnlmeg7gkObAvH
	6EcNaUJR5cHAPguQtL6WMvxq5YJMzoXPEhqOoXaSS3JY6NoM5m/Sw3/hMi4OhDBIkl
	4JMRbE34v/yl5xy2/nOaFysS9Vi08m7b140HzhYcljN/ugl4I3O6c34zm91peWBrTt
	zePX6i/bjzaarmt4FTIEpGuFE2Jwdqr5of88KJYhb9E2E03nQFNz1UwSuE0sGYmLzn
	9mQjXrB1V2bj707+7w9SjQywPpb5bDBhUW/X2x4kI7ASH4rzJO+FZmcDkFzvtZQ8yg
	x2cMTPJBSTSU2vZNWyJtOGrsPVAZXwQEqwhBhMkIopJxYApTxAWn5WJYbwVz9ja2Hn
	SjtOxi2SMvGR5vyaYLZEueoxOvHTwbFM0H7tvxgWyY8VcuG+B7UY1GN2+vUp08pRga
	JNDgnC5dWgDWl6BC+4KUiyhc=
Date: Mon, 1 Jul 2019 15:48:25 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190701124825.GA7483@localhost>
References: <fc78dc28-bc7c-2433-871f-3eb5047a0ee8@windriver.com>
	<20190628125845.GA5313@localhost>
	<d889a55b-ae41-dd51-c37f-a8114b234753@windriver.com>
MIME-Version: 1.0
In-Reply-To: <d889a55b-ae41-dd51-c37f-a8114b234753@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: RFC: Add DISTRO_FEATURES(xfce) to control meta-xfce
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
X-List-Received-Date: Mon, 01 Jul 2019 12:48:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jun 28, 2019 at 10:23:51PM +0800, Hongxu Jia wrote:
> On 6/28/19 8:58 PM, Adrian Bunk wrote:
> > On Fri, Jun 28, 2019 at 10:20:36AM +0800, Hongxu Jia wrote:
> > > Hi all,
> > > 
> > > Currently, I am improving OE to follow Yocto Project Compatible,
> > > One rule of Yocto Project Compatible is when a new layer is added,
> > > it should not affect other layer, but unfortunately, bbappend in
> > > meta-xfce broke the rule.
> > > 
> > > So I suggest to add DISTRO_FEATURES(xfce) as a switch to control,
> > > in short term, we could use it to control bbappend in meta-xfce,
> > > in long term, we could use it to control more xfce specific features
> > > 
> > > (As a alternative way, I also tried to remove bbappend directly,
> > > but I found the existence of bbappend is indeed necessary)
> > blueman upstream defaults to installing the files for thunar-sendto.
> > Andreas, was there any specific reason why you made this conditional
> > instead of keeping it enabled unconditional with only an RSUGGESTS
> > on thunar?
> 
> Currently DISTRO_FEATURES(xfce) is used to control this bbappend,
> 
> if we could merge the bbappend to recipe thunar, I think it is not
> 
> necessary to add DISTRO_FEATURES(xfce) in short term

I just sent
  blueman: Enable thunar support by default but don't rdepend on it
that should also fix this problem.

> > gdmflexiserver looks like a workaround for something that should be
> > fixed properly instead to me.
> > But short-term adding it to the normal lxdm recipe in meta-oe might
> > be an options?
> 
> No need to add extra lxdm, I am working to remove this bbappend,
> 
> and modify xfce4-panel to use lxdm to instead of lightdm directly,
> 
> we do not need this bbappend to provide a fake gdmflexiserver

Thanks, that looks a lot better than what I had in mind.

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


