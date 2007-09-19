Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IXuXe-00043i-RK
	for openembedded-devel@openembedded.org; Wed, 19 Sep 2007 10:04:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8J80Q0b025056
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Sep 2007 09:00:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24936-04 for <openembedded-devel@openembedded.org>;
	Wed, 19 Sep 2007 09:00:18 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8J80Hwu025039
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Sep 2007 09:00:17 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46F097AD.3030103@student.utwente.nl>
References: <46F0077F.3050807@student.utwente.nl>
	<1190158491.6159.93.camel@localhost.localdomain>
	<46F097AD.3030103@student.utwente.nl>
Date: Wed, 19 Sep 2007 09:00:17 +0100
Message-Id: <1190188817.5670.7.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Revisiting bitbake stamp handling
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
X-List-Received-Date: Wed, 19 Sep 2007 08:04:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-09-19 at 05:29 +0200, Koen Kooi wrote:
> > Say you're using rm_work and want to rebuild strace for the image. You
> > run "bitbake strace -c compile -f". A subsequent "bitbake someimage"
> > will not cause strace to install/package/stage or get included in the
> > image. Broken and one of the things you wanted to fix!
> 
> Actually, that would work, since -c compile -f would update the do_compile stamp, so its
> mtime is newer than the do_rootfs.

do_rootfs is stampless. 

> > Say you want to trigger a reinstall of all packages like the recent
> > pkgmaps change. How do you do it? In the case without rm_work you could
> > touch all a dependent task like compile to trigger the install (ugly),
> > or remove *every* install task stamp and *every* stamp which depends on
> > install (near impossible). With rm_work, you're screwed basically.
> 
> Which highlights exactly why the current situation is broken. In this case the user has to
> discover he needs to run install again (which a lot of them don't, looking at IRC and the
> ml), so what's stopping us from adding an do_installall task that does exactly that? Or
> even requiring a rebuild, since it needs the user to find out *and* the user to take action.

I don't see how a communication issue is related to the need to add a
do_installall task?

Cheers,

Richard



