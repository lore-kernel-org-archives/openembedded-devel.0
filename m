Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id DDBAC61CD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 18:58:05 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id C5F9E60323;
	Fri, 13 Mar 2020 19:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584125886;
	bh=LtR1s7YcJ414Fs9iTSVffzob2sscl7z6ZC/clXmFRxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oIyU0hxfkuqSBhtkPoYw0yjRCJHoMzgSKheWsRV2zY6ojPTwkmP5+tZ5/bCERVJjA
	6x4e2InMm2jGYD8mZqts0z8aE8QzJTHTL6WC/EBH0UENWXcN4NoavaVLQOIFvgY7kT
	lk/CcBUtYD6WWyvBwGNlmoSyKAmIzsr+uHFiyIMRQyTCh34oy8vB7jDD+QPj0NL6uo
	b42s97+euT8VgEkIhDgW3K2rJnrlADeOIjci+u8OU8C15qlOBteb+8ZLVDqScFqSTY
	4vHZq1hydTllaf8pCkLN0yMyUJgz6ztAxrj/ipi0t+JQXq+ldEtcNFlWXcZCGqEMgk
	6M28jNCsFQwJw==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2020 19:57:51 +0100
Message-Id: <1584125871-11210-4-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584125871-11210-1-git-send-email-pjtexier@koncepto.io>
References: <1584125871-11210-1-git-send-email-pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] libqmi: upgrade 1.24.4 -> 1.24.6
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
X-List-Received-Date: Fri, 13 Mar 2020 18:58:06 -0000

Overview of changes in libqmi 1.24.6
----------------------------------------

 * libqmi-glib:
   ** Fixed the close operation logic to make sure that a reopen done right
      away doesn't close the wrong endpoint.
   ** Updated string reading logic to make sure that all strings are valid
      UTF-8.
   ** Updated string reading logic to attempt parsing as GSM7 or UCS2 if the
      initial UTF-8 validation fails.
   *+ Renamed TLV 0x15 in the "WDA Get Data Format" message, and added new
      compat methods for the old name.
   ** Fixed the format of the NITZ information TLV, and added new compat
      methods for the old name.
   ** Fixed the format of the Home Network 3GPP2 TLV, and added new compat
      methods for the old name.

 * Several other minor improvements and fixes.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../libqmi/{libqmi_1.24.4.bb => libqmi_1.24.6.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.4.bb => libqmi_1.24.6.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.6.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.24.4.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.24.6.bb
index 5512828..a86215a 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.4.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.6.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "be6539fde54fec1fc9d852db201c8560"
-SRC_URI[sha256sum] = "0316badec92ff32f51fe6278e6046968d2272a26608995deedd8e4afb563918a"
+SRC_URI[md5sum] = "5d50233394a33e43dee3e70e197323e5"
+SRC_URI[sha256sum] = "1325257bc16de7b2b443fa689826c993474bdbd6e78c7a1e60e527269b44d8c9"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.7.4


