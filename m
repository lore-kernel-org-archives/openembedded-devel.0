Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4D97F8FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 07:54:13 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id e15so13710413pgu.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5UOopt6MiBKhlHvFyvwo66zngJXqDdbv0AQ+niciEnc=;
	b=joXRTf5I+mimrYz5RPxr1tlUQfL297ZrgM6/a0uP1ihoqqjjBesS2X4k24caJcvTWV
	2dLm7wn99WAfigLlGvzj46Qf8sHFLHsckk2plccoMtM7c8U5/FnPs7Nv1C78UmOwxdok
	EqY7zYlCaxQBG4YdUkqkbEusUHtXzlKfM4f+nNEvP47w12EDq7Z4IFhYcY+Db2t+KN1F
	UeIUaWYTT5T7d12WfEzIZ0POAGN3I1VcKdKLventls1XerComM4y5qSV0cg8H+Mtno55
	RP7DiVy6A49r+3lm2y2GjNI63QKe2Vw9wISoJp+lD3ftcmfKJZYL88mxCV9bkdKzD6aE
	+LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5UOopt6MiBKhlHvFyvwo66zngJXqDdbv0AQ+niciEnc=;
	b=c31bo9XMCDxXe9HfwmgImDChe44CFOGz+Qp5b5pGyeEZHMc7cioO9pttmAUpu3y2Zc
	/TLQYXS7h/X3PDDNyeCfaY7zIdoYJX+jiAjs9i1nmPplnmKAZ38IKz77dfjxjyrqzrTr
	Zw/I9JNV3ZOPjef8d++bxZJac3VkVK1PXJOvkywnwY8VSaxWOUFUXD5q78eX7jNNtp57
	/Wrl0oACnMHTWsmL7sNs7D5x8zD8q0fkaIcn+WsEuENANUpdadSogriywB1aGk1z9DVH
	wVLcvZgpCDoPqfu+zUTzNhgDR9F57e1Yodk+dQsDxQVcV9y2nrnuHM1sV9bpkssXJZqh
	qfZA==
X-Gm-Message-State: APjAAAVw9yLCcG46eVsY+IXyOJYY6/mmfvUn2RUmmSkdEC4/ZYBp4qr7
	e3z8EevR7Y2V9vGE2TjmynMMXvn5dQ+gWg==
X-Google-Smtp-Source: APXvYqy8/SMPLlXd6dH17P+GPCCY8FNjVvYBHr3WDqU1cX6xl/JS7fJafvIf2rDuYmpKWotFwczHPQ==
X-Received: by 2002:a62:6247:: with SMTP id w68mr16312374pfb.11.1571903653949; 
	Thu, 24 Oct 2019 00:54:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a6a5])
	by smtp.gmail.com with ESMTPSA id k93sm3402431pjh.3.2019.10.24.00.54.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 00:54:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2019 00:53:55 -0700
Message-Id: <20191024075355.2136934-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024075355.2136934-1-raj.khem@gmail.com>
References: <20191024075355.2136934-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/6] upm: Define PYTHON_INCLUDE_DIR and PYTHON_LIBRARY for cmake
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
X-List-Received-Date: Thu, 24 Oct 2019 07:54:14 -0000
Content-Transfer-Encoding: 8bit

Otherwise it peeks into native sysroot now and starts using native
python which is undesirable, this is happening after the oe-core change

https://git.openembedded.org/openembedded-core/commit/?id=7847f431cd8db59fce8c9401a603c4b0678ee16d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index a6b379ec36..fb22e83359 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -36,7 +36,7 @@ BINDINGS_armv5 ??= "python"
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
 
-PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON, -DBUILDSWIGPYTHON=OFF, swig-native ${PYTHON_PN},"
+PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}, -DBUILDSWIGPYTHON=OFF, swig-native ${PYTHON_PN},"
 PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
 
 FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.23.0


