Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 0D13361864
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:26:51 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8CFQmAY022787; 
	Thu, 12 Sep 2013 10:26:50 -0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2013 20:28:08 +0500
Message-Id: <cover.1378998806.git.muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][meta-systemd][PATCH 0/3] Remove systemd support for the packages which already have it in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Sep 2013 15:26:53 -0000

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
The following changes since commit a506a9efc86cda9dbf36cd916dbbfb1ae2162c45:

  log4cplus: add recipe (2013-09-10 22:48:36 +0200)

are available in the git repository at:

  https://github.com/mshakeel/meta-oe.git master
  https://github.com//tree/master

Muhammad Shakeel (3):
  openssh: Remove systemd support which is merged in oe-core
  lighttpd: Remove systemd support which is merged in oe-core
  rpcbind: Remove systemd support which is merged in oe-core

 .../openssh/openssh/sshd.socket                    |   11 -----------
 .../openssh/openssh/sshd@.service                  |    9 ---------
 .../openssh/openssh/sshdgenkeys.service            |   10 ----------
 .../openssh/openssh_6.2p2.bbappend                 |   16 ----------------
 .../lighttpd/lighttpd/lighttpd.service             |   13 -------------
 .../lighttpd/lighttpd_1.4.32.bbappend              |   15 ---------------
 .../rpcbind/rpcbind/rpcbind.service                |   13 -------------
 .../rpcbind/rpcbind_0.2.0.bbappend                 |   16 ----------------
 8 files changed, 103 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd.socket
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd@.service
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshdgenkeys.service
 delete mode 100644 meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttpd.service
 delete mode 100644 meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind/rpcbind.service

-- 
1.7.9.5


