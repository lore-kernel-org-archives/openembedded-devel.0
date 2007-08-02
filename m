Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IGaJ9-0003AU-6D
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 15:01:39 +0200
Received: from pd9538c5f.dip0.t-ipconnect.de ([217.83.140.95]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IGaHA-00045r-Ja
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 14:59:36 +0200
Message-ID: <46B1D498.5080703@klever.net>
Date: Thu, 02 Aug 2007 14:56:56 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>
	<1186058282.5972.232.camel@hammer.suse.cz>
In-Reply-To: <1186058282.5972.232.camel@hammer.suse.cz>
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
X-List-Received-Date: Thu, 02 Aug 2007 13:01:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> Michael Krelin wrote:
>>> Michael Krelin wrote:
>>>> I don't know much about gstreamer, but being inventor of
>>>> OE_LT_RPATH_ALLOW I felt obliged to look into gst-plugins.inc and I'm
>>>> guessing it should be:
>>> Maybe it would be better to not break build environment and then work
>>> around consequent errors by hacks like OE_LT_RPATH_ALLOW,
>>> never-ever-do-rpath.patch etc.
>>>
>>> gcc has --sysroot which can do required linking without any hacks.
>>>
>> Generally, I tend to agree, but in practice I'm afraid that would amount
>> to rewriting the whole OE...
> 
> No.
> 
> 1. and 2. and 4. should be change of about 20 lines (change xxxx_CC from
> e. g. "arm-angstrom-linux-gnueabi-gcc" to e. g.
> "arm-angstrom-linux-gnueabi-gcc --sysroot=/OE/build/tmp/staging/arm-angstrom-linux-gnueabi").
> I only could not find correct lines.

staging doesn't resemble root filesystem, to begin with. So that would
involve rearranging staging as well. Which is again a good idea, but
would take longer that it sounds in pure theory.

Love,
H

> 
> If anybody tell me the correct location, I can do test bootstrap with
> the new options.
> 
> 5. is low priority, after 4. it will become NOP
> 
> 6. Is already done, it should be enough to change check pattern in the
> QA stuff.
> 
> 3. and 7. break packages (e. g. findutils) not depending on CC
> definition and has to be fixed manually anyway.
> 
> And if 8. will be done (in far future), most individual fixes in 7.
> could be removed.
> 


