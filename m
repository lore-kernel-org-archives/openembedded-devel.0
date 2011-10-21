Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH5xu-000565-Ax
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 05:40:14 +0200
Received: by ywf9 with SMTP id 9so1013446ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=nnbhYJ2M6PNou6hb5u+12JNanEY6qtp7slObw4Ywxh8=;
	b=fGIFfyXRe1w+VLBn2XPHZrHXwIrQ1rpqFZMSmFO243gBEGORzzYVM3E0GsBGa2+SDG
	sjBwf4GDuV+zrC7kOR6Z31AH4hmW/rE8IPYM2dtEUnOru8D/3sYU1/CqcIfVRFdmBcFr
	OvOvYsCq2q5CxKm8WXAF1/ab7Ic2NqvaF76NU=
Received: by 10.150.138.15 with SMTP id l15mr12201318ybd.21.1319168060120;
	Thu, 20 Oct 2011 20:34:20 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t7sm31947517anh.15.2011.10.20.20.34.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 20:34:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 03:34:09 +0000
Message-Id: <cover.1319168013.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/4] systemd fixes
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
X-List-Received-Date: Fri, 21 Oct 2011 03:40:14 -0000

The following changes since commit 0368dfd5d8285fe31c853097846e8a6822c7cda0:

  gcc-4.6: Remove the patches that are already applied via oe-core (2011-10-20 19:25:50 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (4):
  systemd: add systemd-initramfs
  systemd: add lock group using useradd.bbclass
  systemd: do not recommend systemd-serialgetty
  systemd-serialgetty: don't require systemd_git.bb

 .../recipes-core/systemd/systemd-serialgetty.bb    |   22 +++++------------
 meta-oe/recipes-core/systemd/systemd_git.bb        |   24 ++++++++++----------
 2 files changed, 19 insertions(+), 27 deletions(-)

-- 
1.7.2.5



