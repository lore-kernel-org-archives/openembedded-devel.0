Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAoh-00024T-78
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:59:03 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2046974fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=j3I/DNM6oly/tF5dObvqkwlgyRzo0HgGoeIwXOFeXwg=;
	b=LgOU1XZJgWr3wa0gEMxmoqPcQzXt+hoANd0YTwZrIlSMkh0RYUgnISuRbeX0/1G3tu
	isAqzClvEvWq2SebKYSH28xbTWEGSvX+wPPoI9sUn+yYPvPO7NNqJoixe1NIKLi76vSi
	7DP1djFuA5loP6OAX4a+R/Sx7q1SqrUKtzNUM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AG3uNz19qh/oi2qDuPdmIZC16jbED3oxiQNcOB3bbNSx1xEN/kemPnynGqcq+sKno5
	PywN+Kenq957RY+xaY/dfv09tOJ0iEWgaGtoLZfrVqI9voPl5OdsE0DbPyBQmXuVPqkA
	cYAik8q8H++rfcNPCwgSYuUhjNTaIYaHeawIE=
Received: by 10.181.197.2 with SMTP id z2mr1734577bkp.65.1226237350555;
	Sun, 09 Nov 2008 05:29:10 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.08
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:09 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:08 +0300
Message-Id: <1226237296-11012-8-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-7-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-7-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] src_distribute: update to reflect current bitbake
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
X-List-Received-Date: Sun, 09 Nov 2008 13:59:03 -0000

Since 1.8.8 bitbake stopped providing 'A' variable that src_distribute used.
Update src_distribute.bbclass to correctly generate files list w/o using
that var.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 classes/src_distribute.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/src_distribute.bbclass b/classes/src_distribute.bbclass
index f20410d..a124739 100644
--- a/classes/src_distribute.bbclass
+++ b/classes/src_distribute.bbclass
@@ -8,7 +8,9 @@ python do_distribute_sources () {
 	import re
 	for license in licenses:
 		for entry in license.split("|"):
-			for s in (bb.data.getVar('A', d, 1) or "").split():
+			for url in ((bb.data.getVar('SRC_URI', d, 1) or '').split()):
+				bb.fetch.init([url], d)
+				s = bb.fetch.localpath(url, d)
 				s = re.sub(';.*$', '', s)
 				cmd = bb.data.getVar('SRC_DISTRIBUTECOMMAND', d, 1)
 				if not cmd:
-- 
1.5.6.5



