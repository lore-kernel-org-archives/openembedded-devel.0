Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id C899E731D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:26 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id w36so56366708qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=xR3EQFH9sSZ96/m8C3AfzfUuG71XUX0W5zua0TEEyIk=;
	b=lHMj2bQ/GBdQ+3ue3jVscCnEHSF8drsV855fRwcSR/bAkYxZKDiaDUXwEddqAltJur
	h8w4dZWjBs7Q7pRNtG1o2gQUlJwYBBaaVdjSaWEyp3MVzOFA3t2kROE1UsTryFxKSPAe
	TDDNJ87rvIdGSCtFkWkh9a/2XJy8CvcrGwpKdbuA/hngThWdeqbuVeOQdRkiyxJ6Js2t
	/6Vd/4mhCICD2tqCKBvrGjTqCpUjMk2Jp4I1smEsUFSYZQxYvKmqaqrYxUUmLyD8Ke0n
	Ui9GA3P10YBExDvORwFYdxt+Nj8w2cxQ4vPXVZgZAB/NNA6Yc11hbOTUFQFVumebamvX
	Kn9Q==
X-Gm-Message-State: AOPr4FVia2v/M5GnA6Bna17biKuuyga8z9XMZPs19oqFoSU2v2kPuPd7To0ixSfw6CXDEg==
X-Received: by 10.140.20.45 with SMTP id 42mr19826408qgi.15.1462543347147;
	Fri, 06 May 2016 07:02:27 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id h83sm5760947qhh.4.2016.05.06.07.02.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:26 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:21 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:52 -0300
Message-Id: <1462543259-7206-15-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 15/22] xfce-polkit: fix warning not able to copy license
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
X-List-Received-Date: Fri, 06 May 2016 14:02:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

COPYING is a link on LICENSE. It seems that cause the warning so use LICENSE.
Fixes:
| WARNING: xfce-polkit-0.2-r0 do_populate_lic: Could not copy license file /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/xfce-polkit/0.2-r0/git/COPYING to /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/xfce-polkit/0.2-r0/license-destdir/xfce-polkit/COPYING: [Errno 2] No such file or directory: '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/xfce-polkit/0.2-r0/license-destdir/xfce-polkit/COPYING'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
index ab720f8..1fb4a5b 100644
--- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A simple PolicyKit authentication agent for XFCE"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=758b03f872a88c99fc36d50c5932091c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=758b03f872a88c99fc36d50c5932091c"
 
 DEPENDS = "libxfce4ui polkit"
 
-- 
2.8.2


