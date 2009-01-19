Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LOqrJ-0002RP-MU
	for openembedded-devel@openembedded.org; Mon, 19 Jan 2009 10:55:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LOqkZ-00088G-6y
	for openembedded-devel@openembedded.org; Mon, 19 Jan 2009 09:48:55 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 19 Jan 2009 09:48:55 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 19 Jan 2009 09:48:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 19 Jan 2009 10:48:45 +0100
Message-ID: <gl1i9t$5dv$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090114 Shredder/3.0b2pre
Sender: news <news@ger.gmane.org>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Online image builder available for angstrom
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
X-List-Received-Date: Mon, 19 Jan 2009 09:55:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

After a few weeks of hacking and testing I am proud to announce the 
online image builder:

http://amethyst.openembedded.net/~koen/narcissus

You can select a machine and packages you want and the image builder 
will create a tar.bz2 image using the packages available in the feeds. 
That means you can create an up-to-date image at anytime from anywhere!

The autobuilder tries to keeps the feeds populated for all machines 
evenly, but some packages aren't in all feeds, e.g. kismet is missing 
from the armv7a feeds since it breaks with gcc 4.3.x. When that happens 
the image builder will display a big red X on the screen next to the 
package that failed to install. It will continue to install the other 
packages you selected so you can still use generated image, but without 
the missing packages.

If you have suggestions, feedback or bugreports, send a mail to the 
angstrom-devel mailinglist.

The source is available from:

http://dominion.thruhere.net/git/?p=narcissus.git;a=summary

Patches welcome, especially to improve the look & feel

regards,

Koen



