Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6903F78072
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 18:56:39 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id u28so42024249pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 11:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=p9zp/RIOp0yJG6XoTDSnC2O3SXL5e7tMiU2ghd3zFQ8=;
	b=LD49q9CBRVaP4du0QUv1IJV7OTMvssHBvtC/Ri6JANvDCzr3ubq/EGyFzQBg+/Wqgy
	b7jGXjz5OggbhPUhrYWjbFTUCGQTZ8mb4SRJYllLJTJ1YnE1xICJLH83pkpPlsvEb7/1
	6SPx4jCEDsBxa0j5XIPkWK8mfiiksjR60EXXCPzByVdCIeNPHKV3wMMJrEdbJYL5Fsab
	7NO1ma1qIoQ1zmc2xIVgK90smYnpd435DT+9IsPbPoP5vR2uKuvTQeIXcYqvP2wIQF5t
	KHqtDwgct8J5uRF0M/rfRDirjJRjq55+0+eNHrCJ5tS9bD/27qAcvk5NiaJ1XleEu6Hn
	OWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p9zp/RIOp0yJG6XoTDSnC2O3SXL5e7tMiU2ghd3zFQ8=;
	b=A4f1kq8eMBR4GuSBf1haz0kuz7nQrJ64gTILJYSKxkvWPhp0FdTrUF6DcDFBD1NWnA
	hj7a0p+MTLK6GVPXUAoMAR21A1JHxoNDrZ++Ugi75tdQslSQ9z7KFZWYvFEtktDXKj74
	DcXyCOU2MtHvYTguatQObd+jH7kQwaYt1Du29H9xtuWHkvTyVA6chWDF6hkGR2dA4wPl
	ye1o1FFjys19/ILUzcRC8YI9xiALhK+76XcdtHyMKVoZPLz9HSfLztR39FWIlKhyhNud
	7nq3ez+0Q9Ku9KIoMp9fPLjxmWJk1FAMezAErVkOcnNn/iLh6MxTTzyUvBQKnlbje1OO
	a39w==
X-Gm-Message-State: AODbwcDBwa+QVXZLdAwlvfa4Xl3Xa2yHuq+fCmON13oG6HDkNN2kGnnY
	ojeyhJ833egAt0UF
X-Received: by 10.84.238.195 with SMTP id l3mr13308920pln.102.1495220201149;
	Fri, 19 May 2017 11:56:41 -0700 (PDT)
Received: from tyrael.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	y190sm15665921pgd.25.2017.05.19.11.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 11:56:39 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 11:56:24 -0700
Message-Id: <1495220184-15697-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Cc: tico.timo@gmail.com
Subject: [meta-python][PATCH] python-sdnotify/python3-sdnotify: Add new recipe
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
X-List-Received-Date: Fri, 19 May 2017 18:56:43 -0000

python-sdnotify/python3-sdnotify is a pure python implementation for
systemd's sd_notify mechanism.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../python-sdnotify/python-sdnotify_0.3.1.bb       | 22 ++++++++++++++++++++++
 .../python-sdnotify/python3-sdnotify_0.3.1.bb      | 22 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-sdnotify/python-sdnotify_0.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-sdnotify/python3-sdnotify_0.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-sdnotify/python-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python-sdnotify/python-sdnotify_0.3.1.bb
new file mode 100644
index 0000000..e63560c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sdnotify/python-sdnotify_0.3.1.bb
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
diff --git a/meta-python/recipes-devtools/python/python-sdnotify/python3-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python-sdnotify/python3-sdnotify_0.3.1.bb
new file mode 100644
index 0000000..57c7e5d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sdnotify/python3-sdnotify_0.3.1.bb
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


