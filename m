Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KnqXY-0007ca-Ed
	for openembedded-devel@openembedded.org; Thu, 09 Oct 2008 10:06:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KnqT0-0004cY-76
	for openembedded-devel@openembedded.org; Thu, 09 Oct 2008 08:01:50 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 09 Oct 2008 08:01:50 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 09 Oct 2008 08:01:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 09 Oct 2008 10:01:37 +0200
Message-ID: <gckdp2$qo7$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: .dev broken after gettext changes
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
X-List-Received-Date: Thu, 09 Oct 2008 08:06:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Somewhere last night OE started giving

ERROR: Unbuildable tasks were found.
These are usually caused by circular dependencies and any circular 
dependency chains found will be printed below. Increase the debug level 
to see a list of unbuildable tasks.

Thanks to the autobuild we can see that last good commit is:

http://amethyst.openembedded.net/oe/viewmtn/viewmtn.py/revision/info/f2ebdb1826372581987a96a662d30d97b544c438

and this one is bad:

http://amethyst.openembedded.net/oe/viewmtn/viewmtn.py/revision/info/9f79c6b2ba1ff673c6a3fa4d02579b720046d1cf

So inbetween those commits OE became unbuildable.




