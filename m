Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQjx2-0000oe-2F
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:06:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6706E314B8D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:05:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id fwe-WCSO0nhQ
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:05:03 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 0C248314B04A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:05:02 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 09 Dec 2010 17:05:02 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:05:02 +0000
Message-Id: <1291914302-25298-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] oe-stylize: remove trailing newline when printing unknown variable/routine
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
X-List-Received-Date: Thu, 09 Dec 2010 17:06:40 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 contrib/oe-stylize.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 0a1346c..3c383bc 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -379,7 +379,7 @@ if __name__ == "__main__":
                 line = follow_rule(5, line)
             if var == "":
                 if not in_routine:
-                    print "## Warning: unknown variable/routine \"%s\"" % originalLine
+                    print "## Warning: unknown variable/routine \"%s\"" % originalLine.rstrip('\n')
                 var = 'others'
             for c in commentBloc: seen_vars[var].append(c)
             commentBloc = []
-- 
1.7.2.3



