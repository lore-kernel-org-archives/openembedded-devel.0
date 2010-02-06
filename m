Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Ndiy0-0001AV-0X
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 12:36:51 +0100
Received: from localhost ([127.0.0.1])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Ndiva-0007e6-M9
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 11:34:18 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <D15778FFF6A6CA4FAF01B8D2C3780300499DAE1590@ushqwmb02.palm1.palmone.com>
References: <D15778FFF6A6CA4FAF01B8D2C3780300499DAE1590@ushqwmb02.palm1.palmone.com>
Date: Sat, 06 Feb 2010 11:31:18 +0000
Message-ID: <1265455878.5019.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Issues with .list files
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
X-List-Received-Date: Sat, 06 Feb 2010 11:36:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-02-04 at 19:24 -0800, Michael Morrell wrote:
> If I understand the algorithm in package_do_shlibs correctly, each package creates a .list file which is a list of all the shared libraries provided by that package.  It also generates a list of all the libraries that it needs and looks for those in .list files created by other packages so it can create a runtime dependency against that package.
> 
> The way it looks for .list files is to simply scan all *.list files in the directory.  This has two problems that I can see.
> 
> First, it is inefficient.  It should only have to look through .list files creates by packages created by bb files which were DEPENDed on by this bb file.

That's an interesting point.  I think this probably is true, although it
would lead to some issues with packages that currently have incomplete
DEPENDS (or which rely on the historically-transitive behaviour of
DEPENDS for correct operation); there are probably quite a lot of these.
If you're going to make this change then I think you would also need to
change the current "couldn't find shlib provider for..." warning into a
fatal error.

Do you have any feel for how much time would actually be saved by
eliminating the unnecessary scan of other .list files?

> Second, when a bitbake run is done with lots of parallelism, it is possible that it tries to open a nonexistent .list file (it was there when it did the os.listdir call, but that package later removed it before it recreates it), causing a crash here.  We are seeing such crashes reasonably often.

This one is definitely just a bug (and, I think, unrelated to the first
issue).  Any time you create or modify a file in a live part of staging,
it needs to be done atomically and it sounds like package.bbclass is
currently failing to do that.  Feel free to make a patch, or I can look
at this instead if you want.

p.




