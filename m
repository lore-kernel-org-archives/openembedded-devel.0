Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OEtjz-0006N4-Lf
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 02:36:00 +0200
Received: by pwj3 with SMTP id 3so326506pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 17:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=o74LPGPU7OCz833EYQwJVri1N21t3ZZi9syS7sXYjS4=;
	b=CisRPdrM3sUw27LVz8r04Twk8n6S4tBD7/Z5SWk1SVzVyXbXlU/hsLjPTAR4y6epWB
	6kh3wzCgrZufkspsNuYN/Z64xkVZveDWwktLZ9uvKLgmcn6B3CgCRtcTKtMDne1N5JLe
	XMnce1dzRDsVkQThQCdK9TCrpmLn6rev2B2Ik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=H4XLljWiJ+hMN2g2E2KAbF2Gmds6Twpd1EvjJsQGudt10SAg9njteeRt4/gntok/W7
	FGI9a6VaEutT6NcZIb32qMumzS9wF39VfH6SQpeeZzgL0hXoOjSnL5cu6l1wil77Tl76
	wuGXsHd/wyf9H2MG55Wlyud99DjjhLqu5+8ns=
Received: by 10.114.164.37 with SMTP id m37mr5463406wae.39.1274315517001;
	Wed, 19 May 2010 17:31:57 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b6sm72279694wam.21.2010.05.19.17.31.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 19 May 2010 17:31:55 -0700 (PDT)
Date: Wed, 19 May 2010 17:31:51 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100520003151.GA26630@gmail.com>
References: <4BF45542.2000406@freyther.de>
MIME-Version: 1.0
In-Reply-To: <4BF45542.2000406@freyther.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of may
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
X-List-Received-Date: Thu, 20 May 2010 00:36:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (20/05/10 05:16), Holger Freyther wrote:
> Hi,
> 
> sorry for the delay of finishing up the minutes, it is late at night so
> I am sure I have messed up something in one way or another... take care.
> 
> 
> TSC Meeting 2010/05/06
> 
> Where to hold meetings
> ======================
> The TSC decided to hold future meetings on IRC as every member
> of the TSC already have irc clients installed and the same was
> not true for jabber clients.
> 
> Make packaged-staging mandatory
> ===============================

fine

> The TSC decided to make packaged-staging mandatory as this will
> allow further simplification of the classes, gives additional
> features. The TSC is aware that there are still recipes left to
> migrate away from the legacy staging and that building these will
> increase the build time right now.
> 
> Make insane mandatory
> =====================

fine

> The TSC believes that the insane.bbclass contributes to making
> builds more reliable and point out errors early on. On the other
> hand the TSC is aware that these checks might get into the way
> during rapid prototyping. The TSC believes the right balance is
> to enable the insane.bbclass by default but to change the default
> to warn instead of failing the build and existing users will be
> able to opt for fatal errors instead of warnings.
> 
> 
> Removing old versions
> =====================
> The TSC looked into the topic of when to remove versions.
> 
> 
> The TSC thinks there can not be a general rule of when to delete
> a package. The TSC believes that in some cases a package should
> never be deleted, e.g. with GCC/GLIBC to target a specific device
> or distribution. For a series of major releases it seems plausible
> to only keep the latest minor release of each release series around
> given that the quality should increase with each minor release but
> a removal of a minor release should not be done if there is a
> PREFERRED_VERSION set. The TSC believes that 24 months can be a good
> time to remove old major releases but it is certainly not the only
> criteria for a removal.

gcc makes minor releases and in general they are bug fix only releases.
like kernel.

I would propose that OE count such packages with major release only.
e.g. gcc 4.4 (indicated 4.4.x) 4.5 and so on. This will simplify the
maintenance and reduce duplication, with one downside that if some DISTRO does not need a 
bug fix that was say done in 4.4.4 and is currently using 4.4.3 as
preferred cross compiler. Although chances of such cases will be low.


Thanks
-Khem


