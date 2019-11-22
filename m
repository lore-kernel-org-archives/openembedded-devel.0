Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id D4AAB7FC91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 01:25:38 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id n13so2667944pff.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7/LVWwf0n6/pKyzJOnj71pjO/+4hIlC5HPCnQn0OgAk=;
	b=XhopeL4/L/jEqaIQGxmJPqbb5aeUR3/M/qAtw7QuKyQ+Q5vMs8Ndn9aN+2U3N/4m2o
	4HTkv8W8MqajHitkBzLt5d9dcuiI9m+PmykBdqwHykDIEjPej/5/+N7PeyKki1Yh05cJ
	5tjGoLFTb9yDJ/LLVjPtR+GKNteCA2PxykGKwckV5trFSJGdScNu0S7lt4z0f6bRgwj2
	h9XSytr+8kXBLjNptdgwz9uU5AMutL+5+75nRwWZbh2wwzDUa+91NFElvm8AN7xLLg8b
	ETN8YzI5Kpwb3iatguPnUCWqd0qEx1riAP/jQ7zjFwmZjIC7lLnSzvSGWjApy4nIQgAg
	Q0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7/LVWwf0n6/pKyzJOnj71pjO/+4hIlC5HPCnQn0OgAk=;
	b=lgfp0icVzFt2q8KGg/HkFeIJdE93oY4H8uW6/ZCAyk1dsE8un60eV4qwSW4c3ii6Vq
	6o0LlCJgGY72WJ+kl26CuJgHvRi5RsUGy0h1f5FMJo8dXlQ514mcLK00Opv2Y4cbtMlY
	SIvpqxQaJlNqdFqHFTTxhI4xb3smaWzGaUE66gX9CIW5Ufnfx3MMl+KKFKdrlSrYFPcJ
	W2OLqM1e231WNgl9/PtxEj2hg01FqlHlDEwPcevE83ySMgbcEuBYLRD13DnnyW6/zGVW
	YufzrteB7caw/TKtxx5h4uSqY55+ceWqqkbvrQ03UyMfnfcMaIzD7mp50iNZrvyhHCeG
	yQVA==
X-Gm-Message-State: APjAAAVQlYEGZ/FVI6YUguOyjnBohzFUdDQUZKdde2rf9F54M843LiVt
	cJSKeOAIZOS1/zCUpyhsZGW98GFjuss=
X-Google-Smtp-Source: APXvYqyvdLITsTEKWFJM/8plrINsXvpokjNrN9jHA3hKug65/CjXsKespdA1pph++hm+eIbl+abhCw==
X-Received: by 2002:a62:2f01:: with SMTP id v1mr14526229pfv.73.1574385939555; 
	Thu, 21 Nov 2019 17:25:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	82sm4953635pfa.115.2019.11.21.17.25.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 17:25:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2019 17:25:26 -0800
Message-Id: <20191122012527.3260265-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] sanlock: Use python3 and add sanlock user/group
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
X-List-Received-Date: Fri, 22 Nov 2019 01:25:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
index 9f7ce9c570..8e411e4969 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "libaio util-linux"
 
-inherit distutils
+inherit distutils3 useradd
 
 do_configure[noexec] = "1"
 
@@ -32,3 +32,11 @@ do_install_prepend () {
     oe_runmake -C src DESTDIR=${D} LIBDIR=${libdir} install
     cd ${S}/python
 }
+
+SANLOCKGROUP ?= "sanlock"
+SANLOCKUSER ?= "sanlock"
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system ${SANLOCKGROUP}"
+USERADD_PARAM_${PN} = "--system -g ${SANLOCKGROUP} -G disk \
+                       --home-dir /run/${SANLOCKUSER} --no-create-home \
+                       --shell /sbin/nologin ${SANLOCKUSER}"
-- 
2.24.0


