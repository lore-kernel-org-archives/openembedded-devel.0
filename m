Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IGsBn-0004Er-O1
	for openembedded-devel@openembedded.org; Fri, 03 Aug 2007 10:07:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l73859lB005341
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Aug 2007 09:05:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04903-08 for <openembedded-devel@openembedded.org>;
	Fri,  3 Aug 2007 09:05:02 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7384v3T005321
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Aug 2007 09:04:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46B25E0A.7050103@klever.net>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
	<1186064138.5972.259.camel@hammer.suse.cz>
	<46B1E812.8020706@dominion.kabel.utwente.nl>
	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>
	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>
	<46B20D9F.70704@dominion.kabel.utwente.nl>
	<1186093013.6626.57.camel@localhost.localdomain>
	<46B25E0A.7050103@klever.net>
Date: Fri, 03 Aug 2007 09:04:56 +0100
Message-Id: <1186128296.6116.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Gstreamer and rpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2007 08:07:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-08-03 at 00:43 +0200, Michael Krelin wrote:
> > 
> > I'm actually semi against forcing staging to look like an image. The
> > fact gcc requires this for its sysroot option is a sign that they
> > haven't got this right yet.
> > 
> 
> Why?

Well, why should I put libs in a /usr/lib directory rather that /lib? I
know there are guidelines but guidelines are one thing, forcing layouts
is a different thing.

It was once hoped that by changing variables like libdir, bindir, prefix
in bitbake.conf you could change your system layout. People could then
customise their images that way. I realise there are difficulties with
that in practise as some things are hardcoded and it won't work straight
away at present but if we start using the sysroot option I doubt it will
ever work.

> > With packaged staging we need to decide which way we go, separate
> > staging packages or use the same ones as we use for images.
> > 
> > My personal gut feeling is that separate ones will work better. They
> 
> So is mine, but...
> 
> > also mean we can handle the extra staging files like pkgmaps and perhaps
> > handle multi machine easier.
> > 
> > I think if we try to make image packages fit, we'll end up having to
> > make hack after hack and end up with something less maintainable.
> 
> why?

If staging packages can be different to image ones then we won't mind
customising them. If they have to be the same the only way to adjust for
staging will be to do post install tweaking. That feels like a hack.

Cheers,

Richard



