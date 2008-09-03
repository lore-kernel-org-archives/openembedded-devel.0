Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KawMf-0001EY-2n
	for openembedded-devel@openembedded.org; Wed, 03 Sep 2008 19:41:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KawKY-0007dk-RR
	for openembedded-devel@openembedded.org; Wed, 03 Sep 2008 17:39:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 03 Sep 2008 17:39:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 03 Sep 2008 17:39:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Sep 2008 19:39:39 +0200
Message-ID: <g9mi4r$53n$1@ger.gmane.org>
References: <200809031554.52267.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <200809031554.52267.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Hash based SCMs and OpenEmbedded/Bitbake
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
X-List-Received-Date: Wed, 03 Sep 2008 17:41:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> Hey guys,
>
> we have a couple of issues with hash based SCMs (like git) and how we handle
> them.
>
> 1.) sane-srcrev. During stabilisation you want to lock down a rev, so you set
> one in sane-srcrev.
>
> Issue: The PV says something like PV = "1.0.0+gitr${SRCREV}". Now the SRCREV
> is fixed and will not go through the python hook. So the resulting package
> will be PV = "1.0.0+gitrdeadbeef" and if you want to upgrade to the
> ref "affe" you will have a package called "1.0.0+gitraffe" which is not
> upgradable.

The trick I have been lately:

PV = "0.0+${PR}+gitr${SRCREV}"

You increment PR everytime you bump SRCREV. Ugly, but works quite well :)

regards,

Koen



