Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IWAWl-00018E-9J
	for openembedded-devel@openembedded.org; Fri, 14 Sep 2007 14:44:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8ECeljx029856
	for <openembedded-devel@openembedded.org>;
	Fri, 14 Sep 2007 13:40:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29661-05 for <openembedded-devel@openembedded.org>;
	Fri, 14 Sep 2007 13:40:43 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8ECecne029849
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 14 Sep 2007 13:40:38 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Fri, 14 Sep 2007 13:40:37 +0100
Message-Id: <1189773637.6181.20.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: SRCREV change bitbake bug
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
X-List-Received-Date: Fri, 14 Sep 2007 12:44:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This is a quick report of a problem I've been made aware of. Basically
the AUTOREV variable doesn't work as expected with current bitbake which
breaks insane-srcrevs.inc and moko-auto.inc :-(.

The patch below hacks around this. I'd like to have some time to think
about the problem and find a better solution before committing anything
to bitbake. The section of code was already marked "gross hack" and sure
enough, its bitten us already :(.

Anyone needing AUTOREV can probably manage to apply the patch in the
meantime ;-).

Cheers,

Richard


Index: lib/bb/fetch/svn.py
===================================================================
--- lib/bb/fetch/svn.py (revision 970)
+++ lib/bb/fetch/svn.py (working copy)
@@ -77,6 +77,9 @@
                 if rev and "get_srcrev" in rev:
                     ud.revision = self.latest_revision(url, ud, d)
                     ud.date = ""
+                elif rev and "AUTOREV" in rev:
+                    ud.revision = self.latest_revision(url, ud, d)
+                    ud.date = ""
                 elif rev:
                     ud.revision = rev
                     ud.date = "" 




