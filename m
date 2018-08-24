Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF3179398
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 00:52:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O0qhH2005797
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 17:52:43 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 23 Aug 2018 17:52:42 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Aug 2018 08:52:40 +0800
Message-ID: <1535071960-13624-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH] autofs: specify fifodir and flagdir
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
X-List-Received-Date: Fri, 24 Aug 2018 00:52:42 -0000
Content-Type: text/plain

Explicitly specify the fifodir and flagdir to ${localstatedir}/run.
Remove the line for fixing typo since it had been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb
index 187c6fa..e4ef5bb 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.4.bb
@@ -46,13 +46,14 @@ EXTRA_OECONF += "--disable-mount-locking \
                 --enable-ignore-busy --with-openldap=no \
                 --with-sasl=no --with-libtirpc \
                 --with-path=${STAGING_BINDIR_NATIVE} \
+                --with-fifodir=${localstatedir}/run \
+                --with-flagdir=${localstatedir}/run \
 "
 CACHED_CONFIGUREVARS = "ac_cv_path_RANLIB=${RANLIB} \
                         ac_cv_path_RPCGEN=rpcgen \
 "
 
 do_configure_prepend () {
-    sed -e "s:filagdir:flagdir:" -i ${S}/configure.in
     if [ ! -e ${S}/acinclude.m4 ]; then
         cp ${S}/aclocal.m4 ${S}/acinclude.m4
     fi
-- 
2.7.4


