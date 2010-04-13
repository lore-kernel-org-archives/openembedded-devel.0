Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1dVn-0006eD-O5 for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 12:38:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1dSR-0003bD-LI for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 12:35:03 +0200
Received: from gw.mps.bg ([195.138.130.3])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 12:35:03 +0200
Received: from panayot.daskalov by gw.mps.bg with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 12:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Panayot Daskalov <panayot.daskalov@mps.bg>
Date: Tue, 13 Apr 2010 08:43:14 +0000 (UTC)
Message-ID: <loom.20100413T103738-930@post.gmane.org>
References: <49D245F0.4060107@dls.net> <49D363A5.3010503@bolloretelecom.eu>
	<49D42B9B.3040304@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 195.138.130.3 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.4pre) Gecko/20100410 Ubuntu/9.10 (karmic)
	Namoroka/3.6.4pre)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: madwifi-ng &amp; linux 2.6.29
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
X-List-Received-Date: Tue, 13 Apr 2010 10:38:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Mike (mwester <mwester <at> dls.net> writes:

> 
> Adrien Demarez wrote:
> > Hi all,
> > 
> > I am working with Jeremy Lainé on the boc01 architecture. Currently, we
> > do use Madwifi + hostapd 0.5 for our 11g Atheros minicard modules
> > (despite we want to switch to ath9k / ath5k when it is mature enough).
> > As we are still using 2.6.27 kernel and found ath9k is not mature enough
> > for AP in this version (at least, it does not work with our AR9160
> > modules), I have written a working recipe for compat-wireless (not yet
> > committed into OE though, please tell if anyone is interested. Beware :
> > it does not compile if MAC80211 or CFG80211 is defined as 'y' in the
> > kernel, use 'm' or 'n' instead !).
> > This is working, though I'd prefer using vanilla in-kernel drivers
> > instead of compat-wireless (so I plan to have a look to ath*k in 2.6.29
> > kernel very soon).
> > 
> > In order to use ath*k (or any drivers using nl80211) with hostapd, I
> > have also written a recipe for hostapd-0.6.9 (Jeremy has uploaded it
> > into OE) and this is working perfectly with our AR9160 modules using
> > ath9k from compat-wireless. I am currently testing ath5k, but I run into
> > a few troubles with AP mode, so until this is fixed we still need to
> > keep a working madwifi+hostapd-0.5.10 (I also experienced a few troubles
> > with madwifi + hostapd-0.6.9 so for the moment we stand with hostapd-0.5
> > when using madwifi, and hostapd-0.6 is not set as the default one. I
> > will look at this soon but getting a working ath5k/AP is more important
> > to me currently).
> > I also have to do more testing with wpa_supplicant (currently, AP mode
> > is my focus).
> > 
> > BTW, if anyone is interested, I also have written a working recipe for
> > madwifi using hal-0.10.5.6. I found this hal is necessary for some
> > recent chips like AR2417 with whom the vanilla madwifi-ng driver does
> > not work.
> > 
> > Best regards,
> > 
> > --
> > Adrien Demarez

Hi Adrien,

I am currently facing the issue of compiling drivers for 3Com 3CRUSBN275 USB
Wi-Fi adapter which uses the Atheros AR9001U-2NX chipset. As far as I can
understand this chipset is supported by the compat-wireless package, but I need
to cross compile it for ARM9 platform (i.MX27). So I would be very grateful if
you are willing to share your OE recipe for compat-wireless.

Of course I will give back every feedback that I can.

Thanks in advance.

Best regards,
Panayot




