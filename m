Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMdd-0004dl-Hw
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 14:58:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 04766314A1B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:58:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Y8omGXLHfwCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:58:11 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id AD04E314A20D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:58:10 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 12:58:10 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 12:58:10 +0000
Message-Id: <1288011490-23406-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4CBC5851.4090204@mentor.com>
References: <4CBC5851.4090204@mentor.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH resend] linux-libc-headers-2.6.34: Delete include/scsi/scsi.h
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
X-List-Received-Date: Mon, 25 Oct 2010 12:58:57 -0000

* Based on 91d3d92a626da89dfe13d63e68a90dbafdbaef1d for 2.6.31 and 2.6.32

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Acked-by: Tom Rini <tom_rini@mentor.com>
---
 .../linux-libc-headers_2.6.34.bb                   |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb
index 8e0df2e..340915c 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb
@@ -5,7 +5,7 @@ DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_nios2 = "1"
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_TARGET_SYS = "."
 
@@ -39,4 +39,5 @@ do_compile () {
 
 do_install() {
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
 }
-- 
1.7.1



