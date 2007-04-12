Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Hbs0K-0007f2-PP
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2007 07:37:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Hbs0B-0003un-RR
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2007 07:37:47 +0200
Received: from 219-106-231-98.cust.bit-drive.ne.jp ([219.106.231.98])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Apr 2007 07:37:47 +0200
Received: from no2spam by 219-106-231-98.cust.bit-drive.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Apr 2007 07:37:47 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 12 Apr 2007 14:37:38 +0900
Message-ID: <461DC5A2.5070603@nospam.arcornews.de>
References: <evcm2e$15q$1@sea.gmane.org>	<1176155636.5842.25.camel@localhost.localdomain>	<432beae0704091515n6a55a294jfdf64c9e855b9537@mail.gmail.com>
	<3ef3a7ad0704100602v610f6c10k447a1551f79ca750@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: 219-106-231-98.cust.bit-drive.ne.jp
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
In-Reply-To: <3ef3a7ad0704100602v610f6c10k447a1551f79ca750@mail.gmail.com>
Sender: news <news@sea.gmane.org>
Subject: Re: OE a deterministic build system?
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
X-List-Received-Date: Thu, 12 Apr 2007 05:37:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

José Bernardo Bandos Rodrigues wrote:
> Are you by any chance using ubuntu?

Bernardo,

the hint about dash proved to be priceless.

NOTE: package nunome-1.0.2: completed
NOTE: Tasks Summary: Attempted 414 tasks of which 395 didn't need to be 
rerun and 0 failed.
NOTE: build 200704121425: completed

After reconfiguring dash, everything is fine now.  Big thank you!

As a takeaway from this episode, I guess it might make sense for OE to 
check that /bin/sh is not /bin/dash as it can unstabilize the 
functioning of OE.

Regards

Rolf



