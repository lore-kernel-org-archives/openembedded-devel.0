Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5C0718FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:05:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9G959MN016213
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 02:05:09 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 16 Oct 2014 02:05:09 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Oct 2014 17:02:41 +0800
Message-ID: <1413450161-14160-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-networking][PATCH] postfix: remove overriding config config_directory
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
X-List-Received-Date: Thu, 16 Oct 2014 09:05:09 -0000
Content-Type: text/plain

postfix 2.11.1 adds overriding config check. In postinstall script, it
calls command newaliases to read configure file main.cf_2.0.
config_directory is set in config main.cf_2.0, but it is an overriding
config and warning shows when build an image:

WARNING: log_check: There is a warn message in the logfile
WARNING: log_check: Matched keyword: [warn]
WARNING: log_check: newaliases: warning:
/buildarea3/kkang/poky/qemuarm-build/tmp/work/qemuarm-poky-linux-gnueabi/core-
image-minimal/1.0-r0/rootfs/etc/postfix/main.cf, line 27: overriding
earlier entry: config_directory=/buildarea3/kkang/
poky/qemuarm-build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/rootfs/etc/postfix

Remove config_directory setting in main.cf_2.0 to avoid this warning.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-daemons/postfix/files/main.cf_2.0 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0 b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
index a128faa..bb31451 100644
--- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
+++ b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
@@ -24,7 +24,7 @@ virtual_gid_maps = static:`grep vmail /etc/passwd | cut -d ":" -f 4`
 
 
 # General stuff here again
-config_directory = /etc/postfix
+#config_directory = /etc/postfix
 sample_directory = /etc/postfix
 queue_directory = /var/spool/postfix
 mail_spool_directory = /var/spool/mail
-- 
1.9.1


