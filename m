Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9F077D47
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:12 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u2so32068064wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QAOIgBolYgbeUgp0x81YLcIlxkgMJJ6MavE/E/u/knc=;
	b=UJk0G1epYbApy0ZYp+ROAeLaXtveHmhO52SKuOJBF6snoO/c1Ac6/z/Xh2o9qEw5iI
	hmVAbWPDCB58+RGJbH6EIrRaPY6uuLWMHQLrm+hW1Rq3U9cesLeuX8XN5a7n7wYZOuvU
	Vb9VMK6HySwsxqQZ1p3oL2Fr/AcpfO7D5zHeUhRcdpp1ARjwkX91WOz7m2YJ9kkciutP
	oiLa121nGbLUu/+k4Xq/mFQlrqjvUTme4HXNRRszINdStpsRju8plmb1alRuv+snudll
	ojRpgdR/PVda5bpMDTAXBE8rW900iEqYAdX3RFDm4+jNsfjbeiC3AxT3+0SUmkQc92sT
	N65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QAOIgBolYgbeUgp0x81YLcIlxkgMJJ6MavE/E/u/knc=;
	b=K2MFLMglFY+i4SUZxBUy69NLbBALuOeeVq0zeGYfjiQ73n0NBPY2bL9mzVqE17//TX
	qkwQLTJEbzU14GYQbZJ29CKznZAArqFM7BhQBK7isClzIHz4IPmnRwOHOCSg1kFX6yFF
	f3WumOmoZqMzdKnvw0gt4QrwRF4LH6m70x1kkUMm1yi0+R+RzXfE7fo+OAhwXUdJLY5+
	CwD5ck2S1+yFSVTr4vYexC2ea+gaK8Bab5P/uQ4+nqBEwdEEVms7g7tCeeWVu3nItPKQ
	PkcmOkhcpxsXFM6jhGqeDbKc9JNZIFQyEiw+X8yLZ5Rm5rpkd/5IY3ur2302q1Itgz5O
	f2Hw==
X-Gm-Message-State: AN3rC/64TtlRCjXCGel+UkG8qC+LLcaKkHKKOZ0UaRy2X4eXGm9nIrwv
	aIYEw0jX+MkicWWq
X-Received: by 10.28.211.73 with SMTP id k70mr21325244wmg.0.1492027033816;
	Wed, 12 Apr 2017 12:57:13 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:33 +0200
Message-Id: <20170412195638.3243-25-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 24/29] libass: update 0.13.2 -> 0.13.6
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License checksum was changed by some back and forth [1-2] - now it is really
ISC again.

[1] https://github.com/libass/libass/commit/9422a80578bc44f662f07edf723f85239a0579f5
[2] https://github.com/libass/libass/commit/cde05e0716ef2b74530633d463ad7f6d0b94ac61

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/libass/libass.inc       | 2 +-
 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb | 4 ----
 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
 create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb

diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
index 85ac873..4bc3db0 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/libass/libass"
 SECTION = "libs/multimedia"
 
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ae98663bac55afe5d989919d296f28a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 
 DEPENDS = "enca fontconfig freetype libpng fribidi"
 
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb b/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
deleted file mode 100644
index 8cf2bd8..0000000
--- a/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-multimedia/${BPN}/${BPN}.inc
-
-SRC_URI[md5sum] = "1c8cbd5751aeb192bda04a65d0464fd9"
-SRC_URI[sha256sum] = "d698d0a6adca7c36c5a86b540d67b05bfd36cebc3c351ab7646497c43fe1face"
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.13.6.bb b/meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
new file mode 100644
index 0000000..40ac0f8
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
@@ -0,0 +1,4 @@
+require recipes-multimedia/${BPN}/${BPN}.inc
+
+SRC_URI[md5sum] = "daa6cfca437c0776af5f79750cdd9b4e"
+SRC_URI[sha256sum] = "f8a874d104e3e72e2cc057e5a1710c650b10367486845a26e5ff28ed7a912c2d"
-- 
2.9.3


