Received: from [65.182.109.70] (helo=mta1.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LWphR-0004pp-7u
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Feb 2009 11:18:41 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta1.brinkster.com (Postfix) with ESMTP id 030463961CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2009 05:17:40 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.303
X-Spam-Level: 
X-Spam-Status: No, score=0.303 tagged_above=-10 required=5 tests=[AWL=-0.429, 
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta1.brinkster.com ([127.0.0.1])
	by localhost (mta1.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3t4bYkZyfpUH
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2009 05:17:36 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta1.brinkster.com (Postfix) with ESMTP id A4163395AC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2009 05:17:35 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2009 10:17:07 -0000
Message-ID: <008c01c98b68$bb7386e0$325a94a0$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmLaLml/HhNPI/hSjqN/Rz4RfS9VA==
Subject: [PATCH] Add package for ntfs-3g 2009.1.1 (latest) and update checksums.ini accordingly.
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
X-List-Received-Date: Tue, 10 Feb 2009 10:18:41 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

This patch simply updates the NTFS-3G package to use the latest release
tarball (January 22, 2009 - 2009.1.1).

Builds fine and quickly tested with no issues.

Note: the ntfs-3g v1 package is suspect (download pulled from
http://www.ntfs-3g.org/) so that may well be best removed? Not sure what the
process is on such things.

Regards,

John Willis

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 conf/checksums.ini                   |    4 ++++
 packages/ntfs-3g/ntfs-3g_2009.1.1.bb |   12 ++++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 conf/checksums.ini
 create mode 100755 packages/ntfs-3g/ntfs-3g_2009.1.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
old mode 100644
new mode 100755
index 0eba0c8..5036fa9
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -15766,6 +15766,10 @@
sha256=0bf226bb3a1716e6eb97355e08a7ffcf09aadfb91ba41ccef2ef1ba7a01719a2
 md5=873a8de662849d129fc7c475ad3f5447
 sha256=b5bbf81230bb21573d69fc471721b0b0c404eaa5040ef28e7dcec38320a1b2e4
 
+[http://www.ntfs-3g.org/ntfs-3g-2009.1.1.tgz]
+md5=56e4aed24d0c2543597de0ba52b3ed64
+sha256=0e02ff891645658c1801ba7d665c0ff3a4231e5570b974a803ffc2974ef68e45
+
 [http://downloads.sourceforge.net/ntop/ntop-3.0.tgz]
 md5=1ec6055c75f1acbb5d5600492481ef85
 sha256=c50cdf2c6cf7309f88c7ec0a56158eca76c80532502b36f3378eeca433423d83
diff --git a/packages/ntfs-3g/ntfs-3g_2009.1.1.bb
b/packages/ntfs-3g/ntfs-3g_2009.1.1.bb
new file mode 100755
index 0000000..7d73b79
--- /dev/null
+++ b/packages/ntfs-3g/ntfs-3g_2009.1.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS
driver for Linux with read and write support."
+HOMEPAGE = "http://www.ntfs-3g.org/"
+LICENSE = "GPLv2"
+DEPENDS = "fuse"
+RDEPENDS = "fuse"
+PR = "r0"
+
+SRC_URI = http://www.ntfs-3g.org/ntfs-3g-${PV}.tgz
+
+inherit autotools
+
+EXTRA_OEMAKE = "LDCONFIG=echo"
-- 
1.6.0.5





