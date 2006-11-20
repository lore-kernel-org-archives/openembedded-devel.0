Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GlxBt-0001fP-D6
	for openembedded-devel@openembedded.org; Mon, 20 Nov 2006 01:39:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAK0aXs8015334;
	Mon, 20 Nov 2006 00:36:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15289-01; Mon, 20 Nov 2006 00:36:31 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAK0aQGO015325
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 20 Nov 2006 00:36:26 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 20 Nov 2006 00:36:28 +0000
Message-Id: <1163982989.5560.86.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: RFC: Bitbake dependency graph output
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
X-List-Received-Date: Mon, 20 Nov 2006 00:39:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

One of the last tasks on my todo list before I look at the GUI is the
dependency graph generation. Currently this is in self contained code
which works but has odd bugs. I'd like to convert it to use the new
taskData and runqueue data handling routines. The main advantage of
doing this is consistency - I want the graph to actually match what
bitbake does and for that we only want one code path :). 

Currently we can graph DEPENDS and RDEPENDS. Bitbake has changed and now
works at the task level. I'm wondering if outputting DEPENDS and
RDEPENDS data makes sense any longer or should we should output the
actual computed task dependencies?

As an example, the task based output would look like:

"gnu-config-native.do_populate_staging" [label="gnu-config-native do_populate_staging\n0.1+cvs20050701-r4\n/usr/ohoe-max/meta/packages/gnu-config/gnu-config-native_20050701.bb"]
"gnu-config-native.do_populate_staging" -> "gnu-config-native.do_package_write"
"gnu-config-native.do_package_write" [label="gnu-config-native do_package_write\n0.1+cvs20050701-r4\n/usr/ohoe-max/meta/packages/gnu-config/gnu-config-native_20050701.bb"]
"gnu-config-native.do_package_write" -> "gnu-config-native.do_package"
"m4-native.do_unpack" [label="m4-native do_unpack\n1.4.2-r0\n/usr/ohoe-max/meta/packages/m4/m4-native_1.4.2.bb"]
"m4-native.do_unpack" -> "m4-native.do_fetch"
"m4-native.do_fetch" [label="m4-native do_fetch\n1.4.2-r0\n/usr/ohoe-max/meta/packages/m4/m4-native_1.4.2.bb"]
"gnu-config-native.do_compile" [label="gnu-config-native do_compile\n0.1+cvs20050701-r4\n/usr/ohoe-max/meta/packages/gnu-config/gnu-config-native_20050701.bb"]
"gnu-config-native.do_compile" -> "gnu-config-native.do_configure"
"gnu-config-native.do_install" [label="gnu-config-native do_install\n0.1+cvs20050701-r4\n/usr/ohoe-max/meta/packages/gnu-config/gnu-config-native_20050701.bb"]
"gnu-config-native.do_install" -> "gnu-config-native.do_compile"
"gnu-config-native.do_patch" [label="gnu-config-native do_patch\n0.1+cvs20050701-r4\n/usr/ohoe-max/meta/packages/gnu-config/gnu-config-native_20050701.bb"]
"gnu-config-native.do_patch" -> "gnu-config-native.do_unpack"
"gnu-config-native.do_configure" [label="gnu-config-native do_configure\n0.1+cvs20050701-r4\n/usr/ohoe-max/meta/packages/gnu-config/gnu-config-native_20050701.bb"]
"gnu-config-native.do_configure" -> "gnu-config-native.do_unpack"
"gnu-config-native.do_configure" -> "gnu-config-native.do_patch"
"gnu-config-native.do_package" [label="gnu-config-native do_package\n0.1+cvs20050701-r4\n/usr/ohoe-max/meta/packages/gnu-config/gnu-config-native_20050701.bb"]
"gnu-config-native.do_package" -> "gnu-config-native.do_install"
"gnu-config-native.do_unpack" [label="gnu-config-native do_unpack\n0.1+cvs20050701-r4\n/usr/ohoe-max/meta/packages/gnu-config/gnu-config-native_20050701.bb"]
"gnu-config-native.do_unpack" -> "gnu-config-native.do_fetch"
"gnu-config-native.do_fetch" [label="gnu-config-native do_fetch\n0.1+cvs20050701-r4\n/usr/ohoe-max/meta/packages/gnu-config/gnu-config-native_20050701.bb"]

The RFCs:

* Do we need DEPENDS/RDEPENDS or does the above replace that?
* What should we set label to?
* Can we improve the above formatting?
* Should -I IGNORED_DOT_DEPS become a more general commandline option to
be appended to ASSUME_PROVIDED (which my replacement graph code does
internally atm)? Do we want this to support regexps?

http://www.rpsys.net/openzaurus/temp/bitbake_depgraph.patch is the patch
I have atm. 

Regards,

Richard





