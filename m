Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PV2v1-000303-Bo
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 15:10:23 +0100
Received: by fxm11 with SMTP id 11so3837207fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 06:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=f20sQ23/a8fMMC9xe+o6ChXKItXLwGUAqXNKzSYhGpI=;
	b=OPSb6zf/m6pKLi8OjuIbyepbMb1e9+ntAwCdeiKtfeNf2wI0MGNrQ25bwSbo8GHGME
	HFfrshru9TJs4gdmgmWTT6eXoxxBclSqMN4s+LuILC72zNODBZSjqlX5tf98ELHBW3y/
	ow8zwm/b9H/GRKYyIBc0QeygnlndaAMeN48I4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bpciGaIf1xgvO7R+XFyhnvC3cIWrWxfWr+7kdrjvC9csysRkZxTKsCuDBRxK6/MyCM
	wa1luXPpBnAJYKg5DtvhkQWQq/6u28iFqsSmtm9Eeu3Hvi88olfui17gOZZcoR6SriJT
	cYij2rQwfmBV6pqjcO0oxhO8BEmbzba8EyMLg=
Received: by 10.223.125.196 with SMTP id z4mr1639681far.124.1292940616699;
	Tue, 21 Dec 2010 06:10:16 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm1327406fax.31.2010.12.21.06.10.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 06:10:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 15:09:53 +0100
Message-Id: <1292940593-22743-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <20101221133550.GI3282@jama>
References: <20101221133550.GI3282@jama>
Subject: [PATCH 2/2] samba: use external talloc instead of building own
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
X-List-Received-Date: Tue, 21 Dec 2010 14:10:23 -0000

* libtalloc now conflicts with libtalloc from talloc recipe
* tested only with samba-3.2.15
---
 recipes/samba/samba.inc       |    3 ++-
 recipes/samba/samba_3.2.15.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/samba/samba.inc b/recipes/samba/samba.inc
index a95106d..e5fa06e 100644
--- a/recipes/samba/samba.inc
+++ b/recipes/samba/samba.inc
@@ -1,6 +1,6 @@
 SECTION = "console/network"
 LICENSE = "GPL"
-DEPENDS = "readline virtual/libiconv"
+DEPENDS = "readline virtual/libiconv talloc"
 
 SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
            file://volatiles.03_samba \
@@ -37,6 +37,7 @@ EXTRA_OECONF='--disable-cups \
               --with-mandir=${mandir} \
               --with-swatdir=${datadir}/swat \
               --with-aio-support \
+              --without-libtalloc \
               samba_cv_struct_timespec=yes \
               libreplace_cv_HAVE_MMAP=${SAMBAMMAP}'
 
diff --git a/recipes/samba/samba_3.2.15.bb b/recipes/samba/samba_3.2.15.bb
index 3f535b6..ef2707e 100644
--- a/recipes/samba/samba_3.2.15.bb
+++ b/recipes/samba/samba_3.2.15.bb
@@ -9,7 +9,7 @@ SRC_URI += "file://configure-3.2.8.patch \
 SRC_URI[md5sum] = "5a3bcc4927c9643b9f42970d0815b18f"
 SRC_URI[sha256sum] = "84281fd1faeffee8558e49dff865dd382abbf78bc1be00f8cb5aa70aeea67d46"
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF += "\
 	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
-- 
1.7.3.4



