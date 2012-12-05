Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJyd-00009O-Da
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:45:52 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3067516eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kz1rjpSaAUFXyd6p/PgEcbuL8pynIp97ZbHiBSEDk6E=;
	b=OaVGTv7xudZS9U1MtK6k7IlpaD81M46RRMYgvZn9duF/O/q4BCPgBRm674VmTlrF2m
	jrx0tfpZrRiD3adywROecqzjM0JbWbCQXKXC/nxeaxhY/1ga5ttqrDCKfN5DdbozCWzU
	Oo+WdV/rkIVtqCM9711Um8kW3lXadFA3STltK0QiTu/0umEjsBAUHe0vYY2ABukoTdC9
	IGABKg85zJRBi6FoGo7ZTrsGQnMl2rfpDs20qWdz96LTdQwvu4lPF332FquRJZHEB5C2
	yhibZM0QpcPU9zsuhrlG65sKYfznfPods2Bnk214fKHUVuHJ3tK3Q4xC6mtKZuI7xF9D
	CfrA==
Received: by 10.14.177.1 with SMTP id c1mr63298914eem.8.1354732280817;
	Wed, 05 Dec 2012 10:31:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r1sm10711617eeo.2.2012.12.05.10.31.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:31:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:29 +0100
Message-Id: <a0266f268b7c2989372b32b186e9a4854120fca7.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 71/77] exalt-client: fix FILES for PN-staticdev
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
X-List-Received-Date: Wed, 05 Dec 2012 18:46:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/exalt-client_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
index 852ed04..b8c204d 100644
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
@@ -18,7 +18,7 @@ FILES_${PN} += "${libdir}/enlightenment/modules/*/*.desktop \
                 ${libdir}/enlightenment/modules/*/*.edj \
                 ${libdir}/enlightenment/modules/*/*/*.so"
 
-FILES_${PN}-static += "${libdir}/enlightenment/modules/*/*/*.a"
+FILES_${PN}-staticdev += "${libdir}/enlightenment/modules/*/*/*.a"
 FILES_${PN}-dev += "${libdir}/enlightenment/modules/*/*/*.la"
 FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug"
  
-- 
1.8.0



