Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8130165E08
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:48 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so3269824wes.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=tEKFOSq4bpdaWxlc+n+t4Rp7lXJQtVdOAr1UaVDUpP8=;
	b=Ttrgtr4dzgSkvffmhlAELLdjBY0TjNWQl0CGjapXWcT9es8VC8fFeyJ7i8BWpltU9B
	GEv8i9a0f0G0VNgX20IShqcz2Rvr/Isl1FWn7suWYKzbOBKFSC0bTev40HGzYEClwiat
	Pt0nTtuSajsrxA1rdNuhNnUstEb+sJmvNLZwhSOvqvIBsAneI4LQyACt6uq8KuCaubEv
	eIAwA3267XXhzBtXkPNRbKFA3rEIpDR9IELaa/j7ks0MWv7SdDM/HYHb+wZjl3+iHDLl
	70Md29Y3OMflDLj2qQ4jcz3r86JuHKNnpBwQBuJAq4rpuebn+0VdUGTa2lOZEXLcb4ND
	qOBQ==
X-Gm-Message-State: ALoCoQnx+0XTX9jZS41vmVHPy6NucHbMcRVkxeILePSmNkA7YXX/MBDkCZrOtr0P8lkxe9PG6L6f
X-Received: by 10.180.206.15 with SMTP id lk15mr6624459wic.43.1405441130057;
	Tue, 15 Jul 2014 09:18:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:36 +0100
Message-Id: <f08f3cc84a55499e6183006460fc81303890bdf3.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/7] ltp: use "foreign" automake strictness
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:50 -0000

ltp doesn't want GNU-levels of automake strictness so tell it to be "foreign".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../ltp/ltp/automake-foreign.patch                 |   20 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/automake-foreign.patch

diff --git a/meta/recipes-extended/ltp/ltp/automake-foreign.patch b/meta/recipes-extended/ltp/ltp/automake-foreign.patch
new file mode 100644
index 0000000..c3dd891
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/automake-foreign.patch
@@ -0,0 +1,20 @@
+Use foreign strictness to avoid automake errors.
+
+Upstream-Status: Submitted (https://github.com/linux-test-project/ltp/issues/16)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 9f397e7..fc57957 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4 +4 @@
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+--- a/utils/ffsb-6.0-rc2/configure.in
++++ b/utils/ffsb-6.0-rc2/configure.in
+@@ -2,2 +2,3 @@ dnl Process this file with autoconf to produce a configure script.
+-AC_INIT(main.c)
+-AM_INIT_AUTOMAKE(ffsb, 6.0-RC2)
++AC_INIT([ffsb], [6.0-RC2])
++AC_CONFIG_SRCDIR([main.c])
++AM_INIT_AUTOMAKE([foreign])
diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index 995d617..30761fd 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -25,6 +25,7 @@ SRCREV = "f4c3bfe1eab51eb72caeb0f3336d2790c9a8bd1b"
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
     file://ltp-Do-not-link-against-libfl.patch \
+    file://automake-foreign.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


