Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TN0wY-0008P6-2k
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Oct 2012 14:35:50 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so334200wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Oct 2012 05:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=o1RcovbirMlzdwvdoAAkhlTVhADbQBuBTGsSWr82/1E=;
	b=Ay4TfNEQm9wYPmJV6otvFtzDn8lvSTDx8HXvYeUwmCdpfD9ka1Ao0FxIiMZFwvXGs1
	aUKJMx1IkV7L8oskp4QM6GDkRUQq9LtsbFqbA46PddGaHQDpWb6GKUtSKzwllgNdRMNY
	1XvSUnXKkv+5fkXdAuAnLgYhk8iXrUOdbMK0POLeg8RtwbHzokGOENPE2gejoqAo8T5T
	Gp+t0Pm/5WPaZPA0P/a5ykoOR5xxkZxHSLMaJKJ18nQCKBtBPLJP8wfJS/BeBsTi4k2B
	ne0ecH1eJjOsxbFzL0gDEaH406zR4K5H/ATu7NqQ30HtrkuA2M/wOQ8m2MY2Rwx0DUIR
	jeTQ==
Received: by 10.216.195.159 with SMTP id p31mr3901610wen.139.1350130957291;
	Sat, 13 Oct 2012 05:22:37 -0700 (PDT)
Received: from localhost.localdomain (p4FDF056D.dip.t-dialin.net.
	[79.223.5.109])
	by mx.google.com with ESMTPS id m14sm2796659wie.8.2012.10.13.05.22.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 13 Oct 2012 05:22:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Oct 2012 14:31:32 +0200
Message-Id: <1350131492-742-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-gnome] gvfs: fix build
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
X-List-Received-Date: Sat, 13 Oct 2012 12:35:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was for build from scratch and latest heads:

| ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
| Rerun configure task after fixing this. The path was '/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gvfs-1.8.2-r7.0/gvfs-1.8.2'
| ERROR: Function failed: do_qa_configure

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
index 903a8ba..e86c93f 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 inherit gnome
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 SRC_URI[archive.md5sum] = "402f94b187b197b403d25c85caeb9562"
 SRC_URI[archive.sha256sum] = "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fdb66db665d684355ef89345"
@@ -14,6 +14,7 @@ EXTRA_OECONF = "--disable-samba \
                 --with-samba-includes=${STAGING_INCDIR} \
                 --with-samba-libs=${STAGING_LIBDIR} \
                 --with-archive-includes=${STAGING_INCDIR} \
+                --with-archive-libs=${STAGING_LIBDIR} \
                "
 
 FILES_${PN} += "${datadir}/dbus-1/services/*"
-- 
1.7.4.4



