Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBIbn-0007mY-Uc
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 07:02:00 +0200
Received: by iaky10 with SMTP id y10so89198iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2012 21:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CbVmYKrrGgl8di33LfqV5bsQGGzNma9y6PLfGCc23U8=;
	b=GrRCyEochTPjRn+rHcpqIkDpIG0ScFlYFl7j+2Zu6B9+tH+mkYEe/8hfJXG0My3mk0
	JMI9+IUlWH7v7FmI9J/JMFMGJNIK1hcilENja+3i4YbgBEigXapbeVMAawDufPw0Qk5t
	6UHwcdiN6vp/fUxvREe5aTACza3xyOaFficnQ4bw7+xT2RziF1DvcytxB3J8K/CuEO5R
	JA7sUozp4jDMClPVQTt/pg3oksgYep75mzTBNxoP/eLK2tdk4PMaoVfO4zypxa0Hx+Hf
	fRhjNBrYfMuY012wLHwRFCWtvCEozV3f60Lwvg/PCuxd20sry1jWOE1O6wSAxSUfRjLw
	3vTQ==
Received: by 10.50.160.228 with SMTP id xn4mr19599156igb.1.1347338968991;
	Mon, 10 Sep 2012 21:49:28 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id nh1sm613370igc.11.2012.09.10.21.49.27
	(version=SSLv3 cipher=OTHER); Mon, 10 Sep 2012 21:49:28 -0700 (PDT)
Date: Mon, 10 Sep 2012 21:49:24 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120911044922.GD2980@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <504E1F94.9000606@baumann.name>
MIME-Version: 1.0
In-Reply-To: <504E1F94.9000606@baumann.name>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: minimal template layer for new machine support
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
X-List-Received-Date: Tue, 11 Sep 2012 05:02:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/09/12 18:12), Tilman Baumann wrote:
> Hi,
> 
> I'm working on a TI DM812x support overlay.
> I guess what it comes down to is a new kernel recipe (based on TI's
> sources) and this funny two stage u-boot.
> I think I can write the recipes. But what I don't quite see is how I
> would add a new supported machine in the first place?
> I was trying to orient myself on a few existing machine support
> layers. But I think I'm still missing the point.
> What are the minimal basics to implement? Where should I start?

check meta-ti
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/

may be there is a BSP already or something similar you can start off.

> 
> Thanks for any help.
> 
> Cheers
>  Tilman
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


