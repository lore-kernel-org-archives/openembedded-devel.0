Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38E656067D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so15997917wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Um9GtjnjaNJ6HDdjEllKYPUb03OUuB4bK6P1hDd5ndE=;
	b=ckvQKVhaTQvodBvvE0X0zdhbyBLRWTfhowxI3SmJYKGhYOaNjIv76d3+kZgohD1vRy
	ERk+969AidUbGkjuhEVOayWbnUN0v1ck9RpylhmDs324sh7HbKz1HS6v90/YTiNPBfA+
	+A6017oTWxiFhqPqPfg2nYU4W9SlUjVL7hOpnUAm9AnSOAjLroWOS6LkPuj7Myv6e51M
	m+gKvSgnLf7gfBeUimSW5saippfVgurukrh0gDJGGeZwvwhEuuVKuQ/ZiWc7fRcPmC3d
	+SgHbwyKvuLbLJi7u4W1vrnvhVf2BHbfVZ58l+8V2UAguIK1RfSoceONJJZ9a8IMy6Vh
	T0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Um9GtjnjaNJ6HDdjEllKYPUb03OUuB4bK6P1hDd5ndE=;
	b=bmsjJe5GIIEL7IIsX7jrrIwJ2GyYZjKt5hb+JlnyNI3t4DXU6blzFdrjCs4HRcDLLo
	6IT1ncu2G3Ta8bBpXd+8sSjxHkUoZMU5Ze693H9uMa0aBtjgpCaeUKkw6HVuQimZwb9F
	Nqs7ArAX0jE7+G5u4JNkOGFRZjm0sHrlWajIax/9rLrUTK1NIVBJcSaHql9OUpmJbnSR
	FBhqyb9gct4l4gHETAOTdEMW2h2Mk/3u5no55PM5Aw8Rtw/uZr+zwwXgweVVm1aKbFH6
	E9JglCYdV39a+F1v3yVqE4wMaL8ZFUHawHkokgEZkKsgnrAyGdFes07e363jnW95C5e4
	W6MA==
X-Gm-Message-State: AMke39ko5YDNQ9WhCbxOIzVewignl0QLLg3NNDTp1/ciXvdfsdjKGkvGOr3gChf/vMLkaA==
X-Received: by 10.28.56.134 with SMTP id f128mr15246849wma.29.1486933349702;
	Sun, 12 Feb 2017 13:02:29 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:06 +0100
Message-Id: <20170212210216.867-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/11] audiofile: add alsa-lib to DEPENDS
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 2d67b5a..b23bfed 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -19,4 +19,9 @@ SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8c
 
 inherit autotools lib_package binconfig
 
-DEPENDS = "asciidoc-native libogg flac"
+DEPENDS = " \
+    asciidoc-native \
+    alsa-lib \
+    libogg \
+    flac \
+"
-- 
2.9.3


