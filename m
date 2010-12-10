Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PQrHX-0006lD-Gt
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 01:56:20 +0100
Received: by pzk12 with SMTP id 12so35021pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 16:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=RPZTcal2rQkcxk3qUQf8RkDeGxrpw4QsyTKhWqyMfzM=;
	b=dxkIqG8WhUzMqgnZyM+6vYTG3rNcrifMsLNCI0YKl9jFg3Xlsmawbc+m/3Ps3MF+Q6
	CPajPojm9mYwVs9a5T7APZW3F/f76daYsjUoQ4x0/eXpr6e/Xsd6UlYxrGlEztxA4aST
	WTagUAZvj2o+cYx/Yf+nzBqYCURAxr8RR3BD8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cJBCPlSzS64j1I07pCMQZmjUw3EXHPv/OkBYTcsN8tqbqSs9wDvAyOXSLYTmLHkVyO
	cbzVCWx3LzJ6jE5yuLn8jiljtctynotAUqIukJE5Vk6oI6c5HP7klz1cu0pFmokN0pv4
	UTlnzcOaNGqhwOB+VQxX5IIF5C2YOD+KwU914=
Received: by 10.142.109.12 with SMTP id h12mr50900wfc.31.1291942487448;
	Thu, 09 Dec 2010 16:54:47 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q13sm3220972wfc.5.2010.12.09.16.54.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Dec 2010 16:54:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 16:54:42 -0800
Message-Id: <1291942482-24901-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sane-toolchain.inc: Prefer libtool version 2.4 with sysroot.
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
X-List-Received-Date: Fri, 10 Dec 2010 00:56:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/sane-toolchain.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 6653f73..c0a4021 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -10,6 +10,8 @@ PREFERRED_BINUTILS_VERSION           ?= "2.20.1"
 PREFERRED_UCLIBC_VERSION             ?= "git"
 PREFERRED_EGLIBC_VERSION             ?= "2.12"
 PREFERRED_GLIBC_VERSION              ?= "2.10.1"
+PREFERRED_LIBTOOL_VERSION            ?= "2.4"
+LIBTOOL_HAS_SYSROOT                  ?= "yes"
 
 # Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc              ?= "${PREFERRED_GLIBC_VERSION}"
@@ -57,6 +59,11 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++              = "gcc-cross"
 
 # Others
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
+PREFERRED_VERSION_libtool = "${PREFERRED_LIBTOOL_VERSION}"
+PREFERRED_VERSION_libtool-cross = "${PREFERRED_LIBTOOL_VERSION}"
+PREFERRED_VERSION_libtool-native = "${PREFERRED_LIBTOOL_VERSION}"
+PREFERRED_VERSION_libtool-sdk = "${PREFERRED_LIBTOOL_VERSION}"
+PREFERRED_VERSION_libtool-nativesdk = "${PREFERRED_LIBTOOL_VERSION}"
 
 #############################################################################
 # TOOLCHAIN CUSTOMIZATION
-- 
1.7.0.4



