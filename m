Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 316EE606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 02:41:03 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q184so2362652qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 19:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uUlrh/cX47/uGL4eMw6vapXfnOh8K4Lr1MP2BClH9gY=;
	b=SPZhTTuauc9mATOSo39fu/4SOOEgQcEQl8FAayKr3lP6dUuApshImBTkhpJNwXzMQV
	Jki0SYyYDxSw18ZAWnPSKK8imWeCD06n5cYMQUDZqGAAUhlUpgl9G1GbwxbkByDsaH/O
	3i5tQe+/5KKzrXQWh1AjeJ+OjPV294UhDeg+tRzjB1u5KTowBNigSPgSqJqLcDrNFUe6
	7iZi/P7h3ekKWAGHVY+IOzLJw2hoOloPj8zZSa7s+0CDwZebICf7E83pi9Hx5KkJG928
	yd6nKc0PbF/FyLBQ2FN0K7Oa9yPqiIEBzQLkZLcyAOwziQZ3RtAO5T5nZDkvaIYP46JY
	qDXw==
X-Gm-Message-State: AOPr4FXYdy2U+x8v15iVFwYF5LJF0jUYaADrp8/W8b/A5fQSIT6eR3oAF7MXDb4jIAJyrg==
X-Received: by 10.55.74.14 with SMTP id x14mr6507275qka.70.1462329664644;
	Tue, 03 May 2016 19:41:04 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-180-59.public.wayport.net. [64.134.180.59])
	by smtp.gmail.com with ESMTPSA id f204sm510826qhe.1.2016.05.03.19.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 May 2016 19:41:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2016 22:40:37 -0400
Message-Id: <1462329637-4052-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyparsing: modify build to correctly use setuptools rather than distutils
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
X-List-Received-Date: Wed, 04 May 2016 02:41:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
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
1.9.1


