Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZPyx-0001Mh-3b
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 17:41:03 +0100
Received: by ggnh1 with SMTP id h1so4238975ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 08:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=KZfS1h71fOeb28v925tDY+QuWKLsLgEAP7mgKE3PbQY=;
	b=biCLrMGRiRmlSIJD+GVbRp6XhFQOq1fWx0kQUo67mQG+IvaAWcxhcvHi2vUqm559xX
	j33d31P9ccDcnQZknX5oFENB2eMTZo5s34iFUFktc6ZIMHUPoJCnR5JBtWVhag9xKErS
	EhPRh+Owmf+CpQQkIK08Yhu5mamSYgC9QZ3TQ=
Received: by 10.100.24.18 with SMTP id 18mr2857740anx.113.1323534850027;
	Sat, 10 Dec 2011 08:34:10 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w68sm21079531yhe.14.2011.12.10.08.34.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Dec 2011 08:34:09 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Dec 2011 16:33:54 +0000
Message-Id: <cover.1323534795.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/2] Move connman to oe-core and fix dropbear PR
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
X-List-Received-Date: Sat, 10 Dec 2011 16:41:03 -0000

The following changes since commit 70cd3a81edb9fd2aba149db243e53934930e0d85:

  libgnome-keyring 2.32.0: fix LICENSE operand (2011-12-10 14:43:54 +0100)

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



