Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Kr86N-0005eb-Px
	for openembedded-devel@openembedded.org; Sat, 18 Oct 2008 11:28:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9I9RtWf017136
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 10:27:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16742-10 for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 10:27:49 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9I9RiCE017128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 10:27:44 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1224271803.4235.182.camel@lenovo.internal.reciva.com>
References: <1224271803.4235.182.camel@lenovo.internal.reciva.com>
Date: Sat, 18 Oct 2008 10:27:44 +0100
Message-Id: <1224322064.5215.17.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: remove ld.so.conf from glibc?
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
X-List-Received-Date: Sat, 18 Oct 2008 09:28:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, 2008-10-17 at 20:30 +0100, Phil Blundell wrote:
> At present, the main glibc package (libc6 in most DISTROs) is shipping
> an /etc/ld.so.conf file which mentions /usr/local/lib
> and /usr/X11R6/lib.  I think it has basically been this way for all
> time, and I suspect the original file was probably imported from Chris's
> openzaurus installation way back when.
> 
> As far as I can tell, this file is not serving any useful purpose on any
> contemporary DISTRO.  On the contrary, aside from contributing to
> filesystem clutter, its only real effect will be to slow down shared
> library loading.  So, I would propose to delete it from the libc6
> package.  Any DISTRO which does need this file can, of course, ship it
> in a separate package of their own.
> 
> Comments?

I agree with this. Poky already removed cruft from this file and has a
modified version so splitting it into a separate package would be good
which distros can deal with as needed.

Cheers,

Richard





