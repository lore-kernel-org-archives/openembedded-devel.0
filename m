Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HpVJ8-0005Rp-Ir
	for openembedded-devel@openembedded.org; Sat, 19 May 2007 22:13:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4JKD67e006356
	for <openembedded-devel@openembedded.org>;
	Sat, 19 May 2007 21:13:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05976-07 for <openembedded-devel@openembedded.org>;
	Sat, 19 May 2007 21:13:03 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4JKD0YL006349
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 19 May 2007 21:13:01 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <464F3AC8.5000804@dominion.kabel.utwente.nl>
References: <463C9EA9.2060302@dominion.kabel.utwente.nl>
	<464F3AC8.5000804@dominion.kabel.utwente.nl>
Date: Sat, 19 May 2007 21:13:01 +0100
Message-Id: <1179605582.5852.9.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: make do_install and do_deploy a PACKAGE_FUNC
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
X-List-Received-Date: Sat, 19 May 2007 20:13:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-05-19 at 19:58 +0200, Koen Kooi wrote:
> Koen Kooi schreef:
> > Hi,
> > 
> > Lately there have been several problems with files not getting packaged, because users
> > resumed builds after a failure. Richard has come up with a fix:
> > 
> > http://www.rpsys.net/openzaurus/temp/oe-install-change.patch
> > 
> > The only bug with that patch is that do_deploy fails, which can be solved by making that a
> >  PACKAGE_FUNC as well.
> > 
> > What do you think about that?
> 
> So this is bugfree and can go in immediately?

I'm in two minds about this.

An alternative is we stop populate_packages() moving files around,
copying them instead. This means deploy can run after install, install
can be a separate task and builds should continue where they left of if
interrupted during the packaging phase.

Opinions?

Richard



