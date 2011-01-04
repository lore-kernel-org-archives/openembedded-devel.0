Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1Pa4rU-0001CQ-F4
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 12:15:32 +0100
Received: by gravedo.de (Postfix, from userid 5001)
	id C95CC47A004F; Tue,  4 Jan 2011 12:08:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (brmn-4d0aa6bf.pool.mediaWays.net [77.10.166.191])
	by gravedo.de (Postfix) with ESMTPSA id CC5C9275CD2A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jan 2011 12:08:39 +0100 (CET)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jan 2011 12:08:35 +0100
Message-Id: <1294139317-28208-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
Subject: Adding recipe for compat-wireless-2.6-old
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
X-List-Received-Date: Tue, 04 Jan 2011 11:15:32 -0000

Heyho,

for the palmpre machine we currently need the libertas driver from the very old
compat-wireless-2.6-old. The first patch adds a recipe to build compat-wireless-2.6-old
and the second patch adjusts it for the palmpre machine. As compat-wireless-2.6-old is old
and no longer maintained it will be only maintained by me as long as the palmpre machine
is
not using newer compat-wireless (libertas from newer compat-wireless fails and gives us no
working wireless). When palmpre machine can use newer compat-wireless and no one else uses
compat-wireless-2.6-old we can remove this recipe.

Please review the two patches and send me your comments!

regards,
morphis



