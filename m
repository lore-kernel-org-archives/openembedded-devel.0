Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OYzes-0002J5-Vy
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 12:57:49 +0200
Received: from [192.168.10.100] (95.232.142.62) by smtp206.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4C1A268C01C5F5E9 for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 12:51:41 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100711145643.q4q6l3lsow8ccogs@webmail.htc-linux.org>
References: <20100711145643.q4q6l3lsow8ccogs@webmail.htc-linux.org>
Date: Wed, 14 Jul 2010 07:19:51 +0200
Message-ID: <1279084791.2869.4.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.102
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: htcleo: touchscreen driver & configuration
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
X-List-Received-Date: Wed, 14 Jul 2010 10:57:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-07-11 at 14:56 +0100, lukas gorris wrote:
> Hello,
> 
> except for the 6 keypad buttons, machine htcleo lacks any working
> input device in its current state in OE.
> The present touchscreen driver is designed for use with the andoid
> user space. I would like to make it work with tslib.
> 
> In ts_print_raw a touch event looks like this
> 
> 670.031357:    110    227      0
> 2670.071314:    132    266      0
> 2670.111229:      0      0      0
> 2670.111236: -947150040 -947440328      0
> 2670.151243:    285    200      0
> 2670.191285:    285    202      0
> 
> Instead of a real touch event, the pointer will dodge to zero and then
> to a large negative value.
> Am I right the driver will need patching for this to work with tslib?
> 
> Driver is here
> http://git.linuxtogo.org/?p=groups/mobile-linux/kernel.git;a=commitdiff;h=6a2efb17dced8b2989a4359d98d66b0446743fdf
> 
> I know this is not 100% OE related. But since I am trying to get the
> htcleo device supported in OE I should take a try here. On the tslib
> list nobody jumped up so far:
> 
> https://lists.berlios.de/pipermail/tslib-general/2010-July/000302.html
> 
> Thanks
> 
> Lukas
hi,
I think your driver needs patching,I patched mine.

By the way I'm currently offline so I can't see the link.
Also:
*there is an xf86-input-tslib plugin which works fine except when you
apply some static rotation to xf86-video-fbdev
*I locally switched to evdev for htcdream,as advised by #xorg-devel and
will push soon
*if you plan to use xf86-video-fbdev rotated look at the thread I
started in the xorg devel mailing list.

Denis.



