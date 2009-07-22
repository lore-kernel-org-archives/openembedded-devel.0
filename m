Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MTkUU-0001L5-14
	for openembedded-devel@openembedded.org; Thu, 23 Jul 2009 00:40:50 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6MMPX7T014961; Wed, 22 Jul 2009 23:25:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WvCGzC3cK3qQ; Wed, 22 Jul 2009 23:25:33 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6MMPTdt014937
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 22 Jul 2009 23:25:31 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <Pine.LNX.4.64.0907220859010.3621@juice.ott.cti.com>
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<1248212992.26475.35.camel@dax.rpnet.com> <4A66482B.6010304@cbnco.com>
	<1248252799.10252.5.camel@dax.rpnet.com>
	<Pine.LNX.4.64.0907220859010.3621@juice.ott.cti.com>
Date: Wed, 22 Jul 2009 23:24:33 +0100
Message-Id: <1248301473.14790.5.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Wed, 22 Jul 2009 22:40:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

So I looked into this offlist. The problem is actually OE's
image.bbclass which has:

"addtask rootfs after do_compile before do_install"

introduced in:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=736c06e8d8efa79d3d2bc512f13a51f0f63412e2

Our rootfs_ipk class has:

do_rootfs[recrdeptask] += "do_package_write_ipk"

which means do_rootfs runs after every do_package_write_ipk task that
do_rootfs can recursively depend on.

do_package_write_ipk depends on do_package which depends on do_install.

The image.bb file itself actually has a do_package_write_ipk task just
like any other .bb file and do_rootfs should come after it yet we insert
it before do_install.

So what I'm saying is that I think the new bitbake code has found a
valid error in the metadata and that commit is rather misguided.
Multiple image generation works fine in Poky without that FWIW too.

Does anyone have any thoughts?

Cheers,

Richard




