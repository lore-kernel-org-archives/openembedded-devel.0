Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N74DR-0002IP-DI for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 10:37:48 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N74CF-0006wk-Oz
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 10:36:31 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 10:36:31 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 10:36:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 08 Nov 2009 10:36:09 +0100
Message-ID: <hd63e9$t75$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Checksums.ini sorting and updating
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
X-List-Received-Date: Sun, 08 Nov 2009 09:37:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

When adding a new recipe I do:

cd $TMPDIR
cat /OE/org.openembedded.dev/conf/checksums.ini >> checksums.ini  ; 
python 
/OE/org.openembedded.dev/contrib/source-checker/oe-checksums-sorter.py 
checksums.ini > /OE/org.openembedded.dev/conf/checksums.ini

Then, when possible, I match the new entries in conf/checksums.ini to 
the sums upstream publishes. After that I will try to build the recipe 
and if successfull commit it.

Sometimes I encounter what look like spurious changes in 'git diff 
conf/checksums.ini' which are caused by:

1) pre-coffee manual additions that are in the wrong place and get resorted
2) people having deleted(!) checksums that repear due to being in my 
TMPDIR checksum cache

Now 1) can be solved by running a script like the one I mentioned above, 
but 2) needs an attitude adjustment. OE is not wikipedia where recipes 
get deleted because a single person thinks no-one is using them. We have 
lots of people using external overlays for various recipes and deleting 
things from checksums.ini will only make their life harder.

So, please stop deleting checksums and start using a more automated way 
to update checksums.ini :)

regards,

Koen



