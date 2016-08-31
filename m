Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1DA6057A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:39:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V7dT8P023329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 00:39:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 31 Aug 2016 00:39:08 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Aug 2016 15:37:12 +0800
Message-ID: <1472629032-25950-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] samba: add samba-pidl to RDEPENDS
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
X-List-Received-Date: Wed, 31 Aug 2016 07:39:29 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add samba-pidl to RDEPENDS for samba as pidl
  provided by samba depends on Parse::Pidl module
  provided by samba-pidl, otherwise comes below error

  root@super_micro-1:~# pidl -h
  Can't locate Parse/Pidl.pm in @INC (you may
  need to install the Parse::Pidl module) (@INC
  contains: /usr/share/perl5 /etc/perl
  /usr/lib64/perl/site_perl/5.22.1/
  /usr/lib64/perl/site_perl/5.22.1
  /usr/lib64/perl/vendor_perl/5.22.1/
  /usr/lib64/perl/vendor_perl/5.22.1
  /usr/lib64/perl/5.22.1/ /usr/lib64/perl/5.22.1
  /usr/local/lib/site_perl .) at /usr/bin/pidl line 409.
  BEGIN failed--compilation aborted at /usr/bin/pidl line 409.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index e35d527..eebf71c 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -130,7 +130,7 @@ PACKAGES += "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind libwinbind-dbg
 PACKAGES =+ "libwbclient libnss-winbind winbind winbind-dbg libnetapi libsmbsharemodes \
              libsmbclient libsmbclient-dev lib${PN}-base ${PN}-base ${PN}-ctdb-tests"
 
-RDEPENDS_${PN} += "${PN}-base"
+RDEPENDS_${PN} += "${PN}-base ${PN}-pidl"
 
 FILES_${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
-- 
2.8.1


