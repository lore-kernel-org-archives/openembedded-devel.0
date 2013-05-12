Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UbdTc-0008OV-8R
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 May 2013 23:06:42 +0200
Received: by mail-ee0-f44.google.com with SMTP id b57so1157073eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 13:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=uf4+Ron36c7CcnEDFPQWRN7fY+OUpQrR1gPeZ28uLPc=;
	b=SYkvTIy4rHACII6bepEL9C3Jsp9lgh95w8KF0azVZFJI7utrxyoKt7qRp6aPh64vX0
	RT3YZN7uPtePU4BXrixsrlVqo+U7s5nL3Q9DF2T0txqAwxn5hvpkUKwkLraVX0PyMcwM
	Mak6BOvtYopIdhfBKUXJphS7R76UL/w+EmQMWRoozHtbJS+K4KBQodYe4DsWgMTj58F5
	DPdxH8+5GHxZNw6D48RAWGuKI7ajP0aNtm5TvrdMosWnGRAwLNy4HqjuLJ513UXxwlrd
	YjvQm5uHzq+g4JkZFvlXJGfU4MrYSQMo/SdJDsaEEpgnfZMFIssX8firtlEPplQnJfA+
	6IQA==
X-Received: by 10.14.0.129 with SMTP id 1mr70049164eeb.43.1368391711444;
	Sun, 12 May 2013 13:48:31 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06B8.dip0.t-ipconnect.de.
	[79.223.6.184]) by mx.google.com with ESMTPSA id
	w52sm18480626eev.12.2013.05.12.13.48.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 13:48:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2013 22:48:15 +0200
Message-Id: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe/meta-network/meta-gnome 0/4] bugfixes for my last series
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
X-List-Received-Date: Sun, 12 May 2013 21:06:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit cc0067dc0c7ea469057238db6422864d1bce311c:

  rp-pppoe: fix multilib SRC_URI reference (2013-05-10 09:47:01 -0400)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git fix-low-quality-patches

Andreas Müller (4):
      gnome-terminal: add gnome-common-schemas to RRECOMMENDS
      poppler: fix config option --disable-poppler-qt to --disable-poppler-qt4
      poppler: fix build for soft FPU machines
      proftpd: pack missing files

 .../recipes-gnome/gnome/gnome-terminal_2.30.2.bb   |    3 +
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    4 +-
 ...sh.cc-add-cast-to-fix-build-for-enable-fi.patch |   42 ++++++++++++++++++++
 meta-oe/recipes-support/poppler/poppler_0.22.3.bb  |    9 +++-
 4 files changed, 55 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch

Andreas Müller (4):
  gnome-terminal: add gnome-common-schemas to RRECOMMENDS
  poppler: fix config option --disable-poppler-qt to
    --disable-poppler-qt4
  poppler: fix build for soft FPU machines
  proftpd: pack missing files

 .../recipes-gnome/gnome/gnome-terminal_2.30.2.bb   |    3 +
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    4 +-
 ...sh.cc-add-cast-to-fix-build-for-enable-fi.patch |   42 ++++++++++++++++++++
 meta-oe/recipes-support/poppler/poppler_0.22.3.bb  |    9 +++-
 4 files changed, 55 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch

-- 
1.7.4.4



