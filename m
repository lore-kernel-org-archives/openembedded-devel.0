Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MHLBq-00070O-2E
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 19:14:18 +0200
Received: (qmail 12601 invoked by uid 107); 18 Jun 2009 17:03:39 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 18 Jun 2009 19:03:39 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2009 19:03:33 +0200
Message-Id: <1245344614-22213-1-git-send-email-valentin.longchamp@epfl.ch>
X-Mailer: git-send-email 1.6.0.4
Subject: [RFC] change qmake2 to qmake4
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
X-List-Received-Date: Thu, 18 Jun 2009 17:14:18 -0000

As I have already explained in an email earlier today, some tools
(cmake for instance, with its FindQt4 Module) look for a qmake under
a certain name (that can be qmake or qmake4 ... but not qmake2).

This patch proposes to change this name. With this, all the other qt
tools consistently have the 4 at the end of their name.

Of course, all the recipes that inherit qmake2 should be changed, but
this is not done here since it's only a RFC to start a discussion

Best Regards

Valentin


