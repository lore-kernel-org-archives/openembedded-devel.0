Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1GbTbX-0002fs-8r
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 05:02:27 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GbTUO-0007B6-AI
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 04:55:04 +0200
Received: from cm30.sigma248.maxonline.com.sg ([218.212.248.30])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 22 Oct 2006 04:55:04 +0200
Received: from robk by cm30.sigma248.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Oct 2006 04:55:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Sun, 22 Oct 2006 10:57:36 +0800
Message-ID: <ehemhq$f0s$1@sea.gmane.org>
References: <eh4jbk$29v$1@sea.gmane.org> <eh4kc9$63q$1@sea.gmane.org>
	<1161432655.6643.2.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 22 Oct 2006 03:02:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Richard Purdie wrote:
> The patch in 1.7 is for a different problem. I've just updated the 1.6
> branch with the correct fix (add import bb to the top of shell.py).

Thanks for that, it works again now. I still got the crash below, but that
was after a bunch of reparse commands, which might have upset bitbake a bit
perhaps.

Cheers,

    Rob


BB>> which fontconfig-native
Traceback (most recent call last):
  File "/home/rob/oe/bitbake/bin/bitbake", line 1161, in ?
    main()
  File "/home/rob/oe/bitbake/bin/bitbake", line 1156, in main
    cooker.cook( BBConfiguration( options ), args[1:] )
  File "/home/rob/oe/bitbake/bin/bitbake", line 888, in cook
    self.interactiveMode()
  File "/home/rob/oe/bitbake/bin/bitbake", line 793, in interactiveMode
    shell.start( self )
  File "/home/rob/oe/bitbake/lib/bb/shell.py", line 805, in start
    bbshell.main()
  File "/home/rob/oe/bitbake/lib/bb/shell.py", line 780, in main
    self.processCommand( tokens[0], tokens[1:] or "" )
  File "/home/rob/oe/bitbake/lib/bb/shell.py", line 737, in processCommand
    result = function( self.commands, params )
  File "/home/rob/oe/bitbake/lib/bb/shell.py", line 533, in which
    lv, lf, pv, pf = bb.providers.findBestProvider(preferred,
cooker.configuration.data, cooker.status, cooker.build_cache_fail)
  File "/home/rob/oe/bitbake/lib/bb/providers.py", line 41, in
findBestProvider
    files = pkg_pn[pn]
TypeError: list indices must be integers




