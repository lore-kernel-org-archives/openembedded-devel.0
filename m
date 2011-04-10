Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q8tz1-0001ns-7b
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 14:43:15 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so4004034bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2011 05:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=bxoXE7eMRZN+K3zlX/sDklnlALv4DqjT1p5znsWq31w=;
	b=OssiIN/abmr4VCdarKNl1RjUNNdjstNJ9KBWSJ8oMeL0hQjUObB50vSkK5BAAy1h9i
	+Tu5+ih0l6bU5YJBccRGXc+qT0ZCIB+qsjxA2gbpOCENCW762bHun4TAd6+Uzqk+nWoC
	sJumk73PYiPvd33w4859kTfnM9UsBMDNG7lts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=T414a3MgZG/j5IEnkdjOsLUl4gg4TwmNu25XE0b5ogm1trRXW7n0zQOAklDUNGt+gO
	ngAbIBzzm2DZlFYzX2Sjt5Npl38IDnbUJxJEsdw0SvePjW5ZAcaPvRyMTFL1cqmR6XSr
	a6Q4ZKJB5YmzOTMsO1GAYYZhy3ycGhXFPvcdw=
Received: by 10.204.175.194 with SMTP id bb2mr3810264bkb.121.1302439266236;
	Sun, 10 Apr 2011 05:41:06 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm2638374bkl.13.2011.04.10.05.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Apr 2011 05:41:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2011 14:40:59 +0200
Message-Id: <122a45d6732434d6dc4d3e61387ff7f5030f56e0.1302439112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302439112.git.Martin.Jansa@gmail.com>
References: <cover.1302439112.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] libusb-compat: add native, nativesdk to BBCLASSEXTEND and define native PROVIDES
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
X-List-Received-Date: Sun, 10 Apr 2011 12:43:15 -0000

* virtual/libusb0-native is used in usbpath-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libusb/libusb-compat_0.1.3.bbappend            |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend b/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
index 7de2361..5b50d6b 100644
--- a/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
+++ b/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
@@ -1,4 +1,6 @@
 PROVIDES += "virtual/libusb0"
+PROVIDES_virtclass-native += "virtual/libusb0-native"
+BBCLASSEXTEND = "native nativesdk"
 
 inherit lib_package
 
-- 
1.7.4.1



