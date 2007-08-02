Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IGcdZ-0006Zu-AU
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 17:30:57 +0200
Received: from pd9538c5f.dip0.t-ipconnect.de ([217.83.140.95]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IGcbX-0003eQ-OV
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 17:28:49 +0200
Message-ID: <46B1F78F.4040700@klever.net>
Date: Thu, 02 Aug 2007 17:26:07 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>	<46B1E063.7010407@dominion.kabel.utwente.nl>	<1186064138.5972.259.camel@hammer.suse.cz>	<46B1E812.8020706@dominion.kabel.utwente.nl>
	<1186066059.5972.269.camel@hammer.suse.cz>
In-Reply-To: <1186066059.5972.269.camel@hammer.suse.cz>
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
X-List-Received-Date: Thu, 02 Aug 2007 15:31:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>  
>>> But Angstrom uses 4.1.2 as default, isn't it? And it compiles everything
>>> correctly (except qemu).
>> OE != angstrom
> 
> Yes. But it means, that !angstrom may also succeed with a newer gcc.

You're not talking about gcc upgrade, but rather about different
approach to the whole crossbuild.

> There are three chances for --sysroot:
> 
> - All OE projects will upgrade to gcc >= 3.4.

Including sharprom compatible build, that requires 2.95 or something.

> - Keep libtool hacks optional for distros using older gcc versions.
> - Write wrappers on top of old gcc to implement the most important
> parts of --sysroot (rewriting of -L and -I paths and use of
> -nostdinc). (~15 lines in bash or sh+sed).

That may be possible even with rearranged staging, indeed, but again,
you agreed it's more complicated that it seemed to you at the first glance.

I'm not taking the symlink workaround seriously, because inventing one
workaround to get rid of the other isn't going to get us anywhere.

Love,
H



