Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T3yIC-0008S5-GN
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 01:55:29 +0200
Received: by pbcwy7 with SMTP id wy7so591581pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2012 16:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D2UMrdCGVIPUVP8U99NwsGqA9e9/sb+rjTpKiX66ySw=;
	b=E16ia4XHu8D8cIHJp7o2Zg7sveKtllw3lGNZaycXlp1Swcx9qgCw0qUnYfglePOIFJ
	gyjOyTr1Xbk/h34dUGWtm4Y43kDnrhsAk+iGVpYhcLS2n9QPW63Eyxl2lx7Iu5cf2Hgw
	op56CSX+l4RNgeUgL/rQuMnkQPvbiDqwEkRsY5VtJQsYvoFk+2vg0fGygy33R+OEdpt2
	gle0TLE7pU0i8fA84SPna2pqwxweSOWRq1RKfqIKRN4tjVFhbcKszVSzWP5Z+KM2+yt2
	jVrIW5c3ZAKGFL4vA178e/sY/8EBYopm/Y0rIHAC5O7CRAhAEUCY56/Ac4gdPtFLZV3B
	Sb6A==
Received: by 10.68.234.99 with SMTP id ud3mr47828614pbc.166.1345592603117;
	Tue, 21 Aug 2012 16:43:23 -0700 (PDT)
Received: from eos.du.ae ([94.205.108.162])
	by mx.google.com with ESMTPS id ko8sm2387620pbc.40.2012.08.21.16.43.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 16:43:22 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 03:43:09 +0400
Message-Id: <1345592591-20385-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 1/3] linux-libc-headers: Add linux-libc-headers_3.3.bb.
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
X-List-Received-Date: Tue, 21 Aug 2012 23:55:29 -0000

This commit adds linux-libc-headers_3.3.bb for linux-xilinx kernel 3.3.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../linux-libc-headers/linux-libc-headers_3.3.bb   |    6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 recipes-kernel/linux-libc-headers/linux-libc-headers_3.3.bb

diff --git a/recipes-kernel/linux-libc-headers/linux-libc-headers_3.3.bb b/recipes-kernel/linux-libc-headers/linux-libc-headers_3.3.bb
new file mode 100644
index 0000000..6f6cb9f
--- /dev/null
+++ b/recipes-kernel/linux-libc-headers/linux-libc-headers_3.3.bb
@@ -0,0 +1,6 @@
+require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "98a6cdd7d082b7ea72df9c89842bac74"
+SRC_URI[sha256sum] = "8fd669b4e48181b8d44644a45bf421a84bb8d5ec273ef36349796443e442f333"
-- 
1.7.9.5



