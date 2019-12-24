Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 328BF7F8D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Dec 2019 00:55:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBO0tiMF028878
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 16:55:44 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 23 Dec 2019 16:55:44 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Dec 2019 19:55:43 -0500
Message-ID: <20191224005543.465134-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] samba: disable guest access and anonymous queries
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
X-List-Received-Date: Tue, 24 Dec 2019 00:55:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Guest accounts for Samba are a known potential vulnerability
(see https://www.tenable.com/plugins/nessus/26919) where info
about the host can be obtained without proper access. The option
"map to guest = bad user" allows login attempts with usernames
that don't exist to map to the guest account, while the
"restrict anonymous" value (implicitly set to 0 before this patch)
would allow any queries to obtain user and group list information.

Raise the default security level by setting "restrict anonymous"
to "1" and "map to guest" to "never" to avoid providing user/group
info to unauthenticated users and reject login attempts with an
invalid password, respectively.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba/smb.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba/smb.conf b/meta-networking/recipes-connectivity/samba/samba/smb.conf
index a0b87c373..d6bde417f 100644
--- a/meta-networking/recipes-connectivity/samba/samba/smb.conf
+++ b/meta-networking/recipes-connectivity/samba/samba/smb.conf
@@ -25,6 +25,10 @@
 
 ## Browsing/Identification ###
 
+# Prevent anonymous connections. Overriden if the user sets guest ok = yes 
+# on any share
+   restrict anonymous = 1
+
 # Change this to the workgroup/NT-domain name your Samba server will part of
    workgroup = WORKGROUP
 
@@ -114,7 +118,7 @@
 
 # This option controls how unsuccessful authentication attempts are mapped
 # to anonymous connections
-   map to guest = bad user
+   map to guest = never
 
 ########## Domains ###########
 
-- 
2.24.1


