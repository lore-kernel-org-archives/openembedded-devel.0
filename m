Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JJHV9-0001LP-My
	for openembedded-devel@openembedded.org; Mon, 28 Jan 2008 01:05:27 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JJHVA-0008Nt-Tb
	for openembedded-devel@openembedded.org; Mon, 28 Jan 2008 00:05:28 +0000
Received: from ppp78-37-197-44.pppoe.avangarddsl.ru ([78.37.197.44])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 28 Jan 2008 00:05:28 +0000
Received: from dbaryshkov by ppp78-37-197-44.pppoe.avangarddsl.ru with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 28 Jan 2008 00:05:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 28 Jan 2008 00:05:23 +0000 (UTC)
Message-ID: <fnj683$oaa$5@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ppp78-37-197-44.pppoe.avangarddsl.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
Subject: [RFC] Tosa patches for 2.6.24
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
X-List-Received-Date: Mon, 28 Jan 2008 00:05:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

As some of you know, currently I work on improving the Sharp SL-6000 (tosa)
kernel support. Some parts are going to be merged RSN, some parts are still
in preparation to submission. A pile of patches can't be submitted because
of backwards dependencies. Currently my patchset contains 54 patches.

Now back to support of tosa in OE. I think I have several options:

0) linux-rp-2.6.23 contains support for the device. It has problems, but it's
   mostly working. So leave it just for now, don't touch 2.6.24 and wait for
   2.6.25.
   I would prefer not to follow this path as I want to enlarge testing base
   for patchset and to let tosa-owners use decent kernel features.
1) Add all my patches on the top of linux-rp-2.6.24 as the tosa-specific part.
   This can be hard, as I touch various bits of kernel, this can require
   major efforts.
2) Just start linux-tosa recipe branch, importing few patches from linux-rp,
   and merge them later.
   No major pros et contras.

What would you recommend?

-- 
With best wishes
Dmitry




