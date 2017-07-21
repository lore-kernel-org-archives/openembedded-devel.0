Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 38F7071A84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=HNKxRe/KjonsB6bYGo3I/D6xr0fJsgcZ7CwJqAAsjoc=; 
	b=o4UDqVfKvxejJgTVNAPtjrn3wH17ppq157kB9Z9unAzUyyUQkotu6FUHVyQOgnG2ST6Lo0cyfbPCS5KQMjjYdXXSY5grlApEylWnFoMteeZYA9ZSXLFnrpqqCQ8HO7iWpZS6/9ojhgzlRyFzuLdowVaZ8cMxjxMUJYC8CTR3OMx+3sm5D7TaSYpPUTq/3byQzziVodx2eRGjmx/Yc0HoWsbb6UtxoLxzxx0UBDR9tTN9P8+cejy6SXyUCkcmCQIipo646F3KTN4lj+rDUuh8LtJOTpiMK0/97ghlJNdtnkBgFO319zv7ngkH5UixKfekhxsh2qUcpFpUnjl3zH+Dew==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYRyG-00069H-7R; Fri, 21 Jul 2017 10:03:32 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYRyG-0007pM-6A; Fri, 21 Jul 2017 10:03:32 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jul 2017 10:03:17 +0300
Message-Id: <1500620597-28886-4-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500620597-28886-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500620597-28886-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [meta-oe][PATCH 3/3] udisks2_2.1.8.bb: set CVE_PRODUCT to udisks
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
X-List-Received-Date: Fri, 21 Jul 2017 07:23:23 -0000

It is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2014-0004

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
index 6d90e49..a3efc51 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
@@ -13,6 +13,8 @@ SRC_URI = "http://udisks.freedesktop.org/releases/udisks-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "501d11c243bd8c6c00650474cd2afaab"
 SRC_URI[sha256sum] = "da416914812a77e5f4d82b81deb8c25799fd3228d27d52f7bf89a501b1857dda"
 
+CVE_PRODUCT = "udisks"
+
 inherit autotools systemd gtk-doc gobject-introspection
 
 S = "${WORKDIR}/udisks-${PV}"
-- 
1.9.1


