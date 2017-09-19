Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 10B2460851
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:03:29 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o77so2311972qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qlxg/ygT54DJ+OVSCkpUy9ukvzyidkJvttU0Dhb0+f8=;
	b=AbvTw+Ou/3M79zGE3XNy8kzWY1hQZjhA2W6j83hYbTjKrVEKL7BTdXxyuA/57BOUS6
	zLi1Es0OUw6LDfBHyw549HLa2gQhzewJthI2CXk9SdZW0ge6WhNs5hoFTl24eHya6kzC
	JCYZgKuG8hZI+EK9x6wtZRUh1mvBXndapjcrZJU6CpXTZG6n61Zj8xBuFfX0KtkwoiJ+
	oZ/lnumRk+hgNMQMi2M1ELroSDh5MPQqxOgIsprgD4gPINfGotMfshs4jRxXKj1Be+vp
	WJUJxC22pmLk4wtJ0EKUHIRL4nFxs8O0b/1elb9XG7pnvm2yaoleGgwJ0w5qR1e3Nk/4
	GFhw==
X-Gm-Message-State: AHPjjUhyn71/kLizqqWs68LhqN/4ur8qZMxFoYmVlc96QEdLoYLWum9K
	3j6SpPEOQPSoZ9uD91ElfOCJBTA1
X-Google-Smtp-Source: AOwi7QCubxTzv0mlDpwQ8UrzFcEn634hlKa4bEjv/O9TwZYHy6bdXaoPOV4Jeptn6l+bQPP4A8ZQlw==
X-Received: by 10.55.104.150 with SMTP id d144mr1993724qkc.185.1505829810623; 
	Tue, 19 Sep 2017 07:03:30 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	h19sm6897996qke.29.2017.09.19.07.03.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 07:03:29 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 10:03:17 -0400
Message-Id: <1505829797-19699-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.7.7
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
X-List-Received-Date: Tue, 19 Sep 2017 14:03:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.7.6.bb => python-cmd2_0.7.7.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.7.6.bb => python-cmd2_0.7.7.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.7.6.bb b/meta-python/recipes-devtools/python/python-cmd2_0.7.7.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python-cmd2_0.7.6.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.7.7.bb
index d136672..fa1ef5f 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.7.6.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.7.7.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=49;endline=49;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "71f862cb2817b207c9cecec7382324d6"
-SRC_URI[sha256sum] = "fcf116b44a46188bbae2ba852a5c2354c069b798feda314a452cb927054d2f86"
+SRC_URI[md5sum] = "576b78add6d652b48dcf9362cece88ef"
+SRC_URI[sha256sum] = "b4e2fb9fc656adccc4d01dfd55ab5a9b05890e961950543f692e7885725c2d72"
 
 inherit pypi setuptools
 
-- 
2.7.4


