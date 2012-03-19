Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9lCm-0005cS-1Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 23:37:32 +0100
Received: by wgbdr12 with SMTP id dr12so961206wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=+5QHVF0QZeCayW84U/svbM7zhCy7qKMHjiZFXreF0SM=;
	b=kl8VajxXe3/ZKxRXxdjOr+dUQ2BLpuONMLr25nlL4tVZe88mZpFxtR3pUeEp0kQ9p9
	PJugR2wPds7f6LpdFW5BqUS3ycRxdmlgYIGfLtehdAnmAYnxeG3nFChqnZmGb/BBVnH1
	fF8h6/XKHi0/UrAEaAa1KnVxA8EqKyY3U2rpUVWRqllyOIi54Z+pz+I5WE8CpICoSlCA
	7fHWqJXUvZ2hnAaIapCYZ7CjfXvdwhgksc34IYAQfL9gGJQp5/0yd/Va5vYx3mdr4saq
	jUJLbgMFkHxBG+Ymtalu9P9KQl/IOsqPs0rMPOlsEwz/iEPU1fA0Nfw4lynU8rpD2+DZ
	cxaw==
Received: by 10.216.134.233 with SMTP id s83mr7934779wei.104.1332196120179;
	Mon, 19 Mar 2012 15:28:40 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D1A.dip.t-dialin.net.
	[91.10.61.26])
	by mx.google.com with ESMTPS id fw5sm29043430wib.0.2012.03.19.15.28.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 15:28:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2012 23:32:40 +0100
Message-Id: <1332196360-3171-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332196360-3171-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332196360-3171-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe v2 2/2] midori: add librsvg-native to DEPENDS
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
X-List-Received-Date: Mon, 19 Mar 2012 22:37:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

configure found rsvg-convert on host:
...
Checking for program rsvg-convert           : /usr/bin/rsvg-convert
...

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/midori/midori_0.4.4.bb    |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
index bccc7b3..a317b5a 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "Midori is a lightweight web browser."
 HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native"
+DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native librsvg-native"
+
+PR = "r1"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-- 
1.7.4.4



