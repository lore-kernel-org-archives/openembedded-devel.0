Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PUuFe-00055Y-Gd
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 05:55:06 +0100
Received: by pxi9 with SMTP id 9so1155274pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 20:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=SOFhgRdtCP6/gkzRcS0dpka2wKeUVoUp5wYdCcSw7ro=;
	b=Q7MVoGzVJmGLBqCTzeMt0q+jaX9uoxw7ecoLgXpw1vygu1lZs6GUt5DCbigfU4NCzi
	Go2rMiZmOYqU1QG84tlyZFavxRv/idfKnOeDcy+XbM3KqFTrXELSAjlWDSkPJE6JnrZr
	EIzBpUbWvUDCsT9jbZKb6R8ikJ+/k/UvBDhQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=fTWxOUyNq5v1K8PUF2bMYAOEnRjUop5QgbDFhDTHQFJjJ4fPCHrRR2QFPiC1gUsIKm
	JvqcMQ/ceEl/PQIeB50RMfP2mzUc/9cm2hOKups1HAHKog6e8q4WJ8T8wr/AJs/AHzOt
	g8ibIa6WJKrn2vtquRx9atN6RU10gRnQ3YlRA=
Received: by 10.142.239.21 with SMTP id m21mr4101391wfh.198.1292907296234;
	Mon, 20 Dec 2010 20:54:56 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm6927541wff.16.2010.12.20.20.54.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 20:54:55 -0800 (PST)
Message-ID: <4D103319.4080002@gmail.com>
Date: Tue, 21 Dec 2010 15:24:49 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] acl_2.2.49.bb: Fix build when DISTRO_FEATURES lacks largefile.
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
X-List-Received-Date: Tue, 21 Dec 2010 04:55:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/udev/acl-2.2.49/nolargefile.patch |   15 +++++++++++++++
 recipes/udev/acl_2.2.49.bb                |    9 +++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 recipes/udev/acl-2.2.49/nolargefile.patch

diff --git a/recipes/udev/acl-2.2.49/nolargefile.patch b/recipes/udev/acl-2.2.49/nolargefile.patch
new file mode 100644
index 0000000..272b97e
--- /dev/null
+++ b/recipes/udev/acl-2.2.49/nolargefile.patch
@@ -0,0 +1,15 @@
+--- acl-2.2.49/chacl/chacl.c.orig	2010-12-21 14:00:42.563984943 +1030
++++ acl-2.2.49/chacl/chacl.c	2010-12-21 14:01:15.614983219 +1030
+@@ -315,6 +315,12 @@
+ 	return(failed);
+ }
+ 
++#ifndef __USE_LARGEFILE64
++/* XXX: hack! */
++#define dirent64 dirent
++#define readdir64 readdir
++#endif
++
+ static int
+ walk_dir(acl_t acl, acl_t dacl, const char *fname)
+ {
diff --git a/recipes/udev/acl_2.2.49.bb b/recipes/udev/acl_2.2.49.bb
index 027a8c6..5a37c57 100644
--- a/recipes/udev/acl_2.2.49.bb
+++ b/recipes/udev/acl_2.2.49.bb
@@ -1,11 +1,12 @@
 DESCRIPTION = "Commands for Manipulating POSIX Access Control Lists"
 LICENSE = "GPLv2"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "attr"
 
-SRC_URI = "http://mirror.its.uidaho.edu/pub/savannah/acl/acl-${PV}.src.tar.gz"
+SRC_URI = "http://mirror.its.uidaho.edu/pub/savannah/acl/acl-${PV}.src.tar.gz \
+		file://nolargefile.patch"
 
 inherit autotools lib_package
 
@@ -21,6 +22,10 @@ do_configure_append() {
     echo "#define _(str) str" >> ${S}/include/config.h
 }
 
+do_configure_prepend() {
+    ${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/include/builddefs.in', d)}
+}
+
 do_install() {
     export PKG_BIN_DIR=${D}${bindir}
     export PKG_SBIN_DIR=${D}${sbindir}
-- 
1.7.1



