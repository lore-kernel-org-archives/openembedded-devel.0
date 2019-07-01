Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE127E8F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 12:55:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45cnR82WjPz3t;
	Mon,  1 Jul 2019 14:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561985733;
	bh=+wLUixfCjX4tThh6DklwKbGD8p5Y3qBHSJfNSRhPhrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kr9G0kkuxzN462qs3RRa9d1ZaOtF94/4hWY/JDuh1v49rELwRPeE2MhyptCySLmlW
	0+syqZ7js9kUK/tI9LVJsvB2SXPhTl1w5UZAReEv9bB11XiQyNRCPbB2xujZjY+Tlg
	6zyiynaSTj+nCbc7SmaTOMjnTW0gmpNWuqLgYWRy+EowIAnMwUsXSCGZvDMqTrPJPO
	BZLVWn32TS2jtvT8Otz52BDGP2/pUcvsXBYR53Dl1EEPKMZM6SEueHA5WtVlfKTv+H
	ZcY6DA+0cV0OSfdi5CWwqlj32/3T7HEk3wSicbGvNG+eQFShFzsJ2LKrcPHq9xw3JR
	+bL50TO1uDiv6Fa5fLNaJzbBV2FcJ/g+mUL+824Cl6DqRQe4DKTPzyh2lQSsvnCFaB
	oRlWo1D7qCG+Mdfnz40ngL+/JsKzgZ8MdalgOWtH5RS1yU1YMgrI67bskLjkumHuQ4
	ZiChiMGF29IQOCElfmG+ZWksSKruEGqQM6Mn/liPGK9lcF61NtHcsAZmOnJ3pkLk7J
	qxpiuAFV5ZR+tRokstPh+VJEMPcdVlz0uCU/uar+CaAXCY1AwbEJ7gA5+6qhYiergt
	1jnkvUiu7JMJ1JFX517m4yik787rklNMpOvBsH36ohN3E/tBalbksMfc/Yl4MBUCIz
	P4AUUJsSxf1fYzVTlc6iseq8=
Date: Mon, 1 Jul 2019 15:55:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190701125529.GB7483@localhost>
References: <1561643269-130343-1-git-send-email-hongxu.jia@windriver.com>
	<20190628100721.GB18526@localhost>
	<0b346c3b-22e5-2e09-3a81-d199e5c8591a@windriver.com>
MIME-Version: 1.0
In-Reply-To: <0b346c3b-22e5-2e09-3a81-d199e5c8591a@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkmanager: goodbye libnm-glib
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
X-List-Received-Date: Mon, 01 Jul 2019 12:55:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jun 28, 2019 at 10:57:02PM +0800, Hongxu Jia wrote:
> On 6/28/19 6:07 PM, Adrian Bunk wrote:
> > On Thu, Jun 27, 2019 at 09:47:49AM -0400, Hongxu Jia wrote:
> > > Since commit [061953143 networkmanager: Update to 1.18.0] applied,
> > > upstream disable libnm-glib by default. And in further networkmanager,
> > > upstream removes libnm-glib, libnm-glib-vpn, and libnm-util for good
> > > ...
> > Any strong reason for removing this already now?
> 
> Make sure to clean up empty package, in 1.18
> 
> libnm-glib is already disabled, and left three empty
> 
> packages(no package generated acturally). I found
> 
> the issue, trace the reason and provide fix

What problem does this issue cause?

> You may note original PACKAGECONFIG[glib] does not have
> 
> without option, so clean up it rather than add missing without option
> 
> PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"

That is actually fine and doesn't need a fix - the library is only built 
if explicitely requested --with-libnm-glib.

> > It's gone in 1.20 so removal then is clear, but if someone wants
> > to use it for legacy code with 1.18 this should stay possible as
> > long as <= 1.18 is shipped.
> 
> I think it will be upgraded 1.20 soon, and if someone wants
> 
> to use legacy code, I think 1.16 in warrior is better choose
> 
> which libnm-glib is always enabled

"soon" might be after Yocto 2.8 branches.

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


