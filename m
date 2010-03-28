Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Nvvef-0007Db-3k
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 18:48:05 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Mar 2010 18:44:51 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Mar 2010 18:44:51 +0200
Received: from localhost.localdomain ([79.21.202.115]) by
	FBCMCL01B02.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Mar 2010 18:44:50 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Mar 2010 18:44:43 +0200
Message-Id: <1269794684-1331-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.4.4
X-OriginalArrivalTime: 28 Mar 2010 16:44:51.0043 (UTC)
	FILETIME=[FC379330:01CACE95]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] /site question
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
X-List-Received-Date: Sun, 28 Mar 2010 16:48:05 -0000

hi,
I only know what site is for,but:
*I'm not confident with it
*I bet it needs review before touching it
*I wouldn't know in which file I should add the changes
  Maybe common-glibc?

The issue I faced was that btoc.m4 wcrtomb.m4 had no
  defined behaviour in the case of cross-compilation in
  AC_TRY_RUN in fastjar 0.98

The attached patch is a first attempt to fix this issue 
  and is only here for better explanation of the issue
  (it doesn't even patch the site files)

Denis.




