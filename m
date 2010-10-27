Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PB1lu-0000Z0-KW
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 10:54:15 +0200
Received: by bwz10 with SMTP id 10so325807bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 01:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Y4qVu1gs2ENbM4uKIcAWwRhK89FzSzyYxE7XN3k99jU=;
	b=S0gOdwovCdXHWO1IPluyq8pa62w0VDeoFF/JOdMyfTy1nsVxelF4xdiM2NlM/lIaQr
	iy27CugpGRZfTaRKdPbHv5EMuzM3ihadU9YmXh6lDX+ASrDnMnOqq3FrZbn5GXIyXSQa
	d+wS0dC6oQT/qNFisFT34E9Lsv3VCh9xUGQMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GYJy2EnZ0KLnYdr0iXMNqBETwGCin7WE8SnE/HL0Mg2ASnTooLPGaeDh8+P0RJSdiq
	b84DCcKs26N95sJmdxrvKsIO2qu6wdDD+IcZUL/WYNuMHOUYLrwaBlWFjDbTa2TeOYzt
	sCZY5FnKz4bk7lVoTl/LYvdgQxIf6tgAfqLF0=
Received: by 10.204.102.78 with SMTP id f14mr457218bko.30.1288169607147;
	Wed, 27 Oct 2010 01:53:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a25sm6754177bks.20.2010.10.27.01.53.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Oct 2010 01:53:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Oct 2010 10:53:25 +0200
Message-Id: <1288169605-11133-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC][PATCH] base-files: add empty /etc/profile.d which can be filled by distro/machine profile scripts
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
X-List-Received-Date: Wed, 27 Oct 2010 08:54:15 -0000

* used for gtk_im_module.sh in SHR
* would be better to be able to fill it from more sources (maybe put profile.d.machine, profile.d.distro, profile.d directories
  and install all files to target profile.d), is it worth it?
* /etc/profile.d/empty is used to prevent install call not failing because /profile.d/* not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../base-files/shr/profile.d/gtk_im_module.sh      |    1 +
 recipes/base-files/base-files_3.0.14.bb            |    3 +++
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 recipes/base-files/base-files/profile.d/empty
 create mode 100755 recipes/base-files/base-files/shr/profile.d/gtk_im_module.sh

diff --git a/recipes/base-files/base-files/profile.d/empty b/recipes/base-files/base-files/profile.d/empty
new file mode 100644
index 0000000..e69de29
diff --git a/recipes/base-files/base-files/shr/profile.d/gtk_im_module.sh b/recipes/base-files/base-files/shr/profile.d/gtk_im_module.sh
new file mode 100755
index 0000000..29cf0db
--- /dev/null
+++ b/recipes/base-files/base-files/shr/profile.d/gtk_im_module.sh
@@ -0,0 +1 @@
+export GTK_IM_MODULE=xim
diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index f8d0778..3ebed70 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
            file://inputrc \
            file://host.conf \
            file://profile \
+           file://profile.d \
            file://fstab \
            file://filesystems \
            file://issue.net \
@@ -116,6 +117,8 @@ do_install () {
         	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
         	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
         	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
+        	install -d 0755 ${D}${sysconfdir}/profile.d
+        	install -m 0755 ${WORKDIR}/profile.d/* ${D}${sysconfdir}/profile.d/
         	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
         	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
         	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
-- 
1.7.3.1



