Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ga5mC-0007AK-6A
	for openembedded-devel@openembedded.org; Wed, 18 Oct 2006 09:23:44 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ga5fQ-00082R-3s
	for openembedded-devel@openembedded.org; Wed, 18 Oct 2006 09:16:44 +0200
Received: from cm30.sigma248.maxonline.com.sg ([218.212.248.30])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 18 Oct 2006 09:16:44 +0200
Received: from robk by cm30.sigma248.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 18 Oct 2006 09:16:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Wed, 18 Oct 2006 15:19:29 +0800
Message-ID: <eh4kc9$63q$1@sea.gmane.org>
References: <eh4jbk$29v$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: cm30.sigma248.maxonline.com.sg
User-Agent: KNode/0.10.2
Sender: news <news@sea.gmane.org>
Subject: Re: Bitbake-1.6 crashes on 'which'.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 07:23:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Rob Kramer wrote:

> I had to patch 1.6 as below, copied from trunk/bitbake.

Or not; this dies elsewhere. Am I supposed to use 1.6 branch in the first
place? I'll try trunk for now..

Cheers,

    Rob


BB>> edit glibc-initial
Traceback (most recent call last):
  File "/home/rob/oe/bitbake/bin/bitbake", line 1161, in ?
    main()
  File "/home/rob/oe/bitbake/bin/bitbake", line 1156, in main
    cooker.cook( BBConfiguration( options ), args[1:] )
  File "/home/rob/oe/bitbake/bin/bitbake", line 888, in cook
    self.interactiveMode()
  File "/home/rob/oe/bitbake/bin/bitbake", line 793, in interactiveMode
    shell.start( self )
  File "/home/rob/oe/bitbake/lib/bb/shell.py", line 804, in start
    bbshell.main()
  File "/home/rob/oe/bitbake/lib/bb/shell.py", line 779, in main
    self.processCommand( tokens[0], tokens[1:] or "" )
  File "/home/rob/oe/bitbake/lib/bb/shell.py", line 736, in processCommand
    result = function( self.commands, params )
  File "/home/rob/oe/bitbake/lib/bb/shell.py", line 189, in edit
    bbfile = self._findProvider( name )
  File "/home/rob/oe/bitbake/lib/bb/shell.py", line 110, in _findProvider
    lv, lf, pv, pf = Providers.findBestProvider(preferred,
cooker.configuration.data, cooker.status, cooker.build_cache_fail)
  File "/home/rob/oe/bitbake/lib/bb/providers.py", line 41, in
findBestProvider
    files = pkg_pn[pn]
TypeError: list indices must be integers




