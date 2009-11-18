Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1NAhwY-0006mF-4N for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:39:25 +0100
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id 2201B140AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 11:37:58 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Nov 2009 11:37:48 +0100
Message-Id: <1258540671-652-1-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: iproute2: Remove undocumented bash runtime dependency, move to INC_PR and rework dir layout
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
X-List-Received-Date: Wed, 18 Nov 2009 10:39:25 -0000

I noticed that iproute2 has a runtime dependency on bash in two of its scripts.
Those dependencies are unneeded, so I removed them.

Before doing that though, I moved the recipes to INC_PR and changed the
directory layout to prevent useless duplication of the patches in the
directories.

I hope that this is the way to go.

Marc



