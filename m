Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N5ems-0002lR-Qw
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 13:16:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id E58561416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2009 13:12:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UsqZe6+K8sD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2009 13:12:28 +0100 (CET)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id BDE751416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2009 13:12:28 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1257199740.10804.41.camel@dax.rpnet.com>
References: <1257169407.11338.71.camel@dax.rpnet.com>
	<1257199740.10804.41.camel@dax.rpnet.com>
Date: Wed, 04 Nov 2009 13:15:19 +0100
Message-Id: <1257336919.14421.60.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
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
X-List-Received-Date: Wed, 04 Nov 2009 12:16:34 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:

I agree with the new concept. I did not understand, why we need
do_stage, if we can mangle and stage DESTDIR directly.

> do_package takes a copy of ${D} into ${PKGD} and then runs the functions
> in PACKAGE_PREPROCESS_FUNCS which can alter this directory. The result
> is then packaged.

Maybe do_mangle and do_mangle_append or so may look better from an user
aspect and easier to port (just move extra commands from do_stage to
do_mangle_append). But PACKAGE_PREPROCESS_FUNCS should be OK as well.

> * Any do_stage where we do an autotools_stage_all can just be deleted.

And autotools_stage class will become just autotools.

> * Native packages with delete do_install should not anymore.

Thinking about it, do still make separate native recipes sense after
this change? Most of them could recycle nearly the same recipe then.
(Specially patched utilities would be an exception.)

I can imagine, that native build will be built from the host recipe,
just with a different setup.

> * Any do_stage function which installs extra things compared to
> do_install is very suspect and needs an explanation of why. Most likely
> do_install should be fixed and do_stage then deleted.

I agree. Shorter file list in do_stage might have had some sense to save
few megabytes of unused stuff in staging dir, but it is a small profit
from the double work.

> * If do_stage really needs to do something other than what is in
> do_install a function should be written to operate on SYSROOT_DESTDIR
> and that function should be appended to SYSROOT_PREPROCESS_FUNCS. There
> are some -native binary special cases which will need this but almost
> everything should *not* need this.

Example of special case may be guile. Mangling of guile-config must be
done in a special way (guile-config is a guile script, not shell
script). I cannot remember any other recipe, that needs it.

> Comments and experiments with the branch welcome. If I get some time
> I'll try and start adding a few conversions to the branch.

It's a bit unrelated, but I would like to see temp/run.do_... script for
splitting install dir to sub-package dirs and packages and
temp/log.do_... with QA output that warns about unpackaged files.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



