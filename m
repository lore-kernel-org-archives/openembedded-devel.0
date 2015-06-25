Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDE360167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 06:01:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5P61kJ1020828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 23:01:46 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 24 Jun 2015 23:01:46 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jun 2015 13:53:57 +0800
Message-ID: <1435211637-1514-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-networking][PATCH] postfix: update daemon_directory in main.cf_2.0
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
X-List-Received-Date: Thu, 25 Jun 2015 06:01:49 -0000
Content-Type: text/plain

daemon_directory is set to /usr/lib/postfix which causes daemon postfix
fails to start on 64 bits target if enable multilib. Set daemon_directory
with libexecdir to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-daemons/postfix/files/main.cf_2.0 | 2 +-
 meta-networking/recipes-daemons/postfix/postfix.inc       | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0 b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
index 9e1077f..dc7feb5 100644
--- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
+++ b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
@@ -30,7 +30,7 @@ queue_directory = /var/spool/postfix
 mail_spool_directory = /var/spool/mail
 readme_directory = no
 command_directory = /usr/sbin
-daemon_directory = /usr/lib/postfix
+daemon_directory = @LIBEXECDIR@
 mail_owner = postfix
 setgid_group = postdrop
 unknown_local_recipient_reject_code = 450
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 72bc936..fa75a78 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -142,6 +142,8 @@ do_install () {
     mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
     install -d ${D}${sysconfdir}/init.d
     install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/main.cf
+    sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/main.cf
+
     install -m 755 ${WORKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
     install -m 644 ${WORKDIR}/internal_recipient ${D}${sysconfdir}/postfix/internal_recipient
 
-- 
1.9.1


