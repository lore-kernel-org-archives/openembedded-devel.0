Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 23FD77F53E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 03:06:11 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 205so5191355pfw.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fDQ8C4td01QZZYOak5uNU9zMYfXVkHlG6AkuIiV+j3Y=;
	b=UiZtOfk1fKPkLSlk+1MjfhJQufWZGgkx7SRhj7iCpEXjzg95lZbh8bvXOGO+Zb8E5V
	F2DNZdkPBiOtGTDDw+5GRV8ZgZ+BfVRtIvj8SXErIJ/praJEs2pIfSdJu/WaxoJSjjDP
	qHIUg5nIlmh5G45dPK5bLkZFZcH/moUZtmDaAL57qQPhtYQtkwDNND7eTMQPn0mv21PT
	lqzU9P5Pbhn9l8RfN4F+0lv5R1eAmNUyiFaI4NttBGYXE6HzzaExEsGIhGe5Yznquz8r
	d4vNZvGH3VBwBe4x+AhnEzcSgU5mHYrf4Q4GfcbYCkD7oDjH/uGOj9CIOuxGBDVLqupY
	dNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fDQ8C4td01QZZYOak5uNU9zMYfXVkHlG6AkuIiV+j3Y=;
	b=EhjVJWQddw9n8zECwX8Uq37N3+KnWSxo33Rn0/JYbM97o3vb4/BQucslfJp+fIKUrO
	WPE9+gB8K3YG4aQrpnXat9feY4sCbPEMJ7yv/KzZBTvJHB+YQhu7qxD4bsehADghQY66
	JlZNFLrkQ8SuqrIXz9yQ36uSvKLR+fWhzR3xPme5v4OsSLbK266kZZ5H00gFv15071zA
	lgv2+9j2peG3ld/ZI9zy5GIWeDmJyBUum6DWDmr/qftx8cnuoegonhNhwS8qmOzVN6Tt
	gqdTQ+gEkz326MUVxKSImX21k9goI6d4MaIDA92lyV5XKB6Uo8+NL61j4DU4DQUrTxxO
	3PUQ==
X-Gm-Message-State: APjAAAWooQCUs3EEoNMoTV3I1qehG7d/mtMnC+V1frmGvvkAWo/xpVgP
	ZsadpyMDrSOY8Bx10S008DFOrH4KxJg=
X-Google-Smtp-Source: APXvYqy9Uznn95P+p7FBvUhoBusVxpCdm7xsLtwoPnCkh4Rmz8UpziMQE3Kyi/WWlw0gmTYx76hk5g==
X-Received: by 2002:a63:cf4d:: with SMTP id b13mr14313889pgj.396.1570763171516;
	Thu, 10 Oct 2019 20:06:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id o9sm6452290pfp.67.2019.10.10.20.06.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 20:06:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2019 20:06:03 -0700
Message-Id: <20191011030603.2499110-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] bdwgc: Enable C++ support and Additional options for musl
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
X-List-Received-Date: Fri, 11 Oct 2019 03:06:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb
index 4c1393c946..905f95396a 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb
@@ -37,4 +37,8 @@ inherit autotools pkgconfig
 PACKAGECONFIG ??= "libatomic-ops"
 PACKAGECONFIG[libatomic-ops] = "--with-libatomic-ops=yes,--with-libatomic-ops=no,libatomic-ops"
 
+EXTRA_OECONF += "--enable-cpluscplus"
+
+CFLAGS_append_libc-musl = " -D_GNU_SOURCE -DNO_GETCONTEXT -DSEARCH_FOR_DATA_START -DUSE_MMAP -DHAVE_DL_ITERATE_PHDR"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.23.0


