Return-Path: <3OOCaXAMKAE8Dr1x55x2v.t53@flex--wak.bounces.google.com>
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
	[209.85.210.201])
	by mail.openembedded.org (Postfix) with ESMTP id 91D2E6BBDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 02:30:15 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id b11so13217833pfo.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=iMp/siw/2i++vGiZh07apLqVV7zXjlWuh9xMK6e2CaI=;
	b=X4rVGYrrcP8haj8q4eUSi+LpcbNg7gN4Q8HhmCx7NnYdNeCe7QFRb8qCHLq8+7mxYw
	DxRkYAn1x08YDLSWqF2eevwTZ71GLhBbImPIeWt4xzsfEErUMCcpI8fi2xnbD0MLq5zz
	1ecrRayxi8v9PzhdU66spmKLmWGpbtToYO4ZS6UyUAEAUysYlPm5iNXkDvdscj9NgeQP
	g295rfz4+8APw+3rEpoyq93kBuECVU0UTy2kP9yXrUgdpDsGWBRXk1XP0MReWC/xIuYn
	tHWMHkDHdWCCgsm5V3js0YhUcK09E8OF8f7p6j/v4fpRbrq5x2gEdnhkqLZrYY3/UFJh
	VUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=iMp/siw/2i++vGiZh07apLqVV7zXjlWuh9xMK6e2CaI=;
	b=YhER6rg7db+44XjA5T7bRyoNMqHzs7XxKNq9dqHIadK6dLuQIeKhZ0zZhPIPcuZNhJ
	ePmdYkyH+Qxn3lfwy77J1yPN7GbYGkePT2RGltOuEWnnOpbO4Ey5OPX5VpZeF+rLeS/0
	hxqkkZyRJti5n45EsePb7gwhFQK4Uq/01uXHNbDIOyTBOQ9BzqB4ESgMetdobpJ60eXq
	RmKjexrHAljzgTTI7Qz1w7ssQijEBfpqbsnwMr40xBzwGg9MifdnDh/xDzFmHBtsOzkP
	WUqB5fZvXMbd2FpEBLJo2rO7zfeYT5aevhBOurrqfYCDCmXR+KM1GMV98GNx6F3EqMS9
	h5og==
X-Gm-Message-State: APjAAAXXtCA5GtFUCqo9vag9gMvaB3T3CoJvk0N1MKw4opMmAZKvy3RZ
	Uu8CQimT/Go8hsY0Tk21KHkrQgPG4LJISTj3goFjSc0KAW+eECmD8uVX+01uzeAihzFzsIltYtp
	THtqp8V7rvkX+EXNeikz86CXUXETkbuq0KB/s+6QghP5T4A3QlFhsJ7+aNTVE0gEAT92VQxN3Pb
	0HjXc=
X-Google-Smtp-Source: APXvYqwiL3vpJPo/xUwbRML/qCHY10MUCkcKleneoqLZA/mBa2HlTMREqFAPaPHJfOXBAjqAGFWMdJ8=
X-Received: by 2002:a63:28f:: with SMTP id 137mr5494350pgc.377.1553653816378; 
	Tue, 26 Mar 2019 19:30:16 -0700 (PDT)
Date: Tue, 26 Mar 2019 19:30:00 -0700
Message-Id: <20190327023000.105889-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] function2: Add package
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
X-List-Received-Date: Wed, 27 Mar 2019 02:30:15 -0000
Content-Type: text/plain; charset="UTF-8"

function2 is an improved, drop in replacement for std::function.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../function2/function2_4.0.0.bb              | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/function2/function2_4.0.0.bb

diff --git a/meta-oe/recipes-support/function2/function2_4.0.0.bb b/meta-oe/recipes-support/function2/function2_4.0.0.bb
new file mode 100644
index 000000000..556a25aa1
--- /dev/null
+++ b/meta-oe/recipes-support/function2/function2_4.0.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Improved drop-in replacement for std::function"
+DESCRIPTION = "Provides improved implementations of std::function."
+HOMEPAGE = "https://naios.github.io/function2"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+SRCREV = "d2acdb6c3c7612a6133cd03464ef941161258f4e"
+PV .= "+git${SRCPV}"
+
+SRC_URI += "gitsm://github.com/Naios/function2"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+inherit ptest
+
+# Installs some data to incorrect top-level /usr directory
+do_install_append() {
+	mkdir -p ${D}/${datadir}/function2
+	mv ${D}/${prefix}/Readme.md ${D}/${datadir}/function2/
+	mv ${D}/${prefix}/LICENSE.txt ${D}/${datadir}/function2/
+}
-- 
2.21.0


