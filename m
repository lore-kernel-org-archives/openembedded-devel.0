Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5904D6AC7C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 05:31:27 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bj1so226987pad.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=P825sm/OTChnYN6ZgM5XB3+oT2o8Xku5UyEOeNwcQqM=;
	b=OgVRJKB1a6W9tzVNYONKl6SOGxJU5pwL1wx0cYMGXqvbBkBPiPbvIag8SFYnrH4gKq
	qhZYxanWRAECozLRQ+RBYbg6VawR2LC6g/ADyBA/6X+MuFhLUsQLhbOQAIxCSJ0/RSY3
	q75ILa9TtXPWItamybHZ3ECWEUKNTfkywpfSGkRyfdFESc+aPAypwztZy2DGjvpjSk0P
	E8q6OsXuCvrQ1oKv8nYty3WjSPUikvfAcFSv547xmXzPDDO0BL/BoSUlz98H0jUzuF5w
	Be5nV/bk4TioYMb2Hchy2G661t6gMRY2Tb1w/YW9UsW2QH1cd2PVobihoifIioDRMPFH
	F5bA==
X-Gm-Message-State: ALoCoQnGNE/MXA8yYNYoqrMZI0yS/4sX7SYF2eRdmEHB60U2ei/fLLezNWOdNenr55OSRx8KmSnr
X-Received: by 10.67.12.171 with SMTP id er11mr1102883pad.132.1405402289101;
	Mon, 14 Jul 2014 22:31:29 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	i10sm53662680pat.36.2014.07.14.22.31.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jul 2014 22:31:28 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Jul 2014 22:31:25 -0700
Message-Id: <1405402285-29775-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] [v3] lz4: update to latest version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 05:31:37 -0000

update to version r119
Use github instead of svn
LICENSE md5sum changed since it was updated in r117
FIxes CVE-2014-4611

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} (68%)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_git.bb
similarity index 68%
rename from meta/recipes-support/lz4/lz4_svn.bb
rename to meta/recipes-support/lz4/lz4_git.bb
index 38e36d8..3978d76 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_git.bb
@@ -2,15 +2,12 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
-# Upstream names releases after SVN revs
-SRCREV = "112"
-PV = "r${SRCREV}"
+SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
+SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
 
-SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
-
-S = "${WORKDIR}/trunk"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
-- 
1.9.1


