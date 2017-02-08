Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id E41C771AD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 09:38:01 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c7so96237169itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 01:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=87qM1NRvHlmXt/rpKA4TYtc955hBRXh97zbMXSG3zqk=;
	b=y8sm4q+5BlyuTSHmdizfyy0ydAUaGgaD9/Uo4TazvOu272yXlPSC5eay1IJeAege15
	HkQyubAIXr4QQoRPQl8rKniJnp14qm5/dPuxkstVTDjr4MCkQV0CQ6Hbb/e6vwbykV1s
	fbJTkrpd/SeDdeBXd3ZSkRpDHbqRzRXEJ88n8YSyg7bw/HuyeBQpb6N/bCnul67xx+/w
	raUBvlHGWk0QM4G5bSv9T1hB7A4MMzeYh+nD59KbnXX/FVnWnWpk/1jhDVvUfQwTskbY
	DJKmJIN6Amgo0CusacyBaIpTUgvM6iB7vIoaJJv8ootMuoPU+3uWOjzAhhDbNodnOgj6
	eD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=87qM1NRvHlmXt/rpKA4TYtc955hBRXh97zbMXSG3zqk=;
	b=EzWioiyzlvZi0hf2Kk+ddrDL+9rRGrT4r0gyYHqSrD9lCe3w6Ta+fE//ObRmZsbWbU
	b/MXGWZwhV/SMxrBldWx8iRpSI3MvkIqljJRLWSgivHhcMzLycHqMKfdvTO5mPPHB9Jf
	CtIZ2juc3QrfJUaI/xyf7BQmtKQ+KDXUmsMiTNGn/rFxu0gQNkK0ZdsAEQE3QZ4/Edtb
	YdLP+aJ4ENLU2BVvyM6nscGrzLB/qXHvCPH8Y1jxEDmdSxhmMWbB2db25kFJTx2G6Pj6
	O6G6N1J6XMRa7q/QaEms965aSiRkR5hfa59XEiTQCI0XErhyYqkbwvy7W3txg0N/CDb9
	IPNw==
X-Gm-Message-State: AIkVDXIFh6sv4fiAqK7p0TqLWDd2oLh4usLHMJD83RIojvmzVllrx22ZhPcG4MuXU7sm5PjP
X-Received: by 10.36.17.9 with SMTP id 9mr16496062itf.84.1486546682091;
	Wed, 08 Feb 2017 01:38:02 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DEB3.dip0.t-ipconnect.de.
	[93.232.222.179]) by smtp.gmail.com with ESMTPSA id
	x67sm11039035iod.22.2017.02.08.01.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 01:38:00 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 10:37:39 +0100
Message-Id: <cf056400bc35b57df29f70a2e3f7f26fca61719a.1486546542.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
Subject: [meta-oe][PATCH 2/4] fuse: support native compilation
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
X-List-Received-Date: Wed, 08 Feb 2017 09:38:02 -0000

This is required for swtpm-native (from meta-security) and
simulating a virtual TPM in qemu. Right now, accessing
swtpm only works via CUSE and thus needs fuse.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
index 8cc6dbd..9a2dc11 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
@@ -30,9 +30,9 @@ DEPENDS = "gettext-native"
 PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
 
 # Fusermount requires features from the util-linux version of mount.
-RDEPENDS_${PN} += "util-linux-mount"
+RDEPENDS_${PN}_class-target += "util-linux-mount"
 
-RRECOMMENDS_${PN} = "kernel-module-fuse libulockmgr fuse-utils"
+RRECOMMENDS_${PN}_class-target = "kernel-module-fuse libulockmgr fuse-utils"
 
 FILES_${PN} += "${libdir}/libfuse.so.*"
 FILES_${PN}-dev += "${libdir}/libfuse*.la"
@@ -62,3 +62,5 @@ do_install_append() {
         install -m 0644 ${WORKDIR}/fuse.conf ${D}${sysconfdir}/modules-load.d
     fi
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
git-series 0.9.1

