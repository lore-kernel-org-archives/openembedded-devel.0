Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDiNa-0002FX-4Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 21:52:46 +0200
Received: by ywf7 with SMTP id 7so6966023ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=ArDMFAqELQg9DAPdniXhYbrFhKg3a9q8KmJqV1mMNyA=;
	b=eX4vkATGlc1TO3KOe5iae5jcsz6WvnGyZ4tOBYkKUkHl4TvAF5GlzzzHw9BP4Ga8Dr
	diX8QL17ZAEQZ6epeOoxhMotIbwGQ0H+YCueJ5rBMgSqWFFFbS7XPsoIT/5cLs1ysAcQ
	FplIMGwIi0oD1Wg+ffdbJUIfeucvdtmAYGwi0=
Received: by 10.236.129.141 with SMTP id h13mr24507320yhi.120.1318362423921;
	Tue, 11 Oct 2011 12:47:03 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o50sm16294841yhl.9.2011.10.11.12.47.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 12:47:03 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2011 19:46:49 +0000
Message-Id: <cover.1318362324.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] Avoid unrequired runtime enforcement for postinst
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
X-List-Received-Date: Tue, 11 Oct 2011 19:52:46 -0000

The following changes since commit 8fcf92fed89557683a08f67667acc77a8f73dc0a:

  guile: fix licensing and gettext inherit (2011-10-11 16:40:25 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  xserver-nodm-init: exit 1 only if systemd is installed

 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

-- 
1.7.2.5



