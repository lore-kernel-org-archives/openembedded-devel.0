Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id C1DCA7F872
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 23:25:38 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z188so11813411pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 15:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qgsAilzsIaXbJ9jKwcXfSGSkIwx+gErOySha9Em7O6c=;
	b=Z/mD4JII19PJZ7YvjMCAUlMdnAMhH0QOJ9VpSkbsAfpqhJyKv5sWoXT6t+tbqIlNvW
	KIF10vVlnWmGVSXiCFLOftzZmGStvEU88J1YD/NeiSNLFpIl3bRQUXUdBZzmVf5GC3ZT
	wXA9iQkQv/pA/Y7OS/0qsSr6Vii/QCbXYg0o3f/wKAhD7uTpEgzdB/zfawpDDVoabpla
	v5l+K+uOWxjP4Swuory8sryJED16lIosPxddubhdL2dypcjIpFlSFvlZG5NI1nhvvNri
	Vm9dHEhPw8Z1z6MOPngRRhxWlaK6pV1k5LcAEq2wNJJ7eB/4OMIxT9m2tMxEDQx+iOc8
	kxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qgsAilzsIaXbJ9jKwcXfSGSkIwx+gErOySha9Em7O6c=;
	b=U6vHaKrYTOgBCqRCTW3+k8qgMGupUdsFvgxxUpJI/OucTSJuGtKfiJgkgb5dhvZloD
	dvo8RA+xM6L6qEhnWAoXeZ02NB7RKKrDFWxir6ro1FUFVv7TA/0jqJ8/bv69dGIgVDcb
	8CWTDJ6JYEJgM8yeFzxyqjqe6plyXLpyRRXbYxdqiBTrkeKCLm0Hmx9PSAUXkT1WfTcD
	IdYoc6oIdnFXFy2iNKgxP0UWYfWW7DH7MMBfziqN3C95cyi3jLNd62KgSRNvW22GhBGz
	YVphj7aTci/gOZcY9n4S4xKiBXtT4DnmVqEgvaq2bmjBEZm3zkX6TMczawEAsItPxnDw
	fQCA==
X-Gm-Message-State: APjAAAV1bZkLEUwMsDYQQqxS0vPkQ6tx08rxme0hq6DFnv+ISkuDeZCT
	qctFaSzC3PTaLXSjGVQ3tmgtLzXl8QU=
X-Google-Smtp-Source: APXvYqxyQ/pMdgCkVYA+Yrsr1iZMJhjbDiwSH6aXq4R4yk7WfpeOoNHg6KSx8qxsv/sSKj1aJWl2Ag==
X-Received: by 2002:a63:c5e:: with SMTP id 30mr6266790pgm.93.1574897138943;
	Wed, 27 Nov 2019 15:25:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	y11sm18642993pfq.1.2019.11.27.15.25.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 15:25:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2019 15:25:27 -0800
Message-Id: <20191127232527.2171217-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] tvheadend: Demand use of py3 during build
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
X-List-Received-Date: Wed, 27 Nov 2019 23:25:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index e31fc6bb85..a818a961f3 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -22,6 +22,7 @@ EXTRA_OECONF += "--arch=${TARGET_ARCH} \
                  --disable-hdhomerun_static \
                  --disable-ffmpeg_static \
                  --disable-libav \
+                 --python=python3 \
                  "
 
 CLEANBROKEN = "1"
-- 
2.24.0


