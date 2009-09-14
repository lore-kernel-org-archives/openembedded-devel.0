Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MnA1o-0007HA-71 for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2009 13:47:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MnA1L-0001wr-HH
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2009 13:46:59 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2009 13:46:59 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2009 13:46:59 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 14 Sep 2009 13:46:35 +0200
Message-ID: <h8laes$cj9$1@ger.gmane.org>
References: <4AADA377.6010005@symas.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4AADA377.6010005@symas.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: python-wpactrl
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
X-List-Received-Date: Mon, 14 Sep 2009 11:47:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-09-09 03:59, Howard Chu wrote:
> Here's a recipe file for the python-wpactrl module, which connects to
> wpa_supplicant's control interface. It works for me...

A few comments:


> DESCRIPTION = "A Python extension for wpa_supplicant/hostapd control interface access"
> HOMEPAGE ="http://projects.otaku42.de/wiki/PythonWpaCtrl"
> SECTION = "devel/python"
> LICENSE = "GPLv2"
> PR = "r0"

That sets PR to its default value, so leave that out please.

> SRC_URI = "svn://svn.otaku42.de;module=python-wpactrl;proto=http;rev=383"

Please use SRCREV to point to the revision and put it in PV as well so 
people can see which version they are installing.

And please send it as a git-am'able patch so we can track author metadata.

regards,

Koen



