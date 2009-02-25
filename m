Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcQJN-0005I7-Qc
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 21:24:59 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcQGE-0007CC-FW
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 20:21:42 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 20:21:42 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 20:21:42 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Feb 2009 21:21:32 +0100
Message-ID: <go498c$bqq$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
Sender: news <news@ger.gmane.org>
Subject: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Wed, 25 Feb 2009 20:25:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I keep trying to teach people the difference between recipes (what's in 
OE) and packages (what you install on the target) and keep getting 
reactions like "ok, but why is the dir called packages?", which are 
completely valid.

Proposal:

mv packages recipes ; git commit .

While it would make setting up OE more intuitive, it does mean that 
people have to adjust local.conf and distro people need to update their 
installation instructions.

I have some other intrusive proposals about shuffling things around in 
TMP a bit (and out of TMP as well), standardizing on source locations 
for source_distribute and sourcepkg, etc, but let's start with this easy 
one.

The main motivation for all this is to make the next stable branch 
easier to grasp for newbies than the current OE structure.

regards,

Koen



