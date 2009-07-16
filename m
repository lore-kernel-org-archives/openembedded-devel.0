Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MRQbU-0008TB-Px
	for openembedded-devel@openembedded.org; Thu, 16 Jul 2009 15:02:29 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MRQOO-00074s-Sq
	for openembedded-devel@openembedded.org; Thu, 16 Jul 2009 12:48:56 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 16 Jul 2009 12:48:56 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Jul 2009 12:48:56 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Jul 2009 14:48:43 +0200
Message-ID: <h3n7jb$il3$1@ger.gmane.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF928@hiob.intern.dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090708 Shredder/3.0b3pre
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF928@hiob.intern.dresearch.de>
Sender: news <news@ger.gmane.org>
Subject: Re: Baking coreutils-native-7.2-r0 fails
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
X-List-Received-Date: Thu, 16 Jul 2009 13:02:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-07-09 14:10, Sledz, Steffen wrote:
> I've an interesting problem baking coreutils-native-7.2-r0 (org.openembedded.dev branch with Angstrom distro and different machines, checked e.g. with beagleboard, x86, and hipox) on some hosts:
>
> NOTE: Running task 28 of 69 (ID: 7, /home/DRESEARCH/sledz/work/openembedded/recipes/coreutils/coreutils-native_7.2.bb, do_compile)
> ERROR: function do_compile failed
> ERROR: log data follows (/home/DRESEARCH/sledz/oe/tmp.3/work/i686-linux/coreutils-native-7.2-r0/temp/log.do_compile.757)
> | NOTE: make
> | make: GNUmakefile: Too many levels of symbolic links
> | make: stat: GNUmakefile: Too many levels of symbolic links
> | make: *** No rule to make target `GNUmakefile'.  Stop.
> | FATAL: oe_runmake failed
>
> I've tried building on two different hosts: on one of them (mobil-400-300) everything works well, on the other (fsc-480-012-88) the mentioned problem occurs (logs for both are attached). Both are running openSUSE 11.1 (same patch level), same bitbake version, same OE release (last commit is c0b076183453b890a5baaf5bbd2d53061e5ecc84). I started with an empty sources dir and tmp.3 was deleted before too.
>
> I'm totally confused. What's wrong here?

Sounds like your builddir is either on nfs or contains a symlink.

regards,

Koen



