Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MdQn9-0006xb-B1
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 17:40:10 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD005E861F for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 17:23:00 +0200
Message-ID: <4A8AC753.8000008@atmel.com>
Date: Tue, 18 Aug 2009 17:22:59 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250551346.5083.3@zaurus> <1250591188.3555.5.camel@utx.utx.cz>
In-Reply-To: <1250591188.3555.5.camel@utx.utx.cz>
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
X-List-Received-Date: Tue, 18 Aug 2009 15:40:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Stanislav Brabec skrev:
> Stanislav Brabec wrote:
> 
>> There are two recipes for the calibrate library: libxcalibrate and 
>> xcalibrate
>>
>> There are two recipes that provide prototypes: calibrateproto 
>> and xcalibrabrateext
>>
>> Only some of these combinations result in a working environment.
>>
>> I'll test, whether latest library version works with xserver-
>> kdrive-1300.
> 
> Yes, xtscal works with xserver-kdrive-1300 and latest libxcalibrate and
> calibrateproto.
> 
> It didn't work for kdrive based builds, because kdrive recipe wants
> libxcalibrate, but xtscal wants xcalibrate. One dependency chain
> overwrites the another with undefined result depending on the build
> order.

What is the difference between "xserver-kdrive-1300" and
"kdrive based builds" ?
Do you mean it does not work with later revisions of xserver-kdrive?



> 
> That is why I would like to propose:
> - remove all xcalibrate and xcalibrabrateext recipes
> - find recipes and images that need them and migrate them to
> libxcalibrate and calibrateproto.

Angstrom prefers another version of xserver-kdrive.

Should we try to focus on xorg-xserver-1.6.1 which seems to have kdrive
support?



> - fix git versioning of libxcalibrate and calibrateproto, maybe
> increment PE.
> 
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



