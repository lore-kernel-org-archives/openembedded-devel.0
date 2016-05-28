Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 365 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 28 May 2016 01:01:01 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 94FB16FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 01:01:01 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 2F9572806CE; Fri, 27 May 2016 17:54:57 -0700 (PDT)
Date: Fri, 27 May 2016 17:54:57 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160528005457.GO7939@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-networking][PATCH] cifs-utils: make samba conditional dependency
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
X-List-Received-Date: Sat, 28 May 2016 01:01:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add PACKAGECONFIG for cifsacl and update PACKAGECONFIG for cifsidmap
to make samba a conditional dependency. It is nice to be able to
get mount.cifs without needing to build samba.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 87306a6..099d885 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -4,7 +4,6 @@ SECTION = "otherosfs"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "samba"
 PV = "6.4"
 
 SRCREV = "487f46da737291877867cbd3acb40fea087d3863"
@@ -18,7 +17,8 @@ PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[cifscreds] = "--enable-cifscreds,--disable-cifscreds,keyutils"
 # when enabled, it creates ${sbindir}/cifs.upcall and --ignore-fail-on-non-empty in do_install_append is needed
 PACKAGECONFIG[cifsupcall] = "--enable-cifsupcall,--disable-cifsupcall,krb5 libtalloc keyutils"
-PACKAGECONFIG[cifsidmap] = "--enable-cifsidmap,--disable-cifsidmap, keyutils"
+PACKAGECONFIG[cifsidmap] = "--enable-cifsidmap,--disable-cifsidmap,keyutils samba"
+PACKAGECONFIG[cifsacl] = "--enable-cifsacl,--disable-cifsacl,samba"
 PACKAGECONFIG[pam] = "--enable-pam --with-pamdir=${base_libdir}/security,--disable-pam,libpam keyutils"
 
 inherit autotools pkgconfig
-- 
1.7.10.4


