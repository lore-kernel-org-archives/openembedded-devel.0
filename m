Return-Path: <ross.burton@intel.com>
X-Greylist: delayed 332 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 12:02:18 UTC
Received: from mail-we0-f176.google.com (unknown [74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3E74A6FBC4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 12:02:18 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q59so10840816wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 05:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=IVX2ZUGwoqxcNHPHWK4t67J297yQeQ6NQ5ghWtNMrn0=;
	b=eSrPlyhd/3RbPhZe2Tqhn1zIFwphWPnvR6h1toU8QJldbxYaJL6feQCUpgnYu2nDIq
	uVIpJpEV1UNSdhGwSoOTFlfKHZoyeVg7YRQMmD0nmv2pYi1KJ0bXdLYFQG8CWZIOq2ky
	ShDy7ymVgiD1QbEUswLcgEjy0AxA+5GACvdgJAqcp2FeNE/L5K+WMzKI7L2zxsXkObLT
	sMWqdIvWsN27BxfxR9lcqNjJ4VYavUuBnqTFaMFmDzB/orqO/Dhpv75k94BCbw2M0piY
	K+7JqACJCkCbJiglxkfy/dz4ziAUWXNaF+fu4UwwJf8Y0tK87T6Rtv4thZ3iy7+bafud
	rPzg==
X-Gm-Message-State: ALoCoQmeo/2eTx9EBzFTSMI8Mbdn3S67Y5dnn53/VWvDsmdp2KRuDjiT1XzgIqBQ7uxZBcqcySEo
X-Received: by 10.180.89.241 with SMTP id br17mr48597471wib.0.1401278211080;
	Wed, 28 May 2014 04:56:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bj2sm16345631wib.3.2014.05.28.04.56.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 04:56:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 12:56:26 +0100
Message-Id: <a12ceb971fefe2b2f412f46b82c0d5ea6043ad62.1401277810.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
Subject: [PATCH 4/4] autoconf: don't disable the autoheader warnings
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
X-List-Received-Date: Wed, 28 May 2014 12:02:19 -0000

The usual autoheader warning is due to AC_DEFINE variables not having a
description.  This results in no variable being defined in config.h, which leads
to code behaving as if the test failed when it actually succeeded.

This patch was introduced to OpenEmbedded back in 2004:

http://git.openembedded.org/openembedded/commit/?id=5eab06d132cb2895fd579f5cedffbb54c27794f8

There is no rationale for the patch so I suspect this is due to the warnings
being fatal and the submitter not understanding that the problem is more than
cosmetic.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../autoconf/autoheader-nonfatal-warnings.patch         |   15 ---------------
 meta/recipes-devtools/autoconf/autoconf_2.69.bb         |    1 -
 2 files changed, 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch b/meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch
deleted file mode 100644
index 8ae6d5c..0000000
--- a/meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
---- autoconf-2.59/bin/autoheader.in~	2003-10-10 14:52:56.000000000 +0100
-+++ autoconf-2.59/bin/autoheader.in	2004-05-03 01:36:45.000000000 +0100
-@@ -272,8 +272,8 @@
- 	}
- 
-     }
--  exit 1
--    if keys %symbol;
-+#  exit 1
-+#    if keys %symbol;
- }
- 
- update_file ("$tmp/config.hin", "$config_h_in");
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index a2ecd94..5c652d4 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -12,7 +12,6 @@ SRC_URI += "file://autoreconf-include.patch \
 	    file://autoreconf-exclude.patch \
 	    file://autoreconf-foreign.patch \
 	    file://autoreconf-gnuconfigize.patch \
-	    file://autoheader-nonfatal-warnings.patch \
             file://config_site.patch \
             file://remove-usr-local-lib-from-m4.patch \
             file://preferbash.patch \
-- 
1.7.10.4


