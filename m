Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4444D780BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 19:03:41 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id q125so42036342pgq.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VkNWf/JS9bNLl32+Mjl3HTBHtI89Psxkg/R1Ow3AYz0=;
	b=sOqOxp9UVno7T+IBtdNTwp/4xaPdeGAiSZxYJKGMXA7MSNbO3ZJ3pddFcFI6aQtbKP
	NRHR2qvIPF2xdhLfXRrg71av/CKgbcOInNRfwt0V8e4LGTKuifC1gimBWJ6CK6rMV4VN
	1lu4KIQYF85nz85xe4mlH51ncgStrT0hr9C3r3rqpyIWttrSUB95e2TUGjIzjK1bPjMS
	ujnPf3LWN4Yf86Ti7K95oNc9wI+PjL0t5tpclrOg9uJohgVsQosH/EMBLgg9KPOFu3PY
	ERkVBTCXc8Aiw2mZ7JS0QOJEQo1djIAfMp7JuDmO/LqjeQFPFVAkobiBZwwhG1UhLEPO
	NHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VkNWf/JS9bNLl32+Mjl3HTBHtI89Psxkg/R1Ow3AYz0=;
	b=s+3iVcVdfiUm7zhBqTh2kHRe5pzYtqE8588o+YR7JPTAmMDdSoNU+PLcALRnTMjix+
	7gDAhap2LqEEgisxd3rUVNlQ1RK0Ox9mKbrTCC8Vvx81PhJ298bywsNRNYOHdsGtsT3t
	5JOH6j7kR4dJyHFOMMWltrfdU3gTVIa5djz1BvR/3sr1NedcmW8aJH2ehf4P/V4XuGjS
	YAr7SH2s09bBvmk/e4tNnB1s3BgLAs2sXgn5toDfFjtNxoZen8TEE90FUagqX+zpSWSA
	5bajd/iAsICwYs+ogqjkBXWJhJehYw6AVHsIqCKMC156uvDF+PT2BeAxY5Q//Ibu8BRN
	hQKQ==
X-Gm-Message-State: AODbwcCSTVTWKl2N35pTTr2ZqxtajKMofi2dV0euXPWXY0M4t4URQY0G
	JgEg+dYxn9H3HpIQ
X-Received: by 10.84.213.2 with SMTP id f2mr13094324pli.22.1495220622850;
	Fri, 19 May 2017 12:03:42 -0700 (PDT)
Received: from tyrael.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	q27sm17273909pfk.4.2017.05.19.12.03.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 12:03:41 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 12:03:31 -0700
Message-Id: <1495220611-17447-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Cc: tico.timo@gmail.com
Subject: [meta-python][PATCH v2] python-sdnotify/python3-sdnotify: Add new recipe
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
X-List-Received-Date: Fri, 19 May 2017 19:03:43 -0000

python-sdnotify/python3-sdnotify is a pure python implementation for
systemd's sd_notify mechanism.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../python/python-sdnotify_0.3.1.bb                | 22 ++++++++++++++++++++++
 .../python/python3-sdnotify_0.3.1.bb               | 22 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
new file mode 100644
index 0000000..e63560c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
@@ -0,0 +1,22 @@
+HOMEPAGE = "https://github.com/bb4242/sdnotify"
+SUMMARY = "A pure Python implementation of systemd's service notification protocol (sd_notify)"
+
+DESCRIPTION = "\
+  sdnotify is a pure Python implementation of the systemd sd_notify protocol. \
+  This protocol can be used to inform systemd about service start-up completion, \
+  watchdog events, and other service status changes. \
+  Thus, this package can be used to write system services in Python that play nicely with systemd. \
+  "
+
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc8213e"
+
+SRC_URI[md5sum] = "a182c1ef47e1c6c965771aa3029da16f"
+SRC_URI[sha256sum] = "e69220d4f6cbb02130f43f929350a80cf51033fde47dcb056fbda71e2dff2d5a"
+
+inherit setuptools pypi
+
+do_install_append() {
+	rm -r ${D}/${datadir}
+}
diff --git a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb
new file mode 100644
index 0000000..57c7e5d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb
@@ -0,0 +1,22 @@
+HOMEPAGE = "https://github.com/bb4242/sdnotify"
+SUMMARY = "A pure Python implementation of systemd's service notification protocol (sd_notify)"
+
+DESCRIPTION = "\
+  sdnotify is a pure Python implementation of the systemd sd_notify protocol. \
+  This protocol can be used to inform systemd about service start-up completion, \
+  watchdog events, and other service status changes. \
+  Thus, this package can be used to write system services in Python that play nicely with systemd. \
+  "
+
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc8213e"
+
+SRC_URI[md5sum] = "a182c1ef47e1c6c965771aa3029da16f"
+SRC_URI[sha256sum] = "e69220d4f6cbb02130f43f929350a80cf51033fde47dcb056fbda71e2dff2d5a"
+
+inherit setuptools3 pypi
+
+do_install_append() {
+	rm -r ${D}/${datadir}
+}
-- 
2.7.4


