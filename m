Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIhLt-0008NP-5j
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 16:52:09 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so2063381wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2012 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4MO0LuGVY4awNFcA536pPp92a7fMVAn7tHHxaJts0VU=;
	b=Z7G0B7hkdB77Ol41u/FgWY72V8SxjrE4/+MhvVqUaleh5jl5UikQWv4/P67nr4Q/Tf
	U9WuQa0JbrEGRiCNPtthUpJdqA4R3oBDGVWsLef8VnarqFJzRbfGKO3UBlj8mEn8ekNV
	jDwoy9ugwuO0IRzlKR410Xni5+02CiDWSawtN4rdVJky/LuvqEk3HYjbUQvh9gMjgpUH
	HpWhEOza/1H0eEQsTcS6frV3ORuxdZAwWOeTPFAJYmSPG3SuMwd2RSczGl+tcIbpZQPq
	tXN5iADgdJZKGeeP5bRPRCQZU+ovzMs9QYFsTIJ65zYBoCPJE/L82irkXQy0lkbwi7yA
	vTwA==
Received: by 10.216.145.80 with SMTP id o58mr6919858wej.84.1349102352342;
	Mon, 01 Oct 2012 07:39:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm18937810wid.1.2012.10.01.07.39.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 07:39:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 16:38:46 +0200
Message-Id: <86f588f7112953371da998c58836008803a04a31.1349102278.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/6] azy: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 01 Oct 2012 14:52:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/azy_svn.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index 814fb46..0b333ae 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "Azy is a library meant for implementing rpc clients and servers i
 DEPENDS = "pkgconfig zlib openssl eina gnutls ecore libxml2 re2c-native mysql5 azy-native"
 DEPENDS_virtclass-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native mysql5-native"
 LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
 PV = "1.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
-- 
1.7.12



