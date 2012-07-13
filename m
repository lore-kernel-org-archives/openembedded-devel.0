Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Spdx3-0005Zn-Eo
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 13:22:25 +0200
Received: by bkcik5 with SMTP id ik5so2314647bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=DBXBChUTLF2NPKcrV4D9H491x7bGowcrwQW4KBsP0cM=;
	b=tdcWaid0byPd6p+W8WqBXu2y5mP5wwqxQABHBnNMbT8sA8Wu9kcREALBOBpSS4cIzP
	DYqBFgRs7bZKxrZQ6J3gO3Pbm9XfwSwyfOrQilS4iaf073IqX5cnF/aBOqAooTg7ahbF
	MvGGXfEE/FUzCah553iBZ4bJng5IUqIbE6H5kohKf6iM0MEI9GRfwglM/BhKlkV0Q+Ad
	wcIWYqQashywAfAmaqxBHmam6oL+QVBR1Ln2u4Gqao7eIVZVHWiiaDXYWHdMEj9fHJf2
	FsljhiIwPESjgXGMYG1iRcMgPpJgSVIU3OTkE9+FCZbdQzgsLGFzgd7YtWo/ZnSbgiyU
	1qOg==
Received: by 10.204.151.81 with SMTP id b17mr529281bkw.95.1342177871201;
	Fri, 13 Jul 2012 04:11:11 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id g6sm4544247bkg.2.2012.07.13.04.11.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 04:11:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 13:10:44 +0200
Message-Id: <1342177846-26594-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-system 0/2] Introduce SYSTEMD_AUTO_ENABLE
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
X-List-Received-Date: Fri, 13 Jul 2012 11:22:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series was created on top of the "transition" series and was pushed
to git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.git. It
was build tested only assuming systemctl-native's implementation of 'disable'
parameter works properly.

Andreas Müller (2):
  systemd.bbclass: introduce SYSTEMD_AUTO_ENABLE variable
  udisks: do not start daemon automatically at boot time

 meta-systemd/classes/systemd.bbclass               |    6 ++++--
 .../recipes-support/udisks/udisks_1.0.4.bbappend   |    3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.7.6.5



