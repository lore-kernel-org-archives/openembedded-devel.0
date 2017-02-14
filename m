Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id EBE7A76643
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:49:33 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o16so29170343wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 13:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lwYCjueWy/02JvH7TRyc6CVCwrMlrSOiwxWLdnFd38A=;
	b=NKDZP+j9/aBPCPeXzUWt/6iaZqPFcregEupG7VB4eP79ux34qhjWl6H3L7o9ytWByj
	39H1IEotUxNRADu2vQxMFbl1NE2nP0HDPbfV/30vB45XoJDOLDFeVczo83mP79Xgqd+q
	UqSXRFb8yP13RfRJKdMKrbIbtnD3kW7u2J2xMJ4TRAKGnwox3cqoOB79BU5sMpP0RPoc
	VX2UXVZtQMF4j0uRB8YO1rDuA7r3t/MuGcIBhJSzjqxVuuADsgQmimtySPSLCpsVcOPR
	hn+KmjUp4Gbh+991yV3WoICqZyYHMSpWuTDyJJnxQb6y48hWbcuRbMy/60CmXg6LBDgh
	XHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lwYCjueWy/02JvH7TRyc6CVCwrMlrSOiwxWLdnFd38A=;
	b=LuePV5ot1uRmEkrtQmWCZtn2qr5LWIZQJ8z+TOrYR9gYcYbVvOFCBW+o+5b0Jvbv2C
	9LkVLNiiC8cepR37kIyGz/j0xRQ8nQ0OpsJ0M44vDvr4d5TLIFzFoYvF7yTZMLqHd/7F
	3Vx8VCQ7KIbYJf2m948WmfSE0jq7jQafK7L1Yop/gSd3ixuHY9LQHUMDKDty2+vNZPrw
	0CnEmT/0OrKTr8azDOBC4CaBVltV671zR2HCLN8dQTlMBYYRc9tmAx/+LkrXoY91umei
	LrxjkJV4/M4aKYCDcZx4c+tWjj8gezQUg8RAUc4J8XYu+paK0oLigC52ljPjfn2JHIa6
	AhuQ==
X-Gm-Message-State: AMke39lRMdvl9VYQAWLhrh1wsMSaLMuiuDXu6KkuYQPRYCGO8W7o8AbB1eriMoHyllhL2w==
X-Received: by 10.223.160.206 with SMTP id n14mr27125143wrn.31.1487108973250; 
	Tue, 14 Feb 2017 13:49:33 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	u47sm2355480wrb.15.2017.02.14.13.49.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 13:49:32 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Feb 2017 22:49:00 +0100
Message-Id: <1487108941-20285-4-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
References: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH v2][master-next 3/4] pywbem: add depends on python-typing-native
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
X-List-Received-Date: Tue, 14 Feb 2017 21:49:34 -0000

python-m2crypto-native requires python-typing-native.
This fixed the build, remove blacklist.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
index 8b5394e..7f1986e 100644
--- a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
+++ b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.sf.net/"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 SECTION = "Development/Libraries"
-DEPENDS = "python-m2crypto-native"
+DEPENDS = "python-m2crypto-native python-typing-native"
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${BP}/${BP}-dev.r704.zip"
 SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
 SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e633ad07b7c11d89db2472b9f923f3fd3ed8"
@@ -34,6 +34,3 @@ do_install_append() {
 }
 
 BBCLASSEXTEND = "native"
-
-PNBLACKLIST[pywbem] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130596/"
-PNBLACKLIST[pywbem] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130681/"
-- 
2.6.6


