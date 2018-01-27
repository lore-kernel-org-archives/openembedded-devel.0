Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 532A178889
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:03 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id q3so167277plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hz/NvcCdl9GZlWA1WF8JWjGkKMYi9av5bqI4jkURqZc=;
	b=CW/48Pztc4zl/pJHlb6RWwqwFwaKaPaBZ25Oviwo+BBsURrsRtQmxFX1zBADFSsAVa
	tCWo/0z5/8LJajy6ALQkRb7X9JCW97Zu0WApdNdY5pfmMom+RzCyB1qc1OL+L4rZQpHV
	kpMi3tCdrEhVQIEiMyy9KQBc4MtBxt90jsgPpR/C9DpL2z5Ssex6Zne7sdo11Vv1vge7
	KpkRGV8Kw+Yp4INiNHluqnWyZytnWSfrip1epwI6Ddredd2WXbU7x0Xv2m7RYSbTQT8k
	4LVPFXiwY+X0Mb0s5cJNQnAYoR67dDU1TEe8eLPIr7fozQjaqGotKXzOhvtN/6Vxxvvq
	s7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hz/NvcCdl9GZlWA1WF8JWjGkKMYi9av5bqI4jkURqZc=;
	b=bB1/rWx+E2FtR9DKR7jZWRU2/VfyPtDSyZ55WejaRMI5jX1aaX14nr2RnLCV/rCF+O
	ejsxkf5ji5J8NP6Kz8pcvYSNxDoHw4iy2kn5exZDBRcH3Ga9X+cvai7OVJ4uXNI2BjX5
	p0typuLTFUGoSneezXlo90DVeAx8brkbf6HouWQL+soCddbRlJjDtZ+7w2YtpnLFJ+r5
	u0Me82/rMPTEaODi6Hg4x8Mpw81zD1L2kH8RHvuGjPIf0HbexWeyTmYjFUxJT+5WiaaY
	ok+QECnd7Mey2Ox5Fzys1zOBfb2P+3OY5h84x9hYo1p6MSZ0qwpXrWQ2YYtCMuVDqBmE
	huKA==
X-Gm-Message-State: AKwxytf5vxyIDwNUWeOnl3zuk7gLVVZMOcNynTR5F5DV6Eg93U+zK0MC
	NhQaipJlidLehNPtb0vCif8pIg==
X-Google-Smtp-Source: AH8x227rcZlDO0GcuHKjsZblXHq5G/HTDHlIx5q9SOhFhxBrAZPA2dl4hILXrMDtO3G483L7JFzjEQ==
X-Received: by 2002:a17:902:3225:: with SMTP id
	y34-v6mr15718109plb.399.1517023504934; 
	Fri, 26 Jan 2018 19:25:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:26 -0800
Message-Id: <b18def36cfcdcfeaa01b6e9ed078cca2a6b3318f.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 26/36] hwloc: fix multilib problem
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:03 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Use libhwloc instead of lib${PN} to fix problem in case of multilib.
Otherwise, when installing lib32-hwloc into image, we would have the
following error at do_rootfs.

  - nothing provides lib32-liblib32-hwloc = 1.11.5-r0 needed by lib32-hwloc-1.11.5-r0.corei7_32

Also, fix FILES variable for libhwloc to not contain .so link file.
This would fix the QA issue, and the INSANE_SKIP line is no longer needed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 303fd6d589250c4a2ef23342d639348464e1a593)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
index d7fdd82..5a335b9 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
@@ -24,9 +24,6 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 cairo,cairo"
 PACKAGECONFIG[pci] = "--enable-pci,--disable-pci,libpciaccess,libpciaccess"
 
 # Split hwloc library into separate subpackage
-PACKAGES_prepend = " lib${PN} "
-FILES_lib${PN} += "${libdir}/lib${PN}.so*"
-RDEPENDS_${PN} += "lib${PN} (= ${EXTENDPKGV})"
-
-# XXX dev-so QA check doesn't like soname symlinks in non-dev packages
-INSANE_SKIP_lib${PN} += "dev-so"
+PACKAGES_prepend = " libhwloc "
+FILES_libhwloc += "${libdir}/libhwloc.so.*"
+RDEPENDS_${PN} += "libhwloc (= ${EXTENDPKGV})"
-- 
2.7.4


