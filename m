Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id DE8E571A80
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 19:01:46 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n6so41512022qtd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 11:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WHjuPubL//JTXSdGQOaqEvCPkMLzYxhH61PmjaLg8H0=;
	b=QuIfFXYtx2ws65nW7/AYZ/XIp6AKi0Wgms7blhKYPd9faU1X2fXRoPZhOt9lQPwg3D
	xklLBSLFZmRRfzgfJ3Wy6wubVwY75X/K5mS7xOpYtoxHLbNoTvYu8jUUapTb71rw9rva
	6ayfeko/dBtH7B85Vor6n5bDO18jhmFCauuXmXQsK7DHikeBkZxyoGyRyx0gIxPODKMy
	aB8ubQGrjHNsxEMT1CGzXYgyskSwYsLbF/UYfi165bkMbDo70+t4t/w7tDymMWElefOD
	JWooqohHK8oiaIU376wfl7GugHmsezmGvB+RkOaFxczsfNcM+iEqSlE6RQEIC/H86+zm
	xeKQ==
X-Gm-Message-State: AKaTC03UXGMmrPQL9skCNePYZUk+VoRoVIpu9eAF8JUDKDRv7OReHWGW4kAJyPyJkQl69A==
X-Received: by 10.237.44.97 with SMTP id f88mr54747564qtd.11.1481050907765;
	Tue, 06 Dec 2016 11:01:47 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	d84sm12744362qkc.33.2016.12.06.11.01.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Dec 2016 11:01:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2016 14:01:40 -0500
Message-Id: <1481050900-9857-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] pypi: add default values for UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Tue, 06 Dec 2016 19:01:47 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/classes/pypi.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index 3d81ab3..e5d7ab3 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -21,3 +21,6 @@ HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
 SECTION = "devel/python"
 SRC_URI += "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
+
+UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
-- 
2.7.4


