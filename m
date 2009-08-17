Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Mczb2-0000aQ-I2
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 12:37:48 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C7800211CA5 for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 12:20:50 +0200
Message-ID: <4A892F01.9080707@atmel.com>
Date: Mon, 17 Aug 2009 12:20:49 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>	<1242507547.4226.1.camel@lenovo.internal.reciva.com>	<4A867CCA.7060609@atmel.com>	<1250329051.4215.167.camel@lenovo.internal.reciva.com>	<1250330779.4406.9.camel@utx.utx.cz>
	<1250458415.4215.178.camel@lenovo.internal.reciva.com>
In-Reply-To: <1250458415.4215.178.camel@lenovo.internal.reciva.com>
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Mon, 17 Aug 2009 10:37:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Phil Blundell skrev:
> On Sat, 2009-08-15 at 12:06 +0200, Stanislav Brabec wrote:
>> Phil Blundell wrote:
>>> On Sat, 2009-08-15 at 11:15 +0200, Ulf Samuelsson wrote:
>>>> Looks like xtscal in x11-image fails.
>>>>
>>>> $ DISPLAY=":0.0" xtscal
>>>> XCALIBRATE extension missing
>>> That error is fairly self-explanatory: your xserver lacks the XCALIBRATE
>>> extension.  Xtscal won't work if this is missing.
>> Well, there may be a problem in recipes. There is xcalibrate and
>> libxcalibrate. Both provide the same library. Some recipes use
>> xcalibrate in DEPENDS, some use libxcalibrate.
> 
> Although it might be true that there is an issue there, I don't think
> this would be likely to cause the problem at hand.  If you get as far as
> running xtscal then you must have at least some version of
> libxcalibrate.so on hand, and as far as I know all recent-ish versions
> of that library are wire-compatible so it shouldn't matter very much
> which one you have.
> 
> It seems more likely that the xserver in question simply doesn't include
> the extension.  Checking with xdpyinfo would quickly reveal whether or
> not that's actually the case, anyway.
> 
>> libxcalibrate does not compile on images with xserver-kdrive.
> 
> I can't think offhand why libxcalibrate should care what xserver is in
> your image.  What's the error you get?
> 
> p.
> 
This problem seems to be much simpler to solve than expected.
You just have to look at the right place

OE_EXTRA_CONF += "--enable_xcalibrate --enable-tslib"

in the Xserver's bb file!
Disabled by default.

Have not tested this yet, but if it walks like a duck ...



> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



