Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PZ7cb-00051V-Jd for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 21:00:13 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p01K1RAd018644; Sat, 1 Jan 2011 20:01:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AU2pyddPCGPB; Sat,  1 Jan 2011 20:01:27 +0000 (GMT)
Received: from [192.168.1.42] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p01K1NuR018641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sat, 1 Jan 2011 20:01:24 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimKHkwjhcf_txFk9WPmdk1Njjpi_iny6p7H0WDq@mail.gmail.com>
References: <1293763348.17519.11220.camel@rex>
	<AANLkTimKHkwjhcf_txFk9WPmdk1Njjpi_iny6p7H0WDq@mail.gmail.com>
Date: Sat, 01 Jan 2011 19:59:35 +0000
Message-ID: <1293911975.17519.17148.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Sat, 01 Jan 2011 20:00:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-12-31 at 11:26 +0100, Andrea Adami wrote:
> On Fri, Dec 31, 2010 at 3:42 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > There is a little friction around bitbake at the moment. I think after a
> > discussion I had with Chris earlier on some things are clearer and its
> > probably good to summarise how things stand.
> ...
> 
> If I'm not wrong, Chris just finished the Poky-Sync on a personal branch:
> 
> https://github.com/kergoth/bitbake/tree/poky-sync
> 
> AFAIK he's trying to stabilize master before merging Poky's changes.
> Just ask him :)

I have talked to Chris both in person and over IRC. Recently this
consisted of personal insults thrown at me when I tried to talk about
technical details. I'm doing my best to ignore this and do something
about the technical stuff which is actually what matters.

Regarding the poky-sync branch, its a good move and I do really
appreciate it. I've also been working on the opposite part of the
problem of bringing Poky back into sync incrementally using atomic
commits rather than one big "sync" commit. Its been worthwhile as I've
found a few small areas I think functionality is still missing in
upstream despite the poky-sync branch and I'm going to be addressing
these to bring everything back 100% into sync again (as they were a few
months ago).

This work has been made particularly hard by the tendency of recent
bitbake commits to change several different things in one commit and for
small fixes to sneak into other unrelated commits too.

Cheers,

Richard





