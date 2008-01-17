Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JFVSB-0005R1-6j
	for openembedded-devel@openembedded.org; Thu, 17 Jan 2008 15:10:48 +0100
Received: (qmail 27421 invoked by uid 813007); 17 Jan 2008 14:10:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 17 Jan 2008 14:10:45 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: john_lee@openmoko.com,
 openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jan 2008 15:10:37 +0100
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200801171510.39160.openembedded@haerwu.biz>
Subject: [oe-commits] org.oe.dev (Merge OM mtn modification back into mainline)
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
X-List-Received-Date: Thu, 17 Jan 2008 14:10:49 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


----------

(Merge OM mtn modification back into mainline)
Add fbset by Dodji's request.

----------

(Merge OM mtn modification back into mainline)
Add ability to find the directory of parent package if the child package
is of different arch.

----------

(Merge OM mtn modification back into mainline)
Remove ipkg-list-fields because already in ipkg-utils

----------

(Merge OM mtn modification back into mainline)
Integrate mainstream to build meta-toolchain-openmoko

packages/meta/meta-toolchain-openmoko.bb: will install
task-openmoko-toolchain-{target,host}

task-openmoko-toolchain-target: specific to target arch.

task-openmoko-toolchain-host: for host and all, such as
openmoko-sample2-src

moko-autorev.inc, sane-srcrevs.inc: add 
SRCREV_pn-openmoko-toolchain-scripts

openmoko-toolchain-scripts_svn.bb: will not install sample code now.

openmoko-sample2_svn.bb: update PACKAGE_ARCH_${PN}-src to be used by
ipkg-sdk.conf

----------

Please read http://www.openembedded.org/wiki/CommitPolicy and REMEMBER how 
commit logs should look. And how changes should be pushed.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

Fixing apps to stop polling and thrashing the disk would be of more use 
than using 'gcc -OMG'




