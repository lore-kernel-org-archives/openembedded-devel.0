Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IHeKc-0003kx-HQ
	for openembedded-devel@openembedded.org; Sun, 05 Aug 2007 13:31:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l75BTGbv018295
	for <openembedded-devel@openembedded.org>;
	Sun, 5 Aug 2007 12:29:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18105-03 for <openembedded-devel@openembedded.org>;
	Sun,  5 Aug 2007 12:29:07 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l75BT2ew018262
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 5 Aug 2007 12:29:02 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46B2F6B9.7050605@klever.net>
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
	<1186128296.6116.5.camel@localhost.localdomain>
	<46B2F6B9.7050605@klever.net>
Date: Sun, 05 Aug 2007 12:29:01 +0100
Message-Id: <1186313341.5962.32.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 05 Aug 2007 11:31:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-08-03 at 11:34 +0200, Michael Krelin wrote:
> >>> I'm actually semi against forcing staging to look like an image. The
> >>> fact gcc requires this for its sysroot option is a sign that they
> >>> haven't got this right yet.
> >>>
> >> Why?
> > 
> > Well, why should I put libs in a /usr/lib directory rather that /lib? I
> > know there are guidelines but guidelines are one thing, forcing layouts
> > is a different thing.
> 
> Good question, thought doesn't have much to do with sysroot facility.
> You have exactly the same freedom like you would have with no sysroot,
> you're free to install in /usr, in / or in /do-not-enforce-layout/
> prefix. The only difference is that you don't have to adjust your paths
> to take staging prefix into account and you are not likey to pick up
> your host system stuff while compiling.
>
> About getting 'sysroot' right... Doesn't the name imply using in sysroot
> the same layout like you would otherwise?

No, as I understand it sysroot makes assumptions about where the files
live under it. It assumes "/lib" and "/usr/lib" and its those
assumptions which I dislike. I haven't seen a way to change them but I
could easily be missing something.

If gcc does change them based on the values of prefix, libdir etc when
compiled, that would be a bit better but its still hardcoding things
into the compiler which I don't think should be hardcoded there. Does
anyone know if it adapts to changes in prefix. libdir and friends?

Regards,

Richard



