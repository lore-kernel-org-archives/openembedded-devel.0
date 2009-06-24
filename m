Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MJb3w-0002Um-Ih
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 00:35:28 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLR007PYKVYCGD8@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	24 Jun 2009 17:23:58 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BE31A14AF5D; Wed,
	24 Jun 2009 18:23:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jun 2009 18:23:57 -0400
Message-id: <1245882237-30230-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <4A41C00B.3030409@tait.co.nz>
References: <4A41C00B.3030409@tait.co.nz>
Subject: [STABLE][PATCH] /etc/profile: stricter root PATH - require absolute pathname for bins in cwd
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
X-List-Received-Date: Wed, 24 Jun 2009 22:35:28 -0000

Having current directory (either '.' or empty string) in PATH is considered
dangerous for root.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Acked-by: Phil Blundell <philb@gnu.org>
Acked-by: Koen Kooi <koen@openembedded.org>
---
 recipes/base-files/base-files/profile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/base-files/base-files/profile b/recipes/base-files/base-files/profile
index 5797535..b5ce69d 100644
--- a/recipes/base-files/base-files/profile
+++ b/recipes/base-files/base-files/profile
@@ -12,7 +12,7 @@ if [ ! -e /etc/localtime ]; then
 fi
 
 if [ "`id -u`" -eq 0 ]; then
-   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:
+   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
 fi
 if [ "$PS1" ]; then
 # works for bash and ash (no other shells known to be in use here)
-- 
1.6.0.6



