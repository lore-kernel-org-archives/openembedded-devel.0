Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrtE-0007X3-Li
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 22:19:40 +0200
Received: by ywg8 with SMTP id 8so89031ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=vJrkZxsg1tE8pPKMV6GYlMHkDgc/fKmvsKggNyKQpIw=;
	b=uFy6F7RMXl8xxGndSupyDDm8CeCAXVdmoXpWrKNxkMZsSY3w1VKF+XW7CbtQmoqrl5
	iXIRa2j5cFBDZk2o9SrbBHZC72WX8t3tz9xSrd6fSDZZmUKpjfwDD2YZgO87iC5vqBpQ
	W4UBx4dC5Xjk8T0GKeAnSP0ibdYTRqpEKj/VY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=p6genfkICXRf4BFMBfOUzVNeOE2IaFycbZi6FgKpTASVKksnfBKG1hMMQsy+bzfsx4
	jh2oyNBMQxgTG7CfBdhgEvPlQSv79yzQr+Vj90QFXh56VthGDwyFolsvIs7xVsg+LgXG
	f7xcNyyeZcYQQo6fYdNXcip4N729o7zId+4pY=
Received: by 10.236.143.172 with SMTP id l32mr8312622yhj.457.1306959388122;
	Wed, 01 Jun 2011 13:16:28 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t43sm1478016yhm.70.2011.06.01.13.16.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:16:27 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:16:10 +0000
Message-Id: <cover.1306959338.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 0/5] Pending patches on O.S. Systems tree
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
X-List-Received-Date: Wed, 01 Jun 2011 20:19:40 -0000

The following changes since commit 7da05acc4665dcfcd008e6ce698169b8e9503b33:

  udev-extra-rules: remove modprobe rule, it has moved back to udev (2011-05-31 20:37:45 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (5):
  inih: bump SRCREV
  freerdp: bump SRCREV to 20110530 snapshot
  udev-extra-rules: refactor mount.sh script
  ccid: add 1.4.4 version recipe
  pcsc-lite: rdepends on ccid and drop init script

 meta-oe/recipes-core/udev/udev-extra-rules.bb      |    2 +-
 .../recipes-core/udev/udev-extra-rules/mount.sh    |   28 +++++++------------
 meta-oe/recipes-support/ccid/ccid_1.4.4.bb         |   18 ++++++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |    4 +-
 meta-oe/recipes-support/inih/libinih_git.bb        |    4 +-
 .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |   15 ++--------
 6 files changed, 36 insertions(+), 35 deletions(-)
 create mode 100644 meta-oe/recipes-support/ccid/ccid_1.4.4.bb

-- 
1.7.2.5



