Received: from [151.189.21.47] (helo=mail-in-07.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1Mby2x-0000mc-Ps
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 16:46:23 +0200
Received: from mail-in-18-z2.arcor-online.net (mail-in-18-z2.arcor-online.net
	[151.189.8.35]) by mx.arcor.de (Postfix) with ESMTP id 955323CA5BA;
	Fri, 14 Aug 2009 16:29:43 +0200 (CEST)
Received: from mail-in-07.arcor-online.net (mail-in-07.arcor-online.net
	[151.189.21.47])
	by mail-in-18-z2.arcor-online.net (Postfix) with ESMTP id 89BB1510826; 
	Fri, 14 Aug 2009 16:29:43 +0200 (CEST)
Received: from localhost.localdomain (p5B3B193C.dip.t-dialin.net [91.59.25.60])
	(Authenticated sender: leggewie@arcor.de)
	by mail-in-07.arcor-online.net (Postfix) with ESMTPSA id 8F1FF3CA5BA;
	Fri, 14 Aug 2009 16:29:39 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-07.arcor-online.net 8F1FF3CA5BA
From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Aug 2009 16:29:22 +0200
Message-Id: <1250260162-9541-1-git-send-email-oe-devel@rolf.leggewie.biz>
X-Mailer: git-send-email 1.6.3.3
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: [PATCH] base.bbclass: introduce OE source mirror network as last resort for do_fetch
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
X-List-Received-Date: Fri, 14 Aug 2009 14:46:24 -0000

Updating recipes and checksums.ini for vanishing upstream hosts or simple 
restructuring can quickly become a chore for OE devs if taken seriously. 
The OE user experience suffers severely when at any given point in time 4 
to 5 recipes on average fail do_fetch for a simple image.

The solution is for OE to provide its own caching of upstream sources. 
mirrors.openembedded.org is a swarm of possibly incomplete source mirrors 
provided by the community and load-balanced via DNS round robin.  They 
act as a first line of defense and lower bandwidth load on melo which 
hosts sources.openembedded.org.  The melo mirror aims to have a complete 
copy of free-to-publish sources used by the current org.oe.dev branch.

Some distributions have provided source mirrors in the past for their 
users. I think it's time for a general and all-encompassing solution.

The infrastructure is being currently put in place.  This patch will
turn on the OE sources mirror network by default.
---
 classes/base.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 5363e5c..51648da 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1312,6 +1312,10 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/adm
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/
 http://www.apache.org/dist  http://archive.apache.org/dist
+ftp://.*/.*     http://mirrors.openembedded.org/
+https?$://.*/.* http://mirrors.openembedded.org/
+ftp://.*/.*     http://sources.openembedded.org/
+https?$://.*/.* http://sources.openembedded.org/
 
 }
 
-- 
1.5.4.3



