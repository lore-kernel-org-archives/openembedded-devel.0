Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LpDHx-0007bA-TF
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 05:08:25 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>)
	id 1LpDFf-0000OA-Eu; Wed, 01 Apr 2009 22:05:59 -0500
Message-ID: <49D42B9B.3040304@dls.net>
Date: Wed, 01 Apr 2009 22:06:03 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: Adrien Demarez <adrien.demarez@bolloretelecom.eu>
References: <49D245F0.4060107@dls.net> <49D363A5.3010503@bolloretelecom.eu>
In-Reply-To: <49D363A5.3010503@bolloretelecom.eu>
X-SA-Exim-Connect-IP: 216.145.245.200
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: madwifi-ng & linux 2.6.29
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
X-List-Received-Date: Thu, 02 Apr 2009 03:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Adrien Demarez wrote:
> Hi all,
> 
> I am working with Jeremy Lainé on the boc01 architecture. Currently, we
> do use Madwifi + hostapd 0.5 for our 11g Atheros minicard modules
> (despite we want to switch to ath9k / ath5k when it is mature enough).
> As we are still using 2.6.27 kernel and found ath9k is not mature enough
> for AP in this version (at least, it does not work with our AR9160
> modules), I have written a working recipe for compat-wireless (not yet
> committed into OE though, please tell if anyone is interested. Beware :
> it does not compile if MAC80211 or CFG80211 is defined as 'y' in the
> kernel, use 'm' or 'n' instead !).
> This is working, though I'd prefer using vanilla in-kernel drivers
> instead of compat-wireless (so I plan to have a look to ath*k in 2.6.29
> kernel very soon).
> 
> In order to use ath*k (or any drivers using nl80211) with hostapd, I
> have also written a recipe for hostapd-0.6.9 (Jeremy has uploaded it
> into OE) and this is working perfectly with our AR9160 modules using
> ath9k from compat-wireless. I am currently testing ath5k, but I run into
> a few troubles with AP mode, so until this is fixed we still need to
> keep a working madwifi+hostapd-0.5.10 (I also experienced a few troubles
> with madwifi + hostapd-0.6.9 so for the moment we stand with hostapd-0.5
> when using madwifi, and hostapd-0.6 is not set as the default one. I
> will look at this soon but getting a working ath5k/AP is more important
> to me currently).
> I also have to do more testing with wpa_supplicant (currently, AP mode
> is my focus).
> 
> BTW, if anyone is interested, I also have written a working recipe for
> madwifi using hal-0.10.5.6. I found this hal is necessary for some
> recent chips like AR2417 with whom the vanilla madwifi-ng driver does
> not work.
> 
> Best regards,
> 
> --
> Adrien Demarez

Wow.

I had no idea this was so complicated.

For the moment, I'm going to drop madwifi, hostapd from the SlugOS
feeds, and put a SlugOS-specific hack into wpa-supplicant.  I guess
we'll need to invest a whole lot more time to sort out the new Atheros
driver world.

Mike (mwester)



