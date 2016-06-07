Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9625B76312
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:39:03 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id m124so103590675wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2016 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=wLQcbrB0LFkksIdgifCpSkNp0hG+szwvT5KrJU/oz+w=;
	b=bjAHRTBTflM3C9EFL/b80fb7CEyqf5CkzN0XOZUFyGE7XsduE5lXeHpMS95kC6JQyc
	JL2/iHBErw14rPbAFLl1pWbDHKGjA4O0PIC6pfpsQkgc7SbdfVHn86PlhNPWuGCWcBnR
	VoIDBMre3Ce840Qcp34jA68uD5sVvER5/NWoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wLQcbrB0LFkksIdgifCpSkNp0hG+szwvT5KrJU/oz+w=;
	b=OePsum/ZncMSYqJYQFj7ogqcjzR7G2jacEePzgKbXcC4fCoMvP4LtXjA/ZR29BbmJE
	Q7yTs4y3lV9M/6KGxTK6TB6cAORfGL7Ni1tGA68M7VhFuCBowDR3uiJtQ40Hf3eIAYv3
	nXeUUGgyB/5KCpzDs8Y/D2Xf/eW1QI3fVD7OrS3+0gCxkqhHGLYayM556ma7kywgcazh
	xEK/BGopPn6yW4XjHx+gqM2P1Bh80zCxyDl5oHGiK9ln8Ia+MT6ds4lURx/JBwt6NFr8
	KEODOBETUJPiQC8evN+tZgfMNA4G51pDFj39I4UWq6f491Mx0kckm3qbDBY0UQZ1UHf8
	du5Q==
X-Gm-Message-State: ALyK8tKyq4POShMSqlEeWezc/6/NkUErC7k/OyW6/VePf/JmhIHtCpp/dDcVhYNs2riEg+5n
X-Received: by 10.28.58.6 with SMTP id h6mr1476134wma.101.1465288743381;
	Tue, 07 Jun 2016 01:39:03 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by smtp.gmail.com with ESMTPSA id t1sm24301018wjy.3.2016.06.07.01.39.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jun 2016 01:39:02 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jun 2016 10:38:51 +0200
Message-Id: <1465288732-2288-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-gnome][PATCH 1/2] gnome-vfs 2.24.4: drop useless print
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
X-List-Received-Date: Tue, 07 Jun 2016 08:39:04 -0000

This fixes the python3 traceback.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index f9b02b1..1c78474 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -53,8 +53,6 @@ FILES_${PN}-doc += "${datadir}/gtk-doc"
 PACKAGES_DYNAMIC += "^gnome-vfs-plugin-.*"
 
 python populate_packages_prepend () {
-    print d.getVar('FILES_gnome-vfs', 1)
-
     plugindir = d.expand('${libdir}/gnome-vfs-2.0/modules/')
     do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
 }
-- 
2.4.3


