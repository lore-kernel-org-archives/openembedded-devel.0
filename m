Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PjBr4-0007Wn-7Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 15:32:46 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 485961D366C2; Sat, 29 Jan 2011 15:31:54 +0100 (CET)
Date: Sat, 29 Jan 2011 15:31:54 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110129143154.GN2466@ibawizard.net>
References: <1296220547-14948-1-git-send-email-sujak.marek@gmail.com>
	<4D430EA4.7000504@eukrea.com>
	<AANLkTi=W1L5-7L_jdNhXNu8JsW09GGJ=bO0KTKrFb9Ek@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=W1L5-7L_jdNhXNu8JsW09GGJ=bO0KTKrFb9Ek@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH v2] barebox: patches for barebox 2010.10 to	support vmx25
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
X-List-Received-Date: Sat, 29 Jan 2011 14:32:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Marek Sujak <sujak.marek@gmail.com> [2011-01-29 08:34:45]:

> I have  a question about these commits.  Should i reset git to default state
> (or clone it again) and then commit new files?  Or make commit that will
> firstly remove these files and them upload them in correct order (firstly
> raw support, then architecture depended patch)?

If I understand your question correctly, than you don't need to clone/reset
anything at all. You should just learn git-rebase or maybe just the
git-cherry-pick for the beginning:

$ git checkout -b oe-upstream origin/master
$ git cherry-pick -n <hash of '[PATCH v2] barebox: added recipe for barebox v 2010.10'>
$ vim barebox-recipe # remove the vmx25 bits from the recipe
$ git add barebox-recipe && git commit -a -m 'barebox: added barebox 2010.10'

$ git cherry-pick -n <hash of 'barebox: patches for barebox 2010.10 to support vmx25'>
$ vim barebox-recipe # add vmx25 bits and vmx25 patch
$ git add barebox-recipe barebox-vmx25-patch
$ git commit -a -m 'barebox: add support for vmx25 machine'

$ #test-build the changes now
$ #git format v3 of your patchset
$ #review the patches
$ #git send the patches

BTW, it's really a lot easier and faster with git-rebase, it's worth learning it.

-- ynezz


