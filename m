Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1465.1793731014497753866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y5d/PC7H;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36661f953e4so6784121eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731014; x=1794335814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aB3Sw0afZZUPjQKCcyoLbUsOinTWotTxxM+kRMjookQ=;
        b=Y5d/PC7Hmh5pPvSldBS3v96U9D55L/llFXE+BFp1PB1/oV5DlfduPWDDrc4Y4z+vrB
         ubws4/6N9KfksaEC6lmqcrDYfuhkhmuj5H9kTDac0varbd+t1LM1X//0kElWs8j8EZ3V
         2NGSNYBJzbEfvuvwUrCekq98gXCbDgXOmTQAU2BozlIarcKwXsfIWpp8ht+H1kK/QMWT
         udSjR7rHGSFVYpk50GQdQk8AMBgCX7sLaRQGMvGfiCBhnnQY6XYv+YjlzA2335zPFvsi
         NbR0TVBe1CbHtYtNLSeziEum+LZlDfeB1wPLliG5vMc0i+aGlcxbT6KRPdEqTVDZ77fZ
         MVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731014; x=1794335814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aB3Sw0afZZUPjQKCcyoLbUsOinTWotTxxM+kRMjookQ=;
        b=enVslzf4uX5qDSmtkYiNZavWZRop/KdXiHPbateLNS6LmvuisH6zrHeGmsmj9ph/oM
         MnQzCY9E36fpmm734YHM7JXTxc/TFiUilllq/5K1L/OKzuwPom8LyRdSFQS8E3vheUhK
         LHE6h4SneFEeNwfyBddNZkxhNTe9LyPoiaeWBLLhdIN9COjMdqrWIx+4Lnsx/PJGg32m
         iUHtfw1xKvo46vupSGBOfXgSXAjpUMdCii58KHmrozzlHBUpa1eHTLHcbM7W+/dtB48M
         sxBJrqYp23QMlLOjtpT207DFtHDD8tHyvmX1mD1xMFhr+GcHwkOAgBOFYu3ohcDeKmJ7
         lwhA==
X-Gm-Message-State: APuU4Z+soGfC5zU2TnECqY/5Hi58ldDcP1wM/Ey/zQ/u1gWyinDz+E0d
	rRRaz3hC9kEStqK0v7eZoVcTtZF57dW3IuYImA92g9+1MgZgHrDort1tNtLN0Q==
X-Gm-Gg: AYBFou1Rup2OAn4s/lwCy34bi7Lczxzy+A0PT+puVZPduLU3/gfDd7k+3XT93KUOCcK
	xg3c8DFmE9q/f+4vKhzHiqLtPdn5GW30dTVDPNHHu12x23bslGMh0iIVvgvvDDOREc3vB1R7ylV
	Q4i4bzwiE2r9DmMT7gRBi6jjNRY1ki71hAnNvrm8kr1X8w1g4iPjliMjCqSHx/TVeI+k6OJLME+
	CSNhoJz0u3hY9P5mVK7k1guaf47+h1lMPZnkbgALR9fkSuZ862eNmFc6ApbBuSDoKWacdbUitqQ
	OBW6FmAaO4adpzyuIbS3nich6Yo6ssNtoJYUF9Pq8363TfRZV+4GuVMH3coq+irwazhso1wD9cB
	lItfvZaKJAqCBylDMUl65XovHv1C9F8zCNwgkKEpsv+I0fl4wCobjYG8UnAxfbXFqPVx8ZKOh6j
	S5HRlCDhxHYq2/lwYhzGgk5KAe4yslMB9T7C6vsaDqp6Gf8ZGn1PjazC0oRVlHfocUS1Vsb8hBi
	/ssm+j5C5tKCtCjJARx/aP45u7a8EI0HuuIRondxeF15P5O9/Fq8HB4X1NKF5VzjxWX2iFlVlzT
	9xhi6olb6tz2CFy/f2y1ma9H8hzUVjL6AUcXn6T1ztdGeCE3ZKOHiiH2l4Hkz5vdT1PJUVyU4Hz
	7ZCwcVgw=
X-Received: by 2002:a05:701b:464d:b0:1b2:3497:5998 with SMTP id a92af1059eb24-1b2349759cfmr8004898c88.36.1793731013540;
        Tue, 03 Nov 2026 10:36:53 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:36:53 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 4/20] squid: upgrade 7.7 -> 7.8
Date: Wed,  4 Nov 2026 07:36:24 +1300
Message-ID: <20261103183640.919438-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131802
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refreshed patches for the new version.

Changelog:
https://github.com/squid-cache/squid/releases/tag/SQUID_7_8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...l-remove-reference-to-nonexisting-directory.patch | 12 ++++++------
 ...-make-squid-conf-tests-run-on-target-device.patch |  2 +-
 .../squid/files/Set-up-for-cross-compilation.patch   |  4 ++--
 .../squid/files/Skip-AC_RUN_IFELSE-tests.patch       |  2 +-
 ...uid-use-serial-tests-config-needed-by-ptest.patch |  4 ++--
 .../squid/{squid_7.7.bb => squid_7.8.bb}             |  2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_7.7.bb => squid_7.8.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
