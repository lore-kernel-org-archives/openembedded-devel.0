Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8347E166
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:54 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id g9so7726391plm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KrgjPgIwkZ3dVK2wgmLcuF5LcSEyNPrbUSpA8PN5D80=;
	b=EEi1CGuE6BEudc67ul21mg7aFQC9IgdK4spU/N3VhhV2Dkw5EF6avyZGwh1Y+CRZC8
	VZ/0g26Sb3bBCD3XC6nJTy1PCdFyiN0slNrQeEiz+ZOgIWFJShB2XzTp/EJk+ahZxR2e
	RK2tX7rODeFML7WMkd+Um3zBZV0pcxlYWgn2tPs3NFU4jO0gA2Zvo01y4HL3Ao4LCaKH
	J4tVmRRMv8EEHcEgBbCFATeOHFBloYBufwa8ox+AdlsgS+1YjDbsCjQX5x5TB+1uzGbI
	pd+nYegnKU3XXswYBuCRwnZ6OqkCjcs8XqVg8FXrQtVf/Wx9k0I2pBjTy2V+nWHKqNf4
	/P+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KrgjPgIwkZ3dVK2wgmLcuF5LcSEyNPrbUSpA8PN5D80=;
	b=oGTKB+CA5MSOPzEQQL5xEaXAMAlkwX3+dhj2MSzJRkPdHjOYoj7F7rYsuZaNHrIxGm
	UPsfun/j9VnhLEwRVVemEzy39UdvCG2amouaSPKkksNcGQKXyLMllRDIQMQEn4JeLyLv
	vRkysMSKeh7lPL22eE79755m94qZJdPfYE+NWtGnOE6LGTzgyr303scHuhnDdhLTD4sg
	s1k7lD3eloEvzwIChJ3t6xNJmoCzjXfifE1Diszw6JzLPVnBCkTk6kmBx86M76QH34F4
	EMkDXs/BH6mknxIBI2LfeiSXRo1Iaf8hHVQ1YPWwpkcdW+XGyscvSvRxow0e7er1Wscr
	0X0Q==
X-Gm-Message-State: APjAAAUCvNKNTF9/g1TygqmFtz82uhzJJFg9kZE+uxzqlzfYBv/PP9af
	2SKFcIr1uQ33M2mfEuRTGmFV+IiK
X-Google-Smtp-Source: APXvYqyky3RYAtVdFdyHYqN9mJMgA60Ql0r/S1EUC8lIcKQFcmZnBKH6aA8tQy5072Aima3tytJhNQ==
X-Received: by 2002:a17:902:1347:: with SMTP id
	r7mr35819845ple.45.1558411015373; 
	Mon, 20 May 2019 20:56:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:21 -0700
Message-Id: <b1fdd51d97dca34a7221649831fc3e0d832219b5.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior][patch 21/34] packagegroup-meta-networking: replace DISTRO_FEATURE by DISTRO_FEATURES
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
X-List-Received-Date: Tue, 21 May 2019 03:56:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-networking.bb           | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 63ad34c..64eabe4 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -38,8 +38,9 @@ RDEPENDS_packagegroup-meta-networking-connectivity = "\
     inetutils wolfssl lftp miniupnpd networkmanager \
     networkmanager-openvpn rdist nanomsg python-networkmanager \
     wireless-regdb \
-    ${@bb.utils.contains("DISTRO_FEATURE", "bluez5 x11", "blueman", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "samba", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluez5 x11", "blueman", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-networking-daemons = "\
@@ -47,7 +48,7 @@ RDEPENDS_packagegroup-meta-networking-daemons = "\
     ptpd igmpproxy opensaf squid \
     atftp postfix iscsi-initiator-utils vsftpd cyrus-sasl \
     pure-ftpd vblade tftp-hpa ncftp \
-    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "networkd-dispatcher", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "networkd-dispatcher", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-networking-devtools = "\
@@ -56,7 +57,7 @@ RDEPENDS_packagegroup-meta-networking-devtools = "\
 
 RDEPENDS_packagegroup-meta-networking-extended = "\
     corosync \
-    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "dlm", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dlm", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-networking-filter = "\
@@ -85,7 +86,7 @@ RDEPENDS_packagegroup-meta-networking-protocols = "\
     tsocks freediameter xl2tpd babeld mdns net-snmp \
     quagga pptp-linux zeroconf nopoll openflow rp-pppoe \
     radiusclient-ng openl2tp usrsctp \
-    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "dante", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "dante", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-networking-support = "\
@@ -104,7 +105,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
     arptables macchanger nghttp2 strongswan fping \
     dnssec-conf libesmtp cifs-utils open-isns \
-    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "libldb", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "libldb", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "non-commercial", "netperf", "", d)} \
     ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "spice", "", d)} \
     "
-- 
2.7.4


