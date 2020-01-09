Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DAC8D7FED4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 16:21:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d16so7987726wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kSIcW1wlDT0WNGr9LHOACNjsr+SlDe0Gkja5VxXh8IQ=;
	b=V9sqk7POlmSkShEla43X9aOBG6hNiLa8KKf0vLZLj891Qxv3IbWqa6Kv8Z/nl2qLZ9
	BD1mX8/R2ahAPf2T/mVrZdd5P73MnNURyHUKkxDm8oHO0EL05BbttyDi8Q/i1xeL6mAE
	T3V5WAPxotAI3FLqX5jR281pjfMRxdO1kmQS9AXZFcJdjV50zekS4qaGtluwvNuMch3z
	cxi219hFZaNSyD//sj+FVLO4+Br7DlZY+vbi6AK98ImMpnAaObWBSG/WUqjMN7XkHvXb
	M1tYMT/oTtDrjE7rB+09Q85tm/rjy788ZMAQ7IyB7Hv3ramReOZPltMXww6wd0xyCnFG
	VieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kSIcW1wlDT0WNGr9LHOACNjsr+SlDe0Gkja5VxXh8IQ=;
	b=PIEeAdG+1PWJfnv98CyVdv9Ka823VBSaWbwyhbDD04YuC/FGaEG5il0WmzKZrU9wZn
	GAbVBsSOPEjtT4lndV9maqx7FcqFF/Bjc2BMpOfQbiAI2CbfMEGVBT5CGZ/fre5pY/1a
	uNIQ/2MvIX8UixhG3EycigEkacNiUG2iEFCViucfWwfhzbEv+hfsreY9tXAVJmoUf7C9
	rBiBIqyKw454D5GmCFMTGwRY144M3nT4bMf771/sDCZtT5Uo+nJhlCYwLUtv0NRyBVuD
	3avEn1KL3mlD2jaCBXvdCmNRhz6Xx9dqZRda8BGwmRaSbgoGwaAa95CoARLAsZM57O0K
	cv4A==
X-Gm-Message-State: APjAAAWVK+F4z8O72XYWRtfmia2WvVS6X1szmsaDyv6hhFY4PKe4B80A
	peSiaCS7g66H1SVq2uxnKHID8ueRMGA=
X-Google-Smtp-Source: APXvYqwNzNwsOQPwhKCQNzQUvIQmw/4HbprKjVBkNHn+55XKyGSgjQlSkTlhmKsQEM6gFKFqFJ0f9A==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr11419896wro.51.1578586910416; 
	Thu, 09 Jan 2020 08:21:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d14sm8655010wru.9.2020.01.09.08.21.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 08:21:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 16:21:40 +0000
Message-Id: <20200109162141.20579-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109162141.20579-1-ross.burton@intel.com>
References: <20200109162141.20579-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] opencv: PACKAGECONFIG for G-API, use system ADE
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
X-List-Received-Date: Thu, 09 Jan 2020 16:21:50 -0000
Content-Transfer-Encoding: 8bit

The Graph API is enabled by default, and if ADE isn't present it will
download a copy of the source during do_configure.

Add a PACKAGECONFIG for the Graph API, and depend on the ADE that we
package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 487393f388..03e4f58dca 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -93,10 +93,11 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
-PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
+PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
+PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
 PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
-- 
2.20.1


