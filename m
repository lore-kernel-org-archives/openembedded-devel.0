Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D90AD77DA3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 22:09:01 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d4so3931416qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 14:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gvbgmCa767P40R3qAbk1GwZoyqDLr4mYECTak1JbQAE=;
	b=MAt2WGa0hzsbT3GXLBSs7j4yS6f0TdZiTv2RDQuQkZWmobOAqUPvafIHXXVKj+qaD5
	TOhqN/y7lV3zs1vkA+LmqsqcMbApNcYfyrOBSdKiMwoEMJsZ0bjwjkwIWc3dobnzENLY
	W0Hvlcco2uH1Y3+PzaDcxfQuWeWCoxbIMtzhKqcytGE4vYESLVr8SCx81nSTQvBc9+vH
	LdNfVAKYuzgdUI/UqnwJkAWiKx8l4S54zNfsKiL/EeBex5jO8rNKB+5bNTQqcfU52/fT
	1KrPIcNVvHNkEv19jIU96Z9bTKOeeC96z/VNdJteGNzS+nljJJPnfQAOl3jtGgCfjt+0
	45uQ==
X-Gm-Message-State: AKGB3mLz5hxTofDHH8TrpzinvvxQi6gRuQlr8w4ooLXNfsw1bgL5Scuw
	qRuee8i0eJKvrnzzPKAGUjBNiZM0
X-Google-Smtp-Source: ACJfBot22kwWrTHjvwA+a5aMZarHrof/9qUvKuEvGoeMRJEi4u6fnPa/b4nukuMLXFxNjwO9SCB49Q==
X-Received: by 10.200.37.203 with SMTP id f11mr3966369qtf.230.1515017342559;
	Wed, 03 Jan 2018 14:09:02 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v17sm1196676qtj.35.2018.01.03.14.09.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 14:09:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 17:08:53 -0500
Message-Id: <1515017333-7448-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515017333-7448-1-git-send-email-derek@asterius.io>
References: <1515017333-7448-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-grpcio-tools: update to version 1.8.2
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
X-List-Received-Date: Wed, 03 Jan 2018 22:09:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-grpcio-tools_1.7.0.bb => python-grpcio-tools_1.8.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio-tools_1.7.0.bb => python-grpcio-tools_1.8.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.7.0.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-grpcio-tools_1.7.0.bb
rename to meta-python/recipes-devtools/python/python-grpcio-tools_1.8.2.bb
index bb69973..7161493 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.2.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "b2a25251b829aae9865aa77970fc1703"
-SRC_URI[sha256sum] = "217b1a6f7ef10b79d4c98585a10a81027311cb5ef1c95d82880e819da4655e52"
+SRC_URI[md5sum] = "357ea84410d1888e1978a857c0289ff5"
+SRC_URI[sha256sum] = "71d9f640aac2db77787869c863fe80cec1f259a29caa89a8fc21c6b1d07766fd"
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


