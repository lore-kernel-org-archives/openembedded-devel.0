Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1772.1792434898053237020
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YXheslvY;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06210b29fso563694b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434897; x=1793039697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OeXLzO6hKfiLMPllBFcmxgWV1We2ATIjDhBJX6EUOU=;
        b=YXheslvY/9R03NgLPg0C65kGuJd8r+copjO5DxaTBsYtzG2iitHGxOFYt0u08bAaRL
         txZQj68tRaNguG9BbtyQKNeFLIhRHXoAA461KJDuBNV0tdHdne1T28klZQ6h/NACZCJr
         ZY6dQbIpP47ylj81XoehmQxkUrMUvnknU3uyDKKMvXzErFsntjyiu/K9tSYyLZbjRyJr
         OKu/yK0hSFozhCidHdCvcG9QbrjofRWICPR0wMuuL8qWupiUidSf5zax9rmleBgcAau4
         uNqSKzI6Lq3NfVdl0YI2POT4jCLsWUwQmFA50DzqPXWGvHNsz+RXNxVAcY2fTDY3iba3
         siZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434897; x=1793039697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OeXLzO6hKfiLMPllBFcmxgWV1We2ATIjDhBJX6EUOU=;
        b=EBHYN9FgTxYOlTiVejN7j/ryruwzTZNfTz2SbeCUaDCU0+jy9zax7RyFrQqV+nLsp0
         JJO7PAY71kvK3EjunZkwXes24p7kvTDdPSPiwrEQj5SCvfiK4nP3dR4qyGTqu27eg6Wv
         w8eC72FwZR8e3LkYbJLAe/1U1kgYHuUJcwbcD3yICgYnFRyNrMY4uJN3Rl2KnkCgIUA7
         KYb5uc6tgn3b9+f6aRhBrqN3KraP9Ohv4irj5Z8Mr8V0uwlEDjGIod0Mh1ILLiR3TW9O
         79+f3FbQ8DhejqOfgbZTqPHxowDX0YjQm5VRII8S1tgfHSp+FLKXvHuKPDU3tVo1DUAD
         UxiQ==
X-Gm-Message-State: AFq9FYImH7osCdjMKDVrXYV+BVwT7NXaDUJktKdHkHxtzJ5CE5CMY3xh
	r2VfVZNaYNDAlFvd/gEQdwj/WXAr4zuefCqTTPWSPzM6XhzgRq4z5ADTMuHgVw==
X-Gm-Gg: AYBFou3TNafMFcyekHKdc3B/3tutd2737HRQBVDJsruXLIJJuDr6CNFp1cYRp0oOupQ
	tqsPkaudA3US6kcCiP28aZ1lTdxxpzuULKc8sx1cA/QoaqPDNz6rXhlccFpo/fCwoCbGEwJn64O
	mKlGOl4O+RQvNsF/tHyhoETIijY8uEk94egrWHp+05FSnWHWvAdieDJs1f+f3QwSrZPAAOL2tX8
	e7+yw7TxswXFgQ0BHglxL0CNXipjpw+CnQQ/p9KSA0bKFTyOBaNdXTxppB1MfUPHn5qrIyl7sAj
	BNXpbSRaHi5ZhIuecxgwQBgtl7YQOd1WL4/YVWmNv2XtkVdXrgjRjp84CaDjft6IyYz7qUNLPl6
	+PNsx2uX05uC+0mYMQcZ38KMVevy/WUOPSbI2bCx9kJdpVTkiVyCjfmjtbroRwPXzQdJSnecJTf
	KVpMoO8Y2vwd6+opuY7ScIijMOwQKt7HU+tfT3lwL3draikfm4Vb+L7ZoEArM8MnLF94PJwtYwS
	WKnaVtjZOwE/JmhDobkC4uvfXOFmZOvZEdAMRM=
X-Received: by 2002:a05:6a20:2a30:b0:3e2:19a0:4b3d with SMTP id adf61e73a8af0-3e226080aa4mr4727307637.73.1792434897340;
        Mon, 19 Oct 2026 11:34:57 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 18/20] open-isns: upgrade 0.102 -> 0.103
Date: Tue, 20 Oct 2026 07:34:04 +1300
Message-ID: <20261019183407.1037972-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131144
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Upstream removed previously-deprecated Makefile/autoconf build system.

Changelog:
https://github.com/open-iscsi/open-isns/releases/tag/v0.103
---
 .../{open-isns_0.102.bb => open-isns_0.103.bb} | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/open-isns/{open-isns_0.102.bb => open-isns_0.103.bb} (71%)

diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb b/meta-networking/recipes-support/open-isns/open-isns_0.103.bb
similarity index 71%
rename from meta-networking/recipes-support/open-isns/open-isns_0.102.bb
rename to meta-networking/recipes-support/open-isns/open-isns_0.103.bb
index f51887e020..b89c58db78 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.103.bb
@@ -6,29 +6,25 @@ DESCRIPTION = "This is a partial implementation of RFC4171, the Internet \
 Storage Name Service (iSNS).  The distribution includes the iSNS server, \
 supporting persisten storage of registrations, isnsadm, a command line \
 utility for managing nodes, and isnsdd, a corresponding discovery daemon."
-HOMEPAGE = "http://github.com/gonzoleeman/open-isns/"
+HOMEPAGE = "https://github.com/open-iscsi/open-isns/"
 LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 SECTION = "net"
 
 DEPENDS = "openssl"
 
-SRC_URI = "git://github.com/open-iscsi/open-isns;branch=master;protocol=https \
+SRC_URI = "git://github.com/open-iscsi/open-isns;branch=master;protocol=https;tag=v${PV} \
            file://0001-isnsd.socket-use-run-instead-of-var-run.patch \
-           "
+          "
 
-SRCREV = "c0e6d9fedc5a7041260de477fe1a8455fa074113"
+SRCREV = "3e053e2a2c83293db7167f336940fec51f32fed7"
 
 
-inherit systemd autotools-brokensep update-rc.d
+inherit meson systemd update-rc.d
 
-EXTRA_OECONF = " --prefix=${prefix} --enable-shared"
-EXTRA_OEMAKE += "SYSTEMDDIR=${D}${systemd_unitdir}/system"
-
-do_install:append () {
-    oe_runmake INCDIR=${D}${includedir}/libisns/ install_hdrs
-    oe_runmake LIBDIR=${D}${libdir} install_lib
+EXTRA_OEMESON = "-Dsystemddir=${systemd_unitdir} -Drundir=${runtimedir} -Dsecurity=enabled"
 
+do_install:append() {
     install -D -m 755 ${S}/etc/openisns.init ${D}${sysconfdir}/init.d/openisns
     sed -i 's|daemon isnsd|start-stop-daemon --start --quiet --oknodo --exec ${sbindir}/isnsd --|' \
         ${D}${sysconfdir}/init.d/openisns
