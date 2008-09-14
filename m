Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Kew2F-0007k7-6Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Sep 2008 20:09:23 +0200
Received: from ip-89-168-141-231.cust.homechoice.net ([89.168.141.231]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KevzK-0005QW-Ll
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Sep 2008 19:06:23 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200809141931.10414.torsten.sadowski@tu-berlin.de>
References: <200809141931.10414.torsten.sadowski@tu-berlin.de>
Date: Sun, 14 Sep 2008 19:06:14 +0100
Message-Id: <1221415574.4641.269.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Hibernating an OE device
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
X-List-Received-Date: Sun, 14 Sep 2008 18:09:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-09-14 at 19:31 +0200, Torsten Sadowski wrote:
> would it be possible to hibernate (suspend to disk) an OE device. I have a 
> Simpad which might be usable as a gps navi but it should not drain the car 
> battery. Obviously a large enough flash disk would be necessary but what else 
> do I need?

This isn't really anything to do with OE.  You would probably do better
to ask the kernel h4x0rs for your machine, and/or the
swsusp/suspend2/uswsusp maintainers.

That aside, though, I would have thought that the power draw of a SIMpad
in suspend-to-RAM mode would probably be low enough that you could reach
an acceptable level of dark current that way without needing to get into
suspend-to-disk.  Suspend to RAM is a whole lot simpler and should "just
work" with any current kernel.

p.




