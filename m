Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Pitrc-0004A5-2D
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 20:20:08 +0100
Received: from localhost.localdomain ([134.86.97.17])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p0SIqb1l024465
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 12:52:38 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 11:52:28 -0700
Message-Id: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5] Relocatable perl-native and use it always
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
X-List-Received-Date: Fri, 28 Jan 2011 19:20:08 -0000

Hey all,

As I've talked about before[1] there's build reproducibility issues
depending on when perl-native is built.  After talking with Mark Hatle
a little bit I started thinking about relocation in perl again and it
turns out that starting in 5.10, upstream perl supports relocation.

This in turn makes it less painful to make perl-native be what we use
when we want perl runtime, nearly everywhere (since you can use pstaging
to avoid it the time next time).

This patch set drops perl 5.8.8 and bumps all of the perl stuffs PR,
switches to relocatable perl-native, and then the big switch to using it
early.

Build tested on {minimal+qemuarm,angstrom-2008.1+beagleboard}+all perl
libs and run tested on minimal+qemuarm+native-sdk-image.

[1]: http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg08445.html

-- 
Tom Rini
Mentor Graphics Corporation 