index d5c83a8834..69889f587f 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
@@ -1,4 +1,4 @@
-From 9c3718bce43146f219dec3c3cd47e57a6b418a19 Mon Sep 17 00:00:00 2001
+From fb86570aaac63c4ababa7bd572ecc265fe994dd6 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Thu, 7 Nov 2024 22:04:40 +0100
 Subject: [PATCH] libltdl: remove reference to nonexisting directory
@@ -25,11 +25,11 @@ Upstream-Status: Inappropriate [upstream ticket https://lists.squid-cache.org/pi
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libltdl/Makefile.am b/libltdl/Makefile.am
-index aad98e2..8a9539b 100644
+index 9153be5..f2f3612 100644
 --- a/libltdl/Makefile.am
 +++ b/libltdl/Makefile.am
-@@ -29,7 +29,7 @@
- ## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+@@ -26,7 +26,7 @@
+ ## License along with GNU Libltdl.  If not, see <https://www.gnu.org/licenses/>.
  #####
  
 -ACLOCAL_AMFLAGS = -I m4
@@ -38,10 +38,10 @@ index aad98e2..8a9539b 100644
  AM_CPPFLAGS =
  AM_LDFLAGS =
 diff --git a/libltdl/Makefile.in b/libltdl/Makefile.in
-index 9929557..c77df2e 100644
+index 5923f0e..14d1eb3 100644
 --- a/libltdl/Makefile.in
 +++ b/libltdl/Makefile.in
-@@ -448,7 +448,7 @@ target_alias = @target_alias@
+@@ -454,7 +454,7 @@ target_alias = @target_alias@
  top_build_prefix = @top_build_prefix@
  top_builddir = @top_builddir@
  top_srcdir = @top_srcdir@
diff --git a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
index b42f77bc74..18294bced7 100644
--- a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
+++ b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
@@ -1,4 +1,4 @@
-From 9f6eb086ee1d525cf404189893fccfb8a03235bb Mon Sep 17 00:00:00 2001
+From 2cae2beb8b6f4f9c88d5b3e7d05fadd6d8addf4f Mon Sep 17 00:00:00 2001
 From: Patrick Wicki <patrick.wicki@siemens.com>
 Date: Wed, 22 Nov 2023 15:35:44 +0100
 Subject: [PATCH] squid: make squid-conf-tests run on target device
diff --git a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
index a4cb5f40ef..ad9db1a9f4 100644
--- a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
+++ b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 19c82bff799611303f2985a2d317662b0529b24d Mon Sep 17 00:00:00 2001
+From 746d7c7dc462b1c77b8043e82c892de8bccf27f8 Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Wed, 16 Oct 2013 16:41:03 -0400
 Subject: [PATCH] Set up for cross compilation
@@ -15,7 +15,7 @@ Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index cd7fbfd..850fdaf 100644
+index 22e86b7..f625147 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -29,6 +29,7 @@ m4_include([acinclude/lib-checks.m4])
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index 66987e02e6..9934d9a6e8 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -1,4 +1,4 @@
-From 822fd6630617040a713df5eb876d68051a716a0f Mon Sep 17 00:00:00 2001
+From 4fbe7889eb6276dfde8b6be12da0cd8f2362d4f9 Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Tue, 14 Oct 2014 02:56:08 -0400
 Subject: [PATCH] Skip AC_RUN_IFELSE tests
diff --git a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
index 21439a1334..19ed4e3bb4 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
@@ -1,4 +1,4 @@
-From 5ce613e9f0c4725aaa82d9a62f76c809e375fe49 Mon Sep 17 00:00:00 2001
+From 0635fa18502c0f63e528feaea0f8034a76792ce2 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 19 Jul 2016 01:56:23 -0400
 Subject: [PATCH] squid: use serial-tests config needed by ptest
@@ -14,7 +14,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 850fdaf..10968b3 100644
+index f625147..e7b5130 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -10,7 +10,7 @@ AC_PREREQ(2.61)
diff --git a/meta-networking/recipes-daemons/squid/squid_7.7.bb b/meta-networking/recipes-daemons/squid/squid_7.8.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_7.7.bb
rename to meta-networking/recipes-daemons/squid/squid_7.8.bb
index 7649342596..216954256b 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.8.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "e3bd613b91b1c498ec2992276063342a85cd6edddd5521294e04f44bc055da9b"
+SRC_URI[sha256sum] = "52cd716f568faccbd3e237d77fd3518cbfe1548dfa2ebd8871b5a112e8ab0063"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://errors/COPYRIGHT;md5=41d117978dbffedc893e8eeca12537d0 \
