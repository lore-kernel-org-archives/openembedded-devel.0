Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4D96B577
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2013 05:39:29 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md4so1448006pbc.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2013 22:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rFfVQ11CFBFalGOcnWYQRzeXNKU6Hs2XkA4QVeeYUaM=;
	b=a4l8yRq9cJkbSBwmICbqE6nEH+HSroOwY2M+fIedZvt54Kw33QOhkBkbkoccIN3LXu
	vfKl9fK+rCxAZ/yijdO/Up/FQ31g+RVMVVtKw/+SdcP2+c4h4WpscIo28WJ8Z3ZmzB2E
	qcqTPXJCeUJ6JoJkpgGjgPZWX7yaOK5RZlfbYXeJirnq7QpDEja4tJzYfxBh8JQjQ5WV
	D9XS5aRsBEp8enVLzYsxzgCvmx9whPAV3HR/lm5iSdZCHS7c0fc1fHF8cPJKFtRr6tQD
	RN1CNK0DU6uUnMUYfEbHJftny2tZAszh97r5qiuaQVdfjdSTG3kxdboUStrqpbPcdgtI
	xyHg==
X-Received: by 10.69.0.9 with SMTP id au9mr1845308pbd.62.1375853970035;
	Tue, 06 Aug 2013 22:39:30 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id xe9sm8136232pab.0.2013.08.06.22.39.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Aug 2013 22:39:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Aug 2013 22:39:06 -0700
Message-Id: <1375853946-4583-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-oe][PATCH] proxy-libintl: rprovide the gettext packages
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
X-List-Received-Date: Wed, 07 Aug 2013 05:39:31 -0000

This helps in stubbing out gettext when proxy-libintl is chosen
usually on small/uclibc based images

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../proxy-libintl/proxy-libintl_20100902.bb        |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index e1531dd..0c652b6 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a
 
 PR = "r1"
 PROVIDES = "virtual/libintl virtual/gettext"
+RPROVIDES_${PN} += "gettext"
+RPROVIDES_${PN}-dev += "gettext-dev"
 
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-dev_${PV}_win32.zip \
-- 
1.7.9.5


