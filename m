Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SDE52-0007GD-SZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 14:03:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 81D6B315AA03
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 13:54:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id G6cPEe8av2AM
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 13:54:42 +0200 (CEST)
Received: from [172.22.22.61] (drms-590cf1a1.pool.mediaWays.net
	[89.12.241.161])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 04765315A9A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 13:54:41 +0200 (CEST)
Message-ID: <4F744D81.1090202@opendreambox.org>
Date: Thu, 29 Mar 2012 13:54:41 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1333018650-987-1-git-send-email-gary@mlbassoc.com>
	<4F7449C6.8090004@opendreambox.org> <4F744BD1.1070309@mlbassoc.com>
In-Reply-To: <4F744BD1.1070309@mlbassoc.com>
Subject: Re: [meta-oe 1/2] python-twisted: update to latest upstream version
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
X-List-Received-Date: Thu, 29 Mar 2012 12:03:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 29.03.2012 13:47, Gary Thomas wrote:
> On 2012-03-29 05:38, Andreas Oberritter wrote:
>> Hi Gary,
>>
>> I was going to submit a similar patch. See my comments inline.
> 
> Feel free to submit yours - I have no investment in my version, it was
> purely
> an update of the one in the current repo with a couple of tweaks.

I held it back, because I haven't decided yet what to do with the
unpackaged files:

WARNING: For recipe python-twisted, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/top_level.txt
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/requires.txt
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/SOURCES.txt
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/PKG-INFO
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/dependency_links.txt
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/not-zip-safe
WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles
WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles/README
WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles/NEWS
WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles/CREDITS
WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles/ChangeLog.Old
WARNING:   /usr/lib/python2.7/site-packages/twisted/python/_initgroups.c
WARNING:   /usr/lib/python2.7/site-packages/twisted/python/twisted-completion.zsh
WARNING:   /usr/lib/python2.7/site-packages/twisted/python/_epoll.c

I also wonder why _initgroups.c and _epoll.c don't get deleted by the command
in do_install_append(). Did you observe the same behaviour?

> BTW, I couldn't figure out how to get 'git' to recognize this as a rename
> with changes when I commited the change.  Any hints?

It depends on the percentage of changed lines. See the --find-renames option
of git-diff(1).

Regards,
Andreas


