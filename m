Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7D90E70057
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:24 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so105232582pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=B8LAMcDngtIJiLvqrqjD3V1SFuANNCNMPkLx+MChr8E=;
	b=mXoxu6DEpADuNPOQoy2B8LGPQFZaJAI5btLvaACCjQhAGZ5nkkIzqwEdzDHmdYzH8x
	8r1dMpMg2x0mI29Ufck+9cMWbIwWaf5ZFRcnXpbKhlXmSUyErdxsFT+JECNjVDFcNvAc
	ExSoxvF422uMBXr1m/m9omvjBb1ZnXN+oDkjJWwtSG3OXxkuyeHSCIHJjg/zgty4C03Q
	uaUwLluvwrqGcpJqrkPALo/BZPOM+fqV4O6JZ/hxFyCQCniQHtnUYiRpDbN1jd7zPxI1
	J9rFfQjsMk5KWBSXbpVj0COlcvZRWIiBN4ZleK22iP1QgDnfyqua/Mei5pPgoLGHIlSO
	pSDA==
X-Received: by 10.66.142.168 with SMTP id rx8mr46334619pab.16.1450107265785;
	Mon, 14 Dec 2015 07:34:25 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	t26sm43274642pfa.52.2015.12.14.07.34.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:20 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 4C10CFCC839; Mon, 14 Dec 2015 07:34:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:33:55 -0800
Message-Id: <793d35d5abcfb33d93d9a778147db16cffd8b02f.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 02/14] netcat-openbsd: replace patch with quilt
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:25 -0000

From: Yue Tao <Yue.Tao@windriver.com>

If run bitbake -c patch -f netcat-openbsd twice, the patch conflict
will happen, so replace the patch with quilt to avoid do_patch failed.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index 12409d4..89a646f 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -20,7 +20,8 @@ do_configure[noexec] = "1"
 
 netcat_do_patch() {
     cd ${S}
-    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; done < ${WORKDIR}/debian/patches/series
+    quilt pop -a || true
+    QUILT_PATCHES=${WORKDIR}/debian/patches QUILT_SERIES=${WORKDIR}/debian/patches/series quilt push -a
 }
 
 python do_patch() {
-- 
1.9.1


