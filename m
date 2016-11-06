Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 413A471A8B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:21 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p190so13518902wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rNqAGyMy6YHFZSbVj3LI/xBCvzmUvjM+dcsrYrqCnKw=;
	b=HioYjH2XMLfNnlBz2ypHaNxLmX7L7uE7oZZ0PvL5ilLQw2pC9j0x763h78GTaU1ga+
	Regg+p/KlReEDnUSwboNuAUcGsDE4D4/i24MLHxxGW/LdNFxlZQ8S9ZcMeA300O9HGGb
	Yw7q3SfiyJ7Rr6syjXOoWVppemiMsA1VPba0VNTm470LHhreCB7UlKi7LMfa2/XNJcGy
	+gtnQJt+FjR/W/4H6svm3NK5PzklIeyAnTZHp2MzaqNO9T0Wm/YccdnOI2CoN21tYarj
	JxD+C4BQT5KQJN7uaHrxSPYAmpTC0m9eh+Gu1TziL5NpcCPQZgkGnw3YextQz0meIoli
	2djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rNqAGyMy6YHFZSbVj3LI/xBCvzmUvjM+dcsrYrqCnKw=;
	b=G8r2mF3M6D3ZZvD8iQdHGVH99XqZwnNljuNe6KUPuTGwepZ1lwMAJZbBlcCdTAfaUT
	1Br3xnOOhNVcGFAsheu62PyYL05LZBS0iOqGYAAdUNVNPKFhJTlKKG90NVeog2NWK/nX
	+VEJln8Fmak2f6u/Ed/XBZn65QnG7BhsFw+0h5DCt47EA7Y3R8CR4/tgjwKVqKJD9gWD
	qODGLw1MLdiywPfIAicOqkNjin5wYYLyt0oOl8fOLzhcF+KAhfVxqjdxdX35PNuEOwvT
	XXEoqcKzxRrJ/wRPFhGcg15jlB2AWbXTXJ169CrhQew7+khNIgHhiOeGeVF49mceqgC6
	ghbA==
X-Gm-Message-State: ABUngvcTP+NGpdm4AqRMmkktiAYfSbosEEc8YWYadQ9cXA4/whLo27Nkmqh8d5GqlCRqVQ==
X-Received: by 10.28.218.213 with SMTP id r204mr3718806wmg.69.1478470042328;
	Sun, 06 Nov 2016 14:07:22 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:53 +0100
Message-Id: <1478470013-27247-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 15/15] portaudio-v19: update to v190600 released on 20161030
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{portaudio-v19_20140130.bb => portaudio-v19_20161030.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/portaudio/{portaudio-v19_20140130.bb => portaudio-v19_20161030.bb} (75%)

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_20161030.bb
similarity index 75%
rename from meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb
rename to meta-oe/recipes-support/portaudio/portaudio-v19_20161030.bb
index 8f2b0db..489f8ad 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_20161030.bb
@@ -3,12 +3,12 @@ SECTION = "libs/multimedia"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
 
-PV = "v19+svnr1919"
+PV = "v190600"
 
-SRC_URI = "http://www.portaudio.com/archives/pa_stable_v19_20140130.tgz \
+SRC_URI = "http://www.portaudio.com/archives/pa_stable_v190600_20161030.tgz \
            file://ldflags.patch"
-SRC_URI[md5sum] = "7f220406902af9dca009668e198cbd23"
-SRC_URI[sha256sum] = "8fe024a5f0681e112c6979808f684c3516061cc51d3acc0b726af98fc96c8d57"
+SRC_URI[md5sum] = "4df8224e047529ca9ad42f0521bf81a8"
+SRC_URI[sha256sum] = "f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513"
 
 S = "${WORKDIR}/portaudio"
 
-- 
2.5.5


