Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F37A3719CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 10:34:39 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p190so11530207wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Htzu+pFjiX7sxLxRfYjxLC2C+oyZmDReV73QPus2TEc=;
	b=ea1KzfYIMfwVCytfZFkUWYYdV1jxgLALX7HSqij72+Oft4d2b1veZwkk9JY5GTANYh
	LW6uXoka+SEc3cyJLGmzdZ1HGJFPyLypCdryWt8q3ZLe+GRO/xy7UKk7d+awgTg6e9j3
	q/tT9JyxKAD7+LVlBjOJW4d8icvZIPd9Hk26OgcIdZj8NQVWDC1HsLpouHPGLZ+eFN17
	jwCx1Iuw9W64RORxg7bLI7lr/4EydwYbSEGMpDQOGa+1oH9TRT/1scJRrvNrVszRjeBw
	YgtoYqRHuzL9+VhbByd+nZa4u2cM4dyZOL6xJ5irzpmCnN8kGAjDG8F5m2cbH6/G5GUo
	1+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Htzu+pFjiX7sxLxRfYjxLC2C+oyZmDReV73QPus2TEc=;
	b=Vr+GBSmSEQXOlCz/sQC/CG5B4oC4vTvVKC+KthLEBJn7M4Rh8rbFLbdTFmmZ6ESB6R
	ZGATg4b9GidUG8XYMJBmODsdTmakKLQ7Nm4oL79T2+JnaMl1a919LlkFcd3qjPaJclW1
	czaSPKHUM4dCxTxk6rL1hIs8PaMOAmXiK1gIH0f1t0vV1cS8eET7ZRjAYFUp46lGRO3o
	8O/kDprySo06r9IE5SQfGTDrnqYOf1LppRKAnL3l2Dgk1cEUap8z1V48q+m/U2eHwVii
	Xbw2m5iyrK/lTNcJeDyyivhmqeGh2w44x/gbdaE/WAX0jHyZNfGb01TF0LP00tnTXg+L
	f8+w==
X-Gm-Message-State: ABUngveAzdtzEGaLObBDlOzmkQlYlKoEH9uXcAB8aToGGcGI9OB4RMXprBQpEjbuD5gXYg==
X-Received: by 10.194.188.83 with SMTP id fy19mr21412624wjc.227.1477910081034; 
	Mon, 31 Oct 2016 03:34:41 -0700 (PDT)
Received: from neopili.uam.es (vpn236.remoto.uam.es. [150.244.109.236])
	by smtp.gmail.com with ESMTPSA id f3sm3497239wmf.10.2016.10.31.03.34.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 03:34:39 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, erkka.kaaria@intel.com,
	bkylerussell@gmail.com, daniel.mcgregor@vecima.com, maxin.john@intel.com
Date: Mon, 31 Oct 2016 11:34:34 +0100
Message-Id: <20161031103434.932-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161031103434.932-1-ricardo.ribalda@gmail.com>
References: <20161031103434.932-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 2/2] openjdk-7-release-03b147.inc: Ignore deprecation
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
X-List-Received-Date: Mon, 31 Oct 2016 10:34:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

readdir_r has been deprecated since glibc 2.24. As openjdk uses this
function, a warning is generated during build that gets turned into
an error when -Werror is used.

While the readdir function is suggested as an replacement, it has
slightly different API. The warning is ignored instead to prevent any
unexpected breakage from patching the offending functions.

(Note: This is just a port of 0f127a49696 from Erkka Kääriä for openjdk-7
, all the credit for him)

Credit-to: Erkka Kääriä <erkka.kaaria@intel.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/icedtea/openjdk-7-release-03b147.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 068572959fa1..1d054ffe35e8 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -7,6 +7,10 @@ FILESPATH =. "${FILE_DIRNAME}/openjdk-7-03b147:"
 # Force arm mode for now
 ARM_INSTRUCTION_SET_armv4t = "ARM"
 
+# readdir_r was deprecated in glibc-2.24. Ignore the error for now
+# NOTE: When updating the recipe, please check if this is still needed
+CFLAGS_append = " -Wno-error=deprecated-declarations"
+
 ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
 
 ICEDTEA_PREFIX = "icedtea7-forest-2.1"
-- 
2.10.1


