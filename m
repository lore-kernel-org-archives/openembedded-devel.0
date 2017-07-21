Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id DAE4A71A84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=x03Vgy+CnEE4pwMR90PvGvdsDnkQy772LUP4MnAAs6g=; 
	b=ATxhrZfOsdFHPpC/Z2HUkoQgQJVEMQOz1ELMyF/3oF1RAQu67FUZbM7IiSTbZ2zwh5Jsq6PoDEL8ExYp/Ummkc5YFeznp3HJU7I+f4LsOz4jz2gT93mDt1Lh+Se7XDHprieK5wlyiOQYVm76Xl7xMH4Pa+t7XiHIfBezfb/QxVKGVoG/7U8HSkTsl77Hoqfh60SgAmj3hTpPn8fbUU7gOt9BGCCR90txQme1pt83j53zKiuiA2rZEyotQviD/ygZTLqK5CWQIDIUZclAE/5Ot1oo96XbK03bxXuwsz6rFThkxQpZnXs1qZqVgsAX07phRYqyCKHmzAYi0B7UykOevQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYRyF-00068t-Eu; Fri, 21 Jul 2017 10:03:31 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYRyF-0007oL-Dk; Fri, 21 Jul 2017 10:03:31 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jul 2017 10:03:16 +0300
Message-Id: <1500620597-28886-3-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500620597-28886-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500620597-28886-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [meta-oe][PATCH 2/3] krb5_1.15.1.bb: set CVE_PRODUCT to kerberos
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
X-List-Received-Date: Fri, 21 Jul 2017 07:21:38 -0000

It is used in NVD database for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2016-3120

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
index 61cdd60..1de884d 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
@@ -34,6 +34,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
 SRC_URI[md5sum] = "8022f3a1cde8463e44fd35ef42731f85"
 SRC_URI[sha256sum] = "437c8831ddd5fde2a993fef425dedb48468109bb3d3261ef838295045a89eb45"
 
+CVE_PRODUCT = "kerberos"
+
 S = "${WORKDIR}/${BP}/src"
 
 PACKAGECONFIG ??= "openssl"
-- 
1.9.1


