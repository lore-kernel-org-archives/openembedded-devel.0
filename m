Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RO7Q5-0005OX-V9
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 13:38:24 +0100
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Wed, 9 Nov 2011
	13:32:05 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Nov 2011 13:32:04 +0100
Message-ID: <cover.1320841846.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.7.2
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] Fix rsyslog removal issue
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
X-List-Received-Date: Wed, 09 Nov 2011 12:38:24 -0000
Content-Type: text/plain

Rsyslog wasn't possible to remove from a running system, as the postrm-stage
failed. The unit file was already removed when running systemctl. Disable the
service prior to removing the files.

The following changes since commit db658e9954586f209c9ad3737c7f7488065ece38:

  gateone: make it work (2011-11-09 12:51:30 +0100)

are available in the git repository at:
  git://github.com/darander/meta-oe rsyslog
  https://github.com/darander/meta-oe/tree/rsyslog

Anders Darander (1):
  rsyslog: change postrm to prerm

 meta-oe/recipes-extended/rsyslog/rsyslog.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.7.2



