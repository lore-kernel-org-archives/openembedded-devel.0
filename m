Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IHmmG-0005f1-GV
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2007 22:32:40 +0200
Received: from pd953a6c3.dip0.t-ipconnect.de ([217.83.166.195]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IHmjy-0006It-L1
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2007 22:30:19 +0200
Message-ID: <46B63294.30107@klever.net>
Date: Sun, 05 Aug 2007 22:27:00 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>	<46B1E063.7010407@dominion.kabel.utwente.nl>	<1186064138.5972.259.camel@hammer.suse.cz>	<46B1E812.8020706@dominion.kabel.utwente.nl>	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>	<46B20D9F.70704@dominion.kabel.utwente.nl>	<1186093013.6626.57.camel@localhost.localdomain>	<1186132901.5972.314.camel@hammer.suse.cz>
	<1186313563.5962.36.camel@localhost.localdomain>
In-Reply-To: <1186313563.5962.36.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 05 Aug 2007 20:32:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> A random idea:
>>
>> Define TARGET_ROOT_MAP, which may use similar syntax like overlay
>> filesystems have. It will allow to construct sysroot by these
>> filesystems on fly as well, e. g. for use with emulators.
> 
> That would be a much nicer solution. Staging could them have its own
> mapping and it should solve most of the problems we see. Have you any
> idea how difficult that would be to implement?

I don't see how this random idea could be easily implemented (well, I
have to admit I haven't really given it a thought), but it serves a
perfect explanation why we can't go for sysroot at the moment and
probably anytime soon... Unfortunately, I think I'm convinced.

Love,
H


