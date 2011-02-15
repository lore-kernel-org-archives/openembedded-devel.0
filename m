Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpS4S-0004kh-7G
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:04:28 +0100
Received: by eya28 with SMTP id 28so432432eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=3qX1nLF9/mLuJMlz+31nBECifZMV/OTMDdCBEUZg4ew=;
	b=TCUV3OnyeuQse41a5ysc18f26toY3DqPJz+tNGp8r8m3EbeoguBQrRUSmAepRVZNE1
	M+NK27v2suDSk3LxnaS5mnj6WSu/fnlAlAcB9VWDNS40gWfmcz2hCGu8R+CNxXOU0Y0l
	SaF3X82n1OgP4zTC4fjuHAPafnULkkl1Td+mE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sxr6mgWarmM+Fdu/8Kl5MZk4aUA2E2B+K0HqI9Bqp4iiJFpTBvAl0g9NBJJ/Avr4JT
	yBibHPIm5dwmy5pt8fNtRbQYVSRSgrFSTCWoq6e6U5zjhv0n5/QELWkX6h7dhzjLD2HD
	3/1kBy2MIFLrCPJjICVvyv0RR7rEGqtnYk7U4=
Received: by 10.223.81.76 with SMTP id w12mr6695192fak.26.1297803797717;
	Tue, 15 Feb 2011 13:03:17 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j12sm1912259fax.33.2011.02.15.13.03.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 13:03:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Feb 2011 22:02:59 +0100
Message-Id: <1297803782-8395-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
References: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] SHR: drop P_V for glib-2.0 (upgrades from 2.26.1 to 2.28.0)
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
X-List-Received-Date: Tue, 15 Feb 2011 21:04:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/preferred-shr-versions.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index 206d270..c0099b8 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -21,8 +21,6 @@ PREFERRED_VERSION_xserver-common = "1.33"
 PREFERRED_VERSION_xserver-nodm-init = "2.0"
 PREFERRED_VERSION_hal           = "0.5.13"
 PREFERRED_VERSION_wpa-supplicant = "0.6.9"
-PREFERRED_VERSION_glib-2.0      = "2.26.1"
-PREFERRED_VERSION_glib-2.0-native = "2.26.1"
 PREFERRED_VERSION_openssl = "1.0.0c"
 PREFERRED_VERSION_openssl-native = "1.0.0c"
 PREFERRED_VERSION_perl = "5.10.1"
-- 
1.7.4.1



