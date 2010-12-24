Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PW2cR-0007Jc-PM
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 09:03:21 +0100
Received: by ewy28 with SMTP id 28so426051ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 00:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=sD8qnhH7RiMSaHpVFHAcUMzmj+w4WFTEuaorEikc3Z0=;
	b=ZZwybM9Y3KeOh7uoA5u+o43f1wOj6I59acGYBaI+ZQEm7Cr+Dcaz2qFHP7SPtXJLNC
	xMRptm1Psy7e2j8IYlJFStfvM28NOJbdHyNLxNY8XHqU7XSOrXMq1luupmhpnQMHINum
	nzCDeTTs5A69IdtuALgvffWo5NSHxvTjgqTJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sccESqzWPqaAz9JepqMyrEMFZs6iELBIFU5UIHUnXEpMsJuF8Pw/vvK+Kntwd4FarD
	JAZkzQoCQ9OGdfemAhrkHU09Ao5awTyhgUFbv4eEJoYoDplAC5SXWo/D6oZbY1bk6DRs
	33TZJ8LWmIMzdkwNRaJytyABn5reMKT4aow2I=
Received: by 10.14.17.193 with SMTP id j41mr4946239eej.38.1293177790349;
	Fri, 24 Dec 2010 00:03:10 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id u1sm6246966eeh.4.2010.12.24.00.03.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Dec 2010 00:03:09 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Dec 2010 09:03:01 +0100
Message-Id: <1293177781-29292-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1293177781-29292-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1293177781-29292-1-git-send-email-fransmeulenbroeks@gmail.com>
Subject: [PATCH 2/2] libsdl-image: moved task to do_configure_prepend changed rm into rm -f
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
X-List-Received-Date: Fri, 24 Dec 2010 08:03:21 -0000

- less tasks makes it slighly faster
- other recipes also do this in do_configure_prepend or do_configure
- rm -f avoid error of file dues not exist (e.g. because the task is ran twice)

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/libsdl/libsdl-image_1.2.10.bb |   18 ++++++++----------
 recipes/libsdl/libsdl-image_1.2.6.bb  |    8 +++-----
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/recipes/libsdl/libsdl-image_1.2.10.bb b/recipes/libsdl/libsdl-image_1.2.10.bb
index 98a4e83..7f7f5ee 100644
--- a/recipes/libsdl/libsdl-image_1.2.10.bb
+++ b/recipes/libsdl/libsdl-image_1.2.10.bb
@@ -7,18 +7,16 @@ DEPENDS += "tiff"
 # Disable the run-time loading of the libs and bring back the soname dependencies.
 EXTRA_OECONF += "--disable-jpg-shared --disable-png-shared -disable-tif-shared"
 
-do_unpackpost() {
+do_configure_prepend() {
 	# Removing this file fixes a libtool version mismatch.
-	rm acinclude/libtool.m4
-	rm acinclude/sdl.m4
-	rm acinclude/pkg.m4
-	rm acinclude/lt~obsolete.m4
-	rm acinclude/ltoptions.m4
-	rm acinclude/ltsugar.m4
-	rm acinclude/ltversion.m4
+	rm -f acinclude/libtool.m4
+	rm -f acinclude/sdl.m4
+	rm -f acinclude/pkg.m4
+	rm -f acinclude/lt~obsolete.m4
+	rm -f acinclude/ltoptions.m4
+	rm -f acinclude/ltsugar.m4
+	rm -f acinclude/ltversion.m4
 }
 
-addtask unpackpost after do_unpack before do_patch
-
 SRC_URI[md5sum] = "6c06584b31559e2b59f2b982d0d1f628"
 SRC_URI[sha256sum] = "75e05d1e95f6277b44797157d9e25a908ba8d08a393216ffb019b0d74de11876"
diff --git a/recipes/libsdl/libsdl-image_1.2.6.bb b/recipes/libsdl/libsdl-image_1.2.6.bb
index b014275..46d7924 100644
--- a/recipes/libsdl/libsdl-image_1.2.6.bb
+++ b/recipes/libsdl/libsdl-image_1.2.6.bb
@@ -4,13 +4,11 @@ PR = "${INC_PR}.1"
 
 DEPENDS += "tiff"
 
-do_unpackpost() {
+do_configure_prepend() {
 	# Removing this file fixes a libtool version mismatch.
-	rm acinclude/libtool.m4
-	rm acinclude/sdl.m4
+	rm -f acinclude/libtool.m4
+	rm -f acinclude/sdl.m4
 }
 
-addtask unpackpost after do_unpack before do_patch
-
 SRC_URI[md5sum] = "b866dc4f647517bdaf57f6ffdefd013e"
 SRC_URI[sha256sum] = "88fcb1dbf934af33163667a6677312065c7d0a7f01cd764e3374c4c19b386ec4"
-- 
1.7.1



