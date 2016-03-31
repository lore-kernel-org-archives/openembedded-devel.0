Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2B98D6FF5D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:55:54 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id p65so221682990wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=C11HJLfTP0tuatv+Kxm7kDbJ5zRRu4msxXLvlJKsYLU=;
	b=iH6eeDDjWvC/jzIbmKA/tM2YOG4TUhMo3X7vItvxDBGQxYfkkfNouRxtylEvS7pWf0
	2u2nCsV0g/6aQVpepJnDr5x/Z3weazElGgPj/IvxZiwsoKVhnrVBfs6vCq0RRwOq8V7c
	8GW6GzgFyJSkGjzdu22JETG7giG62nAHKuFyI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=C11HJLfTP0tuatv+Kxm7kDbJ5zRRu4msxXLvlJKsYLU=;
	b=AagimDz9WSoWPtE2UeJ7p+TGVXmD50SuC3JfPOUX4I1F/8Bhpm61kv1NgWxnwgwOgJ
	YVZwGGPbf3B3/M/vJphrtRZV9JW5GXnzSz4AJ2kaYrcu4+5PGgtAkCp0oSsFgLv5873e
	LIaD7tArnSZZNHfUJ7/qOWG+XzMTU3+sEoOk0LeJu8It6znEIPqOxy9/zEQuaUeOJRxl
	3pAYXokjxjurLYZviVDIFlzwRXGfv2Ao7MOqhYsg273GNok2+A9yGAG/+pVmLLPDpX4e
	Y2jCqb3D/NPRnXosW+UR6u6MpHPj1Zc4AYjRlKjdfVne2T8r8FErh0+e1Gn1Dibk6lHM
	iWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=C11HJLfTP0tuatv+Kxm7kDbJ5zRRu4msxXLvlJKsYLU=;
	b=cS2xQ8HNT1DP4UN/YIvkIIue7wrwb/ew8Ts6bdi1iibHl2ayTb0iw1Gl8yI5UPKqV+
	C7lsjjTKXE0ZUrksLKbDxxzGRM9RYS9rP3nvC0tpbitBYMXAM+vfZZ2Cm3BSBOG7hVNG
	ri1e/dObjjWhQOgbrT6DJlP5+ASXrwn2K8dynmXq6RdoN89Kv7b9+4MJAwh8enlnWo74
	t5PY0GyRi9jJ0uTB3X+llSBjVpxGUQ/LsbnUNrTkt69z/4FuqHoOr7hwuaAKsMS5kaVd
	cJ+X58CyghvXw7cJoGqzgNwv58Eu/dKnfRT+1CVchtLLKzECF8BwaRFXlapmPSGNplMe
	kLBw==
X-Gm-Message-State: AD7BkJIYS9Vuo33ncQsz+QHwxDkEuOpMXnMwl6SRkf+RTWHGzR8ZJ80QgNucy7VkfAmmxw==
X-Received: by 10.28.46.69 with SMTP id u66mr2493981wmu.98.1459425355064;
	Thu, 31 Mar 2016 04:55:55 -0700 (PDT)
Received: from eiger.ygl.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	y62sm9183058wmg.12.2016.03.31.04.55.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:55:54 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 13:55:46 +0200
Message-Id: <1459425346-25328-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] p7zip: add native extend
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
X-List-Received-Date: Thu, 31 Mar 2016 11:55:57 -0000

This add a support for native build of 7za, 7z and 7zr binaries.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
index be706e1..b89fc42 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
@@ -15,3 +15,21 @@ do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${S}/bin/* ${D}${bindir}
 }
+
+# all3: to build bin/7za, bin/7z (with its plugins), bin/7zr and bin/7zCon.sfx
+EXTRA_OEMAKE_class-native = "all3"
+
+do_install_class-native() {
+    install -d ${D}${bindir}
+    install -d ${D}${bindir}/Codecs
+    install -m 0755 ${S}/bin/7* ${D}${bindir}
+    install -m 0755 ${S}/bin/Codecs/* ${D}${bindir}/Codecs
+
+    # Create a shell script wrapper to execute next to 7z.so
+    mv ${D}${bindir}/7z ${D}${bindir}/7z.bin
+    echo "#! /bin/sh" > ${D}${bindir}/7z
+    echo "exec ${D}${bindir}/7z.bin \"\$@\"" >> ${D}${bindir}/7z
+    chmod 0755 ${D}${bindir}/7z
+}
+
+BBCLASSEXTEND += "native"
-- 
1.9.1


