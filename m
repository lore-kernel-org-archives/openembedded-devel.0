Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OaRVl-0002h2-BU
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 12:55:02 +0200
Received: by fxm12 with SMTP id 12so1752799fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 03:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=/oF0xh2plmBdE8hQ3u7xv3kT/vqktNWGcyElL3IWL1U=;
	b=EKezskmbQ4Ux71P0/1P6ArUm0Gsphq/1dOHXoH2MI4YQRxMLMftlG1noINIf8IF0WK
	mpZzaTgz0hOxVMo6CqtiAMs2/nbHbGFjKxO40wqxvJKmWhQSWSSL0a5kFXfPBiiYyW1S
	surz6uegtgL0Hm+BehYDDVUbjnSEZpjR6mc1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ZNE72HCIxHI8tAujwmaAJCNUxAVoKEl7ZehowrCo8vgIKUIXeB8/7adwIY6XArMHQG
	V3wtl/VQImG41IhsuagQ7eLNkkwJa4plbXGQ2e5XHMfsQLzuu7yxyjVSe/VoLNMni/tc
	rXCDflaAUZePedpPCO2OtI8TCOwFLHzXqshIQ=
Received: by 10.223.117.20 with SMTP id o20mr2455831faq.55.1279450454133;
	Sun, 18 Jul 2010 03:54:14 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id m3sm1549573fai.41.2010.07.18.03.54.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 18 Jul 2010 03:54:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jul 2010 12:54:39 +0200
Message-Id: <1279450479-11207-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-jalimo: fix openjdk-6-jre preferred version
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
X-List-Received-Date: Sun, 18 Jul 2010 10:55:05 -0000

---
 conf/distro/include/angstrom-jalimo.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
index effde60..2aed63b 100644
--- a/conf/distro/include/angstrom-jalimo.conf
+++ b/conf/distro/include/angstrom-jalimo.conf
@@ -22,7 +22,7 @@ PREFERRED_VERSION_jamvm = "1.5.2"
 PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"
 PREFERRED_PROVIDER_classpath = "classpath"
 
-PREFERRED_VERSION_openjdk-6-jre = "6b18"
+PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8"
 PREFERRED_VERSION_icedtea6-native = "1.7.3"
 
 # Stage JAR files not into ARCH related dirs
-- 
1.7.1.1



