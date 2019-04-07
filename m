Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 780BC7D278
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 15:36:38 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id v24so4629200lfe.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 08:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=d5xEKNKOEb+PptbBIDG/GCCN+vzjleQxiKEzt/fsus4=;
	b=Sf+kWYCLFudoqWdUP1qipdAdaWmSrNMX+TP6NwYkV9rKRilX3YLRT9M8YEbGqsiIEr
	02bTHoiLUEQISBtxnKenXQbO5jsj23/3LGJ9q5tEuc3ncr/eL/XFWQrjq3TUTjuGwZur
	+5t4TT57mIaPwd1wQuvt3xPluqQW2ZmBht+T8wqAJ1nOBRBFtHyMjoAQoSPcd+kGrRZv
	6sx1tJc3vZHfbQ1o59XmkZIaiKefMOQ4caOlsJvL/iTYVqK1wvbr7Dodhxj1I7Ic8Luj
	iW6u3Muld4T5aw2tZccQqSWh19wNPFJ7jnGBhgg1aClrWc/tgcDPWJGXW++zN1zbF1OT
	II9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d5xEKNKOEb+PptbBIDG/GCCN+vzjleQxiKEzt/fsus4=;
	b=XMhyu6U8MR7gqCQ/Y1SdqFWNCu/uki+bKSKdqYexhsMI2ElgV33mOaLCQKbpNPco47
	CKRy8NU8qeOHix49td3Uu8HeQ4THxNv4XUNjei0DP3PGtAyVrz0otz9hZOkkek5VcBxf
	wa+J3sFh8YXMwQteSVK+AMsn3kGLz0F05Zb+/ap336SHEydlMGxxB9HlnQK70Kp9Jezm
	pUEcoQ5fsijTg80iQsOR1xhu00rEfqkbAWhMyC4MdEv6eq7uObs3KkRoQcFTivBLYhOb
	OYhVx3G5VPae+nJmi+wMDZgYIKa9fgPZs99bW7/Q7QodqXkh4HbI6WzMPtAh3sC39yoQ
	5EuQ==
X-Gm-Message-State: APjAAAXwo4gSQfDBPtAZzkwzFNctUKkM+FcX7w7HkqwrcwhndqHK8BMG
	4m5y12D6iH+9+npyKSn3vHyN+21ylsY=
X-Google-Smtp-Source: APXvYqzxvovqTpWJEi3shJGd5G1m+OZwDLdGtiotBRZkU9WuCdBIwVou1Ipf+bVfHZso4dff35QA+w==
X-Received: by 2002:a19:a40b:: with SMTP id q11mr13079098lfc.33.1554651398658; 
	Sun, 07 Apr 2019 08:36:38 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id e2sm5544734lfc.75.2019.04.07.08.36.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 08:36:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 17:36:35 +0200
Message-Id: <20190407153635.21398-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] stunnel: update to 5.51
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
X-List-Received-Date: Sun, 07 Apr 2019 15:36:39 -0000

COPYING checksum was changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../stunnel/{stunnel_5.49.bb => stunnel_5.51.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.49.bb => stunnel_5.51.bb} (86%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.49.bb b/meta-networking/recipes-support/stunnel/stunnel_5.51.bb
similarity index 86%
rename from meta-networking/recipes-support/stunnel/stunnel_5.49.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.51.bb
index eca77cf84..61be9be61 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.49.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.51.bb
@@ -6,7 +6,7 @@ SECTION = "net"
 # a combined work based on stunnel. Thus, the terms and conditions of the GNU
 # General Public License cover the whole combination.
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f6b7fe7379c9c2d7db6c80f7bd41e06d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c7acb24399f540ea323acb0366aecdbe"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
 
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[md5sum] = "0b41240e5585ec7d55ca343feed5530f"
-SRC_URI[sha256sum] = "3d6641213a82175c19f23fde1c3d1c841738385289eb7ca1554f4a58b96d955e"
+SRC_URI[md5sum] = "57040c64f4b95e35a756e53e1c496728"
+SRC_URI[sha256sum] = "77437cdd1aef1a621824bb3607e966534642fe90c69f4d2279a9da9fa36c3253"
 
 inherit autotools
 
-- 
2.17.1


