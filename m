Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id DA4DF7F2E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 23:01:30 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id m9so8618844pls.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2019 16:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FBQueQAi2ep2EZSH6Wzwj/Mp6TJamEhu3LBDCHIUCT8=;
	b=sH5lDqo7Lr9tKjHSuZ61f/kNf/1Qtz/MfxJFvD5h3W5ixK8dWFaQru5DUBxAPxNMhD
	byL+VUcsuMPzxSwYhpgGGvxh7e4i1eYfa/Qoz6SJtZyHVusk6gkkd/K9SR1785ODkcq/
	tke0KKyEFIyXChsYH8rDhAbm9uGn7YcnR8DKcqsTJYAGr3CwDGbFUgk5Ul/I7ok+GzDW
	VvvoI/EKP+hayboFQcZz2BreGo2PM58vbKcZr6uZ7tI8Yp4hj9K+NKMhBVIUTII8tXIH
	lLfI41xxnw9WGLjT6rW4b0Rgaf/Nhn21RX612/S1Ny+TqyqNy6j6blBrn32u+ACz6dYa
	uVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FBQueQAi2ep2EZSH6Wzwj/Mp6TJamEhu3LBDCHIUCT8=;
	b=kuvFmmceArKxg2TzwDQwV8aSUP96WQasMLSUscUaIbigsFDsptSqN8fPY6VlRgNipW
	8tTLHWZu77q+xr2Cg55eNWa2gSoI658G2Qjzz2290B491ELMYWbdScQSzMrfxMlzXGh2
	AZ0smh5TFcRpXxBxW0x3EDfbsxJEp06NSyGPMFMrUc6U/k8hd3lGC+ZoyaJH/6jcJc5V
	kvXa4xTU6PUgJi125nJ1bp+SDQh8+CsfQ/+z7CFd3DkoYaQIEIC/R4aqHeqNF/Sl6/Mg
	wHIa4nxvpq9u1eI5aKWHmRIDA2OA2bv0yyBogCZbeo+fyF555fjktA/CIRRmtG0J3aTJ
	XNYw==
X-Gm-Message-State: APjAAAWgdx9O2gWmh7O+VllQ1WRuDCRAcebE+2RiJGAGM4vbFSwgfG2Q
	tqCIGYSlux7n6Ji211hsNKhucLxOX2U=
X-Google-Smtp-Source: APXvYqzAsjqOb2gl6qglz41N6OwFQjN6rrkUn317Aa99+Zmfj2unV17U0SNSF2TRCtrBa1DatAP+HQ==
X-Received: by 2002:a17:902:b604:: with SMTP id
	b4mr5314953pls.94.1567551691439; 
	Tue, 03 Sep 2019 16:01:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	z25sm19314164pfa.91.2019.09.03.16.01.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 16:01:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2019 16:01:22 -0700
Message-Id: <20190903230123.37609-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] iscsi-initiator-utils: Inherit pkgconfig and override PKG_CONFIG
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
X-List-Received-Date: Tue, 03 Sep 2019 23:01:31 -0000
Content-Transfer-Encoding: 8bit

PKG_CONFIG is hardcoded to /usr/bin/pkg-config which is not cross
compile safe and ends up with build errors especially on hosts where
pkgconf is used it ends up with errors like

/usr/bin/pkg-config: line 11: exec: pkgconf: not found
/usr/bin/pkg-config: line 11: exec: pkgconf: not found

Override it to use own native pkg-config which can deal with sysroot
correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb
index 1ba6ef065c..3cef70f5e0 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.877.bb
@@ -29,7 +29,7 @@ B = "${WORKDIR}/build"
 
 PV .= "+git${SRCPV}"
 
-inherit update-rc.d systemd autotools
+inherit update-rc.d systemd autotools pkgconfig
 
 EXTRA_OECONF = " \
     --target=${TARGET_SYS} \
@@ -42,6 +42,7 @@ EXTRA_OEMAKE = ' \
     BASE="${prefix}" \
     MANDIR="${mandir}" \
     OPTFLAGS="-DNO_SYSTEMD ${CFLAGS}" \
+    PKG_CONFIG="${STAGING_BINDIR_NATIVE}/pkg-config" \
     NO_SYSTEMD=1 \
 '
 
-- 
2.23.0


