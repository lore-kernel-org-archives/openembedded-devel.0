Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Se6oH-0004Jo-37
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 17:45:41 +0200
Received: by ghbz2 with SMTP id z2so2436293ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=ux8rs57dQkAiNxugylkgCvwK0HnC/1whHQWOqqqMyMU=;
	b=i5DgV2npUIvexrxG2wS+ZbP6mJgsOMdM96gmcaWBsEdEYqvVnLHtuygTbW+4dgBp3K
	FZ5OfyDJOmY/gkErU1Ujzfnp1bImtn1TufCuNYE9hT4ucoH/roBNdg7/DIRZcDfoUQZc
	r9mNvvDV28cdyQjpMXkBXZNcCrhb1ZvW2KkXaPQTpnM8vzWL2zvZsBSL/WQjTwVGVjYM
	Uqc5D6BFHmQXnfkALl9yw2rWPf/ktfKfwIrSNfdVhy5BqAUB+7VWMUlwjpmYLBbKdOvO
	od8iMquI6BKKqhKJ6SRPKzviYUuC2DFd4kom3VyWa/zxOHF+OHWBdswpD4IJjBvyNDIo
	q0aQ==
Received: by 10.236.75.40 with SMTP id y28mr21545049yhd.65.1339428907002;
	Mon, 11 Jun 2012 08:35:07 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id c12sm26056214ann.15.2012.06.11.08.35.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jun 2012 08:35:06 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jun 2012 12:34:55 -0300
Message-Id: <cover.1339428767.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/3] Pending fixes in O.S. Systems' tree
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
X-List-Received-Date: Mon, 11 Jun 2012 15:45:41 -0000

Those are the fixes waiting for merging in our O.S. Systems' tree; all
(except the owfs one) seem qualified for inclusion on denzil branch as
well as they do fix bugs.

The following changes since commit edab9a6614eb6f7eb70f85dd3bd467aa0b5bfe5b:

  task-xfce-extended: add panel plugins / applications (2012-06-08 14:28:45 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  owfs: add init script for owfs
  nodejs: force use of -mfpu-abi=soft for ARMv5
  cpuburn-neon: fix packaging to use a date as version and valid
    sources

 .../{cpuburn-neon.bb => cpuburn-neon_20120610.bb}  |   12 ++--
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb   |    9 +++
 meta-oe/recipes-extended/owfs/owfs/owfs            |   59 ++++++++++++++++++++
 meta-oe/recipes-extended/owfs/owfs_2.8p15.bb       |    9 ++-
 4 files changed, 79 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-benchmark/cpuburn/{cpuburn-neon.bb => cpuburn-neon_20120610.bb} (68%)
 create mode 100755 meta-oe/recipes-extended/owfs/owfs/owfs

-- 
1.7.2.5



