Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULexP-0007a1-Fq
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 20:27:23 +0100
Received: by mail-ee0-f44.google.com with SMTP id l10so344944eei.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 12:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=z4pebPlQZHBXWSSq5VVAGXbxqq1ts1mg99kwIhNb4hM=;
	b=jyEDqaeoXvb/rtEcOMP0nAMnriQ4WcKl/9fTgeJAXBJUjTUYx/e4oZcy4PeR0kIqut
	2d1BX4SNqCrsCnAUwtFrlL3JDTTqNJl/6Xpk5UqCmJfnD2OMlhvACh2yzbfJZQ7T9IqS
	vEGmgIcS/LDP0PnBqTsEWIRJxV5jSyEK104FxFHCK5F8uTIYpsEV2bbI0QgTJCB9nSTM
	E2bzqqJEfY26KgRLNcgKlsn4KjbC9yes6qghRky2W5jjOAxC9MHkRF2jo59aXvNHidCW
	E4l9+lbaCO+WSzU1/e6nlv6c+1BZRO63DvmC5YHX3D5q6TRIG1HjgSuaCmqE4aAO3iFH
	A8CQ==
X-Received: by 10.15.81.136 with SMTP id x8mr10793177eey.9.1364584219152;
	Fri, 29 Mar 2013 12:10:19 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id r4sm5769042eeo.12.2013.03.29.12.10.17
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 12:10:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 20:10:03 +0100
Message-Id: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce 0/4] further tweaks
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
X-List-Received-Date: Fri, 29 Mar 2013 19:27:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The series consists of two parts:

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

Andreas Müller (4):
      exo: add native build
      exo: split out exo-csource to exo-dev - it is not required on target
      xfce4-closebutton-plugin: initial add
      packagegroup-xfce-extended: add xfce4-closebutton-plugin

 .../closebutton/xfce4-closebutton-plugin_git.bb    |   22 +++++++
 .../exo/exo/reduce-build-to-exo-csource-only.patch |   64 ++++++++++++++++++++
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb           |   10 +++
 .../packagegroups/packagegroup-xfce-extended.bb    |    3 +-
 4 files changed, 98 insertions(+), 1 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch

-- 
1.7.4.4



