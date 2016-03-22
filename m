Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 43B0765CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 15:28:35 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id p65so168860333wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 08:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QEEjQUcw582wDdZ+Fix4UVUKCEBGNuOIx4ORH/ETx1k=;
	b=dM4G+viJH9QUoSdmqUX125+UkVwWnR8nRn0Fb+OABIyc3whyVKzKdEqhk12QaLVXWx
	Ibq75qF1/D2ZzkuABPNcYIzoYRWWmd7fnlSATPWmA6BGwX9swNqz4KFDpQ9w2gCGlgyS
	VYdYpUUai9GIqQ1G0qfVS7mlpOoSyrHYYF7QKwDF0lulIgEgv1nn2vhO3n5gXnN5w+7Q
	GnNf8XfEL4NZ/Zjs7bymuV0sxCkcc46tB8ncvmdXsTlUIqdfDIkXAjJcFzISs3uh3IWL
	tamwkY9Aiw/X1dTjT6zJT9B5YPw/mX5CN3UyZEMk4Tj7W3Cv7HoRpdb3lqansPYRYA9d
	Qk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QEEjQUcw582wDdZ+Fix4UVUKCEBGNuOIx4ORH/ETx1k=;
	b=jLp31NkX/Hrm3W+jEH5HSHiedK20uwpMtXGUSWMYBBUJ2RyjFMq2a+MpNyMMYxce+l
	GWtkfj/JGv79cJiEU7Rj1JbzUl80IyM8L5UY7PQ9Q+1QW3/HrWDpjzDEfxG7qmFc9g65
	TIe9PkZzhgoii/2T2F9WTF1ocg1covsW2kQPRX0f1SzrxNagM2Ltiy9XnHVcNlsARtju
	g6DXD9XL6YI8PTRpWzGE60rcuCSGAo8P1ielwzqfg8Rp2vPLsyJl8mJRWAflvlVfCKiu
	SVKV/+IP/XvHT6PLvfV+6kXaUzD8AF8wpCQUBz2xjpabCXCm9uOrTmg2ck6aOuhkW9Nd
	UwtQ==
X-Gm-Message-State: AD7BkJJMO5iYuXY0S9GjUDmgdC0TM4lVNTTItRtA4GzdQFFfmEkgSq6nf654R06Nq1J1ZA==
X-Received: by 10.28.23.75 with SMTP id 72mr21436961wmx.50.1458660516194;
	Tue, 22 Mar 2016 08:28:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u3sm17805364wmg.15.2016.03.22.08.28.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Mar 2016 08:28:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2016 16:32:58 +0100
Message-Id: <1458660778-20527-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-oe] jq: add dependency on onig
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
X-List-Received-Date: Tue, 22 Mar 2016 15:28:37 -0000

* configure doesn't have config option ot disable it and it's autodetected from sysroot
  causing:
  WARN: jq: jq rdepends on onig, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/jq/jq_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.5.bb b/meta-oe/recipes-devtools/jq/jq_1.5.bb
index a3c171e..612eaf3 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.5.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.5.bb
@@ -9,7 +9,7 @@ SECTION = "utils"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=29dd0c35d7e391bb8d515eacf7592e00"
 
-DEPENDS = "flex-native bison-native"
+DEPENDS = "flex-native bison-native onig"
 
 SRC_URI = "https://github.com/stedolan/${BPN}/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
 "
-- 
2.7.3


