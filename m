Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id BB853762AA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:37:06 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so127004799wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=miQgit8byQXNCxYNhuMnxtFjFKYi7DHb6hUrYqI6qVg=;
	b=wn9hms+zPW1pc8Yie6xv92txpBoCNainuS4SPT/O/Oji7oPDJ4I4FwgCChjJjdd2+O
	L+dsG/G7UOBhIUx/QJdEHIHvPNVPVPX/DyY5wV9KXYCRbzi08SybiSWgN8fKRZETcVy/
	+WFZxCIgzbDjcpooAizoaK0bUjKkjZ/4kqEjZYrn0Q0TluRdSndJ0XLaFhJ8aoH4qViw
	1LADoR/tjz9M+vSifSFwlkB3zt5Cr2iJRraSA+TaNnsVh2WrHXFl46v0GEo4Pv6Khv2u
	63YS8AQBkTYOjUUb7IzB/oJq5gABZDcPHkgcfzk+VPfxclrgsJ5SrKtnc7r6ZMapngCW
	fh4A==
X-Received: by 10.180.90.209 with SMTP id by17mr26858662wib.2.1438025826934;
	Mon, 27 Jul 2015 12:37:06 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2DA2.dip0.t-ipconnect.de.
	[91.10.45.162]) by smtp.googlemail.com with ESMTPSA id
	k12sm23016995wjw.4.2015.07.27.12.37.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 12:37:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jul 2015 21:36:50 +0200
Message-Id: <1438025815-31315-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 0/5] minor xfce4/gnome updates
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
X-List-Received-Date: Mon, 27 Jul 2015 19:37:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit f637fadb106a09a6f3dfba4181d06dc9b5e82ff5:

  hidapi: new recipe (2015-07-16 21:09:11 +0200)

are available in the git repository at:

  git://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to 010cb4db72ac85efdc6dd396c358c3d9c0e1986b:

  packagegroup-xfce-extended: add xfce4-hotcorner-plugin (2015-07-27 21:23:53 +0200)

----------------------------------------------------------------
Andreas Müller (5):
      xfce4-notifyd: update to 0.2.4
      libwnck3: update to 3.14
      libwnck: update to 2.31 / avoid conflicts with libwnck3
      xfce4-hotcorner-plugin: initial add 0.0.2
      packagegroup-xfce-extended: add xfce4-hotcorner-plugin

 meta-gnome/recipes-gnome/libwnck/{libwnck3_3.0.2.bb => libwnck3_3.14.0.bb}                          |   7 ++--
 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb                                                  |  15 --------
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb                                                  |  22 +++++++++++
 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Restore-libnotify-version-7.0.0-compatibility.patch | 152 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.2.2.bb => xfce4-notifyd_0.2.4.bb}             |  10 ++---
 meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb                           |  11 ++++++
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                  |   1 +
 7 files changed, 194 insertions(+), 24 deletions(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.0.2.bb => libwnck3_3.14.0.bb} (70%)
 delete mode 100644 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
 create mode 100644 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
 create mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Restore-libnotify-version-7.0.0-compatibility.patch
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.2.2.bb => xfce4-notifyd_0.2.4.bb} (58%)
 create mode 100644 meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb

-- 
2.1.0


