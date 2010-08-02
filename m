Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Og0xM-0002w8-RE
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 21:45:53 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Og0x0-0007cB-0P
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 20:45:30 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C571964.2070800@tycoelectronics.com>
References: <mailman.396.1280769240.17151.openembedded-devel@lists.openembedded.org>
	<4C571964.2070800@tycoelectronics.com>
Date: Mon, 02 Aug 2010 21:45:43 +0100
Message-ID: <1280781943.10932.5.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Chinese Fonts needed for xserver-xorg on OpenEmbedded
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
X-List-Received-Date: Mon, 02 Aug 2010 19:45:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-08-02 at 15:15 -0400, Jay Snyder wrote:
> I need to display Chinese fonts (unicode 4e00 & higher) on an 
> xserver-xorg based OE system.
> Is there a package(s) to install fonts that include these characters?

Assuming you're using client-side fonts (i.e. freetype), a quick look in
recipes/ttf-fonts suggests that ttf-wqy-zenhei might be what you need:

DESCRIPTION = "WenQuanYi Zen Hei - A Hei-Ti Style Chinese font"

If you need an old-style core font then I don't think there is anything
appropriate in OE although it probably wouldn't be hard to add.

p.




