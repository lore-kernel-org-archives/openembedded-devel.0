Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1O5dOu-0005kr-Qt
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Apr 2010 13:19:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 6BFBBA402D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 12:16:20 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id YWeA1HnC8xXT
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 12:16:15 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 53C69A402B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 12:16:15 +0100 (BST)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 10620238FC; Sat, 24 Apr 2010 12:18:05 +0100 (BST)
Date: Sat, 24 Apr 2010 12:18:05 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100424111805.GA2555@xora-desktop.xora.org.uk>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: do_unpack broken
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
X-List-Received-Date: Sat, 24 Apr 2010 11:19:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, it looks like the series of commits starting with

commit 5c8bfd6873939024d57278343035cfab0257bdb3
Author: Chris Larson <chris_larson@mentor.com>
Date:   Wed Mar 17 08:05:40 2010 -0700

    do_unpack: shift some responsibility around, clean things up

has broken do unpack, I am not able to build since these were pushed to
the tree.

| ERROR: Error in executing python function in: /home/dp/openembedded/org.openembedded.dev/recipes/qemu/qemu_0.12.3.bb
| ERROR: Exception:<type 'exceptions.TypeError'> Message:oe_unpack_file() got an unexpected keyword argument 'env'
| ERROR: Printing the environment of the function
| ERROR: 	0030:			destdir = os.path.join(workdir, *subdirs)
| ERROR: 	0031:			bb.mkdirhier(destdir)
| ERROR: 	0032:		else:
| ERROR: 	0033:			destdir = workdir
| ERROR: 	0034:		oe_unpack_file(local, destdir, env=env, **urldata.parm)
| ERROR: 	0035:
| ERROR: Function base_do_unpack failed

Graeme



