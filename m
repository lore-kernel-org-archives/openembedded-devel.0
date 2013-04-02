Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UN9WP-0004vC-2q
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 00:17:43 +0200
Received: by mail-ee0-f51.google.com with SMTP id c4so443715eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2013 15:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=/1LIjL7Gx6TuZM7ZLENEHtDQEmtHrX5JJxSuHChuZdQ=;
	b=pc6d7z1iRi5KJzzIJJcFElfkx2At3bDLOhH046Lf3KJVsaYTP50beRCx4beKICkndT
	FJUZoTpm9/rTI2GUJOemQFQQyrZ4bLaf6BS2kEUB+vhL2seDuf2NOh9pPmsrM/6oL29U
	8LSTGa7L7KgFkt0wOy3pNY8Yp5Nk7VnE2x1ocBz5b7WnF+9PAXs0ggnMLvVf8bamRKQQ
	hoRP0OMf4PnkB8fQWFP/K9GmP7stywTO7ATawV5zjYEHwEB8dEJdO2TRtP8hDNBChLxw
	iku9MQZCXFxamkqFCTdOC+x3iR1a3KvXUDnqljOLE7GsmVGQSEZGjJRJk2V737Uy5DdJ
	3Azw==
X-Received: by 10.14.4.69 with SMTP id 45mr53923321eei.0.1364940030546;
	Tue, 02 Apr 2013 15:00:30 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3CF4.dip.t-dialin.net.
	[91.10.60.244])
	by mx.google.com with ESMTPS id d47sm5204412eem.9.2013.04.02.15.00.28
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 15:00:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2013 00:00:14 +0200
Message-Id: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce,V3 0/5] exo tweaks / add xfce4-closebutton-plugin
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
X-List-Received-Date: Tue, 02 Apr 2013 22:17:43 -0000
X-List-Received-Date: Tue, 02 Apr 2013 22:17:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The series consists of three parts:

  * exo: fix build on perl-less machines
  * exo-native: When building from xfce-git-repos exo-csource is required. I
    needed that several times for debugging (e.g when implementing extensions
    to xfce4-settings).
  * xfce4-closebutton-plugin: This is a very simple panel plugin I have
    written. It is intended to close windows in environments with maximized and
    undecorated windows e.g on low resolution screens.

  V1 -> V2: Add fix for perl-less machines
  V2 -> V3: use class-native instead of virtclass-native

The following changes since commit af6c39379dbe6822d1457498e53747ed63bdbb65:

  libnetfilter-queue: Add missing libmnl to DEPENDS (2013-04-02 08:53:13 -0400)

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



