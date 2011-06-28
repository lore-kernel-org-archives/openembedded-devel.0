Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbZX0-0008Ch-5N
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 16:44:50 +0200
Received: by ywa12 with SMTP id 12so113594ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=jkQ6BcBw37yRKg8QxkMwsBcs8vCUK+ZRTkJpubyWU74=;
	b=xz1SqJBja0FjxvH/GsasIRoVgWdScGjVU+UWYymPWg/0ycDRtAgKI9m2eaKfyrSaus
	Rh9Dw9kcGhNKgB3vwLC5ljEdWeYZ5oPmkI1AcHFKRAYSYtgef7OIEhWAMOGvbRy+7Td5
	HapsZzgb202IuUTAzRawHb3Nx2MygythhiPl0=
Received: by 10.150.67.8 with SMTP id p8mr4105287yba.111.1309272068291;
	Tue, 28 Jun 2011 07:41:08 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g7sm70817yba.11.2011.06.28.07.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 07:41:06 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jun 2011 14:40:47 +0000
Message-Id: <cover.1309272010.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 14:44:50 -0000

The following changes since commit 15a5642b2a4df41dc0adf9d250cd5085eaf1d69b:

  libcap2: drop, it's in oe-core already (2011-06-28 14:57:03 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (2):
  systemd: set all packages PACKAGE_ARCH to MACHINE_ARCH
  task-x11: set all packages PACKAGE_ARCH to MACHINE_ARCH

 meta-oe/recipes-core/systemd/systemd_git.bb |    2 +-
 meta-oe/recipes-core/tasks/task-x11.bb      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.2.5



