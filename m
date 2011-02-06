Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PmAyu-000823-Th
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 21:13:12 +0100
Received: by wyb40 with SMTP id 40so3865556wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 12:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=a4QnxcKlD9glENFyBvBGU+p2TgmvZLxngt+Ikhsff6g=;
	b=dDrA1xtSfdU89Qqd6LR+8+vDWy2kgoJAj8DZYPbqCL2wTiAobuH+f1cvofmYMqAgTP
	GHuMqGoE5FaxMdAwLd8IfCEXVltbM4mk9qE7UWzRMm2X2i2R9jIDGwjB8vRKrwPfSwdZ
	DN6ju9d6/VuiKUVazPVVgGpLxRh1CxhoquGLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=Rnr2N2yoTob3IjcDJACheApTBKwMhuFh60PuejjfEmnYAQghAlCyyQU6iLbeanEJWk
	01pxP8h4ntquRLRuJ8VKKbx0qis61/LgCRpmCuXh9nERb3OlL1JO7M2uBpBtzidHWSXF
	MNK17acI1rjwq6UZZ/GYOp1vqjfvJwyFz67s4=
Received: by 10.216.186.196 with SMTP id w46mr1576328wem.51.1297023132717;
	Sun, 06 Feb 2011 12:12:12 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id o19sm1755660wee.26.2011.02.06.12.12.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 12:12:12 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Feb 2011 21:12:05 +0100
Message-Id: <1297023125-19762-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] rootfs_deb.bbclass: fix alternatives handling
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
X-List-Received-Date: Sun, 06 Feb 2011 20:13:13 -0000

After fixing update-alternatives-native the command:
   rmdir ${IMAGE_ROOTFS}/var/dpkg/alternatives

fails, because the directory is not empty, and the command:
  ln -s ${libdir}/opkg/alternatives ${IMAGE_ROOTFS}/var/dpkg/alternatives

creates a dangling symlink, because we mkdir only the parent directory of
the target.

Fixes: mkdir -p the alternatives directory itself and move alternatives
definitions into it before rmdiring the original alternatives directory

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/rootfs_deb.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/rootfs_deb.bbclass b/classes/rootfs_deb.bbclass
index 59072aa..6a87c7d 100644
--- a/classes/rootfs_deb.bbclass
+++ b/classes/rootfs_deb.bbclass
@@ -123,8 +123,9 @@ fakeroot rootfs_deb_do_rootfs () {
 	set -e
 
 	# Hacks to allow opkg's update-alternatives and opkg to coexist for now
-	mkdir -p ${IMAGE_ROOTFS}${libdir}/opkg
+	mkdir -p ${IMAGE_ROOTFS}${libdir}/opkg/alternatives
 	if [ -e ${IMAGE_ROOTFS}/var/dpkg/alternatives ]; then
+		mv ${IMAGE_ROOTFS}/var/dpkg/alternatives/* ${IMAGE_ROOTFS}${libdir}/opkg/alternatives/
 		rmdir ${IMAGE_ROOTFS}/var/dpkg/alternatives
 	fi
 	ln -s ${libdir}/opkg/alternatives ${IMAGE_ROOTFS}/var/dpkg/alternatives
-- 
1.7.1



