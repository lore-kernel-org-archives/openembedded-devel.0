Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IGtdJ-0006TW-R8
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2007 11:39:45 +0200
Received: from pd9538aa7.dip0.t-ipconnect.de ([217.83.138.167]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IGtbF-0004lf-TF
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2007 11:37:38 +0200
Message-ID: <46B2F6B9.7050605@klever.net>
Date: Fri, 03 Aug 2007 11:34:49 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>	<46B1E063.7010407@dominion.kabel.utwente.nl>	<1186064138.5972.259.camel@hammer.suse.cz>	<46B1E812.8020706@dominion.kabel.utwente.nl>	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>	<46B20D9F.70704@dominion.kabel.utwente.nl>	<1186093013.6626.57.camel@localhost.localdomain>	<46B25E0A.7050103@klever.net>
	<1186128296.6116.5.camel@localhost.localdomain>
In-Reply-To: <1186128296.6116.5.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.1
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
X-List-Received-Date: Fri, 03 Aug 2007 09:39:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>>> I'm actually semi against forcing staging to look like an image. The
>>> fact gcc requires this for its sysroot option is a sign that they
>>> haven't got this right yet.
>>>
>> Why?
> 
> Well, why should I put libs in a /usr/lib directory rather that /lib? I
> know there are guidelines but guidelines are one thing, forcing layouts
> is a different thing.

Good question, thought doesn't have much to do with sysroot facility.
You have exactly the same freedom like you would have with no sysroot,
you're free to install in /usr, in / or in /do-not-enforce-layout/
prefix. The only difference is that you don't have to adjust your paths
to take staging prefix into account and you are not likey to pick up
your host system stuff while compiling.

About getting 'sysroot' right... Doesn't the name imply using in sysroot
the same layout like you would otherwise?

> It was once hoped that by changing variables like libdir, bindir, prefix
> in bitbake.conf you could change your system layout. People could then
> customise their images that way. I realise there are difficulties with
> that in practise as some things are hardcoded and it won't work straight
> away at present but if we start using the sysroot option I doubt it will
> ever work.

And of course you still have your libdir/bindir/prefix, etc.

Love,
H


