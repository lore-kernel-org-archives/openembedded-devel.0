Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1SBBtt-0005Co-Hz
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 22:19:57 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id ECAF7223263B;
	Fri, 23 Mar 2012 22:11:02 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1471E2232639;
	Fri, 23 Mar 2012 22:11:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g230116255.adsl.alicedsl.de
	[92.230.116.255]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Fri, 23 Mar 2012 22:11:02 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 053853C4C1; Fri, 23 Mar 2012 22:11:00 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 22:10:57 +0100
Message-Id: <1332537058-13783-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9.1
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN
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
X-List-Received-Date: Fri, 23 Mar 2012 21:19:57 -0000

Hi,

while building openjdk I discovered that relocatable.bbclass strips
all PATHS with ORIGIN, that is problematic, when binaries like an jdk
is installed not in the standard paths /lib or /usr/lib.

This patch let all exisiting ORIGIN stay in the binary. So
far I only saw problems with some perl-native libs, where chrpath fails
now, because the path is to long. But it seems they work anyway.

While letting the path stay in binary it occurs that whitespaces at the end
of the last path sneaked some how in. So I made re.sub line to clean this up.

Bye Henning

Henning Heinold (1):
  relocatable.bbclass: do not erease already existing ORIGIN paths and
    sanity resulting rpath

 meta/classes/relocatable.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.9.1


