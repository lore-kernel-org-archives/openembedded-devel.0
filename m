Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 352CD6E672
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2018 21:15:02 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f15so2340447pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2018 14:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NHYlayWPE7Tm8gnD2oLUc3nqi1n24pXaCzaToxpBWvg=;
	b=ui7whWA9aAQzBH3muLSZnwO0UN9USoeVrrMDbzOnGGKjHkIpxPY/YHEjCNkgUWhbVm
	JUifCNoVbdaPMy2fzrdPobeuQ3bf88jr3YHiv+XiOvqTRoU1od/VwerBoHs+1ckViIWq
	GTPYSLXMqBbHo5uwHtTqpSQ1Hrje+YavdlmAMLb033K3970NF9ty5n6gGqBWuFZVSOAp
	im4j0APhKt7/zFQBXb1t5WANDvAtl3lSdJJgOYUqUGgbyKNudNQhn/5+vGkSNCUcxCT6
	L4PxDTUlazlsC+K3vQwxZeeyvZregqhhmDA34g+L27cwWlzOF4wuREqdxvIiu7VwcHt6
	tMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NHYlayWPE7Tm8gnD2oLUc3nqi1n24pXaCzaToxpBWvg=;
	b=sSZ/9jNjKllHvUzklymwJhe9lGGnCCLSJx0o7OjF0SH8xCf9kwLyO0qXD4mnbUvF1b
	Yh3VVMDiPdQJVTu/tkZQAQBUw3sy4R+WJ2Vz1iUgUP30PfDcIDH6sMm7KIYVDaCx7Fyk
	kVHQF35x+W9SxDC6mvD2OQCDnJaj1bc7qp44rc/GQGe+P4QZmhz52HatQAj9JgDmgtlO
	4/WbC4+1yC+G4KeDK69WQEzVOmnWgn9cX7yd3pz4gqH277PlB3GvecqWJr8C8KGEQdKN
	zPH7Wo3PErRJx/vtjm7GDwEgCZEvGhPig+26/xJhsNgIcknOkP15WXG7l0qQgckdrmaR
	t6qg==
X-Gm-Message-State: ALQs6tD6dg8utVlcEkeHGKvhbb4fqKyUkam9Jqt9oCMlZVmYOmU2y63i
	uDUcJphv0Kxbt9hpO1iKPudQZg==
X-Google-Smtp-Source: AB8JxZqxio29RggT7OusmG0LhmLz+89ExmrSKoMjWuDBE5N7bvvVBZXtZU1oUk5err1n4yneVshVSQ==
X-Received: by 10.98.159.202 with SMTP id v71mr3505206pfk.233.1524863703988;
	Fri, 27 Apr 2018 14:15:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	o123-v6sm3750304pga.76.2018.04.27.14.15.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Apr 2018 14:15:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Apr 2018 14:14:54 -0700
Message-Id: <20180427211454.35441-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180427211454.35441-1-raj.khem@gmail.com>
References: <20180427211454.35441-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python-evdev: Use target header to generate ecodes.c
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
X-List-Received-Date: Fri, 27 Apr 2018 21:15:03 -0000

ecodes.c is generated file and if we do not specify the
linux input headers it happiliy defaults to /usr/include/
to look for these headers while emitting code for ecodes.c
which can cause gripes when build systems kernel UAPI is
different than the target kernel. Mysterious build errors
or even worse runtime errors can start to appear.

e.g.

| evdev/ecodes.c:603:29: error: 'KEY_ROTATE_LOCK_TOGGLE' undeclared (first use in this function); did you mean 'KEY_ATTENDANT_TOGGLE'?

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-evdev.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-evdev.inc b/meta-python/recipes-devtools/python/python-evdev.inc
index ccd5077da..5a3884a6f 100644
--- a/meta-python/recipes-devtools/python/python-evdev.inc
+++ b/meta-python/recipes-devtools/python/python-evdev.inc
@@ -6,6 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 SRC_URI[md5sum] = "c7e855ae9f97f869a59e75b29f05ce74"
 SRC_URI[sha256sum] = "57edafc469a414f58b51af1bfb9ee2babb9f626dd2df530d71c1176871850aa1"
 
+do_compile_prepend() {
+    rm -rf ${S}/evdev/ecodes.c
+}
+
+DISTUTILS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
+
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-fcntl \
-- 
2.17.0


