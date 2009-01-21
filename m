Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LPiLh-0006b3-4U
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 20:02:50 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LPiEh-0001Xa-SJ
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 18:55:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 18:55:35 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 18:55:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 21 Jan 2009 19:55:24 +0100
Message-ID: <gl7r2t$sge$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090114 Shredder/3.0b2pre
Sender: news <news@ger.gmane.org>
Subject: checksums...
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
X-List-Received-Date: Wed, 21 Jan 2009 19:02:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Could people adding new recipe and people git-am'ing patches adding new 
recipes please add the corresponding checksums to checksums.ini?

It's not hard:

1) bitbake <recipe>
2) watch it fail
3) cd $TMPDIR ; cat /OE/org.openembedded.dev/conf/checksums.ini >> 
checksums.ini ; python 
/OE/org.openembedded.dev/contrib/source-checker/oe-checksums-sorter.py 
checksums.ini > /OE/org.openembedded.dev/conf/checksums.ini
4) git commit --amend /OE/org.openembedded.dev/conf/checksums.ini

regards,

Koen



