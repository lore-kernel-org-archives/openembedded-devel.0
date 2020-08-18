Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.56949.1597712358720772956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 17:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hYFyR3Jc;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id 2so8621176pjx.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 17:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nSJFEImpRCa0MJc0QJewSMnKj8KgvkN8SVfodtbbrQ4=;
        b=hYFyR3Jc2IJlJHGqen9Wdr7WC7KP0C7OhHJuvLu5mMk4isu4giogtvrNL4ZKBroDb0
         CxgPQYJXEZuwJWa2CwzZRPQqPhtkv68CpmiMkHUdFRfGqPLOYQEALNR/z7Wpr1kdNryX
         V1rvlRh+GitlC8FxF3IAyM4Oo2bXMNkXCrt/laLOLo3CYVELuVs/lRlmLKCWVYW3O8US
         ZyOgFDMeezdIskjJZVTZKJQSMEZJ/oJpGQhYA8GQun3FcmrCzez5x2AdJMEmJhaqD2Qj
         4KHQPlj9odhMk1DvXx0lng4C7vvZVO90qxjGek9DIeOELmRixznItyR3dL3iVzzd88BD
         sW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nSJFEImpRCa0MJc0QJewSMnKj8KgvkN8SVfodtbbrQ4=;
        b=l7sXJoV16NSrKjot4r/cTWs8g5FqEfRAP1luT0vXnHyZZ/C559IT8lcMt+9HFfeAex
         GO6uLB63OmnzxgKeJck+sTuhmk9QowB8sTHS9S/Cg6bRGex0qTgAIsPi0M1R65LLrHzQ
         OrDXQRa1FfRdZNirIQ3WrMpOEYjhT7TFNNXNc3597x48qc6R3Fr4rb1qQWSV8DR66Ts1
         P6i4TLWWEsPXRJbHAFFuNfJI/qjiTYzrigUPdLoPddAsrmuTSyz5/gmlMZOKJUVgAlI0
         EOvBK13YN/TQqZRn6yueMnHo6xAynlpuhldg/RlwhNUjv9oU37l9bdoZV/jt/sKotw+6
         myVg==
X-Gm-Message-State: AOAM5326kcZl9mFPlMQuEMLOqOFAWa1jfrpTcj8bVrzE6XFx9pytSXV+
	Tz58mG62lEDt8+TENsFXvfpoHKNh5xS8sQ==
X-Google-Smtp-Source: ABdhPJzrC5/cK+X5EoPZ9i3avUqXv2K6vQ9WMjXI3VyJC8YqGUhUp6ZJSTci5xDvFtaWP4Q8QU6/sQ==
X-Received: by 2002:a17:90a:be17:: with SMTP id a23mr14729591pjs.84.1597712357923;
        Mon, 17 Aug 2020 17:59:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id l22sm19013229pjy.31.2020.08.17.17.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 17:59:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] autossh: Created recipe
Date: Mon, 17 Aug 2020 17:59:14 -0700
Message-Id: <20200818005914.3886892-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Added recipe for autossh tool.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../autossh/autossh_1.4g.bb                   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb

diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
new file mode 100644
index 0000000000..a84fd9ac1a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "autossh is a program to start a copy of ssh and monitor it, restarting it as necessary should it die or stop passing traffic"
+HOMEPAGE = "https://www.harding.motd.ca/autossh/"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://autossh.spec;md5=80a6701134723fd3420e733b46a0eb97"
+
+SRC_URI = "https://www.harding.motd.ca/autossh/${BP}.tgz"
+SRC_URI[md5sum] = "2b804bc1bf6d2f2afaa526d02df7c0a2"
+SRC_URI[sha256sum] = "5fc3cee3361ca1615af862364c480593171d0c54ec156de79fc421e31ae21277"
+
+RDEPENDS_${PN} = "openssh"
+
+CFLAGS_prepend = "-I${WORKDIR}/build "
+
+inherit autotools
+
+EXTRA_OECONF="--with-ssh=/usr/bin/ssh"
+
+do_compile_append() {
+        cp ${WORKDIR}/autossh-${PV}/CHANGES ${WORKDIR}/build
+        cp ${WORKDIR}/autossh-${PV}/README ${WORKDIR}/build
+        cp ${WORKDIR}/autossh-${PV}/autossh.host ${WORKDIR}/build
+        cp ${WORKDIR}/autossh-${PV}/rscreen ${WORKDIR}/build
+        cp ${WORKDIR}/autossh-${PV}/autossh.1 ${WORKDIR}/build
+        cp ${WORKDIR}/autossh-${PV}/autossh.spec ${WORKDIR}/build
+}
+
+do_install_append() {
+        rm -rf ${D}${datadir}/examples
+}
-- 
2.28.0

