Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Ku-00007j-Qj
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 19:05:07 +0100
Received: by mail-wi0-f173.google.com with SMTP id ez12so34737wid.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=Bm2bzzn4aQgACt71vE2pFiKiP534t89L7Mzuep7wgrs=;
	b=LqBZJ58DEw1hJ3hQuqhAsT/sjVmth7WJijHVHmvRr9Nh50D4sX8Vaci+ScvWUHVdmQ
	UytMBTpDlQpbiaO5+fCWkHTzLDULFpysV2L+BQPywHgGUQpbo9Amkx86AusfjNktEgTl
	9qCG6XTGHwiOYgxvdm5pzGyVWobljXocKzCgYjNUBhFzGH0LazcfVHoHlJfxsbW0e+Rs
	rfSeD7eUeU9FQiW47srUEHH4LQ06z3BMEeCVe3cYKV7xQSre5YhVfs4rqL3xwevr0X3F
	UZbUIrvvZJB84h+42/c+STV1yTtGZCfjw53B6OrGZqBPC2nx2gMSUtobNvHcDc7XT1+u
	Om8w==
X-Received: by 10.194.133.198 with SMTP id pe6mr4821450wjb.9.1363974116695;
	Fri, 22 Mar 2013 10:41:56 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:40 +0000
Message-Id: <df7a85119bf678a3f948539d0b38855980b44b5d.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkDjouwm9NL8ozRQWfzCZ2KkSAyr9m5nqRF2nw6QgSgtSvNSnskpkgdX217x5fuetOSdRqt
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 20/22] Revert "base-files: add fstab for systemd based systems"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 18:05:10 -0000
X-List-Received-Date: Fri, 22 Mar 2013 18:05:10 -0000

From: Andreas Oberritter <obi@opendreambox.org>

For hybrid systemd/sysvinit builds, only one fstab can be used.
The default fstab used by sysvinit should work fine with systemd.

Since virtually every machine will ship its own fstab in its bsp
layer, the bsp layer may decide how to override the fstab based
on distro features.

This reverts commit 77bbb839ba25b974a538b90d346b454ccd5deefd.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/base-files/base-files/fstab.systemd |    9 ---------
 meta/recipes-core/base-files/base-files_3.0.14.bb     |    7 +------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd

diff --git a/meta/recipes-core/base-files/base-files/fstab.systemd b/meta/recipes-core/base-files/base-files/fstab.systemd
deleted file mode 100644
index cb48a0d..0000000
--- a/meta/recipes-core/base-files/base-files/fstab.systemd
+++ /dev/null
@@ -1,9 +0,0 @@
-# stock fstab - you probably want to override this with a machine specific one
-
-rootfs               /                    auto       defaults              1  1
-tmpfs                /var/volatile        tmpfs      defaults              0  0
-tmpfs                /media/ram           tmpfs      defaults              0  0
-
-# uncomment this if your device has a SD/MMC/Transflash slot
-#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
-
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index e7a9d82..a56450d 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -18,7 +18,6 @@ SRC_URI = "file://rotation \
            file://profile \
            file://shells \
            file://fstab \
-           file://fstab.systemd \
            file://filesystems \
            file://issue.net \
            file://issue \
@@ -92,11 +91,7 @@ do_install () {
  		install -m 0644 ${WORKDIR}/rotation ${D}${sysconfdir}/rotation
 	fi
 
-	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -m 0644 ${WORKDIR}/fstab.systemd ${D}${sysconfdir}/fstab
-	else
-		install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
-	fi
+	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
 	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
 	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
 	sed -i "s#ROOTHOME#${ROOT_HOME}#" ${WORKDIR}/profile
-- 
1.7.10.4



