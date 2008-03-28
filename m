Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JfDFv-0007Lz-ET
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 13:00:23 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 462296280B2;
	Fri, 28 Mar 2008 13:00:23 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1206703828.5029.60.camel@dax.rpnet.com>
References: <20080328011211.7c66e00b@zaurus>
	<1206696274.5029.14.camel@dax.rpnet.com>
	<1206699605.18251.39.camel@hammer.suse.cz>
	<1206700621.5029.50.camel@dax.rpnet.com>
	<1206702966.3790.22.camel@hammer.suse.cz>
	<1206703828.5029.60.camel@dax.rpnet.com>
Date: Fri, 28 Mar 2008 13:02:04 +0100
Message-Id: <1206705725.3790.41.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: binconfig.bbclass breaks packages QA
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
X-List-Received-Date: Fri, 28 Mar 2008 12:00:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> A quick glance at my local build shows 217 .pc files and 14 binconfig
> ones. Of the 14 binconfigs I can spot several that also have .pc files.
> binconfig is being replaced by pkgconfig so this number will only shrink
> with time.

It happens most often with gpg-error-config. It is often embedded to .pc
files, but it has no .pc file. Adding .pc file will not fix the problem,
as configure.in checks for gpg-error-config, not for gpg-error.pc. The
second most problematic is cups-config. Other packages are less often
used, or they have its own .pc file, which is preferred in new projects.
Failed projects are for example libgnomecups, gnumeric.

> Secondly if we wrap gcc that doesn't solve the underlying problem of
> bad .pc files. The neat thing now is that we can move the .pc files
> in/out of a sysroot, onto the target system or into different staging
> directories since there are no hardcoded path problems in them anymore.
> yes we have hardcoded paths in .la files and in the binconfig ones but
> that issue is more manageable than having to hack .pc files as well. 

Imagine situation, where all mangling is removed from all tools and only
gcc will do the mangling internally. foo-config will return
-I/usr/include/foo, pkg-config will embed -I/usr/include/foo, make will
call gcc $CFLAGS -I/usr/include/foo. gcc will search in
sysroot/usr/include/foo and everything should work then.

Looking at gcc Bugzilla, this problem affects all toolchains authors.

Actually, changing OE specific gcc patch to prepend search path with
system path instead of ICE would work-around it as well.

I can imagine small patch doing the same more cleanly:
implement new switches, e. g. --sysroot-all-I --sysroot-all-L.

Then change add_sysroot_to_chain() to mangle all -I paths, not only
those in form -I =.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



