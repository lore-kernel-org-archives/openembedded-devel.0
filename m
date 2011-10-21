Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHFfm-0005C7-Pq
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:02:10 +0200
Received: by ggnj1 with SMTP id j1so2312418ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 06:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=5ZYwSZcmDw3tTQSaQJh4lnQEzdyG/yqA0417pX06fU8=;
	b=cucQQqz1dVZzC3MyGtUCp0XhnC5/qH3B206Ci5n5kM0DlFqksKk7BVQdlmWu61zrne
	0D4r7GiQ8J1RKMzYsBVxt4Tf5l3MimtHr0sz9E8ET4QYCPr7f4+mhIvwCABlBYFkV8I0
	WeArybHOmn0SSYDm6iZ8qX2qttG7f81Z8KnqU=
Received: by 10.101.180.20 with SMTP id h20mr3301581anp.39.1319205366794;
	Fri, 21 Oct 2011 06:56:06 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm24608561anh.8.2011.10.21.06.56.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 06:56:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 13:55:50 +0000
Message-Id: <cover.1319205291.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/5] SystemD fixes and improvements
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
X-List-Received-Date: Fri, 21 Oct 2011 14:02:10 -0000

The following changes since commit 36423031ae2cc2157232f3bec8f5c9fa53ef215d:

  Cloud9: incremental submodule and build fixes (2011-10-21 14:57:30 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (5):
  systemd-serialgetty: don't require systemd_git.bb
  systemd: add systemd-initramfs
  systemd: add lock group using useradd.bbclass
  systemd: do not recommend systemd-serialgetty
  task-basic: add "serial-console" machine feature

 .../recipes-core/systemd/systemd-serialgetty.bb    |   23 +-
 .../systemd/systemd-serialgetty/LICENSE            |  339 ++++++++++++++++++++
 meta-oe/recipes-core/systemd/systemd_git.bb        |   24 +-
 meta-oe/recipes-core/tasks/task-basic.bb           |    1 +
 4 files changed, 360 insertions(+), 27 deletions(-)
 create mode 100644 meta-oe/recipes-core/systemd/systemd-serialgetty/LICENSE

-- 
1.7.2.5



