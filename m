Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 067656B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:51:37 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r128so4222450qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=dBK7nOINcYgKAPywEHqC9n9rvcaEbRJnwmpLH+kw9iI=;
	b=qa/O7zxYj151gjKbav/JG02Fzv7VJ90j+QatIN8Tkva/4+VpboDrNb558giLY5sLi8
	rL/suYzdxjHIMMo5yGUtpWyoXHduX9Pn6fn+FVKpUsp3lL132309nRxNL5+egKLIitEJ
	DMvzuAtCtfpdfhwsO083ZIQW8w+/jXxkNnZY4tEqO1RHOJcf+Htn8xePxUz/Q9zgNmeC
	Z5cqA7E7yr2iIyz6MIBd8t3liYUnB6t9XfWHwikRkVxrU20jvVBaSeI4oX1LPSSA+rgk
	uOL9Q7jqf08QN4IOX2CUK5GRwnC5yNWIplCx2xeR4mEhGQ0+lgI5rUWjvZ4HQ5TYcAos
	Jz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=dBK7nOINcYgKAPywEHqC9n9rvcaEbRJnwmpLH+kw9iI=;
	b=bRz9/7WR/1qLd4xzJT5xK8lPwiHlXC4dZOilHr0FGiKt+8RG7L3osSgpiSRYL9PPJf
	xpM03hVLzZM9pZg0ONDTPpN7SDi0DOEnNeGbOIur29IcXva64NAry7cFztls0ZrSc0K9
	VcHMVzs2blSPjSm57Xoxp5c+mHR0uOPBnwf4DleIsOZ2ligUZc75IO4j+bNuzThrusFz
	TaBoZyZ6fTqisscL2rJeHoc4qRZgQuLQwdCMMHK8Cb32IQgyax/5wU27CZI3ZMM2KQgN
	V6AQ4CiI+kK0r1TlVOUZUosCHYPRSteNUnnoWpZXf/tqGOX92BwhfZ8poRoxFuX+lr8r
	QvYw==
X-Gm-Message-State: AE9vXwNLPARIqrP8Mz9ooztjx1yXL+c2iCFkOPoivtHUkx3b9XZoehHEYCji/9Tl6nBThA==
X-Received: by 10.55.159.200 with SMTP id i191mr12708003qke.26.1472673097970; 
	Wed, 31 Aug 2016 12:51:37 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.100.224.8])
	by smtp.gmail.com with ESMTPSA id d76sm838648qkc.19.2016.08.31.12.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Aug 2016 12:51:36 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 16:51:09 -0300
Message-Id: <1472673070-9887-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 1/2] python-certifi: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 31 Aug 2016 19:51:39 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-certifi.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 8c4579a..77fa53b 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -9,3 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
 SRC_URI[md5sum] = "b57513f7670482da45bb350b792f659e"
 SRC_URI[sha256sum] = "99864ed602d8a9d212e339b15ffa438895002eda7b7db20dca5309dac9605ae9"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.1.4


