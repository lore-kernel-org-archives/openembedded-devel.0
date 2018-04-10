Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 655B774A31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 01:34:00 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id s10-v6so6333364plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 18:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=99sdJjBLtC0GIabWcgRWvMIIIkdJrHKfVgk5oEOYtA8=;
	b=KJgzP5dWJvZzLfKkPmKNhoftMyMHPqP09G1bYHnr5fClvuH0IWdRkyr4em9YVwsRXF
	Bg42Tv9H1+JDzzbH4Gf9DFShZxcQ0MB2uhZwgq3kw1v71KWlU+nh60INrz7uG/L8SiTB
	zkEL77uEnD2e8/59S7/ttjDoJaDulVZEzwA/XCW4UYgQmZfJNQ2lCpqg5XYyew6YhFJD
	im9kh+4F/lo4qkRWXc3R0YxATt8HwQBOHSTYguGzh2QX/FlCv39+wTEdl+5Ln77S73st
	A22CGhAOuLH2hagQgHhN6y9tGvyUApxHkoUAfmSPTRjpmnhhM/YHCohS7PcWZKdsA1JQ
	v1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=99sdJjBLtC0GIabWcgRWvMIIIkdJrHKfVgk5oEOYtA8=;
	b=fxvYUSdLqzPxvfnoeFWKR55+3rQzNeWYXIA7YBDIedWQi56GxhmahwVrdTLhztKU5S
	zotBA4x2/RowUtel82sCgJsqGJZDSupePkjZowhd5KkFecQ4ZMt8jlFeH/bUllRfPfwJ
	qkJsUqh9KZyuM1OrFo/SfLbKKUgZDzWIiNHi5S85h458LWE1/m9Str9Kh3MuuEC969Me
	T4I7+uapTSQ+95v0dmnBOpmP9pUdmpS2/XMxz28A/PboJ11rEEQd58UOK3XIdpZcoeqc
	GLHj0nG6hpAQk1Br1U+Qn2DURjF49KVCAauSNxtw5LBxJAf13X6tnlhJ0UUgEdLxoYXz
	dmMA==
X-Gm-Message-State: AElRT7H2femla4htfzbixGRGaLTTKUwRDOmorY0bQnzgOTPyRwurDf/t
	7kZgn49j5AKvCcxOr5Ba1iWWNg==
X-Google-Smtp-Source: AIpwx49dVaon5PBgtj3aaWXqVR9YP/V/VGghMv2fh7lOFbSqaDMUwlINkJ/A8ZMuuGnbNSFadgP7yA==
X-Received: by 2002:a17:902:3001:: with SMTP id
	u1-v6mr41797476plb.164.1523324041140; 
	Mon, 09 Apr 2018 18:34:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id s7sm2142892pgq.48.2018.04.09.18.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 18:34:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 18:33:57 -0700
Message-Id: <1523324037-13527-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] xdebug: update to 2.6.0
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
X-List-Received-Date: Tue, 10 Apr 2018 01:34:00 -0000

fixes:
checking Check for supported PHP versions... configure: error: not supported. Need a PHP version >= 5.5.0 and < 7.2.0 (found 7.2.4)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_2.5.1.bb => xdebug_2.6.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.5.1.bb => xdebug_2.6.0.bb} (85%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
similarity index 85%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
index 7741378..2b8943d 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
@@ -6,8 +6,8 @@ DEPENDS = "php"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "6167b1e104f1108d77f08eb561a12b22"
-SRC_URI[sha256sum] = "7fda9020fd5a2c549ae5a692fcabbb00f74e39dda81d53d25e622bdab4880ec2"
+SRC_URI[md5sum] = "ed3545852e6f4a00fb8730362d0431ee"
+SRC_URI[sha256sum] = "b5264cc03bf68fcbb04b97229f96dca505d7b87ec2fb3bd4249896783d29cbdc"
 
 inherit autotools
 
-- 
2.7.4


