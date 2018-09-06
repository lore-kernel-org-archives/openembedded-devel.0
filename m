Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id BBC007972E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:38 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j26-v6so5610755pfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jeQl3KmAz/MP4o1U4TikFW1kFZ+qr3/260TN4Rftk2Y=;
	b=leMmPh79w1I3CGKc4t6bq96Z3A+zBKR8kPwgYBe5thOUkOGkDrTNTsv9lJyC+Sii2A
	cYlpAVtgUK9d+mIgsBcV7pJOWxdExzJHr407oSsHBCZAU2brd5wyahiKwarlyZoxl9HT
	k6RKOqdFH1ZM6tCzcUdSbxjBMy2vaCM1380et2E1z3zpPUEx/gUa0tzEWjS2H98//jm8
	jeiimXj3Wfvjo/HuoWKXdNSDcF1nh7piARUNnNcs5j8oTI5kaETs6RjEDno98WMMeIff
	Bmtr93Pvi1b4TBP8MusL9KMO33hGVDnwEqDyt9GXE4XmSTJ9Cmm0H75XKDq+wVtLRH+S
	eMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jeQl3KmAz/MP4o1U4TikFW1kFZ+qr3/260TN4Rftk2Y=;
	b=AorltvLcGaXqJqU/WyWVWU5Xfv0l5wsuh2AohigBSQUeQtm8kJYsqW/xVNY/jqDUjx
	6xIMzAxXvgud8MW525E+ytM5ZQ3lHEBup2sTycvJOp9ZfZ/Ew0ur9QYZ+Y+HGUfU7Coy
	NJmsIZeu9Xcr5XrJboI/ZHBASLEDnbvoJfxiscOoJhu2pNYHUpV/Ry0X26/kSrpKHH+q
	iuRSOOQuFumNV8bybwMORoxMHeRUU9j7EWa3GZMOV/oPT4w1urCx1Idvo9MLDARBeCST
	KUI37kUO7WmJcBo1XWvpfJB3LHBE6DXF53tTuLg2iJLlxJH8StaBeXTKSDknu0U6px3F
	Ax6A==
X-Gm-Message-State: APzg51DLE8WwxqVVGNqFZqBLQp1hC/e9n7ypCqN7SWNX6rpCYrtxxD2O
	UbBED8aHFQKmM1WPgiWwprBafppD
X-Google-Smtp-Source: ANB0VdZuZBvFf0GlmEAubKweJq5nrLyQAkPTxoX4bwdEUlQJDFVdhZ/sRb7Tmy2QTOEN8wxyW1EiMA==
X-Received: by 2002:a63:ba55:: with SMTP id
	l21-v6mr3871670pgu.399.1536254559592; 
	Thu, 06 Sep 2018 10:22:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:09 -0700
Message-Id: <20180906172210.42551-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/17] vboxguestdrivers: Update to 5.2.18
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:38 -0000

* Fix build with 4.18 kernel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../vboxguestdrivers/kernel-4.18.patch        | 33 +++++++++++++++++++
 ...rs_5.2.8.bb => vboxguestdrivers_5.2.18.bb} |  6 ++--
 2 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-4.18.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.2.8.bb => vboxguestdrivers_5.2.18.bb} (94%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-4.18.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-4.18.patch
new file mode 100644
index 0000000000..93eaa3d6c1
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-4.18.patch
@@ -0,0 +1,33 @@
+Description: Fix build failure with new kernel 4.18
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
+
+Upstream-Status:Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: vbox_module/vboxsf/utils.c
+===================================================================
+--- vbox_module.orig/vboxsf/utils.c
++++ vbox_module/vboxsf/utils.c
+@@ -50,7 +50,11 @@ static void sf_timespec_from_ftime(RTTIM
+     RTTimeSpecSetNano(ts, t);
+ }
+ #else /* >= 2.6.0 */
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 18, 0)
+ static void sf_ftime_from_timespec(struct timespec *tv, RTTIMESPEC *ts)
++#else
++static void sf_ftime_from_timespec(struct timespec64 *tv, RTTIMESPEC *ts)
++#endif
+ {
+     int64_t t = RTTimeSpecGetNano(ts);
+     int64_t nsec;
+@@ -60,7 +64,11 @@ static void sf_ftime_from_timespec(struc
+     tv->tv_nsec = nsec;
+ }
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 18, 0)
+ static void sf_timespec_from_ftime(RTTIMESPEC *ts, struct timespec *tv)
++#else
++static void sf_timespec_from_ftime(RTTIMESPEC *ts, struct timespec64 *tv)
++#endif
+ {
+     int64_t t = (int64_t)tv->tv_nsec + (int64_t)tv->tv_sec * 1000000000;
+     RTTimeSpecSetNano(ts, t);
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.18.bb
similarity index 94%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.18.bb
index e00db4d7e0..2a4cc387f7 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.18.bb
@@ -13,10 +13,10 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://kernel-4.18.patch \
 "
-
-SRC_URI[md5sum] = "e731ea9c5c31096ec4c2a3bfba26665c"
-SRC_URI[sha256sum] = "ee2759d47b0b4ac81b8b671c9485c87fb2db12c097b3e7e69b94c1291a8084e8"
+SRC_URI[md5sum] = "d8e291525b84569356773eef507c49ce"
+SRC_URI[sha256sum] = "ed0a7efd56c7f39fae79c7ec3321473da412ef0d7914457b66f42679d513efcf"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.18.0


