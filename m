Return-Path: <anders.roxell@linaro.org>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 409FC6CE9E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 14:09:21 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id x18so1645160lbi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 07:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=av9JEwpLiH77LGUq3GLTxBdBsqGhhi5xMP4BBpW1Krs=;
	b=fl43xFCLwvJk2l+hEACloYgi5iz8DX/PdTJinxSrMObkdfyF9qpuVmVmzHFIWAyOEZ
	CEWy4mWCo0OIsVhm01ZfORM2uFztfS4VwLtzFwDIlT9DKFsaiQhEQpnvnr5psmHJiAsP
	piRnRBNKf92BNoPRhlo5+PH1T+rdbCZX+mnCEDZN3vDc99F8DZyudPTGoJUF3+NtFj6P
	lsgaPE0yI8t53OzM98CiBNRJSiABhGhXGVIG8y5PV+lkdV6mLlBS6DvGot0AP+lnsNz4
	HVdmCcbgP+Ux7zbc6kh9k2G/m/HgyYsto17+x0+SJTvkMX4aQ3afBU3/FV4726uRuTFq
	iZCw==
X-Gm-Message-State: ALoCoQkXOdDyhx+bmmYNuGXsCYjfFRkt6SqjHOPd9h739doNRnjC4HQnRtpFAePEUDa3nXk1F2kx
X-Received: by 10.152.20.74 with SMTP id l10mr1413830lae.46.1382105362440;
	Fri, 18 Oct 2013 07:09:22 -0700 (PDT)
Received: from localhost (c-853670d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.54.133])
	by mx.google.com with ESMTPSA id ac2sm2022344lbc.10.2013.10.18.07.09.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 07:09:21 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Oct 2013 16:09:07 +0200
Message-Id: <1382105347-27538-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: linaro-networking@linaro.org, patches@linaro.org
Subject: [PATCH] libhugetlbfs: add support for armv7a
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
X-List-Received-Date: Fri, 18 Oct 2013 14:09:23 -0000

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 24480c3..4f1bfa4 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -20,10 +20,16 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
+COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
 
+python __anonymous() {
+    if base_contains('TARGET_ARCH', 'arm', True, False, d):
+        d.setVar('ARCH', 'armv7l')
+    else:
+        d.setVar('ARCH', d.getVar('TARGET_ARCH'))
+}
 
-EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
+EXTRA_OEMAKE = "'ARCH=${ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.8.1.2


