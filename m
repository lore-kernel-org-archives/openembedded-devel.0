Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4566A7D503
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 15:11:12 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id k8so8990130lja.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pRzvyofButDiB1M92HSOlnykITzKYx47TfyeH9wgMOA=;
	b=rb0YuoYJqETLij2N3raXPEYh1qUJPLeigsoFnAuF8hQnoR6yM9WXTrQnlkvmgybWHm
	DtCbzoQuwvsTAKL0D2iqDFXZ66iuR6AgjDdfwVNRy05epwFb/D6QSZnujF+txpq6eiRq
	L2spZ8Nc3Hh5svxgYJBnCQdEh+x/R801P92xZ7CJuoAIrwfnCDpRimjhfGJTVa0K1At2
	gwgHm/5yq3SlsvU9FCTVIKJwZWnZwkVSTMlTBjqTfK6e6f4aGTwm75l084rFTMyphq/F
	6zSLzVYn0OVsjegjh3MRcaHNexolALaQ/1xF7aN6kBkX2PbEe7cgEZFv3Jd8FVM3d8ev
	KauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pRzvyofButDiB1M92HSOlnykITzKYx47TfyeH9wgMOA=;
	b=Zl+d4BmXSJ+ql4PPjrwY5EJeL+4MQ3+6XyxrobWItaeXPN7vF/894ZyRSfUQQkCqvo
	mR939BxTB8aDccq0W+FWEMxwwVXtcxDMnOU8y7B1lMUDRa6pclUEh5EJCyyP/CaujKU1
	/C6OhPw6/bubAMj3Ac+iHaIanX0zOcRV3aXZuhznWgQhvz7vTDykpNbPoH55Go9jauoA
	SSWw7iaNZeXTr3aou9nabdVfYiNpXUnbDCXilBDY6/GNuWPBVu6En0uj+Jq0iFuLe4fx
	68ox/CAg6OOc8tMymBR5/nywyBOFjWtAesayyE/gkJHgWS7wvtwy+ju+efhHH7hbw8hf
	SKtQ==
X-Gm-Message-State: APjAAAUDH1Pe9cZYyHNBbfWa/NowpEVU/Ei6whd8WUwDtLuM8ucCR9NU
	pk9Xb4VU6bQtKA6h4sl6VpHVNdETxhQ=
X-Google-Smtp-Source: APXvYqwLtEgAGLIFGd024VUDZrrT7Jy/hOTmTlHTjA+PAlRW00gdrTQuTQvljCd8NlyozQR0RiBKUQ==
X-Received: by 2002:a2e:8888:: with SMTP id k8mr12922407lji.43.1554649873342; 
	Sun, 07 Apr 2019 08:11:13 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	t14sm5550950lfl.38.2019.04.07.08.11.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 08:11:12 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 17:11:05 +0200
Message-Id: <20190407151106.19592-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking 1/2] drbd-utils: update to 9.8.0
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
X-List-Received-Date: Sun, 07 Apr 2019 15:11:13 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...tools-only-rmmod-if-DRBD-is-a-module.patch | 43 -------------------
 ...rbd-utils_9.5.0.bb => drbd-utils_9.8.0.bb} |  7 ++-
 2 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.5.0.bb => drbd-utils_9.8.0.bb} (91%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
deleted file mode 100644
index c0f3adf24..000000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Subject: drbd-tools: only rmmod if DRBD is a module
-
-Account for the case if the DRBD drive is built into
-the kernel. Otherwise, errors, like the following,
-will occur:
-
-root@localhost:~# /etc/init.d/drbd stop
-    Stopping all DRBD resources: ERROR: Module drbd 
-    does not exist in /proc/modules
-
-Upstream-Status: Submitted [https://github.com/LINBIT/drbd-utils/pull/2]
-
-Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-
-[ refresh to 8.4.4: squash Aws' and Jason's patches ]
-Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- scripts/drbd | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/drbd b/scripts/drbd
-index 20bf628..de589dc 100755
---- a/scripts/drbd
-+++ b/scripts/drbd
-@@ -241,7 +241,9 @@ case "$1" in
- 		if [ -d /sys/module/drbd/holders ]; then
- 			(cd /sys/module/drbd/holders; for tr in *; do [ -d ${tr} ] && ${RMMOD} ${tr}; done)
- 		fi
--		$RMMOD drbd && break
-+		if [ ! -z "$(cat /proc/modules | grep -w drbd)" ]; then
-+			$RMMOD drbd && break
-+		fi
- 	    fi
- 	done
- 	run_hook stop
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
similarity index 91%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
index bd1e8576f..a781e2791 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
-           file://0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch \
           "
-# v9.5.0
-SRCREV_drbd-utils = "ee126652638328b55dc6bff47d07d6161ab768db"
-SRCREV_drbd-headers = "b47cc11bcabe1a65c40ad23f71dcaf2da6419630"
+# v9.8.0
+SRCREV_drbd-utils = "c30216b49330216bf8a567b7727da6e24f099f08"
+SRCREV_drbd-headers = "2357a11fb49bcbadf6b490e6d4cfe982a3d24813"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


