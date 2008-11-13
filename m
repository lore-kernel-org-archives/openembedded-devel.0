Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L0glg-0001e5-6G
	for openembedded-devel@openembedded.org; Thu, 13 Nov 2008 19:18:12 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L0gjf-0000u1-VN
	for openembedded-devel@openembedded.org; Thu, 13 Nov 2008 18:16:08 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 13 Nov 2008 18:16:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Nov 2008 18:16:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 Nov 2008 19:15:58 +0100
Message-ID: <gfhqsu$see$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081112 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: Fixes for OSX (and *BSD) buildhosts
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
X-List-Received-Date: Thu, 13 Nov 2008 18:18:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

For the past few days I have been collecting patches to get OE working 
on my powerbook and put them in this branch:

http://gitweb.openembedded.net/?p=openembedded.git;a=shortlog;h=refs/heads/koen/darwin-host-fixes

To get started:

* make sure /usr/bin/gcc points to gcc-4.2, apple's 4.0 ignores 
__attribute_inline__ and the build will fail on gmp-native with clashing 
symbols

* install quilt using macports (or fink, I only tried macports), 
ASSUME_PROVIDED += "quilt-native"

* bitbake sed-native, remove ASSUME_PROVIDED += "quilt-native"

With all that I can complete do_configure of gcc-cross-initial, it stops 
at do_compile with an error in fix-includes.

If you have more fixes, don't hesitate to commit them to the branch.

regards,

Koen



