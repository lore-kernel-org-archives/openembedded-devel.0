Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KgfT7-0001xA-GK
	for openembedded-devel@openembedded.org; Fri, 19 Sep 2008 14:52:17 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KgfPp-0005Is-FA
	for openembedded-devel@openembedded.org; Fri, 19 Sep 2008 12:48:58 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 19 Sep 2008 12:48:53 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 19 Sep 2008 12:48:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 19 Sep 2008 14:48:40 +0200
Message-ID: <gb0738$dcq$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080901030016 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: Math is hard, but please pay attention to PV
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
X-List-Received-Date: Fri, 19 Sep 2008 12:52:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I know math is hard and noone care about QA, but this shouldn't happen:

Old version:
libedje0 1:0.9.9.043+cvs20080610-r0

New version:
libedje0 1:0.5.0.043+svnr35727-r1

Hint: '9' > '5', so package upgrades just got broken.

Now, normally someone would eventually get the math right and bump PE, 
but this is the *second* time that EFL stuff goes backwards in PV.

Some googling suggests that openmoko/fso 'solved' this by completely 
deleting the package feeds and having people reflash their devices. That 
is just wrong.

Anyway, PE has been bumped, things should work again this the next EFL 
'upgrade' happens. I just need to find a way to get the past 2 hours of 
my life back.



