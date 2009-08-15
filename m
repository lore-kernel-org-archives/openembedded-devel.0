Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1McIMP-0004VS-JF
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 14:27:49 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C78001ECCD8 for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 14:11:04 +0200
Message-ID: <4A86A5D7.6070904@atmel.com>
Date: Sat, 15 Aug 2009 14:11:03 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8516BF.9080405@atmel.com>	<h63h7v$8pk$1@ger.gmane.org>	<4A8581D9.9010205@atmel.com>	<1250264545.12282.1271.camel@mill.internal.reciva.com>	<4A85C292.9030605@atmel.com>	<4A85C7E9.7030402@xora.org.uk>	<4A85FFD7.7090302@atmel.com>
	<h665ts$ms3$1@ger.gmane.org>
In-Reply-To: <h665ts$ms3$1@ger.gmane.org>
Subject: Re: No graphic when loading "x11-gpe-image"
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
X-List-Received-Date: Sat, 15 Aug 2009 12:27:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Rolf Leggewie skrev:
> Ulf Samuelsson wrote:
>> I have progressed a little further, so I have managed to get
>> the Xserver to start, but the xorg.conf I did fails to
>> support the mouse. The touchscreen is also nonfunctional but
>> A USB keyboard work...
> 
> That sounds similar to the problems I'm experiencing with X11 and Opie
> in qemu images.  Poky images work, but I wasn't sure where the magic
> difference between Poky and .dev could be.
> 
> 
The problem was localized to the SAM9263.
Xorg was called with "-rgba bgr" and "-screen 240x320"

-rgba is not a known switch.

openembedded provides an empty xorg.conf, so the screen "240x320"
was not found.

By removing the -screen 240x320 from the Xorg startup,
the X11 server could be started, but no touchscreen.

By default, the AllowEmptyInput is on, so the input drivers
are not loaded, and this needs to be set to "off"

my xorg.conf, now only contains:
Section "ServerFlags"
	Option "AllowEmptyInput" "off"
EndSection

The touchscreen now works, but it does not calibrate,
and it is not coordinated with the movements.
I suspect FRAMEBUFFER_CONSOLE_ROTATION beeing set
might have something to do with it, but I am not sure.
When I move the pen in X direction, the cursor moves in Y direction

Also, my USB keyboard gets three events per press,
resulting in three characters.


Anyone got a fully working xorg.conf ?


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



