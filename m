Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JJ7DN-0005Jx-B2
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2008 14:06:25 +0100
Received: by fg-out-1718.google.com with SMTP id 22so1508638fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2008 05:06:31 -0800 (PST)
Received: by 10.78.179.12 with SMTP id b12mr5664848huf.34.1201439190899;
	Sun, 27 Jan 2008 05:06:30 -0800 (PST)
Received: from widy.lan ( [88.231.90.74])
	by mx.google.com with ESMTPS id f4sm3083268nfh.31.2008.01.27.05.06.29
	(version=SSLv3 cipher=OTHER); Sun, 27 Jan 2008 05:06:30 -0800 (PST)
Date: Sun, 27 Jan 2008 15:17:57 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <178568040.20080127151757@gmail.com>
To: Thomas Kunze <thommycheck@gmx.de>
In-Reply-To: <1201306409.6002.4.camel@HD>
References: <1201306409.6002.4.camel@HD>
MIME-Version: 1.0
Cc: oe ml <openembedded-devel@lists.openembedded.org>
Subject: Re: Hidden depenencies
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
X-List-Received-Date: Sun, 27 Jan 2008 13:06:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Thomas,

Saturday, January 26, 2008, 2:13:29 AM, you wrote:

> Hi everybody,

> I just spend some hours to figure out why a kernel module I added to
> MACHINE_EXTRA_RRECOMMENDS didn't show up in images. The solution is to
> rebuild task-base.

  To be more exact/verbose, the solution is to bump task-base's PR.

> I think there should a way to handle this in oe.

  Yes, the explicit bumping of PR. Why this is the way to handle it in
OE becomes clear after trying to devise some other scheme. Of course,
some warning from bitbake's side would be nice (just as many other
things from bitbake's side).

> But
> for now we should document such hidden dependencies.

  It's more of indirect dependencies than hidden IMHO. It's not hidden
per se - looking at task-base.bb will immediately shows the fact that
it references MACHINE_EXTRA_*. And vice-versa, doing a
grep -r MACHINE_EXTRA on OE tree will show all its referents.

> Where should this
> be in the wiki? Do you know additional hidden dependencies?

> My list so far:
> MACHINE_EXTRA_RRECOMMENDS -> task-base
module_autoload_* ->> virtual/kernel

   There's pretty developed manual for OE. It already has a section on
task-base, so that info should go there. The same for kernel.

> Regards,
> Thomas


[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



