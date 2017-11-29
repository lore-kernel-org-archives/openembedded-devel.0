Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0B39C780A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 20:01:39 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d141so5985098qkc.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 12:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y/86hdpAmfW6D+KKmqByl/FFfkTuM+avrraYkGTz+9A=;
	b=EPbeEOC2Oot1aRr9DcTnojrzsfxI+bwr3JwYqMEPhnbgpkzrbNw/c6yzhLsLz4eIwC
	j6q9i9W/z2kELgFjvJfuP5shIHb0KZGIR6gzLVl5zmdSipeb4asHgJlcSCJpWfNfGjMd
	Aq+nXRCkrdYkM1G6jI7LvgVhX3wlH5/wbCE+CrWtaEihn3l7Jwoxc+wY+c74gUsJRBG2
	w/1zdJIsl3M0KpjtXspnsmQYe09qrSDV5uFxMWpKS/Fn7WKf0H7VNhhP3rmFtpuNDVVn
	vQz0nt2HBCCXHBk0LsiN/HZBDax2FzgGeGsRZ9JfeTPjCgd6foiJ7WVPQSRzDJZ7qswf
	KFQQ==
X-Gm-Message-State: AKGB3mLzdtcL6aLf9HWnFoU1SNmEaKTMR4gBAg34WO7G4ya1EtkSf/V+
	PVEkK+Fo+Rpt9Bd6TZ3O1Pn5I2oI
X-Google-Smtp-Source: AGs4zMYc9M4s+nVIItKPZ758UcZPrm9Ce7aNTsl8CqqPPB7xI9dT6nDfaOmCFbE2QWxg9ZO74SzJ5w==
X-Received: by 10.55.58.14 with SMTP id h14mr74405qka.132.1511985700921;
	Wed, 29 Nov 2017 12:01:40 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	y135sm1734219qka.48.2017.11.29.12.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 12:01:40 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 15:01:34 -0500
Message-Id: <1511985694-17530-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511985694-17530-1-git-send-email-derek@asterius.io>
References: <1511985694-17530-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-chardet: fix the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 20:01:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-chardet.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
index 316e2c1..246a65a 100644
--- a/meta-python/recipes-devtools/python/python-chardet.inc
+++ b/meta-python/recipes-devtools/python/python-chardet.inc
@@ -17,3 +17,8 @@ RDEPENDS_${PN}-cli = "${PN} "
 FILES_${PN}-cli += " \
     ${PYTHON_SITEPACKAGES_DIR}/chardet/cli \
 "
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-logging \
+"
-- 
2.7.4


