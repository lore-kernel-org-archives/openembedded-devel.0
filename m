Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjF8B-00081Y-TG
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 20:07:12 +0100
Received: by ghrr17 with SMTP id r17so795459ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=z4JtK0f83ifIeJJWgwiUBXOWLJW3UBMA7l7eXj3SkFo=;
	b=aZKK5VjQ4htqwTfrK8hsNWbFAssGNo8c+j/DP+nRLe8CEKvFX/sYhPRFmwbNsnxDT5
	hWOEHIwn5c9awMw/MP8pw9rKBsNwyhE6nhQbQ3oSooVO0UKbODU4LvkBYl5SWplX/Twt
	QzhialGoVOHpDauhht5xmQ9iw3c6kCaOnec0Q=
Received: by 10.236.183.133 with SMTP id q5mr9059954yhm.38.1325876387061;
	Fri, 06 Jan 2012 10:59:47 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f17sm17744177ann.21.2012.01.06.10.59.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 10:59:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jan 2012 18:59:30 +0000
Message-Id: <cover.1325876341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/5] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Fri, 06 Jan 2012 19:07:12 -0000

The following changes since commit 18266de7fc4e87754831c5e0e8ad09ccd94c93b4:

  nodejs-native: clarify dependencies to match updated oe-core parser (2012-01-06 09:33:42 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (5):
  xserver-nodm-init: move systemd service to xserver-nodm-init-systemd
  meta-efl: elsa: rconflicts/rreplaces xserver-nodm-init-systemd
  task-x11: use xserver-nodm-init-systemd
  busybox: add systemd support for syslog service
  udisks: disable manpage building

 meta-efl/recipes-efl/efl/elsa_svn.bb               |    6 ++--
 .../busybox/busybox/busybox-klogd.service.in       |    8 +++++
 .../busybox/busybox/busybox-syslog.default         |    1 +
 .../busybox/busybox/busybox-syslog.service.in      |   13 ++++++++
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |   30 ++++++++++++++++++++
 meta-oe/recipes-core/tasks/task-x11_1.0.bb         |    6 ++--
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   30 +++++++++----------
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |    4 ++-
 8 files changed, 75 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in
 create mode 100644 meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
 create mode 100644 meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
 create mode 100644 meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend

-- 
1.7.2.5



