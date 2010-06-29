Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OTjXb-00049S-US
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 00:44:32 +0200
Received: by fxm12 with SMTP id 12so76152fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 15:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=NgkuG8u057Ai7Vq6hG+yz52c6jaJ3Bjo43ZDwiSciPU=;
	b=sZJpAMozn1/E/Uan5uI86beSB9d5nmEz+2cI8dE+/93aVHOd6TnDaMPdR6qvT2eVPO
	DEXTItRjD3p+t1flJagD0KICNRqdlvCS7VRd2/ZcbjntHgqXhv6RoRGSBzoR3L7c7kcj
	icLwtAslVy+2yOX4h7W3or55JhS10s70QsO4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FGGcTS773hQxrigafg/OAaoSbS6/+KaAEXszBs1yx4+LBA/6hrvE1TEk0EZ4B9PYHT
	QG52KFK3jFk0ShbHEzeqIUtvySw9+zjxbUn75tPziXDrLDO8dBS9j1WIQkpaZ5UTHrYB
	y5FFHChQN9FDD0v1RpQoibcNu52FZadvBmNFg=
Received: by 10.223.5.81 with SMTP id 17mr6505553fau.42.1277851188786;
	Tue, 29 Jun 2010 15:39:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d9sm19824545fav.18.2010.06.29.15.39.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 15:39:48 -0700 (PDT)
Date: Wed, 30 Jun 2010 00:38:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100629223859.GE12539@jama>
References: <933C8D2B-2A4E-46EE-A342-ED5EB3636F38@keylevel.com>
	<AANLkTilmoW3cU9hcM1PbN8-yDTM36uzkNB5CwU8obJf1@mail.gmail.com>
	<92233E3F-2CFC-4F88-A780-1A15D7D94A00@keylevel.com>
	<AANLkTim3wnL18BjsIrLiKZC5NRc70UG77N1GtOiISghA@mail.gmail.com>
	<69E07E36-D08B-4CD2-9B79-EF876EE47C52@keylevel.com>
MIME-Version: 1.0
In-Reply-To: <69E07E36-D08B-4CD2-9B79-EF876EE47C52@keylevel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'swapper' process using 100% cpu when system idle
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jun 2010 22:44:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 29, 2010 at 11:32:19PM +0100, Chris Tapp wrote:
> >on .dev
> >well look at the kernel recipe you want
> >to go to and add
> >
> >DEFAULT_PREFERENCE_<yourmachine> = "1"
> >you might have to provide defconfig also.
> 
> 
> Thanks
> 
> I'm getting 2.6.35-rc3 included in the build at the moment (for
> 'linux'). I couldn't find a recipe for this and it took me a while
> to work out that it was linux_git.bb that was getting used!
> 
> This file has DEFAULT_PREFERENCE = -1. However, it seems as if none
> of the other linux_x.y.z.bb files specify a value for my machine
> (x86) and they all have a DEFAULT_PREFERENCE of -1.

http://docs.openembedded.org/usermanual/html/recipes_defaultpreference.html
The default preference (when no DEFAULT_PREFERENCE is specified) is zero.

That's why I used only -1 when I added it. But if you have machine which
has DEFAULT_PREFERENCE -1 in all other linux recipes (positive values
are usualy assigned only for machines known to work) then you're right
it will pull it.

I'll decrease it to -2 with SRCREV bump I have in my queue..

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


