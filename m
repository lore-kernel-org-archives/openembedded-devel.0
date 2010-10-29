Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PBeC4-0000vF-5V for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 03:55:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PBeBM-0001yJ-KU for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 03:55:04 +0200
Received: from 24-247-92-227.dhcp.bycy.mi.charter.com ([24.247.92.227])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 03:55:04 +0200
Received: from james.ronald by 24-247-92-227.dhcp.bycy.mi.charter.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 03:55:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: James Ronald <james.ronald@gmail.com>
Date: Fri, 29 Oct 2010 01:51:40 +0000 (UTC)
Message-ID: <loom.20101029T033738-284@post.gmane.org>
References: <4CC97820.5090808@nedap.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 24.247.92.227 (Mozilla/5.0 (X11; U; Linux i686;
	en-US) AppleWebKit/534.3 (KHTML, like Gecko) Ubuntu/10.04
	Chromium/6.0.472.62 Chrome/6.0.472.62 Safari/534.3)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake error?
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
X-List-Received-Date: Fri, 29 Oct 2010 01:55:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Jaap de Jong <jaap.dejong <at> nedap.com> writes:

> 
> I'm probably totally stupid...
> What am doing wrong?
> (I'm working on a fresh unstable branch)
> When I bitbake I get:
> 
> MACHINE=at91sam9263ek  bitbake u-boot
> Traceback (most recent call last):
>    File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line 143, in 
> <module>
>      main()
>    File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line 123, in 
> main
>      cooker.parseConfiguration()
>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", line 
> 68, in parseConfiguration
>      self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", line 
> 402, in parseConfigurationFile
>      bb.fetch.fetcher_init(self.configuration.data)
>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/fetch/__init__.py", 
> line 93, in fetcher_init
>      pd = persist_data.PersistData(d)
>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/persist_data.py", 
> line 52, in __init__
>      bb.mkdirhier(self.cachedir)
>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", line 
> 133, in mkdirhier
>      debug(3, "mkdirhier(%s)" % dir)
>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", line 
> 103, in debug
>      bb.msg.debug(lvl, None, ''.join(args))
>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/msg.py", line 100, 
> in debug
>      bb.event.fire(MsgDebug(msg, None))
>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/event.py", line 67, 
> in fire
>      if tmpHandler(event) == Handled:
>    File "tmpHandler(e)", line 8, in tmpHandler
> NameError: global name 'msg' is not defined
> 

I'm getting the exact same error. I'm new to OE and just going through the 
Getting started wiki entry. Ubuntu 10.04 installing bitbake via apt-get install 
bitbake.

bitbake --version 
BitBake Build Tool Core version 1.8.18, bitbake version 1.8.18
  
OE is current as of a few minutes ago.

jr@ubuntu-xpc:~/oe/build$ bitbake nano
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 143, in <module>
    main()
  File "/usr/bin/bitbake", line 123, in main
    cooker.parseConfiguration()
  File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 67, in 
parseConfiguration
    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
  File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 401, in 
parseConfigurationFile
    bb.fetch.fetcher_init(self.configuration.data)
  File "/usr/lib/pymodules/python2.6/bb/fetch/__init__.py", line 93, in 
fetcher_init
    pd = persist_data.PersistData(d)
  File "/usr/lib/pymodules/python2.6/bb/persist_data.py", line 52, in __init__
    bb.mkdirhier(self.cachedir)
  File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 133, in mkdirhier
    debug(3, "mkdirhier(%s)" % dir)
  File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 103, in debug
    bb.msg.debug(lvl, None, ''.join(args))
  File "/usr/lib/pymodules/python2.6/bb/msg.py", line 100, in debug
    bb.event.fire(MsgDebug(msg, None))
  File "/usr/lib/pymodules/python2.6/bb/event.py", line 67, in fire
    if tmpHandler(event) == Handled:
  File "tmpHandler(e)", line 8, in tmpHandler
NameError: global name 'msg' is not defined

- Jim 



