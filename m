Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 11E276BE01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:04 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so345508ead.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0ueAwPPaxbXCGq2Q07NHs9hfYOZrBy/w8iPwaipc7J0=;
	b=Ns4gzZS2hQEWXIVihdkNKB+CQ+7Bek6gmDG44/5nLbmS/ia5KbsuseH0c6ZSY8avMQ
	N4P66sO+jA2BaAVLM0Sc/EokpVCNcXPLojipnmnwA+a+/ITPfhbqsCLzWUTVpNxKNxd1
	fJYW490pWVPN5J17wA0kEB9IcLZSF4smyVk6glpBbAq+8sg4lClfSWP0VtHDfeoMbWbb
	w8gBIZTdg3RIqRubrvUasUgQS9Fvm8DfUlRDusSAs4f23vDuqt9eARVqgZx+/uSPdbw7
	9futbzWCBWY7eSG5pWhpZsbujJ8GPm8L2Y+P78Wsnw/DopRyZ1r6z5Fzhpu7Kja12qD6
	BXTw==
X-Received: by 10.15.86.11 with SMTP id h11mr3700645eez.80.1377791525529;
	Thu, 29 Aug 2013 08:52:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm47163239eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:50 +0200
Message-Id: <a9cbea1ec002a3ea54bf0ead25ab3f31ee33d531.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 57/66] thunar-volman: Add PACKAGECONFIG for notify
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
index 4444820..28f9597 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
@@ -9,4 +9,7 @@ inherit xfce
 SRC_URI[md5sum] = "250af757ea629c7c27f554d17119080c"
 SRC_URI[sha256sum] = "ff0887c862b578580d05f4cd7db66081382ff143f9cc7ea3c9ba58cf5d02bceb"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
+
 RDEPENDS_${PN} = "eject"
-- 
1.8.3.2


