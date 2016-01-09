Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 09BF173CF7
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jan 2016 21:47:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l65so20797823wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 13:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=uM85hLIeL88YyQSjtJiRaNEv3DMH34bh1Kg9nRjOjRA=;
	b=WEtXZI2dPfLJWtXpAoo3Qwlv/nkEmMTwgdrZKcN362ELGR4epqCcZS/ju6Ug6yjB3l
	pcFJjYdDrORIb1Zm7V+RQ/zg6cJnTQ3wSeDiFYH6ShuLePT/YtcwsUfITEd9kU2UNIJ2
	5dyGQnL41WHYKX3ig//zaxYPXpBjBJCm5mSSZ4l4B9Z3Fw3jYuk2mupWYjp/vCxX8W/w
	UIv4GpRaA3Gl3TxGzREwmO1LkuOIzM8kRTP6xHdgKDXyKxDqPp3LTLAQ3cWbTTF6Ccrf
	+ZAxjaQxu42YLVtUpvTSQA5NVCy7w1YLwiuodXZ3UoFHTpCViwngXIqorYBHIOJTez4K
	mp2g==
X-Received: by 10.194.86.166 with SMTP id q6mr105783144wjz.69.1452376055619;
	Sat, 09 Jan 2016 13:47:35 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D02.dip0.t-ipconnect.de.
	[79.223.29.2]) by smtp.googlemail.com with ESMTPSA id
	z17sm112721160wjq.1.2016.01.09.13.47.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 13:47:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 22:47:19 +0100
Message-Id: <1452376042-19248-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/3] gavfs enhancements / move to udisks2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Jan 2016 21:47:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0001 is V2
* The following patches were run-tested with jethro. If they survive Martin's
  master world I would be happy to see them in jethro too.
* Tests were performed with thunar. Trash, mounting of USB sticks, detecting
  avahi shares and windows shares were tested.

Andreas Müller (3):
  gvfs: update to 1.24.2 to make access to windows shares work again
  xfce4-power-manager: remove udisks rdependency
  thunar: remove udisks from RRECOMMENDS

 .../files/0001-Add-support-for-libsystemd.patch    |   49 +
 ...ect-UDISKS_AUTOMOUNT_HINT-available-in-re.patch |   57 -
 ...ib-2.31-deprecations-and-thread-API-chang.patch |  599 -----
 .../0003-Adapt-to-glib-mutex-API-changes.patch     | 2454 --------------------
 .../0004-Adapt-to-glib-thread-API-changes.patch    |   44 -
 ...daemonfile.c-replace-g_memmove-by-memmove.patch |   36 -
 .../gphoto_build_with_libgphoto_2.5_API.patch      |   78 -
 .../gvfs/gvfs-gdu-volume-monitor_1.10.1.bb         |   28 -
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |   27 -
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb       |   35 -
 meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb       |   61 +
 meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb     |    2 +-
 .../xfce4-power-manager_1.4.4.bb                   |    2 +-
 13 files changed, 112 insertions(+), 3360 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0001-Add-support-for-libsystemd.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0001-Revert-Respect-UDISKS_AUTOMOUNT_HINT-available-in-re.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0002-Adapt-to-GLib-2.31-deprecations-and-thread-API-chang.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0003-Adapt-to-glib-mutex-API-changes.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0004-Adapt-to-glib-thread-API-changes.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/gphoto_build_with_libgphoto_2.5_API.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs.inc
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb

-- 
2.5.0


