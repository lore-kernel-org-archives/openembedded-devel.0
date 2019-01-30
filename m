Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE876C514
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 21:37:29 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m1so390078pgq.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 13:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XG2kMsQ2FLqVY6w6MuRMNlMEOFFvr3dKHZyBB4tKBeI=;
	b=qSt8XrCNsUyOQeRzWl0v38iIaQZ711GUpQ91ltIkScO0/5ENAj43Y2aFoxsGcGNv4p
	fx63w/j65vw5Sk7bhZcrOYVfKpWG2UE9x1v/3msCAFdVaI1wth4vvyIyNO3lZztyROwS
	vIZpkF6pyXzoZptwaAaZkunyLD9fZxwCRdgYWIadE634WuFi8P8TwuqT0curFGR7Dq9q
	UgHAPtEOHBC3qfTE2dSDOIjgaryx50LTri3fItALg/fCFHoWVpjsXvV+PCb+WpYwyNta
	/oK3ON5r7Yf7wBtFQKBV7yNxr4EYErfQScZ04aheZkQrdeQv459gUje7WT0T9/s7oVJM
	F8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XG2kMsQ2FLqVY6w6MuRMNlMEOFFvr3dKHZyBB4tKBeI=;
	b=eLwkHZ2hMhmTTOTcQE5qYvUv9Qunk4Qt4oOx1dIvj42RIK75mualcN/YvHatSqC7hN
	RaHQEsIMyQGt6oKvjeA6wc7XAkbRarRdTFZC5LtIx5x9J7xiW6eIvair1AevewkM33nW
	kmxyrRQOtff6OfOiRU0mCnyLLfTJDF6Gk+cd2ulBg5KqjNwWKlySBGBngKzutMO4vnbE
	rSc8ZuU0UjLYWfNdvbHDqgf6cMF0QbplyS8xXmBmA41oDuEp5W5x/ylXUoiPVcmWRS2j
	lLl3OQZRqdm3UxnB4Je+eYUO81oefz+iyo1YYYUVEh63am40f3iKClwqFkI+ZKIfepeI
	eO/Q==
X-Gm-Message-State: AJcUukeKXi2Iev5WLKL+3xVA7gJts+iM7o0KT9dzbaYbR7minc0tLx9A
	i0QX3kSqN5+I5K8m7aC1PntdHjQ1MP8=
X-Google-Smtp-Source: ALg8bN721Knj42xrKTMVuURfrTZTmHnZ1t7txIROeLy4cdrIcC68pJDamKn1VgOVHI776Xd7l7m8bg==
X-Received: by 2002:a63:c00b:: with SMTP id h11mr29654432pgg.429.1548884249989;
	Wed, 30 Jan 2019 13:37:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	184sm3505702pfe.106.2019.01.30.13.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 13:37:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2019 13:37:18 -0800
Message-Id: <20190130213718.18451-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] botan: Upgrade to 2.9.0
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
X-List-Received-Date: Wed, 30 Jan 2019 21:37:29 -0000
Content-Transfer-Encoding: 8bit

License-Update: Update copyright years to 2019

https://github.com/randombit/botan/commit/d5edb39e968893bafe87a6a5ef12af45914c0d70#diff-98cd14c95bb22f9d397da0603a77d950

Swith to tarball fetcher

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../botan/{botan_2.7.0.bb => botan_2.9.0.bb}         | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.7.0.bb => botan_2.9.0.bb} (78%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.7.0.bb b/meta-oe/recipes-crypto/botan/botan_2.9.0.bb
similarity index 78%
rename from meta-oe/recipes-crypto/botan/botan_2.7.0.bb
rename to meta-oe/recipes-crypto/botan/botan_2.9.0.bb
index 92853d00e8..a7d25d5674 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.7.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.9.0.bb
@@ -4,15 +4,14 @@
 DESCRIPTION = "Crypto and TLS for C++11"
 HOMEPAGE = "https://botan.randombit.net"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=bf361fc63df3fa25652ee82c43b7601a"
+LIC_FILES_CHKSUM = "file://license.txt;md5=f4c145d4d70a3244a053c9f90d4841fc"
 SECTION = "libs"
 
+SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tgz"
+SRC_URI[md5sum] = "db8403d6a2f10c20fde3f3c76be9a045"
+SRC_URI[sha256sum] = "305564352334dd63ae63db039077d96ae52dfa57a3248871081719b6a9f2d119"
 
-#v2.7.0
-SRCREV = "5874000d42c338ec95a7ff24cdc0c64e70f967b5"
-SRC_URI = "git://github.com/randombit/botan.git"
-
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/Botan-${PV}"
 
 inherit python3native siteinfo lib_package
 
@@ -52,4 +51,3 @@ PACKAGES += "${PN}-python3"
 FILES_${PN}-python3 = "${libdir}/python3"
 
 RDEPENDS_${PN}-python3 += "python3"
-
-- 
2.20.1


