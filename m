Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UMuv9-0007SE-3z
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Apr 2013 08:42:15 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so30849eaj.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 23:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=2zroa+gKQyke1kIrc5OeQJBPmvFapRX/zi1Gepp5nLk=;
	b=RVlzDcalwuPBpZj7IvZoOH9nJKU6n0URCWQ74XbfpxiOFihZhTeQ55l2WyKtcrfknb
	hhiVZOfEF4IEkExpUfJ3vt+p7XfyFW+z2E+QFvw0G9TvFKmawteD79O1tEtavOHGptx+
	aUcFc/h/GNKeeqDjQmDzc1hOO86yXw9QoHLbG97mpSVIJqq7AMET10vLY6G2H2M7jTVT
	3iC8mZFME7jBlPU6F+QOdtuB3YiXp0lQ+lXUMYAQdS6lGRY99RoreSVBh3XMaF27G98r
	mGllDHeXquefvr7aSWKEIJpOQGLSyIQ6aHxF5BJGifU01r8H4zIezvtKJ8V55hFMK1SH
	h8TQ==
X-Received: by 10.15.36.135 with SMTP id i7mr45579921eev.34.1364883905665;
	Mon, 01 Apr 2013 23:25:05 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3A51.dip.t-dialin.net.
	[91.10.58.81])
	by mx.google.com with ESMTPS id s3sm458591eem.4.2013.04.01.23.25.04
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 23:25:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2013 08:24:50 +0200
Message-Id: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce,V2 0/5] exo tweaks / add xfce4-closebutton-plugin
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
X-List-Received-Date: Tue, 02 Apr 2013 06:42:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The series consists of two parts:

  * exo: fix build on perl-less machines
  * exo-native: When building from xfce-git-repos exo-csource is required. I
    needed that several times for debugging (e.g when implementing extensions
    to xfce4-settings).
  * xfce4-closebutton-plugin: This is a very simple panel plugin I have
    written. It is intended to close windows in environments with maximized and
    undecorated windows e.g on low resolution screens.

The following changes since commit 74eee8a7960cf0a898d795cb024b10a58357dbcd:

  multipath-tools: add recipe for git version (2013-03-29 13:16:39 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git xfce-patches

Andreas Müller (5):
      exo: inherit perlnative and add liburi-perl-native to DEPENDS
      exo: add native build
      exo: split out exo-csource to exo-dev - it is not required on target
      xfce4-closebutton-plugin: initial add
      packagegroup-xfce-extended: add xfce4-closebutton-plugin

 .../closebutton/xfce4-closebutton-plugin_git.bb    |   22 ++++++
 .../exo/exo/reduce-build-to-exo-csource-only.patch |   80 ++++++++++++++++++++
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb           |   15 +++-
 .../packagegroups/packagegroup-xfce-extended.bb    |    3 +-
 4 files changed, 117 insertions(+), 3 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch

-- 
1.7.4.4



