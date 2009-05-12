Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M3wmC-000886-47
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 20:32:28 +0200
Received: (qmail 24568 invoked by uid 813007); 12 May 2009 18:25:48 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 May 2009 18:25:48 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 May 2009 20:25:11 +0200
Message-Id: <1242152713-31425-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3
Subject: [STABLE] Updating Python code to work nicer with Python 2.6
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
X-List-Received-Date: Tue, 12 May 2009 18:32:28 -0000

Some time ago I fixed BitBake trunk to not generate DeprecationWarnings
when used with Python 2.6. Some time later Richard Purdie backported it
into bitbake-1.8 branch. Now I tested it with stable/2009 and want to
get it inside.

Patch.bbclass change removes DeprecationWarnings too but has to keep
compatibility with Python 2.4 so I had to use try/except block because
hashlib is 2.5+





