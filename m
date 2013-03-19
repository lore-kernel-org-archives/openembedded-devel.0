Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.macdonald@windriver.com>) id 1UI3Zl-0008Hs-S3
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 21:56:06 +0100
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2JKdES6028235
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 13:39:15 -0700 (PDT)
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2013 16:39:11 -0400
Message-Id: <1363725552-11114-1-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.11.3
Subject: [meta-networking] update xl2tpd
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
X-List-Received-Date: Tue, 19 Mar 2013 20:56:06 -0000

I started digging into the xl2tpd build error reported by Martin here:

        http://comments.gmane.org/gmane.comp.handhelds.openembedded/56983

There's actually a chain of errors here that seemed to be present for quite
some time but only came to light when the Yocto kernel updated from 3.4 to 3.8.
It also turns out that the mainline xl2tpd project has fixed these, so I
started down the road of cherry-picking fixes back, then opted to dump the old
1.3.1 recipe and go with a git-based approach.

Opinions?

-- 
-Joe.
:wq



