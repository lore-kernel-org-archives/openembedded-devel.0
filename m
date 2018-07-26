Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3014C71A50
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 12:13:14 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x5-v6so1053220pgp.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=JhqwuUbw67CjmxjnR0aW6o4UNJFSn679gSf2vRq0Tuw=;
	b=S0XzoGUbvVG4SichRDbfo224mmuM21g2aiNVdfuxlYLgZRj5gRTVN/qR4FEqC38PS+
	QKKgRMRSgWnD01wz9xlYHDH/CYYxDRawTZN1DEaiCR46jByXg3hcpmgvJDINNTJjOZ3E
	uhGfgXJ30S2+BY9zsGdvXXogfL/EaaYsb71kcSyAxaxjwppdM9WWDWNzArCmrFgwQGqS
	OVnDilhYMsowrz2L8BDVAdUsGAoEZmuhYmmP4kjTJTmfQkHQLc9PCQm2vMs+Lp5wk7s9
	niJW8DX+k7KVub3TjgHa44Bdtqn8ZP7t4rTBJYef0+nMe0ekX7KxM90EtfY9lSe7G3UC
	q39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=JhqwuUbw67CjmxjnR0aW6o4UNJFSn679gSf2vRq0Tuw=;
	b=Zofgg9VaMseKma3HkOvGsFmIPZ/udWs9jgx5fJk0d2zjei9lLVWCjUegLsoc5Sgox3
	WT7qqxWy0HO9M3VGP2OgjC1tUCzOVE+AhMY3x972aZHGuZoIutFeSmhoQUf6U7LuywgC
	+9POMJl4phQdh8eJeF8vqjz4g4nYDEWZ7T4lo1lFyBTthoDkpPrRYkQJWqnvX9nkWmEw
	RKC/Z9mNL/SSE/xrXiuyTDm72aDIQqFzqSy6jiDGmkDp8V5Az4Z3BMPtH+SjU6JFRjvo
	/0R3ttA774z3+w4yuvXEsYAN8/VENwwft3DMuIXslaPLzcr4MmOz2z9Pqdx3PGAwVR5p
	G6/g==
X-Gm-Message-State: AOUpUlELmKWmVDVOVW+gQqHYCXyeOtCRrj5a/5iTCNBzAqX6MJYTJ5G+
	9PFQAEdW18JzsCGsfiuaK6TZTLgwnIs=
X-Google-Smtp-Source: AAOMgpdqAJ37gU7Qf4yjkjKajP2FxVBbQU+h0/r9EnJf/wuY8MqgTWG2y+BOU3akY/mtrTCJyMg4HQ==
X-Received: by 2002:a65:5284:: with SMTP id
	y4-v6mr1631403pgp.283.1532607195906; 
	Thu, 26 Jul 2018 05:13:15 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with ESMTPSA id
	g85-v6sm3411636pfk.39.2018.07.26.05.13.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 05:13:15 -0700 (PDT)
Date: Thu, 26 Jul 2018 22:13:10 +1000
Message-Id: <20180726121310.28754-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libftdi: Extend for nativesdk
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
X-List-Received-Date: Thu, 26 Jul 2018 12:13:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Enable the building of libftdi for nativesdk targets. Enabling nativesdk
builds allows for the building and packaging of tools that use libftdi
for programming/debugging of boards and devices. This enables the
ability to package a complete set of development tools for a target
device as a buildtools-tarball deployable.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Tested the resulting libftdi on an x86-64 host with a buildtools-tarball
containing the icestorm iceprog tool.

For icestorm/iceprog recipe:
https://github.com/nathanrossi/meta-hdl/blob/master/icestorm/icestorm_git.bb
---
 meta-oe/recipes-support/libftdi/libftdi_1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
index 98c5995a5f..4fc6eb0907 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
@@ -24,4 +24,4 @@ PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on -DFTDIPP=on,-DFTDI_BUILD_CPP=o
 
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.0


