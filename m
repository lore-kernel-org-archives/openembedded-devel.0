Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylL-0001lE-T2
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:26:56 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=r01fx2nYqovWfAUyJmFPjNHLkzqcSh+VvGleDcGyX5I=;
	b=cniZK+/OiyX7AI79sMGmlXAtpvzuMFYSKjwiuPjBVzXXD290nnyT205QSgwXNSBAsQ
	MJ2YXmScTSZqiyGR33WJJSi0CjHrV6V17dMBf/mTqGfyW0PcTXQ/XP4QdCXNPgTOqUUE
	4tloDP6j0cRV0HhBvKMnBh8t/ut1a8TBx26tV0n3BUoQs+KF+U6ctoSAJmBUA+2fp17i
	MUqgNDYGH91/hWcAYtROcYLgvG36IwhD9WQMhrLpW0FlGxumo/zjRwQtKxDFjnddhzeD
	qFo6yD+1ft4cNKPxYRo8QXsfSqMIAo2+HZWs3xZDiUOJpOK8lbYTo0DKmw2vqzlKP6RB
	pQlw==
Received: by 10.204.0.81 with SMTP id 17mr114325bka.140.1347977658174;
	Tue, 18 Sep 2012 07:14:18 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:45 +0200
Message-Id: <1347977601-28665-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 04/40] libxfce4util: update to 4.10.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 14:26:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ibxfce4util_4.8.2.bb => libxfce4util_4.10.0.bb} |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.8.2.bb => libxfce4util_4.10.0.bb} (54%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.2.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.0.bb
similarity index 54%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.2.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.0.bb
index a9819fb..546ee32 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.2.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.0.bb
@@ -4,11 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
-PR = "r0"
-
 inherit xfce
 
-EXTRA_OECONF += "--with-broken-putenv=yes"
-
-SRC_URI[md5sum] = "3376a77637a4292a863027d595548ee2"
-SRC_URI[sha256sum] = "05a149841575cb961588742c8c9795c6f0d09f27d59546dd8a933b010d2ac816"
+SRC_URI[md5sum] = "2e8defcd40cbf6afedde531b27314511"
+SRC_URI[sha256sum] = "0979fee12880bb5f011ab38d6c7cc9afe5fd68eb96ccda895cb56dbc16e7608e"
-- 
1.7.6.5



