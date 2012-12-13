Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHi3-00074M-B8
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:55 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1522532eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=xMlK/XfRWgaCG0MZmW2u9poAL6I8n2aY4brGucIUacY=;
	b=b/50yipY1wcBwHQ4xBhT/lryQ4OzUDdMK7N2ga5MDYrjbjAM3hwrRH74JxJiBzkInQ
	CpM08rM0Oe2floioz28RIKbNHcC3CYKwFMvinlx/D1p2KYzxFq++AJSf5TQ/C76zHQ1y
	rdeNV1o2Z4w3BMXB5MXo1oyVB4oSUlsNRUmQ/O4taQHFiqItpuVUB+yEgIsJmVfFOekI
	bX41LTZXbP3pfj1a3l9mMZuBy5iAeZ9t5kxyp6yL/iOiinRemdJFQ4Gl4veYtMQ49AXd
	GSWfQgDI6DTS9eF0A/ZHxoCBDF/ZZ0xGcWJYabSivw7pFABCOtriY8guVk9CF5A9Tg2Z
	BhqA==
Received: by 10.14.207.6 with SMTP id m6mr9320010eeo.10.1355438540200;
	Thu, 13 Dec 2012 14:42:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q44sm5688413eep.5.2012.12.13.14.42.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:42:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:51 +0100
Message-Id: <47f455af8d9800e7cc8bb6190c1a70f16c07acf5.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 11/11] lighttpd: follow oe-core to 1.4.32
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.31.bbappend => lighttpd_1.4.32.bbappend}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-systemd/oe-core/recipes-extended/lighttpd/{lighttpd_1.4.31.bbappend => lighttpd_1.4.32.bbappend} (85%)

diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
similarity index 85%
rename from meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
index b016bdc..0e08358 100644
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-- 
1.8.0.2



