Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IGakD-0008Sg-5e
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 15:29:37 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id C1F736284BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2007 15:27:35 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B1D0DA.5030905@balister.org>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>
	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>
Date: Thu, 02 Aug 2007 15:27:35 +0200
Message-Id: <1186061255.5972.243.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Thu, 02 Aug 2007 13:29:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Philip Balister wrote:

> Is --sysroot present in all versions of gcc? If not, which version does 
> it first appear?

3.3.3 has not it yet.

gcc/ChangeLog.2005:
2005-07-25  Mark Mitchell  <mark@codesourcery.com>

	* gcc.c (option_map): Add --sysroot.

Michael Krelin wrote:

> I think starting with 3.4, another reason why this idea maybe not yet
> viable...

I see no problem here: For cross compilation OE compiles its own
compiler, which already supports --sysroot, and for native compilation
--sysroot is not needed (--prefix=.../OE/... is correct there).

Michael Krelin wrote:

> staging doesn't resemble root filesystem, to begin with. So that would
> involve rearranging staging as well. Which is again a good idea, but
> would take longer that it sounds in pure theory.

Yes, I realized that. This step seems to be the most complicated work.
As a work-around it is possible to make symlink "usr" pointing to
staging root.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



