Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 84A7375A31
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 16:45:44 +0000 (UTC)
Received: by ykek133 with SMTP id k133so141092615yke.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 08:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3opy2hop9Nc1Q3GI+tLr7jYIJ+QBIhOrbdEW1Oqgsok=;
	b=zWzL2CVXidsIVvFocEqq0Pell5YSQyDt7ZQzUmoUjDF10/FIn0AJZJv0OEAXgwhcKU
	45xdpJBLaxaew73Yl2768/g90Sb1JJsdW2rLjctB6mRTNV20ACSCpzGTJW1xxlNDS5AC
	Tzf7Qz2lB+6ihBMyHIdYJUdNFAVUjyYOJoZ7GrIPcfWiK6VJ6smfVo3lBkj8A/fayoqs
	l9XohX6g62duLjUCy3Xl9sfPE2wE805bWWPRdeQubJx8oJ6Cv8/HEvh+42mFpyYWeFCT
	O0UA8CwQxW1C/wvWUQP1R+6goG+Zw+k9JkWjF2Y85af+E4OK5LOsUpiVt+mysIrqiN+6
	xwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3opy2hop9Nc1Q3GI+tLr7jYIJ+QBIhOrbdEW1Oqgsok=;
	b=YDyjoGXhlzvf1vUYP+isDYpU9p0ZzO/IbDfFGSU8vVpJLyoVtmrj9iSM+TArYTLo8K
	0MW2/uT92wTsjgCC/fb0a/WO2IfWSZ5SGOCV56QrPbAyTeiRg2QnAFl4rWiMIqVPmCgw
	EQAnoXSJZB17hLjyzd0iLe8yK+hsLG3nFXaUr2i9lmbyqMnlmBuUslaybWB9CuR1JeP+
	E4DWShbzbgqspZxKSrpUrPDx8n536fgBydU+bXAgBUhbg9A5evA7+IEMtrfoiZ0kA7gB
	yJK/U9tdig0l/ozmNs9RlFhcGaG70miu8OTEmcAT7CEAcwzlqi65WMYAWXTQ5CEBERgE
	ocow==
X-Gm-Message-State: ALoCoQmU2rIhmO8GaC/1YCgQEdeWnbQI7JgODuRxRqK6KSc5aamlWXGKurHMT6jjoB6fpzAt8Ghm
X-Received: by 10.129.105.213 with SMTP id e204mr6956073ywc.61.1446741944424; 
	Thu, 05 Nov 2015 08:45:44 -0800 (PST)
Received: from localhost.localdomain ([201.22.227.56])
	by smtp.gmail.com with ESMTPSA id n16sm4963199ywn.4.2015.11.05.08.45.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Nov 2015 08:45:43 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 14:45:11 -0200
Message-Id: <1446741911-8554-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-networking][PATCH v2] lldpd: Update to version 0.7.19
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
X-List-Received-Date: Thu, 05 Nov 2015 16:45:46 -0000

The new release has following important changes, worth noticing:

- fix-libevent-configure patch has been applied upstream
- fix for CVE-2015-8012

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


