Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MclpA-0001P8-SN
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 21:55:29 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD005A80C3 for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 21:38:34 +0200
Message-ID: <4A886039.5050508@atmel.com>
Date: Sun, 16 Aug 2009 21:38:33 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>	<1242507547.4226.1.camel@lenovo.internal.reciva.com>	<4A867CCA.7060609@atmel.com>	<1250329051.4215.167.camel@lenovo.internal.reciva.com>	<1250330779.4406.9.camel@utx.utx.cz>
	<4A86A13E.6020402@atmel.com> <1250375020.5033.7.camel@utx.utx.cz>
In-Reply-To: <1250375020.5033.7.camel@utx.utx.cz>
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
X-List-Received-Date: Sun, 16 Aug 2009 19:55:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Stanislav Brabec skrev:
> Ulf Samuelsson wrote:
>> Stanislav Brabec skrev:
>>> Well, there may be a problem in recipes. There is xcalibrate and
>>> libxcalibrate. Both provide the same library. Some recipes use
>>> xcalibrate in DEPENDS, some use libxcalibrate. libxcalibrate does not
>>> compile on images with xserver-kdrive.
>>>
>> I have looked through the code.
>> x11-image uses Xorg and libxcalibrate.
>>
>> There can be several reasons for this error message:
>>
>> 1) Xmalloc fails
>> 2) There is no extension XCALIBRATE
>> 3) There is an extension, but with different casing
>>    XCALIBRATE is used by libxcalibrate.
>>    if another name is used when it is added,
>>    then there is a problem when queried.
>>    The library is called libXcalibrate.so.
> 
> 4) Both xcalibrate and libxcalibrate were populated to staging and one
> overwrites the other. .la files from one could "poison" the other.
> To identify this possible problem, please look at your build logs or
> check your tmp/work. If both xcalibrate and libxcalibrate were staged,
> you may expect problem.
> 
> If only one of the was built, it is a different problem.
> 
I did a patch to xtscal to print out all X11 Extensions
if the XInitExtension fails, and there is no XCALIBRATE
extension loaded.


The at91 confs have:
PREFERRED_PROVIDER_xserver = "xserver-kdrive"
This should be:
PREFERRED_PROVIDER_xserver = "xserver-kdrive-common"

Instead of kdrive, I am using the xorg server, and I saw
a comment that libXcalibrate does not work on xorg.

I will try with xerver-krive-common and see how it goes...


> 
> ________________________________________________________________________
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



