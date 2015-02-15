Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CEE1B606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 09:03:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57619295"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Feb 2015 16:59:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1F92hCN010023
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 17:02:43 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sun, 15 Feb 2015 17:03:30 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Feb 2015 16:58:22 +0800
Message-ID: <1423990703-31432-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423990703-31432-1-git-send-email-biannm@cn.fujitsu.com>
References: <1423990703-31432-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH 1/2] cyrus-sasl: fix bug
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Feb 2015 09:03:31 -0000
Content-Type: text/plain

fix the following building error.

  ... snip ...

  install-exec-local: $(INSTALLOSX)
        @if test "$(plugindir)" != "$(prefix)/lib/sasl2"; then \
          echo "********************************************************"; \
          echo "* WARNING:"; \
          echo "* Plugins are being installed into $(prefix)/lib/sasl2,"; \
          echo "* but the library will look for them in $(plugindir)."; \
          echo "* You need to make sure that the plugins will eventually"; \
          echo "* be in $(plugindir) -- the easiest way is to make a"; \
          echo "* symbolic link from $(plugindir) to $(prefix)/lib/sasl2,"; \
          echo "* but this may not be appropriate for your site, so this"; \
          echo "* installation procedure won't do it for you."; \
          echo "*"; \
          echo "* If you don't want to do this for some reason, you can"; \
          echo "* set the location where the library will look for plugins"; \
          echo "* by setting the environment variable SASL_PATH to the path"; \
          echo "* the library should use."; \
          echo "********************************************************"; \
        fi

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index ea9cd1c..491ecdb 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -18,7 +18,7 @@ EXTRA_OECONF += "--with-dblib=berkeley \
                  --with-bdb-libdir=${STAGING_LIBDIR} \
                  --with-bdb-incdir=${STAGING_INCDIR} \
                  --with-bdb=db-5.3 \
-                 --with-plugindir="${libdir}/sasl2/" \
+                 --with-plugindir="${libdir}/sasl2" \
                  andrew_cv_runpath_switch=none"
 
 PACKAGECONFIG ??= "ntlm \
-- 
1.9.1


