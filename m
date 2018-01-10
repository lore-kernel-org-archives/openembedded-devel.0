Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 901597883A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 20:56:33 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b76so953186qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SObQXTMus5uc88JY0NfOLO3TKVAna+nV8Aaj0QnmtOs=;
	b=e4TZwJ/KF2+KcBXclaSTlgjSKpGWNaRRo7CnouLyt1Uz3//4eJGwUfR2nKIRbonWEJ
	wbJG+XU8BGHG3fCLWjjloNV9PTswI99go1JRoUXwz7v1bGW3aWWRwNmym92mVYJ923wj
	c9ucB+CQpgjt9NjfXlxXeUHTTEDRQAWFPxjL2zuK4GHarLL9FCnE/chz+54/bXOk9SWN
	XqwKp++WH2b4pKirM+XTZCD8jEEXTEw/aNt8RN68w0AupE+rGZjt8x6R/aZ+7VdX5Moq
	ly52XwHoMRkPaNxGpP651UUjB8zT5T2YQ74B1A3rRqeEYbJ37uofidoLxxygKJwyFs5L
	zp8A==
X-Gm-Message-State: AKGB3mIf/4l6eH/dO86jd1B2DR5AzfZehAaeUttIhZLuWIhMI3LLdn1p
	Yome2DLdRf/0MZix4709dnbClXlu
X-Google-Smtp-Source: ACJfBovlTw7iqpNWZhsibvv4Pvc9RYGVD4AmiEBDDwdafnh+EZPm144Q+ujK3tQReRJGpup2+h3+wQ==
X-Received: by 10.55.42.143 with SMTP id q15mr28497955qkq.206.1515617794755;
	Wed, 10 Jan 2018 12:56:34 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w41sm11148076qtc.19.2018.01.10.12.56.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 12:56:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 15:56:26 -0500
Message-Id: <1515617786-1202-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515617786-1202-1-git-send-email-derek@asterius.io>
References: <1515617786-1202-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-grpcio-tools: update to version 1.8.3
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
X-List-Received-Date: Wed, 10 Jan 2018 20:56:33 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-grpcio-tools_1.8.2.bb => python-grpcio-tools_1.8.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio-tools_1.8.2.bb => python-grpcio-tools_1.8.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.2.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-grpcio-tools_1.8.2.bb
rename to meta-python/recipes-devtools/python/python-grpcio-tools_1.8.3.bb
index 7161493..85bb000 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.3.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "357ea84410d1888e1978a857c0289ff5"
-SRC_URI[sha256sum] = "71d9f640aac2db77787869c863fe80cec1f259a29caa89a8fc21c6b1d07766fd"
+SRC_URI[md5sum] = "108e5d231074d5eeac9dd5515e0c434f"
+SRC_URI[sha256sum] = "195e5b8d4cfac2492769eb6b0f7b53fda54344a1dc7b4bbfa653889a83038219"
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


