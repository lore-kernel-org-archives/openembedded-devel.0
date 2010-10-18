Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1P7w3S-0005Nx-ST
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 22:11:35 +0200
Received: by ewy1 with SMTP id 1so1030027ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 13:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:reply-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=IodK/6TLYJ4UcfWFl/BExWKxj7YqZMDf1+xNx10F0uU=;
	b=ph6IIOGhZg+rJNL9n+BY422VavJ5IljGDtm1hnhIWmdaj6B3wj4eUD+TdRy+LGxagL
	rtZmfLF0Y1aW07xPvVHocNoScOU/lgJ2LMLmLzFewnOCM0YPx7Yc/G1NNq9U+8J4+Mp6
	LpUU5QlZkd45Rn0YoFE8IX4qsWYHfQMtHtKNA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tZGZkg9zpo1ref0qFvr5h0RzyYXna65JdM1E0lAvnd1mgklzDdgXSYq7IIHMDSMRw/
	XM6IX1mOkPENPhS61PdacD3bFfbzXIGLb12HzMwSExFkK0zW2VGf6+8KlPNWEK1th5QA
	vVeqPGBTppStPEPPdMNsn4Bcj3xLUeAWeVW9U=
Received: by 10.213.7.18 with SMTP id b18mr4706064ebb.63.1287432661591;
	Mon, 18 Oct 2010 13:11:01 -0700 (PDT)
Received: from localhost (c-fedae555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.218.254])
	by mx.google.com with ESMTPS id q58sm2846786eeh.15.2010.10.18.13.11.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 18 Oct 2010 13:11:00 -0700 (PDT)
Date: Mon, 18 Oct 2010 22:14:29 +0200
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101018201429.GA818@boggieman>
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201010151039.08619.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kristoffer.ericson@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Mon, 18 Oct 2010 20:11:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 15, 2010 at 10:39:05AM +0200, Marcin Juszkiewicz wrote:
> 
> Hi
> 
> recipes/linux/ contains 235 recipes. I would like to propose cleaning:
> 
> 1. drop 2.4 kernels - if someone still needs them then .oz354x and .stable
>    branches have them.

Agreed

> 
> This may affect:
> 
> - zauruses (which have 2.6 kernel)
> - ipaq h36/38/39/54/55 - some have 2.6 kernel
> - ipod - but does someone really uses 2.4.24 on own ipod?
> - ramses - but this is maintained out of tree
> - wrt54 - OpenWRT distro works better there and lets keep that way
> - xxs1500, mtx, sun4cdm - if someone maintain it at all then please raise your
>   hand
> - colinux - no one will cry
> - geodegx - 2.6 mainline works on it
> 
> 
> 2. Drop kernels older then 2.6.20 - it was over 3 years ago so if someone uses 
>    older one then probably also uses 3 years old OE. 
> 

Not sure that this is a good idea really. As an example, the best kernel
for the hp6xx is the 2.6.17 (yes its old I know, but everything works).
For the hp7xx its currently 2.6.19 (although its changing shortly to 2.6.34).

So how about putting the limit somewhat lower :) ? Like 2.6.15?

> This may affect (checked recipes):
> 
> - ep93xx - machines with this cpu are mainline supported, patches from ts72xx
>   and sim.one works
> - chumby
> - compulab-pxa270
> - devkitidp-pxa255
> - fsg3
> - gumstix
> - amsdelta
> - bd-neon
> - colinux
> - epia
> - geodelx
> - h1940
> - h6300
> - ks8695
> - magicbox
> - mtx-3
> - neuros
> - sun4cdm
> - tornado-omap2
> - wrap-geode
> - x86
> - acern30
> - logicpd-pxa270
> - mainstone
> - mx21ads
> - netbook-pro
> - triton
> - blueangel
> - universal
> 
> Some of those machines are not maintained anymore, many of them should work 
> with current mainline kernels. If someone cares about anything on a list - 
> raise your hand.
> 
> Why 2.6.20? Because NHK-15 uses it and does not work with mainline kernel.
> 
> Regards, 
> -- 
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


