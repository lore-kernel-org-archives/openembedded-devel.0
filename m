Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id E60836C735
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 18:23:48 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so5346407pab.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aEtYgH9fEgrWJhrafmLCsKZwTM5gz3faN1coKpEyUTI=;
	b=ttwsdZD2F9TP1QWeD3pnkKws4qHSMoUeBTVafRqwT9e1P3kvnXjKF6TBqU1PylEbN+
	q1HTbECpYQ4aOZIQsesqzXSHyvgP9TgL/VDYmHpdNWRRJiQHFSBQUxHxRnNbVV7WJCAT
	/gqrP2WomiLbzMlgs5chbAi7Nhuvry1lfKIAFz4E1Fkes3lyX7RwMqaZu7DQO99MGl/j
	sE+hfuRD7wqs+794hLKQa6OEmRXhj2RFuUIqcvfQsCQ3y3/5Hh/ZaV3oDz1BLRxNpVM2
	rYHk606RCopcj3lSp1rVIh17SJ5kfmACYy0ZZb2YrTPJ+3x7uWTfkCWRmU+KX9QQquS5
	njVw==
X-Received: by 10.66.240.103 with SMTP id vz7mr10183635pac.37.1396031029423;
	Fri, 28 Mar 2014 11:23:49 -0700 (PDT)
Received: from pine.bchsia.telus.net ([206.116.3.18])
	by mx.google.com with ESMTPSA id j3sm26106526pbh.38.2014.03.28.11.23.48
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 11:23:48 -0700 (PDT)
From: Adam YH Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Mar 2014 11:23:29 -0700
Message-Id: <1396031009-15874-1-git-send-email-adam.yh.lee@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-gnome][PATCH] gvfs-gdu-volume-monitor: Define build dependency on libgnome-keyring
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
X-List-Received-Date: Fri, 28 Mar 2014 18:23:51 -0000

Build fails due to missing libgnome-keyring static library
(libgnome-keyring.la). libgnome-keyring has to be
explicitly listed as one of the dependencies.

Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
---
 .../gvfs/gvfs-gdu-volume-monitor_1.10.1.bb         |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
index bd6d9de..cf0ab0c 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
@@ -2,8 +2,7 @@ require gvfs.inc
 
 BPN = "gvfs"
 
-DEPENDS = "gvfs gnome-disk-utility"
-
+DEPENDS = "gvfs gnome-disk-utility libgnome-keyring"
 PR = "${INC_PR}.0"
 
 # we need gdu files only: reduce files to delete in libexecdir
-- 
1.7.9.5


