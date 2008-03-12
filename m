Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZLP4-0006VI-Am
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 08:29:40 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZLN6-0007Iv-4X
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 08:27:32 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2008 08:27:28 +0100
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200803120827.29003.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: staging ABI changes and broken idium
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
X-List-Received-Date: Wed, 12 Mar 2008 07:29:40 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,
I was a bit stupid and fought with this issue:

do_compile_prepend() {
	sed -i s,/usr/include,${STAGING_INCDIR},g Makefile
}


What is wrong with this? STAGING_INCDIR is now ending with /usr/include. I 
have grepped through our bb files and searched for this and found quite some 
files doing this.

How to tackle this issue:
	a) Fix the autotools/Makefile.am to not have $(includedir) there
	b) change the sed to be 'absolute' -I/usr/include


This is the command I use to search for it (many places are correct):
	find . -name '*.bb' -exec grep -H "sed " {} \; | grep "/usr/include"

A helping hand fixing these would be appreciated. Something like this might 
exist for other dirs (e.g. libdir) as well and need further checking.


z.


