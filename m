Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RV0nw-0007jY-6v
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 13:59:28 +0100
Received: by ggnh1 with SMTP id h1so1066825ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 04:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=i4d7BIiw98B5iNut/pENPhk3jYq9tlby6DNHbMI4MSI=;
	b=CfTL+H6l+lZJq97u+IBKgkkp/Y53NhJzGWk1f5qIWY0f5GNYbtZvebMoU8DDrCZSO0
	lQLxP6qPMxQZyPVbwbFwKTeacjSzOz+JZKfawVzy4B7V/wwxqKLU14tPrxbiQBsYoNGd
	3/cDmlhGawdzz/7p5f897V4RyCwSXQfOR/fIc=
Received: by 10.236.109.231 with SMTP id s67mr61202280yhg.103.1322484770120;
	Mon, 28 Nov 2011 04:52:50 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm50577181yhk.1.2011.11.28.04.52.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 04:52:49 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 12:52:38 +0000
Message-Id: <cover.1322484731.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] systemd-serialgetty improvement
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
X-List-Received-Date: Mon, 28 Nov 2011 12:59:28 -0000

The following changes since commit 720cd3f32ca8cc4701e99effdd3b3da0cca8348d:

  digitemp: fix QA issues: (2011-11-28 11:58:39 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  systemd-serialgetty: use a wrapper script to find getty

 .../recipes-core/systemd/systemd-serialgetty.bb    |   13 ++++++++++---
 .../systemd-serialgetty/serial-getty@.service      |    2 +-
 .../systemd-serialgetty/systemd-serialgetty        |   13 +++++++++++++
 3 files changed, 24 insertions(+), 4 deletions(-)
 create mode 100755 meta-oe/recipes-core/systemd/systemd-serialgetty/systemd-serialgetty

-- 
1.7.2.5



