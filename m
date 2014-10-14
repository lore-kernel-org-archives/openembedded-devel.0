Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id BDCE4717E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:35 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id h11so7238862wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=ovaFUP3GgUnD+X4rBxCjQZeiDs/620GNKwDAn8w3msk=;
	b=RgnNluMclmtp0JaaNAoX/DQmg9Ovs3YuMGPDUw68hS1vW0P7W3GjpcyhHI+yQroWA9
	0qLxGD5jnCWbnPoTLrsqVm4HlqhSZO5NGadZma4s8Iaxo2MfXSp21og/dfwPZCSR5/rm
	z5BA/wNWKZBANU97TwDRnEh+TAule+FPn2FBQFdFPzgo+A4qpyX7orcTT1yM1ArIoEOP
	WVC2e/Sa8Y23tppylwBPQj6MoDeRYalqkcjbh8QGxb0W1xGZzU+lm7bFrz8e5uZsjFL2
	MqaqRGRIjyFDx0jQmCrqMoCaI9CyrRlsDkU8g8vlVDHvZObFmvMYRlrAW34D3JeSHAAQ
	CjTw==
X-Received: by 10.194.249.34 with SMTP id yr2mr8136704wjc.9.1413324876123;
	Tue, 14 Oct 2014 15:14:36 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:13 +0200
Message-Id: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 00/15] updates and qa fixes
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit d1951db22a9971a1bb7cf25810ec3bdc9669a6f1:

  modphp: using PKGCONFIG and PACKAGECONFIG for libxml and soap (2014-10-14 11:48:58 +0200)

are available in the git repository at:

  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

for you to fetch changes up to 3d89bac9443e27b68ac88571eefbfb8d77e2d3dc:

  libgphoto2: add bash to RDEPENDS (2014-10-14 20:15:29 +0200)

----------------------------------------------------------------
Andreas Müller (15):
      xfce4-clipman-plugin: update to 1.2.6
      xfce4-equake-plugin: update to 1.3.5
      xfce4-terminal: update to 0.6.3
      xfce-app.bbclass: SRC_URI calculation supports multiple digit version numbers
      orage: update to 4.10.0
      glade3: update to 3.8.5
      mime-support: add perl to RDEPENDS
      xfce4-places-plugin: update to 1.6.0
      gigolo: initial add 0.4.2
      xfce4-mailwatch-plugin: initial add 1.2.0
      packagegroup-xfce-extended: add xfce4-mailwatch-plugin and gigolo
      tumbler: make build deterministic by adding PACKAGECONFIG for gstreamer-thumbnailer
      xfce4-dev-tools: add bash to RDEPENDS
      geany update to 1.24.1
      libgphoto2: add bash to RDEPENDS

 meta-oe/recipes-devtools/geany/{geany_1.23.bb => geany_1.24.1.bb}                                        |  4 ++--
 meta-oe/recipes-devtools/glade/{glade3_3.8.2.bb => glade3_3.8.5.bb}                                      |  9 ++++-----
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb                                                    |  1 +
 meta-oe/recipes-support/mime-support/mime-support_3.48.bb                                                |  1 +
 meta-xfce/classes/xfce-app.bbclass                                                                       |  2 +-
 meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb                                                            | 11 +++++++++++
 meta-xfce/recipes-apps/orage/{orage_4.8.4.bb => orage_4.10.0.bb}                                         |  4 ++--
 meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.6.2.bb => xfce4-terminal_0.6.3.bb}               |  4 ++--
 meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2.3.bb => xfce4-clipman-plugin_1.2.6.bb} |  6 ++++--
 meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.3.bb => xfce4-equake-plugin_1.3.5.bb}    |  5 ++---
 meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb                                | 11 +++++++++++
 meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.5.0.bb => xfce4-places-plugin_1.6.0.bb}    |  4 ++--
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                       |  2 ++
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb                                                         |  3 +++
 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb                                         |  2 ++
 15 files changed, 50 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.23.bb => geany_1.24.1.bb} (73%)
 rename meta-oe/recipes-devtools/glade/{glade3_3.8.2.bb => glade3_3.8.5.bb} (73%)
 create mode 100644 meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb
 rename meta-xfce/recipes-apps/orage/{orage_4.8.4.bb => orage_4.10.0.bb} (80%)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.6.2.bb => xfce4-terminal_0.6.3.bb} (67%)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2.3.bb => xfce4-clipman-plugin_1.2.6.bb} (69%)
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.3.bb => xfce4-equake-plugin_1.3.5.bb} (64%)
 create mode 100644 meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.5.0.bb => xfce4-places-plugin_1.6.0.bb} (74%)

-- 
1.8.3.1


