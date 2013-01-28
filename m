Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzpNQ-0008PM-6J
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 15:08:00 +0100
Received: by mail-wi0-f177.google.com with SMTP id hm14so367525wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 05:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=W4llyLLyehBbtXbOZA/rNvW4rruy3d+2ESUpGTGuMg8=;
	b=UdKBgX3jgwciBTblmLYM/Ju5hqK/fmI8gNpy7EDTBePq8PJMMPEXB8vtzqL4VhqmNs
	VxuaqKzBWRoh947YATdBqk6+Ry8pKs6vUMID2kePeHPhABKZ1tkhlD51YFajyXuqe+Tf
	LifF0u8J/wAq251KXrQs+RDa1dsC42SSZrYv7vQXCJxgLjvqtTwhmNDFmD6FXQMAg1So
	ZgwYY+QBsj7BULkdtDfm1b5PQ1cUAQdQwUnZiHvp7jY1sedCh0wr8G3I9boRy2XfxG2t
	05Gxkl0mC+oCoylY3ikWN/4qtB25KDKJ/NvuFiqQZjmYNTk2QfoTwXFLS9h3Lz/9h4xG
	7G+g==
X-Received: by 10.180.88.40 with SMTP id bd8mr9772215wib.33.1359381141504;
	Mon, 28 Jan 2013 05:52:21 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id bz12sm13535324wib.5.2013.01.28.05.52.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 05:52:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:50:28 +0100
Message-Id: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-systemd/V2 0/4] remove systemd core images & update bbappends
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
X-List-Received-Date: Mon, 28 Jan 2013 14:08:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 164caa34458ed2c145dfa2e4d2d207f8ce47a057:


are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Andreas Müller (4):
      systemd: remove core recipes - they migrated to oe-core
      systemd-speed-hacks: remove
      dhcp: follow oe-core to 4.2.5
      util-linux: follow oe-core to 2.22.2

 ...{dhcp_4.2.4-P2.bbappend => dhcp_4.2.5.bbappend} |    0
 ..._2.22.1.bbappend => util-linux_2.22.2.bbappend} |    0
 .../recipes-core/systemd/systemd-compat-units.bb   |   59 ----
 .../systemd/systemd-compat-units/machineid.service |   16 -
 .../systemd-compat-units/run-postinsts.service     |   17 -
 .../recipes-core/systemd/systemd-serialgetty.bb    |   46 ---
 .../systemd/systemd-serialgetty/LICENSE            |  339 --------------------
 .../systemd-serialgetty/serial-getty@.service      |   32 --
 .../recipes-core/systemd/systemd-speed-hacks.bb    |   18 -
 .../systemd/systemd-systemctl-native.bb            |   18 -
 .../systemd/systemd-systemctl-native/systemctl     |  126 --------
 ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ------
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ------
 .../recipes-core/systemd/systemd/gtk-doc.make      |  230 -------------
 .../recipes-core/systemd/systemd/modprobe.rules    |   17 -
 .../systemd/systemd/optional_secure_getenv.patch   |   19 --
 .../systemd-pam-configure-check-uclibc.patch       |   26 --
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 --
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 -----
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 --
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ----------
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 -------------------
 .../recipes-core/systemd/systemd/touchscreen.rules |   18 -
 .../recipes-core/systemd/systemd/var-run.conf      |    4 -
 meta-systemd/recipes-core/systemd/systemd_git.bb   |  263 ---------------
 25 files changed, 0 insertions(+), 2086 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/dhcp/{dhcp_4.2.4-P2.bbappend => dhcp_4.2.5.bbappend} (100%)
 rename meta-systemd/oe-core/recipes-core/util-linux/{util-linux_2.22.1.bbappend => util-linux_2.22.2.bbappend} (100%)
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-units.bb
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-units/machineid.service
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty.bb
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty/LICENSE
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-speed-hacks.bb
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
 delete mode 100755 meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/modprobe.rules
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/touchscreen.rules
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/var-run.conf
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd_git.bb

-- 
1.7.6.5



