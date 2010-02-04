Received: from ey-out-1920.google.com ([74.125.78.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Nd1hE-0005dN-B1
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 14:24:39 +0100
Received: by ey-out-1920.google.com with SMTP id 13so509202eye.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2010 05:22:09 -0800 (PST)
Received: by 10.213.109.129 with SMTP id j1mr943758ebp.79.1265289729650;
	Thu, 04 Feb 2010 05:22:09 -0800 (PST)
Received: from xora-build.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by mx.google.com with ESMTPS id 16sm79644ewy.2.2010.02.04.05.22.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Feb 2010 05:22:07 -0800 (PST)
Received: by xora-build.xora.org.uk (Postfix, from userid 500)
	id 0FBD3415A4; Thu,  4 Feb 2010 13:22:06 +0000 (GMT)
Date: Thu, 4 Feb 2010 13:22:06 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100204132206.GD26844@xora-build.xora.org.uk>
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>
	<4B684D9D.2030001@dresearch.de> <4B699C5A.70909@dresearch.de>
	<20100203162120.GB26844@xora-build.xora.org.uk>
	<4B6AC59A.90000@dresearch.de> <4B6AC734.4090807@balister.org>
MIME-Version: 1.0
In-Reply-To: <4B6AC734.4090807@balister.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 74.125.78.148
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Thu, 04 Feb 2010 13:24:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2010 at 08:10:12AM -0500, Philip Balister wrote:
> On 02/04/2010 08:03 AM, Steffen Sledz wrote:
> >Graeme Gregory wrote:
> >>>>Since today i see a similar problem when doing a clean bitbake of
> >>>>glib-2.0. It seems to be a problem with automake/automake. :(
> >>>
> >>>I think i've identified this patch as cause of the problems.
> >>>
> >>>   commit b1caa21ab2590689f3b6ff68483803701c12d721
> >>>   Author: Graeme Gregory<dp@xora.org.uk>
> >>>   Date:   Tue Jan 26 12:02:08 2010 +0000
> >>>
> >>Guys there is zero point sending me emails direct if you dont actually
> >>tell me any information.
> >
> >Sorry about that. But i wasn't sure if you read the ml daily. So i put
> >you on the Cc.
> >
> >BTW, i would call the hint, that your commit broke[1] the baking of at
> >least glib-2.0 (which isn't that exotic) an 'information'.
> >
> >[1] I've rechecked this again with angstrom distro and hipox,
> >beagleboard, and x86 machine making a clean build of glib-2.0:
> >
> >   rm -rf tmp.5
> >   bitbake glib-2.0
> 
> glib-2.0 is building for me. Do you have an error log?
> 
Yes, same here I checked with a clean build after that commit as it
was quite so invasive.

Graeme



