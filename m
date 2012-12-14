Received: from mx.mailsparr.se ([212.112.184.237])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <johan.hovold@lundinova.se>) id 1TjTNG-0002Vr-Jf
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 12:24:14 +0100
Received: from pi (unknown [92.33.14.100])
	by mx.mailsparr.se (Halon Mail Gateway) with ESMTPSA;
	Fri, 14 Dec 2012 11:54:24 +0100 (CET)
Received: from johan by pi with local (Exim 4.80.1) (envelope-from <johan@pi>)
	id 1TjSuL-0007tg-Tw; Fri, 14 Dec 2012 11:54:21 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 11:53:57 +0100
Message-Id: <1355482437-30298-1-git-send-email-johan.hovold@lundinova.se>
X-Mailer: git-send-email 1.8.0.2
Sender: <johan.hovold@lundinova.se>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] udev-173: fix file checksums
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
X-List-Received-Date: Fri, 14 Dec 2012 11:24:14 -0000

Commit 7895ab08270d9 ("udev-173: Fix SRC_URI to fetch bz2 archive")
changed to source file to bz2-compressed tarball but did not update the
checksums.

Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
---

Hi, 

the above mentioned commit breaks udev-173 builds. It also claims that the
gz-tarballs are no longer available, but yet they are still available from
kernel.org as well as my local mirror. Perhaps a revert is more appropriate?

Thanks,
Johan


 meta-oe/recipes-core/udev/udev_173.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index 576302c..02c5690 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -32,8 +32,8 @@ SRC_URI += " \
        file://cache \
 "
 
-SRC_URI[md5sum] = "2afd20ee1c790eac6d7abe0498ebb414"
-SRC_URI[sha256sum] = "0f753ad9c3022a074d1c052bcee9139581db825283771ac78c0be0d1de109d0c"
+SRC_URI[md5sum] = "91a88a359b60bbd074b024883cc0dbde"
+SRC_URI[sha256sum] = "70a18315a12f8fc1131f7da5b4dae3606988b69d5c08f96f443b84b8486caaaf"
 
 # Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
 
-- 
1.8.0.2



