Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 184846FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 11:40:56 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b14so118816685wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 03:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=4x3xYk1iT748PbnZPTcId8ub6F/dvR5F4xNGhT6i+bE=;
	b=hmstPNHaPa8w/QoaYjegaQWY6hyA29bXNc5IRO33XPH/eDYagSNE2EfdYiD7ip19i1
	BCY6IruD0lqxbBU84EkTHjH6ZcfrGZfr75j+xZ//nEbWRj00pSP05IFA/XKSG/QYioiC
	jP21xZU6RUz8VlVgxz3xEex81OhYI6z1mV5NE21+ar2ar9rYXLqaixaOkXlIhdXIT+k2
	Q/A35Xix/2FF6Xs+M/eXNVvgEZ2Cqs9GDvkV6bIW7tOey9qPpdv9X5L+crlnnwJapqXA
	axW1b+Mphg3nwqg37vN29NadaBqKmT0zQ3DA3wsbwS06RQelolVBYJMfX34bxf4Txni2
	ckEw==
X-Received: by 10.194.242.195 with SMTP id ws3mr112586904wjc.131.1452166856709;
	Thu, 07 Jan 2016 03:40:56 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	c26sm13236460wmi.21.2016.01.07.03.40.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 03:40:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jan 2016 12:40:24 +0100
Message-Id: <1452166825-29098-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/1] update to 1.24.2 to make access to windows shares work again
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
X-List-Received-Date: Thu, 07 Jan 2016 11:40:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following patch was run-tested with jethro. If it survives Martin's master
world I would be happy to see it in jethro too.

Andreas Müller (1):
  gvfs: update to 1.24.2 to make access to windows shares work again

 ...ib-2.31-deprecations-and-thread-API-chang.patch |  599 -----
 .../0003-Adapt-to-glib-mutex-API-changes.patch     | 2454 --------------------
 .../0004-Adapt-to-glib-thread-API-changes.patch    |   44 -
 ...daemonfile.c-replace-g_memmove-by-memmove.patch |   36 -
 .../gphoto_build_with_libgphoto_2.5_API.patch      |   78 -
 .../gvfs/gvfs-gdu-volume-monitor_1.10.1.bb         |   28 -
 .../gvfs/gvfs-gdu-volume-monitor_1.24.2.bb         |   22 +
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |   18 +-
 .../gvfs/{gvfs_1.10.1.bb => gvfs_1.24.2.bb}        |   22 +-
 9 files changed, 39 insertions(+), 3262 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0002-Adapt-to-GLib-2.31-deprecations-and-thread-API-chang.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0003-Adapt-to-glib-mutex-API-changes.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0004-Adapt-to-glib-thread-API-changes.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/gphoto_build_with_libgphoto_2.5_API.patch
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.24.2.bb
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.10.1.bb => gvfs_1.24.2.bb} (64%)

-- 
2.5.0


