Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PVAGX-0004vb-Ab
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 23:01:05 +0100
Received: from gandalf.denix.org ([unknown] [71.255.236.20])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LDS00GTZT55BFK0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	21 Dec 2010 16:00:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6067614AF64; Tue,
	21 Dec 2010 17:00:41 -0500 (EST)
Date: Tue, 21 Dec 2010 17:00:41 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101221220041.GD19986@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: base.bbclass changes broke BitBake 1.8.19
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
X-List-Received-Date: Tue, 21 Dec 2010 22:01:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Chris,

The c67b95955d023c1f198531b4f06100a40b05efa7 has introduced the following 
problem with BitBake 1.8.19 and even af81d52e48cb6d4f91fff0c70e09dfd421e0057d 
didn't fix it. Any thoughts? Thanks.

Traceback (most recent call last):
  File "/OE/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/OE/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/OE/bitbake/lib/bb/cooker.py", line 640, in cook
Parsing .bb files, please wait...done.
NOTE: Parsing finished. 0 cached, 7152 parsed, 358 skipped, 945 masked.
    return self.buildTargets(pkgs_to_build)
  File "/OE/bitbake/lib/bb/cooker.py", line 527, in buildTargets
NOTE: build ${DISTRO_NAME} ${DISTRO_VERSION}: started
    bb.event.fire(bb.event.BuildStarted(buildname, targets, 
self.configuration.event_data))
  File "/OE/bitbake/lib/bb/event.py", line 67, in fire
    if tmpHandler(event) == Handled:
  File "tmpHandler(e)", line 10, in tmpHandler
  File "/OE/bitbake/lib/bb/__init__.py", line 100, in plain
    bb.msg.warn(''.join(args))
TypeError: warn() takes at least 2 arguments (1 given)

-- 
Denys


