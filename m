Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id BB6877FCE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:25:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i12so23615645wrn.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PfPaySQllTeafngxLMzwhnFU/zUGHFqI1MTiX+zjxaQ=;
	b=0Xy5wCWr3Pfl59gnnEz8HSumkG1/9axeLcI485BDXGAAmL9T+Rjg22RGUUbKWAskip
	0PseXFUQL/x4KD2yJAdb9wQ29cESjHXXdZle7DEiXeiakQwSQPqZCkBa6K8uxHIN7iWu
	+PY4EVcDf1Cx2los3jfS7FOKiH0cBSRZybxQw8Ge2gbxlVNWhSD7c15rxD0DZcbvHCa7
	2RH+rYYjoqEnJdIp9V7RirA0CsbbYW9CzUXSrqWjLY+IhhfJns09RKZrPPaQ8GOGspMN
	q7qBYYJkxagF9e0CFa7lLcRsdWCECRl31AnRTK0doqRXf1ktvKJS82MEmvyTjCK41kS3
	YOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PfPaySQllTeafngxLMzwhnFU/zUGHFqI1MTiX+zjxaQ=;
	b=Nw6UcSK4upQQoNp+aFNbGewT9T+dqEa25n8+qma5KgG5GHObMhdQ8pfiIWC+2djhWd
	XKdYPKy2oyX+9ifACtkEgNuxMWLi2AN0gGhf6ptvrscuq4QQ+fnf+MBp6kcX6vQM61xA
	bv92Uxa/fHMYixTwbP5/coQkRLbB4ycVH9iShbkeGUdChtEI8fcptTUCrrOONX5M6DWN
	TlD9ottkPBdy/rvpvYQUCCxRxn788UzNJjbAJA8Bc98WqlILx1Hpo8s2oJyic1UJLxvw
	v4XDWH3fmWyYqP0sEs+4pSbnDbDd9vsXcIHyLMR8UhxdkwmWYi/P4DIsIRGodZbmPwOd
	+X3w==
X-Gm-Message-State: APjAAAXN+3YuMgsiwJTYlCawKX5snKTkZEHhIOFcHBTIxAYfnqX9a6l8
	2LjTd4aszlOlTeDsEMDvkytoL3bPmIA=
X-Google-Smtp-Source: APXvYqx4REdx7qetaKRmAPeQZVETfJfbj0AlWDkIGxUuRltuqIVlw/n4bSehWpjUSdI1X1JE3LzLBw==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr40876283wra.194.1574792748129;
	Tue, 26 Nov 2019 10:25:48 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g207sm4322144wmg.40.2019.11.26.10.25.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 10:25:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 18:25:34 +0000
Message-Id: <20191126182535.21076-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] glmark2: upgrade to latest HEAD
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
X-List-Received-Date: Tue, 26 Nov 2019 18:25:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index d590b0501b..8b767463bf 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 DEPENDS = "libpng jpeg udev"
 
-PV = "20190205+${SRCPV}"
+PV = "20190904+${SRCPV}"
 
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
-SRCREV = "c17fd14505f30d9e4dbad276f7aa956fd21a637b"
+SRCREV = "24a1139dcbfd86bd02065316eaa90559e39374e1"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


