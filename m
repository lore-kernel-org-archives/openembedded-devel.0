Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IHj2X-0002pX-KP
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2007 18:33:13 +0200
Received: from pd953a6c3.dip0.t-ipconnect.de ([217.83.166.195]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IHj0A-0007kX-Hy
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2007 18:30:46 +0200
Message-ID: <46B5FA73.5030107@klever.net>
Date: Sun, 05 Aug 2007 18:27:31 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>	<46B1E063.7010407@dominion.kabel.utwente.nl>	<1186064138.5972.259.camel@hammer.suse.cz>	<46B1E812.8020706@dominion.kabel.utwente.nl>	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>	<46B20D9F.70704@dominion.kabel.utwente.nl>	<1186093013.6626.57.camel@localhost.localdomain>	<46B25E0A.7050103@klever.net>	<1186128296.6116.5.camel@localhost.localdomain>	<46B2F6B9.7050605@klever.net>
	<1186313341.5962.32.camel@localhost.localdomain>
In-Reply-To: <1186313341.5962.32.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 05 Aug 2007 16:33:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> About getting 'sysroot' right... Doesn't the name imply using in sysroot
>> the same layout like you would otherwise?
> 
> No, as I understand it sysroot makes assumptions about where the files
> live under it. It assumes "/lib" and "/usr/lib" and its those
> assumptions which I dislike. I haven't seen a way to change them but I
> could easily be missing something.

I think it's not exactly what it assumes. It assumes that what would be
/usr/lib/ without sysroot would be ${sysroot}/usr/lib/

> If gcc does change them based on the values of prefix, libdir etc when
> compiled, that would be a bit better but its still hardcoding things
> into the compiler which I don't think should be hardcoded there. Does
> anyone know if it adapts to changes in prefix. libdir and friends?

I think if you compile it with /opt/gcc prefix it would look in
${sysroot}/opt/gcc for whatever he wants based on his prefix and if you
-I/i-hate-fhs/ it would look into ${sysroot}/i-hate-fhs/

Love,
H
> 
> Regards,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


