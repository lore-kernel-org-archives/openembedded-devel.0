Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8E86F738CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:49:47 +0000 (UTC)
Received: by widem10 with SMTP id em10so39672447wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LOvrJViFr+66R6qOioZLqCzJHPw5ws+ydmi0lXI3EeU=;
	b=Njg4qZJlbDFqiJ0GDU1AuIFD1j5vaZY2aqEhC78Kvvdtz8l+69ULTntUU1gJqp881w
	pC4ZivuuKlM+mwmoQEoOlGJLu1yFYfcwysjrSfRHfp8QYEIaZtt88nzhTwf0FO/hkTIj
	C/FAefzFOum7pyfP0S03O2ileqN3+qjf69e3rCh18LZns46Pts7vi3ivXmPlRvLoIQN/
	wXm6/SwNHFmujfTI40yln+RAqOPUfKdNf7wmIg8gIJuBZ58Mw+EFUsWB+qnZDnN4hq+H
	e9JrsRVnga78WKV30ZsdgukCbOSDaV+LvDuYEy19wZeu4gNWe8ku9ct2k1CqL4aRhREq
	CPUA==
X-Received: by 10.180.184.136 with SMTP id eu8mr12230122wic.45.1425570588015; 
	Thu, 05 Mar 2015 07:49:48 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hw7sm7157364wjb.24.2015.03.05.07.49.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 07:49:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 16:49:47 +0100
Message-Id: <1425570588-20920-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425570588-20920-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425570588-20920-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] mplayer2: set REQUIRED_DISTRO_FEATURES and LICENSE_FLAGS
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
X-List-Received-Date: Thu, 05 Mar 2015 15:49:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 2de26b0..8c5f4eb 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -10,6 +10,12 @@ PROVIDES = "mplayer"
 RPROVIDES_${PN} = "mplayer"
 RCONFLICTS_${PN} = "mplayer"
 
+# Depends on xsp, libxv, virtual/libx11, libxscrnsaver
+REQUIRED_DISTRO_FEATURES = "x11"
+
+# because it depends on libpostproc/libav which has commercial flag
+LICENSE_FLAGS = "${@base_contains('PACKAGECONFIG', 'postproc', 'commercial', '', d)}"
+
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
-- 
2.3.1


