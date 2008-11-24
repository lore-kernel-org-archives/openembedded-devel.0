Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L4SRg-0008LX-0r
	for openembedded-devel@openembedded.org; Mon, 24 Nov 2008 04:49:08 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L4SOq-0006Ns-SL
	for openembedded-devel@openembedded.org; Mon, 24 Nov 2008 03:46:13 +0000
Received: from 203.117.215.163 ([203.117.215.163])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 24 Nov 2008 03:46:12 +0000
Received: from robk by 203.117.215.163 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 24 Nov 2008 03:46:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Mon, 24 Nov 2008 11:45:55 +0800
Message-ID: <ggd81q$re5$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 203.117.215.163
User-Agent: KNode/0.10.9
Sender: news <news@ger.gmane.org>
Subject: Bitbake r1090 (env hiding) makes my build fail.
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
X-List-Received-Date: Mon, 24 Nov 2008 03:49:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Hia,

I'm tracking the stable branch and recently updated bitbake to HEAD. When
trying a build-from-scratch, I noticed BB quickly failed in shasum-native.
Some manual svn disecting pointed to r1090 as the one that caused the fail.
I tried adding a BB_PRESERVE_ENV, but no difference.

Output is at http://pastebin.com/m65e66603. There is no log.do_compile
generated for some reason, and a build with -D shows nothing much. The gcc
invoke actually works OK and produces the oe_shasum256 executable.

Any ideas what could be wrong with my setup?

Cheers!

    Rob



