Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 92A1076C04
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:41:02 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so3854099wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=sHfNgOrLCkGh6vT0ThjludXPmsJu8tkTdVyJDdon9iA=;
	b=RhQNSOnx2/UXu4J5Vblz755QAlgfqpUaQApAk452YbNv0hC3Y8ZAVWj5ersjmlKN/a
	pWVJTDF6mXKHQdrwVT47ZqThF7ndUdWLvJBwdwGgUqRiLqk7IK2gmykQoravqU77Q8dj
	qfNHQdWjbiosXHL1UxAdCKi4Hm9pd89JCGDfN/8sSOLsHz5Jfv3rSKC/c93QUhu0d7tT
	NdYJsnmEtMxOfJqak9bUpYSzwu7PpTtGqGArVj4pti1hBRjw20uKh/ZedJ4qczE0GKVm
	MYSTUhBdX3ws/Ipqib7IxCKmXa0gQuvPFkZ01GzNCP5fJFkKpkogQZRDjU77tiJfzotx
	4RfA==
X-Received: by 10.180.105.36 with SMTP id gj4mr1623111wib.64.1440481261733;
	Mon, 24 Aug 2015 22:41:01 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EB5.dip0.t-ipconnect.de.
	[79.223.14.181]) by smtp.googlemail.com with ESMTPSA id
	y13sm26267680wjq.26.2015.08.24.22.41.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 22:41:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 07:40:45 +0200
Message-Id: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 0/6] updates and fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Aug 2015 05:41:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 985fca448f2593f5e5aeba07656eb8f2dad60183:

  dhcp: fix parsing warning (2015-08-24 14:06:58 +0200)

are available in the git repository at:

  git://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to 51f82c6b48e98a18de0cd9252d4197664f3fb3cd:

  geany: update to 1.25 (2015-08-25 07:30:30 +0200)

----------------------------------------------------------------
Andreas Müller (6):
      gtk-xfce-engine: create and pack gtk3 themes by default
      xfce-dusk-gtk3: initial add 1.3
      packagegroup-xfce-extended: add xfce-dusk-gtk3
      poppler: update to 0.35.0
      xfce4-whiskermenu-plugin: update to latest git
      geany: update to 1.25

 meta-oe/recipes-devtools/geany/{geany_1.24.1.bb => geany_1.25.bb}                                                  |  8 ++++----
 meta-oe/recipes-support/poppler/{poppler_0.33.0.bb => poppler_0.35.0.bb}                                           |  4 ++--
 meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb                                                         | 19 +++++++++++++++++++
 meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.5.0.bb => xfce4-whiskermenu-plugin_git.bb} | 10 +++++++---
 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb                                                    |  4 ++--
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                                 |  2 ++
 6 files changed, 36 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.24.1.bb => geany_1.25.bb} (58%)
 rename meta-oe/recipes-support/poppler/{poppler_0.33.0.bb => poppler_0.35.0.bb} (91%)
 create mode 100644 meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.5.0.bb => xfce4-whiskermenu-plugin_git.bb} (54%)
-- 
2.1.0


