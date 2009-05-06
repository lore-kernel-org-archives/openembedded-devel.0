Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M1oqL-0004eG-74
	for openembedded-devel@openembedded.org; Wed, 06 May 2009 23:39:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M1okV-0004q1-PC
	for openembedded-devel@openembedded.org; Wed, 06 May 2009 21:33:56 +0000
Received: from 64.101.21.60 ([64.101.21.60])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 06 May 2009 21:33:55 +0000
Received: from msundius by 64.101.21.60 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 06 May 2009 21:33:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Michael Sundius <msundius@sundius.com>
Date: Wed, 6 May 2009 21:33:45 +0000 (UTC)
Message-ID: <loom.20090506T211326-740@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 64.101.21.60 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.15) Gecko/20080702 Fedora/2.0.0.15-1.fc8 Firefox/2.0.0.15)
Sender: news <news@ger.gmane.org>
Subject: Development and Open Embedded
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
X-List-Received-Date: Wed, 06 May 2009 21:39:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi, 

I'm helping my organization move our platform build 
infrastructure to better than the complicated and 
disparate make jumble of make files and tarballs
that we currently use. I've integrated much of it
to Open Embedded (basic root fs image, kernel, tools).

This all works well, but it seems to me (a kernel hacker
mostly) that the hacking cycle of code, compile, run
is a bit difficult if you are working within the confines
of source control systems. 

that is, say I modify a file within my kernel development (git)
tree and then want to compile it. under OE, the whole tree is 
going to be copied to the sources dir, tarballed, and then
extracted into the ${S} directory.  Further, when compiling,
all the output files are left in the ${S} dir, instead of 
directing them to an output directory. 

I find that most of the engineers I know start to grumble when
the have to wait any longer than status quo in any one of the 
steps for turning around a small change to their source. My
experience is mostly inside the kernel, but I suppose other
projects are similar on embedded systems.

I'm wondering if anyone has done such a thing as creating a
recipe that forgoes the "fetch" task and point the ${S} to
a local devel tree.. then adds an extra onto the make command
to place the object in another directory (maybe ${O})... 

Maybe people have solved this problem in other ways or a similar
way. I'd love to get some insight into how this is done in 
other organizations... It would be great to beable to inherit
a class that allows use of an efficient dev cycle.

Thanks



