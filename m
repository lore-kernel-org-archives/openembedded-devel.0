Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Omho1-0001nF-5M
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 08:43:54 +0200
Received: by ewy7 with SMTP id 7so2662493ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 23:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=tVU+0Q3PN9SKHtP5JLea/GXJmeEUdQY4YPvIX+lnbiA=;
	b=rpydTCtd5wvcJ6wUfl3BJDP8/tEsI7JpNYwnQ9sPC3iZDIkjrAev2eF2+scQKsoC0J
	x/hwZUI1mtK+aKCMFThY1QaA8TpLH1CnvO50tlv6ZYOFNy4JaRgkIAv4QB/GDkQ9iyfl
	wTVrngXsXDGs45jjmgNZqCARtklJ/dD3+Rgik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=O9zDOV+DCY6GPrbzlHSoGL/hu2AwAsbZ2ucIlHCD2jo6Y6KPaKaebGm0MhGpOXrvjX
	V1DQ+Ev+aYP56kAUwnNT7JdMQLa9SH9CAU4lABpzpuoLGfBfF1MMcy4pxX7UlS1wRh20
	zeXrHbJqrxNx7EPIbPwe2kX/4uGAII13fKWFM=
Received: by 10.213.35.1 with SMTP id n1mr2245129ebd.84.1282373013079;
	Fri, 20 Aug 2010 23:43:33 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id u9sm6266489eeh.17.2010.08.20.23.43.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Aug 2010 23:43:32 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Aug 2010 08:43:25 +0200
Message-Id: <1282373005-16453-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] make: BBCLASSEXTEND = "native"; remove native recipe
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
X-List-Received-Date: Sat, 21 Aug 2010 06:43:54 -0000

This also gets rid of the legacy staging in the native recipe

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

Despite the change being minimal:
As this recipe is crucial for our build process I would like to 
have a review on this.

 recipes/make/make-native_3.81.bb |   14 --------------
 recipes/make/make_3.81.bb        |    4 +++-
 2 files changed, 3 insertions(+), 15 deletions(-)
 delete mode 100644 recipes/make/make-native_3.81.bb

diff --git a/recipes/make/make-native_3.81.bb b/recipes/make/make-native_3.81.bb
deleted file mode 100644
index 509558c..0000000
--- a/recipes/make/make-native_3.81.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-PR = "r0"
-
-S = "${WORKDIR}/make-${PV}"
-
-inherit native
-
-do_stage() {
-        install -d ${STAGING_BINDIR}
-        install -m 755 make ${STAGING_BINDIR}
-}
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/make-${PV}"
-
-require make_${PV}.bb
diff --git a/recipes/make/make_3.81.bb b/recipes/make/make_3.81.bb
index b399255..f0bd382 100644
--- a/recipes/make/make_3.81.bb
+++ b/recipes/make/make_3.81.bb
@@ -1,6 +1,8 @@
-PR = "r0"
+PR = "r1"
 
 require make.inc
 
+BBCLASSEXTEND = "native"
+
 SRC_URI[md5sum] = "354853e0b2da90c527e35aabb8d6f1e6"
 SRC_URI[sha256sum] = "f3e69023771e23908f5d5592954d8271d3d6af09693cecfd29cee6fde8550dc8"
-- 
1.6.4.2



