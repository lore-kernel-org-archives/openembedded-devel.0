Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id B94C578441
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:00:15 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a16so155284pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 21:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4sZtlOgFM2atNIJB5pTfixNR8zpuvKJq9u++HbFLG8s=;
	b=KmI4doenqkqe6sjJMKNcpcgxyW+pZVSB1HgeDCXMl4ZDh7O8Y3nJK8vawTFtArvMt7
	fZWBc6b7NQtGu57IOVv8nuM+4wyFN7GM/907MYqJgbeAFp1HNj5heWlLlqwAgNM6FKch
	MqrLTp2WKoaK9iX6HLaKwdmnIRtqmyJc0z/+GzEvb6PuTeVww67n9MfWpWsFb6SoraZ6
	QGefxxrE3qhjDgydkl1seVbeG5a8uamx/E7CI/QjhMFxyVclm2e1IHUzEMCvmE2eVgPu
	wKmiNmkPmw7SRyKwI7js4oemwUIqwehAD9I5eQUbPqq/9au+2Tbygr23r9bMYxnRJHIo
	LlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4sZtlOgFM2atNIJB5pTfixNR8zpuvKJq9u++HbFLG8s=;
	b=Bmhx4ycNHqWed1K5YeY8S/a5Qdl6QK40OfCRr5t4u+GkTQ9nTQWpDuWFMlqw5Udp5y
	IoYc3UZwl+Y1Fwz5IHBHYtNQo/3s8Zr4fgujRKzYZ0+zJE7bk4UcRaBMHx3AQwAKstwP
	gKibl/ODOEaZsveMQXp8iPrZb6Szhp9f1ADgoSjANwQupYdI/CcN0DlAzdnDrwTMODA6
	uGheJpeFu1Rui1Iv39qWlZ7Ci+SDYis3JrTb6pIHSU+7WHtk2VPhmIxkSNdofqAFWkfa
	hUbCZ2C4Ec87Es/QamUqFSA4UpRBy/jqQgS/korsyJ3/etxYDVOdk9d1vYiul/Gd6q8M
	q5Fw==
X-Gm-Message-State: AElRT7Hpo4s7Yq8j3wpdNkNZdJ5uwsZjuAIJ20KG4j82138i3QamzovY
	OVCDJaFrCyjEOsVUa1BmKurOKA==
X-Google-Smtp-Source: AG47ELsMnJpoVUT37UUJB1u8BFD9T6Bo2RCqT4vV2IuwhCL0Bsm924vMtatkjYM/15HCk/VcxmOAgw==
X-Received: by 10.99.165.66 with SMTP id r2mr10973208pgu.452.1521518416818;
	Mon, 19 Mar 2018 21:00:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	m9sm927862pff.143.2018.03.19.21.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 21:00:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:00:00 -0700
Message-Id: <20180320040000.29408-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320040000.29408-1-raj.khem@gmail.com>
References: <20180320040000.29408-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 6/6] libgnome-keyring, gnome-keyring: Add build dep on glib-2.0-native
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
X-List-Received-Date: Tue, 20 Mar 2018 04:00:15 -0000

Fixes
run.do_configure.39296: line 176: glib-gettextize: command not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb    | 2 +-
 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 9d85c651c..5a9ca5f6e 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -21,7 +21,7 @@ SRC_URI += "file://egg-asn1x.patch \
             file://musl.patch \
 "
 
-DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
+DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native glib-2.0-native"
 RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
 
 LDFLAGS += "-lgmodule-2.0"
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
index e24188232..7e9de5026 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
@@ -13,7 +13,7 @@ PR = "r3"
 
 inherit gnomebase gtk-doc
 
-DEPENDS = "dbus libgcrypt glib-2.0 intltool-native"
+DEPENDS = "dbus libgcrypt glib-2.0 glib-2.0-native intltool-native"
 
 SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
 SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
-- 
2.16.2


