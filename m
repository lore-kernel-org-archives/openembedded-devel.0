Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q5Nld-0007v0-GY
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 21:42:53 +0200
Received: by eye27 with SMTP id 27so813441eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=baZZRAZLy3yo4LzOTdEQBQRksxF5ScqXIc/ic7yYUXY=;
	b=trNNTAUNqc01dATzFcu6GYIzqOsMxRHivvZjAGGXMJcX/sCriTieYwS9mWPwipbFRW
	ptJm22S5ZHHSyt9A0W4p1/xoE4PNg4yElHQVGAz3b6F4G4ZpLvMBkMisv7AmlV5yVqBY
	dQl/sKefd1qtZCc6ZhTUo8hh3UhJs07PbIeSs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xdHqPRUvkw9sZTwvC5C82o4OiDtIxMDvuCg8b3ArKA6DXIbwqbo6IBfhaBwU6WTj1s
	EjHxd2EdGIiXTF4SrWTa7RQ8s1FTB03/t0+a7cnP9vj18qwkw+141FT1EKy5OE3OYQwW
	wE2WGNEeyb+8jmVJH70NEUGXaT5O9KkYo7+wE=
Received: by 10.213.33.143 with SMTP id h15mr725990ebd.22.1301600450148;
	Thu, 31 Mar 2011 12:40:50 -0700 (PDT)
Received: from localhost.localdomain (a83-245-252-47.elisa-laajakaista.fi
	[83.245.252.47])
	by mx.google.com with ESMTPS id q53sm934713eeh.4.2011.03.31.12.40.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 12:40:49 -0700 (PDT)
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 22:39:59 +0300
Message-Id: <1301600399-32041-1-git-send-email-philippedeswert@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH [1/2]] eio: New recipe for eio
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
X-List-Received-Date: Thu, 31 Mar 2011 19:42:53 -0000

Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
---
 recipes/efl1/eio.inc    |   11 +++++++++++
 recipes/efl1/eio_svn.bb |   13 +++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/efl1/eio.inc
 create mode 100644 recipes/efl1/eio_svn.bb

diff --git a/recipes/efl1/eio.inc b/recipes/efl1/eio.inc
new file mode 100644
index 0000000..396b455
--- /dev/null
+++ b/recipes/efl1/eio.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "Enlightenment Input Output Library"
+LICENSE = "MIT BSD"
+DEPENDS = "ecore eina"
+
+inherit efl
+
+BBCLASSEXTEND = "native"
+INC_PR = "r0"
+
+# Some upgrade path tweaking
+AUTO_LIBNAME_PKGS = ""
diff --git a/recipes/efl1/eio_svn.bb b/recipes/efl1/eio_svn.bb
new file mode 100644
index 0000000..6a12dcf
--- /dev/null
+++ b/recipes/efl1/eio_svn.bb
@@ -0,0 +1,13 @@
+require eio.inc
+
+SRCREV = "${EFL_SRCREV}"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=403f20cf42c847686ac2956f14bfa30f"
+
+SRC_URI = "\
+  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+"
+S = "${WORKDIR}/${SRCNAME}"
-- 
1.7.2.5



