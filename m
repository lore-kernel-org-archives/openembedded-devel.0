Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A6A00772E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 17:52:24 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a20so8044196wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 09:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WWZNkYpFsA/1iH/lawp/Cpexi6f9u/BVXE5o4BkA/B4=;
	b=lpPiQ2uQ0Tnd28QFBB+ngVTCc0mx3xthxMrMqt4RbiawD/GYQdYOq5Vb7gjsSvir9A
	9wbg0t8AYYLVeVYN1GOJfRBkLW7dO6umlm7dqf3g+aI0HA0vdWi900F/rcrZHvLRbA4u
	8MLuU4zRRb6NK2Y9SiXAYSrXCJUiaApam5j8tEDcakQ+iOnweT3/ArmG6T+CtHJOCWOl
	+dvJmSrcamHfWTTvhDURhm9DEQ/GCbddrnLjkdeBlnSZz3Kxug6eOujCTmdj/hmiHSZe
	84/yuXFiLf/F90KfbNJpkt22qYden2poA6R0x8MAnQjxN1doVNsXAVSiPyb8+x4dJXIt
	R1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WWZNkYpFsA/1iH/lawp/Cpexi6f9u/BVXE5o4BkA/B4=;
	b=UmGWM1lcmgHiKac1yze1B72Nt359h8mAAAKcMSXGyj7ggVDnbD+XxaGjr/rNZOGTDC
	XhgSwuQb7oPjwjum/78rRSg9NtJ1EFI028ry/nk7PK+wq50ILIFu5O8FwlgXfug0l+ef
	KwV7yPiIXpD9i8V9JfHeYNpbCkZBJ5sRxyv4uOFbSDkmjC+ilK0v2lAqzGGcNTpg+Bd8
	8X5qQL+LPOMM+g+a+SkZy1llG4fv8gNVIb2bhBnQGpYc9BupUA5xlHe4QXTMI7gJE2O1
	KNttzS4zNtDRwPcVtGcgoU8Ah1Ta6iFXNlKlih2FdAzqxPTIcuj/yRf1oDW/LcIxbobn
	aBMQ==
X-Gm-Message-State: AIkVDXLUeb14QC4WanRXAkV7/MkgSir4NfiFTKa0BjcnsVZ4iTfQn7rtz1/Ia2nSlzIDew==
X-Received: by 10.28.6.147 with SMTP id 141mr2696533wmg.98.1481824345054;
	Thu, 15 Dec 2016 09:52:25 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-90-226-171.hsi11.unitymediagroup.de. [109.90.226.171])
	by smtp.googlemail.com with ESMTPSA id
	e5sm13482891wma.12.2016.12.15.09.52.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 09:52:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2016 18:52:11 +0100
Message-Id: <1481824331-347-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH V2 3/3] firefox: do not link against crmf library - it is not there
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
X-List-Received-Date: Thu, 15 Dec 2016 17:52:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

and build succeeds without it

fixes:

| <...>/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/6.2.0/ld: error: cannot find -lcrmf

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...link-against-crmf-library-it-is-not-there.patch | 47 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.5.1esr.bb       |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch

diff --git a/recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch b/recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch
new file mode 100644
index 0000000..65a4a04
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch
@@ -0,0 +1,47 @@
+From 82862c9be8e1c87d32b639403f1f5715c8f4be59 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 15 Dec 2016 00:23:41 +0100
+Subject: [PATCH] do not link against crmf library - it is not there
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure                          | 5 -----
+ config/external/nss/crmf/moz.build | 1 -
+ 2 file changed, 6 deletions(-)
+
+diff --git a/configure b/configure
+index 918c8d6..9d31b5c 100755
+--- a/configure
++++ b/configure
+@@ -15689,11 +15689,6 @@ echo "configure:15633: checking for NSS - version >= $min_nss_version" >&5
+ 
+ fi
+ 
+-if test -n "$MOZ_NATIVE_NSS"; then
+-   NSS_LIBS="$NSS_LIBS -lcrmf"
+-else
+-   NSS_CFLAGS="-I${DIST}/include/nss"
+-fi
+ 
+ 
+ echo $ac_n "checking for YASM assembler""... $ac_c" 1>&6
+diff --git a/config/external/nss/crmf/moz.build b/config/external/nss/crmf/moz.build
+index 9b8005f..4bfcc81 100644
+--- a/config/external/nss/crmf/moz.build
++++ b/config/external/nss/crmf/moz.build
+@@ -8,7 +8,6 @@ Library('crmf')
+ 
+ if CONFIG['MOZ_NATIVE_NSS']:
+     OS_LIBS += [l for l in CONFIG['NSS_LIBS'] if l.startswith('-L')]
+-    OS_LIBS += ['-lcrmf']
+ else:
+     USE_LIBS += [
+         # The dependency on nss is not real, but is required to force the
+-- 
+2.5.5
+
diff --git a/recipes-mozilla/firefox/firefox_45.5.1esr.bb b/recipes-mozilla/firefox/firefox_45.5.1esr.bb
index 1f865eb..0e5e775 100644
--- a/recipes-mozilla/firefox/firefox_45.5.1esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.5.1esr.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
            file://0001-use-pkg-config-to-find-nss.patch \
            file://0002-use-pkg-config-to-find-nspr.patch \
+           file://0003-do-not-link-against-crmf-library-it-is-not-there.patch \
            "
 
 SRC_URI[archive.md5sum] = "ec943bcff82e868d2f5e95dde7edb83f"
-- 
2.7.4


