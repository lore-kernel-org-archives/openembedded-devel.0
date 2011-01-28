Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1PipOS-0000OT-BR
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 15:33:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id C98E114019DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 15:36:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NGXnGPtBDqnL
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 15:36:29 +0100 (CET)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id A91AF14019D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 15:36:29 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D42198B.5070604@opendreambox.org>
References: <1296167465.14370.7.camel@utx.lan>
	<4D42198B.5070604@opendreambox.org>
Date: Fri, 28 Jan 2011 15:32:55 +0100
Message-ID: <1296225175.1265.39.camel@hammer.site>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
Subject: Re: [RFC][PATCH] binconfig.bbclass: search configs in PKGD instead of S
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
X-List-Received-Date: Fri, 28 Jan 2011 14:33:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Andreas Oberritter wrote:
> On 01/27/2011 11:31 PM, Stanislav Brabec wrote:
> > It seems that searching for binconfig in S makes more problems than it
> > brings benefits. It breaks for example ncurses - it populates
> > ncurses-config instead of ncurses5-config and ncursesw5-config).
> 
> Indeed. Installing *-config files which don't get installed by the
> recipe is prone to cause subtle errors. I modified pkgconfig.bbclass in
> a similar way in commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8.

Yes, it can cause installation of .pc that are not intended to be
installed. It also saves the grep -v -- '-uninstalled.pc$'.

> "find recipes -name "*-config" -type f" shows candidates which may cause
> breakage with this patch applied, in case they need to be installed but
> only get copied to the source directory.

Well, it is possible, especially for packages that don't use "make
install" in any form. But the correct solution for that problem would be
different: Install these -config files in do_install and let binconfig
to mangle and move them automatically. If one depends on the old form of
binconfig, -config files are missing in the target native -devel
packages. (Most users will not see any problems until they try to
compile on the target native system.)

> > Searching in the installed root seems to be more logical.
> > 
> > Most packages don't need to be ported to this change, as they install
> > config file with the same name as it exists in sources. But probably
> > several will need porting.
> 
> Why is this function needed at all? Isn't it possible to do the mangling
> before or after do_install like in pkgconfig.bbclass?

binconfig files are a bit special:
- They have to be in the cross environment PATH. The target sysroot is
not (and cannot) be in the cross environment PATH. They have to be
mangled and moved to another location.

- They have to be different in the target package and in the staging
package. I can imagine a different solution, but the current one works
well for most packages.

In case of .pc files, this logic above is embedded into pkg-config
itself, so one does not need additional magic.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



