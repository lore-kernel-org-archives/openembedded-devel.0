Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF7747720C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 05:51:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u885psxs017737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Sep 2016 22:51:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 22:51:53 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Sep 2016 13:49:24 +0800
Message-ID: <1473313764-30806-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] proftpd: remove the script ftpmail
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
X-List-Received-Date: Thu, 08 Sep 2016 05:51:55 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Remove the ftpmail script to avoid confusion
  about it fails to run because it lacks a dependency
  on Mail/Sendmail.pm which is not shipped by default.
  Also it has not been maintained for more than 10 years as
  http://search.cpan.org/~mivkovic/Mail-Sendmail/Sendmail.pm.

* And it's bad to add the dependency perl module
  Mail/Sendmail.pm as it's too old and also send email to
  Proftp-devel@lists.sourceforge.net to ask guidance about
  ftpmail as below:
    Q: In my environment, the ftpmail fails to run as
       it lacks the dependency on Mail/Sendmail.pm which
       is not shipped by default and also not maintained more
       than 10 years as
       http://search.cpan.org/~mivkovic/Mail-Sendmail/Sendmail.pm.
    A: Patches for updates to the ftpmail script are highly
       encouraged!  If the Mail-Sendmail package is not to
       your preference, what would you suggest/prefer using
       instead?
  We don't plan to do more improvements about the perl module
  Mail-Sendmail now since it's not something we, or other distros
  apparently need as other distribution also not include the
  ftpmail script.

* The ftpmail is initially added as a perl script to send an email
  notification when upload proftpd log as below commit in
  https://github.com/proftpd/proftpd.git:

  commit 8d602d4bf01ef0c6464c7a16dbbe570a0322dc17
  Author: castaglia <castaglia>
  Date:   Thu Mar 6 03:06:14 2008 +0000

    Added ftpmail, a Perl script which reads a TransferLog FIFO and sends
    automatic email notifications for uploads.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
index 5a53d0d..c27a1cc 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
@@ -111,6 +111,15 @@ do_install () {
         -e 's|${STAGING_DIR_NATIVE}||g' \
         -e 's|-fdebug-prefix-map=[^ ]*||g' \
         -i ${D}/${bindir}/prxs
+
+    # ftpmail perl script, which reads the proftpd log file and sends
+    # automatic email notifications once an upload finishs,
+    # depends on an old perl Mail::Sendmail
+    # The Mail::Sendmail has not been maintained for almost 10 years
+    # Other distribution not ship with ftpmail, so do the same to
+    # avoid confusion about having it fails to run
+    rm -rf ${D}${bindir}/ftpmail
+    rm -rf ${D}${mandir}/man1/ftpmail.1
 }
 
 INITSCRIPT_NAME = "proftpd"
-- 
2.8.1


