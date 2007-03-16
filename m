Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HSEB1-00077n-L9
	for openembedded-devel@openembedded.org; Fri, 16 Mar 2007 16:17:07 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HSEAn-0003Ur-62
	for openembedded-devel@openembedded.org; Fri, 16 Mar 2007 16:16:53 +0100
Received: from f73d8.f.ppp-pool.de ([195.4.115.216])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 16 Mar 2007 16:16:53 +0100
Received: from no2spam by f73d8.f.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 16 Mar 2007 16:16:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 16 Mar 2007 17:16:34 +0100
Message-ID: <etecci$200$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: f73d8.f.ppp-pool.de
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
Sender: news <news@sea.gmane.org>
Subject: RFC after the fact - bug 1987
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
X-List-Received-Date: Fri, 16 Mar 2007 15:17:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

it seems I have still a few things to learn as far as updating OE 
metadata goes.  Furthermore it seems I might have created the first 
major fuck-up.  I apologize for the inconvenience this has caused to the 
OE community.

Now, to sort things out; I committed 
a96c9acac99b5599d2b0fb0a518603646414d166 yesterday to fix bug 1987.  It 
seemed like an obvious case (move debug files into -dbg package) which 
is why I dared to commit.  psokolovsky made me aware that an RFC had 
been necessary to make this commit to a core part of OE and that it 
might have broken compilation for some OE users.

Now here I am trying to do The Right Thing[TM].  I want to discuss "mtn 
diff -r e9d53f524190d295cb769c7594711fd76eb197b7 -r 
a96c9acac99b5599d2b0fb0a518603646414d166".  Please let me know if there 
is anything wrong with this change.  If it should be reverted, feel free 
to do so or let me know via mail or IRC and I will fix it pronto.

Regards

Rolf



