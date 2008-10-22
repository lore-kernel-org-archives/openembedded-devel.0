Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KsZtI-0008Ib-Gr
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 11:20:32 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KsZso-0001bI-EX
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 09:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 09:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 09:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Oct 2008 11:19:25 +0200
Message-ID: <gdmr6t$iq4$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081015 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: [RFC] Moving PACKAGE_EXTRA_ARCHS to include/tune-*
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
X-List-Received-Date: Wed, 22 Oct 2008 09:20:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Currently we set PACKAGE_EXTRA_ARCH in each machine, but nearly all 
entries could get moved to the tune-* files.

So

PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te armv6 armv7 armv7a"

Will move from beagleboard.conf to tune-cortexa8.conf but it will use 
'+=' instead of '=' so machines can still do PACKAGE_EXTRA_ARCHS = 
"someleetarch"

Comments, suggestions?

regards,

Koen



