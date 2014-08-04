Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6B58D65C7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 21:53:37 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so58689wgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NeiqHWEEK2cPnKGkJ7A08PtPyvG5nHOkDTT14MUIDDA=;
	b=fMBza8RP5oVzx9OpUX8ym9bhGSvE12G9uYombDB6a+VkEimJ0AFCLRni9zcuk/+HvA
	+q99kUp5hHy+WYLF0m+fgB0T/tBGzBbXJ935oKXHWpC5g6t6ox4ogPVraU+AxdIy6pKG
	goTVAGfX8oyw5kxJny0SVZAuuCb7+adMqtFVGlshrZywKarhtLSoB3PuRDi2MpitQkxk
	tsq3OTnRCLNWjKGDPV53H5rm4KsB5xL4wXbhqyDvb/x//AwHBk+4GyQGQEPNBAzRRLe0
	eDf1ohOae3+ov4LJesDVHNMRnR6Aq3w2v50FcXqytibMW9juYjnxwOTm8KR4F/WIF1UB
	h/dQ==
X-Received: by 10.194.7.36 with SMTP id g4mr35717957wja.37.1407189218381;
	Mon, 04 Aug 2014 14:53:38 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host155-146-dynamic.30-79-r.retail.telecomitalia.it.
	[79.30.146.155])
	by mx.google.com with ESMTPSA id 10sm46355856wjx.26.2014.08.04.14.53.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Aug 2014 14:53:37 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Aug 2014 23:53:30 +0200
Message-Id: <1407189210-26832-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH v2] kexec_tools_klibc_2.0.2: update x86_vfscanf.patch
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
X-List-Received-Date: Mon, 04 Aug 2014 21:53:41 -0000

The POSIX standard 
http://pubs.opengroup.org/onlinepubs/009695399/functions/fgets.html
states:

If the stream is at end-of-file ... fgets() shall return a null pointer...
If a read error occurs ... fgets() shall return a null pointer...

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
index 14f4d2a..cad6951 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
@@ -16,7 +16,7 @@
 -	retno = vfscanf(fp, scanf_line, argptr);
 +
 +	line = xmalloc(sizeof(line) * line_size);
-+	while(fgets(line, sizeof(line), fp) != 0 ) {
++	while(fgets(line, sizeof(line), fp) != NULL ) {
 +		line_size += MAX_LINE;
 +		line = xrealloc(line,line_size);
 +	}
-- 
1.9.1


