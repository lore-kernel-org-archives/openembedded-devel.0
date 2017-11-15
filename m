Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 23EDF6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 13:02:23 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t139so2870486wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 05:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Frw8Rd8G/clChkM86W7cnJw6zmSYw5UAhV3IQ1dSLYo=;
	b=iIjgB/NzeImIPoMbsdxG9qUi2NZfGzEF5RTOKHaXJNO4fVyLBrcKVDeofuS8U3uYfP
	O4HnY2fNyfzJ0MraPAmxtAAL8W67rRDSmk37ng76FNpWku61HLJUFlVzpaElkxWsZOEc
	aI0em6PRR75FkSubP43koRtxXB3kEyJjhd0PPmc60kC7MyhT+gIYdQpzgc/RJmbYluDV
	zMFNQZsT3LdThFd75OqBJxPkPuWyIaJJ8wVb41RMjFErVbCPqMRVK0OJRhfZh6e2LAvQ
	PjWUUj5BrpEmyVu74HBu9gNNdChfdjI8kFpwEsY5Tf0wO6PN0ZCE1WaxB1gYv+rXjnSn
	ASJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Frw8Rd8G/clChkM86W7cnJw6zmSYw5UAhV3IQ1dSLYo=;
	b=Q7RJaJ62eDVEP1osDPdJ8fBA5RBCJbhJqhlUXr3RmYFK9gka3nxj+QppNs+I/H0Yk0
	wUHcePN668ex9+CTxa+k4vB2UGmkfPUY4vr3ALPIRD6OMtwDU/zriYJCVZ9st5WhMJgv
	hNJHW1a1Gg9dVJ2sgHK5aGp9St3ZaQVEZ71tSZ12XdGkDh29AQAUk8MjdVKIhxVzN2yY
	q6evq3myiqM1YnbCsPNup8QoVrLASbF+SaY66UtmVwS4Vy7A2YxpmuBKMyoEr2yRvwGV
	wmBSzzW0S02oUrwxfdueJqZE3S01mag2uzgrmO5nbWzsz6AdCa7hFT/XBfEz1bH8y7Px
	iV2g==
X-Gm-Message-State: AJaThX5rmHl1MtZVg97w47iuz6RoT1TKtz9ah7TIME3m/ObSBHuR755O
	uAvwMAESbEo6heF98ptvSqKIHg==
X-Google-Smtp-Source: AGs4zMagdzkar6vt38XfV22QuYIk/KO/6XjYcj1QJ98U/TIbdnDxEnnbXUsRZk2ueu9/thG+MRbcNQ==
X-Received: by 10.28.13.135 with SMTP id 129mr12285984wmn.24.1510750944464;
	Wed, 15 Nov 2017 05:02:24 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	o8sm62050571wrc.10.2017.11.15.05.02.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 05:02:23 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Nov 2017 14:01:32 +0100
Message-Id: <20171115130132.17427-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.5
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-qt5][PATCH] packagegroup-qt5-qtcreator-debug: remove qtdeclarative-plugins
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
X-List-Received-Date: Wed, 15 Nov 2017 13:02:24 -0000

This package is no longer created, it was also removed when moving to qt 5.8
with commit 333949a8239dfa7788b35f1059614733e11a6a25 from
packagegroup-qt5-toolchain-target.bb.

As the packagegroup was added for a target providing cross-debugging services
for qtcreator (commit 53242713da6ae01f2b1f7e674b00517390fe2bcb) and maybe the
package parent qtdeclarative is still needed, add that one instead.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb b/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
index b34dbff..5894955 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
@@ -12,5 +12,5 @@ RDEPENDS_${PN} = " \
     gdbserver \
     ${VIRTUAL-RUNTIME_qtcreator-debug-ssh-daemon} \
     openssh-sftp-server \
-    qtdeclarative-plugins \
+    qtdeclarative \
 "
-- 
2.9.5


