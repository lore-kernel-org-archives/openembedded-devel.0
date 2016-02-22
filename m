Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id BA3AC771CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:36 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id b35so110316514qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VLvsfhzk5SCjxKxWYoJY0qux5oCYDkggwrsniEO21nk=;
	b=JnRj06x8O7+/72h8Cu89WguAVlp0Q26upDc6NPMd9T+DMYQlcUHogvq39k4WRbXpBb
	9pssU8ldjXWbvi5YKEoAVKt5/mu4u+Gqk+d2VmuBTwwOpY8pbB+8QlLhF+CWUIp6kifh
	tbpJ4UpZCwSP407r9WBXQ8YEDsuHutocgtNv+LlOOPmzjB032XSkz6k/DF+oqOSvVT4S
	GfY78ApcBMkX0ki1rDN4MWsr9npHzww+wSZ93ezf7C81BxxbkX831Gzn2fg4RNvMMkb3
	nr/A3jNxNw7rKd4fLYBkl5CbC90FOVJA5xF/fOjPe8GCgEqhOZ/haq01RYZcoZ0g6Pwv
	8ysQ==
X-Gm-Message-State: AG10YOQu5P4iBG83AclN9Vc5HQTVzfyZz/NRPSbKCpLxm7CT0BcEPL8aQP1cYDmechLHYA==
X-Received: by 10.140.19.132 with SMTP id 4mr34278845qgh.56.1456148137267;
	Mon, 22 Feb 2016 05:35:37 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:35:05 -0500
Message-Id: <1456148105-9644-11-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 11/11] python-pyserial: update to 3.0.1
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyserial.inc   | 15 ++++++---------
 .../{python-pyserial_2.7.bb => python-pyserial_3.0.1.bb}  |  0
 ...{python3-pyserial_2.7.bb => python3-pyserial_3.0.1.bb} |  0
 3 files changed, 6 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyserial_2.7.bb => python-pyserial_3.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyserial_2.7.bb => python3-pyserial_3.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index 0fd6747..08eef74 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -1,11 +1,6 @@
 SUMMARY = "Serial Port Support for Python"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c557c64905dac5b725980b9505bf8d7b"
-SRCNAME = "pyserial"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0051a0dc811ee3fdb17a2fd0be44f3ad"
 
 # FIXME might stop packaging serialwin32 and serialjava files
 
@@ -15,5 +10,7 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-stringold \
 "
 
-SRC_URI[md5sum] = "794506184df83ef2290de0d18803dd11"
-SRC_URI[sha256sum] = "3542ec0838793e61d6224e27ff05e8ce4ba5a5c5cc4ec5c6a3e8d49247985477"
+SRC_URI[md5sum] = "c8521e49f8852196aac39431e0901703"
+SRC_URI[sha256sum] = "969cb6405d1d87f8960cf9c10f597ae58f85da2fb9769dba96f4aeeaade54656"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyserial_2.7.bb b/meta-python/recipes-devtools/python/python-pyserial_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyserial_2.7.bb
rename to meta-python/recipes-devtools/python/python-pyserial_3.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_2.7.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyserial_2.7.bb
rename to meta-python/recipes-devtools/python/python3-pyserial_3.0.1.bb
-- 
1.9.1


