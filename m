Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id ED28A755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 16:23:49 +0000 (UTC)
Received: by ykek133 with SMTP id k133so48111718yke.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VOIarHDc0NKkzwcWyI2NWC1kXhehiFQCPTJHrtH9a+o=;
	b=YsJx/+WmcarbmvTUgT7ZH0dmlIqI4wQwwi4LYKyaV4F4pjp/Zf3vtmULCSSy/RF9n0
	nIoBlDVif05lBg0k3n0Iqyn87EHNb/itzUjHHdVBbvdTkreQs0fcDRC2qFFvnIZy2kgf
	IXorVX5+YoN+isNFm5y9CbBfJtj2BH/xSOj7jaUKTRx1ylsi47CNcS2ZOxEu2mzJbep6
	oLV7x6KGe1wteSvBnpfL/msCU0Xg+NiDYBFVJsMgELuL3HsOTizBCS2/zlq+Xr4u66lB
	ygwuUginr23yRldjGdZfpbJGE1hiHpJMqKDtn8B8Jw3z0HWrudgDiJOsbYFC6lpIXC7H
	qqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VOIarHDc0NKkzwcWyI2NWC1kXhehiFQCPTJHrtH9a+o=;
	b=XYfYZk1deZHV6H3d2SEPJWxrIazZJOlAF1NTX06EEVmh+JcoIA+LWhfhd03SsCouFS
	j7VHc4rQBX7X2FF/BNMbAewry4Y+BMHym+wdg/32MmUQIi1gytTaMW+1luKDc5oCSYW/
	MFb8FTwLHv1cO33zGYje+b+3vVvO8I63TCMGIZSc41Z/oHGb2xsdFxTot7rJ3c92jJec
	BT+osinwngZAdKbR0Gr7jiYU7RnnBWZ1QWqPOWiO4i2EfuRuguDJ16woF6MXx2YeTNOt
	KPcCLZA76X7O605ZrCtqjI6aEVCxnR3hwFjTVdE4sc+TQEReggBVEnB4tFXpdyUHHS6o
	s5cQ==
X-Gm-Message-State: ALoCoQlYZSy+06i02vAE6OzbkGnWZ+OFBbn+pleAOusR0U6PZVHZ8B3uvBK7C7BvqLOoyTW1F+uD
X-Received: by 10.129.106.137 with SMTP id f131mr2311294ywc.143.1446135829496; 
	Thu, 29 Oct 2015 09:23:49 -0700 (PDT)
Received: from localhost.localdomain ([201.22.227.56])
	by smtp.gmail.com with ESMTPSA id
	u75sm1257039ywf.21.2015.10.29.09.23.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 09:23:48 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Oct 2015 14:23:33 -0200
Message-Id: <1446135813-13319-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-networking][PATCH] lldpd: Update to version 0.7.19
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 16:23:50 -0000

The fix-libevent-configure patch has been applied upstream, so we
removed it.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../lldpd/files/fix-libevent-configure.patch       | 39 ----------------------
 .../lldpd/{lldpd_0.7.17.bb => lldpd_0.7.19.bb}     |  5 ++-
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch
 rename meta-networking/recipes-daemons/lldpd/{lldpd_0.7.17.bb => lldpd_0.7.19.bb} (92%)

diff --git a/meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch b/meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch
deleted file mode 100644
index 42d6b29..0000000
--- a/meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Submitted [https://github.com/vincentbernat/lldpd/issues/133]
-
-Subject: [PATCH] fix libevent configure
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- m4/libevent.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/m4/libevent.m4 b/m4/libevent.m4
-index 275e5a5..dcd3309 100644
---- a/m4/libevent.m4
-+++ b/m4/libevent.m4
-@@ -45,13 +45,11 @@ AC_DEFUN([lldp_CHECK_LIBEVENT], [
-         AC_MSG_ERROR([*** libevent not found])
-       fi
-     ])
--  fi
- 
-   if test x"$LIBEVENT_EMBEDDED" != x; then
-     unset LIBEVENT_LIBS
-     LIBEVENT_CFLAGS="-I\$(top_srcdir)/libevent/include -I\$(top_builddir)/libevent/include"
-     LIBEVENT_LDFLAGS="\$(top_builddir)/libevent/libevent.la"
--  fi
- 
-   # Call ./configure in libevent. Need it for make dist...
-   libevent_configure_args="$libevent_configure_args --disable-libevent-regress"
-@@ -64,6 +62,8 @@ AC_DEFUN([lldp_CHECK_LIBEVENT], [
-   libevent_configure_args="$libevent_configure_args --with-pic"
-   libevent_configure_args="$libevent_configure_args --enable-static"
-   lldp_CONFIG_SUBDIRS([libevent], [$libevent_configure_args])
-+  fi
-+  fi
- 
-   AM_CONDITIONAL([LIBEVENT_EMBEDDED], [test x"$LIBEVENT_EMBEDDED" != x])
-   AC_SUBST([LIBEVENT_LIBS])
--- 
-2.1.4
-
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
similarity index 92%
rename from meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
index 47d3c38..7d54626 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
@@ -9,11 +9,10 @@ SRC_URI = "\
     http://media.luffy.cx/files/${PN}/${PN}-${PV}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
-    file://fix-libevent-configure.patch \
     "
 
-SRC_URI[md5sum] = "8cb74065956bc32a575ee5203b0e0fb5"
-SRC_URI[sha256sum] = "6b50b8aa47d1424a93ba3df55af26da41f7d5718db8d25e99291c4a6cd09c20e"
+SRC_URI[md5sum] = "4e924420e00ccd5dc289506f43221820"
+SRC_URI[sha256sum] = "aac11cb1fdc037709517372c70c9bf89c752ab8e5eaab9ce140b84ed5a0507c8"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.1.4


