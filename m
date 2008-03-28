Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JfGTH-00074R-Ev
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 16:26:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2SFQO3a001405;
	Fri, 28 Mar 2008 15:26:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01360-01; Fri, 28 Mar 2008 15:26:16 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2SFQDVi001390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 28 Mar 2008 15:26:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Stanislav Brabec <utx@penguin.cz>
In-Reply-To: <1206705725.3790.41.camel@hammer.suse.cz>
References: <20080328011211.7c66e00b@zaurus>
	<1206696274.5029.14.camel@dax.rpnet.com>
	<1206699605.18251.39.camel@hammer.suse.cz>
	<1206700621.5029.50.camel@dax.rpnet.com>
	<1206702966.3790.22.camel@hammer.suse.cz>
	<1206703828.5029.60.camel@dax.rpnet.com>
	<1206705725.3790.41.camel@hammer.suse.cz>
Date: Fri, 28 Mar 2008 15:26:13 +0000
Message-Id: <1206717973.5029.81.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Fri, 28 Mar 2008 15:26:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-03-28 at 13:02 +0100, Stanislav Brabec wrote:
> It happens most often with gpg-error-config. It is often embedded to .pc
> files, but it has no .pc file. Adding .pc file will not fix the problem,
> as configure.in checks for gpg-error-config, not for gpg-error.pc. The
> second most problematic is cups-config. Other packages are less often
> used, or they have its own .pc file, which is preferred in new projects.
> Failed projects are for example libgnomecups, gnumeric.

The projects using these will need updates too, this is usually just a
case of adding a line to the Requires field in the .pc (if the lib is
optional there is slightly more work than that). Hopefully we'll be able
to convince the upstream sources to change to pkg-config so the patches
will disappear over time.

> Imagine situation, where all mangling is removed from all tools and only
> gcc will do the mangling internally. foo-config will return
> -I/usr/include/foo, pkg-config will embed -I/usr/include/foo, make will
> call gcc $CFLAGS -I/usr/include/foo. gcc will search in
> sysroot/usr/include/foo and everything should work then.

I can envisage this, its just a *massive* change from the current
behaviour and nobody else is doing this. Applications and autoconf don't
work with this in mind.

> Looking at gcc Bugzilla, this problem affects all toolchains authors.
> 
> Actually, changing OE specific gcc patch to prepend search path with
> system path instead of ICE would work-around it as well.
> 
> I can imagine small patch doing the same more cleanly:
> implement new switches, e. g. --sysroot-all-I --sysroot-all-L.
> 
> Then change add_sysroot_to_chain() to mangle all -I paths, not only
> those in form -I =.

Its a nice idea but doing something like this is outside the scope of
OE. By all means experiment if you want, OE's metadata provides an ideal
testing ground for that but I don't think its something OE will be
switching to any time soon.

Regards,

Richard





