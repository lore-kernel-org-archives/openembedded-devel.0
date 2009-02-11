Received: from [65.182.109.78] (helo=mta9.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LXMLm-0005H8-BT
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2009 22:10:30 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta9.brinkster.com (Postfix) with ESMTP id 60F5E1AA73A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 16:09:17 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: -0.537
X-Spam-Level: 
X-Spam-Status: No, score=-0.537 tagged_above=-10 required=5 tests=[AWL=-0.364, 
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta9.brinkster.com ([127.0.0.1])
	by localhost (mta9.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VAKptb1OYyy
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 16:09:13 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta9.brinkster.com (Postfix) with ESMTP id EC0211AA661
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 16:09:12 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Feb 2009 21:08:36 -0000
Message-ID: <005101c98c8c$e82d4200$b887c600$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmMjOdPQqpUYrxIQxiZKr7Y8dGn7A==
Subject: [PATCH] Bump the SSHFS FUSE filesystem to version 2.2 from 1.8 and update checksums.ini.
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
X-List-Received-Date: Wed, 11 Feb 2009 21:10:31 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Just a simple recipe bump patch.

Tested on the OMAP3EVM and Pandora boards.

Regards,

John Willis

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 conf/checksums.ini              |    4 ++++
 packages/fuse/sshfs-fuse_2.2.bb |   15 +++++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100755 packages/fuse/sshfs-fuse_2.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index bf21834..7ee2f81 100755
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -20034,6 +20034,10 @@
sha256=057626d78e5ade840568ab0e171a1d1ae87348ab51bf9e35d1cdc074fc4e2edb
 md5=3c575cf89a6d3d8ab6063c2f60bd5b25
 sha256=057626d78e5ade840568ab0e171a1d1ae87348ab51bf9e35d1cdc074fc4e2edb
 
+[http://downloads.sourceforge.net/fuse/sshfs-fuse-2.2.tar.gz]
+md5=26e9206eb5169e87e6f95f54bc005a4f
+sha256=206ebcbc4cb9f5039bfcc7059678a0f61120605a5cdcbffa3ae5716c113e5423
+
 [ftp://ftp.debian.org/debian/pool/main/s/ssmtp/ssmtp_2.61.orig.tar.gz]
 md5=957e6fff08625fe34f4fc33d0925bbc9
 sha256=2151ad18cb73f9a254f796dde2b48be7318b45410b59fedbb258db5a41044fb5
diff --git a/packages/fuse/sshfs-fuse_2.2.bb
b/packages/fuse/sshfs-fuse_2.2.bb
new file mode 100755
index 0000000..0ca2e13
--- /dev/null
+++ b/packages/fuse/sshfs-fuse_2.2.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "This is a filesystem client based on the SSH File Transfer
Protocol using FUSE."
+AUTHOR = "Miklos Szeredi <miklos@szeredi.hu>"
+HOMEPAGE = "http://fuse.sourceforge.net/sshfs.html"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "glib-2.0 fuse"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/${P}.tar.gz"
+S = "${WORKDIR}/${P}"
+
+inherit autotools
+
+FILES_${PN} += "${libdir}/sshnodelay.so"
-- 
1.6.0.5





