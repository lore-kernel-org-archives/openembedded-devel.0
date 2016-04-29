Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6CA7731D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 15:43:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3TFhelh002794
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Apr 2016 08:43:40 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Apr 2016 08:43:39 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <joe_macdonald@mentor.com>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Apr 2016 11:43:39 -0400
Message-ID: <1461944619-7152-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] samba: remove dependency on ctdb
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
X-List-Received-Date: Fri, 29 Apr 2016 15:43:41 -0000
Content-Type: text/plain

During rootfs creation the following error is being hit

  Preparing...         ######################################## [  0%]
  warning: Removing ctdb-2.5.1-r0@core2_64 due to file /usr/bin/ctdb
  conflicting with samba-4.4.2-r0@core2_64
  error: ctdb-dev-2.5.1-r0 conflicts with ctdb = 2.5.1-r0

Looking at the relationship between samba and ctdb it appears that the
landscape has changed some starting in version 4.2. Samba now includes
and installs ctdb instead of relying on stand-alone ctdb. Referencing
https://wiki.samba.org/index.php/CTDB_Setup we see this activated by
'--with-cluster-support' which we do pass to configure based on the
bb.

Dropping the DEPENDS on ctdb resolves this issue.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
index 383c9c9..6a2220a 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
@@ -27,7 +27,7 @@ inherit systemd waf-samba cpan-base perlnative
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 ctdb libbsd libaio"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio"
 
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
-- 
2.1.4


