Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7EAE577247
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so15684683wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uI631b3tAQf/T0fH0BtapH3YJhT+JgkyLYzIwVBMHT0=;
	b=eifYFgTIy9FzUnXRlMcKPFq4FrAQI/ZIDWHM7JX2oR6lftwSWAgJgK9wYS9ZRfVNdy
	7U8AZ8ITCjRVGAD4iu2Wqj2MvNhf7id3HR9IH4ApH4tqyl9N0UaGT1jKYQFk1Eb8Scl1
	LPIB7TROBdB7rnhu6E3Ncf2kgrvi0xeSU8bqbi9udYISlopVAEgpUibmnRHjkVoTq5vs
	tiRTyHDhvfP0S/nHjLkgjD0ZZwKkPVuPAh4POgTyVQGI2xh2cRGkccyCHCyvLBfEU3sA
	IZiOFc13zRRm+eNPFsZPcTZfg6EzX/DKVhLKST1wVVza9eKNNfbZc/JOcXEWeHLVAhlU
	kqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uI631b3tAQf/T0fH0BtapH3YJhT+JgkyLYzIwVBMHT0=;
	b=fzcGbKMtcBZjqgLlBQHyl/jtzG6GOS+vzwRN8DzgEdswAvIm+2wLqJaWPWFFR1GQP8
	YzM86ADrOG7nPy4nLMehUpmY+EvfNpanbuNAowG0ZFdlS9mzwUcdkRgboKU/CYiE6kkB
	qtJb8AvR34wcjciAQFZHy2v9JBR63RTWY1R2e+X+ym6QXyA01hNh8v/DiCRDeJO7J/cL
	k935lufiGdqYnen91AtQ3BiSLUNNjUVh367LJdIBi0IRhwq+RA2F4D9IgzQv3ptmnVa/
	Uy7xq8cgqrsAC+twgOWYJhgmGUEhkTNnfjF4qAkj5pwk24glnsibZHTouDlELv+FRjyM
	n1Bw==
X-Gm-Message-State: AMke39kfaoegHtiURqjt6J4c01SoceNj1RalicnQw22KAO0LINuk+w238iYEk5Ho69YGrw==
X-Received: by 10.28.5.70 with SMTP id 67mr20816785wmf.32.1487614071670;
	Mon, 20 Feb 2017 10:07:51 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:53 +0100
Message-Id: <20170220180700.29836-38-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 37/44] gst-plugins-gl: unblacklist - gstreamer is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb          | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
index 62a6754..6859f33 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
@@ -23,5 +23,3 @@ EXTRA_OECONF += "ac_cv_header_GL_gl_h=no"
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-apps = "1"
 ALLOW_EMPTY_${PN}-glib = "1"
-
-PNBLACKLIST[gst-plugins-gl] ?= "Depends on blacklisted gstreamer"
-- 
2.9.3


