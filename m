Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED8F7E71E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 12:58:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45ZxfJ2rNfz3l;
	Fri, 28 Jun 2019 14:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561726729;
	bh=HP/wtIctxVNYAQgHEkx0X7jK0TM745qh//gz5WAVkL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aam230/DnSupYL+nuYuXz4mXRRQUYkABpRIpjFxhvoPumK32sziXdkc6kjsoiFpSl
	S1ENRg1z7VBrR/KDhMPz27MgQ3we8nyngKFiJBB9EAfRr1ZvjPcUnVqS9Q/jjTboIK
	yMMyiix9spmHjR3McrWQM3ttK6MXYkMPe50h0laxVn5f4dVnJH2A8vZZsFqAVLKELI
	PaX26OxfiS7TVyGwP5M48G8LWyiuOfZauHUyp1zHQgsI0c14IjlvokwkN2Yd5TriUm
	nwNgR9bbyjVhFwB8UKIPKdtQCP0gW7yYypH8BpgdTyzwU7pC1j71ZiM69beDC7ed6R
	3tkjKNKGhKskXln43VlTS6iWy804BQd0BI+YkFl+N1PCXcgvJnsAbExC+XTMiziVLL
	3hkk7hdOap211fIiqeGQ3KAXoDRCK2Abqvx2zysIEuO3FMEqfLwmENrqcHeKl29a1O
	Pv17xVAgoDxnwWLBiS3qOTdYSrw+dl+9TGMzW1PwO0XST+H2uvMTfCyEwNYvVoNx9F
	ae9NLGmfrFI2cpfDdhBfT4oGM0UOvbg+vXk8oo1kUBxNpoAU49Gnd2+QfcipwZRBI+
	DH1fG7eEjf4HczM2PcPvpAo4RLAU2J1kYF/nOsxxaB1cuFFg9L5hg4kSTyHcKy2yA5
	FHkJYhmqAH7tYHMXHxE0q0oU=
Date: Fri, 28 Jun 2019 15:58:45 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190628125845.GA5313@localhost>
References: <fc78dc28-bc7c-2433-871f-3eb5047a0ee8@windriver.com>
MIME-Version: 1.0
In-Reply-To: <fc78dc28-bc7c-2433-871f-3eb5047a0ee8@windriver.com>
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
X-List-Received-Date: Fri, 28 Jun 2019 12:58:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jun 28, 2019 at 10:20:36AM +0800, Hongxu Jia wrote:
> Hi all,
> 
> Currently, I am improving OE to follow Yocto Project Compatible,
> One rule of Yocto Project Compatible is when a new layer is added,
> it should not affect other layer, but unfortunately, bbappend in
> meta-xfce broke the rule.
> 
> So I suggest to add DISTRO_FEATURES(xfce) as a switch to control,
> in short term, we could use it to control bbappend in meta-xfce,
> in long term, we could use it to control more xfce specific features
> 
> (As a alternative way, I also tried to remove bbappend directly,
> but I found the existence of bbappend is indeed necessary)

blueman upstream defaults to installing the files for thunar-sendto.
Andreas, was there any specific reason why you made this conditional
instead of keeping it enabled unconditional with only an RSUGGESTS
on thunar?

gdmflexiserver looks like a workaround for something that should be
fixed properly instead to me.
But short-term adding it to the normal lxdm recipe in meta-oe might
be an options?

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


