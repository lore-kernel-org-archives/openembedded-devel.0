Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8DBC674586
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:03:26 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id f14-v6so8003097pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=l4D+Fe3yIDhuGi2uzLnOb5P01Yt+9AxINCK04MOxEa4=;
	b=QuGIrmFoAoRo69ppXPxKF8u23zfIsrIfYiqlP4KsyrOIAlQ5b6liOawn22Oagbbf3H
	FnLzpdAZT62kDVUeZg0RuyVerH+XXoQi61MdU4rtuHQVXKZknMHh8QBeuEZIO3te2uxJ
	KHvT0dy/w43D/h8QO8rWcZ3w6cyUMyEUn2I81S0Pri+GrmWphMFhFjitbN6EDt1vfSzy
	QLQ6VS/6j4SvefGBNQodbMLK7OJUiXzcDjlx3dsx+NwxO9Xvw6r3mnwmAwe/MAHjP10/
	iSaaYJBO5QJfJp8XHy4GYyp89wTnuBHulB4T44o8KoV1OmtBg7TRTfU5C4lBzaHJuJ4z
	8onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l4D+Fe3yIDhuGi2uzLnOb5P01Yt+9AxINCK04MOxEa4=;
	b=JnldUN23zObIhrQSdC2Gg0480Rc/I1V9px1QXsDlz7/FPOZYwLlEXZjZ46ILAUbesT
	30/f8gR+xSlqsT562IvxlgLzlwYDpqP6oyNSzsiGtFNfFlatt0dfJV2eUf6vlsqPyUWb
	+/d00alfCOikyNspRUoy8SlzAVUSJwZCEFBEJv1V6EfYa44g2zSAn2aY5WA1NMDcx5qp
	CM0AFc89F+DRKUBFQR3wbzaMkttpTm/PPh8X7OYpmV0ObDyH1ICB4W7lCtFYYPET9r6I
	WTLtrcobPgzY9TzpbMaJBbOUThGwK8p81ksTbSCThm+JgWiXHSG15MBUAvmhEnjtRAMS
	f9Ng==
X-Gm-Message-State: AOUpUlEp7xWDnTGF6GZ/44zigOXd2VKI+SscEJ6AV5bNGbU4/c6AS4Jt
	2lYzyzPF+fH0nwxJLxRqFvPBGeT7
X-Google-Smtp-Source: AA+uWPwEs9ldKDZ26eA1GLcYiD00NTP0UsxyF6MqVE1qDUavg/Gt2OqHxpiBh7KzPH350TDxFn01xQ==
X-Received: by 2002:a62:c218:: with SMTP id
	l24-v6mr51764546pfg.185.1534835007037; 
	Tue, 21 Aug 2018 00:03:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm21214669pfg.3.2018.08.21.00.03.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 00:03:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 00:03:15 -0700
Message-Id: <20180821070319.36295-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 1/5] ndctl: Upgrade to v62
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
X-List-Received-Date: Tue, 21 Aug 2018 07:03:26 -0000

- Fix build with musl
- Package systemd support
- Inherit bash-completion bbclass

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/ndctl/ndctl_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
index 36f94ecfd5..b20915f20f 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_git.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
@@ -8,14 +8,15 @@ HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
 
-inherit autotools-brokensep pkgconfig module-base
+inherit autotools-brokensep pkgconfig module-base bash-completion systemd
 
-SRCREV = "0d6aeeabec9d271e08c12e4cf679b59946e20156"
+# v62
+SRCREV = "11f560f4048c1d38b7011a49566871a1e8a07c94"
 SRC_URI = "git://github.com/pmem/ndctl.git"
 
 DEPENDS = "virtual/kernel kmod udev json-c"
 
-PV = "v61+git${SRCPV}"
+PV = "v62+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
@@ -24,6 +25,6 @@ do_configure_prepend() {
     ${S}/autogen.sh
 }
 
-COMPATIBLE_HOST='(x86_64).*'
+SYSTEMD_SERVICE_${PN} = "ndctl-monitor.service"
 
-FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
+COMPATIBLE_HOST='(x86_64).*'
-- 
2.18.0


