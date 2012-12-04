Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfyID-0003Gk-P4
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 20:36:34 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2422155eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 11:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=aWVmGtsoIUMWCkwh2Gt+naJ9i/0wl2rYQ8/rvYPPVfA=;
	b=TKIpFeeUO49LroKnAqWRxewT43Gwo5Cph96XfS/CyKBakE827j9ZIlVOasGvJP5bN+
	HWgXa9cVtp2AfnTR9EBulAe6EMIJX9nqId+0PHBXs0GoJKHArHOGgiPWx5xmWoXrSke7
	uukEu6M9XDmozsyrJqT3n7xCgzAgZkAuC5FM2fUODXAMcFO9u5MvpQgbuUp4mxFrPU4w
	XPhUA6SXpovL0fQzKPyaKQPJM9Jw1JlJwVa840kDMTNs/vEK7xLPvESQ58iP27ZKgP+z
	FZhyrF+P0VtPpnjuXxaELD9yV0KiqYKBnOa28VIyNLMTO2PWl8ZyLfFwQCbpao1+U9G5
	ELKg==
Received: by 10.14.178.196 with SMTP id f44mr51928084eem.14.1354648933185;
	Tue, 04 Dec 2012 11:22:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v46sm4336110eep.1.2012.12.04.11.22.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 11:22:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 20:21:33 +0100
Message-Id: <061083249fb1a65e919442470af91b0f787071dc.1354646880.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354646880.git.Martin.Jansa@gmail.com>
Subject: [PATCH 64/64] maliit-plugins: Don't build the documentation as it requires Doxygen
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
X-List-Received-Date: Tue, 04 Dec 2012 19:36:34 -0000

From: Samuel Stirtzel <s.stirtzel@googlemail.com>

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/maliit/maliit-plugins_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
index 2fb52c7..7a1a430 100644
--- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
@@ -18,6 +18,7 @@ PV = "0.92.3+git${SRCPV}"
 EXTRA_QMAKEVARS_PRE = "\
     PREFIX=${prefix} \
     LIBDIR=${libdir} \
+    CONFIG+=nodoc \
     "
 
 FILES_${PN} += "\
-- 
1.8.0



