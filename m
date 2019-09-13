Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7037ECBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 21:24:09 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id x3so13767944plr.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q9Li6zgzR1iAiAmDNFXfP4K4CdZjmPYAtdYCG1SkV6s=;
	b=DCYUCfG0hU4FPlofFHeGt1aiBjoHuwud0fAmCKZS579HkY56vNbWgAdc7NVD6bYN5q
	seVkWNqT8tBN7JVQza0HJhrB+ylLzsjClwsvt97y0GNyidaAA3yJcO1XL2qjLhZNySI7
	f2su95Rh/RlS0T46aYGDQbrFJoZri1cqTOAXuuS92piN2gIkADh+D1T+DdoNmV5/h2OI
	ewfYcc85XVLoDrjrFcUI7nvA3myYhQDaCuZi6X7CDeUSwiU8cVbxWI4m5gKlvNmjj6cU
	JS2T8KP6gZKVn4J46Iq1vun5hFb1MHs1EQo1qDkgq/615EnAnBa0ZtbtgZ1usJ+CGXN/
	Dw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q9Li6zgzR1iAiAmDNFXfP4K4CdZjmPYAtdYCG1SkV6s=;
	b=hEgPDuSwicgqggIPgmnXgonlbP0G/m+KO/PM8R+pMHue33LfLtdyv7hBJm66Kny4nT
	3SsUaawgahTQQdWPErx69tKnFyB50WywoTPnOaAwSwP6DRr1ERwBEk74QY3zHclWvx4f
	Tv0VRCptTulWjNhGSOyRihjoC0614cUhLhZ1zR0wSnc8lmaQ8rus5Koq0CGPByro7UFv
	+F1XyVi0QE+JOWQuQ8dvvRfXUmeTkh61IugpCgK13d6c20n7iGURXNHGjemfJVk/cCYm
	/cyFI132wTbu/YGHpBRSiwK7tK4WajV35AT4r98QWYNBF/ZO7EXyjEW6rj/erU4pl6rO
	I5+Q==
X-Gm-Message-State: APjAAAVW9gLZzqvy+pFBNTR/PiMmPsf1dWddSteYVbFE6hTXe4CQDh/x
	AjqXt5MQKekLVE4rcQ/G+Hby+oSzCTs=
X-Google-Smtp-Source: APXvYqw8NQB/ZWWFn6S6cIcDui7FcjIMPTifjOhJvW1DSbMNVlg9SiwmapMXqHWNW/UmSIr71i7DaA==
X-Received: by 2002:a17:902:8ecc:: with SMTP id
	x12mr52032685plo.258.1568409849613; 
	Fri, 13 Sep 2019 14:24:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	f12sm25257479pgo.85.2019.09.13.14.24.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 14:24:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 14:23:46 -0700
Message-Id: <20190913212346.2393764-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] bigbuckbunny: Use faster download mirrors
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
X-List-Received-Date: Fri, 13 Sep 2019 21:24:09 -0000
Content-Transfer-Encoding: 8bit

Original URIs are very slow and these files are quite large where it can
mean hours of download

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 +-
 .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb      | 2 +-
 .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index a80fc10ace..cee386c2a8 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -3,7 +3,7 @@ LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
-SRC_URI = "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_surround.avi"
+SRC_URI = "http://themazzone.com/big_buck_bunny_1080p_surround.avi"
 SRC_URI[md5sum] = "223991c8b33564eb77988a4c13c1c76a"
 SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c20c06ea"
 
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
index 59ac4788cb..d395b9206b 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
@@ -3,7 +3,7 @@ LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
-SRC_URI = "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_480p_surround-fix.avi"
+SRC_URI = "https://archive.org/download/BigBuckBunny/big_buck_bunny_480p_surround-fix.avi"
 SRC_URI[md5sum] = "ed7ed01e9aefba8ddd77c13332cec120"
 SRC_URI[sha256sum] = "40d1cf5bc8e1b0e55dac7bb2e3fbc2aea05b6679444864781299b24db044634f"
 
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
index 21b8f8f0f8..20d562749d 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
@@ -3,7 +3,7 @@ LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
-SRC_URI = "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_surround.avi"
+SRC_URI = "https://archive.org/download/BigBuckBunny/big_buck_bunny_720p_surround.avi"
 SRC_URI[md5sum] = "0da8fe124595f5b206d64cb1400bbefc"
 SRC_URI[sha256sum] = "b957d6e6212638441b52d3b620af157cc8d40c2a0342669294854a06edcd528c"
 
-- 
2.23.0


