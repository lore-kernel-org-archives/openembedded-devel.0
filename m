Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UHBAm-0001nG-Qa
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Mar 2013 11:50:52 +0100
Received: by mail-ea0-f169.google.com with SMTP id z7so2182953eaf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2013 03:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=CyM6Y3tpbMYSb4bGg44sv6Io95N/DIsEVs0zhHMFIIs=;
	b=nhFBFL8BNw6qo6mMZTnmeCJuSDIgPAB5ly/akiOZFf7iZq+duRCpu0/KANxF3oSqhI
	NxVzCb1CVtqEoW/oT8HcNI2BPNYtV49XvUPc4ic70kpsfZ6GDnvQw+uEW+pdoUt5lEQX
	plx/+nSU6H0VLma2FHOmW2H5HDi6BwsOlhpg6p8SSTQfcpR+y0UuYzFeTlIzNFpMwhCZ
	NfReVh4Ng2I0btzzGia1hUwpqPjRLWgovOlayxP4hKdzJUBDVM11Rbugb5gviugliJy9
	Q2tu3ktXr6hnuCMsCsEvrsMbH7vpeOdJ29Tb7sfvc0jEgv4C3ULfBt+zorg0iuQL3RTd
	4wnw==
X-Received: by 10.14.0.73 with SMTP id 49mr37215859eea.21.1363516434472;
	Sun, 17 Mar 2013 03:33:54 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id 3sm20702150eej.6.2013.03.17.03.33.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 03:33:53 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Mar 2013 11:33:33 +0100
Message-Id: <1363516413-32548-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1363516413-32548-1-git-send-email-koen@dominion.thruhere.net>
References: <1363516413-32548-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl7OhgcMHSwnPWB7hdn/XzmM9cJhSRSCOxcUwRqNynv9PiBrkj1qmsSTUe3z5ZQGa3Tfk0J
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/2] opencv: switch to out-of-tree builds
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
X-List-Received-Date: Sun, 17 Mar 2013 10:50:53 -0000

This eliminates a few warnings from the configure step and makes sense in general.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/opencv/opencv_2.4.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
index 2114e77..916c8c5 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
@@ -20,6 +20,10 @@ PR = "r2"
 
 S = "${WORKDIR}/OpenCV-${PV}"
 
+# Do an out-of-tree build
+OECMAKE_SOURCEPATH = "${S}"
+OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
+
 EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
                  -DBUILD_PYTHON_SUPPORT=ON \
                  -DWITH_FFMPEG=ON \
-- 
1.8.1.4



