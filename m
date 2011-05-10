Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlLz-0005rZ-S0
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:43:52 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so4758860fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=PlbOD0+vJNTJltFdUkndhbAc6fBPbqFa3b99leYA53U=;
	b=w+R3uunXq+mY36bSrq1QE8IJhFkMpXsmeeuOa/RW1hi9pB2VD7EHY5FpkQYP+tR6WI
	DXOMo9Nao9jLJoGfLLSr5VaYqxCvrN20y7dNesTYkL0PMA5XxKbuf6XhHukOJTEX8v5K
	ktrx6Edq9OyY0aZ9ouoYQ/+Qs9DeLZmrZ1bZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=c2UobFC2D1bYbxjH7Xgr0p2tMB8Cpz7O6W3exRLvJaxwp3it4y0gUUj47WDpU7Rjes
	7xepTlBHU13c5JhcuheR5KTc+8t9oSidZ+PNlmeGGsyx69K0LfhIyjLUe1gqeFbYPqui
	koa0Gnw12IbOTVLq7QZRS2J4Jo2m2ANlEi2Z4=
Received: by 10.223.55.200 with SMTP id v8mr1263635fag.82.1305027668838;
	Tue, 10 May 2011 04:41:08 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c22sm2345751fat.38.2011.05.10.04.41.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:41:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:41:07 +0200
Message-Id: <7c72b279f433547831ea4e04e9433f5a77f893e4.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 9/9] connman: drop older 0.72
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
X-List-Received-Date: Tue, 10 May 2011 11:43:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/connman/connman_0.72.bb   |   31 --------------------
 1 files changed, 0 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/connman/connman_0.72.bb

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.72.bb b/meta-oe/recipes-connectivity/connman/connman_0.72.bb
deleted file mode 100644
index 8eb1e14..0000000
--- a/meta-oe/recipes-connectivity/connman/connman_0.72.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require connman.inc
-# connman requires libXtables now
-DEPENDS += "iptables"
-PR = "r0"
-
-EXTRA_OECONF += "\
-  --disable-gtk-doc \
-  --enable-debug \
-  --enable-threads \
-  --enable-loopback \
-  --enable-ethernet \
-  --enable-wifi \
-  --disable-wimax \
-  --enable-bluetooth \
-  --enable-ofono \
-  --enable-resolvconf \
-  --enable-dnsproxy \
-  --enable-tools \
-  --disable-polkit \
-  --enable-client \
-  --enable-fake \
-"
-
-SRC_URI  = "\
-  http://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.gz \
-  file://link-against-libnl2.patch \
-  file://connman \
-"
-
-SRC_URI[md5sum] = "800f9356e0471c88819eee7184713a1f"
-SRC_URI[sha256sum] = "9c8ad312573683fc9f50d5042d4a87ddc8e0700b27ac1b0fb8dc2e8b7424a60f"
-- 
1.7.5.rc3



