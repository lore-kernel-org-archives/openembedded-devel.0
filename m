Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KXwee-0007cs-12
	for openembedded-devel@openembedded.org; Tue, 26 Aug 2008 13:24:08 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KXwdA-0004Fr-HZ
	for openembedded-devel@openembedded.org; Tue, 26 Aug 2008 11:22:36 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 26 Aug 2008 11:22:36 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Aug 2008 11:22:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 26 Aug 2008 13:22:32 +0200
Message-ID: <g90p1m$r3m$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
Sender: news <news@ger.gmane.org>
Subject: disapprove 9cdbd45b5ff507c6e00fc91c08ec5e17929302f4
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
X-List-Received-Date: Tue, 26 Aug 2008 11:24:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen,

may I suggest that instead of screaming "bogus" at the top of your lungs 
all the time and thus discrediting your fellow contributors' work you 
start pitching in with quality assurance?  There sure are an awful lot 
of stale bugs and unbuildable stuff in OE.

I am well aware that COMPATIBLE_MACHINE in the definition of fso-image 
is not the best solution.  At the current state of affairs, it is 
correct though.  The image relies on $XSERVER which is not defined for 
all machines in OE.  Those machines are incompatible with that image 
definition.

You're heartily invited to help fix OE to have a sane default for 
$XSERVER for *all* machines.  I've started work on this but have not yet 
finished.  Until that is done, removing compatible machine from the 
image definition is a step backwards which is why I have disapproved 
commit 9cdbd45b5ff507c6e00fc91c08ec5e17929302f4.

Regards

Rolf



