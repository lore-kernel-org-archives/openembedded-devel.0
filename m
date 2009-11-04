Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N5ftw-0001zh-1D
	for openembedded-devel@openembedded.org; Wed, 04 Nov 2009 14:27:55 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA4DNiKf014401
	for <openembedded-devel@openembedded.org>; Wed, 4 Nov 2009 13:23:44 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rugJPBeELOBs for <openembedded-devel@openembedded.org>;
	Wed,  4 Nov 2009 13:23:44 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA4DNfof014384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Wed, 4 Nov 2009 13:23:43 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1257336919.14421.60.camel@hammer.suse.cz>
References: <1257169407.11338.71.camel@dax.rpnet.com>
	<1257199740.10804.41.camel@dax.rpnet.com>
	<1257336919.14421.60.camel@hammer.suse.cz>
Date: Wed, 04 Nov 2009 13:23:05 +0000
Message-Id: <1257340985.30217.95.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Staging - time to end the current mess - now with patches
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
X-List-Received-Date: Wed, 04 Nov 2009 13:27:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-04 at 13:15 +0100, Stanislav Brabec wrote:
> Richard Purdie wrote:
> > do_package takes a copy of ${D} into ${PKGD} and then runs the functions
> > in PACKAGE_PREPROCESS_FUNCS which can alter this directory. The result
> > is then packaged.
> 
> Maybe do_mangle and do_mangle_append or so may look better from an user
> aspect and easier to port (just move extra commands from do_stage to
> do_mangle_append). But PACKAGE_PREPROCESS_FUNCS should be OK as well.

I have a slight preference for having specific defined functions rather
than concatenation of a load of different things.

I'm toying with the idea of renaming the whole idea of "stage" to
sysroot so we could have do_sysroot_package, do_sysroot_install and
do_sysroot_mangle. That could be a lot clearer for the user?

> > * Any do_stage where we do an autotools_stage_all can just be deleted.
> 
> And autotools_stage class will become just autotools.

Yes, it was always intended as a transition step and this would remove
the need for it.

> > * Native packages with delete do_install should not anymore.
> 
> Thinking about it, do still make separate native recipes sense after
> this change? Most of them could recycle nearly the same recipe then.
> (Specially patched utilities would be an exception.)
> 
> I can imagine, that native build will be built from the host recipe,
> just with a different setup.

I'm a step ahead here with BBCLASSEXTEND :). Since we have a new bitbake
release we can now bump the bitbake version dependency and start using
this. 

An example of its use:

http://git.pokylinux.org/cgit.cgi/poky/tree/meta/packages/mpfr/mpfr_2.3.1.bb

> > * Any do_stage function which installs extra things compared to
> > do_install is very suspect and needs an explanation of why. Most likely
> > do_install should be fixed and do_stage then deleted.
> 
> I agree. Shorter file list in do_stage might have had some sense to save
> few megabytes of unused stuff in staging dir, but it is a small profit
> from the double work.

We can always remove things from staging we know to be useless like docs
in a global/central function. Disk space is not a top consideration
though.

> > * If do_stage really needs to do something other than what is in
> > do_install a function should be written to operate on SYSROOT_DESTDIR
> > and that function should be appended to SYSROOT_PREPROCESS_FUNCS. There
> > are some -native binary special cases which will need this but almost
> > everything should *not* need this.
> 
> Example of special case may be guile. Mangling of guile-config must be
> done in a special way (guile-config is a guile script, not shell
> script). I cannot remember any other recipe, that needs it.

Ok, the framework shout fit that.

> > Comments and experiments with the branch welcome. If I get some time
> > I'll try and start adding a few conversions to the branch.
> 
> It's a bit unrelated, but I would like to see temp/run.do_... script for
> splitting install dir to sub-package dirs and packages and
> temp/log.do_... with QA output that warns about unpackaged files.

bitbake master does this already :)

Cheers,

Richard






