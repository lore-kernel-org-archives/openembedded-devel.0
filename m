Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqAcD-0006MW-6o
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 19:56:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KqAXA-00031I-Nk
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 17:51:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 17:51:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 17:51:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Oct 2008 19:51:36 +0200
Message-ID: <gd5aj9$h8u$1@ger.gmane.org>
References: <200810010447.44667.zecke@selfish.org>
	<200810151934.46076.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <200810151934.46076.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: Making it mandantory to have a checksums.ini entry
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
X-List-Received-Date: Wed, 15 Oct 2008 17:56:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-10-2008 19:34, Holger Freyther wrote:
> On Wednesday 01 October 2008 04:47:41 Holger Freyther wrote:
>
> I have added the relevant checksums we had at Openmoko and made it mandatory
> to have a checksum. See the previous mail on how to disable it.

Instead of having people disabling the checks here's how you can help:


Step 1)
	go to TMPDIR and locate the checksums.ini there

Step 2)
	sort the checksums.ini:	
	python 
/OE/org.openembedded.dev/contrib/source-checker/oe-checksums-sorter.py 
checksums.ini > new

Step 3) combine the checksums.ini from OE and yours:
	cat /OE/org.openembedded.dev/conf/checksums.ini checksums.ini > 
combined-sums

Step 4)
	sort the result and apply it to OE
	python 
/OE/org.openembedded.dev/contrib/source-checker/oe-checksums-sorter.py 
combined-sums > /OE/org.openembedded.dev/conf/checksums.ini

Step 5) go to your OE dir and inspect the results:
	cd /OE/org.openembedded.dev
	git diff conf/checksums.ini

The diff should only contain additions (removals and replacements are a 
sign of corruption somewhere).

If you see no spurious changes, commit it and wait for people to bitch 
if you added a corrupted checksum ;)

regards,

Koen



