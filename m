Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkq3-0001mW-Lv
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:39:58 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2496607eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=pA224wACnWJr9tgSC9baVJyvnhR83rkes4izCFCXtrY=;
	b=mOn1A7K5ZPBPFtgKzf8jAIq6dJA2+3UG9Fvhv0w3eEQB72D6zLtxqk9tBi18+SvmU8
	XI8+NVzfYWtPkF3VquFqzHjUimOZFZdQzZppBxkdFgGlLXgG2ognA0GENxXc2CPKSyAB
	OMx8oXIMa/HF+JRKOXFbEOAZ9aS9r+SnakFsxrgFJfu7/LASj5xwodZYkQqyzWmgnbMa
	53mF8/JWWBU7ZcumuFt1RssSzHy07dOvngpc0NWGdsH1WpjhbniUCteupgNOR0JzQon4
	UCmnKA3p1EtDroVWIxrEN7GnlOQg9PEfBn33/bzOqufQxJ9qMYaUOOa9wymf1fKxcpv7
	BapA==
X-Received: by 10.14.204.70 with SMTP id g46mr22066548eeo.15.1356265483393;
	Sun, 23 Dec 2012 04:24:43 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm34560784eea.3.2012.12.23.04.24.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:24:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:44 +0100
Message-Id: <3c80ba29b02547321989e27a13f286b011bb8f89.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 19/30] libmicrohttpd: change SRC_URI to mirror with old archive still available
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
X-List-Received-Date: Sun, 23 Dec 2012 12:40:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
index 0fb9b4e..134e2e5 100644
--- a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
 
 DEPENDS = "libgcrypt curl"
 
-SRC_URI = "ftp://ftp.nluug.nl/pub/gnu/libmicrohttpd//libmicrohttpd-${PV}.tar.gz"
+# ftp://ftp.nluug.nl/pub/gnu/${PN}/ has only 0.9.* and newer now
+SRC_URI = "http://mirrors.usc.edu/pub/gnu/${PN}/${P}.tar.gz"
 SRC_URI[md5sum] = "61698da6aa04744ea076c327f66fc05a"
 SRC_URI[sha256sum] = "0cb09e26678d1531a4fd40a748abff5142bfdad3ae11cfe3bb7ad7317a99e371"
 
-- 
1.8.0.2



