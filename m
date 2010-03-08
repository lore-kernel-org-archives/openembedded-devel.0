Received: from smtp7.myhsphere.biz ([204.10.105.69] helo=mail9.myhsphere.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <balakrishnan@e-consystems.com>) id 1NoYgd-0007os-0J
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 09:51:40 +0100
Received: (qmail 28680 invoked by uid 399); 8 Mar 2010 08:48:41 -0000
Received: from dsl-tn-dynamic-216.238.164.122.airtelbroadband.in (HELO
	?192.168.6.196?) (balakrishnan@e-consystems.com@122.164.238.216)
	by mail9.myhsphere.biz with ESMTPAM; 8 Mar 2010 08:48:41 -0000
X-Originating-IP: 122.164.238.216
X-Sender: balakrishnan@e-consystems.com
From: balakrishnan <balakrishnan@e-consystems.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.4686.1267697311.14961.openembedded-devel@lists.openembedded.org>
References: <mailman.4686.1267697311.14961.openembedded-devel@lists.openembedded.org>
Date: Mon, 08 Mar 2010 14:14:02 +0530
Message-Id: <1268037842.3457.14.camel@balakrishnan-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 204.10.105.69
X-SA-Exim-Mail-From: balakrishnan@e-consystems.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Xserver problem...
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
X-List-Received-Date: Mon, 08 Mar 2010 08:51:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

ok Koen, But my doubt is "Xorg + xf86-video-fbdev" will support touch
screen interface or not?
I have added 'xf86-input-tslib' in Xorg, but touch is not enabled.
Then only I have moved to kdrive.

Branch : stable/2009
DISTRO : "angstrom-2008.1"

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
XSERVER = "xserver-xorg \
           xf86-input-evdev \
           xf86-input-mouse \
           xf86-video-fbdev \
           xf86-input-keyboard \
	   xf86-input-tslib "

With Regards
J.Balakrishnan

On Thu, 2010-03-04 at 11:08 +0100,
openembedded-devel-request@lists.openembedded.org wrote:
> > Hi,
> > I am using Angstrom OS for my pxa270 based board, which is build by
> > Stable/2009 branch. In this, Xserver is running perperly on  240x320
> and
> > 640x480 resolution, but while running 480x272 resolution lcd 4.3" it
> > making problem. How can I  resolve this.
> 
> You might need to patch kdrive to add the 480x272 resolution. But
> since
> kdrive is EOL and patching resolutions doesn't scale, I'd recommend
> trying Xorg + xf86-video-fbdev.
> 
> regards,
> 
> Koen



