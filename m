Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 988FF78733
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 13:45:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id s39so12673043qth.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 05:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p+EQlqiEkhAcUY8T6lgqP+3OA9gXtEkHwDQBXtHICHw=;
	b=BWchsosXU3r20u5v8QMIGtnXxJizik1gXCsW9cRyn9g8d+vHeKVbv3a92CcpfwLP+x
	dovUUOYggXr56dOBCJKgewxuRlTEORbxnupwZbSMxxlwPQTwlnLb9qeMx3QCEu2MPuqr
	5FeGcFKf3FD81WETRG2NxTh5u52IoM8jg/WfHEAG7AA6o7n939Vc9+Rdr2UZOlNLQmaV
	OX4giOOdrUQrTzNy1a8rgChJGS692JLyigIpzlELkUIopPOwVLZbI/S73IDV0NUD9Ocb
	AS7TUuW70zFMQOqV2MOSHE9DkmGW6mt5+ymOvgH7OIWkq0MFzSioTLy2DM8A0ojm/JtN
	RC9g==
X-Gm-Message-State: AKwxytevqDCX3g7GR/PLxMK58oURXgv8dG9l4g3Yu9bYdSgiAYjvdG+7
	VVtwOpiayOrP8FwQ0kzWIhluxz4R
X-Google-Smtp-Source: AH8x226kbUIJYUduWonkDM/a9Cige6IED2n6T02WqOewNJi6svQnHLoK5qTjPv+T5GeLQUQFEDlnBQ==
X-Received: by 10.237.44.231 with SMTP id g94mr38511077qtd.108.1517233514291; 
	Mon, 29 Jan 2018 05:45:14 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	u10sm2979791qka.35.2018.01.29.05.45.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jan 2018 05:45:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jan 2018 08:45:04 -0500
Message-Id: <1517233504-15498-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jsonpointer: update to version 2.0
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
X-List-Received-Date: Mon, 29 Jan 2018 13:45:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jsonpointer.inc            | 4 ++--
 .../python/{python-jsonpointer_1.14.bb => python-jsonpointer_2.0.bb}  | 0
 .../{python3-jsonpointer_1.14.bb => python3-jsonpointer_2.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonpointer_1.14.bb => python-jsonpointer_2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jsonpointer_1.14.bb => python3-jsonpointer_2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer.inc b/meta-python/recipes-devtools/python/python-jsonpointer.inc
index 5381fbe..4ed01ed 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpointer.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi
 
-SRC_URI[md5sum] = "190aeb8afcb0efddfe831a4e533e163b"
-SRC_URI[sha256sum] = "c681af823545c731b7b38aedd5d4eee4c5eff87bc0f25e0ff25444a4189eac4d"
+SRC_URI[md5sum] = "741b98d0e693b08b5e44e0a9da5a7bb7"
+SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb b/meta-python/recipes-devtools/python/python-jsonpointer_2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb
rename to meta-python/recipes-devtools/python/python-jsonpointer_2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_1.14.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jsonpointer_1.14.bb
rename to meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
-- 
2.7.4


