Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 065E37D2E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:28:31 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k17so21332277wrx.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kYf/zcIK0BaL6lMjz4ckdaClnqMXQKDKV1dOG1xrRIc=;
	b=M/A+zJUxJEi1lyu4+W+Ta7QNzZSlklNSpJ5PgxPtaW8F7UoM8MYArXO2qV0A9R0tIB
	NmQyMS2RwE+gwbZSOCo8FpRNAxoMctdESJMdgMwtqe15e7RumPNJt51ntCEoN73F/w/N
	kuCvueTuNBvAJbpZtnzu6YnXOcMftet9xxfYRkTg+TZWJ4MNZKHm1CJWM0BnZ3J/zx1G
	Cj2WJEdrEliuZOYuJkEw6hZHD2tlsS+4XHvKr0MhO6E9cIEi6eqChjCf88YD6l6Hf8Ro
	+6G4mPq1UHmsVRmuP+ZqQRXmIzJGcUaNdjXVbSRkGTzKiuhAjOEpLWYc2/fF8PXXUkua
	DNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kYf/zcIK0BaL6lMjz4ckdaClnqMXQKDKV1dOG1xrRIc=;
	b=KvxtwKzRoftL0SuTyxjxE5NgHFaMvmQYBKGN3Vnd/YoFnQKoe/rAVD8xZCGjyaSoPI
	9EwGnSjRg1uH2qBjFB6RIvkGvh09IjCCsKK7VWcSZkJvluy8RQoHbbeLBFig8Wc0EV4H
	6MI2Zl6a8+ydlQPosunV5itNQdl1QmZqrSqPDY60OiphPDRmP6a/cMMNjbojcF0rqZ3g
	hF0UIrD1hv41cYbKGLcFAoMXnnGyWoxqITP/J3mG54sfjWzRIQtokjiP0LkMjAw4/8HE
	izfnVlYDt467aZi/Up+DYsGV+xff3ZefukOMP7c61mqKEQ1VTpC6/oLOUeDimCOtyGQZ
	TLHw==
X-Gm-Message-State: APjAAAXI99AEHLQFX344mfbWCrL8SXY6IgxjxyNbsFbT91Oq2bUKo3mV
	KADA9dn6o4zPzQeQObqmYwDsITEUBGWsdg==
X-Google-Smtp-Source: APXvYqyMUi6tE3IhgELe+x36Auhgo9+G+MWAYl4d+WoZBGGzSCRkZU/kVoUP/biPC9uTQT9omtEXPg==
X-Received: by 2002:adf:f088:: with SMTP id n8mr6819743wro.112.1554298112430; 
	Wed, 03 Apr 2019 06:28:32 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.155.216])
	by smtp.gmail.com with ESMTPSA id
	g13sm13221490wmh.11.2019.04.03.06.28.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Apr 2019 06:28:31 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org, bunk@stusta.de,
	martin.jansa@gmail.com
Date: Wed,  3 Apr 2019 15:28:14 +0200
Message-Id: <1554298095-26709-3-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554298095-26709-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1554298095-26709-1-git-send-email-vincent.prince.fr@gmail.com>
Subject: [meta-oe][PATCH v2 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 13:28:32 -0000

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
Changes in v2:
 - Remove git SRCPV from PV

 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 9aff59c..95b5215 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
-PV = "4.2.3+git${SRCPV}"
+SRCREV = "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
+PV = "4.3.1"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
@@ -13,6 +13,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+EXTRA_OECMAKE = "-DCPPZMQ_BUILD_TESTS=OFF"
+
 PACKAGES = "${PN}-dev"
 
 RDEPENDS_${PN}-dev = "zeromq-dev"
-- 
2.7.4


