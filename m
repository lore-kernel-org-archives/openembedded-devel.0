Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MHHy8-0001r5-T2
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 15:47:57 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5IDb0Qd009212 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 14:37:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gtmkxmtGB4km for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 14:37:00 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5IDasw9009207
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 14:36:56 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1245330990.29153.152.camel@lenovo.internal.reciva.com>
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
	<1245330335.11257.26.camel@dax.rpnet.com>
	<1245330990.29153.152.camel@lenovo.internal.reciva.com>
Date: Thu, 18 Jun 2009 14:35:54 +0100
Message-Id: <1245332154.30034.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 1/3] Make package_update_index_ipk	proper	task	with locking
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
X-List-Received-Date: Thu, 18 Jun 2009 13:47:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-06-18 at 14:16 +0100, Phil Blundell wrote: 
> On Thu, 2009-06-18 at 14:05 +0100, Richard Purdie wrote:
> > Can I suggest we actually add the ability to lock from shell scripts? A
> > couple of python scripts (bitbake-lock/bitbake-unlock) which just call
> > the python locking functions should be trivial to write and then mean we
> > can add sane locking to specialist functions much more easily. It should
> > allow us to solve the opkg.conf file issue you were seeing easily too.
> > 
> > Adding those shell scripts is slightly trickt - I'm happy to have them
> > in bitbake but we'll need another release before OE.dev can depend on
> > use them. We're overdue a bitbake release so perhaps we can get this
> > done quite quickly though...
> 
> In this particular case there probably isn't any need for the locks to
> be shared between the shell and python worlds since all the ipk handling
> is done in shell.  So I guess it should be fine to just have the shell
> code call something like flock(2) directly, and hence no need for a new
> bitbake release.
> 
> If the issue is just that concurrent calls to ipkg-make-index will
> collide, it's probably as simple as replacing the call to
> ipkg-make-index with "flock some-path -c ipkg-make-index ...".

Agreed, it just somehow seemed nicer to use the same locking functions
for both and its very simple to make it happen at a code level, just the
logistics are tricky.

I probably will add locking scripts to bitbake in case we do want it but
there are other ways simpler ways to solve this particular problem.

Cheers,

Richard



