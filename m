Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 63A3C77E4C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:24 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id g2so18478559pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=idV8bIndv07U8OprcLCq4JYIa4pebSNSxquF5GZvrbI=;
	b=R699B6MjdKtQu+DcS9YE6pAFHqHTRYF8IZI6UPrz+Zo/iAMznn4Nwnq9VgGoQrC8ZV
	JIDeFd1RLclZhfa2DPJ62D4AE9RKvErFSWBaQi2qymIBHvj/St7cn04RZTVRuA4uSCB8
	ASfWhT3yvxkztfn1Kv2Vt6nSiImZopuwsuSuGaZyagekCdcMMPDWeIu+OHKiep7yIg3f
	YqWpGk81VndPwLQ9k0MIx7nD9LOI26HRMXBMiq8vzhSDAcq1xgP5rLyud9uZUekrrbWP
	xTHsKfTcCxyLLbNGQLZDv89W02nt/3hmvm0CAzGHks40iZjZi9jI20UN6DIGGCkhLYBl
	NcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=idV8bIndv07U8OprcLCq4JYIa4pebSNSxquF5GZvrbI=;
	b=i2kDgkgH1MzD9gV1CmuqXgNGeFDBfaCHXlXR8/u1C2StzeRnpDKYBmD9hoq6lD701h
	7+Ecr6jvsyM/9rE6ptCkjdOtohfVqrBWnFAo0DZPGD35m5r6TMYQxXsTJgx3HyxCctlw
	NFQUTl1fxRv6koJ+/UQ4xZtWMqNtg0Vhd+XIXJbNYX6n2lyKkUU6Xu07FbBY/MICksBD
	89Tm9nrtETflduEF7NLRyUMw1ABGwwUqceOxmCD2TH98xNiZaPVuisMoRXljBCQpjOc+
	YCCkZrOY0G29uon1qvzMqj/AbuXeZ7iNdo/O6ufM9/zToeR1JKF6h2p3SgzQhGEmUCcl
	r/Yg==
X-Gm-Message-State: AFeK/H1Mg8ZKbBGvbJpTmT6Kpz6iInM8e12VGa1MWpvNLF+mfTW0uHtW/TawzHV7EUrHKA==
X-Received: by 10.98.75.221 with SMTP id d90mr3648129pfj.107.1490978605470;
	Fri, 31 Mar 2017 09:43:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:25 -0700
Message-Id: <20170331164247.5052-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 21/43] ntfs-3g-ntfsprogs: Upgrade to 2017.3.23
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tfs-3g-ntfsprogs_2013.1.13.bb => ntfs-3g-ntfsprogs_2017.3.23.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2013.1.13.bb => ntfs-3g-ntfsprogs_2017.3.23.bb} (88%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
similarity index 88%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
index 6957ea92b..63627deda 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-
-SRC_URI[md5sum] = "2d6fb47ddf62b51733227126fe9227fe"
-SRC_URI[sha256sum] = "4b383f0074a3ab7683339d1f18222b107aaeb4983db119292c43c2b275cefb27"
+SRC_URI[md5sum] = "d97474ae1954f772c6d2fa386a6f462c"
+SRC_URI[sha256sum] = "3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5"
 
 inherit autotools pkgconfig
 
@@ -33,6 +32,7 @@ do_install_append() {
     # Standard mount will execute the program /sbin/mount.TYPE
     # when called. Add the symbolic to let mount could find ntfs.
     ln -sf mount.ntfs-3g ${D}/${base_sbindir}/mount.ntfs
+    rmdir ${D}${libdir}/ntfs-3g
 }
 
 # Satisfy the -dev runtime dependency
-- 
2.12.1


