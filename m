Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sherbrec@cit-ec.uni-bielefeld.de>)
	id 1QwAOs-0002UM-2i for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 12:09:34 +0200
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id 14DFF99;
	Wed, 24 Aug 2011 12:04:47 +0200 (CEST)
Message-ID: <4E54CC8A.3080507@cit-ec.uni-bielefeld.de>
Date: Wed, 24 Aug 2011 12:03:54 +0200
From: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, tom.rini@gmail.com
Subject: [2011.03-maintenance] Unable to build meta-toolchain
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
X-List-Received-Date: Wed, 24 Aug 2011 10:09:34 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

commit 105d881227d06f31c180dffb777ee63361b2f2b8
  'gcc: Package libstdc++ gdb python helpers into dev package'
breaks meta-toolchain generation. See also [1]

This commit adds dev packages (libstdc++-dev libgcc-dev) to
gcc-cross (gcc-package-cross.inc) which are already part of
gcc. The libgcc-dev package both include the libgcc_s.so file
which triggers a 'file is already provided by package' error on
incremental builds. The libstdc++-dev package have different
content and triggers a 'Cannot satisfy the following
dependencies for task-sdk-bare' error. If an empty
libstdc++-dev package is generated it triggers a
'..../usr/include/c++ not exist' error as this is part of the
package from gcc but not gcc-cross.

For me the gcc-package-cross.inc part of the patch looks wrong
as the dev packages are already part of the gcc recipe and the
python helpers should only be removed from libstdc++ package.

I have the problems with my own machines (armv5te, armv7a)
as well as with a fresh beagleboard build for angstrom-2008.1.

Regards,
     Stefan

[1] 
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg20425.html



