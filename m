Return-Path: <anders.roxell@linaro.org>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id AAD50745BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2018 14:54:23 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id n14-v6so13608253lfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2018 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zUXpVRFo7x3EKK9tpbIixilSYeaUYNxSUWpHlYwABUA=;
	b=LuhBZiyYYd24p4icCo9bWVG9s0VsHLeH2i+s+U9X5Pe7rIpFFQb+TbQArSAxULgPkq
	TghILKiArN72NSLytDS4snXHCsokn3HJUjvEF19a5ueIvJIFOGFt0EoVrMkC7bpFl9DQ
	O6FW49RzILXD215Rbqh8B4mUW8q47uuH6QMIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zUXpVRFo7x3EKK9tpbIixilSYeaUYNxSUWpHlYwABUA=;
	b=sf8rq9LVICqdgJQ97tjPOAQErUVHRZ2BOTnHKaW9on+Wirn4WhhgtWtE22t/XEtgs8
	4OTNnii7jXuBAZEej7m28j2i671Y0GSfS97smiODkdVXx4Ev6oB8zntEkLwhW1XErd1+
	O645wv1WLnPxLw9+6UwPWLD/ZbgL7KRhx2OCLjET82byIuUBCTqorfGMwFZWggvESoF5
	a4eFElHsMuLoYX6++OPrmBM4RAiJVSc+O0uyJOO/WvQnMeedSqqLEi8TQ+wxUtDkcfIJ
	y08yEPBFb7kxAmMAONza2HJcdgCjc8m87hzghWgCdu5uFzzosJ3E7wlDuqofy6W11Uvs
	4VUQ==
X-Gm-Message-State: ABuFfohEk7F+RmpyguKPt+hFEYnpYmS4ocOUinNNb1N2cMNPi5Ot2S/4
	PkJEiKCyf1DnjYOEVAHnAh0VFvOYoUU=
X-Google-Smtp-Source: ACcGV60is8frinPKR9RvxZra1JOxXC9meeaSIPC9K+uE+5KnGIVXIVAnhXupY+rP5Hd/KFDz5i8q7w==
X-Received: by 2002:a19:d381:: with SMTP id k123mr3357937lfg.101.1539960863749;
	Fri, 19 Oct 2018 07:54:23 -0700 (PDT)
Received: from localhost (c-732171d5.07-21-73746f28.bbcust.telenor.se.
	[213.113.33.115]) by smtp.gmail.com with ESMTPSA id
	v22-v6sm4494476lfa.68.2018.10.19.07.54.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 Oct 2018 07:54:23 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Oct 2018 16:54:16 +0200
Message-Id: <20181019145416.8021-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] add a storage I/O benchmark test suite
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
X-List-Received-Date: Fri, 19 Oct 2018 14:54:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 .../recipes-benchmark/s-suite/s-suite_git.bb  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
new file mode 100644
index 000000000000..77d172814065
--- /dev/null
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Small collection of benchmarks for storage I/O"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
+
+SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
+PV = "0.0+git${SRCPV}"
+SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+# installing in /opt/S-suite since the package has
+# dependencies to the directory structure.
+do_install() {
+    install -d ${D}/opt/S-suite
+    for i in $(find ${S}/* -type d); do
+        install -d ${D}/opt/S-suite/$(basename $i)
+        install -m0755 -p ${S}/$(basename $i)/* ${D}/opt/S-suite/$(basename $i)
+    done
+
+    install -m0755 ${S}/config_params.sh ${D}/opt/S-suite
+    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
+}
+
+RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
+
+FILES_${PN} = "/opt/S-suite/"
+
+# added to INSANE_SKIP since s-suite have an runtime
+# dependency (RDEPENDS) on libaio-dev.
+INSANE_SKIP_${PN} += "dev-deps"
-- 
2.19.1


