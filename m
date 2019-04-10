Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C5D2D7D907
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:25:57 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a96so1441166pla.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=wNw+Q3u9AELcQLJt90/b2qOmY5b/Lu78LTEflXNryVI=;
	b=UlXTvTw4DXf1xbWd4y+FpuZ6SVn/+ZVw1C1fQmZINZwHI7c+JmmQW3STrqyIC3exR1
	0PfyTsxDgKocwrZsNvtCFEvWq9ZHZ4n9MGbtBdKFeYx5ms98cPuYeuGvXUHLcaOhM1qP
	dVK8WfuRd0gHQECXZoKLPYezpWLQ1GssMMPFGz7CTLLKldy8K2L/N07i38AIJ53hkM8M
	e3ixIhMOXLNH4Rmg+w8yL3eiHA+FB7oQ/RHMRaiGSgLyVd8j3L4TzV2C6GmVNtjGDpIg
	XJFN3r+RqHFk6475ZzfzJxrdo9SvW1yog3svqe42owDD3kFkrhDyvr2c/VpkYM2HgD3O
	4sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=wNw+Q3u9AELcQLJt90/b2qOmY5b/Lu78LTEflXNryVI=;
	b=gKOTZym6CFn73oINWznwBNdiYj0/J3/yO+/Y5SvoXXXmhnMDuEqR9l11ohu3kf2h8+
	gjXvnyHQaziJRlkNPPrWToZeDjqimGtZy1w8iNe2it215HerJw6wnwrMVws+6BzOX3xI
	IaRvYt6hTaW/zTvNNrSwpKUkG9/MirbivwhK8dBOQAAWR/YfXrIQlu0VlcsZnQjUfNoy
	SYl3tLRfguz4XXsKxR05vgVckB182owobOrOaqiZRnpGyKkpGVdRDBpT2PvjjhxyEO6G
	MucI6fl/AXE5RZ7SN2ZopNYyWCrPLZhOAaIa72A7STA0B70p6EB5lb12fH5rablY77bI
	yULA==
X-Gm-Message-State: APjAAAWFpYJTPUBiP0eKpDeAGhN1NO7H2amorIUcZG7Hga1djN9o/b+g
	1enKM3L6QWp+PZLU96T4WCx3Ug==
X-Google-Smtp-Source: APXvYqyVTX8xBJ5L8o1Jp2bWrBqFC8w+BCY6/r65nn5t1RKIHnzBOEYwrwoRWzN3GPVFC0anj1SNDA==
X-Received: by 2002:a17:902:2dc3:: with SMTP id
	p61mr7773257plb.308.1554902758475; 
	Wed, 10 Apr 2019 06:25:58 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.78.119])
	by smtp.gmail.com with UTF8SMTPSA id
	y23sm51725712pfn.25.2019.04.10.06.25.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Apr 2019 06:25:57 -0700 (PDT)
Date: Wed, 10 Apr 2019 13:25:46 +0000
Message-Id: <20190410132546.1476-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH v2] fatresize_1.0.2.bb: Add recipe for fatresize command line tool
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
X-List-Received-Date: Wed, 10 Apr 2019 13:25:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The fatresize command line tool provides command line access to the
libparted-fs-resize library implementation of the FAT partition
resizing.

This tool is useful for safely resizing FAT partitions which are
commonly found as the boot partition on a variety of SoC targets (e.g.
RaspberryPi).

The Debian version of the source is used as the original upstream on
SourceForge is no longer actively maintained.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Removed '-git+${SRCPV}' from PV, as SRCREV matches exact version
---
 .../recipes-utils/fatresize/fatresize_1.0.2.bb            | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb
new file mode 100644
index 0000000000..88d495b685
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Resize FAT partitions using libparted"
+SECTION = "console/tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https"
+SRCREV = "3f80afc76ad82d4a1b852a6c8dea24cd9f5e7a24"
+
+PV = "1.0.2-11"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "parted"
+
+inherit autotools pkgconfig
---
2.20.1

