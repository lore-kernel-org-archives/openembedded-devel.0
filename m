Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaAcG-0002vS-SS
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 19:28:45 +0100
Received: by yenm12 with SMTP id m12so4248410yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 10:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=MoZgzP2cDHRU10o429sqtE3oZRY/eVEIwegYvuUASgg=;
	b=noHtQlmjYmpi1/RcYbqF5nNvQ/tGxaho7k0KTDU/Lvf+u5+XB08pHFETZu04zJW3PZ
	th5VlSIp/d9uwoWfcAkWTpQpDhccw1XFZEIsta63DAwxctd/53dNID1iCWXNGJtlh9FH
	GbI4jt3ISBr6TaKnSSsGrmfnviZcBxQO3ZL18=
Received: by 10.236.174.3 with SMTP id w3mr27414928yhl.117.1323713908196;
	Mon, 12 Dec 2011 10:18:28 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm27072043anu.21.2011.12.12.10.18.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 10:18:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 18:18:14 +0000
Message-Id: <cover.1323713870.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/2] Misc
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
X-List-Received-Date: Mon, 12 Dec 2011 18:28:45 -0000

The following changes since commit 7ad9db8b3b6dd8fb9f85032b02344036015a9698:

  gnome-panel : Fix format of LICENSE field. (2011-12-12 18:45:06 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (2):
  connman: convert to bbappend as 0.78 has been moved to OE-Core
  dropbear: convert PR to use PRINC on bbappend

 meta-oe/recipes-connectivity/connman/connman.inc   |   98 --------------------
 .../recipes-connectivity/connman/connman/connman   |   42 ---------
 .../recipes-connectivity/connman/connman_0.78.bb   |   33 -------
 .../connman/connman_0.78.bbappend                  |   13 +++
 .../dropbear/dropbear_2011.54.bbappend             |    2 +-
 5 files changed, 14 insertions(+), 174 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/connman/connman.inc
 delete mode 100755 meta-oe/recipes-connectivity/connman/connman/connman
 delete mode 100644 meta-oe/recipes-connectivity/connman/connman_0.78.bb
 create mode 100644 meta-oe/recipes-connectivity/connman/connman_0.78.bbappend

-- 
1.7.2.5



