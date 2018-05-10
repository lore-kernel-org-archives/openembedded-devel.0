Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id ACDE2750EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 03:32:57 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 144-v6so1480429iti.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 20:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Hne7/EmMWGUHecEn0qb2X57hiU7VnjtSat+xaggKGPQ=;
	b=Ow+XbgAkYf7fQ5lNFpeuHNgbqQ63eokT0/jddpwHpdiWxDHxrq+Aj8ZlIlg3Do4Tyc
	uG1U/RRyzNsQLgIqJXuN84Jy9M89JD61WqSdhqZ1sDoZvzWgzmlldSbKjyqzz87Pfxph
	6n9MWuAupRSrXrMHU7Vy/ItDRr7DfU1qYwo2+4TGrN14enynoddYIhlmRzvw5Th4MTpR
	X4XeuCUYzkyB8pZfIDDIC1jh/sv31Ii5hIlZeSIjNVA63UAjH6sB3SnILZRhQna9W63L
	2M58RFwd2Pc1IoHVuT7TMDa3WbxGYc80JNBXav80EzpwBGYWr3ChcZbHk7tHwmGehUZg
	RDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Hne7/EmMWGUHecEn0qb2X57hiU7VnjtSat+xaggKGPQ=;
	b=G7iIxVJj1uBShwUgnezH3sYlWvTaR7zdFjPKkeptru0YMsesr8LQBni9/xrJ8R/nwi
	UzluaD8pUvYovoqDqYP2mdmkDJJTfJIU2ijjTNPQ1ffveIbY5Am6qpHV/rydwIAVT98k
	Pfuv5DRwahzm1y8Fy4uIOctkh90+h3BSkxmpmXcAV6p3L47rtrv4N0bJNOw2SruajxSn
	0Gcs3BUBS/Gn1FUxxAygRnSLRJXjI8DBBB0mSDjP0YbowaacKDfFdAMTAe2Toc3VLj4K
	ugSVN9KW4cLgwayYJl8hYjbTIJ6hMtXN62x9IgVoMF8lk5dOVawxNaU8ZIs8eV/K3CXd
	JZrA==
X-Gm-Message-State: ALKqPwc88EA1qV5EDZSFRahvYutwfzVm2LLQcz0CiY6aEmI7Z2BVxhbC
	o/Gu7qfRmd6PD18yRlqqfNabRqv5
X-Google-Smtp-Source: AB8JxZrH5Dm6OaI/jY7+MJiauc1GJYBLF2kmvuHL4WPbgF9VKBYA1OpP+rAfNaxsviTD4QRubMv/2Q==
X-Received: by 2002:a24:6bcb:: with SMTP id v194-v6mr82057itc.66.1525923178068;
	Wed, 09 May 2018 20:32:58 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	e18-v6sm32177itc.3.2018.05.09.20.32.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 20:32:57 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 23:32:52 -0400
Message-Id: <20180510033252.28834-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-networking][PATCH] ipcalc: switch away from github archive
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
X-List-Received-Date: Thu, 10 May 2018 03:32:57 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
index 3e278db688..b45642404c 100644
--- a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
@@ -6,14 +6,13 @@ SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+S = "${WORKDIR}/git"
+SRCREV = "8348808a7869ca8f25a5b5deeaa418c2f6d52758"
 SRC_URI = "\
-    https://github.com/nmav/ipcalc/archive/${PV}.tar.gz;downloadfilename=ipcalc-${PV}.tar.gz \
+    git://github.com/nmav/ipcalc.git;protocol=https; \
     file://0001-Makefile-pass-extra-linker-flags.patch \
 "
 
-SRC_URI[md5sum] = "343db932a3ad407328920b7430965faf"
-SRC_URI[sha256sum] = "bf1b95eca219e564c85fa4233fe65342963cf3e8a303a7e10b4dd7269c864794"
-
 export USE_GEOIP = "no"
 
 do_install() {
-- 
2.17.0.rc2.3.gc2a499e6c


