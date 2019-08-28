Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1407F7E874
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 01:14:43 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t14so378123plr.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 18:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HAX/G+gPkdr30zPaitqT4mM7aH5M0E/PtE9FjJGUx4Q=;
	b=WHKDViR1HyVYWwxxw9PaYfwX8N71nHD6Z8yk3Z73qZainYY6VQa/sXCOG0NyhaLPY2
	kLLscRXtopE0C0bkUsgJOsofmpTCl4FYAta8ZAIhqRNonSfRDNAl0ddEnkBJ9V5hL6el
	vp8KvXchzocV9V0fMf1ivZ6xBNS0YUz2MKeQYSBzIB9gPYS8KV4WWdqXQI18aeWdLHOF
	hzfvCVw5VcLmY6kyAbmWOA7TCtf3/4RIPdiFn4Xm9/a2PP5vBPSLMOMi+B+bsjMwn28c
	IKLCJQI4s1Npg28oqdRm+uLEhSgwUByvtT8ofJmMt8a3rIZvabNWoZPPqsZGlGH5/KZx
	aj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HAX/G+gPkdr30zPaitqT4mM7aH5M0E/PtE9FjJGUx4Q=;
	b=goJpFVn05lWvOFVrkWnbHHvJ/PnYah688/XhzhBKN14GlQcP+H57MtUFMCQmZMUhyC
	1tbGseQu8wkB01ecp1rsd8eItqP2kJCpjH7nPrEyAXXzNAo/nJCAu/DzSlTxyFwCyv1A
	mC8lHimYhCTUuzzzw1HVvQqjOOdPKzZ/PrRzsZEzNXkLZ+5DA3TQ+YaWvWvHVWMArdT5
	g0ua2iTsfpV4pYIsLyAcwBXlyrX5RUV024peK2ZZJMFaz0jLZQx5IeNzagq8AHEHQH7y
	+MGmuc300AFGVGxBiaLPR13TnTnQ1lVz/oCfRlapFxLyX9R98IFzj27fOB9+/W2ySA42
	8HHA==
X-Gm-Message-State: APjAAAWxT8heh504UPceFulbWGIdzeWk8Ro9Q+ICTC/Impg24aOmVaDZ
	Er2dr8XE1E6LRwfFqbLiGoSmMztNlCI=
X-Google-Smtp-Source: APXvYqyxxvpnZ22VTKsWTTLmYnDgtydSSTRV/Jf2NLZ7j+4Hbnrh8/EwI4fGp6JUnuvZnt9aCYYbZg==
X-Received: by 2002:a17:902:b40e:: with SMTP id
	x14mr1744914plr.289.1566954884591; 
	Tue, 27 Aug 2019 18:14:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	z16sm598885pfr.136.2019.08.27.18.14.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 18:14:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Aug 2019 18:14:36 -0700
Message-Id: <20190828011436.24057-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libgpiod: Enable python3 in default packageconfig
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
X-List-Received-Date: Wed, 28 Aug 2019 01:14:44 -0000
Content-Transfer-Encoding: 8bit

this recipe inherits python3native class conditionally, this condition
depends on a given packageconfig, however inherit ${VAR} syntax requires
VAR to be evaluated before inheriting it, therefore if someone appends
python3 to packageconfig via a bbappend, then the packageconfig will
become effective and add --enable-bindings-python to configure but
inherit wont evaluate correctly since the expression adding to
packageconfig

PACKAGECONFIG_append = " python3"

will be coming _after_ the inherit, and the builds will fail e.g.

| ../../../libgpiod-1.3/bindings/python/gpiodmodule.c:8:10: fatal error: Python.h: No such file or directory
|  #include <Python.h>

This patch inverts the logic, meaning if someone has to disable python3
bindings should write a bbappend e.g.

PACKAGECONFIG_remove = "python3"

This will still mean that python3native will be inherited but the
effective configure option will be --disable-bindings-python and that
will do the right thing

See. https://github.com/openembedded/meta-openembedded/issues/140

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
index 756b143ef7..ea1e49129b 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
@@ -6,7 +6,7 @@ SRC_URI[md5sum] = "585b4bb431f99c4ba9b3ee58b9d494c1"
 SRC_URI[sha256sum] = "21ae8fd1f8dafc2eb2ba50e652390cf533d21351419a7426255895cb52e21b1c"
 
 # enable tools and cxx bindings
-PACKAGECONFIG ?= "cxx tools"
+PACKAGECONFIG ?= "cxx tools python3"
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
-- 
2.23.0


