Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id C71C96CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 17:50:14 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so4326861wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 10:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sVpr4xmUjgMPaB/avlQXZ0ZBSjgEH69EJBYmtgAmeBY=;
	b=IYnVSMFzlPEQCbqs/pq3Nf6akcPfj9RXm3EK0A17lWsM/RxVjQhdt5fXdRWAiIve/+
	glwokrBO7KAgrJfnlc0iDsU96s3BQG/HIg/Uxf+ZFFt9Z5AZvBuT6LI5ofWwRaPbVYbM
	1KjK6QsmwJzC97kJJ8HwmGTaiTpMXkzBwVCTBuzMRw8kZdKeeT+A1tNOmzAa6c3eD+br
	/bgILMswhqVgu+iT1DO7bm58RTzd+H46sqfmMaokbRtcMgJ6INzRh5Dz9YEKtRpzCRYi
	67VAqnj2H0JlAUBUfB4RY+b6MF7koG1AeSDbkjbSWghfAkuSGz18HSzDn+1e+eEbLP2V
	E4Zg==
X-Gm-Message-State: ALoCoQlVLXJw1DlozlbDGo7WeO0EQM9c8NfynJ3mom3cSONlQx3pIY8YvnXiGfy3+8zqhLQ/nnqf
X-Received: by 10.194.241.228 with SMTP id wl4mr3328993wjc.2.1383328216210;
	Fri, 01 Nov 2013 10:50:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b7sm9573330wiz.8.2013.11.01.10.50.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 10:50:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Nov 2013 17:50:09 +0000
Message-Id: <1383328210-2058-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 1/2] pinpoint: add missing build dependency on cogl
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
X-List-Received-Date: Fri, 01 Nov 2013 17:50:15 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
index cc247f9..d9bc350 100644
--- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
+++ b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://pinpoint.c;beginline=6;endline=17;md5=201d438283607da393fae6aca085454c"
 
-DEPENDS = "gnome-common glib-2.0 gdk-pixbuf clutter-1.0 clutter-gst-1.0"
+DEPENDS = "gnome-common glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-1.0"
 
 inherit autotools gettext
 
-- 
1.7.10.4


