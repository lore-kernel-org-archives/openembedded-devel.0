Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QlYyw-0003se-Qi
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 06:10:58 +0200
Received: by gxk3 with SMTP id 3so23606gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 21:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ywEfRwGV2dxke8jwEQbZn1uPWh5PsP4VePMrrv+ZEF8=;
	b=s37xOhYKQQlIyr2dcIo5yKM5heSlFfAhcRgQ6pt/xlT9z1iMXhT4yfNlMXuE+pxLYW
	PEjgD4tYOYQuQdRSqmFIgRLor2u8K/hx/mduHBI10zvw+AwYDKFvdMtcCR9CIDTGq8iJ
	CBsHiZrQfPm9uQBAAq3NKgn66Rc7JbyLXDk98=
Received: by 10.142.187.3 with SMTP id k3mr3218542wff.391.1311653205109;
	Mon, 25 Jul 2011 21:06:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k3sm106217pbj.29.2011.07.25.21.06.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 21:06:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jul 2011 21:06:33 -0700
Message-Id: <1311653193-29753-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1311653193-29753-1-git-send-email-raj.khem@gmail.com>
References: <1311653193-29753-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] openssl: Use SITEINFO_ENDIANESS instead of SITEINFO_ENDIANNESS
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
X-List-Received-Date: Tue, 26 Jul 2011 04:10:59 -0000

This spelling difference existed when siteinfo was in two places

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/openssl/openssl.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl.inc b/meta-oe/recipes-connectivity/openssl/openssl.inc
index 86b29f0..082fb7b 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl.inc
+++ b/meta-oe/recipes-connectivity/openssl/openssl.inc
@@ -11,10 +11,10 @@ S = "${WORKDIR}/openssl-${PV}"
 
 inherit siteinfo
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 AR_append = " r"
-CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
+CFLAG = "${@base_conditional('SITEINFO_ENDIANESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
 	-DTERMIO ${FULL_OPTIMIZATION} -Wall"
 
 # -02 does not work on mipsel: ssh hangs when it tries to read /dev/urandom
-- 
1.7.4.1



