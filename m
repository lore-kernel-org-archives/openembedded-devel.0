Return-Path: <eduardo@monkey.io>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5016865CB6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 06:43:06 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id 4so62358490pfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 23:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=monkey-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lrd6/+XO12onkBxQ2bAmO+u9l3wdlK3htMO5Zpi9eCk=;
	b=cwoLcGpRmD2Gdmxaxxz3xpauM9xEn9jFMYNhAKIi7b04SUL+IB1WDNEhBbHNKpV/yg
	e20jzmlvyZJxID25yghJ3W17W9ylMpj+rAmfJezNDTZMlpjtuF8IDsx8KF6c3cx3HkVg
	tCJolNWyIyFymLZJvawfe7cCgxpFi6Pqi3OAny63FykT1ZQtp+BkYepqwCHUYwxwQ+RI
	3uhdIccvVC8Zvhlm3y4ZcW0CNDkRaKp/UgmMH3TUMOOMHt9hCZ14JWRpEykBgCOJlaFR
	wPrhzuWfMB75S6ZZZ5TohdTqEMklR/knL3ZAkMu8Ie0XbKG8eDroqcnfHovgLSQ5N13r
	xdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lrd6/+XO12onkBxQ2bAmO+u9l3wdlK3htMO5Zpi9eCk=;
	b=euY84v3add8BcBhIjFBsay/BAU6Z4F9BSmLcR1oGS9W7cmmcq7m4U2vBFXJdhjq/Us
	eXarvEdxoyBMEYWRstCQzcDzWDJPIR5tvYjfYe48JVjRQj7JSaoRnQGeCPs4US7dX7EU
	8NEqjDntdG4qINlWRYXRK1ySfD/TLt4hFykkovrhXcjXCB2Yc+TNbFr5pU94gSNor6TZ
	lbB0bFhsEIfYcDFLNyfR2bhCMwnmnnSSTO5IYCuOS/UtLxVDjV6LwpKBNznEwG5WVLV3
	JZZRktCP3jT6QTNal7YDAtwYj1fOcQJ8cfJhdjTV5Gvke/UrF+cd+o818gCKRXrtlRLw
	qhXQ==
X-Gm-Message-State: AD7BkJIog72Oc2X3cnvvhQXXds3z3q3FYm3JFdUqS9IySQIuBH+SQEwccCoHFjk6XQvOVQ==
X-Received: by 10.98.75.28 with SMTP id y28mr19507025pfa.126.1459406587658;
	Wed, 30 Mar 2016 23:43:07 -0700 (PDT)
Received: from localhost.localdomain ([64.55.107.3])
	by smtp.gmail.com with ESMTPSA id
	ul7sm10464167pac.41.2016.03.30.23.43.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Mar 2016 23:43:07 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 00:42:52 -0600
Message-Id: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH] fluentbit: add new recipe
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
X-List-Received-Date: Thu, 31 Mar 2016 06:43:09 -0000

Fluent Bit is an open source data collector for Embedded Linux, this
patch adds the recipe for version 0.7.2.

  Project web site: http://fluentbit.io
  Documentation   : http://fluentbit.io/documentation/

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
new file mode 100644
index 0000000..fd38e84
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Fast data collector for Embedded Linux"
+HOMEPAGE = "http://fluentbit.io"
+BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
+
+SRC_URI = "http://fluentbit.io/releases/0.7/fluent-bit-${PV}.tar.gz"
+SRC_URI[md5sum] = "6df9d676e1d2d782a243e655e144e8ae"
+SRC_URI[sha256sum] = "695b56ce378f56855c9554f88f5d8e4f7b11ba7691284903870f779912af4ebe"
+S = "${WORKDIR}/fluent-bit-${PV}"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+RDEPENDS_${PN} = "zlib"
+
+inherit cmake
-- 
2.5.0


