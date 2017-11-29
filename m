Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id BBB2178055
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 20:01:39 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c13so6050576qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 12:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X9IwmMYcznv7cl9JkWcNfI74LP5ncQ2UbpxnB8c1NrQ=;
	b=cjow0wkahkNzuzy9qhvey31/76dcEbEkhOIk3ByjmoJbF5SG5/73hO0l3XxX5Dx1Wk
	NftF0WTdUMgrCcou2nokTCqp4GA5w0wQ8w0gQOrRU3yAOyIMF/VIRH8lHEp4S2kG0Zj5
	2h8jYAx/WD7EB5vxD8jGX4cu8Zndn7AFE2h9FJ2CKKkYtxDg+1+LjK6K7QomIHLuuLBU
	HzTwgwa9QhQ6M6Sh8YXs7OZC/fIZttiF55FLNg2NwsKB5BpyHfWc0lP4dweVxrgRiHIu
	1ivwtS6mV6nT1LURFjI5/+dyzMIJudxmojkls99ZlP1L/XbmVH2kEOUMssKqfKVUIj46
	jlYA==
X-Gm-Message-State: AKGB3mJo8pQYAVmUF/kcVrf/TH74x8CWIoJbcBWAQT67YArxzKBh00zz
	2Fy3nq46w2FGZsLfXd6sly33oqol
X-Google-Smtp-Source: AGs4zMZeZuo98Jv5pMCA+oYdap5DYEKt59+bYEFoXK4Xf5OckFMuiJNTo7uk1FjaxoMYakygxQIJrw==
X-Received: by 10.233.239.211 with SMTP id d202mr31243qkg.165.1511985700278;
	Wed, 29 Nov 2017 12:01:40 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	y135sm1734219qka.48.2017.11.29.12.01.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 12:01:39 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 15:01:33 -0500
Message-Id: <1511985694-17530-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-chardet: add a separate package for the cli utils
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
X-List-Received-Date: Wed, 29 Nov 2017 20:01:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-chardet.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
index 6035488..316e2c1 100644
--- a/meta-python/recipes-devtools/python/python-chardet.inc
+++ b/meta-python/recipes-devtools/python/python-chardet.inc
@@ -11,3 +11,9 @@ SRC_URI[md5sum] = "7dd1ba7f9c77e32351b0a0cfacf4055c"
 SRC_URI[sha256sum] = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES =+ "${PN}-cli"
+RDEPENDS_${PN}-cli = "${PN} "
+FILES_${PN}-cli += " \
+    ${PYTHON_SITEPACKAGES_DIR}/chardet/cli \
+"
-- 
2.7.4


