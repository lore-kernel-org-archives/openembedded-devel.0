Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 10BA46B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:43:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so1104580wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 07:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TS8t4ixdoenXdcCGhLVbz+7NyCoB+5h+03fSQti8FrQ=;
	b=b5It0EOS9LwLzACxwrun1/UUrmI5woNQQENKWM/fyyKr0YH/+sUYXLExqS1+sX/bpV
	Qk2HA8lMFPLSeuB4LIWGygcvpZse+YBT0dBBpYJlDJ4zOcBptAAGq7hP3YaDjEwbNleX
	m/eVh5SVHU1wEemDhp8XJPxLZea50E6b3KwayWvxBfdv6vWWrpZOo7ki/FjJJiWr4Hhs
	LPSIoXh+nnXtM3LUb5i5BEPChVBpP8W0bzSVRSzTAWKVH36kfnoXhWWT455Ce3x8wOAf
	6N6ZBLVyKosL3vQC/PKs7bKdhVihZb1l6IkL0veMk4m/8dGO1Jkt0dJGBwbbMNUw98Xm
	m3gg==
X-Gm-Message-State: ABUngvdcYa3pj95PjFjhPwH7J+B7kDbUXVEYqD0vErVhS+IiaQXC5tNx/kDo0WJ6Tjav+w==
X-Received: by 10.194.201.227 with SMTP id kd3mr30551123wjc.74.1479224604318; 
	Tue, 15 Nov 2016 07:43:24 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f134sm4880716wmf.19.2016.11.15.07.43.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 07:43:23 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Nov 2016 15:43:11 +0000
Message-Id: <20161115154311.30118-3-git@andred.net>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161115154311.30118-1-git@andred.net>
References: <20161115154311.30118-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] ncp: add v1.2.4
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
X-List-Received-Date: Tue, 15 Nov 2016 15:43:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-support/ncp/ncp_1.2.4.bb

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
new file mode 100644
index 0000000..d52044f
--- /dev/null
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -0,0 +1,53 @@
+SUMMARY = "a fast file copy tool for LANs"
+DESCRIPTION = "ncp is a utility for copying files in a LAN. It has absolutely no \n\
+security or integrity checking, no throttling, no features, except \n\
+one: you don't have to type the coordinates of your peer. \n\
+\n\
+Please note that the DNS resolver does not use /etc/hosts (as that \n\
+would not work with IPv6 anyway), so you should have a properly \n\
+configured DNS server. \n\
+\n\
+Basically it works like this: \n\
+   1. You and your buddy want to play Quake \n\
+   2. Your buddy has a level that you don't have \n\
+   3. He types npush filename and waits. npush sends out UDP \n\
+      announcement packets proclaiming that someone wants to send \n\
+      something \n\
+   4. You type npoll. npoll waits until it sees one of these packets \n\
+   5. The files are copied with tar over a TCP socket, so permissions \n\
+      and file dates (and if you are root, owners) are preserved. \n\
+\n\
+There are other usage modes. You can also use it like this: \n\
+   peer1$ ncp \n\
+                           peer2$ ncp peer1 file1 file2 file3 \n\
+or like this: \n\
+   peer1$ npush file1 \n\
+                           peer2$ npoll peer1"
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
+    install -d -m0755 ${D}${bindir}
+    install -d -m0755 ${D}${mandir}/man1
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


