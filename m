Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id ABB7470626
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:46 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so4695745wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=eX3q7k3lS8UGyM+RfCEvZ+tTHQ0W59h9LMT2lq02Ctk=;
	b=flXjI3+QuEnMyi/28shNESuZviGHZs2LM1nbYKM5gJK9Tu0ZWdtJbVn1slhdMvkW04
	yUZ94SCd231sZi0DFziEWYRDHZ3skETJOo1qbRNqrHwphzaKdcpf2nJOLwKJ2uL/DeYw
	blWHzeMPTr6vMUkGK5QMRK6wG9AVj0HitLEX9p6ClWUTEgUFbduaeGF2Ouaxolvjb8Wm
	98cQBNJTd/7vVyn3duKHN0fK0022Zlab5x0UIAiTxa8rWa9dVTxqibybjLlXSmKX6uZP
	VWG86OG7Kaf2Rh+exTjiyy+9pqgTFSOOektRdTFpRzzPBOYZFv9FjF5FX8adv64Pvhc/
	Fndw==
X-Gm-Message-State: ALoCoQmytTNu+AK71fwRhAddJSyokc825cz9lk6JjUOPI2f1ilXmWT4lNb/pITDNfV1EWaB3sxHF
X-Received: by 10.180.94.166 with SMTP id dd6mr6577826wib.33.1405441127328;
	Tue, 15 Jul 2014 09:18:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:34 +0100
Message-Id: <03013af37177fc05ac28bf57c4ed7d348b0bacd3.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/7] libmad: use "foreign" automake strictness
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:47 -0000

libmad doesn't want GNU-levels of automake strictness so tell it to be
"foreign".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libmad/libmad/automake-foreign.patch                   |   12 ++++++++++++
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb           |    1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-multimedia/libmad/libmad/automake-foreign.patch

diff --git a/meta/recipes-multimedia/libmad/libmad/automake-foreign.patch b/meta/recipes-multimedia/libmad/libmad/automake-foreign.patch
new file mode 100644
index 0000000..3e54424
--- /dev/null
+++ b/meta/recipes-multimedia/libmad/libmad/automake-foreign.patch
@@ -0,0 +1,12 @@
+Pass foreign to AM_INIT_AUTOMAKE so it doesn't enforce GNU strictness.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index e602fd3..e075b86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29 +29 @@ AC_CONFIG_SRCDIR([decoder.h])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 58d68a6..30937eb 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
            file://add-pkgconfig.patch \
            file://fix_for_mips_with_gcc-4.5.0.patch \
            file://obsolete_automake_macros.patch \
+           file://automake-foreign.patch \
 "
 
 SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
-- 
1.7.10.4


