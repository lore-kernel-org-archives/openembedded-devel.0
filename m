Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id D2697731C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:53 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id r184so60405251qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=teZCVZAtojla74xP1sciWTtBfxO21hySWhEvoq49rrM=;
	b=fIRsAUoGCx4YpWbpzwuSxDdMrdgbVcr67qcmVLiQYFG2/JYKHrCWpsIVIrD9w/8NkR
	ESyRgdN9I6gEo/Z7L0md/lL6X5UVPikQpM9x1w2LxLq+Kln0nGu3kdxyWXeQYrH0PqS5
	hj/npVkMp1iS/J+BhqEQtjmXciN9Xf5TeqgaaY9jLjyvaA6VPbRi2sNos3rJZMDh4q8a
	OkemWBVsuSAlyo9ST+wX777atjRiqEK5sPvlYrMpLqtt7ehw0r/PoE4SBPGeVyxLS7Hj
	0t4XEd6f6bx+AP//JW57s/4D0//p42Wpu/FUBhx/kNIFrw6S1dxUu+vJ/fa45np50zrV
	Y7Ow==
X-Gm-Message-State: AOPr4FVUYYhJAnxuwq4uadyd3wlw+mTNDJJ1Ml3miEzRxp0cYe6nICJLTPsJRmjSboPHUA==
X-Received: by 10.55.186.132 with SMTP id k126mr20784006qkf.176.1462543374686; 
	Fri, 06 May 2016 07:02:54 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 5sm5858433qkf.4.2016.05.06.07.02.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:53 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:49 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:57 -0300
Message-Id: <1462543259-7206-20-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 20/22] python-pyparsing: modify build to correctly use setuptools rather than distutils
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
X-List-Received-Date: Fri, 06 May 2016 14:02:54 -0000

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
index 9862907..94a99e5 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
@@ -7,4 +7,4 @@ SRC_URI[md5sum] = "2a1d3a63ddc2ec9a3da961d1b7f258b2"
 SRC_URI[sha256sum] = "4bd04badfda39b1e2fd0d77cb78b488c881d88c31734791a0ae902979ae10575"
 
 PYPI_PACKAGE_EXT = "zip"
-inherit pypi distutils
+inherit pypi setuptools
-- 
2.8.2


