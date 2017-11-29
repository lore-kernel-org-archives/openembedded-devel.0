Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1D37F6612D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 17:57:48 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j5so5404345qth.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 09:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dwm11aQQHtOmtbVEKWVqpcTJF2I3As+36LTXNQpyCSY=;
	b=fwSv0Ee0J49bD4kW03a5AAgmnQ6dLWfslqHrX3xA9Q0ogNAeUY43rtZr8IEDl5neyL
	uHHXMwdVx1h2WQzSJsxm9jH/GIKouisfUFBwoo3RrWaF98XcyuoeLkYaGu7r7vsUvM0w
	hqHRDYva0dSNXnI7xkeQlY1WnjCk4n8jZ2UuXsDUS4ocCm+hlmrTVoAtbKoDd5zTwQxm
	ZaQKNDlZHaZD3YUDfYYxle0O9VvsaCu7eJmc18a9NGTF1bFDN1RiVFLffcnqaj6zU8a6
	zRP1DAfWJZvND18DOYCS4EeTTaaX3APeOxgYjR9aEQM3qvlYGg3Yazmpd6am+QkdgOU+
	GhTQ==
X-Gm-Message-State: AJaThX4PKhYEOAPZ8stOQo1XRYDJ+F/fpNocrsqD0uAI+1Mu9T/ELSNQ
	daN3AkcD8OAXK2/68bRAbhSO8kAK
X-Google-Smtp-Source: AGs4zMaJ1r+eom6XN5KQaveW483vqKhPO1Or3TviyPfnoe9Wat6z4h0yslxb88CJ9kMlJKtv8zgJYQ==
X-Received: by 10.200.45.215 with SMTP id q23mr5791723qta.57.1511978269631;
	Wed, 29 Nov 2017 09:57:49 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id z7sm1616209qtz.40.2017.11.29.09.57.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 09:57:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 12:57:41 -0500
Message-Id: <1511978261-7116-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-ntplib: add the correct RDEPENDS for the package
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
X-List-Received-Date: Wed, 29 Nov 2017 17:57:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
index 35440bc..080372c 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "c4621b64d50be9461d9bd9a71ba0b4af06fbbf818bbd483752d95c1a4e
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools3 python3native pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-selectors ${PYTHON_PN}-enum"
-- 
2.7.4


