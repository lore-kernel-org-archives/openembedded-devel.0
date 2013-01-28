Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzomD-0003JI-D4
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 14:29:40 +0100
Received: by mail-wg0-f43.google.com with SMTP id e12so1737754wge.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 05:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=98Kr4OfaAXO/g75Dtx8c8IQgsH48UndC5QdGpYKb/84=;
	b=B8h9SrlOWdeBIruLzxb3JwO88H+SWRqMWGraJkJu26d8GWA1uHtWl5k89BT3s2LarW
	5JS1GirqfcNmFtfhsbQD5FJLshdNzLBqCPS3Nrg2z8JiCiAlqT+koucVf4QXSQ5HIyIV
	lnkSEKkzGSehEI/WpxGF5OpJJNVu+8lPLbAWtYaTuEymfmvrZkKNlDkFNFWB1CO7AOhc
	xcTNT3nijy+0qrLlqFP+5xu9kcsYMTAx9AM6dYKx7zMnlg/KSAzvMT0ntSoiIqr4+Cky
	N/KaydkukNm/bmgtHP13qHWKHRCNho/jqn2C0m1n46vqr/VNhsFhRGO1MAVWdwKh2yxR
	9JSw==
X-Received: by 10.194.104.137 with SMTP id ge9mr3179921wjb.59.1359378835041;
	Mon, 28 Jan 2013 05:13:55 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id bw9sm12054734wib.5.2013.01.28.05.13.53
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 05:13:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:12:02 +0100
Message-Id: <1359378724-18026-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-systemd 0/2] remove systemd core images
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
X-List-Received-Date: Mon, 28 Jan 2013 13:29:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 164caa34458ed2c145dfa2e4d2d207f8ce47a057:

  python-smbus: add 3.0.3 (2013-01-27 23:54:10 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Andreas Müller (2):
      systemd: remove core recipes - they migrated to oe-core
      systemd-speed-hacks: remove

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
 23 files changed, 0 insertions(+), 2086 deletions(-)
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



