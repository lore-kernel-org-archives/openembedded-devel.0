Return-Path: <hmen.56@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id EDE096BA0E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 08:06:01 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y185so8323374wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 00:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iqhGZSX5UIn1auO2I6QwHHZ1k0aPXieiqjWU2ONLpes=;
	b=U/7EHWb+Y+SJm5mLUhqdZrOwKywx0QfkkdMgpPrzXvVOeFbXpE4upIHk6ITrsdZ4hR
	/E6lYSfuJoZYVRgngL9LYse3ljsN8sbclVCu0lvBVOzfXNi7Nta5j/+jqyw6RtNgP72B
	6dn1vmeFywBgFqf+qQDEYIYdEbcBd7tX+KBnKbJKSM4zblbcmPj+aHcmLdyOSVzb3imk
	Lh+CqIQkCKmp2S/Rmr2pebhEKNTgp6e8/lRCZJvyH5ppkTtvStzu2/OK1gMN2PNnLSaq
	xjSz0b48oA2WdeV7MTKimwKRv0pYc4tXCgEeaauLb5l55aE/4diQZBd5356zPORLtyH7
	DlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iqhGZSX5UIn1auO2I6QwHHZ1k0aPXieiqjWU2ONLpes=;
	b=pSC/MTW+tGN66PLAnVM9DCjy9vStQyP6mUjOG670w/q/E3NCh+iAFQqTuyOWheb2RR
	6vmirjQ2Qw5DfxmQbyQwRtQ6eVRW9rIINeArUhfWEvz4rsJoAynj28pvZEu9i/tTGlr5
	6s9Yfp5NbqbqHscFlE8CLT3BzFNah+gYdEqbMJMnzc1VCLdDpEQkrUTCNSVtTyWob9GT
	ZJLkND13hPMUea101YUwSYBUgYjSusUGh7jN2j+NJjgVVnbIUQtkhUrJKZK/HDOzLHuo
	1ne0rft96DfgHtcWfZx7mS7fMseC+BEKufDxX1bQ7dDW1v5gdcvsPWuPbvQE/q628WGu
	bR/Q==
X-Gm-Message-State: AHQUAuZb5WEGOcKArgAytsstpulOKmajtU2/wutAQJwL/wUyBWMkshRM
	FOfXWeJq/6JKBFy0oFmcluQdsj9N
X-Google-Smtp-Source: AHgI3IZjo/abbUjpKEFcJYvl8bhOz5zZwqPWUgXZy0boiPqQ9MFxpZukSjMg7pcsauYBIpe9wh6cBQ==
X-Received: by 2002:a1c:2dc9:: with SMTP id t192mr606776wmt.119.1550822761537; 
	Fri, 22 Feb 2019 00:06:01 -0800 (PST)
Received: from localhost.localdomain ([81.214.38.25])
	by smtp.gmail.com with ESMTPSA id p4sm400310wrs.74.2019.02.22.00.06.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Feb 2019 00:06:01 -0800 (PST)
From: hmenn <hmen.56@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Feb 2019 08:05:56 +0000
Message-Id: <1550822756-20371-1-git-send-email-hmen.56@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [[meta-oe]] add spdlog recipe
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
X-List-Received-Date: Fri, 22 Feb 2019 08:06:03 -0000

* Now, spdlog library is enable under recipes-support. Just install with "spdlog-dev".
* It's also tested with populate-sdk.
---
 meta-oe/recipes-support/spdlog/spdlog_1.3.1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/spdlog/spdlog_1.3.1.bb

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.3.1.bb b/meta-oe/recipes-support/spdlog/spdlog_1.3.1.bb
new file mode 100644
index 0000000..27fa2be
--- /dev/null
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.3.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Very fast, header only, C++ logging library."
+HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+PR="r0"
+SRC_URI = "git://github.com/gabime/spdlog.git;protocol=git;branch=v1.x;tag=v${PV}"
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
+# no need to build example&text&benchmarks on pure yocto
+EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off"
+
+inherit cmake
+
+# Header-only library
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
\ No newline at end of file
-- 
2.7.4


