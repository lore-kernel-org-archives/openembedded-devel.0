Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4F1788CA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 14:53:37 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id y137so8815118qka.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 07:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fW7dNcCVAAElFjzhhZhzsMdOBM2DO2wrrScbkZ9xYXQ=;
	b=pEnjdpkGhd1e+Z515gLHIpf1W42DkNk5YBqZwkNIZ3fPGMCK/nsq+Lerheq7mytfLW
	ETYa1C9N4oZ+zZloqJQjQfw4720xiFdWegHXwclqpcaTIqINVRCE/IAlw4kanlrPnLgG
	z6O1oP2jjjjuduwJghShlPe/EPgIpYyklwWsgBlUQNUO3f0rLjR60V2B+QbtPJazTKn9
	8dBJvR38dOnz+YAC0B7KfJXCXZTd84aTlJSaxd6duDfFBUEAZH9kKIEeavArQ0ISiPSq
	/Ccc1ZlAJun7jmfRfrWGxkWIpjj/vlGs0agg7D5dasSLOi1HsT7X464xwP6PWdL1mXNN
	/Sqg==
X-Gm-Message-State: AElRT7GnUY0ZrCICoxEYNGy37TqEqD9SdJxwOa/Le80+iAIqwlvFOmys
	YGkQvglKPxnqQt42k5X4RUB+5YmG
X-Google-Smtp-Source: AG47ELtuNeIsMzhhn9WrCm5EVw2IDvM7fiqxdUUf8tv7NjORTFoenC9LSkHtLqBh7Tu2996TOWNFQA==
X-Received: by 10.55.217.77 with SMTP id u74mr2765148qki.148.1520780018885;
	Sun, 11 Mar 2018 07:53:38 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s39sm3822988qth.10.2018.03.11.07.53.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 07:53:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 10:53:33 -0400
Message-Id: <1520780013-3822-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: add dateutil to the set of RDEPENDS
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
X-List-Received-Date: Sun, 11 Mar 2018 14:53:38 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 9bbcd89..6c7ceb8 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -7,6 +7,7 @@ SRC_URI[md5sum] = "5003442bffbb15c227decbe2a1fd2d66"
 SRC_URI[sha256sum] = "44af4fa5ba092a9bee413cedf4bf9453827fd2185b6a609a5388af8b72b6abd6"
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-jsonschema \
     ${PYTHON_PN}-requests \
-- 
2.7.4


