Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ryan@trolocsis.com>) id 1PiXjU-0007JR-MC
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 20:42:16 +0100
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 78E1A21C5C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 14:35:31 -0500 (EST)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Thu, 27 Jan 2011 14:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:references:mime-version:content-type:in-reply-to;
	s=smtpout; bh=Am1mU7bG0KjSldzp/ZwDlRXZx7U=;
	b=P6lqNLkbL0TbfP92OpR2/MbemHVstxPRb4/YDAHioPDE9J7bcsVf8ZSEV8PXcflqCdShoD6yHGM8PVtAzPykHwbqjFCs1i05MA0SakMjmkgxdmdc2YIU5FBrYpxLNBBGtJ3cKT+NinJ1oOuH8H59Tkxkh+KxcJ+Qt4LltwKXgX8=
X-Sasl-enc: JF8PtXTlbJKzqSC9IF2P180nY+V1cHPpAxjw5ln8uT7n 1296156931
Received: from hera.xen.prgmr.com (hera.xen.prgmr.com [66.220.0.89])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 17D8D4037C7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 14:35:31 -0500 (EST)
Date: Thu, 27 Jan 2011 11:35:28 -0800
From: Ryan Phillips <ryan@trolocsis.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110127193528.GB27709@hera.xen.prgmr.com>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1296144645-16120-1-git-send-email-ryan_d_phillips@dell.com>
	<4D41B69F.7030403@mentor.com>
	<AANLkTim5kWpY0+UbeFEBmT4fxE-JbsJpJ49C4e2_k1vy@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim5kWpY0+UbeFEBmT4fxE-JbsJpJ49C4e2_k1vy@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] bind: Add DISTRO_FEATURES support for ipv6
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
X-List-Received-Date: Thu, 27 Jan 2011 19:42:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Khem Raj <raj.khem@gmail.com> said:
> Commit here
> commit a88aca1d7dfa3a08957dd49cb61bac850f197106
> Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> Date:   Wed Jan 12 20:34:55 2011 +0100
> 
>     autotools.bbclass: pass distro_imposed_configure_flags
> 
> 
> should now automatically feed in --enale-ipv6 based on ipv6 being
> selected and I see bind is inheriting autotools so why is it not
> working for bind ?
> 

The bitbake recipe was specifically disabling ipv6 support with
--enable-ipv6=no. I'm following the stable OE release from December... It does
appear OE's dev branch can do exactly as you propose, Khem.

Regards,
Ryan


