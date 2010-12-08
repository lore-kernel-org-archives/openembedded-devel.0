Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJfN-0006C3-7b
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 14:02:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 16E2C314B02B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:01:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XfbVoBWrP9ep
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:01:04 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 8B21B314B85E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:01:03 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 13:01:03 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 13:01:03 +0000
Message-Id: <1291813263-24629-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] vsftpd-2.0.5: don't run pkg_postinst on host
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
X-List-Received-Date: Wed, 08 Dec 2010 13:02:43 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/vsftpd/vsftpd_2.0.5.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/vsftpd/vsftpd_2.0.5.bb b/recipes/vsftpd/vsftpd_2.0.5.bb
index 0b9e75d..518628e 100644
--- a/recipes/vsftpd/vsftpd_2.0.5.bb
+++ b/recipes/vsftpd/vsftpd_2.0.5.bb
@@ -35,6 +35,9 @@ do_install() {
 }
 
 pkg_postinst() {
+        if [ "x$D" != "x" ]; then
+                exit 1
+        fi
         addgroup ftp
         adduser --system --home /var/lib/ftp --no-create-home --ingroup ftp --disabled-password -s /bin/false ftp
         mkdir -p ${localstatedir}/share/empty
-- 
1.7.2.3



