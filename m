Return-Path: <trevor.woerner@linaro.org>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 07A286BD2B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 03:16:38 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id c9so6220607qcz.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 20:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/N/Y1ociah3DlNcbRn6/J0BXtMQSMoy8OdK2QxkTSdA=;
	b=afnk56/dq9afkZRcs7PBCTuyBGjm9S5jeOu/S01ebpShouomqqL0Kcfc6WV/vU0Rl+
	30tzbgIrUMsiHuMca+xodYPqRLGCeI4TkjhFSIfxa//hALMifj9X5irOPKDR1ZVs9nWf
	BHJMxrXt0ucoQdG1z5Z94YlL0v5KLEr82/SkTKjP44Mk2ik/Um9iiSn4ssppKOZivygl
	vcCTwReaiS4ruWp+CCyWbosxt2s8cnkp2IUl9H7yCisS/bWfGr7dqujDeIBC8m3hAhjj
	Rmxr2zhWAyF7AUjX2+EwrJnK99lC4FPgyJNVLmC3w5C4esxJHzfvzKGlBcyOAlibF02C
	zxDg==
X-Gm-Message-State: ALoCoQlYVUwhLobT6rCetS57NovtSlUKOsk4T4X8WoRYWsbkRcmQf0CI5/cCZpZButxGgvUbmVZU
X-Received: by 10.49.47.84 with SMTP id b20mr1669613qen.83.1379647000426;
	Thu, 19 Sep 2013 20:16:40 -0700 (PDT)
Received: from suse64-i7.site (dsl-67-55-9-50.acanac.net. [67.55.9.50])
	by mx.google.com with ESMTPSA id a7sm15721328qew.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 20:16:39 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Sep 2013 23:16:06 -0400
Message-Id: <1379646966-3513-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.8.4.rc3.1.gc1ebd90
Cc: patches@linaro.org
Subject: [meta-qt5][PATCH] devshell: include PATH for qt5 native applications
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
X-List-Received-Date: Fri, 20 Sep 2013 03:16:39 -0000

If you perform a "bitbake -c devshell <some qt5 recipe>" and then try "which
qmake" in the devshell, you'll find your host's qmake is found (which is most
likely to be based on qt4) rather than the one that is built as part of
meta-qt5. The reason for this is that the qt5 items are installed to
${STAGING_DIR_NATIVE}/usr/bin/qt5 and not ${STAGING_DIR_NATIVE}/usr/bin. The
reason for the extra "qt5" directory at the end is so that qt4-based items
that are built in OE can live side-by-side with things from meta-qt5 without
interfering with each other.

This patch prepends ${STAGING_DIR_NATIVE}/usr/bin/qt5 to the devshell's PATH
so that the qt5-based native tools which are built as part of meta-qt5 will be
found before the host's.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 recipes-qt/qt5/qt5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 80acb73..7c58b18 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -126,3 +126,5 @@ FILES_${PN}-examples-staticdev = " \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*.a \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*.a \
 "
+
+PATH_prepend = "${STAGING_DIR_NATIVE}${OE_QMAKE_PATH_QT_BINS}:"
-- 
1.8.4.rc3.1.gc1ebd90


