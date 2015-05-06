Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 79B3873755
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 16:11:16 +0000 (UTC)
Received: by widdi4 with SMTP id di4so208439362wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=QQMIUVxLkFoegxiNjycvxF/T/K1xvqntQhhdo3duH4s=;
	b=Ik6b1YvYrDLsg2xUwTNo+jIgE4t3ldD0SgsXBtjtupRYd1LsTuwcKMXoNaXOMgtBAJ
	TvYOIY4xk7D8M8c2/Ad2aeCsV1bCGS2IQCIz0A4k3AragMruOQbwLhSETVyiBwfMtORg
	f26kJM8cR98XNwoCOTv6SRyDtBb0+0qPA0ymvWvyn1BrqFW5evp3zpRwXv4Gxnl/qKpc
	/NroDP4miwuoFgYj91vOjYlz5pk09nYse9UpbMRd3tQC6ESamp2zMvICWe6loEJ4lynB
	Qm/eQBwRMJHd9Q9YAHj8A30KWCZmDr2e/QjzqzQHORtzn6ZFAXSGVXHIDE9kYfW2gegT
	GgLw==
X-Received: by 10.180.93.7 with SMTP id cq7mr6558860wib.24.1430928677105;
	Wed, 06 May 2015 09:11:17 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id k9sm2846567wia.6.2015.05.06.09.11.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:11:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 18:10:38 +0200
Message-Id: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/8] xfce updates + udisks2
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
X-List-Received-Date: Wed, 06 May 2015 16:11:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 2080f15e86d3d8e1e1f65e16b014545fe538114c:

  pcsc-lite_1.8.6: Modified the license for libpcscspy. (2015-04-24 15:11:37 +0200)

are available in the git repository at:

  git@github.com:schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to bf435e1c21ce2522e335c905a18f2175824daa73:

  add udisks2 2.1.5 (2015-05-06 18:04:45 +0200)

----------------------------------------------------------------
Andreas Müller (8):
      exo: update to 0.10.4
      xfce4-session: update to 4.12.1
      xfce4-power-manager: update to 1.4.4
      xfce4-time-out-plugin: update to 1.0.2
      xfce4-smartbookmark-plugin: initial add 0.4.6
      packagegroup-xfce-extended: add xfce4-smartbookmark-plugin
      thunar: update to 1.6.8
      add udisks2 2.1.5

 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb                                                             | 31 +++++++++++++++++++++++++++++++
 meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb                           |  9 +++++++++
 meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.0.1.bb => xfce4-time-out-plugin_1.0.2.bb} |  4 ++--
 meta-xfce/recipes-xfce/exo/{exo_0.10.3.bb => exo_0.10.4.bb}                                                 |  4 ++--
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                          |  1 +
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.6.bb => thunar_1.6.8.bb}                                          |  4 ++--
 meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.4.3.bb => xfce4-power-manager_1.4.4.bb}   |  4 ++--
 meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.12.0.bb => xfce4-session_4.12.1.bb}                   |  4 ++--
 8 files changed, 51 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb
 rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.0.1.bb => xfce4-time-out-plugin_1.0.2.bb} (67%)
 rename meta-xfce/recipes-xfce/exo/{exo_0.10.3.bb => exo_0.10.4.bb} (87%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.6.bb => thunar_1.6.8.bb} (87%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.4.3.bb => xfce4-power-manager_1.4.4.bb} (89%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.12.0.bb => xfce4-session_4.12.1.bb} (85%)

-- 
1.9.3


