Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PO53l-0000tq-6h
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 10:02:37 +0100
Received: by bwz10 with SMTP id 10so6872985bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 01:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=v07duwFWXi/IOXkM7oSUqBGydqkjwFyX7OK+hEbldLE=;
	b=nb3J6Q5QsiYZdThEAxV4j7RihCjLg3tINKmYT+zJw8gOt7bNNp2tUS90QTDYMk0WLB
	c4YHNPykVjMxqrFdAMiouj5t2np0lYKEpSE73jcSX2QarnJ5uB7n+LZlaAceFRCIyxKh
	be5kx9WDbW+OjdYlBGHbwdaJQqpsMMRlWHqKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=XE+xFFq1zPqVPnNoruu1vJm9+gSYZNS4+ZyxQVnoEntYoKN88iH1D6EjYHRTr3tx2I
	pRRUfLucS977dJBOhrBxO4zDRY6W2fTk0wN8G33OpKfpPE6nVGE6n/G1ieApnuu9OKbx
	wGzLNHipSWKp3l51hc6nIACesFYikPM5ExlYU=
Received: by 10.204.66.83 with SMTP id m19mr239904bki.44.1291280476591;
	Thu, 02 Dec 2010 01:01:16 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 11sm125951bkj.12.2010.12.02.01.01.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Dec 2010 01:01:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Dec 2010 10:01:08 +0100
Message-Id: <1291280468-25378-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] nokia900: build uImage instead of zImage
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
X-List-Received-Date: Thu, 02 Dec 2010 09:02:37 -0000

* meego and debian on n900 are now using u-boot so we should too
---
 conf/machine/nokia900.conf |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/conf/machine/nokia900.conf b/conf/machine/nokia900.conf
index a16f1da..10bce2a 100644
--- a/conf/machine/nokia900.conf
+++ b/conf/machine/nokia900.conf
@@ -20,7 +20,10 @@ GUI_MACHINE_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "800"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
 
-KERNEL_IMAGETYPE = "zImage"
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
 
 ROOT_FLASH_SIZE = "100"
 EXTRA_IMAGECMD_jffs2_nokia900 = "--pad --little-endian --eraseblock=0x20000 -n"
-- 
1.7.3.2



