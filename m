Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4A182606D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 09:42:33 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bPRXr-00009l-Ga for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2016 11:42:31 +0200
Received: from p5DE8CA1F.dip0.t-ipconnect.de ([93.232.202.31])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 11:42:31 +0200
Received: from patrick.ohly by p5DE8CA1F.dip0.t-ipconnect.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 11:42:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 19 Jul 2016 09:42:17 +0000 (UTC)
Message-ID: <loom.20160719T113248-200@post.gmane.org>
References: <20160715210820.6801-1-danismostlikely@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 93.232.202.31 (Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Firefox/38.0 Iceweasel/38.7.1)
Subject: Re: [meta-java][PATCH] openjdk-8: Detect compiler version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2016 09:42:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dan McGregor <danismostlikely <at> gmail.com> writes:


> From: Daniel McGregor <daniel.mcgregor <at> vecima.com>
> 
> Some supported hosts still use GCC 4.X. These don't support the flags
> needed to make GCC 6 work, so check the GCC version and add appropriate
> compiler flags.
> 
> This implementation will append flags for any gcc version, but it's only
> used for GCC 6 right now.

Now I am getting an error directly when bitbake parses the updated
recipes in meta-java:

ERROR: ExpansionError during parsing
.../ostro-os/meta-java/recipes-core/openjdk/openjdk-8_72b05.bb
...
bb.data_smart.ExpansionError: Failure expanding variable CFLAGS,
expression was  -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=.../ostro-os/build/tmp-glibc/work/corei7-64-ostro-
linux/openjdk-8/72b05-r0=/usr/src/debug/openjdk-8/72b05-r0
-fdebug-prefix-map=.../ostro-os/build/tmp-glibc/sysroots/x86_64-linux=
-fdebug-prefix-map=.../ostro-os/build/tmp-glibc/sysroots/intel-corei7-64=
 -fstack-protector-strong -D_FORTIFY_SOURCE=2 
${@version_specific_cflags(d)} -Wno-error=deprecated-declarations which
triggered exception TypeError: can only join an iterable

> +def version_specific_cflags(d):
> +    extraflags = None
> +    version = None
> +
> +    if bb.data.inherits_class('native', d):
> +        from subprocess import Popen, PIPE
> +
> +        cmd = d.expand('${CPP} -P -').split()
> +        cc = Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=PIPE)
> +        # This check is GCC specific. Clang always returns 4. For Clang
> +        # __clang_major__ and __clang_minor__ need to be checked. Ideally
> +        # __GNUC_MINOR__ would be checked as well, but for this recipe
> +        # GCC major is all we care about.
> +        version = cc.communicate(b'__GNUC__')[0].decode('utf-8')[0]
> +    else:
> +        # in the cross case, trust that GCCVERSION is correct. This won't
> +        # work if the native toolchain is Clang, but as of this writing that
> +        # doesn't work anyway.
> +        version = d.getVar('GCCVERSION', expand=True)[0]
> +
> +    if int(version) >= 4:
> +        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True)
> +
> +    return ''.join(extraflags)

The code above only works when FLAGS_GCC<version> is set. In Ostro OS, we
are using GCCVERSION ?= "5.%" because of these unsolveed build breakages
with gcc6, and thus extraflags becomes None, which then triggers the 
exception.

The same problem should also appear when gcc on the host is older than v6.
Has the patch actually been tested on a system where the problem occurs?

As I said in the other mail thread, fixing flags for openjdk-native is one
part of the problem. The other part is distinguishing between flags for the
host compiler and and target compiler when building openjdk - that part is
unsolved, and thus I'd expect compilation to still fail when building on a
host with gcc 4.x and default target gcc.

Bye, Patrick


