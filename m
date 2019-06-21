Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 19D637E7DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 22:05:14 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id h10so7290970ljg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=E83UfHsUwX8J7rKizO/jhRJM4mNhkQKi/+4sRYP74Qw=;
	b=cQs5e3m5yTNGU6doOOTVIq1usHaOSVYmrm+zCJl73kZ0NlwR7cTTvU2YTt6VEoJJ8q
	EUkLSho1t9QuFemOnKKEUdet3UzX2c2YGEmHftnqBvQHU46ZIfEY8zUSJkbAN9oC3ZGC
	39tzAQQk3JykLNMoyb6M2MfhlDrfJsAt5GTirvmct1tMIvnqgMfTXVibUBM70fnapnvJ
	m1sKw6204f/rgYkZLo7Finuy4lSFA7TG42Hk1RkFxFRDV6R2CcRbI71K5TTrDMNYEufF
	ZU4lmwGxO4mJVSbDyNukFZlpP1mMcypUAQ4FlJ49dKP7pZMd6mz1NRjxHml7yOZItM04
	E91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E83UfHsUwX8J7rKizO/jhRJM4mNhkQKi/+4sRYP74Qw=;
	b=RDKKNn9P0aeRf28mBPTh/n5lRb3eCnsQpgMf1XBitIP3nusx4BLnntekuWr0rRcGuK
	pA+FKurYy9FanpssPYJGLJ8u2ySp4X+5VtiAz1L1NOROPIddcflq51V8pq6sN+uGoM2k
	s6fcebaYgSsn3BqQOWbfjGiSZA204nOJAhMRqk1k9iS1yxqk5Fk3ICfKT3LHksI1IlK8
	9N+jwadz2QxAM202lHQvVLLVfyHa6VTa2rZqxYO17RjugO8iCRNXzVx3OReU3GWwiHVK
	FBl3SWB1plgew729JnCVEcdxEr9HWEEMBq4bCGj/a6Kc2zeMVlmqgLKHNIuTSfndVWOL
	WVLQ==
X-Gm-Message-State: APjAAAVTm+vtnlh2x30K7LnYpW+KHdyzKH/UcArtzrMSdMhuY5cn8HQC
	/zobn3tlZa2V0MUslZ585uQ+k9gc8I4=
X-Google-Smtp-Source: APXvYqyj45kq9WNPKDInkfmPtdELhMxmqDpDn3ScWFvYG00N5PU2ouMe/uTUGogFEGZLBHno0vZ4QA==
X-Received: by 2002:a2e:8613:: with SMTP id a19mr12979334lji.163.1561154715369;
	Fri, 21 Jun 2019 15:05:15 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	e13sm552947ljg.102.2019.06.21.15.05.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 15:05:14 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2019 00:05:12 +0200
Message-Id: <20190621220512.30211-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nghttp2: update to 1.39.1
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
X-List-Received-Date: Fri, 21 Jun 2019 22:05:15 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nghttp2/{nghttp2_1.38.0.bb => nghttp2_1.39.1.bb}        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.38.0.bb => nghttp2_1.39.1.bb} (63%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.38.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb
similarity index 63%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.38.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb
index 42b437933..6077daf76 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.38.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb
@@ -4,9 +4,11 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
++UPSTREAM_CHECK_URI = "https://github.com/nghttp2/nghttp2/releases"
+
 SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[md5sum] = "45b47086ee6da8171e11887c1665f275"
-SRC_URI[sha256sum] = "ef75c761858241c6b4372fa6397aa0481a984b84b7b07c4ec7dc2d7b9eee87f8"
+SRC_URI[md5sum] = "02b015cb178c46f27dd87228e33db35f"
+SRC_URI[sha256sum] = "679160766401f474731fd60c3aca095f88451e3cc4709b72306e4c34cf981448"
 
 DEPENDS = "libxml2 openssl zlib jansson cunit c-ares"
 
-- 
2.17.1


