Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3850.1794728983620570531
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BbSUmy6p;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37198ed3727so3930686eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728983; x=1795333783; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6pyihI/dK0eckhLt3d6ynVG7VdMGP6s+9USWZHtaaRE=;
        b=BbSUmy6pSzcOKDKZ2d2DHRxnMC8prg/uWgoyGY+nRSG2MOnsxKUHa7YayzzIVVKdNq
         dXb064dH/bW+Sk+jNoJqD61oF/dl9AvH4HGTQk7jF/x7m5Jr5W9hvEdR1jC1ISxCT1kV
         2lnpLM4jpqztL/1eveFEupoX6o7Sii/s4Xms5h9sypBUktwlvSozvXQXWrp6xeAyW9s+
         nRIqtV6C8y2w4qbq7f5R+1Pz0Xv7YBX790KUyT2gd3nVhr2cppOkSn+ZVbfqIFwBrcMN
         h9/WmZY0PdkT0dJIZ//33WluyTgk4vkW+5RoJe9KC5PXYLGSsQ1uyMuqEExlkjwfJxjs
         Htfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728983; x=1795333783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pyihI/dK0eckhLt3d6ynVG7VdMGP6s+9USWZHtaaRE=;
        b=ZUyinnL3xvT3x6BFWXsJH2f8ZtqBmtqJr2ocokKshbOlN2ZDa/bV41ymwq+teVbYQ1
         BZD0I7p3bugYGwk19HGZXwzWUCfcVhTLjkoOJIEPwsw/vqIEsvSeNIfi0YTZH7oUz1do
         31DGDE44m4lvf4ewb5uaqPjaPloLk4t1EBfYAMc2VGD4k33M1glMtpkoc/gVqls8L+rV
         32ulrY8yaTgb75moMR+c/QeGjLMC3MVOtVKxgIKKXmthCNuRN7Cfe4SrvJUAW6+QmV0z
         g8R/dAGMTJrPzyspoxDE1NWhK4fniZi1xl1CICx8EQ4dC5XGo5uoIYbg05JLW+yhXNup
         grJQ==
X-Gm-Message-State: APuU4Z905qfo8BPO82oRI/y/ULKvLinpZaoUqYOpD4jWMudh2b27aiOY
	L5+NZCnyE5scK5sv3JhaiD98It7wc8ubSQB0vxqv6MJJRwdWmxQ1S/+cY/qd4WWE
X-Gm-Gg: AYBFou0EIwjsjHMYSPlEKpnweF2scGh7BBtMe1hFu7jDgNQhib6wsT5+uicqjdIUGyq
	dpYZz3B55gvDcUHtLp7U6JyQ+KFZNvqKxRVlxGLGRkMTzgzACQzR11GPXjqiLpiJiu8oiB0Hx7p
	lTClxman3Kg3UKElamkuSCOE6hIjF4Izsrr4sniMtAQrpFaOCp614fd6G+hsHUs/XOp4l4mYKWB
	ar0KHxOQm1SgZ0XcJ7lHwzrdQ9iSUIsZT7qozrqefBOQv/vJqx0oC0L1POMcf7Dz1/04vPBtfiM
	fjhZWi8sgSNMF2DMg76U7lPQqk7zoDC1jC+uSHWVOJPSrRsaZurwnXylG/tN2HLbtklWgBVunaC
	96O/8IQnPuxD9oaAqzDKRjv3CY+R0nhvagshSPkb3Nh/yM7q9Sle3KZS8DesqCij3cqGy4pcgPi
	oG5EJfftI/flEuXFwOWf/6/qfOJ3FzIuBoDtneQSF7fnqcdBnRbwTfOFMsMTXaw/Hvj7K2fLb/u
	M/qlXXj69+Sbkg4vbeKQyRFb+BDhsZrnyCInsDjDGo0VOJzgmJxqyJ09p3FIla4Ng5UtDi/JaoU
	3twtjIBj1OTAjSzo+p9UYkPUtz5by2PZ9cERfnLO6emfe8jTuIZGjMYF/hC6zi9pYUgfWjTj7nG
	vIWe3tZbi+w46Z3RnstnWkAHv135UR8l+EjXDIjJprx+RbOmpljvtvufWQwdfiG0IDemnUhkkoG
	fObUkGd/pwj01qQDAv5LMDzaxLFykLI+BoKIuh7dxANJ2ff38vNP4uVaCPC5xJNochQGFdtaLsK
	ZmALF7KWjyVw3d9VkaaXKslnoyuLPgprkhEfzwlaS+jk+Mt6P4VxpDF/APp1YMbj6eXE0wcDqRT
	E5IQY2fjJGvZ8jmSYGOYsRlaWA==
X-Received: by 2002:a05:7301:2783:b0:379:2c7e:7dff with SMTP id 5a478bee46e88-3792c7e7f16mr7667363eec.26.1794728982872;
        Sat, 14 Nov 2026 23:49:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/96] hplip: upgrade 3.26.4 -> 3.26.6
Date: Sat, 14 Nov 2026 23:47:51 -0800
Message-ID: <20261115074918.2932593-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132283
Content-Type: text/plain; charset="utf-8"

Refresh 0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
and 0001-Fix-installing-ipp-usb-quirk.patch, and drop the
--disable-policykit configure option which no longer exists.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Fix-installing-ipp-usb-quirk.patch     | 10 +++-------
 ...ssor-only-when-DISBALE_IMAGEPROCESSOR_.patch | 17 +++++++----------
 .../hplip/{hplip_3.26.4.bb => hplip_3.26.6.bb}  |  3 +--
 3 files changed, 11 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-extended/hplip/{hplip_3.26.4.bb => hplip_3.26.6.bb} (96%)

