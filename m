Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id ABF5871AEE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 10:10:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so4542881wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bT/+lCQj5vpfwdWh/5/wLAYbw0gwNnVD1f1wKWObOdk=;
	b=LGyP0hM4Qo1o/Omy21LoyT8Gb7qqckQfkWPWTNjh35yAJ8xdJ5LQFQUQbBqUesVCNg
	qqFtLHC2vRNXvCDtj3APvrNHS4EH7z/homYc3A+2vOOyg85P0DfQT+RfzV+HBb0BAQKh
	jZZkSdA/sALmVNkns/NA64XpJW94+ldRrVIa9WUPw6OgAsm7FwWlVSNvUC7/nByx/YP9
	zv047963YQBAcrs2kM1WNtUbd78Ex0aABCwMYZm70b2nRJDrr8HSw7iMGr3XGFHBIX20
	VYCdmiCuiExTHXrm8VdylQ3ff3O5H6QzIkWjMePlmqSiaIDIE0Lazz168ycgfxXpzGHz
	rsjw==
X-Gm-Message-State: ABUngvf2b+i1+cz20nYm42lZrMkQaqhhxqhTZS9c4OHI1TdsPDiH0nOz1+9zzjUDaCScFw==
X-Received: by 10.28.185.78 with SMTP id j75mr20764295wmf.14.1479463825582;
	Fri, 18 Nov 2016 02:10:25 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c133sm2536223wme.12.2016.11.18.02.10.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 02:10:25 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2016 10:10:24 +0000
Message-Id: <20161118101024.17892-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161116090234.30806-1-git@andred.net>
References: <20161116090234.30806-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2 v3] ncp: add v1.2.4
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
X-List-Received-Date: Fri, 18 Nov 2016 10:10:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/ncp/ncp_1.2.4.bb

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
new file mode 100644
index 0000000..f42223b
--- /dev/null
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -0,0 +1,31 @@
+SUMMARY = "a fast file copy tool for LANs"
+DESCRIPTION = "ncp is a utility for copying files in a LAN. It has absolutely no \
+security or integrity checking, no throttling, no features, except \
+one: you don't have to type the coordinates of your peer."
+HOMEPAGE = "http://www.fefe.de/ncp"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+DEPENDS = "libowfat"
+
+SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
+SRC_URI[md5sum] = "421c4855bd3148b7d0a4342942b4bf13"
+SRC_URI[sha256sum] = "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0bb095a73c24b9359b88"
+
+EXTRA_OEMAKE = "\
+    DIET= \
+    DEBUG=nostrip \
+    CC='${CC}' CFLAGS='${CFLAGS} -I${STAGING_INCDIR}/libowfat' LDFLAGS='${LDFLAGS}' \
+"
+
+do_install() {
+    install -d -m0755 ${D}${bindir} ${D}${mandir}/man1
+
+    install -m0755 ncp ${D}${bindir}
+    ln -sf ncp ${D}${bindir}/npoll
+    ln -sf ncp ${D}${bindir}/npush
+
+    install -m0644 ncp.1 npush.1 ${D}${mandir}/man1
+    ln -sf npush.1 ${D}${mandir}/man1/npoll.1
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.10.2


