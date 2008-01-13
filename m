Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JE4Qr-0001BY-J6
	for openembedded-devel@openembedded.org; Sun, 13 Jan 2008 16:07:29 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JE4QT-0004le-1t
	for openembedded-devel@openembedded.org; Sun, 13 Jan 2008 15:07:05 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 13 Jan 2008 15:07:05 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 13 Jan 2008 15:07:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 13 Jan 2008 16:06:58 +0100
Message-ID: <fmd9ej$nt$1@ger.gmane.org>
References: <47871C71.5020800@student.utwente.nl>	<fm79ef$hak$1@ger.gmane.org>	<47872B1A.9010400@student.utwente.nl>	<fm86uh$qa8$1@ger.gmane.org>	<fm8dm0$ikl$1@ger.gmane.org>	<4787C194.4060907@student.utwente.nl>
	<fm8g7r$r27$1@ger.gmane.org>	<1200093760.6074.2.camel@HD>
	<fma5d5$5k5$1@ger.gmane.org> <1200229756.6056.4.camel@HD>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <1200229756.6056.4.camel@HD>
Sender: news <news@ger.gmane.org>
Subject: Re: mtn disapprove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Jan 2008 15:07:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thomas Kunze schrieb:
> Have only things in zaurus-2.6.inc that are common to all zaurus. 

Hehe, have a look at 4989371c8e7cec943a964b459ec3e71c0f547204 which I
committed yesterday. It already does exactly as you suggest.  My mail
about it has not made it to the list, though.  There seems to be a few
hours backlog with the OE ml.

From the commit message

conf/machine/: fix configuration for Strongarm devices
* replace erroneous TARGET_CC_ARCH line optimising for xscale instead of
  strongarm
* remove inclusion of tune-strongarm.inc from collie.conf and replace it
  with the correct TARGET_CC_ARCH.  Collie is the only Strongarm 1110
  device in OE and thus needs special treatment
* rename tune-strongarm.inc to tune-strongarm1100.inc and leave a short
  note to make it clear the file only applies to Strongarm 1100 devices.

collie is apparently Strongarm 1110, all other Zaurus are 1100.



