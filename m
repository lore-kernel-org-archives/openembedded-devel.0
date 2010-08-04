Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OgZI6-0007Dj-Lb
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 10:25:36 +0200
Received: by fxm12 with SMTP id 12so2352742fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 01:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=CtGaNU1qsYMme9ebD0xgaizsktxgAw8o2HYyL6uS0J4=;
	b=GMKz9iD5xazU1z819IuQS3n6b9XtxbBDPvTby7+sh5lh6fRZyRVLN2rt1NH7sV67ku
	YDs5KdCeOqjtRGXMVLT13mM+L/r5uOFO4eIlMi1X/J+6rLoTYEaXYDWA3s4Z65b6Yew8
	YtNQgmwniRX9v6UiP3sDdMI+UDvf3CpoVekvo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cim/m2fWDUe0i/0zudsw9W76QOmAQQqtvnK4sxcauI/Yrm+XzegZYuuv/1Gvu1yH3z
	7eaFY0Ng973j66t9jGVnWe2vPNdMeYZu3aRKEZYaNmg7lw+J2q/V3+IJb629qdcbhY+g
	FDQYd6F3KKIiGK4KUKttQim+Ydkwmr2236dBI=
Received: by 10.223.119.147 with SMTP id z19mr8451816faq.64.1280910329521;
	Wed, 04 Aug 2010 01:25:29 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id s20sm2868340faa.4.2010.08.04.01.25.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 01:25:29 -0700 (PDT)
Date: Wed, 4 Aug 2010 10:25:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804082539.GA30033@jama>
References: <1280901529-30358-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1280901529-30358-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,v3] recipes: Dont inherit autotools_stage.
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
X-List-Received-Date: Wed, 04 Aug 2010 08:25:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 03, 2010 at 10:58:49PM -0700, Khem Raj wrote:
> Fixes issues seen by Graham and Denys among others.
> My full x11-build is underway. Please inspect and/or try this
> patch out. I will see how my builds complete in the morning.

Few recipes are failing now for me (with rebuild from scratch).

I think we usually need just s/autotools_stage/autotools/g instead of
s/autotools_stage//g. Otherwise nothing is installed to sysroots for
many packages.

Regards,


