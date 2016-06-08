Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D6B3E6FF22
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 13:50:17 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r5so3192035wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 06:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9si9E55sFde5bSTlpdBZKC41Yk3UziW/uJ99S7nErdU=;
	b=L3PfYGnTayLXVM38Hw+HIeOObqWtxcpbFVdn8OaG5VGAcaj2wKrq8LC7qx7yD+zzvU
	6y7xDfqdK3KyIZFm0mhFtB0ONhDEz8oroucENt01/QUm9BuGG6H3IU+aVIg9jIG7QfaT
	T3w6XSOnghkKio0+36DHmF7fJldWoua2g6cxxNEMlIVc0uZ+Ysm8J1NrleijXv11faiv
	aL5fn+EjcDaNNceIz/l3huRW20eE7vbl/mjzOawQbnOE7m9d8Z8VP7wzDHZ4Wy2Uc7b9
	xZ0QrFcySxyxyqUey9CdCIALiolJKmmQwbIaM6NYUi6ScL3AojKdb7GkvgyoRKciWcyv
	Exmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9si9E55sFde5bSTlpdBZKC41Yk3UziW/uJ99S7nErdU=;
	b=XsnJXgSa0X9wtv0W4Eojm0wwfOX137QKl8E1mVFAU3UDuwoqK7OJ6PqUrWTrLlYetf
	i9UTCQPtJE8TlQWO/9zU405qfcjBFMszguw/3G1dbPJuai87QhWgOz5EVi0o7h7QA5n5
	abeH/uZ3zjxqRBBb8E3moxST4ZkcUYOiIMZ2SR+KoJrN0khClt1qn/pLxYKoh0wVHwO+
	mL6RzAn5u0F8Vuc1VgdvnTAQoxTUvJV00rOtPsPA+D9P/FzdiDmoNRiQV/mjzxXYO7h2
	xIAO8I1BDcr/Haxn+nxtjIF9ORvP8PJRixuscuFTjpl2gFpTWujvNGjiibGlv6hGG2Hj
	skGA==
X-Gm-Message-State: ALyK8tKTQaRFfBNEDIHeX6rP0d2lHCYjaj7Uu86tsCRLukliCobJrU45MaGpH2wyB7Wrpw==
X-Received: by 10.28.216.65 with SMTP id p62mr5312848wmg.58.1465393817741;
	Wed, 08 Jun 2016 06:50:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id g3sm1590875wjb.47.2016.06.08.06.50.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jun 2016 06:50:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 15:50:35 +0200
Message-Id: <20160608135035.6488-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
Subject: [PATCH][meta-networking] crda, lftp, curlpp: blacklist, fails to build with gcc-6
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
X-List-Received-Date: Wed, 08 Jun 2016 13:50:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb   | 3 +++
 meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb | 3 +++
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb   | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 931a053..be490cb 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -39,3 +39,6 @@ RDEPENDS_${PN} = "udev"
 FILES_${PN} += "${libdir}crda/regulatory.bin \
                 ${base_libdir}/udev/rules.d/85-regulatory.rules \
 "
+
+# http://errors.yoctoproject.org/Errors/Details/68635/
+PNBLACKLIST[crda] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
index e6796a6..187ccb5 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
@@ -24,3 +24,6 @@ PACKAGECONFIG[gnutls] = "--with-gnutls, --without-gnutls, gnutls"
 
 FILES_${PN}-dbg += "${libdir}/lftp/${PV}/.debug"
 RDEPENDS_${PN} = "perl bash readline"
+
+# http://errors.yoctoproject.org/Errors/Details/68625/
+PNBLACKLIST[lftp] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index 5663f0e..43e69b9 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -29,3 +29,6 @@ FILES_lib${BPN}-dev = "${includedir} \
 FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# http://errors.yoctoproject.org/Errors/Details/68623/
+PNBLACKLIST[curlpp] ?= "BROKEN: fails to build with gcc-6"
-- 
2.8.4


