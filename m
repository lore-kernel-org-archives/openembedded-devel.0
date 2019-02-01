Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6F77C4B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:17:55 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v13so7046429wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3DqXR4daNYCZ6QILVe8PjrUPdu6MftkIrArlt6j/1DU=;
	b=UmchKycNvSB4ifKgtIHeDTLafGdOx9BVk8XgrYLzYPPApfnteDswrzwiAMDjiU9WCe
	YYSKAx6WyuSWfL0Pufwv7FpnhlRV1amlg9koSy4GWXz0kR+8VaKsXUvhugjg9Bzs3g9w
	xLT3BiXuJCefa4kfVQJBuBW3oE9hlCo+0npoO2lLUv6kldNmxMgp0kXs3aMXdTbuIooh
	VNh+vpdZJMNq0u2wVjEssy55Vtcp93pTAyeZ0jXjsI5Us4nUHakRGlRKenHZTUvjUlVC
	plcuK58nWuQ1DQMNl4vj3szt0mdYsWEgX7a0rt4IlGFiyb/KGiqrIQaK4YYmK768tcOk
	2xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3DqXR4daNYCZ6QILVe8PjrUPdu6MftkIrArlt6j/1DU=;
	b=iYbuHr4jpQPjOlh9B9sYtVFXSEaAqrQZKGUSlCJz3+3AKE/HrNFY9BINKyE+oDVBLq
	alhyvFH4ruvzbDqaTvMqrv9EcnMSYDBZr2l4knYBFvfb/3pT9M4FHvQ7+R2U7vQr393l
	egcw+enWpuUnpuYS9XdkfNSUFcGW8T5CWWMHfXRfMoEeIao26K761GldLu7BNwPIJjDe
	5HnEd3tBDKEHbp0swBlrjGoeBf7UKDhI7WzuAvJw82dtErG7DE17fcv7kqVwB/GZytnT
	wngfSdxNYWfDvbUYSBVzmteGzb0xex8ec+3+kp/Am5pbhKHZJUQVm/FpJokbOeRJOt4N
	bg4g==
X-Gm-Message-State: AHQUAubeRN9/FufWuEQdgj83YOelmXaFTYZ08iSwa1pc6VmbAaSkyIIc
	GT1RB1chwygudrWX4ivLbY/AYS3+
X-Google-Smtp-Source: AHgI3Ia5w9XDOm6yxRiylHCr3IVBk9+leq1W1yXQCb722+Nw/nmPfXykR89j5VvUsHWtDOrgLRuqHw==
X-Received: by 2002:adf:f34e:: with SMTP id e14mr2435033wrp.240.1549027075697; 
	Fri, 01 Feb 2019 05:17:55 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id r12sm9163060wrq.3.2019.02.01.05.17.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Feb 2019 05:17:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:17:46 +0100
Message-Id: <20190201131747.11388-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libwebsockets: fix multilib install
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
X-List-Received-Date: Fri, 01 Feb 2019 13:17:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| ERROR: libwebsockets-3.0.0-r0 do_package: QA Issue: libwebsockets: Files/directories were installed but not shipped in any package:
|   /usr/lib/libwebsockets.so
|   /usr/lib/libwebsockets.a
|   /usr/lib/libwebsockets.so.13
|   /usr/lib/cmake
|   /usr/lib/pkgconfig
|   /usr/lib/cmake/libwebsockets
|   /usr/lib/cmake/libwebsockets/LibwebsocketsTargets-release.cmake
|   /usr/lib/cmake/libwebsockets/LibwebsocketsConfig.cmake
|   /usr/lib/cmake/libwebsockets/LibwebsocketsConfigVersion.cmake
|   /usr/lib/cmake/libwebsockets/LibwebsocketsTargets.cmake
|   /usr/lib/pkgconfig/libwebsockets_static.pc
|   /usr/lib/pkgconfig/libwebsockets.pc

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
index f38414862..70e7c78a1 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
@@ -21,6 +21,10 @@ PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
 PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
 PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,"
 
+EXTRA_OECMAKE += " \
+    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+"
+
 PACKAGES =+ "${PN}-testapps"
 
 FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
-- 
2.20.1


