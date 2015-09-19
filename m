Return-Path: <andrei.kholodnyi@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2111965D00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 18:34:48 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so65485039wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 11:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=O2ylFeLRpYwD5OZxQSo+TpFXEUQmod8o4ZRiJteSO78=;
	b=wKXiTNCC77DHg0hgVrN8Zf0vWlTkL25knuzhL09SAXDXJVj2aPW7TvJUv8tflbl4t+
	6FVI3IYKmFtbDoD54mHExyBEUiTHrzv+yCX8BEEtnmfgDYDeqYJg57zk0rEYC5xvQ50Y
	+IrOg57KJZP0+9tlHRQf4Qb0KSdiDqlwD+TdPfEQddCfQ3xD/uUlx64W9Srasoy2xu+D
	j286zgaV0HiSjthYO0IpFXKvKLtmKYMtKb71IcRLbCY+mhXnjp7OZvQI8prfIrZ35kba
	z9h5FLkjMNplAoIatt7O4FmjGzjuYBmG4ZCRh8w/47PiJvBi4wDru5Kq1C1KJEzsVKBv
	4gJQ==
X-Received: by 10.180.205.206 with SMTP id li14mr4162969wic.76.1442687688006; 
	Sat, 19 Sep 2015 11:34:48 -0700 (PDT)
Received: from razilix.corp.ad.wrs.com ([128.224.251.2])
	by smtp.googlemail.com with ESMTPSA id
	d1sm4532170wiz.0.2015.09.19.11.34.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Sep 2015 11:34:47 -0700 (PDT)
From: Andrei Kholodnyi <andrei.kholodnyi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Sep 2015 20:30:35 +0200
Message-Id: <1442687436-29326-1-git-send-email-andrei.kholodnyi@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/1] add --with-systemdsystemunitdir in configuration
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
X-List-Received-Date: Sat, 19 Sep 2015 18:34:49 -0000

Otherwise sed command for blk-availability.service may fail.
It will look for the service file in a wrong location
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 2b2d8ed..8114d5f 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF = "--with-user= \
                 --enable-lvmetad \
                 --with-udev-prefix= \
                 --with-usrlibdir=${libdir} \
+                --with-systemdsystemunitdir=${systemd_unitdir}/system \
 "
 
 PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
-- 
2.1.4


