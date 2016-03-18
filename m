Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id BD8C760132
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:20:19 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id qe11so31906064lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 04:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8EemsgKeTd/13aR2oTzFT/zMAy29VbvxeLJmYyEQt5M=;
	b=uz2L07Qh5TmbGiyI/ZJfPSKnot/XXka4lMePM+JCkM5E6gJNbX19lNAHh4iFi/Rm1U
	j11RvTAu1sq2I01mM+ZajQjrd0klOupWncXtPEtGvuTHhtSHeLZjx65byqUJn1itBWaw
	WOYG/LyUpAcJLCQQQueEfMW9FW174EPiMTflXFuAuHIOW8EAejNgQaLAVjMOdyCvF47/
	V62NLlV64suwBsQbU0TxmWbLYSPxcqprKMi9rBtb8lw8/xJtUcsIc9LuM7xFibUZoQ2U
	Goy6GbgVGkWmpg2FERhQC43Zj7H4l+Xi+mEySxEG4MRdgyTUny83orrYErak5fRlDb72
	iwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8EemsgKeTd/13aR2oTzFT/zMAy29VbvxeLJmYyEQt5M=;
	b=KVf4p6vKUc4qz00/K6XNAHnIz8L2/yAfnuLHH8R5qHXMWFIcyOPNkdz4WQ82fxvsPI
	4oa0lA+3WFyN0pqyjpG/7Xd6ZDaj/PCYSTKR9LrfMMowOeSo/B/MYzIOoQCKlK2+JoUi
	Zc+fV9kxMXSBJaBIg+7DhMjN9jwXH2LEunmLAog+k+qIoNiVmsEaD0jSsglFN8m53T8R
	IL6mNu1rfZTf258jupFfts0a9Nbj87cdQTIBpk14qq84pZbmFQeTuebYPtOTwNxMkd5v
	xB2yfPjjW4ZEbQeXo62kRhWWhcgQUvy354uvAipKvI0fKUZKCziHedH417ah5WL2CU85
	DNAw==
X-Gm-Message-State: AD7BkJLh3OYdXou3gguQt2kMhMABwShP2gFwRr6fr844kWJhRJfBeHBpKl6WU+2seHds5g==
X-Received: by 10.112.163.135 with SMTP id yi7mr5468908lbb.122.1458300019499; 
	Fri, 18 Mar 2016 04:20:19 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	pi5sm2107256lbb.41.2016.03.18.04.20.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Mar 2016 04:20:18 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 12:20:13 +0100
Message-Id: <1458300015-9666-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458300015-9666-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1458300015-9666-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v3 2/4] opencv: Update to version 3.1
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
X-List-Received-Date: Fri, 18 Mar 2016 11:20:21 -0000

The first major update in 3.0 release series

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} (97%)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
similarity index 97%
rename from meta-oe/recipes-support/opencv/opencv_3.0.bb
rename to meta-oe/recipes-support/opencv/opencv_3.1.bb
index f6c4ca8fac16..b8fb6a51376f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -10,15 +10,15 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
-SRCREV_contrib = "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
+SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
+SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
 	   git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
 
-PV = "3.0+git${SRCPV}"
+PV = "3.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.0


