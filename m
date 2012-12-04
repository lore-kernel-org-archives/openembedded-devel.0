Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi4V-0002oS-Gy
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:17:20 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mHEd3fIBY1Z+g2/a9Q7z9cZwOHsKakovDNgDCcsjR8A=;
	b=ay4YZXM4naz4/21WJbKvmeDoD4L9WIXRQweDEoZ16JpST3CAoldkkTjmcm8JoX78CC
	LO5w+ubf4T7A4egR3Pefi/EPuoAv2zbE0eh5uBAT3uKyFbxonWBXI7dY3JMOHuXlyNgs
	OYC8mFXOOoJbLmHgeARFju2bsrxok+rraQTiTwrGF6ujZwj0swBAS/HdSaXoWgAgUeTc
	cdpigrVIRwf3Hza0vQkb0Vvl91M+ZoENpo8hp8kPwgn8nBHOrvN0jjx30P0DWi4+n943
	3CTkv34bR5LK7tuU0Fd37P96H4WnS+Vaslobc2JE9Ck3cTfAMcD+cS4dif9GPzeB10TV
	SVhg==
Received: by 10.14.184.134 with SMTP id s6mr42493711eem.43.1354586579912;
	Mon, 03 Dec 2012 18:02:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm8835406eeo.13.2012.12.03.18.02.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:02:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:57 +0100
Message-Id: <9382358e12ce189239f2fd0d2cb03e062a81a1ce.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 24/58] flame: add LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 02:17:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/flame_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/flame_svn.bb b/meta-efl/recipes-efl/e17/flame_svn.bb
index 11769c6..97683dd 100644
--- a/meta-efl/recipes-efl/e17/flame_svn.bb
+++ b/meta-efl/recipes-efl/e17/flame_svn.bb
@@ -1,4 +1,7 @@
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
+                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
+
 PV = "0.0.3+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 
-- 
1.8.0



