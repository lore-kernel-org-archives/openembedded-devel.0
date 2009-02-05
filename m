Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LUziK-0004w5-H9
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 09:36:00 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LUzi3-00029A-HK
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 08:35:43 +0000
Received: from p5483a5ac.dip0.t-ipconnect.de ([84.131.165.172])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 05 Feb 2009 08:35:43 +0000
Received: from vjensen by p5483a5ac.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 05 Feb 2009 08:35:43 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Thu, 5 Feb 2009 08:35:31 +0000 (UTC)
Message-ID: <gme8cj$ejn$1@ger.gmane.org>
References: <200901120019.45621.mickey@vanille-media.de>
	<200901141547.26513.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5483a5ac.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: python roadmap
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
X-List-Received-Date: Thu, 05 Feb 2009 08:36:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Wed, 14 Jan 2009 15:47:26 +0100 schrieb Michael 'Mickey' Lauer:

> Thanks to some extrashifts this work has proceeded faster than
> scheduled. I plan to merge mickey/python26 into master on friday. If you
> see something dangerous, yell.

Yell ;-)

See http://bugs.openembedded.net/show_bug.cgi?id=5013

python26 fails to build for the big-endian machines I tried, namely 
nslu2be.  And as python25 was removed it is a real blocker for packages 
which DEPEND on pathon, which inturn is the case for php.  And php I'm 
trying to get a version working again.

do_compile tries to load a .so on the host which was build for armeb and 
complains about wrong byteorder.  But there is no complain when 
MACHINE=nslu2le in which case the .so shouldn't be loadable, too (it's 
for arm after all, not x86).  AND python25 used exactly the same 
do_compile method, and does not fail!

So I'm a little confused how it's supposed to work.  Could you please 
take a look at it?

Thanks,
  Vitus

-- 
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



