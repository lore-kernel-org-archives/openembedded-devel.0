Return-Path: <tom@harbortronics.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E19477758E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 21:01:42 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 1so10421660pgz.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 13:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=harbortronics.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=tQGyqyL4nv+YqYX0p9jJceNFE0Qdgazvu4rS4nGJoMQ=;
	b=aavXcvs1St9x36vYQgmoIpGtarUjKiHX0z4mvc5qg//IPtcwAZipuCZBUGciMuN564
	AAQWUAiipaIKKV8lyTCRDNy/5TaK39llkZ8xmbsGsqZwEPmRbx3fi/NKfe1Xsp/Z9JD0
	ms5C6TDhyNHuEIpihO4wq7uiXdq4zMqEKkcoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tQGyqyL4nv+YqYX0p9jJceNFE0Qdgazvu4rS4nGJoMQ=;
	b=EizbTJWHtDwOCjkuFJwn6XrNCW8+cdg19Jp6mGdHbwkEb59Cbg0FvmrSARNXE9YLU5
	PLpPL0NrnLdHmJrrC7Mt6aQI+SxloFyytFsF9oOrhZkmlyIhr972gLjWKkdquMi8V5ws
	wF+Fizu95+8NcuphT3QnhRAlY/l+SaFa4q3X/acpouZ6+RM9ti6I363xnxDNXPhV1Ouk
	Tx+VRJFFuIZR2Dpq2dcfGz5HdUpO4ibsEe7aiHS0aCR4OkHex0atQelLZi/z7coILjw8
	5StGqxjMgkyXdxqM6I7gtnzsnVVst+9ZEGtfgwPVcMHQhDnTqx/P4xsvkcK25r5Oguc/
	Nxuw==
X-Gm-Message-State: AMke39lf3C3WJNGoHV9McdBZEqBR80J6etXNy03RP8rTv096SMEB7dQeAtCFNMYU0scEEA==
X-Received: by 10.98.206.78 with SMTP id y75mr18175428pfg.108.1488488503964;
	Thu, 02 Mar 2017 13:01:43 -0800 (PST)
Received: from yocto-dev.harbortronics.com (174-21-50-42.tukw.qwest.net.
	[174.21.50.42]) by smtp.gmail.com with ESMTPSA id
	d1sm18807808pfk.20.2017.03.02.13.01.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Mar 2017 13:01:42 -0800 (PST)
From: Tom Hayward <tom@harbortronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Mar 2017 13:01:40 -0800
Message-Id: <1488488500-68957-1-git-send-email-tom@harbortronics.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-filesystems][PATCHv2] fuse-exfat: fix mount detection of mount.exfat
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
X-List-Received-Date: Thu, 02 Mar 2017 21:01:43 -0000

When package was switched to autotools, "DESTDIR=${D}/${base_sbindir}" was
removed from the recipe. This left the installation target as sbindir
(/usr/sbin/). This breaks `mount -t exfat /dev/sda1 /media/sda1`, because
mount only searches for mount.exfat in /sbin/, /sbin/fs.d/, and /sbin/fs/.

With sbindir = "${base_sbindir}", mount.exfat is installed at /sbin/mount.exfat
where mount can find it.

Signed-off-by: Tom Hayward <tom@harbortronics.com>
---
 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
index 639e33c..99bf2be 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
@@ -18,3 +18,4 @@ SRC_URI[md5sum] = "fca71e6598f79d037a3c7c969cb5710c"
 SRC_URI[sha256sum] = "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9"
 
 S = "${WORKDIR}/${PN}-${PV}"
+EXTRA_OECONF += "sbindir=${base_sbindir}"
-- 
1.7.10.4


