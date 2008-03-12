Received: from [62.70.27.150] (helo=hoat.troll.no)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tcooksey@trolltech.com>) id 1JZSL6-0001kk-9C
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 15:54:10 +0100
Received: from hoat.troll.no (tedur.troll.no [62.70.27.154])
	by hoat.troll.no (Postfix) with SMTP id BBBC540002
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 15:51:50 +0100 (CET)
Received: from sx01.troll.no (sx01.troll.no [62.70.27.21])
	by hoat.troll.no (Postfix) with ESMTP id B5E47205F5
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 15:51:50 +0100 (CET)
Received: from sx01.troll.no (localhost.localdomain [127.0.0.1])
	by sx01.troll.no (8.13.8/8.13.8) with ESMTP id m2CEpoJ9028955
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 15:51:50 +0100
Received: from tomdev.troll.no (tomdev.troll.no [10.3.5.39])
	by sx01.troll.no (Scalix SMTP Relay 11.3.0.11339)
	via ESMTP; Wed, 12 Mar 2008 15:51:50 +0100 (CET)
Date: Wed, 12 Mar 2008 15:51:49 +0100
From: Tom Cooksey <thomas.cooksey@trolltech.com>
To: openembedded-devel@openembedded.org
Message-ID: <200803121551.50037.thomas.cooksey@trolltech.com>
In-Reply-To: <74d0deb30803120216y65be1b2cmaaaa9b2acf98ecee@mail.gmail.com>
References: <47D71B8F.1030108@balister.org>
References: <74d0deb30803120216y65be1b2cmaaaa9b2acf98ecee@mail.gmail.com>
x-scalix-Hops: 1
Organization: Trolltech
User-Agent: KMail/1.9.7
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.70.27.150
X-SA-Exim-Mail-From: tcooksey@trolltech.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git versus Hg
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
X-List-Received-Date: Wed, 12 Mar 2008 14:54:17 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Disposition: inline


> What is still unclear to me is how well a shared git repository with
> push access for multiple parties is going to work. The mobile-linux
> repository on serenity had some kind of permission trouble before we
> added the group permission fixup in the post-update hook.

In Trolltech, we are currently "migrating" from perforce to git. At the
moment my work-flow is to use git-p4 script to pull in changes from
the central p4 repo. Then I use git locally with several different 
branches (one for each area I'm working on). When I'm happy with
something and want to push it into our main repo, I again use the
git-p4 script.

This kindof hybrid style of working suits me pretty well as I know I
can't mess anything up in the central repo with just git. :-) The git-p4
script integrates the change history etc. so it's like working nativly
with git. 

I've also tried to push things with git and found it's pretty tough to 
get right the first time you try.

I've noticed there are similar integration scripts for svn. Perhaps 
there could be a "central" svn repo, then individual developers can use 
git locally. You can still setup git remotes to cherry pick other people's 
commits, if you need that.


As an OpenEmbedded newbie, one more thing I would say is this:

The learning curve for OpenEmbedded is huge. The documentation
is rather sparce and I personally found trying to understand what's
going on very difficult (I'm also a python newbie which probably 
didn't help!). If you choose a well-known SCM system, it's one less 
thing new potential developers need to learn. They have enough to 
learn as it is.



Cheers,

Tom

PS: Personally, I'd never heard of Hg until reading threads on this list.


