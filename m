Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgjAW-00066x-7c
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:58:35 +0200
Received: by pxi16 with SMTP id 16so42820pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=XzKMN+LKUiIhytzypPPbHxiNAqgp0AQW+G3+py/P3Kg=;
	b=Hxq4e2UVUZMFjKLlbPhaqXM4O5qHOmRX4W6s0bgVd+xF4os98Rsao2J22WG34GyIvK
	IWNcffYIT+ZTfjy5rWQkPYYy52/17XyH82hC/YBX9/WrPWFo0xyY28KU1tfgVZcvTbID
	sRefkrsKOEq0GRBmB18VBFx+Rg/YCt0TBnD8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nqcvOPWOEtQQqrIvdWwyiw1zlVv6GIbA/2d6eE7m343Fe4pyBvpnxxNrNLC+VMT1lE
	LrG03d9uylAzwWZFvxra6m1ycFJNRS7tbJ9tQZdU+4QykuKFJZcMHD4ZAfhavI8o0qQk
	o5yuOvQ959xnayvBNfObBnQ0zNTPZtPCwQrns=
Received: by 10.142.13.15 with SMTP id 15mr8296105wfm.300.1280948298353;
	Wed, 04 Aug 2010 11:58:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm10876016wfl.1.2010.08.04.11.58.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 11:58:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 11:58:03 -0700
Message-Id: <1280948285-3458-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
References: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/7] device-mapper_1.02.28.bb: Get rid of legacy staging
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
X-List-Received-Date: Wed, 04 Aug 2010 18:58:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/device-mapper/device-mapper_1.02.28.bb |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/recipes/device-mapper/device-mapper_1.02.28.bb b/recipes/device-mapper/device-mapper_1.02.28.bb
index bd0cbb9..075d34b 100644
--- a/recipes/device-mapper/device-mapper_1.02.28.bb
+++ b/recipes/device-mapper/device-mapper_1.02.28.bb
@@ -4,13 +4,15 @@ that supports logical volume management. It is required by LVM2 and EVMS. \
 The original LVM (included in stock 2.4 kernels) does not use it."
 LICENSE = "GPL"
 
+PR = "r1"
+
 S = "${WORKDIR}/${PN}.${PV}"
 
 SRC_URI = "ftp://sources.redhat.com/pub/dm/device-mapper.${PV}.tgz \
        file://devmap-mknod-busybox.patch \
 	   file://remove_insanity.patch "
 
-inherit autotools_stage update-rc.d
+inherit autotools update-rc.d
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 # The install-script will fail without this.
@@ -27,14 +29,5 @@ do_install_append() {
 
 FILES_${PN}-dev += "${libdir}/ioctl/*.a"
 
-do_stage_append() {
-	install -d ${STAGING_LIBDIR}/pkgconfig/
-	for pc in ${S}/*/*.pc ; do
-		cp $pc ${STAGING_LIBDIR}/pkgconfig/
-		cp $pc ${STAGING_LIBDIR}/pkgconfig/$(echo $(basename $pc) | sed s:lib::g)
-	done
-}
-
-
 SRC_URI[md5sum] = "c9ae0776994a419f9e1ba842164bb626"
 SRC_URI[sha256sum] = "24c7887fe896325a6cdc86b8beeb0d9c2de8b1c4cb20f53c2dc8f90963fc39bf"
-- 
1.7.1