diff --git a/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch b/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch
index d45db1b2e3..9fbde12273 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch
@@ -11,17 +11,16 @@ Use $(DESTDIR) as installation prefix for
 /usr/share/usb-ipp/quirk/HPLIP.conf.
 
 Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
----
 Upstream-Status: Pending
-
+---
  Makefile.am | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index e10364d..f520225 100644
+index 6280bfa..2ab18ce 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -703,10 +703,9 @@ if !DISBALE_IMAGEPROCESSOR_BUILD
+@@ -719,10 +719,9 @@ if !DISBALE_IMAGEPROCESSOR_BUILD
  		ln -sf $(libdir)/libImageProcessor-x86_32.so $(libdir)/libImageProcessor.so ; \
  	fi
  endif #DISABLE_IMAGEPROCESSOR
@@ -35,6 +34,3 @@ index e10364d..f520225 100644
  if !HPLIP_CLASS_DRIVER
  #	   If scanner build, add hpaio entry to sane dll.conf.
  	if [ "$(scan_build)" = "yes" ]; then \
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch b/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
index fa973a8d85..69c91fe222 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
@@ -11,13 +11,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 5f75759..73421b1 100644
+index 778ef9d..6280bfa 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -597,7 +597,11 @@ hpcups_SOURCES = prnt/hpcups/HPCupsFilter.cpp prnt/hpcups/HPCupsFilter.h prnt/hp
- 	prnt/hpcups/ImageProcessor.h
- 
- hpcups_CXXFLAGS = $(APDK_ENDIAN_FLAG) $(DBUS_CFLAGS)
+@@ -601,7 +601,11 @@ hpcups_SOURCES = prnt/hpcups/HPCupsFilter.cpp prnt/hpcups/HPCupsFilter.h prnt/hp
+ hpcups_CPPFLAGS = -I$(srcdir)/prnt/hpcups -I$(srcdir)/prnt -I$(srcdir)/common -D_GNU_SOURCE
+ hpcups_CXXFLAGS = $(APDK_ENDIAN_FLAG) $(DBUS_CFLAGS) $(AM_CXXFLAGS)
+ hpcups_LDFLAGS = $(AM_LDFLAGS)
 -hpcups_LDADD = -L./prnt/hpcups/ -ljpeg -ldl -lImageProcessor -lcups -lcupsimage -lz $(DBUS_LIBS)
 +hpcups_LDADD = -L./prnt/hpcups/ -ljpeg -ldl -lcups -lcupsimage -lz $(DBUS_LIBS)
 +if !DISBALE_IMAGEPROCESSOR_BUILD
@@ -27,7 +27,7 @@ index 5f75759..73421b1 100644
  #else
  #hpcupsdir = $(cupsfilterdir)
  #hpcups_PROGRAMS = hpcups
-@@ -687,6 +692,7 @@
+@@ -703,6 +707,7 @@ endif #HPLIP_CLASS_DRIVER
  
  install-data-hook:
  if HPLIP_BUILD
@@ -35,7 +35,7 @@ index 5f75759..73421b1 100644
  	if [ \( "$(UNAME)" = "x86_64" -a  -d "$(libdir)/" \) ]; then \
  		cp prnt/hpcups/libImageProcessor-x86_64.so $(libdir)/ ; \
  		chmod 775 $(libdir)/libImageProcessor-x86_64.so ; \
-@@ -697,6 +703,7 @@
+@@ -713,6 +718,7 @@ if HPLIP_BUILD
  		chmod 775 $(libdir)/libImageProcessor-x86_32.so ; \
  		ln -sf $(libdir)/libImageProcessor-x86_32.so $(libdir)/libImageProcessor.so ; \
  	fi
@@ -43,6 +43,3 @@ index 5f75759..73421b1 100644
  	if [ -d "/usr/share/ipp-usb/quirks/" ]; then \
  		echo "ipp-usb directory exists"; \
  		cp prnt/ipp-usb/HPLIP.conf /usr/share/ipp-usb/quirks/ ; \
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.26.4.bb b/meta-oe/recipes-extended/hplip/hplip_3.26.6.bb
similarity index 96%
rename from meta-oe/recipes-extended/hplip/hplip_3.26.4.bb
rename to meta-oe/recipes-extended/hplip/hplip_3.26.6.bb
index f383a3f062..ac6f4a34a5 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.26.4.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.26.6.bb
@@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-installing-ipp-usb-quirk.patch \
            file://0001-Drop-using-register-storage-classifier.patch \
            file://0001-Fix-upstream-CFLAGS-override.patch"
-SRC_URI[sha256sum] = "b9c61252754f35b4a237396ca8961e7b3e0c56db76d66a6712b7bf3e30e69463"
+SRC_URI[sha256sum] = "5fb2235a9cb6ec07cb4786c4066b151359c301324d54aaabf69ae7eef35606b3"
 
 CVE_PRODUCT = "hplip linux_imaging_and_printing"
 
@@ -35,7 +35,6 @@ EXTRA_OECONF += "\
         --disable-scan-build \
         --disable-gui-build \
         --disable-fax-build \
-        --disable-policykit  \
         --disable-qt4 \
         --disable-qt3 \
         --disable-dbus-build \
